Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16C5F2275
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Nov 2019 00:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfKFXTi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Nov 2019 18:19:38 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:39721 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfKFXTi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Nov 2019 18:19:38 -0500
X-Originating-IP: 92.184.100.196
Received: from localhost (unknown [92.184.100.196])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9FD0660002;
        Wed,  6 Nov 2019 23:19:26 +0000 (UTC)
Date:   Thu, 7 Nov 2019 00:19:23 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Steve Muckle <smuckle@google.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH] rtc: class: support hctosys from modular RTC drivers
Message-ID: <20191106231923.GK8309@piout.net>
References: <20191106194625.116692-1-smuckle@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106194625.116692-1-smuckle@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 06/11/2019 11:46:25-0800, Steve Muckle wrote:
> Due to distribution constraints it may not be possible to statically
> compile the required RTC driver into the kernel.
> 
> Expand RTC_HCTOSYS support to cover all RTC devices (statically compiled
> or not) by checking at the end of RTC device registration whether the
> time should be synced.
> 

This does not really help distributions because most of them will still
have "rtc0" hardcoded and rtc0 is often the rtc that shouldn't be used.

Can't you move away from HCTOSYS and do the correct thing in userspace
instead of the crap hctosys is doing?

> Signed-off-by: Steve Muckle <smuckle@google.com>
> ---
>  drivers/rtc/Kconfig   | 18 ++++++-----
>  drivers/rtc/Makefile  |  1 -
>  drivers/rtc/class.c   | 63 +++++++++++++++++++++++++++++++++++++++
>  drivers/rtc/hctosys.c | 69 -------------------------------------------
>  4 files changed, 73 insertions(+), 78 deletions(-)
>  delete mode 100644 drivers/rtc/hctosys.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 1adf9f815652..f663d77deb41 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -35,14 +35,16 @@ config RTC_HCTOSYS_DEVICE
>  	depends on RTC_HCTOSYS
>  	default "rtc0"
>  	help
> -	  The RTC device that will be used to (re)initialize the system
> -	  clock, usually rtc0. Initialization is done when the system
> -	  starts up, and when it resumes from a low power state. This
> -	  device should record time in UTC, since the kernel won't do
> -	  timezone correction.
> -
> -	  The driver for this RTC device must be loaded before late_initcall
> -	  functions run, so it must usually be statically linked.
> +	  The RTC device that will be used to (re)initialize the system clock,
> +	  usually rtc0. Initialization is done when the driver for the RTC
> +	  device registers, and when it resumes from a low power state. This
> +	  device should record time in UTC, since the kernel won't do timezone
> +	  correction.
> +
> +	  During startup it is useful to initialize the system clock from the
> +	  RTC as early as possible. For this reason the driver for this RTC
> +	  device should be statically linked, or alternately, the kernel module
> +	  for the RTC device driver loaded immediately.
>  
>  	  This clock should be battery-backed, so that it reads the correct
>  	  time when the system boots from a power-off state. Otherwise, your
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 4ac8f19fb631..33f932d08262 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -6,7 +6,6 @@
>  ccflags-$(CONFIG_RTC_DEBUG)	:= -DDEBUG
>  
>  obj-$(CONFIG_RTC_LIB)		+= lib.o
> -obj-$(CONFIG_RTC_HCTOSYS)	+= hctosys.o
>  obj-$(CONFIG_RTC_SYSTOHC)	+= systohc.o
>  obj-$(CONFIG_RTC_CLASS)		+= rtc-core.o
>  obj-$(CONFIG_RTC_MC146818_LIB)	+= rtc-mc146818-lib.o
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index 9458e6d6686a..b1ed5f3be223 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -34,6 +34,64 @@ static void rtc_device_release(struct device *dev)
>  #ifdef CONFIG_RTC_HCTOSYS_DEVICE
>  /* Result of the last RTC to system clock attempt. */
>  int rtc_hctosys_ret = -ENODEV;
> +
> +/* IMPORTANT: the RTC only stores whole seconds. It is arbitrary
> + * whether it stores the most close value or the value with partial
> + * seconds truncated. However, it is important that we use it to store
> + * the truncated value. This is because otherwise it is necessary,
> + * in an rtc sync function, to read both xtime.tv_sec and
> + * xtime.tv_nsec. On some processors (i.e. ARM), an atomic read
> + * of >32bits is not possible. So storing the most close value would
> + * slow down the sync API. So here we have the truncated value and
> + * the best guess is to add 0.5s.
> + */
> +
> +static int rtc_hctosys(void)
> +{
> +	int err = -ENODEV;
> +	struct rtc_time tm;
> +	struct timespec64 tv64 = {
> +		.tv_nsec = NSEC_PER_SEC >> 1,
> +	};
> +	struct rtc_device *rtc = rtc_class_open(CONFIG_RTC_HCTOSYS_DEVICE);
> +
> +	if (!rtc) {
> +		pr_info("unable to open rtc device (%s)\n",
> +			CONFIG_RTC_HCTOSYS_DEVICE);
> +		goto err_open;
> +	}
> +
> +	err = rtc_read_time(rtc, &tm);
> +	if (err) {
> +		dev_err(rtc->dev.parent,
> +			"hctosys: unable to read the hardware clock\n");
> +		goto err_read;
> +	}
> +
> +	tv64.tv_sec = rtc_tm_to_time64(&tm);
> +
> +#if BITS_PER_LONG == 32
> +	if (tv64.tv_sec > INT_MAX) {
> +		err = -ERANGE;
> +		goto err_read;
> +	}
> +#endif
> +
> +	err = do_settimeofday64(&tv64);
> +
> +	dev_info(rtc->dev.parent, "setting system clock to %ptR UTC (%lld)\n",
> +		 &tm, (long long)tv64.tv_sec);
> +
> +err_read:
> +	rtc_class_close(rtc);
> +
> +err_open:
> +	rtc_hctosys_ret = err;
> +
> +	return err;
> +}
> +
> +
>  #endif
>  
>  #if defined(CONFIG_PM_SLEEP) && defined(CONFIG_RTC_HCTOSYS_DEVICE)
> @@ -375,6 +433,11 @@ int __rtc_register_device(struct module *owner, struct rtc_device *rtc)
>  	dev_info(rtc->dev.parent, "registered as %s\n",
>  		 dev_name(&rtc->dev));
>  
> +#ifdef CONFIG_RTC_HCTOSYS_DEVICE
> +	if (!strcmp(dev_name(&rtc->dev), CONFIG_RTC_HCTOSYS_DEVICE))
> +		rtc_hctosys();
> +#endif
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(__rtc_register_device);
> diff --git a/drivers/rtc/hctosys.c b/drivers/rtc/hctosys.c
> deleted file mode 100644
> index a74d0d890600..000000000000
> --- a/drivers/rtc/hctosys.c
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * RTC subsystem, initialize system time on startup
> - *
> - * Copyright (C) 2005 Tower Technologies
> - * Author: Alessandro Zummo <a.zummo@towertech.it>
> - */
> -
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
> -#include <linux/rtc.h>
> -
> -/* IMPORTANT: the RTC only stores whole seconds. It is arbitrary
> - * whether it stores the most close value or the value with partial
> - * seconds truncated. However, it is important that we use it to store
> - * the truncated value. This is because otherwise it is necessary,
> - * in an rtc sync function, to read both xtime.tv_sec and
> - * xtime.tv_nsec. On some processors (i.e. ARM), an atomic read
> - * of >32bits is not possible. So storing the most close value would
> - * slow down the sync API. So here we have the truncated value and
> - * the best guess is to add 0.5s.
> - */
> -
> -static int __init rtc_hctosys(void)
> -{
> -	int err = -ENODEV;
> -	struct rtc_time tm;
> -	struct timespec64 tv64 = {
> -		.tv_nsec = NSEC_PER_SEC >> 1,
> -	};
> -	struct rtc_device *rtc = rtc_class_open(CONFIG_RTC_HCTOSYS_DEVICE);
> -
> -	if (!rtc) {
> -		pr_info("unable to open rtc device (%s)\n",
> -			CONFIG_RTC_HCTOSYS_DEVICE);
> -		goto err_open;
> -	}
> -
> -	err = rtc_read_time(rtc, &tm);
> -	if (err) {
> -		dev_err(rtc->dev.parent,
> -			"hctosys: unable to read the hardware clock\n");
> -		goto err_read;
> -	}
> -
> -	tv64.tv_sec = rtc_tm_to_time64(&tm);
> -
> -#if BITS_PER_LONG == 32
> -	if (tv64.tv_sec > INT_MAX) {
> -		err = -ERANGE;
> -		goto err_read;
> -	}
> -#endif
> -
> -	err = do_settimeofday64(&tv64);
> -
> -	dev_info(rtc->dev.parent, "setting system clock to %ptR UTC (%lld)\n",
> -		 &tm, (long long)tv64.tv_sec);
> -
> -err_read:
> -	rtc_class_close(rtc);
> -
> -err_open:
> -	rtc_hctosys_ret = err;
> -
> -	return err;
> -}
> -
> -late_initcall(rtc_hctosys);
> -- 
> 2.24.0.rc1.363.gb1bccd3e3d-goog
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

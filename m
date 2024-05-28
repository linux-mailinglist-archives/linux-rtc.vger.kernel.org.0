Return-Path: <linux-rtc+bounces-1214-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1B8D14DA
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 09:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37550B21BDA
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D424D13F;
	Tue, 28 May 2024 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMJcVxJx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A9D45024
	for <linux-rtc@vger.kernel.org>; Tue, 28 May 2024 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716879882; cv=none; b=KZNxfYW9BYeyapko+FecV1YVAi4Qwv7pBJ+Urh/eNsQpwRNYJ4WsnZ+sdM3Skq6U2MZxJa/V4d9njKjnKfJRbEyZDoodbSzgGUXKnbnrgz4VBkDxOf3G05cC6C/akbDFbygQ+JErWzKkDVaLABXmK9I5TyaBe6tS2Amy+ZhmY0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716879882; c=relaxed/simple;
	bh=QioyUsuQOmMyGD1MjglYNSgYRHbIaqnrC96Fl2CKBk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAGJQYZv39OTH3c+6N2H3vHUmLB5Flqn/i7u/eu+/AR1d5Z65BwDEral8Yz+15Qe/WzeSgEDYy6fWXd5JYBa/RKvvtSJ0cqBxomuC9Hh64+mokfvZBydJx923cI0gakcnIu0l31rcuw3IvedhAOe1UkblZEmLr9q+6+NBRklbPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMJcVxJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9F5C3277B;
	Tue, 28 May 2024 07:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716879882;
	bh=QioyUsuQOmMyGD1MjglYNSgYRHbIaqnrC96Fl2CKBk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lMJcVxJxnXiFGgoXa75m/TP1zgDEzqkyIgE+C3ayne8mR1mUV84e0mtm7DSLQlgHy
	 lddmM7Onk2BiHOUuUdso2Z12Ef91+GC26DiQQIdYFKEllzwqfKJA7VqsROw8O2zlfu
	 8sH5lWMOUAr97dk7jUGWTo+qQinW7d4NGYznHETDYhZ/j1RctPNU7TW0d3XI6gIEEt
	 83DfLURdjfTAKJ7Wdw6t8F6g6ave8EsRLvXMT1Bh/JzH+oDVrqZazRtv3Yzgg8HM0c
	 6agyDc7jnqTGF047t9i5YNhMukvllGL/4OoKQ7Vzxay3Jrnftsr1RUv4ioZKygL4YX
	 sEXVHYS7KYY8A==
Message-ID: <214af50c-56b0-4b68-bcaa-c186cae1e18f@kernel.org>
Date: Tue, 28 May 2024 09:04:38 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] rtc: atcrtc100: The first release of the atcrtc100
 driver
To: CL Wang <cl634@andestech.com>, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <20240521133728.3692318-1-cl634@andestech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240521133728.3692318-1-cl634@andestech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2024 15:37, CL Wang wrote:
> The following features are included in this driver.
> 1. Basic Function of the RTC.
> 
> 2. The Andes internal implementation of the RTC on FPGA cannot count more
>    than 32 days because the day counter is 5 bits long, so use a variable
>    to hold the date in the situation where the size of the day is
>    insufficient to represent the date.
> 
> 3. The maximum day counter available for the ATCRTC100 hardware is 15
>    bits long and can count up to 32767 days. This means that the ATCRTC100
>    hardware can count up to about 89 years, so we set range_min to 2000
>    and range_max to the end of the year 2089.
> 
> Signed-off-by: CL Wang <cl634@andestech.com>
> ---
>  drivers/rtc/Kconfig         |  10 +
>  drivers/rtc/Makefile        |   1 +
>  drivers/rtc/rtc-atcrtc100.c | 463 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 474 insertions(+)
>  create mode 100644 drivers/rtc/rtc-atcrtc100.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2a95b05982ad..cea1750c368d 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1442,6 +1442,16 @@ config RTC_DRV_OMAP
>  	  This driver can also be built as a module, if so, module
>  	  will be called rtc-omap.
>  
> +config RTC_DRV_ATCRTC100
> +	tristate "Andes Real Time Clock"
> +	depends on RISCV
> +	help
> +	  If you say Y here you will get access to the real time clock
> +	  built into your AE350.
> +
> +	  To compile this driver as a module, choose M here.
> +	  The module will be called rtc-atcrtc100.
> +
>  config RTC_DRV_S3C
>  	tristate "Samsung S3C series SoC RTC"
>  	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S5PV210 || \
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 3004e372f25f..cc41cd5d3017 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_RTC_DRV_ASM9260)	+= rtc-asm9260.o
>  obj-$(CONFIG_RTC_DRV_ASPEED)	+= rtc-aspeed.o
>  obj-$(CONFIG_RTC_DRV_AT91RM9200)+= rtc-at91rm9200.o
>  obj-$(CONFIG_RTC_DRV_AT91SAM9)	+= rtc-at91sam9.o
> +obj-$(CONFIG_RTC_DRV_ATCRTC100) += rtc-atcrtc100.o
>  obj-$(CONFIG_RTC_DRV_AU1XXX)	+= rtc-au1xxx.o
>  obj-$(CONFIG_RTC_DRV_BBNSM)	+= rtc-nxp-bbnsm.o
>  obj-$(CONFIG_RTC_DRV_BD70528)	+= rtc-bd70528.o
> diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
> new file mode 100644
> index 000000000000..505caf04e948
> --- /dev/null
> +++ b/drivers/rtc/rtc-atcrtc100.c
> @@ -0,0 +1,463 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2008-2024 Andes Technology Corporation
> + * Andes RTC Support
> + *
> + * Copyright (C) 2006, 2007, 2008  Paul Mundt

I can see that... you need to fix and improve the driver to look like
something recent. Start from scratch and take the newest driver as template.

> +	RTC_WRITE32(RTC_READ32(RTC_CR) | RTC_EN, RTC_CR);
> +
> +	return 0;
> +
> +err_unmap:
> +	iounmap(rtc->regbase);
> +err_ioremap1:
> +	release_resource(rtc->res);
> +err_request_region:
> +	free_irq(rtc->interrupt_irq, rtc);
> +err_interrupt_irq:
> +	free_irq(rtc->alarm_irq, rtc);
> +err_exit:

Why you do not use devm?

> +	return ret;
> +}
> +

You miss bindings patch.

> +static int atc_rtc_remove(struct platform_device *pdev)
> +{
> +	struct atc_rtc *rtc = platform_get_drvdata(pdev);
> +
> +	/*
> +	 * Because generic rtc will not execute rtc_device_release()
> +	 * when call rtc_device_unregister(),
> +	 * rtc id will increase when unloading a rtc driver.
> +	 * This can work around to recycle rtc id.
> +	 * But if kernel fix this issue, it shell be removed away.
> +	 */

No, that's just confusing... and does not look correct. Anyway, fix the
bug in the kernel (if there is such...) instead of introducing weird
workarounds.

> +	rtc->rtc_dev->dev.release(&rtc->rtc_dev->dev);
> +	RTC_WRITE32(RTC_READ32(RTC_CR) & ~(RTC_EN | SEC_INT | ALARM_INT), RTC_CR);
> +	free_irq(rtc->alarm_irq, rtc);
> +	free_irq(rtc->interrupt_irq, rtc);
> +	iounmap(rtc->regbase);
> +	release_resource(rtc->res);
> +	platform_set_drvdata(pdev, NULL);
> +	return 0;
> +}


> +module_platform_driver(atc_rtc_platform_driver);
> +MODULE_DESCRIPTION("Andes ATCRTC100 driver");
> +MODULE_AUTHOR("Paul Mundt <lethal@linux-sh.org>, Jamie Lenehan <lenehan@twibble.org>, Angelo Castello <angelo.castello@st.com>, Nick Hu <nickhu@andestech.com>, CL Wang <cl634@andestech.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.



Best regards,
Krzysztof



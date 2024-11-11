Return-Path: <linux-rtc+bounces-2522-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 187949C4913
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 23:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2F21F227B1
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 22:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E46D1AA7AF;
	Mon, 11 Nov 2024 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fW3XZcZb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DE16F0CA;
	Mon, 11 Nov 2024 22:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731364221; cv=none; b=VNswUz9dYpOseWRFdny4mzm1zuJixvHH8zzKLUCgQQGEFEbedSX12NO6FvKjErzinxTJtf306GNXyz3WU6z1hQzyjF8ftMvS+Xl0BCrek3maCCgcqTyoPIBs4utVqE5kUU3eypPG23R0ne6dkqFnnS7Hg4KurKRvX4wzoZJKLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731364221; c=relaxed/simple;
	bh=CM8XQ0Jgmzgc+uLQawDkLj7pdrOWXKpniHz0ha1FMOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pa1CltLxLnO4uGzC2nal7wzyeJ00GBLT9H7tKs6VreRUTJfOiQQsevg/6a2/GTXKNp3H749k9lX8qfNEvjwvK1GsX1G3Aot/1oRI8IFHLEeM9JWeJ9pwWcvaNAKSFKwalavNgxCjSdzWsmCosHKnar3WInTiwZYQRhTm8B513m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fW3XZcZb; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5382E0004;
	Mon, 11 Nov 2024 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731364210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=APy0WGEYFp6w6RrjGWTgE2QBXeXcSVXns13LQnFBJug=;
	b=fW3XZcZbLlhMzWC6nhQ55ieIrybYrM9ag6g4ISILzDkyMXV73bqXsjdlf1TNFKCW2IGwr6
	Yhy7qW6OY3Iy6T91QTJ0ePAWpWKs8C0xH86INdFX4VbKQTyvunXOPlKZ4swOvAC164DwFB
	DR+mbTKfc1czA2eWo0ztJg3t9mJ+hLG3JxpILc1zP/ojfQKxJz0NOJRp/EwkbLsbJ9A4y3
	n6R0BVkHp/Amj9TSsfD4xVNMYPU40MgjNEswwLqC+omrQQ90tmlO+uhiZCbKRBotQ9KFIa
	aVjdQe2rgWSYK2aTxeyW1IoaXtyuSkEVwGZuhIQS5rMCt79HzSGTLIp7heso7A==
Date: Mon, 11 Nov 2024 23:30:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Karel Balej <balejk@matfyz.cz>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, duje.mihanovic@skole.hr,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [RFC PATCH v2 2/2] rtc: add driver for Marvell 88PM886 PMIC RTC
Message-ID: <20241111223007bd126e5c@mail.local>
References: <20241012193345.18594-1-balejk@matfyz.cz>
 <20241012193345.18594-2-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012193345.18594-2-balejk@matfyz.cz>
X-GND-Sasl: alexandre.belloni@bootlin.com

Lee,

I'm happy taking this patch, I guess you are going to take 1/2 ?

On 12/10/2024 21:31:39+0200, Karel Balej wrote:
> RTC lives on the chip's base register page. Add the relevant register
> definitions and implement a basic set/read time functionality. Tested
> with the samsung,coreprimevelte smartphone which contains this PMIC and
> whose vendor kernel tree has also served as the sole reference for this.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
> 
> Notes:
>     RFC v2:
>     - Move in the register definitions from the preceding patch and reword
>       the commit message accordingly.
>     - Rebase to v6.12-rc2.
> 
>  MAINTAINERS                 |  1 +
>  drivers/rtc/Kconfig         | 10 ++++
>  drivers/rtc/Makefile        |  1 +
>  drivers/rtc/rtc-88pm886.c   | 97 +++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/88pm886.h |  9 ++++
>  5 files changed, 118 insertions(+)
>  create mode 100644 drivers/rtc/rtc-88pm886.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a097afd76ded..3a15b8711041 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13710,6 +13710,7 @@ F:	Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
>  F:	drivers/input/misc/88pm886-onkey.c
>  F:	drivers/mfd/88pm886.c
>  F:	drivers/regulator/88pm886-regulator.c
> +F:	drivers/rtc/rtc-88pm886.c
>  F:	include/linux/mfd/88pm886.h
>  
>  MARVELL ARMADA 3700 PHY DRIVERS
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 66eb1122248b..2718ea194dd4 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -182,6 +182,16 @@ config RTC_DRV_88PM80X
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-88pm80x.
>  
> +config RTC_DRV_88PM886
> +	tristate "Marvell 88PM886 RTC driver"
> +	depends on MFD_88PM886_PMIC
> +	help
> +	  If you say yes here you will get support for the RTC function in the
> +	  Marvell 88PM886 chip.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-88pm886.
> +
>  config RTC_DRV_ABB5ZES3
>  	select REGMAP_I2C
>  	tristate "Abracon AB-RTCMC-32.768kHz-B5ZE-S3"
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index f62340ecc534..70bbce968a43 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_RTC_LIB_KUNIT_TEST)	+= lib_test.o
>  
>  obj-$(CONFIG_RTC_DRV_88PM80X)	+= rtc-88pm80x.o
>  obj-$(CONFIG_RTC_DRV_88PM860X)	+= rtc-88pm860x.o
> +obj-$(CONFIG_RTC_DRV_88PM886)	+= rtc-88pm886.o
>  obj-$(CONFIG_RTC_DRV_AB8500)	+= rtc-ab8500.o
>  obj-$(CONFIG_RTC_DRV_ABB5ZES3)	+= rtc-ab-b5ze-s3.o
>  obj-$(CONFIG_RTC_DRV_ABEOZ9)	+= rtc-ab-eoz9.o
> diff --git a/drivers/rtc/rtc-88pm886.c b/drivers/rtc/rtc-88pm886.c
> new file mode 100644
> index 000000000000..57e9b0a66eed
> --- /dev/null
> +++ b/drivers/rtc/rtc-88pm886.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/limits.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +
> +#include <linux/mfd/88pm886.h>
> +
> +/*
> + * Time is calculated as the sum of a 32-bit read-only advancing counter and a
> + * writeable constant offset stored in the chip's spare registers.
> + */
> +
> +static int pm886_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct regmap *regmap = dev_get_drvdata(dev);
> +	u32 time;
> +	u32 buf;
> +	int ret;
> +
> +	ret = regmap_bulk_read(regmap, PM886_REG_RTC_SPARE1, &buf, 4);
> +	if (ret)
> +		return ret;
> +	time = buf;
> +
> +	ret = regmap_bulk_read(regmap, PM886_REG_RTC_CNT1, &buf, 4);
> +	if (ret)
> +		return ret;
> +	time += buf;
> +
> +	rtc_time64_to_tm(time, tm);
> +
> +	return 0;
> +}
> +
> +static int pm886_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct regmap *regmap = dev_get_drvdata(dev);
> +	u32 buf;
> +	int ret;
> +
> +	ret = regmap_bulk_read(regmap, PM886_REG_RTC_CNT1, &buf, 4);
> +	if (ret)
> +		return ret;
> +
> +	buf = rtc_tm_to_time64(tm) - buf;
> +
> +	return regmap_bulk_write(regmap, PM886_REG_RTC_SPARE1, &buf, 4);
> +}
> +
> +static const struct rtc_class_ops pm886_rtc_ops = {
> +	.read_time = pm886_rtc_read_time,
> +	.set_time = pm886_rtc_set_time,
> +};
> +
> +static int pm886_rtc_probe(struct platform_device *pdev)
> +{
> +	struct pm886_chip *chip = dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev = &pdev->dev;
> +	struct rtc_device *rtc;
> +	int ret;
> +
> +	platform_set_drvdata(pdev, chip->regmap);
> +
> +	rtc = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(rtc))
> +		return dev_err_probe(dev, PTR_ERR(rtc),
> +				"Failed to allocate RTC device\n");
> +
> +	rtc->ops = &pm886_rtc_ops;
> +	rtc->range_max = U32_MAX;
> +
> +	ret = devm_rtc_register_device(rtc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register RTC device\n");
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id pm886_rtc_id_table[] = {
> +	{ "88pm886-rtc", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, pm886_rtc_id_table);
> +
> +static struct platform_driver pm886_rtc_driver = {
> +	.driver = {
> +		.name = "88pm886-rtc",
> +	},
> +	.probe = pm886_rtc_probe,
> +	.id_table = pm886_rtc_id_table,
> +};
> +module_platform_driver(pm886_rtc_driver);
> +
> +MODULE_DESCRIPTION("Marvell 88PM886 RTC driver");
> +MODULE_AUTHOR("Karel Balej <balejk@matfyz.cz>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
> index 133aa302e492..85eca44f39ab 100644
> --- a/include/linux/mfd/88pm886.h
> +++ b/include/linux/mfd/88pm886.h
> @@ -31,6 +31,15 @@
>  #define PM886_INT_WC			BIT(1)
>  #define PM886_INT_MASK_MODE		BIT(2)
>  
> +#define PM886_REG_RTC_CNT1		0xd1
> +#define PM886_REG_RTC_CNT2		0xd2
> +#define PM886_REG_RTC_CNT3		0xd3
> +#define PM886_REG_RTC_CNT4		0xd4
> +#define PM886_REG_RTC_SPARE1		0xea
> +#define PM886_REG_RTC_SPARE2		0xeb
> +#define PM886_REG_RTC_SPARE3		0xec
> +#define PM886_REG_RTC_SPARE4		0xed
> +#define PM886_REG_RTC_SPARE5		0xee
>  #define PM886_REG_RTC_SPARE6		0xef
>  
>  #define PM886_REG_BUCK_EN		0x08
> -- 
> 2.47.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


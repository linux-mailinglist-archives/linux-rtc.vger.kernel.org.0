Return-Path: <linux-rtc+bounces-4338-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057AAE4D6A
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 21:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FFB017D386
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 19:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9A32D542A;
	Mon, 23 Jun 2025 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U9S098Lv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5182D540D;
	Mon, 23 Jun 2025 19:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706049; cv=none; b=cjUyZryGLP8wxC8kmXBpMUVUP0cCliloHWEk1Ya/g1oxzY3QBh4Q5nhRTKuqa0dLTiUi/vhgDfQHgT6JMRsLPTJKXOXiHN5kwVPqf0KTeGAf5LrJYX2VequUsnT1+GPGbVcYJC7oOqXcaET5Ho2235X3cFZWorOdvUAIoaY66eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706049; c=relaxed/simple;
	bh=NtP5eCNYMwW/2Yj8dA6ifDlnG6AqSVMIcjui45f7p3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbbSkBtC4pW3Ppzb5b5tQVCUlDik/jYWOkRVzbI28C9xfhL1tqiVy7GphI3aCohbx9wMyGpuD4V/aCC59IG1TlWMaHRmiAeXKVPVhtoh7PZD1jaavOcM4OY6hJIgDsWXSiso4OjUauQO8zh5hMuvk8MiZNGN5OmJhfgQJUORmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U9S098Lv; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9A8644389;
	Mon, 23 Jun 2025 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750706043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plrmxrpOaORibBC+apUmisrBSlFs6aP2PmQczgUKjrI=;
	b=U9S098LvVLIdJuLYXK0FftX9g34JekisyscFQJIoAzY2vz0bfJ8D3WvkE01Q2hHarpKyBk
	sI8RZtNOZnehhk7Oyuy5avAdrsfAXsCA87A/e2uS0XRisLUHzl8HgEuQb+9ayhU8Vl3qbK
	vIbbuBUDQObejeiV+34Wj3Ehl0C+n3sI6rfem5W+E2iZwa8/FqFMiAlH1M1guLaEaLS/I2
	IrhTD7Pj/dQ/8awTtD+su2Zw7ruMzumfoiJwUQTArRjFPnCg0LcWvh4abN0HyvIA1I9/wh
	XeYf7ZQHTEdisAa3FSTAMCHPCs2Q5QJ0VVDmt7TOrUBsiWrxxqkLlqSfu6jLPA==
Date: Mon, 23 Jun 2025 21:14:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@gentoo.org, wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Message-ID: <20250623191400c330f01f@mail.local>
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622032941.3768912-5-elder@riscstar.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegvlhguvghrsehrihhstghsthgrrhdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgto
 hhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughlrghnsehgvghnthhoohdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 21/06/2025 22:29:36-0500, Alex Elder wrote:
> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
> only setting and reading the time are supported.
> 
> The PMIC is implemented as a multi-function device.  This RTC is
> probed based on this driver being named in a MFD cell in the simple
> MFD I2C driver.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Added this driver to the series, in response to Lee Jones saying
>       more than one MFD sub-device was required to be acceptable
> 
>  drivers/rtc/Kconfig  |  10 ++++
>  drivers/rtc/Makefile |   1 +
>  drivers/rtc/rtc-p1.c | 137 +++++++++++++++++++++++++++++++++++++++++++

We need something more descriptive than p1 here

>  3 files changed, 148 insertions(+)
>  create mode 100644 drivers/rtc/rtc-p1.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 9aec922613cec..27cff02ba4e66 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-max77686.
>  
> +config RTC_DRV_P1

Ditto

> +	tristate "SpacemiT P1 RTC"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select MFD_SPACEMIT_P1
> +	default ARCH_SPACEMIT
> +	help
> +	  Enable support for the RTC function in the SpacemiT P1 PMIC.
> +	  This driver can also be built as a module, which will be called
> +	  "spacemit-p1-rtc".
> +
>  config RTC_DRV_NCT3018Y
>  	tristate "Nuvoton NCT3018Y"
>  	depends on OF
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 4619aa2ac4697..f8588426e2ba4 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
>  obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
>  obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
>  obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
> +obj-$(CONFIG_RTC_DRV_P1)	+= rtc-p1.o
>  obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
>  obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
>  obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
> diff --git a/drivers/rtc/rtc-p1.c b/drivers/rtc/rtc-p1.c
> new file mode 100644
> index 0000000000000..e0d2c0c822142
> --- /dev/null
> +++ b/drivers/rtc/rtc-p1.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the RTC found in the SpacemiT P1 PMIC
> + *
> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/rtc.h>
> +
> +#define MOD_NAME	"spacemit-p1-rtc"
> +
> +/* Offset to byte containing the given time unit */
> +enum time_unit {
> +	tu_second = 0,		/* 0-59 */
> +	tu_minute,		/* 0-59 */
> +	tu_hour,		/* 0-59 */
> +	tu_day,			/* 0-30 (struct tm uses 1-31) */
> +	tu_month,		/* 0-11 */
> +	tu_year,		/* Years since 2000 (struct tm uses 1900) */
> +	tu_count,		/* Last; not a time unit */
> +};

I'm not sure this enum actually brings anything

> +
> +/* Consecutive bytes contain seconds, minutes, etc. */
> +#define RTC_COUNT_BASE		0x0d
> +
> +#define RTC_CTRL		0x1d
> +#define RTC_EN		BIT(2)
> +
> +struct p1_rtc {
> +	struct regmap *regmap;
> +	struct rtc_device *rtc;
> +};
> +
> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	u8 time[tu_count];
> +	int ret;
> +
> +	ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, sizeof(time));
> +	if (ret)
> +		return ret;
> +
> +	t->tm_sec = time[tu_second] & GENMASK(5, 0);
> +	t->tm_min = time[tu_minute] & GENMASK(5, 0);
> +	t->tm_hour = time[tu_hour] & GENMASK(4, 0);
> +	t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
> +	t->tm_mon = time[tu_month] & GENMASK(3, 0);
> +	t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
> +	/* tm_wday, tm_yday, and tm_isdst aren't used */
> +
> +	return 0;
> +}
> +
> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	u8 time[tu_count];
> +	int ret;
> +
> +	time[tu_second] = t->tm_sec;
> +	time[tu_minute] = t->tm_min;
> +	time[tu_hour] = t->tm_hour;
> +	time[tu_day] = t->tm_mday - 1;
> +	time[tu_month] = t->tm_mon;
> +	time[tu_year] = t->tm_year - 100;
> +
> +	/* Disable the RTC to update; re-enable again when done */
> +	ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, sizeof(time));
> +
> +	(void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);

Don't you care whether the RTC has been reenabled?

> +
> +	return ret;
> +}
> +
> +static const struct rtc_class_ops p1_rtc_class_ops = {
> +	.read_time = p1_rtc_read_time,
> +	.set_time = p1_rtc_set_time,
> +};
> +
> +static int p1_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_device *rtc;
> +	struct p1_rtc *p1;
> +	int ret;
> +
> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
> +	if (!p1)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, p1);
> +
> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!p1->regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
> +
> +	rtc = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(rtc))
> +		return dev_err_probe(dev, PTR_ERR(rtc),
> +				     "error allocating device\n");
> +	p1->rtc = rtc;
> +
> +	rtc->ops = &p1_rtc_class_ops;
> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
> +
> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
> +
> +	ret = devm_rtc_register_device(rtc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "error registering RTC\n");

This message is unnecessary, there are no silent error path in
devm_rtc_register_device

> +
> +	return 0;
> +}
> +
> +static struct platform_driver p1_rtc_driver = {
> +	.probe = p1_rtc_probe,
> +	.driver = {
> +		.name = MOD_NAME,
> +	},
> +};
> +
> +module_platform_driver(p1_rtc_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" MOD_NAME);

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


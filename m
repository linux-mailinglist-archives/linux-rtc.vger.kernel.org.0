Return-Path: <linux-rtc+bounces-4363-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E776AE90BC
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 00:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9EBB1C22F99
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 22:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6B026E179;
	Wed, 25 Jun 2025 22:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I0fAPyXK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E78211A0C;
	Wed, 25 Jun 2025 22:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750888902; cv=none; b=fQ4dVsDyW7FIy29sPi1yHyaWi85oW7mQt8ooHD+1FDO3DWR9dGhdG3FrksGn5GuUsFqmsC2TnB44llhtwPnbP0nTQZM1rhRb3Wzn1dZ1fgxe287Cb9a1Xt2QUUDsRJK/iDsKICHzkpqRjg7qBTHKlH+XqVOdS7CROQnad0V/OA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750888902; c=relaxed/simple;
	bh=1oM1VIc5EvIoofVAavv+VEtCR/kFlLvlBFvuL9Z8qE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHTYu0FBRc/TCxH+ZPBmmoNQzsSDcFl1Mij0KKY4e88siUP9d6tXYfb2r+uQelXGK9AHBPWLVRPAdZtu+91pIp9y2CA5OezHM6LN5AZgGCUQGfolP+Qas4AVFmFMDVDAX8NKTnJlcO9iJ1zwFrRa4TD2FQritrKfmZfnkFlLEQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I0fAPyXK; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BFE44386A;
	Wed, 25 Jun 2025 22:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750888891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HKnWMQGLSwUmkBmCbW4MfLJK1vhlzOPpUC3CJuRa9WE=;
	b=I0fAPyXKU2K1hOg5G1lq/+URqNSdvClGSaTmtwEfUEA8eFoQaXiZOcfntjBCyy5ojuweU2
	dcOjcQLKIPmNX9x2YmBqnp8HEKAx98FOY/mqnkwlMrGS2RE4wpi32qQls88NhSH3nbNVVZ
	e8dvXeK9+qcI1DTj0/x28LnG6P+xVaeqsRM+vwpiblPzgkel78S+Llfwun+XiohwL5+Ro/
	m3idZtDCwpxGAPps6IPtHQ2UkPPzsaRvC2inxFA1xVbJa8o7xwSNfMAZ7fbYSaz9NY4Njs
	nYQqoXZszzRkA9uRxsQtibN5DXrV4HcM2xFn445WxriCY0QPlEN6TO4S6VBn1g==
Date: Thu, 26 Jun 2025 00:01:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Message-ID: <202506252201262779aa6c@mail.local>
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625164119.1068842-5-elder@riscstar.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegvlhguvghrsehrihhstghsthgrrhdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgto
 hhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthdrjhhonhgtiiihkhesohdvrdhplh

On 25/06/2025 11:41:15-0500, Alex Elder wrote:
> +/*
> + * The P1 hardware documentation states that the register values are
> + * latched to ensure a consistent time snapshot within the registers,
> + * but these are in fact unstable due to a bug in the hardware design.
> + * So we loop until we get two identical readings.
> + */
> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	struct regmap *regmap = p1->regmap;
> +	u32 count = RTC_READ_TRIES;
> +	u8 times[2][6];
> +	size_t size;
> +	u32 i = 0;
> +	u8 *time;
> +	int ret;
> +
> +	size = sizeof(times[0]);
> +	ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
> +	if (ret)
> +		return ret;
> +
> +	do {
> +		i = 1 - i;
> +		ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
> +		if (ret)
> +			return ret;
> +	} while (memcmp(times[i], times[1 - i], size) && --count);

Simply checking the seconds is enough, unless you expect regmap_bulk_read to ake
more than a minute so you don't need a two dimension array.

> +
> +	if (!count)
> +		return -EIO;
> +
> +	time = &times[0][0];
> +
> +	t->tm_sec = time[0] & GENMASK(5, 0);
> +	t->tm_min = time[1] & GENMASK(5, 0);
> +	t->tm_hour = time[2] & GENMASK(4, 0);
> +	t->tm_mday = (time[3] & GENMASK(4, 0)) + 1;
> +	t->tm_mon = time[4] & GENMASK(3, 0);
> +	t->tm_year = (time[5] & GENMASK(5, 0)) + 100;
> +
> +	return 0;
> +}
> +
> +/*
> + * The P1 hardware documentation states that values in the registers are
> + * latched so when written they represent a consistent time snapshot.
> + * Nevertheless, this is not guaranteed by the implementation, so we must
> + * disable the RTC while updating it.
> + */
> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	struct regmap *regmap = p1->regmap;
> +	u8 time[6];
> +	int ret2;
> +	int ret;
> +
> +	time[0] = t->tm_sec;
> +	time[1] = t->tm_min;
> +	time[2] = t->tm_hour;
> +	time[3] = t->tm_mday - 1;
> +	time[4] = t->tm_mon;
> +	time[5] = t->tm_year - 100;
> +
> +	/* Disable the RTC to update; re-enable again when done */
> +	ret = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
> +
Honnestly, I'd simply go for

	if (ret)
		return ret;

Here, you are trying to set the time, I'm not sure it is worth trying to
reenable the rtc while hoping the previous time has been kept.

This also shows that p1_rtc_read_time should check that RTC_EN is set, else it
knows the time has never been set and is invalid.


> +	ret2 = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, RTC_EN);
> +
> +	return ret ? : ret2;		/* Return the first error */


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
> +	return devm_rtc_register_device(rtc);
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
> -- 
> 2.45.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


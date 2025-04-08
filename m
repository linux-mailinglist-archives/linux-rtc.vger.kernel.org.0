Return-Path: <linux-rtc+bounces-3825-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B2A7F687
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 09:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80555188D8D7
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 07:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A4F2641FC;
	Tue,  8 Apr 2025 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OgBMdpby"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AF6263F5B;
	Tue,  8 Apr 2025 07:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097807; cv=none; b=XADuK2aXP7c+VbGrhkjiXwfYxcycguLF6uU233pIB0CdCb3zTlera2OW1MaQzgzWJbOXE78qEmFpHit8PEzYBkb4SsRJiM2q+iV/YG10W5YN9SSJqSCAZY7DlvVe4mRbsyQCupXjRkplKqMvudsk75kK8xA9ilb6QdkBuzhIsHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097807; c=relaxed/simple;
	bh=qStEiInZ6QdmTNPscErtkbrO8I7VqKWbI7Vow2/nZlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhj2LrOpKB8gY+gu9MtT5Oo57LRjGQ8gTopX77gTfYeU40QOf7+CAmPSLcu/sWhoIxoK1wuSHpHcnsgceIxV9ZPEIHgDXBHqLg4kuaQcLftGMVLVuD1GCedbASxsKDYK9lBnzmzRaZ/kc+jr0dVGsbF0Wb0mMJG/ETBtOj3Itys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OgBMdpby; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAF22442DC;
	Tue,  8 Apr 2025 07:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744097802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqZg4tEnT3kYdltFRHVi26EBjikLyKFcZ9ynT2bbpFA=;
	b=OgBMdpby5E/xgaA7CMEHegfw3/FY7SMlp19DXobX0C1ETaxvLon+no8FD7xGrYEjZ5swQQ
	49hh4s+R7bCt69pr+LWDRXSG6NpYxt+970wfH5eRm08tvXphPL3kyoRvkqmMrepAHdyJWg
	Xf6YRqoXwwwhEBENueCkJ7SzDplsmgHLuO+FLaKfBjHHjqRVza4+sCGybwmpj2cFbo3jWV
	elVezCkW4v3C3fNFwmbk0Q+m6DCsvQuIHW9zgo5jmryRC0KpJR+OPppCi6wk8XUt+vKKuL
	im8Tcacxro+BEBEt/AnC2afndKXk2aGQ300/+CBiFiDYlWH83gPb9OEm+21INQ==
Date: Tue, 8 Apr 2025 09:36:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Antoni Pokusinski <apokusinski01@gmail.com>, krzk+dt@kernel.org,
	conor+dt@kernel.org, robh@kernel.org,
	alexander.stein@ew.tq-group.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: pcf85063: add support for RV8063
Message-ID: <20250408073641fa372d2e@mail.local>
References: <20250407193521.634807-1-apokusinski01@gmail.com>
 <20250407193521.634807-3-apokusinski01@gmail.com>
 <b42d082e-0568-4d2c-849c-a0b9ab762afd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b42d082e-0568-4d2c-849c-a0b9ab762afd@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevudevhfdvheelgfeileefteduuefghefguefgkeeljeeufeeutedtffeuteeivdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrphhokhhushhinhhskhhitddusehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihkodgut
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 08/04/2025 08:14:36+0200, Krzysztof Kozlowski wrote:
> On 07/04/2025 21:35, Antoni Pokusinski wrote:
> > Microcrystal RV8063 is a real-time clock with SPI interface. Its
> > functionality is very similar to the RV8263 rtc.
> > 
> > Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> > ---
> >  drivers/rtc/Kconfig        | 21 ++++++-----
> >  drivers/rtc/rtc-pcf85063.c | 74 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 85 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 838bdc138ffe..1b9be96faa13 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -483,15 +483,6 @@ config RTC_DRV_PCF8523
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called rtc-pcf8523.
> >  
> > -config RTC_DRV_PCF85063
> > -	tristate "NXP PCF85063"
> > -	select REGMAP_I2C
> > -	help
> > -	  If you say yes here you get support for the PCF85063 RTC chip
> > -
> > -	  This driver can also be built as a module. If so, the module
> > -	  will be called rtc-pcf85063.
> > -
> >  config RTC_DRV_PCF85363
> >  	tristate "NXP PCF85363"
> >  	select REGMAP_I2C
> > @@ -971,6 +962,18 @@ config RTC_DRV_PCF2127
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called rtc-pcf2127.
> >  
> > +config RTC_DRV_PCF85063
> 
> Why? This breaks the order.
> 

I don't think it does but you can't see it from the diff.

> > +	tristate "NXP PCF85063"
> > +	depends on RTC_I2C_AND_SPI
> > +	select REGMAP_I2C if I2C
> > +	select REGMAP_SPI if SPI_MASTER
> > +	help
> > +	  If you say yes here you get support for the PCF85063 and RV8063
> > +	  RTC chips.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called rtc-pcf85063.
> > +
> 
> 
> ...
> 
> >  module_exit(pcf85063_exit);
> > @@ -740,3 +811,4 @@ module_exit(pcf85063_exit);
> >  MODULE_AUTHOR("Søren Andersen <san@rosetechnology.dk>");
> >  MODULE_DESCRIPTION("PCF85063 RTC driver");
> >  MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("spi:rv8063");
> 
> Drop and use proper ID tables.
> 
> 
> Best regards,
> Krzysztof

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


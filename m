Return-Path: <linux-rtc+bounces-4163-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F8AC441D
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 21:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073B1177BA4
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 19:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4604823F413;
	Mon, 26 May 2025 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CG8/V6tn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0919A16EB7C;
	Mon, 26 May 2025 19:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288410; cv=none; b=GRvee8xYXsvtwpYOLwdeXZY/qZYMMDJLSsRqcMndiELzSmV8ItgQILNAUsRZMYRPCp3ncOj0LzfPvh3QQumxn+TzkqvpcNx4H7keFrKCER97vRu+nHYhRHT55GCkHB2gTORaOpcBU+4G8xJ1mBJflmqMJcRiOshEHzH6Cqt/ukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288410; c=relaxed/simple;
	bh=EBLl2nBgeb7VjutThW6xJ5CJh8s51hdNm7D6aqdBkoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGwRM0A95SB8frobYxzV4wx4uluvJ4vE2l0x6JS51fVSmOKkAS2aXigN7ULKRoO3PPhrKQYGjzuo0gWN+iPwNqUNkfKTKZMEh6TK85i/4RLQI+1IClg7z4Er0xVt7hh3tiQiUTtuEmydC6liYgNuNwYhEsVJ02PlHMPREtiO56M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CG8/V6tn; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4116E44110;
	Mon, 26 May 2025 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748288399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IzsvBOMSgUY7uIQrnXNy/GUUgeV25zxgRzEzRH+pgBQ=;
	b=CG8/V6tn6yh2rmsmvRdsKebjCjjtGCHiIafU8IpjcE9Fu4VPqP7eOM7huqWiI4uVe/3sSw
	dLJJO5d7wmlOg5UgpLy8IEpGLDI/9CgTvtrCa4skLiIP7+VbrDL6j+ee7gkw1mK9BbE3KG
	Hfcpk/DSERfDoqWTMUQH3e7MDqL70FDKnWoYJT93giXwt+mtZSR8u9WlurwMexv9OzoMZj
	SkSbNq986EneQa7VUJP8GOcs8qFzi2DP3hh50tqf8aKsWmWpJhFPtLthlsyVqhK3odWx6w
	8r16Nqptipi3eJpBaQXhxSTd2HUnLJecB7vuf2B8EZA1VA4Fy1UsE6BqXnScXQ==
Date: Mon, 26 May 2025 21:39:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Giampiero Baggiani <giampiero@sferalabs.cc>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: align power management configuration
Message-ID: <20250526193958617d18ab@mail.local>
References: <20250526161234.13236-1-giampiero@sferalabs.cc>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526161234.13236-1-giampiero@sferalabs.cc>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddukeefkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfehueeiieekhffgvdfhheeivdfhgfejteffgfethfdugfetffefveeltdeljeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehgihgrmhhpihgvrhhosehsfhgvrhgrlhgrsghsrdgttgdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 26/05/2025 18:12:34+0200, Giampiero Baggiani wrote:
> The PCF2131 comes with the following default settings:
> - battery switch-over function is disabled;
> - battery low detection function is disabled.
> These defaults differ from those of other models supported by this driver.
> 
> This commit aligns the behavior across all supported models, configuring
> them to the settings typically expected from an RTC.

We can't do that as this is going to break existing users as they may rely on
the current behaviour and the configuration is persistent across reboots.

> 
> Signed-off-by: Giampiero Baggiani <giampiero@sferalabs.cc>
> ---
>  drivers/rtc/rtc-pcf2127.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 31c7dca8f469..cbdf7f23e6a6 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -1312,8 +1312,15 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  	 * Clear battery interrupt flags which can block new trigger events.
>  	 * Note: This is the default chip behaviour but added to ensure
>  	 * correct tamper timestamp and interrupt function.
> +	 *
> +	 * Power management functions set to:
> +	 * - battery switch-over function is enabled in standard mode;
> +	 * - battery low detection function is enabled;
> +	 * - extra power fail detection function is enabled.
> +	 * Note: This is the default configuration except for pcf2131.
>  	 */
>  	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
> +				 PCF2127_CTRL3_PM |
>  				 PCF2127_BIT_CTRL3_BTSE |
>  				 PCF2127_BIT_CTRL3_BIE |
>  				 PCF2127_BIT_CTRL3_BLIE, 0);
> -- 
> 2.39.2 (Apple Git-143)
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


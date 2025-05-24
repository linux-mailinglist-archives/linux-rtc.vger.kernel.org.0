Return-Path: <linux-rtc+bounces-4139-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CDAAC3187
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 23:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D79971798C0
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 21:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6C41DF27C;
	Sat, 24 May 2025 21:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gsglZqDZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065272DCC06;
	Sat, 24 May 2025 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748122616; cv=none; b=DiPKqTj+cmIqk3LcfsHEdK+GGpdhmozA8ur3qvRTaFce6ghSsWTdTQ+zRDCbCGyXaMI/sjLVVPux2abyE8WD1CY8FdvsNeJQbTvwbdkTbz0w5vkJNR62cU7qUX51RxtRKFmegHCaIcxTKs7vvhH7xLp8SN3/2kc7qjKKlsHET8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748122616; c=relaxed/simple;
	bh=DmWLwxblFFqXHebpbRJy07gQkYWL1VyyHH0I0CMqHeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aa+u0QD2PA1yhlGocoOziGvQCPv4bQUVDb3/aA3At9D6/hmWswdromzGzBlf0oktFmVQSs+S5W9c7cZdlnpxc+TyRjoyHuOl6mvcBkjNEIqPv6Mqin6wlr1ov0IeWOaoK6cbd51soNRB09Vx0d+HmPoVIevgGiqG7ZefJjcks0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gsglZqDZ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3731042F79;
	Sat, 24 May 2025 21:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748122606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g2d8KXwEQ380rtettT2TdxGXEtyPNhKQH/1IcB985gY=;
	b=gsglZqDZ9tv1Db6c8cjm9FOCs6yj+RpiwOy9t6ID2VggLf3QZViLZ9xZwMCtolUjTt0dyk
	lpVEfR5iuRfyMrI5Q0p5O5db2S4go/OivRyJOnyXwWnj9X5rqd5Ym83P64xrCi7pdSi1um
	Nr1crgRFwIZdawPWxJz+b1E/RsBorMj0IRMLZblYrONTpY5fnmcqvgmRYvRtvrYHuNJA6i
	dgHJFHnj81er9sCDc4cjlTK6Rdbzu11465ueSYUlhMrnaZI/VloCmPudkmf1Abai26NnPZ
	Tnref6QyEaIXIrxhwHN4/QF4ws4qYwb3KYwKm1JEBPzbtxinQab6zDhHG+iBag==
Date: Sat, 24 May 2025 23:36:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf8563: fix wrong alarm register
Message-ID: <20250524213645d5543d64@mail.local>
References: <20250419-pcf8563-fix-alarm-v1-1-b893a5de55b8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-pcf8563-fix-alarm-v1-1-b893a5de55b8@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdektdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtrhhohihmihhttghhvghllhelkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesv
 hhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 19/04/2025 22:37:10+0800, Troy Mitchell wrote:
> Fix wrong register and align `pcf8563_get_alarm_mode`
> with the naming convention used in ops.
> 
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> ---
> Since this patch[1], the set_alarm function has been setting
> an wrong register.
> 
> Link:
> https://lore.kernel.org/all/20241010084949.3351182-3-iwamatsu@nigauri.org/ [1]
> ---
>  drivers/rtc/rtc-pcf8563.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
> index 5a084d426e58d09cfedf0809695a96a27627c420..61e2f9757de9f24407f9262657da0d1586ce124e 100644
> --- a/drivers/rtc/rtc-pcf8563.c
> +++ b/drivers/rtc/rtc-pcf8563.c
> @@ -103,7 +103,7 @@ static int pcf8563_set_alarm_mode(struct pcf8563 *pcf8563, bool on)
>  	return regmap_write(pcf8563->regmap, PCF8563_REG_ST2, buf);
>  }
>  
> -static int pcf8563_get_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,
> +static int pcf8563_read_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,

I was going to apply the patch but this is an unrelated change, please submit
just the fix so it can be backported.

>  				  unsigned char *pen)
>  {
>  	u32 buf;
> @@ -127,7 +127,7 @@ static irqreturn_t pcf8563_irq(int irq, void *dev_id)
>  	char pending;
>  	int err;
>  
> -	err = pcf8563_get_alarm_mode(pcf8563, NULL, &pending);
> +	err = pcf8563_read_alarm_mode(pcf8563, NULL, &pending);
>  	if (err)
>  		return IRQ_NONE;
>  
> @@ -262,7 +262,7 @@ static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
>  	tm->time.tm_mday = bcd2bin(buf[2] & 0x3F);
>  	tm->time.tm_wday = bcd2bin(buf[3] & 0x7);
>  
> -	err = pcf8563_get_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
> +	err = pcf8563_read_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
>  	if (err < 0)
>  		return err;
>  
> @@ -285,7 +285,7 @@ static int pcf8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
>  	buf[2] = bin2bcd(tm->time.tm_mday);
>  	buf[3] = tm->time.tm_wday & 0x07;
>  
> -	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_SC, buf,
> +	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_AMN, buf,
>  				sizeof(buf));
>  	if (err)
>  		return err;
> 
> ---
> base-commit: 8560697b23dc2f405cb463af2b17256a9888129d
> change-id: 20250419-pcf8563-fix-alarm-5e787f095861
> 
> Best regards,
> -- 
> Troy Mitchell <troymitchell988@gmail.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


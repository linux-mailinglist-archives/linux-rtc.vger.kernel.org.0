Return-Path: <linux-rtc+bounces-1469-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6492D870
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 20:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E174280846
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 18:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D388E197A9B;
	Wed, 10 Jul 2024 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cAi16r+V"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7C4197A8B;
	Wed, 10 Jul 2024 18:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720636943; cv=none; b=lPHvuWr/zi3z/t6qytO1a3oYcVBANEi2n2KfYALLulujXvgQuNMZ0I/TSgKfRn/YMAm0oOtfptYzEbugfUyvbN9eGV4QAlqFVeENE1jFRipSXbJVjvM38d/5xMqfiuspqdThlTwJBM7G1CYEjTRio1GYlEPG1TytvWwm7UZhqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720636943; c=relaxed/simple;
	bh=UBu6fNm0fFDtfeL4anOeREnljKnH0D+6HaR0FyPhXqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr2Y/JgTNfp+oSEK+cVvSX7S10sl6FJPm3lMzzz+s7/j/wvLrkdxoxqK8KfqmuPraTSU4ay/XCV3TX+m0mH/52mH85Gg3oxOS0UfPf3IX6yVxwk8AlJfdMSEK5blQNqvKsjJwREKySlU5nWFFCbTFwPNjzo0FV0rTMONNC4qybc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cAi16r+V; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 846BCC6403;
	Wed, 10 Jul 2024 18:40:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3078A40003;
	Wed, 10 Jul 2024 18:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720636854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UVyLxSxzZ2x0jPokebkjMz+UYcnUJCbspPQMiJ0vc+s=;
	b=cAi16r+VyFjc9REQFquEJqdJIo4HevFwHTvVD6vMCJfU/79XUgKRMtuBCkPAea3A3Jbl8P
	NXLfc4HpeblPQ/rOxEtA7y583QkaCuHXnJUmA5VsQk3iNy36Zbe83iOhUQjd6b1pb5Ip5o
	QiJHfxWEmU/na7kP/1WVIRVMqbJua2z+zNYYgVl0+m5MQhh2K3CzFNwwyHJXDnc8scDm61
	KDoTMVj+sovoWJlvw/7OaCVjaMQK9yE7cLsPBkHKrCWfsPrvOHXLzqsQSUhs2OgHWuOFwX
	loIyyi9Rvp26qwai9wseMcfF33r6AJ5ZP4W7RYbcLSKfiCVr7ZA5ucTHQIrNXA==
Date: Wed, 10 Jul 2024 20:40:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH] rtc: ds1343: Force SPI chip select to be active
 high
Message-ID: <20240710184053c34201f0@mail.local>
References: <20240710175246.3560207-1-abbotti@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710175246.3560207-1-abbotti@mev.co.uk>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 10/07/2024 18:52:07+0100, Ian Abbott wrote:
> Commit 3b52093dc917 ("rtc: ds1343: Do not hardcode SPI mode flags")
> bit-flips (^=) the existing SPI_CS_HIGH setting in the SPI mode during
> device probe.  This will set it to the wrong value if the spi-cs-high
> property has been set in the devicetree node.  Just force it to be set
> active high and get rid of some commentary that attempted to explain why
> flipping the bit was the correct choice.
> 
> Fixes: 3b52093dc917 ("rtc: ds1343: Do not hardcode SPI mode flags")
> Cc: <stable@vger.kernel.org> # 5.6+
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
> ---
>  drivers/rtc/rtc-ds1343.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
> index ed5a6ba89a3e..484b5756b55c 100644
> --- a/drivers/rtc/rtc-ds1343.c
> +++ b/drivers/rtc/rtc-ds1343.c
> @@ -361,13 +361,10 @@ static int ds1343_probe(struct spi_device *spi)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	/* RTC DS1347 works in spi mode 3 and
> -	 * its chip select is active high. Active high should be defined as
> -	 * "inverse polarity" as GPIO-based chip selects can be logically
> -	 * active high but inverted by the GPIO library.
> +	/*
> +	 * RTC DS1347 works in spi mode 3 and its chip select is active high.
>  	 */
> -	spi->mode |= SPI_MODE_3;
> -	spi->mode ^= SPI_CS_HIGH;
> +	spi->mode |= SPI_MODE_3 | SPI_CS_HIGH;

Linus being the gpio maintainer and Mark being the SPI maintainer, I'm
pretty sure this was correct at the time.

Are you sure you are not missing an active high/low flag on a gpio
definition?

>  	spi->bits_per_word = 8;
>  	res = spi_setup(spi);
>  	if (res)
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


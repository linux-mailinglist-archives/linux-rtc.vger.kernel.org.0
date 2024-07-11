Return-Path: <linux-rtc+bounces-1486-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C692EA9F
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 16:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBC551C20BFF
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 14:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6191216B388;
	Thu, 11 Jul 2024 14:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="VHAOMFo+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp83.ord1d.emailsrvr.com (smtp83.ord1d.emailsrvr.com [184.106.54.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446016A940
	for <linux-rtc@vger.kernel.org>; Thu, 11 Jul 2024 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720707707; cv=none; b=WUrikYPaL9r6WWyW9Iw23FNM0HYGPq+KoGdCoyDmlIdFoXS69KJDOY0yW92Pa+g66YH1QtR/SzuPkN3alpyT36z54mICPmX8dwNkHDraBJxrfH1Uxdv1N/jNnSxoeJV423SUKyEVDTHN9uZsSrIw2XUhHlQksUI24o9WCoRu9ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720707707; c=relaxed/simple;
	bh=OeRk1i3qXAV0YYxYZJgE3KI4JCMawZqmzQ8mGpGAIpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8tmOaBxySWTbVUgDzjFjoSAEi87frqR24YhC/0O24jVAf14xcCAMXRV72tArtSvAM1ubjAHBvd4KTgRED6Y+Xg/TgS9rJ2927XlJYzeKIcBZWdCvdI1PYw1raE9htOxd0X1GhcayrvmBRaKzxFoBeVXCeM06kp04Hp69zR8wYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=VHAOMFo+; arc=none smtp.client-ip=184.106.54.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1720706703;
	bh=OeRk1i3qXAV0YYxYZJgE3KI4JCMawZqmzQ8mGpGAIpM=;
	h=Date:Subject:To:From:From;
	b=VHAOMFo+dHgN6BbZY1sDnkVD+85dRNaqQ+aKOxMAw3kI2HS4hXYvumPf5gAw3u72Y
	 Z6KpJGvU2rVBa7yhiSSBj5VKean9IhYrDM+kr/0ZTFfccgb7aUQvCWESutT763ClbF
	 Q/dZt7vOjAlfLp28gW20f5chwz2UHB3q92EKoKzQ=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp11.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 83E6760182;
	Thu, 11 Jul 2024 10:05:02 -0400 (EDT)
Message-ID: <2b0e8a6c-f89e-4d71-a816-9da46ea695eb@mev.co.uk>
Date: Thu, 11 Jul 2024 15:05:01 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] rtc: ds1343: Force SPI chip select to be active
 high
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Mark Brown <broonie@kernel.org>
References: <20240710175246.3560207-1-abbotti@mev.co.uk>
 <20240710184053c34201f0@mail.local>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20240710184053c34201f0@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: daa3b8eb-56e6-455d-9215-420ec447232e-1-1

Greetings,

On 10/07/2024 19:40, Alexandre Belloni wrote:
> Hello,
> 
> On 10/07/2024 18:52:07+0100, Ian Abbott wrote:
>> Commit 3b52093dc917 ("rtc: ds1343: Do not hardcode SPI mode flags")
>> bit-flips (^=) the existing SPI_CS_HIGH setting in the SPI mode during
>> device probe.  This will set it to the wrong value if the spi-cs-high
>> property has been set in the devicetree node.  Just force it to be set
>> active high and get rid of some commentary that attempted to explain why
>> flipping the bit was the correct choice.
>>
>> Fixes: 3b52093dc917 ("rtc: ds1343: Do not hardcode SPI mode flags")
>> Cc: <stable@vger.kernel.org> # 5.6+
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
>> ---
>>   drivers/rtc/rtc-ds1343.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
>> index ed5a6ba89a3e..484b5756b55c 100644
>> --- a/drivers/rtc/rtc-ds1343.c
>> +++ b/drivers/rtc/rtc-ds1343.c
>> @@ -361,13 +361,10 @@ static int ds1343_probe(struct spi_device *spi)
>>   	if (!priv)
>>   		return -ENOMEM;
>>   
>> -	/* RTC DS1347 works in spi mode 3 and
>> -	 * its chip select is active high. Active high should be defined as
>> -	 * "inverse polarity" as GPIO-based chip selects can be logically
>> -	 * active high but inverted by the GPIO library.
>> +	/*
>> +	 * RTC DS1347 works in spi mode 3 and its chip select is active high.
>>   	 */
>> -	spi->mode |= SPI_MODE_3;
>> -	spi->mode ^= SPI_CS_HIGH;
>> +	spi->mode |= SPI_MODE_3 | SPI_CS_HIGH;
> 
> Linus being the gpio maintainer and Mark being the SPI maintainer, I'm
> pretty sure this was correct at the time.

I'm not convinced.  What value of `spi->mode & SPI_CS_HIGH` do you think 
the device should end up using?  (I think it should end up using 
`SPI_CS_HIGH`, which was the case before commit 3b52093dc917, because 
the RTC chip requires active high CS.)  What do you think the value of 
`spi->mode & SPI_CS_HIGH` will be *before* the `^=` operation? (For 
devicetree, that depends on the `spi-cs-high` property.)

I think the devicetree node for the RTC device ought to be setting 
`spi-cs-high` but cannot do so at the moment because the driver clobbers it.

> Are you sure you are not missing an active high/low flag on a gpio
> definition?

The CS might be internal to the SPI controller, not using a GPIO line 
(`cs-gpios` property).  SPI peripheral device drivers shouldn't care if 
CS is using GPIO or not.

> 
>>   	spi->bits_per_word = 8;
>>   	res = spi_setup(spi);
>>   	if (res)
>> -- 
>> 2.43.0
>>
> 

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-



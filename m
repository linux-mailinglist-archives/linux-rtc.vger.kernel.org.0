Return-Path: <linux-rtc+bounces-1574-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF493B665
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jul 2024 20:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E404E1F22887
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jul 2024 18:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D195B16B3B6;
	Wed, 24 Jul 2024 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="yzVreoqU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp99.iad3b.emailsrvr.com (smtp99.iad3b.emailsrvr.com [146.20.161.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8515E5C2
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jul 2024 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721844128; cv=none; b=Z+Dk3/VGxxWdIXnlcEvoGlFiFpsQAN5XXlm5AnDusWJ+j2VrrNxx4+LCy9S0tr1jx4maDE5pJeJE1qEb+KGGa/Dvxv0jgxgofs4ITkmjprHiPpcodjDhyNo+hWCqJpLqRzViBqjeFLK0hHBSw71o2CBfqNMkB3/tiyquH0ZBkJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721844128; c=relaxed/simple;
	bh=p8MHJqgFJTHWju+ZY7FnEi6FhVkz7AcqLJ0K66xW1pA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfwmfkHj2AB9ltqGKD1i2JRS4P1MyxgIdHRkQ4SYA82CepDkQ+7Aj0AReDDNRYX/LqlUV+UPjHVVXIWREpkJRTtqxtm6EJBL/0zL5TVRffV7haX0OB/mZyjd3TwsAN9ZYIYCdVuTl2ANDa07Jaru+G6U1fxbK2ckwxjxe++Ilwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=yzVreoqU; arc=none smtp.client-ip=146.20.161.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1721839600;
	bh=p8MHJqgFJTHWju+ZY7FnEi6FhVkz7AcqLJ0K66xW1pA=;
	h=Date:Subject:To:From:From;
	b=yzVreoqUx4GpGVMpHmpmAJhohhrCegMzxXBs6hVqNzP16evAOHqYL585PWA5LdXmM
	 ztjO/H64aE1etWC4L1nFQ4PNt5M/4b0BYfkMuZ9USwEaNyB06c9jEIVP89NnqBU4AA
	 JPt/sUJrDvB2QUGQHbK/YauAZ+6oKyiVke2bE6Rc=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp5.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 12F6D402F8;
	Wed, 24 Jul 2024 12:46:39 -0400 (EDT)
Message-ID: <128fc360-39c6-49d7-ba48-66914b1bfe06@mev.co.uk>
Date: Wed, 24 Jul 2024 17:46:39 +0100
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
X-Classification-ID: 691722cb-01d0-4a2a-a931-9818d622def5-1-1

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
> 
> Are you sure you are not missing an active high/low flag on a gpio
> definition?
> 
>>   	spi->bits_per_word = 8;
>>   	res = spi_setup(spi);
>>   	if (res)
>> -- 
>> 2.43.0
>>
> 

I now have an actual SPI controller using cs-gpios with a DS1343 
connected.  I have tested all 8 combinations of: 
GPIO_ACTIVE_LOW/GPIO_ACTIVE_HIGH, with/without spi-cs-high, without/with 
my patch.  Here are my results and observations:

                                  Final        Final
GPIO_ACTIVE  spi-cs-high  Patcb  GPIO active  CS high  Works?
===========  ===========  =====  ===========  =======  =======
    LOW           No        No      LOW         Yes      No
    LOW           No        Yes     LOW         Yes      No
    LOW           Yes       No      HIGH(1)     No       Yes(3)
    LOW           Yes       Yes     HIGH(1)     Yes      Yes
    HIGH          No        No      LOW(2)      Yes      No
    HIGH          No        Yes     LOW(2)      Yes      No
    HIGH          Yes       No      HIGH        No       Yes(3)
    HIGH          Yes       Yes     HIGH        Yes      Yes

The "Final GPIO active" column refers to the GPIO active state after any 
quirks have been applied.  The "Final CS High" column refers to whether 
SPI_CS_HIGH is set in spi->mode when spi_setup() is called.

Notes:

(1) GPIO was forced active high by of_gpio_flags_quirks() before RTC 
device probed.

(2) GPIO was forced active low by of_gpio_flags_quirks() before RTC 
device probed.

(3) Works if cs-gpios being used, but probably will not work for SPI 
controllers that do not use cs-gpios because SPI_CS_HIGH is not set.

In summary:

1. Without the patch, the RTC device node requires the spi-cs-high 
property to be present if the SPI controller uses cs-gpios, and requires 
the spi-cs-high property to be omitted if the SPI controller does not 
use cs-gpios.  (I think that is a confusing situation.)

2. With the patch, the RTC device node requires the spi-cs-high property 
to be present if the SPI controller uses cs-gpios, and it does not care 
about the spi-cs-high property if the SPI controller does not use 
cs-gpios.  (I therefore think that the patch should be applied so that 
the device node can just set spi-cs-high without caring whether ht SPI 
controller uses cs-gpios or not.)

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-



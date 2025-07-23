Return-Path: <linux-rtc+bounces-4542-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAB5B0F273
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 14:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9AF91AA3FD7
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 12:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9DD2E62B2;
	Wed, 23 Jul 2025 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YilIbIqi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCC82E6118
	for <linux-rtc@vger.kernel.org>; Wed, 23 Jul 2025 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753274572; cv=none; b=QRlliAhZ4VCGKg8T+pdxaT+tiuNOHgMSkLriCZa/S2ZuoKvK883hOCzg/hkIl8n90OjTTkbvD65nuEDc4MVXEi+B2uGn9hfR8GpmHRIVHM7X6K6Ae/4uKDHankQyYc1HnWTZskXMyXEJ8GSu/oOpcPGEsj8pKqKoCiurQRv67RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753274572; c=relaxed/simple;
	bh=s3GF7BZK1IbnAZRMzTFfekDE+ccoYiXy3ZkZDb60ad8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwWuMq9WXheE9ITsiU+dy53aFLfz4tKVW2kb2a+Pb6iwBE/GJj8UI9SiMHLULveRfLCijUP2hRkZboSh0h3SQaRbsTg6hM7cGxR7x8pGlXRl4Ip//VtNWlDiBTFiBCbjcvKTR/HHEWpeAmPky8xAVc0BaeKAXYU1WCDQ4LFgIA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YilIbIqi; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e2c521efddso11847055ab.3
        for <linux-rtc@vger.kernel.org>; Wed, 23 Jul 2025 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753274568; x=1753879368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0Ew/UlImyFN4HlGy+L8fhyDF3AVGX/UG84SYw3xHZQ=;
        b=YilIbIqiqcpZntXBIaozMc2Lg4RxSqeJp3EFREdAfEZa60ilM4Q+wmogslSmCfTLhr
         bQDkWK60rkRgCI4bP9TYHmSCLVNl/xtIr03kbHZn10S1aua96vedv6lb7FDTJRerqy12
         pxl03dpx7/+xYlBbhR95twtviIj8GVB2dbPXmaMYZMB2qjY4Hf0Phng5y0Its1TPLi01
         1c3fLtmMMLQcCeXLjAzL1wQYi8Zadq1yMtHmI+puh0PPfB8JdLpKaKi4niRjlnBM5yyD
         iBTrXQaLT/Qx47FbNo6+bLEXGfnXVysAZgGp0Z88I2DB+HZ1IVKsXHqJn16XPTFf9hBG
         k1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274568; x=1753879368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0Ew/UlImyFN4HlGy+L8fhyDF3AVGX/UG84SYw3xHZQ=;
        b=eoG0xsrL5xtrEPjbVYw5ao3VRMIWCD4guLpqbTJS20Ioth1GMjrQI6B433nn5qJOwD
         kxw008zdL7weA4pa2mboYW0VMRjr81UloeezEkS6wbG7VS3FIF5JWBs403WRSZe306wF
         FAQbA8wD2daU4J64OdTDIQ95GGEoPCCDwn4fsGQgKzzjbaP2oZgyvRrjLXPzzfw5pRaX
         zp0P3Sp1E4PLb3bis6HOHgNJjc0t4LYbswLO+MMYxKQXJVkUv5ukSXwrbeqaUPMAZ/q5
         bLoPbLMsIdK/IO5AiFFF66IoxvkZbmDe70uKtH0u7DjfCnYQxUgsaOchp/XEw0A1qDi/
         2l1w==
X-Forwarded-Encrypted: i=1; AJvYcCUiM6QzcScC1fxvWtEX+V3G6Ims63tYh26h/A8wpl7XH+N5uI5LHzRde7hPxF2rm2wk+6m2h5SiJHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa4STdWyPF5chLkQs829LgHQIZNMSwXiAn7un5PAZ7o1MtB9kO
	8ZOThHfJBPN+upQtYebEPhJeCWzboRaHzKwv0bF6Gkb+xnOeOj1FPHQogeNKzoO8xKo=
X-Gm-Gg: ASbGncsUOQZ6/+OL/fmry1usscOOP95rFG5iS16hCvMe8FsOt8jgzaX7dNmlIuyOgVS
	IH7X9J6hQJdMlILy0N8OGee2tjCDxtIFZvofV1MkuuqASNNqo48F6zf8POdclrrXAuSBw/T6+Py
	pFO6tVY1Mh3+rovTmvlOD2qibrHuL647Z8vzGn6cPaI6W74ZCkUEEgsTT3Q8rm1FE1L90MyULaB
	k1JdMSuRaUFaamfTqrX0AEaoswE60uM8Hicp2Bkw/x/e0HUetxTsygahDuiy33sn43aFHvzfOB0
	35/rb8CIXiR4nIizS7xSVmcAa1YwNqui8TNIx+CPA6Oj1I4q/VHgAbtieBBsmTag7HttffsxrDB
	qXT6PLSbN8xcdkMzC1f6EaSaamiY/5fWZkQ==
X-Google-Smtp-Source: AGHT+IEqaLJWveuGtuwL6xUVomxEyO/I/mq75BNTRkLodb+q0fudHO2/No8ZaCo9o8H/kGbU5GpHqw==
X-Received: by 2002:a05:6e02:1f82:b0:3df:3d1a:2e76 with SMTP id e9e14a558f8ab-3e32fc22705mr56940445ab.1.1753274568312;
        Wed, 23 Jul 2025 05:42:48 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e2982aff75sm38954785ab.54.2025.07.23.05.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:42:47 -0700 (PDT)
Message-ID: <877dcf99-107e-4d96-8790-6608976d13ca@riscstar.com>
Date: Wed, 23 Jul 2025 07:42:45 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-3-elder@riscstar.com>
 <20250723095125.GR11056@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250723095125.GR11056@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/25 4:51 AM, Lee Jones wrote:
> On Thu, 10 Jul 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register 8-bit
>> value regmap configuration.  There is an option available for a device
>> to specify a custom configuration, but no existing device uses it.
>>
>> Rather than specify a "full" regmap configuration to change only
>> the max_register value, Lee Jones suggested allowing max_register
>> to be specified in the simple_mfd_data structure.  If regmap_config
>> and max_register are both supplied, the max_register field is ignored.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v8: - Use regmap_config_8r_8v, modifying it if max_register supplied
>>
>>   drivers/mfd/simple-mfd-i2c.c | 8 ++++++--
>>   drivers/mfd/simple-mfd-i2c.h | 3 ++-
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 22159913bea03..5138aa72140b5 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -24,15 +24,16 @@
>>   
>>   #include "simple-mfd-i2c.h"
>>   
>> -static const struct regmap_config regmap_config_8r_8v = {
>> +static struct regmap_config regmap_config_8r_8v = {
>>   	.reg_bits = 8,
>>   	.val_bits = 8,
>> +	/* .max_register can be specified in simple_mfd_data */
> 
> Drop this comment please.
> 
>>   };
>>   
>>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct simple_mfd_data *simple_mfd_data;
>> -	const struct regmap_config *regmap_config;
>> +	struct regmap_config *regmap_config;
>>   	struct regmap *regmap;
>>   	int ret;
>>   
>> @@ -43,8 +44,11 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   		regmap_config = &regmap_config_8r_8v;
>>   	else
>>   		regmap_config = simple_mfd_data->regmap_config;
>> +	if (simple_mfd_data && !simple_mfd_data->regmap_config)
>> +		regmap_config->max_register = simple_mfd_data->max_register;
> 
> If max_register is set in simple_mfd_data, it should take precedence.

I don't really agree with that.  If simple_mfd_data->regmap_config
is provided, why not use the max_register field already available
there?

This is why I said above that I think this feature doesn't add
much value.  It provides a second way to specify something, but
in the end it complicates the code more than it's worth.

The only time this new simple_mfd_data->max_register field seems
to make sense is if it were the only thing provided (without
simple_mfd_data->regmap_config being supplied).  In that case,
I see the benefit--a null simple_mfd_data->regmap_config means
use regmap_config_8r_8v, and overlay it with the max_register
value.  The new max_register field avoids defining another huge
but mostly empty regmap_config structure.

Anyway, back to your original point:  I said in v7 "If both
are specified, the max_register value is ignored" and I think
that's the simplest.  Specify one or the other--if you want
to define things in regmap_config, then that's where you add
your max_register.  If you like regmap_config_8r_8v but want
to define a max_register value, just provide max_register.

If you insist, I'll do what you say but before I sent another
version I wanted to explain my reasoning.


> if (simple_mfd_data && simple_mfd_data->max_register)
> 	regmap_config->max_register = simple_mfd_data->max_register;
> 
>>   	regmap = devm_regmap_init_i2c(i2c, regmap_config);
>> +	regmap_config->max_register = 0;
> 
> Does max_register definitely have persistence over subsequent calls?

It is a global variable.  Isn't that how they work?  When
it was read-only there was no concern about that, nor about
any possible concurrent access (though I don't think multiple
probes can be using this code at once).

We could allocate a new one each time instead.

I think what I offered in v5 was acceptable.  If you're
willing to accept that I will be happy to keep discussing
(and implementing) the max_register feature.

					-Alex

> 
>>   	if (IS_ERR(regmap))
>>   		return PTR_ERR(regmap);
>>   
>> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
>> index 7cb2bdd347d97..ea2a96af8bce4 100644
>> --- a/drivers/mfd/simple-mfd-i2c.h
>> +++ b/drivers/mfd/simple-mfd-i2c.h
>> @@ -24,7 +24,8 @@
>>   #include <linux/regmap.h>
>>   
>>   struct simple_mfd_data {
>> -	const struct regmap_config *regmap_config;
>> +	struct regmap_config *regmap_config;
>> +	unsigned int max_register;	/* Ignored if regmap_config supplied */
>>   	const struct mfd_cell *mfd_cell;
>>   	size_t mfd_cell_size;
>>   };
>> -- 
>> 2.45.2
>>
> 



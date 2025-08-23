Return-Path: <linux-rtc+bounces-4744-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B392AB326E4
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Aug 2025 07:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895705C7FF5
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Aug 2025 05:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03602045B5;
	Sat, 23 Aug 2025 05:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iP7XyyXA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E0B1F4E4F;
	Sat, 23 Aug 2025 05:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755926015; cv=none; b=ooTs5sW7FFyx3kpx6ho4fCAdmVCw82t4h9VP5f8xxRXam8htRsWhF4ehQK00VRCaSoBpZckYJaPVbuxIRW7K7sh2HiIYX/KNGyphaUI4LVIGAIyMSa8/o8I9CM6Sb6QXucAhAqNUNHWrLxyeUuXV/MCNI0KdWGlttsJBE1Mf9hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755926015; c=relaxed/simple;
	bh=o4qR+yIO95vU4TXB7yOCTyPmhkgr7m4rU2/iyY06Kuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbEylAXpEwxjvI+JVmogADyJ4Gu3ZabrfggwvK61fvUcVpRBopQrbqbZqrnAOGPOSWZ2OwDl6DVfQFPMXFlny+bfJfPzIBDXSydWylYB/A+ZdICMybeNRfjD2F+OGqeBSwOCg0Mr4roq15e8pDt3sXNu16JBiK3x52VYJQvLOkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iP7XyyXA; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b49cfd967b9so85101a12.3;
        Fri, 22 Aug 2025 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755926013; x=1756530813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oaZcg39YpyHcUdKqFjifUizLNUJLVhGMD8cYB6Cwmg0=;
        b=iP7XyyXAkA0x9t0Wq3BhpY6TzzGIU1RYWf611oqPQQUWqDgZpkwDdErnoYTA3vZOTw
         7SkkSq0TfkHq7IQW4jlYuRFceZAaew2/wO6Y5dzuv8H9Wd9S2R181GhFgEWgqnabdXWp
         7q6pCmpVc5SAAHktnMXG7PNP0wv21oyudtNGOXaFK2XAmXKjQITcoPbPHeo4wER5rQ1a
         4lJ+/MTRScFmTS5ceSspiW5Gq4IgL128RpL21GP5AzyqCANHTBtHYP3jd5Jlik+APrn9
         abeqEe7Mqdf6YfC7CHt4OZP7qeBg7WS/CZn5j3HsO9qK2Fpz/FaE4cOQU2g5cyET/8FE
         wxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755926013; x=1756530813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaZcg39YpyHcUdKqFjifUizLNUJLVhGMD8cYB6Cwmg0=;
        b=EOenPJairTMmzYj6RfKTFdmo75mr+CP3LQhZ8sV+ntuph/lZk72CNbHN6qlc+r1pP7
         hGZrJacxiDlGBxAA3RnSYg5TYT3gDdATa7xV7nXPk1u2WB7a4PxMIHSGiWbRsMS6Rdu2
         5TgUqk/0GAXZcsVcX7Yyxt+rRKy2gWKiwuuLHrUBk6aFLxSlVd+LqulRFtaJKL0PPE6U
         fNy1UoWeTPRGpRqrd3TK72k8ERgD/URcvE1BQM0/rr4o8y6qj1ZCZejdpPOCxRv5gAqj
         e2XEjHjVzNMb5mj9gwrMTjDghCltxe/NR6iG7hdhrkeIm1iVX7Gsq5yU8BrrzhNn9wVb
         vp1g==
X-Forwarded-Encrypted: i=1; AJvYcCVzGjS4Crm+QY/55H+LrLE7E+3ARjhR6ri+j77U0+qQ3aPh0OaXideG19cbeVTm3YWqHllemZMJvB1sluiA@vger.kernel.org, AJvYcCW+hXTa7ueofyQGm7B6wzEgeQZdBICvQxQsrheM3f8FBPfB80Mhg6B7cifRCXVtQs0ruL9ySJme/lGwPx0=@vger.kernel.org, AJvYcCW24D0rmwPPQMDpdsZGxuNK4WE20M7wgTLVeBPD68qwbjZsD1ADAG74V+shx0O2dGzMWu/Dkubbexu1@vger.kernel.org, AJvYcCWSPG7iKMdftIdtUS891xJ+ERR0viqi6f4ZK5WSjiGi4U3zz+YhGgvMrT9vGnrONSQ/asmT7d4u/4b7cfc=@vger.kernel.org, AJvYcCXQgS0GtlljCxb4r9dNXsxiEgPt+o641iRAK3DTrNqBExACmiqI37QULcBbcbFTAxicuSqb7GNbgxya@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/bLM0gsxionLs5OheFDWZqPIcShrpOnqs2FBALj3qWc5g1oe
	sAW7wrhnEPcrOk4D5A8NIbi3hcsMaqFk1T8NKUskYeASqBDaT7nJB/SCvbhYtw==
X-Gm-Gg: ASbGncsJ5YFJMBo7RLYPpvIVz3aLMsQ+TUa1gODUXUCTjpPwrW4mOjPcd7W2Ugdd5t6
	rNB7zGj02SjdLpLxOVEqBHKw7wv3BolBMHTFbTMvx9uUwvNadEU4rWSHtXmrAF2kRAlj7rQlpUi
	CWchBqtkX5S3dmol0YR94PFB4U0GSV4vA+SrflMQcUCMqi7gwbCRcXyNLQ2Y2/HnL/2CQmRQDj7
	XgewDP6YWEkjeqk5IjwvLrQkDARnl+nrFJM7WXipSdD7mSbEcKMUY31uruyyIoK/OjA9cmydUk2
	TP06DnbIfC80ZuWUQBXxOAbLqQ3o6Hd7psLesFqn+Rw8bFKQiH7/AC42bfKRnz+V+S9Z1+eUOP7
	dLoLCE+hBrmBItjlsyi7JmaKMSNGErbHxbyXSsqtgfvAJ+Ou/MTjqr4A76h+gZfF002gG0hADW9
	ctD5E2dw==
X-Google-Smtp-Source: AGHT+IGu/5kI4ubQtYHPYeTFeMmZ5BU9w4ewNepAWhcOc56b0ak2Ul5v+eBjgv4TH/lm8sl6SH5vIg==
X-Received: by 2002:a17:902:cec2:b0:246:163b:3bcf with SMTP id d9443c01a7336-2462efd9a6cmr60223085ad.55.1755926013089;
        Fri, 22 Aug 2025 22:13:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668880bfbsm11992445ad.129.2025.08.22.22.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 22:13:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <23146b25-5fac-4392-80d2-4090cb2121aa@roeck-us.net>
Date: Fri, 22 Aug 2025 22:13:30 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] hwmon: Add Apple Silicon SMC hwmon driver
To: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
 <56e1f496-a4c7-46a5-bd74-0412c1fd7207@roeck-us.net>
 <5792171.kQq0lBPeGt@setsuna>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5792171.kQq0lBPeGt@setsuna>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/22/25 20:33, James Calligeros wrote:
> Hi Guenter,
> 
> On Wednesday, 20 August 2025 2:02:58 am Australian Eastern Standard Time Guenter Roeck wrote:
>> On 8/19/25 04:47, James Calligeros wrote:
>>> +/*
>>> + * Many sensors report their data as IEEE-754 floats. No other SMC
>>> function uses + * them.
>>> + */
>>> +static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key
>>> key, +					int *p, int scale)
>>> +{
>>> +	u32 fval;
>>> +	u64 val;
>>> +	int ret, exp;
>>> +
>>> +	ret = apple_smc_read_u32(smc, key, &fval);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	val = ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
>>> +	exp = ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
>>> +	if (scale < 0) {
>>> +		val <<= 32;
>>> +		exp -= 32;
>>> +		val /= -scale;
>>
>> I am quiter sure that this doesn't compile on 32 bit builds.
>>
> I don't see why not. We're not doing any 64-bit math on pointers, so we should

Odd (and wrong) answer. What do pointers have to do with 64-bit math ? Nothing.
val is a 64-bit variable, so "val /= -scale" is a 64-bit math operation.

> be safe here. Regardless, this driver depends on MFD_MACSMC, which depends on
> ARCH_APPLE, which is an ARM64 platform, so this driver shouldn't be compiled
> during a 32-bit build anyway.

Right answer.

> 
> 
>>> +
>>> +	ret = of_property_read_string(fan_node, "apple,key-id", &now);
>>> +	if (ret) {
>>> +		dev_err(dev, "apple,key-id not found in fan node!");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ret = macsmc_hwmon_parse_key(dev, smc, &fan->now, now);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (!of_property_read_string(fan_node, "label", &label))
>>> +		strscpy_pad(fan->label, label, sizeof(fan->label));
>>> +	else
>>> +		strscpy_pad(fan->label, now, sizeof(fan->label));
>>> +
>>> +	fan->attrs = HWMON_F_LABEL | HWMON_F_INPUT;
>>> +
>>> +	ret = of_property_read_string(fan_node, "apple,fan-minimum", &min);
>>> +	if (ret)
>>> +		dev_warn(dev, "No minimum fan speed key for %s", fan->label);
>>> +	else {
>>> +		if (!macsmc_hwmon_parse_key(dev, smc, &fan->min, min))
>>> +			fan->attrs |= HWMON_F_MIN;
>>
>> Above the error from macsmc_hwmon_parse_key() results in an abort,
>> here the error is logged in the function and ignored.
>>
>> Either it is an error or it isn't. Ignoring errors is not acceptable.
>> Dumping error messages and ignoring the error is even less acceptable.
>>
> The only strictly required key for fan speed monitoring is apple,key-id,
> which is why it is the only one that causes an early return when parsing
> it fails. If we don't have keys in the DT for min, max, target and mode,
> then all that means is we can't enable manual fan speed control. I don't
> see how making a failure to read these keys non-blocking is unacceptable
> in this context. If this is about the dev_err print in parse_key, then
> I can just get rid of that and have the parse_key callers do it when it's
> actually a blocking error.

dev_err -> it is an error. Don't ignore it. If some of the properties are
optional, they should be defined as such in the devicetree description,
there should be neither an error nor a warning message. Plus, the above
should be explained in a comment so future developers do not wonder and
don't add error handling.

Guenter



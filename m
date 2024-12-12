Return-Path: <linux-rtc+bounces-2726-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 468BA9EE643
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 13:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B73188150B
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 12:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A983211A1E;
	Thu, 12 Dec 2024 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="uRPDkI/O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8121325C
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734005081; cv=none; b=c5+3Ro7ZvwKkOtWuyNagd8vgiMJ5V9prSb0Gr+okr/422qao8BDXirgcLN9sq0uyYNxJpVMHtlttTmHkOdeZ1Ea6h7Ddi+aokY1y00zIGBa6sHq7VBI6J6RX9gacSExG7VKNbph9OVEJi5iV0IV+TaUQDbjWTeuIFumjWX6YR6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734005081; c=relaxed/simple;
	bh=9G8iePo8AafUusbtZFL6G/hXhzf+LFxoYV+n+GwJj+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DD3bC0XIjV8zoSaiBWHiruDH8F3VqnkQh/4M3ILeEhJWfpTtB2qxCs72gYCR8AB/OoDmVppv8UHF6MN2IB1KEZJuNvRaO3qymHyp4DXG24k9sunvshrxkDvCOWXJoEzGbF9cZV4Bt3QsV1cjmzgBvs6ZlNls1ZfDJYUSW4RLvb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=uRPDkI/O; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725dac69699so450188b3a.0
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734005078; x=1734609878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J37MSOXclxTJrKdN9FlTWGLGv37gbiG5YvDFXNU8tnA=;
        b=uRPDkI/OZET9WAh0KfeKT2C94JJIdjE2CvxxohqlnFQufwr67uQSpYxTF+9wHI6sAj
         C2OgKiPKkt8kANf8W8nI0XWAQfp95S14FhscP5eTjd2iE7iy5OJ6yYMBxW+9RlfzqhI3
         6sIiHMjValmfndjMrml97vkYPf9rtFxl3pIf+yLcMGHqU/tNyjlH74rENyF7Ty9qOdNG
         YnEsIGwWosaRFngW206ENL0pzNn7nTfvwYxpVsNjb2zOtuwFeoz1E3ckVXFmHe7d24VK
         b8y+JorG5TbEtds4NVoEkRUC/Oj0QnsDWKvjnDSEKhVUkhRsvbtl9k2kEd4b6GxuqL9F
         kX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005078; x=1734609878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J37MSOXclxTJrKdN9FlTWGLGv37gbiG5YvDFXNU8tnA=;
        b=A/4kSmKiH/pMr5tL09zffbmiIP490z3GS+Mn3wKSr+Df2FrdhO0lSlnuYtajEsdbx3
         sBOS2RhOP60ZEpzH+S8ggHOVV4tKAj5QIWz8y2Lb6+4howlmvGcZpom3iL7MkdXHzuGy
         ocfB8f7XGD1QxBvLRpTsCyxi9zt2St2LaJtSZFApabHU3XgZ4k+loqx2gbCn4IZTBHUr
         lUBAxn4QlTAoaj2W+cBu89PqpII9DVZbUQLmU6PVWt1Xw/ggzqUJglX4zJGrMQcMlL7E
         caXEsWlD4k0PCcKarWTJt6lqUl3kdOC8A6V+lp7F7U0XzPRd0KS1ROWuZRyPm5D41Ky/
         QcYw==
X-Forwarded-Encrypted: i=1; AJvYcCVC1s4ahQtJ64L4tEWKdZ9ZYWihPEf8f/2quZCG1VHm5KTsNSTyOLniRvzEyOVNBYuat5VVn8Lu004=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbaJ49ka+nbByzm16sm0TgVsN0EEPSDFk8jNYCnp04F/Q2xq5F
	VJ2GCpDzDTzYHYEFb+aB3B0+IFHA9NNhD6UcZOs3hRgPwp6yb/ZGZqxDoIphk6M=
X-Gm-Gg: ASbGncty5Xy3A/jfzYqxsyl8QDu2uVxjoyEFOQHfwVXu5QzzFH2u0wsUmQWcz34XHqF
	QBg60zK+rA4Uttr1IGilpfJAfj1O3U4xs7vtXFr/FXL0gFquX8g6Kg2I70Juq1kDHCLEg7HN9qe
	xfo8JcD1q/XD/mCr7Phs4qApgYgj2gDqNFOKM8CKlosx6lwifPKRxlISk4rmmQujQK6bspJekW0
	hz+OXQcwL+eofbAHHVKxlIPhYGDUcZ/wluheKnvhtlfC7okiM+tl/WNHfUhcjYQR+Y9ajH0yisJ
	aOPdZlfKLoYXzyxsCJnxcrWE/Vm/VI6u6w==
X-Google-Smtp-Source: AGHT+IH6G/fANT3NRmVi3yTTGsoC9Dxi67/rChPKs3WfcRK8jQkodDEFnp24U/MhAjpm6rLE8c1P/w==
X-Received: by 2002:a17:90b:5112:b0:2ee:ba0c:1718 with SMTP id 98e67ed59e1d1-2f1280effe4mr10568749a91.37.1734005078224;
        Thu, 12 Dec 2024 04:04:38 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0f058sm1171653a91.42.2024.12.12.04.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 04:04:37 -0800 (PST)
Message-ID: <4048aa2a-8499-413c-a3d1-fe3e96e843ba@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 12 Dec 2024 21:04:34 +0900
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rtc: bd70528: enable the device's wakeup in the last
 step of .probe()
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: mazziesaccount@gmail.com, linux-rtc@vger.kernel.org
References: <20241212100403.3799667-1-joe@pf.is.s.u-tokyo.ac.jp>
 <20241212103459276170c1@mail.local>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20241212103459276170c1@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexandre,

Thank you for your review.

On 12/12/24 19:34, Alexandre Belloni wrote:
> On 12/12/2024 19:04:03+0900, Joe Hattori wrote:
>> Current code leaves the device's wakeup enabled in the error path of
>> .probe(), which results in a memory leak. Call device_init_wakeup() as
>> the last step in the .probe() to avoid this leak.
> 
> Do you have more info on where the memory is allocated?

device_wakeup_enable() calls wakeup_source_register(), which allocates 
struct wakeup_source. Also, when the device is already registered, 
wakeup_source_sysfs_add() is called to allocate and register a child 
device through wakeup_source_device_create(). If this information needs 
to be in the commit message, please let me know and I will include it in 
the V4 patch.

> 
> Coudln't we have a devm_ version of device_init_wakeup instead?

Yes, I think it is possible. However, for this patch, calling 
device_init_wakeup() at the end of the .probe() would suffice, and I 
think implementing the devm_ function should be in a different patch. 
Please let me know if you think otherwise.

> 
>>
>> This bug was found by an experimental static analysis tool that I am
>> developing.
>>
>> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>> Changes in V2:
>> - Move the device_init_wakeup() to the last step of the .probe() to make
>>    the cleanup simpler.
>> ---
>>   drivers/rtc/rtc-bd70528.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
>> index 954ac4ef53e8..d5cc4993f918 100644
>> --- a/drivers/rtc/rtc-bd70528.c
>> +++ b/drivers/rtc/rtc-bd70528.c
>> @@ -312,9 +312,6 @@ static int bd70528_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> -	device_set_wakeup_capable(&pdev->dev, true);
>> -	device_wakeup_enable(&pdev->dev);
>> -
>>   	rtc = devm_rtc_allocate_device(&pdev->dev);
>>   	if (IS_ERR(rtc)) {
>>   		dev_err(&pdev->dev, "RTC device creation failed\n");
>> @@ -331,7 +328,12 @@ static int bd70528_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	return devm_rtc_register_device(rtc);
>> +	ret = devm_rtc_register_device(rtc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	device_init_wakeup(&pdev->dev, true);
>> +	return 0;
>>   }
>>   
>>   static const struct platform_device_id bd718x7_rtc_id[] = {
>> -- 
>> 2.34.1
>>
> 

Best,
Joe


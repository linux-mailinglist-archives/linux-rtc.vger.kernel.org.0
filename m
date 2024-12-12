Return-Path: <linux-rtc+bounces-2721-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3D9EE39E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 11:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B4AD1888DF8
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 10:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A199A21018D;
	Thu, 12 Dec 2024 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="bgd6D6qo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E312C20E32D
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997845; cv=none; b=RV2SeEXYX/kVspFEY0CBjfqXideZ9/ahNiDQND2cM7WcHCqrAC5mpkunfMcR5cg+s4FQn3DygrDfoNA6WwQiFQ8wF56zp/P65x8VJhIj8/4dcdjAUFpOZ7TSk9y6ZD5jVyvtONIzYZpfR0nAxpRxD3l+L5NnCQjBfNzePk1LfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997845; c=relaxed/simple;
	bh=YISInPXzHZgw/QlBRc6hHH3TkQ2a+CikhSeASjDdqnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmyzZlbTKHF3/HYPnnwwzyNqJQCVpzuOPZLz2nQJ1AtnJUokh9Txy3mys/yZMLlZOg/SXMGgfrT1GCf3Qo5K73gvrE4ZhtHpTphGHxTvy9cUn0sCmJzUvYPIv7WB49rmgowv2S9+wnaxSzpeIWNYyjUH7VpGem9ORoc/uAKCdJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=bgd6D6qo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163bd70069so4154595ad.0
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733997843; x=1734602643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZH7AbOYepyeNI86btjlg27H73bjFqk64Ig5YmnJwPN8=;
        b=bgd6D6qoXv2bkHq9hhCA6n7s8595uTgV1DivLkRGng2Dzw3+wYc2h3POIh95pghrf0
         R9BL499/JqXyv8X9byegcGPFVcqoyReMY6SMza0fJtZ5UzV7zy6nklo/TFy/sIG2+Nfj
         l7L5C5FvfWRw8auyanxTqKkhom5R258qeLvNIxN1DFt7oterfWBHHzz5c4h0HNWGYtzR
         GsFinbbU5fIr3hwCWlXyDaDIsEzMsKIggdmIRtKbNWJ1FcyO3yIS/CWXC+/IkyBlFxjt
         NdjUjhpp0LClQIlRaQF7UHx8gG6U4vEDhghdX5XuPTJokjzZrXxb8v4MA9ATCSbdTABG
         0ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997843; x=1734602643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH7AbOYepyeNI86btjlg27H73bjFqk64Ig5YmnJwPN8=;
        b=YYpsCPyaWQU+BkeHbCNZUXNSY6VNTEECdEkmAJpoxf8/V6RcaxsdBqmGkYcyzZrRI+
         QCigdJ9bb0w8IPaQgBIk0Kg+9X73XlsMVw17pywgXjcx0/crIbrG4V2Fo5X1WV8t5VIS
         vXvtrWzFXqHs0enWibiwyza5ziqjChQg0LkjdtdMdbRvatOIezbOirYHSmkb7znLdqpK
         S4i5tuGS2oKwBDHcoFOn0hAqMMQxL2EshsNKYXLyBc7GDW8hwYWLvzr00pQ0CQ6dizb7
         s3hN2qDA1dRfvje5n/BVCCxOgm4GrZFYQ+GLx0zR2KlGsmlbrAgGI2Pnu27yQZTJe3KT
         zC9g==
X-Gm-Message-State: AOJu0Yyirh+wezezo+TVmiRrKIn+TfjqqThiTgZXryuqoGwha19q6Eb+
	akt4Cnx8BRG5vW77iwV9oKzsZgj38Zq4gJh+ia/FBiyjKx7Os8/jneaHZt5IetI=
X-Gm-Gg: ASbGncuIxFadEf+H5TnnRJhDIHCPIOaCN1om9uj64PVPqkM3OUXM9zjKLeyKY3AYNxy
	WueDIdoaAcI2Io678JGqesVPVzq79TurZLOgPmLe7uTrjhRqCoa7AZNxFIJESsfVsUozzt4NhSv
	hmBS5ZK2PNMnjbxrEqShyzqamLjxIG8+d1jxwgX0+HlfbFKGo+xz1DSpYvoLdlxH6wK++3QKSSH
	kJMaW03VUjv7BW1xhaum5VKcVG/fl8B34SuzFNqTerWhAmvVlGaSGvTvhsWSVVoXFpECfa9YFrK
	HGQDCJHnS8qeFstIYlXLIYfSuu15VaKC77SD
X-Google-Smtp-Source: AGHT+IHuuZxrVGXUOcLgBKwI1GXPOnKNG86FpFZru5rak/uiYkBEm0Va0bdCqixAJ/J7CwsaGAdQdg==
X-Received: by 2002:a17:902:dac4:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-2177851f55dmr99180165ad.5.1733997843145;
        Thu, 12 Dec 2024 02:04:03 -0800 (PST)
Received: from ?IPV6:2001:f70:39c0:3a00:b741:6a01:f624:e219? ([2001:f70:39c0:3a00:b741:6a01:f624:e219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163872e46esm77226085ad.238.2024.12.12.02.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 02:04:02 -0800 (PST)
Message-ID: <4670b2d4-a5b3-4bed-bc6b-f617d2e3803d@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 12 Dec 2024 19:03:59 +0900
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: bd70528: disable wakeup in the error path of
 .probe()
To: Matti Vaittinen <mazziesaccount@gmail.com>, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <20241212015121.3410941-1-joe@pf.is.s.u-tokyo.ac.jp>
 <e716f993-b92b-4060-b0a0-3cec4d1c8169@gmail.com>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <e716f993-b92b-4060-b0a0-3cec4d1c8169@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matti,

Thank you for your review.

On 12/12/24 18:20, Matti Vaittinen wrote:
> Hi Joe,
> 
> Thanks for the patch :)
> 
> On 12/12/2024 03:51, Joe Hattori wrote:
>> Current code leaves the device's wakeup enabled in the error path of
>> .probe(), which results in a memory leak. Therefore, add the
>> device_init_wakeup(&device->dev, false) calls before returning an error.
>>
>> This bug was found by an experimental static analysis tool that I am
>> developing.
>>
>> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 
>> RTC")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>>   drivers/rtc/rtc-bd70528.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
>> index 954ac4ef53e8..50059f7ba6d0 100644
>> --- a/drivers/rtc/rtc-bd70528.c
>> +++ b/drivers/rtc/rtc-bd70528.c
>> @@ -312,12 +312,12 @@ static int bd70528_probe(struct platform_device 
>> *pdev)
>>           }
>>       }
>> -    device_set_wakeup_capable(&pdev->dev, true);
>> -    device_wakeup_enable(&pdev->dev);
>> +    device_init_wakeup(&pdev->dev, true);
> 
> Is there a reason to do this prior rtc-device allocation/registration?
> If not, then the flow would be cleaner if this was done as the last step 
> in probe() because we could omit the clean-up.

Enabling the device's wakeup in the last step makes much more sense. 
Applied to the V2 patch.
> 
>>       rtc = devm_rtc_allocate_device(&pdev->dev);
>>       if (IS_ERR(rtc)) {
>>           dev_err(&pdev->dev, "RTC device creation failed\n");
>> +        device_init_wakeup(&pdev->dev, false);
>>           return PTR_ERR(rtc);
>>       }
>> @@ -328,10 +328,15 @@ static int bd70528_probe(struct platform_device 
>> *pdev)
>>       /* Request alarm IRQ prior to registerig the RTC */
>>       ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, &alm_hndlr,
>>                       IRQF_ONESHOT, "bd70528-rtc", rtc);
>> -    if (ret)
>> +    if (ret) {
>> +        device_init_wakeup(&pdev->dev, false);
>>           return ret;
>> +    }
>> -    return devm_rtc_register_device(rtc);
>> +    ret = devm_rtc_register_device(rtc);
>> +    if (ret)
>> +        device_init_wakeup(&pdev->dev, false);
>> +    return ret;
>>   }
>>   static const struct platform_device_id bd718x7_rtc_id[] = {
> 
> Yours,
>      -- Matti
> 

Best,
Joe


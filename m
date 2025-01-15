Return-Path: <linux-rtc+bounces-2926-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF7A12943
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jan 2025 17:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41C2F164ECD
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jan 2025 16:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652501791F4;
	Wed, 15 Jan 2025 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ND+Cm+vr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212E15B14B
	for <linux-rtc@vger.kernel.org>; Wed, 15 Jan 2025 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960195; cv=none; b=HBFT/qXFppA9PI9KzetTUB14a/Pce1XnVEtgnMSc3Q5L862XGLE+TUuqoFO26JncqlVd4k0zYr27BoRfiWE27JXqtvZUfYEw0OIeGgsrqXTfOuZNibkL/9Cw2EysAackhggSxkBaxGCGo+SH1EzNWqZuoKbY2Q1laXoLj09y1xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960195; c=relaxed/simple;
	bh=G7gN6czFhfdVDQ2Qtd29EEnSbxaI1WheJu6BS2CoUfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S19sbAUM/rKMq+TXQPuDgdJ9O4ZxgG8yOJUJGrOKMIYG9vwmvvvxhNP7WGrj4pCFJ+GQoEJlDO+esr0ITGWs3l3l4crVqkrYQZbGCyFHTAxTn0C4Gn07l7Xx15KVPnaWRURHRgybORacXALl2NCkcj9NXxO4LCZ1m+dxzJgGLmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ND+Cm+vr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so8807715e9.3
        for <linux-rtc@vger.kernel.org>; Wed, 15 Jan 2025 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736960192; x=1737564992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rXbEAizqUTZVuiKMmXI2f5b0xWse2rfqahkj0NXB3Bg=;
        b=ND+Cm+vrpPK2+O/ga3KIbP1RRvf8uFMy0L75CCwV/iwZuA1CmEmCiJl8c92yYByGUp
         virO9oR4fEPFslYvwj/tQuGN9uNl9X+A/41zXo3QQfrM18gpDQBfCf+dU6ev2PPTwLWN
         MwoI+r87RiH3W7Ldm/VnWM15/pVNdg35DKtkBzeSre/0nNRIJusShE9DzFsd8u41ubxg
         GkOukPwLgRHiqJik2RzH7jyqG4xdgvvA9471mE+pLO0feaCsvbJgVGyeiVMCU2A10u2/
         /xLHdR5w8LhnuuMMAR4guBa9m/hU8/k1kAAVm/UuO+XCOHLst2sa4XwxiChuzj1g9TF/
         u/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736960192; x=1737564992;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXbEAizqUTZVuiKMmXI2f5b0xWse2rfqahkj0NXB3Bg=;
        b=i07u2mHzE2yMfjGmPqBdY0GmJi4gw2BwDQYKEgVuI0o4FtOrW8ZpzkNruRJBX/8Wmk
         W8GUf7B2/i6LBh8OFamBJHb73RA0PB/Si/Xcqr8q+GpE0H/iWdJI4QTh+R8qkXcCimvh
         8T1pAyutzE10fvOBNuHfs0VgUKGKxBCUopqjG8iSjE1E6/b7FYDbCsEuWMibvHEOD1SN
         Qxzp3Y+pPK2a0Wh7YZs20LDCNVFOnhj4xB55b00CTYkU/OTMifZzp9jt8phnxEfTDrnj
         OJTk0wP0u0mfZKVPZvLwdvvXcaAxyJ2Mycq9rmb9AIngRE4fpjLH6FTidZFhQoLVNb3e
         Kv8g==
X-Forwarded-Encrypted: i=1; AJvYcCXQAtN+VX5AiPGKnWIE5S2puYrnFzWZM8h2qni6I5GPeXqutq07pVhQDuJaoex5+p9689fIwLN2bbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rAYbal9zCaK35fsFeKXqgltMxBXenFmcKIhykpJOy4lFMHeB
	VkyDh1+2x+t3qvjPfv+OyI5bH4wISq7ePMrGVjV70HG/G/DgEcpnCr0OPt+OKDE=
X-Gm-Gg: ASbGncuIrSg0sJNNsZZQzc0uNh+DN1EgY/Dq50JKY5Pq2K7ZbyCR5CPUNzZGBzLiziM
	91A+aYSurkpwJr1nwIgLim8YiAVwpO+nsPUznfyeaNzfHF5Mv8Lia7c6xplHjWVQTFnSScseHu8
	UTEQ1ukeuzP9OSfrnEHnQ4S8jkr+7a26ZUlOn7bduM2o3Vun5po/ZNvd00zH6tpF2Lxjc+7rnwF
	0Zd16E4JqwS6HJV4RSKBL/aW5oAZpHx9X0bp1BGYRuQf5ur1PnlsZKTHREDWzgrnZEPT0CyG5Ak
X-Google-Smtp-Source: AGHT+IGwicwetGUijtzDTGRfb/TOLnPoZiMKKj/JyRkm5goIVswOyx9tIDQ25q8nW4vkAV3O6qjxbA==
X-Received: by 2002:a05:600c:3b83:b0:434:f586:7535 with SMTP id 5b1f17b1804b1-436e256093dmr107352995e9.0.1736960191852;
        Wed, 15 Jan 2025 08:56:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c5817sm29082365e9.19.2025.01.15.08.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 08:56:31 -0800 (PST)
Message-ID: <8976e64c-34aa-47ca-9d5c-81cb06392621@linaro.org>
Date: Wed, 15 Jan 2025 17:56:29 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: Use str_enable_disable-like helpers
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Joshua Kinard <kumba@gentoo.org>,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250114203623.1013555-1-krzysztof.kozlowski@linaro.org>
 <20250115162923ddf1d821@mail.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250115162923ddf1d821@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 17:29, Alexandre Belloni wrote:
>>  /*
>> @@ -252,7 +253,7 @@ static int at91_rtc_proc(struct device *dev, struct seq_file *seq)
>>  	u32 mr = rtt_readl(rtc, MR);
>>  
>>  	seq_printf(seq, "update_IRQ\t: %s\n",
>> -		   (mr & AT91_RTT_RTTINCIEN) ? "yes" : "no");
>> +		   str_yes_no(mr & AT91_RTT_RTTINCIEN));
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
>> index 78f2ce12c75a..1f556cdd778f 100644
>> --- a/drivers/rtc/rtc-cmos.c
>> +++ b/drivers/rtc/rtc-cmos.c
>> @@ -32,6 +32,7 @@
>>  #include <linux/init.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/spinlock.h>
>> +#include <linux/string_choices.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/log2.h>
>>  #include <linux/pm.h>
>> @@ -604,12 +605,12 @@ static int cmos_procfs(struct device *dev, struct seq_file *seq)
>>  		   "DST_enable\t: %s\n"
>>  		   "periodic_freq\t: %d\n"
>>  		   "batt_status\t: %s\n",
>> -		   (rtc_control & RTC_PIE) ? "yes" : "no",
>> -		   (rtc_control & RTC_UIE) ? "yes" : "no",
>> -		   use_hpet_alarm() ? "yes" : "no",
>> +		   str_yes_no(rtc_control & RTC_PIE),
>> +		   str_yes_no(rtc_control & RTC_UIE),
>> +		   str_yes_no(use_hpet_alarm()),
>>  		   // (rtc_control & RTC_SQWE) ? "yes" : "no",
>>  		   (rtc_control & RTC_DM_BINARY) ? "no" : "yes",
> 
> I guess you missed those two.


Yeah, indeed.

> However, I'm in favor of ripping the whole procfs out of the kernel
> 
I can send changing these two or skipping procfs parts entirely.

Best regards,
Krzysztof


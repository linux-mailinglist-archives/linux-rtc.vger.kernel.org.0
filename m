Return-Path: <linux-rtc+bounces-2731-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2220C9F1C11
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2024 03:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37BE01626EB
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2024 02:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770B81401B;
	Sat, 14 Dec 2024 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="ZYZ4vEbn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0EC1C36
	for <linux-rtc@vger.kernel.org>; Sat, 14 Dec 2024 02:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734142744; cv=none; b=oZ+bgc+QcUn+6rkqIQxODzc70a1dUOf++n/K7QHjt2H/3SJuu9sBBi69+qKpsFEC/Te+mi6e8TFS43xF6TUEqlhK32UPz100UxMEudIZaTA8GdHCzbOE9nAL3M2dPltCS+oHAkhk+dLGlBPUwURNWOIQiDrS+x/1fzxmwKQ6f1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734142744; c=relaxed/simple;
	bh=G81lWnTL/fqgxJBaDFG2RNCyMhCEWkjCh/orO38xJiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2/k/W9g/dX4I5RiPaWl7tnVq9HZwEF/Ss+xOLbE7aQRsMy1SZdPLoZUTZ4vteNEtDmnbQTC9d9I0+ttjgVHgJ4xwDPE2VXWeyVtSPPVBtgG0hOFfEabOdGlOGjHwcX30ZF+9YrmFEPAks448ycODdSv2krUYwQH5US8I4VVJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=ZYZ4vEbn; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7265c18d79bso2717171b3a.3
        for <linux-rtc@vger.kernel.org>; Fri, 13 Dec 2024 18:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734142742; x=1734747542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gGf4huSmMlZZD9Vl7VRiacr+1I+or8utaPGGOof3pg=;
        b=ZYZ4vEbnAS6tMVdZW+ncH8F+dPNNFR8V/vzkJZrBvPTxUWtiyNe1CK9cxKcqX3VGqi
         wBI1RTvP/01l92PUzvQVoSso4QnGC+gaBJBItO9Im6HOJzA8kzVwPqFxxd/xK2e4lRil
         pc2W3hPJTfl61QS+iH3pvMpk7rHveyRUMe76bcZ5q30lVnNjSekh4FMH+MdFYyg7kodA
         PHol3cY4kivYoGzKdgx4QREUZ++RNK/0wAHD5YWuMHFwma5Ni7Dd2txRjk8VMEctQB5Y
         Gu0SaUAOmfIbTNv6eOWRFLK3vDIp7ZRA0xJt9zwROFVqsHeaoMPiROy3httgo88SkrY9
         jNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734142742; x=1734747542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gGf4huSmMlZZD9Vl7VRiacr+1I+or8utaPGGOof3pg=;
        b=dnZP8IHsYkiOCYwSS+fKsAq8vNJ0d7f99blpW6DE7lMO1TVUc/Yu5KwuYEYMbSs/qU
         TvyD5waUKNI48L7DM3n+7VoTORC2l3qbeqn4VGkCfgZqCDN1Ouqi0KZ/7RRGlNdeRc1S
         pOQNsASu3lL2WUpxLPduRaSs9v3FNPRBnW+8iAmRd0YgoQBd7N60E7sQPGCpOMlv3JIH
         b+H/rRHS2kc4IgJQTmMRBTkRwg+RO171LQyCOnjwoaBc56nBhbnsIMnx6apyErJZ1yWI
         YqnhUEm4yORm4ww3xTlzuBBd1G+jyWXM3rnAhrpa+cFxHhP7EAsdWOyu7q7XYeeb7em3
         crvw==
X-Forwarded-Encrypted: i=1; AJvYcCWCvic/x3iA8E4Ys33TGSYgf2L71BJA8AOfu8F4f4Tdwq6WWC457twjAPNILtUOWSkearpMY00dXTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEq+slwmr0gcI/kjy3vTiVnDvRvd++ZufiBFiuZtkjXORSJc4F
	sAi5hf9OX5IGdjWFRMAb7OxzT1mUZum3RjmMqNnRGoB+7oghsajsP9N2ehGlrJw=
X-Gm-Gg: ASbGncsFPMDPj+tWdFOTFzrBczEJB+sbsJ483+oeKNLoPa5ocss9Jd8Le2t9harD+RT
	RMGuqlq4v/+CPs78G2ZlxicafyGj0Dhvu5IcjjD9TS31AJKSpzGb6CeLA14HpdlHSmjqx9bvghA
	dsGRY9TsLah691q7FzxmDqN2CGUJ9eMcwsvsu8fNgta9RDDYPUYmYM53HASrtkFTVAwkPjtP5M1
	JK6UTTr0sdGjmXt9Le6Uev+wLUbETomtYvCuO6+hwjET4Bz/3NXB7rpVkb3oILtZnmD8Zlwowb1
	8Cg4cbpqBmdakgHaanaqDsyZYLPN7JAuJw==
X-Google-Smtp-Source: AGHT+IGj3Fd+1UvBVZA8FdR+Fr96z8/T2orGkCaRWBJsgATfOSENtRiwggbQb8kzsgdm1O4QD5qQmg==
X-Received: by 2002:a05:6a00:4f89:b0:725:eb85:f7ef with SMTP id d2e1a72fcca58-7290c1b290bmr7219666b3a.14.1734142741818;
        Fri, 13 Dec 2024 18:19:01 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad58f6sm473355b3a.44.2024.12.13.18.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 18:19:01 -0800 (PST)
Message-ID: <a88475b6-08bf-4c7c-ad63-efd1f29307e3@pf.is.s.u-tokyo.ac.jp>
Date: Sat, 14 Dec 2024 11:18:58 +0900
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
 <4048aa2a-8499-413c-a3d1-fe3e96e843ba@pf.is.s.u-tokyo.ac.jp>
 <20241212175224644ee3a4@mail.local>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20241212175224644ee3a4@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexandre,

On 12/13/24 02:52, Alexandre Belloni wrote:
> On 12/12/2024 21:04:34+0900, Joe Hattori wrote:
>> Hi Alexandre,
>>
>> Thank you for your review.
>>
>> On 12/12/24 19:34, Alexandre Belloni wrote:
>>> On 12/12/2024 19:04:03+0900, Joe Hattori wrote:
>>>> Current code leaves the device's wakeup enabled in the error path of
>>>> .probe(), which results in a memory leak. Call device_init_wakeup() as
>>>> the last step in the .probe() to avoid this leak.
>>>
>>> Do you have more info on where the memory is allocated?
>>
>> device_wakeup_enable() calls wakeup_source_register(), which allocates
>> struct wakeup_source. Also, when the device is already registered,
>> wakeup_source_sysfs_add() is called to allocate and register a child device
>> through wakeup_source_device_create(). If this information needs to be in
>> the commit message, please let me know and I will include it in the V4
>> patch.
>>
>>>
>>> Coudln't we have a devm_ version of device_init_wakeup instead?
>>
>> Yes, I think it is possible. However, for this patch, calling
>> device_init_wakeup() at the end of the .probe() would suffice, and I think
>> implementing the devm_ function should be in a different patch. Please let
>> me know if you think otherwise.
> 
> Well, if I'm going to receive 30 or so patches to fix this, I would
> prefer moving to a better API at once.

Makes sense. Just sent a patch to add the devm_ version of 
device_init_wakeup(dev, true). I CC'd you so please take a look. I also 
tagged you in the "Suggested-by" tag, so please let me know if you have 
any concerns.

https://lore.kernel.org/linux-pm/20241214021652.3432500-1-joe@pf.is.s.u-tokyo.ac.jp/T/#u

> 
>>
>>>
>>>>
>>>> This bug was found by an experimental static analysis tool that I am
>>>> developing.
>>>>
>>>> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
>>>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>>>> ---
>>>> Changes in V2:
>>>> - Move the device_init_wakeup() to the last step of the .probe() to make
>>>>     the cleanup simpler.
>>>> ---
>>>>    drivers/rtc/rtc-bd70528.c | 10 ++++++----
>>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
>>>> index 954ac4ef53e8..d5cc4993f918 100644
>>>> --- a/drivers/rtc/rtc-bd70528.c
>>>> +++ b/drivers/rtc/rtc-bd70528.c
>>>> @@ -312,9 +312,6 @@ static int bd70528_probe(struct platform_device *pdev)
>>>>    		}
>>>>    	}
>>>> -	device_set_wakeup_capable(&pdev->dev, true);
>>>> -	device_wakeup_enable(&pdev->dev);
>>>> -
>>>>    	rtc = devm_rtc_allocate_device(&pdev->dev);
>>>>    	if (IS_ERR(rtc)) {
>>>>    		dev_err(&pdev->dev, "RTC device creation failed\n");
>>>> @@ -331,7 +328,12 @@ static int bd70528_probe(struct platform_device *pdev)
>>>>    	if (ret)
>>>>    		return ret;
>>>> -	return devm_rtc_register_device(rtc);
>>>> +	ret = devm_rtc_register_device(rtc);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	device_init_wakeup(&pdev->dev, true);
>>>> +	return 0;
>>>>    }
>>>>    static const struct platform_device_id bd718x7_rtc_id[] = {
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> Best,
>> Joe
> 

Best,
Joe


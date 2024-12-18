Return-Path: <linux-rtc+bounces-2743-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F6E9F5C0D
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2024 02:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 714A61641DE
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2024 01:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C494DDBB;
	Wed, 18 Dec 2024 01:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Uv9F3jha"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669EA442F
	for <linux-rtc@vger.kernel.org>; Wed, 18 Dec 2024 01:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734483973; cv=none; b=hHoM0A3og7n85Y0v4pXBuplyTvrW08Z3aIDklFvJQHzYoqpO11H7THi2Labkaj60PkbkNuz2m+6Vfd1yPHLDs93k0/xJWQRqeOd5xMoQ2NIaVHACD4635P6NI3Ede8dE5+wbGQY3KAFZNn51HbFjoeDGeJdFQEA/YzCkC7UAcHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734483973; c=relaxed/simple;
	bh=T3Qzi9Cin1kqo4hJxqJ2WJCiNgEEigxeOvk1+b+RjtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnyA97KR83BRj/GTuUQXk9E4jKl56ZhAub2vYYhHpJBSCbKHS+wBBMJyHQq+Gs1T7enUZ5ODtSDoFQhdsKzgznONkLb5QBXOFIUHOoxrfR69akB3C2GfRJz+Do7y1ukoCM6X1JbZFbgxAoS5wbAgpCYLw07UYMieDEQHyVqGzDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Uv9F3jha; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216281bc30fso61848375ad.0
        for <linux-rtc@vger.kernel.org>; Tue, 17 Dec 2024 17:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734483968; x=1735088768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GyJId5pKKScx6ikWMAyhNxFgNPKLtrhgVFxKAw2qT8c=;
        b=Uv9F3jha4AVQ3pIvpXOSKFktN0DmXQfKY5/SdIr8wEOuHlxG8kGYWt8UANqgFonYWF
         COPAsHnrLY8O0az+yh4K7/0x9NFl9H3tSttD+kwSgI5KMCyi5Y75TPOHoYSqQVZpME3E
         2G7njYOVrUdcjYNCVLRFA1dIcnX3B0l/z5f3qBx08AAotzlwHzkx8yVbO9igr9hXWcOo
         ijet8uYbMhDJ2Q6FuKVqww5RaD9VdPoB3mGHUh5Pf5192esXlmG7/frGte0Ly1NGFfJ8
         Q9GwCdu1BknZWeR9u81Qkcfp8ahvn+h5UTeHKi7JwEoaUDFYcMl73nOW2dYAqoQzCtj0
         LkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734483968; x=1735088768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyJId5pKKScx6ikWMAyhNxFgNPKLtrhgVFxKAw2qT8c=;
        b=R0+J58ddOSJRYRd0WGcD0/fktaOID2N5qT+qZz086xFAeZ40uL2+LeFRyRHJY+Aq3v
         wvDkXEZ716WkxpNiGWxn5L6qVauKPyL5Xk5j6vmOIxNbnZuT5KA1e3G9uuFpBYXNN+QN
         B9HZgi0PQL9I9yUyng0fr4An9/rm08hjc2+KrPCYh1TLKEl1ftcNyvSs7wlndb2rc0c9
         zOurJfGLbEAPSI4XHAokXwHYSQxDIPYSP7TfUF4rnrStenN/7A+eT11uI11MMJ5iHxaa
         BuRlgJQnNr6CvM1hsv9T3fusvlimHx3cvU9NlLTfe4sOHSLeTCpEqDVdC3NkKZRCM3ya
         f6Vg==
X-Gm-Message-State: AOJu0YwaxhrymLvG5qSnE6V6HGiwqfWkBluYxLYrsZoVGK3BsxHGol/J
	C5FYxxqeSomi5EApbZWXZe9YZVIdmeV8EdlB38j8nfRXakYDGL+b03WmNjvlBqk=
X-Gm-Gg: ASbGncu0gxhvOdGyGWSAhiGVXmiApoy1KhR60acuNg8/sW2aohfDbLCpRQbKvW+BjHi
	j0l36cLvIvjTFm7X019Upk2VP8IvR6CyelPDGbSE8vHVkt+TOlOtokDIrjjUf7GAMAhvhzTSqbJ
	/fmNDfmvjaVDKDCFpOaIfv1q5Xt8U65rNKN/lunOZBQbLaFd474mqDwic6IlQwi0eQoD5xM1n1Q
	A/sgQiu2wZijj1FR4YB/9K/OfPQ1+2wnSiu39MOVfgUKFjMzrj0xGlQpzX38GTKi6TWa9d5o1Ug
	e5SQPGTHW+pdDu2JO5PIDl7Ov0oti8ylZw==
X-Google-Smtp-Source: AGHT+IEjnEZ961Oovf4rN1egyXlBskzbsn6P0lNSx/oHDQvr3nquwD2z8hzF78LLwWcz4a0cmkvF5A==
X-Received: by 2002:a17:903:22c8:b0:215:5d43:6f0e with SMTP id d9443c01a7336-218d725f9aemr11019885ad.41.1734483968477;
        Tue, 17 Dec 2024 17:06:08 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e6b887sm65360385ad.251.2024.12.17.17.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 17:06:07 -0800 (PST)
Message-ID: <c21100e0-657b-4556-a35c-a59017a917b2@pf.is.s.u-tokyo.ac.jp>
Date: Wed, 18 Dec 2024 10:06:04 +0900
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: brcmstb-waketimer: disable wakeup in .remove() and
 in the error path of .probe()
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 alexandre.belloni@bootlin.com, bcm-kernel-feedback-list@broadcom.com,
 Doug Berger <opendmb@gmail.com>
Cc: linux-rtc@vger.kernel.org
References: <20241212025007.3472182-1-joe@pf.is.s.u-tokyo.ac.jp>
 <fdcdabd2-56a5-498e-a21f-124c63105a6f@broadcom.com>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <fdcdabd2-56a5-498e-a21f-124c63105a6f@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/18/24 04:16, Florian Fainelli wrote:
> On 12/11/24 18:50, Joe Hattori wrote:
>> Current code leaves the device's wakeup enabled in .remove() and in the
>> error path of .probe(), which results in a memory leak. Therefore, add
>> the device_init_wakeup(dev, false) call.
>>
>> This bug was found by an experimental static analysis tool that I am
>> developing.
>>
>> Fixes: 2cd98b22c144 ("rtc: brcmstb-waketimer: non-functional code 
>> changes")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> 
> Looks like you forgot to copy the maintainer (Doug Berger), added him.

Thanks!

> 
>> ---
>>   drivers/rtc/rtc-brcmstb-waketimer.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c 
>> b/drivers/rtc/rtc-brcmstb-waketimer.c
>> index fb47c32ab5ff..1bdfec94c693 100644
>> --- a/drivers/rtc/rtc-brcmstb-waketimer.c
>> +++ b/drivers/rtc/rtc-brcmstb-waketimer.c
>> @@ -298,15 +298,17 @@ static int brcmstb_waketmr_probe(struct 
>> platform_device *pdev)
>>       device_init_wakeup(dev, true);
>>       ret = platform_get_irq(pdev, 0);
>> -    if (ret < 0)
>> -        return -ENODEV;
>> +    if (ret < 0) {
>> +        ret = -ENODEV;
>> +        goto err_disable_wakeup;
>> +    }
>>       timer->wake_irq = (unsigned int)ret;
>>       timer->clk = devm_clk_get(dev, NULL);
>>       if (!IS_ERR(timer->clk)) {
>>           ret = clk_prepare_enable(timer->clk);
>>           if (ret)
>> -            return ret;
>> +            goto err_disable_wakeup;
>>           timer->rate = clk_get_rate(timer->clk);
>>           if (!timer->rate)
>>               timer->rate = BRCMSTB_WKTMR_DEFAULT_FREQ;
>> @@ -351,6 +353,8 @@ static int brcmstb_waketmr_probe(struct 
>> platform_device *pdev)
>>   err_clk:
>>       clk_disable_unprepare(timer->clk);
>> +err_disable_wakeup:
>> +    device_init_wakeup(dev, false);
>>       return ret;
> 
> The error path change looks good to me,
> 
>>   }
>> @@ -360,6 +364,7 @@ static void brcmstb_waketmr_remove(struct 
>> platform_device *pdev)
>>       unregister_reboot_notifier(&timer->reboot_notifier);
>>       clk_disable_unprepare(timer->clk);
>> +    device_init_wakeup(&pdev->dev, false);
> 
> That part, I don't think is necessary at all, since the interrupts 
> handlers have been freed and disabled, they will not be causing any 
> system wake-up, besides that, the device is completely gone from /sys.

Thank you for the review. I am currently working on adding the devm_ 
version of the device_init_wakeup() [1], so let me come back to this 
patch after the function is added.

[1]: 
https://lore.kernel.org/linux-pm/20241214021652.3432500-1-joe@pf.is.s.u-tokyo.ac.jp/

Best,
Joe


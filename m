Return-Path: <linux-rtc+bounces-5677-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701FD00758
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 01:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 340F23027A6A
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 00:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A129719AD8B;
	Thu,  8 Jan 2026 00:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5VPIThq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8219915539A
	for <linux-rtc@vger.kernel.org>; Thu,  8 Jan 2026 00:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767831858; cv=none; b=i7MYtifeQs/XerhwcLHxFmS51mRkxN2P/d3ufmk+V8Jw6gM86LTegMsiqSQ7Oohrzt1qA/FcLw4f9xHoAqVlro0M09vfFe/fgsjUmDy7vCxkVoBWOK6r107/Mk/ncHxrgjZfhDU9uEnrGmCJ3z5dA8S9FItYzdgbhbCTKqQMSag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767831858; c=relaxed/simple;
	bh=vnNBnVxkXn6VzaWqzHNi1xAKgiymBmwdCou/RsfPKaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDDFdAwY6bGmieam2E5+90F4hkOJrXorGyj/MjIhjOjLvE86g4TgkJi2kISSW3rC5QcEvh5OAv46C9H29tyrc55aO+P8rBY2ifaC20bmM87vt+mb5wKUU+MDEq9Lxa0IctbyrogU+cr1kWirrAOpa+3TeAzTEui4Z+z/CaSVdQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5VPIThq; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c0224fd2a92so1439734a12.2
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 16:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767831852; x=1768436652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1b5aiphjonM+qh2P3cyELeGq9iN5aWlHACCA3+HSGU=;
        b=Z5VPIThqlRGB3101yKItxIRlVWdMdBnt3skvZopFIfcV56L6I6Numqz7/JKZ/5ry7M
         FvC9Bdyiyhz8hIyvDMjqBfkv/irNFbSP+JrI5rm8yMqGWnJ1xEsLgfFP9Lk6Qgui3IzF
         x8uhKDM9O9sqwr68kVW+ECcqohfiMJpnSI5qHWv8UY+Mu03DOHBOWeGgp9dCe2QAGqXa
         SwEW1RR43qRY7uVWhWvNHzo4fLZNGcxQHX/5hRGrf+apQWHEYb2cpC1rgYQwKz4b1WwF
         +G/kPTZw92O9BRDPYu5JIBtLzrI91MUc4484UP2CToTK2WvOeSgPAmkptq1CNWM5jaq4
         Vg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767831852; x=1768436652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1b5aiphjonM+qh2P3cyELeGq9iN5aWlHACCA3+HSGU=;
        b=YxOWcoTKcBconH1DeXh07u1PEZEQuT6bnJWGNycSU87nqN3dsFDKD4NZ5ZSM4dGZ95
         WW5A7+fK3iU2QMxkvuzOmRVh88gOy9FDujHAyNHVX0zfAYJHBZ4UeN/AQtwofWV/aCEP
         F0JSdweStOek+pFUAHebzCkAHiFkCp3wZPzg0XWxeCDj3A4tK1MiaGBFtOfMqNCBewzU
         57rYt16Gxz4iXwRbFcujlB6fqFlMBAt4jCf0UpAJ0y6K2INbdgg9Hb/NuAeOCP+dT4P4
         hGAmUh2AWd4n1N6Q2NtigUxCyRAvWFUyM/Ng745K6orMeB65BIrWEXjN0gQrJBT7LRVj
         lCDA==
X-Forwarded-Encrypted: i=1; AJvYcCVT/jc2t2pwZwgtVvPi0clNagr8xZl0GP++kXAzdhp7o7osyAby1mGDowa6S+8o/+4AJpK45Vl453E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtLrgJGbFjTiuqPi7Qds40yN6TevMlVngfwMbUu2t0n/zxy2n
	OSjH40MTGWnl6Nuh3uc3qjrExaF2FCY1zN8COWy3GMR77/dFDYCgJx2W
X-Gm-Gg: AY/fxX4qWkf5gf7TK2g7JutAnLvBQSdfwRx1LnLJnhWV4eznNnQg9Pb0DhvImIiJtpX
	sLbI9/rmR+jmRRNp8WzxfxEgoL0SlaHC8MMBuyhe9gvDN0fdpPRWnMTjpDmNsFf4ymRQRp5b+D1
	dXyLk0vlCrmSiUhLZX+Wc9f7qcAZY7gpivIy/KbNZrUBnDR8iRo1Rd6ot2/8T167p6/JCemFt1Q
	SNhRpoMuc+y+iKx4qnwhLMvMqBcbUAGQLbEYSYP689KYsBR0hckf0wOa9aGcUJUz5rjbLdGD8sV
	2kXbLgJssyNth+s4xJe7EeG54vPbZmksI3hr4q7fEdLxyEXllbK/6/yYq0ixXI2o9rDfj/z8MPB
	BLIblkczfbSCZTUa/am+MZbAavx8xyMKN7avWWPxsbdWMCqd0yBy6VvaHj374Mro9w3LZ1thBfx
	x9r2RMT2d3doDqnu+P8HIt6k0=
X-Google-Smtp-Source: AGHT+IGvkXlTJq6lMcaJY57WxczJsbf/PgFJYc6JY/5UG6S7bsezDgecMYdVjyfD3o8XKmdhSTaYDA==
X-Received: by 2002:a17:90b:57f0:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-34f68ca4536mr3588914a91.20.1767831851534;
        Wed, 07 Jan 2026 16:24:11 -0800 (PST)
Received: from [10.0.10.3] ([45.142.165.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b1cc1sm6049760a91.2.2026.01.07.16.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 16:24:11 -0800 (PST)
Message-ID: <66e517b1-bc83-4c73-b2ea-73a31757ab44@gmail.com>
Date: Thu, 8 Jan 2026 08:24:03 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
To: Ke Sun <sunke@kylinos.cn>, Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <2026010757-fester-unissued-6e5f@gregkh>
 <a95aff4b-5dbf-4def-803a-d5aea84113a5@kylinos.cn>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <a95aff4b-5dbf-4def-803a-d5aea84113a5@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 07:18, Ke Sun wrote:
>
> On 1/8/26 00:12, Greg KH wrote:
>> On Wed, Jan 07, 2026 at 10:37:33PM +0800, Ke Sun wrote:
>>> Unify RTC driver interface by storing driver data on the RTC device
>>> instead of the parent device. Update RTC ops callbacks to pass the RTC
>>> device itself rather than its parent. This change enables better
>>> support for Rust RTC drivers that store data on the RTC device.
>>>
>>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>>> ---
>>>   drivers/rtc/dev.c       |  4 ++--
>>>   drivers/rtc/interface.c | 18 +++++++++---------
>>>   drivers/rtc/rtc-pl031.c |  9 ++-------
>>>   3 files changed, 13 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>>> --- a/drivers/rtc/dev.c
>>> +++ b/drivers/rtc/dev.c
>>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>           }
>>>           default:
>>>               if (rtc->ops->param_get)
>>> -                err = rtc->ops->param_get(rtc->dev.parent, &param);
>>> +                err = rtc->ops->param_get(&rtc->dev, &param);
>>>               else
>>>                   err = -EINVAL;
>>>           }
>>> @@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>             default:
>>>               if (rtc->ops->param_set)
>>> -                err = rtc->ops->param_set(rtc->dev.parent, &param);
>>> +                err = rtc->ops->param_set(&rtc->dev, &param);
>>>               else
>>>                   err = -EINVAL;
>>>           }
>>> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
>>> index b8b298efd9a9c..783a3ec3bb93d 100644
>>> --- a/drivers/rtc/interface.c
>>> +++ b/drivers/rtc/interface.c
>>> @@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, 
>>> struct rtc_time *tm)
>>>           err = -EINVAL;
>>>       } else {
>>>           memset(tm, 0, sizeof(struct rtc_time));
>>> -        err = rtc->ops->read_time(rtc->dev.parent, tm);
>>> +        err = rtc->ops->read_time(&rtc->dev, tm);
>>>           if (err < 0) {
>>>               dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
>>>                   err);
>>> @@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct 
>>> rtc_time *tm)
>>>       if (!rtc->ops)
>>>           err = -ENODEV;
>>>       else if (rtc->ops->set_time)
>>> -        err = rtc->ops->set_time(rtc->dev.parent, tm);
>>> +        err = rtc->ops->set_time(&rtc->dev, tm);
>>>       else
>>>           err = -EINVAL;
>>>   @@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct 
>>> rtc_device *rtc,
>>>           alarm->time.tm_wday = -1;
>>>           alarm->time.tm_yday = -1;
>>>           alarm->time.tm_isdst = -1;
>>> -        err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
>>> +        err = rtc->ops->read_alarm(&rtc->dev, alarm);
>>>       }
>>>         mutex_unlock(&rtc->ops_lock);
>>> @@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device 
>>> *rtc, struct rtc_wkalrm *alarm)
>>>       else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
>>>           err = -EINVAL;
>>>       else
>>> -        err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
>>> +        err = rtc->ops->set_alarm(&rtc->dev, alarm);
>>>         /*
>>>        * Check for potential race described above. If the waiting 
>>> for next
>>> @@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, 
>>> unsigned int enabled)
>>>       else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || 
>>> !rtc->ops->alarm_irq_enable)
>>>           err = -EINVAL;
>>>       else
>>> -        err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
>>> +        err = rtc->ops->alarm_irq_enable(&rtc->dev, enabled);
>>>         mutex_unlock(&rtc->ops_lock);
>>>   @@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device 
>>> *rtc, unsigned int enabled)
>>>           rtc->uie_rtctimer.period = ktime_set(1, 0);
>>>           err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
>>>           if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
>>> -            err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
>>> +            err = rtc->ops->alarm_irq_enable(&rtc->dev, 1);
>>>           if (err)
>>>               goto out;
>>>       } else {
>>> @@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device 
>>> *rtc)
>>>       if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) 
>>> || !rtc->ops->alarm_irq_enable)
>>>           return;
>>>   -    rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
>>> +    rtc->ops->alarm_irq_enable(&rtc->dev, false);
>>>       trace_rtc_alarm_irq_enable(0, 0);
>>>   }
>>>   @@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, 
>>> long *offset)
>>>           return -EINVAL;
>>>         mutex_lock(&rtc->ops_lock);
>>> -    ret = rtc->ops->read_offset(rtc->dev.parent, offset);
>>> +    ret = rtc->ops->read_offset(&rtc->dev, offset);
>>>       mutex_unlock(&rtc->ops_lock);
>>>         trace_rtc_read_offset(*offset, ret);
>>> @@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, 
>>> long offset)
>>>           return -EINVAL;
>>>         mutex_lock(&rtc->ops_lock);
>>> -    ret = rtc->ops->set_offset(rtc->dev.parent, offset);
>>> +    ret = rtc->ops->set_offset(&rtc->dev, offset);
>>>       mutex_unlock(&rtc->ops_lock);
>>>         trace_rtc_set_offset(offset, ret);
>>> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
>>> index eab39dfa4e5fe..a605034d44cb7 100644
>>> --- a/drivers/rtc/rtc-pl031.c
>>> +++ b/drivers/rtc/rtc-pl031.c
>>> @@ -284,10 +284,6 @@ static int pl031_set_alarm(struct device *dev, 
>>> struct rtc_wkalrm *alarm)
>>>     static void pl031_remove(struct amba_device *adev)
>>>   {
>>> -    struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
>>> -
>>> -    if (adev->irq[0])
>>> -        free_irq(adev->irq[0], ldata);
>>>       amba_release_regions(adev);
>>>   }
>>>   @@ -320,8 +316,6 @@ static int pl031_probe(struct amba_device 
>>> *adev, const struct amba_id *id)
>>>           goto out;
>>>       }
>>>   -    amba_set_drvdata(adev, ldata);
>>> -
>>>       dev_dbg(&adev->dev, "designer ID = 0x%02x\n", amba_manf(adev));
>>>       dev_dbg(&adev->dev, "revision = 0x%01x\n", amba_rev(adev));
>>>   @@ -356,6 +350,7 @@ static int pl031_probe(struct amba_device 
>>> *adev, const struct amba_id *id)
>>>           ret = PTR_ERR(ldata->rtc);
>>>           goto out;
>>>       }
>>> +    dev_set_drvdata(&ldata->rtc->dev, ldata);
>>>         if (!adev->irq[0])
>>>           clear_bit(RTC_FEATURE_ALARM, ldata->rtc->features);
>>> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, 
>>> const struct amba_id *id)
>>>           goto out;
>>>         if (adev->irq[0]) {
>>> -        ret = request_irq(adev->irq[0], pl031_interrupt,
>>> +        ret = devm_request_irq(&adev->dev, adev->irq[0], 
>>> pl031_interrupt,
>>>                     vendor->irqflags, "rtc-pl031", ldata);
>> Are you _SURE_ you can use devm for this?  it is a functional change,
>
> Since ldata's lifecycle is now tied to the RTC device (stored via
> dev_set_drvdata(&ldata->rtc->dev, ldata)), and the RTC device's lifecycle
> is tied to the amba_device (via devm_rtc_allocate_device(&adev->dev)),
> using devm_request_irq(&adev->dev, ...) allows us to remove the manual 
> IRQ
> release in pl031_remove, as the IRQ will be automatically released along
> with the amba_device lifecycle.
>
>
> Is this reasoning correct, or should I handle this differently?

Correction: Should use devm_request_irq(&ldata->rtc->dev, ...) instead

of devm_request_irq(&adev->dev, ...).


While a lifecycle chain exists (ldata -> rtc -> amba_device), the IRQ 
should

be bound to the device that uses it (the RTC device), matching where driver

data is stored, to avoid UAF.

>
>
> thanks,
>
> Ke Sun
>
>> one that trips lots of people up.  I wouldn't make this change without
>> at least saying why you are doing so in the changelog text, which I
>> didn't see at all here.
>>
>> thanks,
>>
>> greg k-h


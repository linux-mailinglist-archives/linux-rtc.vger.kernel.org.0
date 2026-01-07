Return-Path: <linux-rtc+bounces-5675-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57580D00608
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 00:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B9F93015129
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 23:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD122D838A;
	Wed,  7 Jan 2026 23:18:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6E42139C9
	for <linux-rtc@vger.kernel.org>; Wed,  7 Jan 2026 23:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767827920; cv=none; b=JR9LOmO/aX5izHzUi4d9QH3i5Svp0JaBOnAbr5Ihl58W14W1yheg6jC99frnGJl9xOtrdqIp/WbajGTRv7t+aGpGYrTedgM8EJNf5L1MDw80moiF/ZAvHbur5LoevPrB3kyEoB5oyj/crHJ/B4hHDRC61+iuy84JJBYTYGnWmUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767827920; c=relaxed/simple;
	bh=3V8Rup40PO9Bzai89Z262iIf9xz/B60P11vnovI4XCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOSouwrz2Qy8xjCvouZno/qmCR+5WI1pp/S6rbn8rdB6qEttgUr4oanpHKAOo+oCzEYwS/89mZMFqp1XPm+gRCs282dOCzfhvV6wF9UcFZURzyB3oREkT7yjQbTzRSmXtlpnuGSw1gG4wgnajq7KVBEP6wytBztBg/IuCAzScnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d52768ccso20088395ad.1
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 15:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767827917; x=1768432717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlLwh9++9jd/IDcukFf1CLHtLH2QHDVOYSauRCwk2t4=;
        b=oegV9L4naf0gceUJAS0J9d3/X26b+d5LbelWpq2seH2r1ogxpkjiEFj34+NsoelYZf
         BB07zp9jMl1v1BdrbbaN7zxPPThSGTJwB+UydSEeN/rO6TQNS9EuGMFNVLhgCysljIY1
         WEbbIOMLIlQvookL6oHCBEfJuU8A1uZb2W2iNzZ1TLyRpkGECBQOLOqXB8yVI4JBE4dd
         ZhGVgXZvnZC4L21oMws9jToV0W3HRHzlG0tEQyDQjFv5x+hIGmQIi29s6xWrSsN/b29l
         Er03Ls2T1kkXDlMY8H7wWfKZqqRFdngb5nmDjf7JCK0CPgabrtzNi9H29FhFzzx4ZZR3
         zclA==
X-Forwarded-Encrypted: i=1; AJvYcCWZiF+fHLC43ARyj4hrsUOZbtcYDTtMH7pM9iaQBal93oCmJPBmIqj1/n7cZyhRYztVotIV8DeOXGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8a4827FzZ/r2mD5OIr9rdp6AbCeBqAKUmXzj2e+wgQ/6etbmP
	fPA+JzCpWEReGsrD+TbgkvLpGV1PDjqIqm8Aai+GbhOnB6Rb31XQnJx9D3bXdcMGQyDfBg==
X-Gm-Gg: AY/fxX5pdTA6vxAF3KYDXlA0W5nbTWPnLASvP+cH6M33uKFJYakyjWUfIJSnIAiU7+h
	SE81QHvwwYG0EyXgyqlQfVfy/cM9+GmvtQyQ3vxZh8p9Ox4NPHGa3fhN7gjZhnom48RMS8nu57Z
	uD/2fMWjDOndLgEr2mRKRrsOGBgSzTvT0GMIPKI2YQCdEEsctH+H7qXxeWQ8AOU3R+WULczG0q7
	e7Hex3a6wEUZSvGJh4t2WJNfCdtgWz5p8GTnsoqSgYEVy5FqieQHg/JXJQlCxcPZptwtuWm+DAg
	PKI30r+36m5fv6ezY3xoCZz3FSSsFmhNP/WCx4aGbDWPhizcT5RRVuOeUPF8wulb8f42gs9F5SI
	C6wpqEr4bGwgDEeT6pl4WbbsSgScSKXXMTfNjFzu8QU1VcCP1nGPGaMRHHOiPCVHXGQWY
X-Google-Smtp-Source: AGHT+IF4DZ7OQlAZQ0zZ3j6/HWfrUCsHEdFnFn710jjTev06Am9MDt2cEH3V7H1laaoeCJGaQ3TjsQ==
X-Received: by 2002:a17:90b:5848:b0:34c:27ad:71e7 with SMTP id 98e67ed59e1d1-34f68cccd55mr3562459a91.35.1767827917244;
        Wed, 07 Jan 2026 15:18:37 -0800 (PST)
Received: from [192.168.200.2] ([2403:2c80:17::10:4008])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0d7esm5968006a91.16.2026.01.07.15.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 15:18:36 -0800 (PST)
Message-ID: <a95aff4b-5dbf-4def-803a-d5aea84113a5@kylinos.cn>
Date: Thu, 8 Jan 2026 07:18:30 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <2026010757-fester-unissued-6e5f@gregkh>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <2026010757-fester-unissued-6e5f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 00:12, Greg KH wrote:
> On Wed, Jan 07, 2026 at 10:37:33PM +0800, Ke Sun wrote:
>> Unify RTC driver interface by storing driver data on the RTC device
>> instead of the parent device. Update RTC ops callbacks to pass the RTC
>> device itself rather than its parent. This change enables better
>> support for Rust RTC drivers that store data on the RTC device.
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   drivers/rtc/dev.c       |  4 ++--
>>   drivers/rtc/interface.c | 18 +++++++++---------
>>   drivers/rtc/rtc-pl031.c |  9 ++-------
>>   3 files changed, 13 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>> --- a/drivers/rtc/dev.c
>> +++ b/drivers/rtc/dev.c
>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>   		}
>>   		default:
>>   			if (rtc->ops->param_get)
>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>> +				err = rtc->ops->param_get(&rtc->dev, &param);
>>   			else
>>   				err = -EINVAL;
>>   		}
>> @@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
>>   
>>   		default:
>>   			if (rtc->ops->param_set)
>> -				err = rtc->ops->param_set(rtc->dev.parent, &param);
>> +				err = rtc->ops->param_set(&rtc->dev, &param);
>>   			else
>>   				err = -EINVAL;
>>   		}
>> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
>> index b8b298efd9a9c..783a3ec3bb93d 100644
>> --- a/drivers/rtc/interface.c
>> +++ b/drivers/rtc/interface.c
>> @@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
>>   		err = -EINVAL;
>>   	} else {
>>   		memset(tm, 0, sizeof(struct rtc_time));
>> -		err = rtc->ops->read_time(rtc->dev.parent, tm);
>> +		err = rtc->ops->read_time(&rtc->dev, tm);
>>   		if (err < 0) {
>>   			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
>>   				err);
>> @@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
>>   	if (!rtc->ops)
>>   		err = -ENODEV;
>>   	else if (rtc->ops->set_time)
>> -		err = rtc->ops->set_time(rtc->dev.parent, tm);
>> +		err = rtc->ops->set_time(&rtc->dev, tm);
>>   	else
>>   		err = -EINVAL;
>>   
>> @@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
>>   		alarm->time.tm_wday = -1;
>>   		alarm->time.tm_yday = -1;
>>   		alarm->time.tm_isdst = -1;
>> -		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
>> +		err = rtc->ops->read_alarm(&rtc->dev, alarm);
>>   	}
>>   
>>   	mutex_unlock(&rtc->ops_lock);
>> @@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>>   	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
>>   		err = -EINVAL;
>>   	else
>> -		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
>> +		err = rtc->ops->set_alarm(&rtc->dev, alarm);
>>   
>>   	/*
>>   	 * Check for potential race described above. If the waiting for next
>> @@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>>   	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>>   		err = -EINVAL;
>>   	else
>> -		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
>> +		err = rtc->ops->alarm_irq_enable(&rtc->dev, enabled);
>>   
>>   	mutex_unlock(&rtc->ops_lock);
>>   
>> @@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>>   		rtc->uie_rtctimer.period = ktime_set(1, 0);
>>   		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
>>   		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
>> -			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
>> +			err = rtc->ops->alarm_irq_enable(&rtc->dev, 1);
>>   		if (err)
>>   			goto out;
>>   	} else {
>> @@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
>>   	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>>   		return;
>>   
>> -	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
>> +	rtc->ops->alarm_irq_enable(&rtc->dev, false);
>>   	trace_rtc_alarm_irq_enable(0, 0);
>>   }
>>   
>> @@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
>>   		return -EINVAL;
>>   
>>   	mutex_lock(&rtc->ops_lock);
>> -	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
>> +	ret = rtc->ops->read_offset(&rtc->dev, offset);
>>   	mutex_unlock(&rtc->ops_lock);
>>   
>>   	trace_rtc_read_offset(*offset, ret);
>> @@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
>>   		return -EINVAL;
>>   
>>   	mutex_lock(&rtc->ops_lock);
>> -	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
>> +	ret = rtc->ops->set_offset(&rtc->dev, offset);
>>   	mutex_unlock(&rtc->ops_lock);
>>   
>>   	trace_rtc_set_offset(offset, ret);
>> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
>> index eab39dfa4e5fe..a605034d44cb7 100644
>> --- a/drivers/rtc/rtc-pl031.c
>> +++ b/drivers/rtc/rtc-pl031.c
>> @@ -284,10 +284,6 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>>   
>>   static void pl031_remove(struct amba_device *adev)
>>   {
>> -	struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
>> -
>> -	if (adev->irq[0])
>> -		free_irq(adev->irq[0], ldata);
>>   	amba_release_regions(adev);
>>   }
>>   
>> @@ -320,8 +316,6 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>   		goto out;
>>   	}
>>   
>> -	amba_set_drvdata(adev, ldata);
>> -
>>   	dev_dbg(&adev->dev, "designer ID = 0x%02x\n", amba_manf(adev));
>>   	dev_dbg(&adev->dev, "revision = 0x%01x\n", amba_rev(adev));
>>   
>> @@ -356,6 +350,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>   		ret = PTR_ERR(ldata->rtc);
>>   		goto out;
>>   	}
>> +	dev_set_drvdata(&ldata->rtc->dev, ldata);
>>   
>>   	if (!adev->irq[0])
>>   		clear_bit(RTC_FEATURE_ALARM, ldata->rtc->features);
>> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>   		goto out;
>>   
>>   	if (adev->irq[0]) {
>> -		ret = request_irq(adev->irq[0], pl031_interrupt,
>> +		ret = devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
>>   				  vendor->irqflags, "rtc-pl031", ldata);
> Are you _SURE_ you can use devm for this?  it is a functional change,

Since ldata's lifecycle is now tied to the RTC device (stored via
dev_set_drvdata(&ldata->rtc->dev, ldata)), and the RTC device's lifecycle
is tied to the amba_device (via devm_rtc_allocate_device(&adev->dev)),
using devm_request_irq(&adev->dev, ...) allows us to remove the manual IRQ
release in pl031_remove, as the IRQ will be automatically released along
with the amba_device lifecycle.


Is this reasoning correct, or should I handle this differently?


thanks,

Ke Sun

> one that trips lots of people up.  I wouldn't make this change without
> at least saying why you are doing so in the changelog text, which I
> didn't see at all here.
>
> thanks,
>
> greg k-h


Return-Path: <linux-rtc+bounces-5684-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D924D0272D
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 12:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5478330F03DD
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 11:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9989139902F;
	Thu,  8 Jan 2026 09:02:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD439525D
	for <linux-rtc@vger.kernel.org>; Thu,  8 Jan 2026 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862971; cv=none; b=hmBaErhVM/4/Fc6SDqSvAf3X/O3/FhexRQYhgW58/YVfL5GO4euX2zNan7O4NWZyhXc9KRMaSh1/6OQUqMhHPTEKmOUhv2JrR+7+PvVGVDOuXPmEGfnF5MiEM0NE4oueakN/1JJeXPlvzQ1UJQMRApyE14tSTQTcoEa3OycI6eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862971; c=relaxed/simple;
	bh=kKNCcqwE6O5nGqJK1qx057dn4UxNba7jQZQo59WpJzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeI1os8sN62+/7BSKOzaZCUhnEEfjOandlmuC6h2f8m7a0wi8rorO0q6kXu7QtFQHGM5l9nR9AaWHsd2XhKM9YVwM8+u9g9lCW7egHnsstZhyNat90wHOaaqq3Hukz8ynFQjaSreA7aFjNZM4KOBxrCrvPwmTgyfC9axBaB5CfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-803474aaa8bso966308b3a.0
        for <linux-rtc@vger.kernel.org>; Thu, 08 Jan 2026 01:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862957; x=1768467757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsiMvWaS7IT9KCPh8c3zJa/FIkcAhnWnlw/xRy3mwV4=;
        b=ImgWCvHHkwhPrmZiYY8t6MKCY7tEyBJXA49mA11FZqxgX28ZL+n1OP6XSZO+whjo2m
         ewtPNpr9VDkcon2OEE9dx8vWxe2G2ULF4lHQcdPySI/6GiwKkJGdJ9WU5a5umGOOFqUE
         iRjxyOrH1ox5/8Wyn+DHDIu5kprYLX+RSNdYASKRVU6bdYDfYRfiP3P/HgZSC9kuooOZ
         H6rjzaYOrEapkQAXyWbvIcN4IkwdXxrOKyuJcIGXW71nlTr1rtkw5A9xmjGy2bAwllRv
         Ikry/ef5Ab+uJTvwFlGn2Cg+7/ArI8O59e9xa+Xvh3dSdEvw74Mx09AKvD9ihIU6ch3t
         +S3w==
X-Forwarded-Encrypted: i=1; AJvYcCXUDFwtQXMkFe0R2yGn06405mUo1vVtEGiNcxDZy/K9V6F9onreJ7JvCCzfH2ee01ho8n/LUMK2v8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhtNZ+/brAA8qWjZvqEL3uNxmoMjMlHSGLMXiQEpTa0vx3Yye9
	mpuEa4trDNWjzRRhspQffx826F/kovA9rhtoN+ScDct9YedpZmRnPjTA
X-Gm-Gg: AY/fxX5MCGI5Wfaew20j79Wm1JaihGCRcAkw0aDVs+e0veItsJqCRd+swpPSWJRcePw
	HhL2dULgddOOHqRng3hh4PkuxGkE/KVGZ+7q3zdANQ6lQS8Opm0G92KdUn7AI7cd3ZJT8rKmnw8
	V8VnSxrMfWGfV7XiXVuK23fcoJzo/O1dwiojVM04yh98GFh/6Ks7zAtWqqq8+sJBHjLsk3hno95
	ZRfCHmJsTbKZffSjL76aW06sIaoSxe0iynd62VhWSXlvB1ENIJUU7YB2E0sOMWfGvGPYAfZDSBX
	dhcFQopbEHu68b374IobL6XnHCZrNu11pG2buAsv7i4ubPJ9A0XreCwycG36xjLlLkcs0a1E5Ax
	x2DU4xp41RjOsDRRx27m7gOW55tVrys7wEX6d0JefvTeOAz61AmtbISM22xztRUL4HWYB6Whd1S
	DtSEVkgg==
X-Google-Smtp-Source: AGHT+IG5JbMbf8upGvK0l1yk5ECfkd0DBqfssKekkkYvYiC72cMuK4R74rTnMb15RNjq5SCN0fz/JA==
X-Received: by 2002:a05:6a00:7447:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-81943fbfcbemr6785597b3a.13.1767862957083;
        Thu, 08 Jan 2026 01:02:37 -0800 (PST)
Received: from [10.0.10.3] ([195.245.219.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5edd921sm7034435b3a.69.2026.01.08.01.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:02:36 -0800 (PST)
Message-ID: <7c6af8a1-9c5e-46b1-8c17-8ffd443fa6aa@kylinos.cn>
Date: Thu, 8 Jan 2026 17:02:30 +0800
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
 <a95aff4b-5dbf-4def-803a-d5aea84113a5@kylinos.cn>
 <2026010841-accuracy-skimmed-9f0b@gregkh>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <2026010841-accuracy-skimmed-9f0b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/8/26 13:46, Greg KH wrote:
> On Thu, Jan 08, 2026 at 07:18:30AM +0800, Ke Sun wrote:
>> On 1/8/26 00:12, Greg KH wrote:
>>> On Wed, Jan 07, 2026 at 10:37:33PM +0800, Ke Sun wrote:
>>>> Unify RTC driver interface by storing driver data on the RTC device
>>>> instead of the parent device. Update RTC ops callbacks to pass the RTC
>>>> device itself rather than its parent. This change enables better
>>>> support for Rust RTC drivers that store data on the RTC device.
>>>>
>>>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>>>> ---
>>>>    drivers/rtc/dev.c       |  4 ++--
>>>>    drivers/rtc/interface.c | 18 +++++++++---------
>>>>    drivers/rtc/rtc-pl031.c |  9 ++-------
>>>>    3 files changed, 13 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>>>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>>>> --- a/drivers/rtc/dev.c
>>>> +++ b/drivers/rtc/dev.c
>>>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>>    		}
>>>>    		default:
>>>>    			if (rtc->ops->param_get)
>>>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>>>> +				err = rtc->ops->param_get(&rtc->dev, &param);
>>>>    			else
>>>>    				err = -EINVAL;
>>>>    		}
>>>> @@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>>    		default:
>>>>    			if (rtc->ops->param_set)
>>>> -				err = rtc->ops->param_set(rtc->dev.parent, &param);
>>>> +				err = rtc->ops->param_set(&rtc->dev, &param);
>>>>    			else
>>>>    				err = -EINVAL;
>>>>    		}
>>>> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
>>>> index b8b298efd9a9c..783a3ec3bb93d 100644
>>>> --- a/drivers/rtc/interface.c
>>>> +++ b/drivers/rtc/interface.c
>>>> @@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
>>>>    		err = -EINVAL;
>>>>    	} else {
>>>>    		memset(tm, 0, sizeof(struct rtc_time));
>>>> -		err = rtc->ops->read_time(rtc->dev.parent, tm);
>>>> +		err = rtc->ops->read_time(&rtc->dev, tm);
>>>>    		if (err < 0) {
>>>>    			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
>>>>    				err);
>>>> @@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
>>>>    	if (!rtc->ops)
>>>>    		err = -ENODEV;
>>>>    	else if (rtc->ops->set_time)
>>>> -		err = rtc->ops->set_time(rtc->dev.parent, tm);
>>>> +		err = rtc->ops->set_time(&rtc->dev, tm);
>>>>    	else
>>>>    		err = -EINVAL;
>>>> @@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
>>>>    		alarm->time.tm_wday = -1;
>>>>    		alarm->time.tm_yday = -1;
>>>>    		alarm->time.tm_isdst = -1;
>>>> -		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
>>>> +		err = rtc->ops->read_alarm(&rtc->dev, alarm);
>>>>    	}
>>>>    	mutex_unlock(&rtc->ops_lock);
>>>> @@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>>>>    	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
>>>>    		err = -EINVAL;
>>>>    	else
>>>> -		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
>>>> +		err = rtc->ops->set_alarm(&rtc->dev, alarm);
>>>>    	/*
>>>>    	 * Check for potential race described above. If the waiting for next
>>>> @@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>>>>    	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>>>>    		err = -EINVAL;
>>>>    	else
>>>> -		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
>>>> +		err = rtc->ops->alarm_irq_enable(&rtc->dev, enabled);
>>>>    	mutex_unlock(&rtc->ops_lock);
>>>> @@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>>>>    		rtc->uie_rtctimer.period = ktime_set(1, 0);
>>>>    		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
>>>>    		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
>>>> -			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
>>>> +			err = rtc->ops->alarm_irq_enable(&rtc->dev, 1);
>>>>    		if (err)
>>>>    			goto out;
>>>>    	} else {
>>>> @@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
>>>>    	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>>>>    		return;
>>>> -	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
>>>> +	rtc->ops->alarm_irq_enable(&rtc->dev, false);
>>>>    	trace_rtc_alarm_irq_enable(0, 0);
>>>>    }
>>>> @@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
>>>>    		return -EINVAL;
>>>>    	mutex_lock(&rtc->ops_lock);
>>>> -	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
>>>> +	ret = rtc->ops->read_offset(&rtc->dev, offset);
>>>>    	mutex_unlock(&rtc->ops_lock);
>>>>    	trace_rtc_read_offset(*offset, ret);
>>>> @@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
>>>>    		return -EINVAL;
>>>>    	mutex_lock(&rtc->ops_lock);
>>>> -	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
>>>> +	ret = rtc->ops->set_offset(&rtc->dev, offset);
>>>>    	mutex_unlock(&rtc->ops_lock);
>>>>    	trace_rtc_set_offset(offset, ret);
>>>> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
>>>> index eab39dfa4e5fe..a605034d44cb7 100644
>>>> --- a/drivers/rtc/rtc-pl031.c
>>>> +++ b/drivers/rtc/rtc-pl031.c
>>>> @@ -284,10 +284,6 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>>>>    static void pl031_remove(struct amba_device *adev)
>>>>    {
>>>> -	struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
>>>> -
>>>> -	if (adev->irq[0])
>>>> -		free_irq(adev->irq[0], ldata);
>>>>    	amba_release_regions(adev);
>>>>    }
>>>> @@ -320,8 +316,6 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>>>    		goto out;
>>>>    	}
>>>> -	amba_set_drvdata(adev, ldata);
>>>> -
>>>>    	dev_dbg(&adev->dev, "designer ID = 0x%02x\n", amba_manf(adev));
>>>>    	dev_dbg(&adev->dev, "revision = 0x%01x\n", amba_rev(adev));
>>>> @@ -356,6 +350,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>>>    		ret = PTR_ERR(ldata->rtc);
>>>>    		goto out;
>>>>    	}
>>>> +	dev_set_drvdata(&ldata->rtc->dev, ldata);
>>>>    	if (!adev->irq[0])
>>>>    		clear_bit(RTC_FEATURE_ALARM, ldata->rtc->features);
>>>> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>>>    		goto out;
>>>>    	if (adev->irq[0]) {
>>>> -		ret = request_irq(adev->irq[0], pl031_interrupt,
>>>> +		ret = devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
>>>>    				  vendor->irqflags, "rtc-pl031", ldata);
>>> Are you _SURE_ you can use devm for this?  it is a functional change,
>> Since ldata's lifecycle is now tied to the RTC device (stored via
>> dev_set_drvdata(&ldata->rtc->dev, ldata)), and the RTC device's lifecycle
>> is tied to the amba_device (via devm_rtc_allocate_device(&adev->dev)),
>> using devm_request_irq(&adev->dev, ...) allows us to remove the manual IRQ
>> release in pl031_remove, as the IRQ will be automatically released along
>> with the amba_device lifecycle.
> Please test this.  There are loads of race conditions that can happen
> when irqs are bound to devm lifecycles.  You are changing the behavior
> here, so be very careful.

Yes, I'm testing this with pl031 (qemu), ds3231, rk808, and other devices.

Using rtcwake and hwclock for concurrent access, while continuously

unbinding/binding devices.


>
> And again, this is a change that was not documented in the changelog,
> and should not be part of this patch, it should be stand-alone.

Regarding the RTC C refactoring that affects 182 files, should I put all

changes in one patch, or create separate patches for each file?


Best regards,

Ke Sun

>
> thanks,
>
> greg k-h


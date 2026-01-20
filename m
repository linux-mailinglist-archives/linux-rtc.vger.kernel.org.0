Return-Path: <linux-rtc+bounces-5797-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE67D3C22F
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 09:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F1894666CE
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 08:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CA840759A;
	Tue, 20 Jan 2026 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oen+uj12"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70700407571
	for <linux-rtc@vger.kernel.org>; Tue, 20 Jan 2026 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896108; cv=none; b=XSFM3q2RJJHcxXrA4nWU1PLsLyJb2YIMzGGrJMxT1sXx7ebp4DpP2lYxuXHqvMEpRU/tgswVvFBA5nKaiiIU5MjvwT87V/+SK6DTe1rcLOfDDvwqzrwYFHKS03YIymzWRM9AbcPty/TeFmCqsmw2vg7lzaaQRhbVdjeRY621+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896108; c=relaxed/simple;
	bh=0vtMIkWvFv38BtB2UgJNGiK8/4dNFQkMGCAxXn5LHe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvVpcqc0H42FyGmmHtdER1QfxXic0evY3POtG8l703PTBx/j00fZ4OHl6nXZzQW6ZNMIOJhOdylGM3COl0M3WVYMAvscFBNk+pVAoHdh5Zhj1dOrApp41SSV+AK5L4FZ0+kaxevp1F96D5xA1RVwPg5cg+1A49vHU5zxKqOPY1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oen+uj12; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a0f3f74587so32007735ad.2
        for <linux-rtc@vger.kernel.org>; Tue, 20 Jan 2026 00:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768896106; x=1769500906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABvBbtXQdnWyWjUicvGm8YHeqIfqX8LGFS6NrmCUBwM=;
        b=Oen+uj12t/T5JZ29/CrMYuuYa5z6h9R2CCb/bUnXmPWHf+DeHkqWY+jiKP8gyz6DIZ
         OjnDuoSK9qGef1YVd2BjbIwtcILL2qGSzzLdr8yYSej1a5xEr9NFX7TX7Od6NxM3W9S+
         F8Lcmg5pkazJS+jQVmf6WPY3X/8kV8rjpIDxEiFlHzn8/xSVjDjRjkADaw6woy+8m8CN
         Z57iY3C/ha3Wu6Fwy2+g89hhhSVnA5ASLfm1sk/Hjp4QWhtyqvPz9qxYQTA1FS+HRywL
         4FKCmRWGkO45VFyuTVSZiDfzIN0iPKHnW6rG/M8sbH6THwrgh6RnHsaBG/73rX8AxD6M
         GUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768896106; x=1769500906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABvBbtXQdnWyWjUicvGm8YHeqIfqX8LGFS6NrmCUBwM=;
        b=R9aK/VE1xjiXUMY4BVK8INAwGk1Wwq8XOIKndt6RXtdnS9zCkwl/NwYxO8sD6vjR9t
         od8UI3nKH5IHKeWfJwlD0fD+1+6i3LgSu2MUqxNw+EdeickW1vK5g3ex8ZlbOVgEanks
         pHcXYcbl7KtfpyjliN2rY7NEd2Ozcjx7mGCXvWxmzmUqyGhOsAWK4XI0KglkBIK9IQp9
         +Pl7wZdtMq7FPMxa+2JynQVEVEDxlqtklgElwdRJCAxs0Z+9X2Zoz4zgZKV0qcRXqgng
         iERZ/qXDZAN1BOTPFvMz3XHNdJwbieaGBgRoCCL6gvizjk60Z4gUAcer8U8lEhiVFbPF
         34Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVL6C/8TAw3nGc5/eQbyVkAZW0gEP2raHKXLmJIzNTDjHgDKBt6L3ef7TXTFojG3wjHN7MQWVUI4Zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZlh32UN656wAb818UDCvrvDaFZh/WAK2N5zQHQpOoZk1ukf6
	lQ06NmoA2oJEbtwFMtHokaHmEAZ50SUHkuCnl5F9dpvAmv8J4vheojzfOFIxEaD0X0lx1w==
X-Gm-Gg: AZuq6aLPY5ijGlHa4c1QSVK4pRVueImjjQCdI2Ay9QD4UAFdIHPQ7nxody63Lk+Hhha
	M8ctwlNploCUbPuWXweUzosh1Ndc3KeB1xFH8txqKZrtzGeTd6tpri71Cj7MQR8En/woT5RjhWZ
	mFGgyOMR/xuKJj1jmavEXa9RSi5cg6v/yAoukWxvH9dcmfD3pyXJhS+ddseQufhUN1jHrwMZ/HX
	1tmx4NHhX9Spz1y8tyN079ggFIiVJPDCsoyglZmrzbxfdm3gYm6+UtVSe1PbrfdRn3VlXMJHCHu
	KrpK2evflPPJzQI6RZ2XKMOjZjJvWC7jLc4gACL+kpXM7Knw3igAoArwGY4vsJLbIpCdpUq0pzx
	lu4OsM1hbn2CS0rHUCRXDHkxVBetGozC3JB1bNdMVkgdlxcBv2b9/biM2a2NNBMJ/OFPB
X-Received: by 2002:a17:902:d488:b0:295:7b89:cb8f with SMTP id d9443c01a7336-2a717413b94mr107094885ad.0.1768896105606;
        Tue, 20 Jan 2026 00:01:45 -0800 (PST)
Received: from [10.0.10.3] ([2403:2c80:17::10:4008])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941c56bsm116454455ad.92.2026.01.20.00.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 00:01:45 -0800 (PST)
Message-ID: <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
Date: Tue, 20 Jan 2026 16:01:40 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
To: Danilo Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/19/26 22:32, Danilo Krummrich wrote:
> On Fri Jan 16, 2026 at 5:21 PM CET, Ke Sun wrote:
>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>> index baf1a8ca8b2b1..eddcc5a69db3b 100644
>> --- a/drivers/rtc/dev.c
>> +++ b/drivers/rtc/dev.c
>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>   		}
>>   		default:
>>   			if (rtc->ops->param_get)
>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>> +				err = rtc->ops->param_get(rtc_ops_dev(rtc), &param);
>>   			else
>>   				err = -EINVAL;
>>   		}
> <snip>
>
>> +/**
>> + * rtc_ops_dev - Get the device pointer for RTC ops callbacks
>> + * @rtc: RTC device
>> + *
>> + * Returns &rtc->dev if RTC_OPS_USE_RTC_DEV flag is set,
>> + * otherwise returns rtc->dev.parent.
>> + */
>> +static inline struct device *rtc_ops_dev(struct rtc_device *rtc)
>> +{
>> +	if (test_bit(RTC_OPS_USE_RTC_DEV, &rtc->flags))
>> +		return &rtc->dev;
>> +	return rtc->dev.parent;
>> +}
> I understand that the idea is to gradually convert all drivers to use the RTC
> device, rather than it's parent device in RTC device callbacks.
>
> My main concern is that once that has been achieved it's still not what we want
> to have eventually, i.e. RTC device callbacks should ideally take a struct
> rtc_device as argument and not the embedded base struct device.
>
> I.e. we'd kick off a conversion process that won't reach the actual desired
> state.
Hi Danilo,

This is indeed an intermediate step.

Full cleanup is in progress, but it's large and untested. I'm working on a
complete cleanup involving ~190+ files across arch/, drivers/rtc/, and
drivers/virtio/. Most changes are straightforward interface replacements,
but some drivers need additional modifications. Given the scale, I haven't
fully tested everything and can't guarantee correctness yet.

The intermediate step enables gradual migration, allowing us to:
- Clean up and test each rtc driver incrementally
- Ensure correctness through gradual changes
- Avoid breaking existing functionality

Once all cleanup is complete and tested, changing all rtc_class_ops
callbacks to use struct rtc_device * will be much simpler and safer.

Currently there seem to be only these two approaches. I'm still waiting
for Alexandre's suggestion on how to proceed specifically, but haven't
received a response yet.

Best regard,
Ke Sun


Return-Path: <linux-rtc+bounces-5676-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6094BD00674
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 00:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F10C63009F9A
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 23:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D512EC54C;
	Wed,  7 Jan 2026 23:35:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CBF28D8E8
	for <linux-rtc@vger.kernel.org>; Wed,  7 Jan 2026 23:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767828936; cv=none; b=uPXy7xQ9LIURyCO0NHW9fv/b6yo7O+JTvf7l2ps4w5KLx2l49HkArFoMSbHoUXwZqX0P1fQBy96INQeEieOBBljGg0W0i3jt6OviMTPLltxATCJliPnX/wW48NHTCWP8pJZorcDQRNodZHma6S7Yn03lbqN1Je0hlZh0ZL5mz24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767828936; c=relaxed/simple;
	bh=mzO2goGm6PS6IpL178MXBE6X5B2+d20zdttar6IAt2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfcTdneMftapXqxzCS8LtQPfiAw2xSgmN/kB0W2LQ06JlTa2B4GqO6Sw4dCuEwKWMIuR+bQVpQmZzupkNKiKGPXlatxAOjE2Vj0+KFFCCkF2fdJyQfnLt+E6mwoxU6ukX+tn7Nty5auQRCHAtpTpu55aNXDm9qkNXFypWXN3kQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1618160b3a.1
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 15:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767828934; x=1768433734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7SmvBKhefSRY5v6j0S35kFBdyQUA9WZzMSifi1qiZ8=;
        b=QTX36ErEyoFFw1E6KhndufvNYGGO2+DFYkeV06P03EgZBtjDXbKbd2/RJnqYinB013
         eZbZ5jR8BF3A1oZ/8a3GlaNKrxigTx+pwN4u3heBh/lTtn2f4mWYWqDPuyCZOg2lIuQS
         Tc+TeFxxXacBkB9EeMUmlQepS6hPsYHuNGCiAW8sCK6utNJe8HHPwTEysoi7+3WmL1Hw
         UXukvxk3lrM4zjssTJBR/H+SKRbIA0A3AtDPvxT8idDL67ML+Mi26tzbxFRQfmZrWALO
         CWzhgysF+0DMjwuJObjjJAT3HlL4Rp1fJyxXwJS88yU/Eg59pa1hRVsXBI6WeC6sJwbD
         2YDw==
X-Forwarded-Encrypted: i=1; AJvYcCX5qqIFht/FvKv2jC+8p1k2gEH2tu5+owqva1RrYdd/APTloD5aDAKLvajGC8+BukyiNaTHSLxMQq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YymR310GH9x+MH2MZ/vDL3I5QgSas82+OyQTFMCWtc5sy/n9Q/C
	somc9LsiqPHx6DpA08VIAF450Iyp9vWvoqkEinM1lTvxRFk6VGzYK+Mu
X-Gm-Gg: AY/fxX4OrmbzPTcnDLgUtBQI38XSqO93zxBW6ZYXtZUewNsQh98BVpBUy41yL8/LNlj
	zkkiKSvE1aAk4U5ywinwUL0Xm7HDzCpFAEODIguU0Wfn12U0Lol9c+O6bA9iUYZstcq32w9zTvT
	EZ5P9GfyaF9441/iAOc1zik7eB5FhOA9pptWWAt4G3F3raNXB9DqUsmNzMZKc9k0EoXotAqcVQM
	KVKYAd6fTJXF/s7ZUhHfYj9JzkLotcj0bf2vjI/i2Jr//gr9xWK2Jb+k1pbCPhfo2Q9xpwtEJxV
	4+WFol0OX01ttnT8VYXxEGq15UCPlUmKO9wpnOEIbl5R0/Th11hfbOOFYodYVNOVKXnSsiMowIu
	7zNQgbXtsq6hOINFh7wLXR44FVAjwZ2+cxdVPTtNCWB/+d5e5B7dUCvUFdaUTL9cRUKPqaLqIlU
	x7N+s=
X-Google-Smtp-Source: AGHT+IHfHxn4Rl9WabCLXJcjqoeGquyMm3u4gU382wmWog6fhnrOswHl/vsrPJ9gkMQKesE89PQr+g==
X-Received: by 2002:a05:6a20:94cb:b0:340:c6cd:5452 with SMTP id adf61e73a8af0-3898f8f47aamr3883904637.30.1767828934087;
        Wed, 07 Jan 2026 15:35:34 -0800 (PST)
Received: from [192.168.200.2] ([2403:2c80:17::10:4008])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm6061183a12.23.2026.01.07.15.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 15:35:33 -0800 (PST)
Message-ID: <a2bf4177-2962-4c43-9ac0-ccbe84cb3edf@kylinos.cn>
Date: Thu, 8 Jan 2026 07:35:27 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/5] rust: add device wakeup capability support
To: Greg KH <greg@kroah.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-4-sunke@kylinos.cn>
 <2026010701-rendering-upheaval-e056@gregkh>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <2026010701-rendering-upheaval-e056@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/7/26 22:57, Greg KH wrote:
> On Wed, Jan 07, 2026 at 10:37:35PM +0800, Ke Sun wrote:
>> Add Rust bindings and wrappers for device wakeup functionality,
>> including devm_device_init_wakeup() and dev_pm_set_wake_irq().
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   rust/bindings/bindings_helper.h |  2 ++
>>   rust/helpers/device.c           |  7 +++++++
>>   rust/kernel/device.rs           | 17 ++++++++++++++++-
>>   rust/kernel/irq/request.rs      |  7 +++++++
>>   4 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
>> index fa697287cf71b..d6c2b06ac4107 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -88,6 +88,8 @@
>>   #include <linux/workqueue.h>
>>   #include <linux/xarray.h>
>>   #include <trace/events/rust_sample.h>
>> +#include <linux/pm_wakeup.h>
>> +#include <linux/pm_wakeirq.h>
> Aren't these sorted?
>
>>   /*
>>    * The driver-core Rust code needs to know about some C driver-core private
>> diff --git a/rust/helpers/device.c b/rust/helpers/device.c
>> index 9a4316bafedfb..cae26edd83696 100644
>> --- a/rust/helpers/device.c
>> +++ b/rust/helpers/device.c
>> @@ -1,6 +1,8 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   
>>   #include <linux/device.h>
>> +#include <linux/pm_wakeup.h>
>> +#include <linux/pm_wakeirq.h>
> Why are both of these needed for just one function call?
Hi Greg,

You're absolutely right. `#include <linux/pm_wakeirq.h>` is not needed in

device.c - that was my mistake. I'll also sort the includes in 
bindings_helper.h

alphabetically.


I will address both issues in the next version.

Thanks,
Ke Sun
>
> thanks,
>
> greg k-h


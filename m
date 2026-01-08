Return-Path: <linux-rtc+bounces-5699-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E195AD0335D
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A28183201625
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 13:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246CB4D1644;
	Thu,  8 Jan 2026 13:45:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BDE4D162C
	for <linux-rtc@vger.kernel.org>; Thu,  8 Jan 2026 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879942; cv=none; b=T3YgLtwyGR72cosSMtRR5K9db7hkAas/vbYNQZPUWFNj9JncmAYZJnVRg3L7SeQwlRop9qgM7gjQ3kFK6SkXm3F+lb6S0xpktF2BKm/133VarlovpodY11bW08xVafRA++fxwsXdG4UvyGUJR1de3ooEiiDjjU2uDAOmIW+WUD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879942; c=relaxed/simple;
	bh=GrmvpqiziF56Q0Dk05a0FV54bdVuh4XlxV7dyFtow+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwxepPUrInOHYPn4YnWB5O7g4dDTyLqCIjT8/dA0wWKzim2fSQXSRMEQdiWVQ1A5fUMPQ+B7q4eU4cXtS8BHiTCK/gidfIPYavJq7P0j4AuntS5s8j/r0qR0sGQ4y2zSP5//5sXElk4FiWHlCkzdYFuivs4yFXTJ2NXDEOd27j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81c72659e6bso1036537b3a.0
        for <linux-rtc@vger.kernel.org>; Thu, 08 Jan 2026 05:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879937; x=1768484737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1e5OPUc4ALFm6BKAa3GGC2+rxUwWfa6AC5HZABAAJgY=;
        b=mEtqOxnmNIeVBTeOUKFDAtd7xo0zFD8t/x/o6PBGjqZOU8gDzv/ybhG/30uqhPfLBR
         5zM6iCKAWyaiz7BEwY9R3bZBOYTsP1SRW3OuIuJfVhAj+3sDwXb8ZWEmX5Mr45f8l2m4
         dWRk6TdB9VtxZ3JcEe0dDxxe68x8Y4bNkjr7B19prxr0QQ867hTG2rkpN9yMMMlqoxtj
         zME3KZf/dQXoDJ04nqy+WQE0PnonWX1bsk7txbRwGA4xkU81dcXpb/MrWhu3HTk9LBge
         7zJeHJExDuLxDb+hrR8cz8XSy5W3P/IgPQqFfYUoIp8eky7E3a6570JTD4LBBga5lf5k
         IYhg==
X-Forwarded-Encrypted: i=1; AJvYcCXRR5LECwLDvyd6DxnHOeYyiqIZY4TjiT860P052sD8q0pvvCMzv1CRVI3ifyJwNNZI+wgS261+fSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9PP1oxxFTfRbJuaux7TxDKEajoY2aBwM4oTjF6de8RFq5+5IZ
	Jm9jxiIPpFuhRcvj8CkrjoWLKYCVX9rGiPyOgNRnBINKvZ5mVOd3vgm5
X-Gm-Gg: AY/fxX5P2dGKx54msrDw/aFKOVuI6qypiE/QzsWrXnR4w8idC63Vo+w9Pyc9Swch0Bk
	0aiNoDuZ1LxumGh5OqG/n2WmPOpV6KSZ8OYysQ0j3Ss+gZjQPiaTuHqpLSllSC4ODhDBCZcyQaE
	ryp++FbEsZ4mMMqZhhZ20rZ2RNoOTawRRkA7f/eptcKeDZVvd219E0t/svKGfgSOoMRezMFQL12
	JebGzjNNdAsh3tn1OaNUp/sYk5NWaPTvnP+Rkk1CG+axQMKd3/FQPiYZtn4zgkzeolf1CTW1j1I
	4A0+h7V5F597DNkrdRjyOKwmZ6dI4uydHV9zI4zt3b25j6SHyYeFEMxKI37Eod7ujr1ilisV1+f
	mqhQynuE87Ls0Ei3wxrnIAI1TSFDYSW+1K1y3nm8uRI47WmIqF0xi3b4KD74ru7BkNKPei8LAN0
	ckugfFKpSI9f4n1Cjrfz1y736JyUn6wLK9P1fqL8d4BAgo4IU=
X-Google-Smtp-Source: AGHT+IErqk5YtJqJoDcrNKDl/R4uJ3+oA5O9puPvRka960BgDpPlxRbK+hoKFRMiLIiXbpB3Oaqj5A==
X-Received: by 2002:a05:6a00:801b:b0:7ff:9f67:d47b with SMTP id d2e1a72fcca58-81b7d95cfb7mr6092802b3a.8.1767879936835;
        Thu, 08 Jan 2026 05:45:36 -0800 (PST)
Received: from [192.168.200.2] (61-221-120-114.hinet-ip.hinet.net. [61.221.120.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm7938637b3a.0.2026.01.08.05.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:45:36 -0800 (PST)
Message-ID: <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
Date: Thu, 8 Jan 2026 21:45:30 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/8/26 19:12, Danilo Krummrich wrote:
> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
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
> It would make more sense to just pass a struct rtc_device than the embedded
> struct device in the RTC callbacks.
I considered passing struct rtc_device directly, but chose &rtc->dev
to minimize changes to existing drivers, since most callbacks use
dev_get_drvdata() on the device parameter.
>
>> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>   		goto out;
>>   
>>   	if (adev->irq[0]) {
>> -		ret = request_irq(adev->irq[0], pl031_interrupt,
>> +		ret = devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
>>   				  vendor->irqflags, "rtc-pl031", ldata);
> As Greg already mentioned that change should be a separate patch.
>
> You also have to be careful with the devres order when using devm_request_irq().
>
> In your case, you pass ldata, so you have to ensure that ldata (and its
> contents) remain valid until the devres callback frees the IRQ request.

I'll only start modifying other RTC drivers after I have a clear

understanding of all the details, and I'll minimize any functional

changes.


These C RTC refactoring patches will be sent as a new patch series

to the RTC mailing list.


Best regards,
Ke Sun


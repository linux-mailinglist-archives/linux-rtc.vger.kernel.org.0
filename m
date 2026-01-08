Return-Path: <linux-rtc+bounces-5703-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C39D03509
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C19F315BDE9
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 14:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542844D3DB6;
	Thu,  8 Jan 2026 14:01:16 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A914D3DB9
	for <linux-rtc@vger.kernel.org>; Thu,  8 Jan 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880876; cv=none; b=jh/yuMyAvAZCG7zFkCDU1wuXVwL+b1gBkw8jXjiq6OoKplX1a5SrHtqfuBLoDnmf5Zkhg/Vzzvt+n78iFVMe6huSTbRQ6Pgj7fjt+MHkl/FpCKeDlncXrrrR3k14SXWB5Hs7LVb1LLrG/m/5RRqmbly5KnkvHTr00s1d+1C2wHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880876; c=relaxed/simple;
	bh=DcZvH2zgvGci8yXM45Wi3orScuxbe1NN6toZCcJtVvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RI5plkZVyM7BBsfv3kIwcfnWZRMMlDuV6yUAsxBashOTX0foSS4OfWSCui+dW3dE7ayZLwV9hcU9O0APVTgQPKD9WY6whA7v4qjUZ4DPkOwfWHQ/nez/I1AX0rCmIC3io2Jw5bASnN8esUKii5TTydtH2/BD5WPiO+boBc1ZUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64669a2ecb5so2494270d50.1
        for <linux-rtc@vger.kernel.org>; Thu, 08 Jan 2026 06:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880873; x=1768485673;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mu9j1d0zwqXTX3kF5q/ih9Y7OvIi2+noGJOfEuGy4tE=;
        b=PjDEXIM9xIiFaybaSs/u0DUwLc8TlLPYPuNgvM4rTPSaTvGBuXEh4gmjLgtfuDxJ/+
         mcmy070v0TX4vBDJuwbQ+1iGYMUVVA47X20LmWBX9KxD9yuIt91Wt++nlajpCGu17E5G
         VX1x7gafxtY/FMx262FViwd4DPM8U5QkCbtnJBpvdVPlVmyPM7LJg93OaObTdd7LzoRC
         zKL1y+OVEm+wJJXdjgZEDem64dyIcDoSj3rw76SYVc0ixC0CzrzNfEDzz0SCqbkAJZ8z
         pKmBiGCdi5Vhgql6UN5XTXl1Nztq8pGGobDXkFGRm4QpAM9+j9ZfJtg+TVu+QfX2MnwN
         ZUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQrjseZbFta1hy1W4jki9QRrUBTYq8oq79NGXEICET64DGEZienL2l+BBfPbDTq06gMdqPuEP6USc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys2Tl0vMhkccjg1Dg4IwbPxaHbgN8B6e7mWC9OKsDquhO7074G
	pEplZQq4rfBx0Xm5wvMeq6XE5mRi1hQ3tCASSBzkjB6usy0YcGU6/WyL
X-Gm-Gg: AY/fxX62qNk3Ehh/AdQH3EoLAbw5eQiOP8gWrfIfZDqmXRoZ/a6Y9dvy3Is1fIRb5Hc
	clyi+wAxvms3jANqCWvvVQYqzLp8XjEp1ybIh3g90dyE+lOlFFSrmKq8VXVDlLS806gjQgDfpKZ
	qUSeB5eAZh8wLGcqa8pZ1SRWSQzr+aBth+Z8AUMp0focZirxjIMx78vVzHpg+OFbFYjf6zJC3v+
	aKUVDi7ywBq1nlKWta8/bzSumx9T4Jkca+thy6FPxOYSDr6Xki7jHqRGZX3aZE+o0vecnjsxpoz
	lsyaBuKkvaHH4ca3MSkHoKDSkDM0gf/5ngaFXZ/ljj2VRju4DGkXAa+xZrXgDvaSFk/BSmXfQUb
	U9SYwXKSlAdBBkLLqWaUE/QSnJT/qr5LyiOmoE3UpqFsXu7StaVQXg0VGMSvKui+h/a9S
X-Google-Smtp-Source: AGHT+IH5K5445Kfqgo7jjV/P54c8sg1GX76ZF62YaOnIOUkJdYPeiSk+pPewMd1dXlbX7RqQcb5RdA==
X-Received: by 2002:a05:690e:11cb:b0:644:4eec:22a with SMTP id 956f58d0204a3-647165d5dc6mr5422074d50.2.1767880873045;
        Thu, 08 Jan 2026 06:01:13 -0800 (PST)
Received: from [192.168.200.2] ([2a11:8080:200::1:10a2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6a0538sm29724197b3.38.2026.01.08.06.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:01:12 -0800 (PST)
Message-ID: <3a4b0edf-b14e-4059-9f79-1541584fdd2d@kylinos.cn>
Date: Thu, 8 Jan 2026 22:01:04 +0800
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
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
 <DFJ99UZAU51H.JP1VEERVR81W@kernel.org>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DFJ99UZAU51H.JP1VEERVR81W@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/8/26 21:52, Danilo Krummrich wrote:
> On Thu Jan 8, 2026 at 2:45 PM CET, Ke Sun wrote:
>> On 1/8/26 19:12, Danilo Krummrich wrote:
>>> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
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
>>> It would make more sense to just pass a struct rtc_device than the embedded
>>> struct device in the RTC callbacks.
>> I considered passing struct rtc_device directly, but chose &rtc->dev
>> to minimize changes to existing drivers, since most callbacks use
>> dev_get_drvdata() on the device parameter.
> No, you should not expose the embedded base device. For accessing the private
> data you should add helpers like rtc_get_drvdata(). This is what other
> subsystems do as well, e.g. [1].
>
> [1] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/i2c.h#L371
Yes, that's the right approach. I'll use it in the new patch series.

Best regards,
Ke Sun


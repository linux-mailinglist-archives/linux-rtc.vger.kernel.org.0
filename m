Return-Path: <linux-rtc+bounces-5701-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F698D033FD
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DDA230082E8
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 14:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D4E4418C3;
	Thu,  8 Jan 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uprtZKQ5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A79141A05C;
	Thu,  8 Jan 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880333; cv=none; b=Fhi0A0SRANE5jf5o1IKmnD3WMb9x8QUQ0jiqY/Y45xWgz6Hai4lz/8Gt6qKIia6ZHa8qzJmjQd7ArgtWaF4kFyiYJnXnwvCj5UwutcoosqUoNztwLb8v5JbKDpJ/EDNV+KZDb/yuTWTmi8344ArZb41nTPnpc6VOk43sBSwlr9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880333; c=relaxed/simple;
	bh=cF7Z4gLPhGfziCQtNaZsontzXUGKEsdVuJTRBki6a0w=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=R42PmJJtHKMg858X3io57VWhOtPsDIQTeuVA0botaAvLPCPoQPE409lftR9axWnbq56sF4PeJXjrDcTtqPvvfi9BicM10dF2VgTS4ZVgwUycvrK90g+LB8cOakBAjdiK7JHwegITGz5tzyKW2u4bACyR9ophNznJ1Q45CgtxZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uprtZKQ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13ADAC116C6;
	Thu,  8 Jan 2026 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880332;
	bh=cF7Z4gLPhGfziCQtNaZsontzXUGKEsdVuJTRBki6a0w=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=uprtZKQ5W0f4xMv+SNU6a7qvjM1EMR6UyJZpzdr5SzBSUIfD5pgIznVyOdP9hy+fM
	 0Kx+2iUooJ+CSBaiUnw5Glrsu1KTlf1pMPxT0nEDCDzJ1NOZwGMrHm/pAyyJ09QQE5
	 956hw3JIuBPCDZpew1wGlCJ+n3SHAXMiZhrSPOg/xfGuy10IKkfJgh1B2A5WRxKQdL
	 FxvH8JGwnk9MrozbVP8bcsnusfvNm46hQ/2/TRV/atY3tl6yFw0b+J7/Vfyvkwbg/S
	 0RUINaztFUK3tX6mAUZQgmyH5y8PIALuHB94Mr4ujxzM97djFOy3y0DSzauFFdB9F/
	 geNbtjhxiCUuw==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 14:52:08 +0100
Message-Id: <DFJ99UZAU51H.JP1VEERVR81W@kernel.org>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alvin Sun" <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
In-Reply-To: <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>

On Thu Jan 8, 2026 at 2:45 PM CET, Ke Sun wrote:
>
> On 1/8/26 19:12, Danilo Krummrich wrote:
>> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
>>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>>> --- a/drivers/rtc/dev.c
>>> +++ b/drivers/rtc/dev.c
>>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>   		}
>>>   		default:
>>>   			if (rtc->ops->param_get)
>>> -				err =3D rtc->ops->param_get(rtc->dev.parent, &param);
>>> +				err =3D rtc->ops->param_get(&rtc->dev, &param);
>> It would make more sense to just pass a struct rtc_device than the embed=
ded
>> struct device in the RTC callbacks.
> I considered passing struct rtc_device directly, but chose &rtc->dev
> to minimize changes to existing drivers, since most callbacks use
> dev_get_drvdata() on the device parameter.

No, you should not expose the embedded base device. For accessing the priva=
te
data you should add helpers like rtc_get_drvdata(). This is what other
subsystems do as well, e.g. [1].

[1] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/i2c.h#L37=
1


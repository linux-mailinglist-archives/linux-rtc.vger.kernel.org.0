Return-Path: <linux-rtc+bounces-5758-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F95D21C8C
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jan 2026 00:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 849BA300C359
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 23:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D4A33D6DE;
	Wed, 14 Jan 2026 23:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICaNNi/e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC733A9E7;
	Wed, 14 Jan 2026 23:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768434544; cv=none; b=PWmU6w1+HWk3kyyuZUMAc6yft4A119QA6M5eMrMeau4Sa8aSRELzAn0fIVzAV9o+EeTxL6iQJpsM5Y89xNSlRsbw0KZZncL4nQh5fi62cNBdSODcBrdY4YbnqRQfRLIvbBd4HPuRm2dzj8Zel4fbjbDzydWdQwLrAlG45/A+5NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768434544; c=relaxed/simple;
	bh=WrU0nd30cE62l7IFXBP/o4olc05IiEIAwIvtEDhil/Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GmFKP5B87dfOn365qDNyAP5VuASyv1dCdiUwaDAukHuReK2T15cG+gIwfMWodttBYj5kMzYC+tXyWXD2ty820Ga2FIrNyNrMkhoamonAIm0ORkAcgECN+5OvWBxI512o7cu01y7lP/ujQo2LXRSfOi06uCfMxY3he4Qrr85iPaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICaNNi/e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EE9C4CEF7;
	Wed, 14 Jan 2026 23:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768434544;
	bh=WrU0nd30cE62l7IFXBP/o4olc05IiEIAwIvtEDhil/Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ICaNNi/eMbhz4vSJw9R1pyrpCUDSTG740pNOysXqGyiATrOZ/rz1AAKpQVWuOh/ee
	 dzMHU2iHfnPLf944MXBlbKHZDwStU3QiaM0VjoDZeCBqudOuzIY2Swf4i1cije07WJ
	 ZhqZV1N6lcse6O9zHt/SuPA0T/h6t+AUg1QQcqDrmOYup2/nRWlg6jmGzh0khrVaSJ
	 XpMmcxFdhUEd6iYCDkkjq8ybiZ3EkHkCOawTjqtBVxS7fOuqQJOWX38/MXVujyJLrm
	 7CDdkAUGPVkUVr4aS8jI3edyatgayjXPY7s5o2GXjHM4DXyu03LS13JTWAqpLWgVw0
	 o/6iy55wXlvXw==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 00:48:59 +0100
Message-Id: <DFOPQ45F1X6O.12KGJHFREKNED@kernel.org>
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-rtc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Alvin Sun"
 <sk.alvin.x@gmail.com>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
 <DFJ99UZAU51H.JP1VEERVR81W@kernel.org> <202601081401239bbfff9d@mail.local>
 <f426f19d-a14c-4d9c-8587-2f7b4290024a@kylinos.cn>
In-Reply-To: <f426f19d-a14c-4d9c-8587-2f7b4290024a@kylinos.cn>

On Thu Jan 15, 2026 at 12:23 AM CET, Ke Sun wrote:
> RTC ops callbacks receive struct device * as the first parameter.
> Traditionally this is rtc->dev.parent (the physical bus device), but Rust
> drivers store driver data on rtc->dev itself,

This is not only about Rust. Class device private data should be stored in =
the
driver_data field of the struct device embedded in the class device in gene=
ral.

> so callbacks need &rtc->dev =C2=A0to access it.

Class device callbacks should just carry the class device itself, rather th=
an
the embedded struct device.

> We considered switching all callbacks to use rtc->dev directly, but that =
would
> require modifying =C2=A0182 RTC drivers and extensive testing/validation =
work.

I don't know if it's that bad, the change would be trivial. You just need t=
o
repeat it pretty often. :) Tools like Coccinelle [1] can help a lot with su=
ch
refactorings.

> Instead, we propose an alternative approach:
>
> - Added RTC_OPS_USE_RTC_DEV flag (currently stored in rtc->features bitma=
p)
> - Created rtc_ops_dev() helper that returns &rtc->dev if flag is set,=20
> otherwise
>  =C2=A0 =C2=A0rtc->dev.parent. Default behavior (returning rtc->dev.paren=
t) maintains
>  =C2=A0 =C2=A0backward compatibility
> - Updated all rtc->ops->callback call sites to use rtc_ops_dev(rtc)

Not sure if that intermediate step is needed, but it doesn't seem unreasona=
ble
to me.

While eventually this is up to the RTC subsystem maintainer, from a driver-=
core
perspective this refactoring is encouraged:

Drivers should generally distinguish between stuff that is stored in the pr=
ivate
data of the bus device and private data of the class device, e.g. since the=
y
have independent lifecycles and not all data might be relevant in all scope=
s.

Forcing drivers to also store the class device private data in the parent b=
us
device private data can be considered an anti-pattern.

[1] https://docs.kernel.org/dev-tools/coccinelle.html


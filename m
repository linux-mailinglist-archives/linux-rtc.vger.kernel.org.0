Return-Path: <linux-rtc+bounces-5686-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F77BD02965
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 13:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D59CC303C81B
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 12:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952E944E05A;
	Thu,  8 Jan 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdlMXBxI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1150D44D029;
	Thu,  8 Jan 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870424; cv=none; b=exc0NoU9zXVatjoem7rcdSehfR5R+JsyE8v+G6eBmnXXr7uB4Sd/NdllHkKx9xgpgx2alS/H8jKN0tHBeoBcm3sVsGjz5hNkv7ur7YSIC/xDqCSoo8vt8zZC4pTMSbh9Kcr8Kt+sA9nm8TLIC2nmTdsq+3+qiq6fWzAekNFhthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870424; c=relaxed/simple;
	bh=FO/6TlAnof3wYBI4/+Lbgqni4sjG8d3s9ooDu/KM6Aw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sdmIaUZXGM9tGbaYW9dpX9+jqBE9krLkIwmwAdBmoQ7vS1NvrVQIqPi1YLDVk3HIuS3wVdaX0sl82uVrzpuQBm9xLLgSyDZusTeDLFQWlM5V/Zv6kGOCVINw3/HmKCSqX0Kw3zEXEw4mL7nW1uMRb9SkGiDRp0148kYLwKau+EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdlMXBxI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9140C16AAE;
	Thu,  8 Jan 2026 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767870422;
	bh=FO/6TlAnof3wYBI4/+Lbgqni4sjG8d3s9ooDu/KM6Aw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MdlMXBxILkESpe8WFNaq5AwUjw0Vz3TrjxDQO2WkeeY1Wv6NmcwW5/IcBFm7kTuGX
	 JoIZSnkaT/cQg+IUUbo6/DRjZYdriHpdH5cqCEpL9uZLvNLLgOsH1T9O2iwaBqDLlc
	 Mcx0H3pTGpSmB7FbMO1Fk4TnSy10ccEUX83eA5pQTr7vJiSJeJSQ9Cc17mXYGJ3S/3
	 LeIpcxeF1d23W4irfu6fXI4eBBxUamdn2SqmN943YqebhHScig1rR3AOs3wZnrmbDT
	 zCGeH1TgSn4p5Sndu8hfhzgRsVlG8vzJQ0peizX85HNKfk2s7UaBqZykKvWuTfvkdY
	 heT2aeO4sbjkA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 12:06:58 +0100
Message-Id: <DFJ5RE94Z5DL.ZVQ9N5TR8W7E@kernel.org>
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Cc: "Ke Sun" <sunke@kylinos.cn>, "Greg KH" <gregkh@linuxfoundation.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Ke Sun" <sk.alvin.x@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <2026010757-fester-unissued-6e5f@gregkh>
 <a95aff4b-5dbf-4def-803a-d5aea84113a5@kylinos.cn>
 <66e517b1-bc83-4c73-b2ea-73a31757ab44@gmail.com>
In-Reply-To: <66e517b1-bc83-4c73-b2ea-73a31757ab44@gmail.com>

On Thu Jan 8, 2026 at 1:24 AM CET, Ke Sun wrote:
> Correction: Should use devm_request_irq(&ldata->rtc->dev, ...) instead
>
> of devm_request_irq(&adev->dev, ...).
>
>
> While a lifecycle chain exists (ldata -> rtc -> amba_device), the IRQ=20
> should
>
> be bound to the device that uses it (the RTC device), matching where driv=
er
>
> data is stored, to avoid UAF.

No, that is wrong.

Your RTC device is a class device, not a bus device. I.e. it is not a
representation of physical device on the bus.

However, the requested IRQ is a physical device resource that belongs to a =
bus
device, which in your case is an AMBA device. (Please also see my reply [1]=
 from
the previous version again.)

Therefore device resources are only valid to access and hold on to for a dr=
iver
as long as it is bound to the corresponding bus device.

This is the fundamental reason why it is desirable to guard the lifetime of=
 the
class device and its callbacks with devres, to ensure that it is always val=
id to
access device resources from class device callbacks.

In C drivers, you just have to do the right thing, otherwise you indeed end=
 up
with UAFs. In Rust, we can leverage the type system to make it impossible f=
or
drivers to mess this up.

[1] https://lore.kernel.org/all/DFHJM2HAG7Q3.1HGZ3P7H55FD2@kernel.org/


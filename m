Return-Path: <linux-rtc+bounces-5640-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21BCF0F45
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 14:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13B54300443F
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 13:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A982F9C39;
	Sun,  4 Jan 2026 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbaYyay8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F838200C2;
	Sun,  4 Jan 2026 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767531613; cv=none; b=uk46MrOjpKb5D4NruXansNNX+qVfPLohxkvqtTFRM1EazPkkYcQzDCwXx91ZpPsbw1cUxddJcoKfkoewXVt+y5muDz5d+0TFLdZXcnW8JZtMeKG5ZfbbnL+OZisxSEyWaedCkEQkuhfX8IcBeJ0aVSQInaP/2wULyJdQSWj9UtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767531613; c=relaxed/simple;
	bh=3ZzLT4bU/cpzzyfz/PbrmNf6fUsTYuIk5I+Pbc3TB6c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=b3zVpd3rWb0u6RqvVloGvYUuGfnVnC8BIZswLugZSv+QTTb4w6GWW2Jn25xSQipYZgy5uJGd7gSeIj9EN2PyZpOIjtPkCfadcYqg43DW03pTdTdFzLSiikwuT5yErAxG1Cx4UihxGMdE9RvtIq2edU40KGq+HhjLDJK67tDeOM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbaYyay8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2DEC4CEF7;
	Sun,  4 Jan 2026 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767531612;
	bh=3ZzLT4bU/cpzzyfz/PbrmNf6fUsTYuIk5I+Pbc3TB6c=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=qbaYyay8x17845wqpttL5ONLiikZb55LDnjYbsAzabI8OBKxGMVoqf2p/PiTrdMhp
	 J/B8dmwcpUucCmDKYC92zgyuVkNlvzIYtRbTm9faN5KGaAypd87fyqPbvnpmtpl6n5
	 PjL2dN5Qz7qQ3RLwLbiVQeKJKVBYsay1JYLSOsLU8U73zU8UQvse/R7wbTWjtixiyh
	 V+zUBkPJHruJ6FyK8f31Q20UZvCbJ4/tr05g/lq6Yy8i6cthphafEX35YrTMg9AROn
	 wrjLuBMg9g2I4vJ6CbuJd6D9u5ujJ0JOPxCW9t4vpLtCYwItN++5owV8vfjqC+Hm1U
	 JhnphrvNRFGFA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 14:00:08 +0100
Message-Id: <DFFTNV97F57X.J3Z7X4OH2FU8@kernel.org>
Subject: Re: [RFC PATCH v1 3/4] rust: add RTC core abstractions and data
 structures
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alvin Sun" <sk.alvin.x@gmail.com>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-4-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-4-sunke@kylinos.cn>

On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
> Add Rust abstractions for RTC (Real-Time Clock) devices, including:
>
> - Data structures: RtcTime, RtcWkAlrm, RtcParam wrappers for RTC types
> - RtcDevice: Safe wrapper for struct rtc_device
> - DriverGeneric trait: Generic RTC driver trait over bus types
> - RtcOperations trait: VTable for RTC device operations
> - Bus abstractions: PlatformBus, AmbaBus, I2cBus implementations

This is my main concern with this patch: It bakes bus (device) code (e.g.
platform AMBA and I2C) into the RTC code, effectively duplicating infrastru=
cture
where it does not belong to in the first place and limites on which bus RTC
devices can be registered artificially.

The driver model has a loosely coupled design between bus and class device =
code,
such that class devices can be registered freely from any driver driving a =
bus
device. There can also be more complicated topologies considering the auxil=
iary
bus, mfd, etc.

Please remove the duplicated bus (device) code and helper types and macros,=
 such
as BusRegistration, impl_bus!, etc. Instead, please have a look at how the =
PWM
code works and incorporate the design.

Additionally, you can utilize the AsBusDevice trait to find the concrete bu=
s
device (e.g. AMBA) in your class device callbacks from the generic parent d=
evice
of your RTC device.

I will take a more thorough look at the code from the driver core side of t=
hings
once this has been addressed.

Thanks,
Danilo


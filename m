Return-Path: <linux-rtc+bounces-5641-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80DDCF0F72
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 14:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5067E300FE12
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 13:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAC02FABE1;
	Sun,  4 Jan 2026 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fs8d/GkF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7852D0C66;
	Sun,  4 Jan 2026 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767532232; cv=none; b=tuYjHYrjUMhi4iazQpwM0VajppHde/lWpXVognmTO13Ke6+Ypkij2QGVeNuyXKPw73QK5qSvlNco1VKdCNGPzwrwyf1Z5hkixowcRJqAXTpsXF1LibNwMwGMe/Es34mAaG5JP/RomENi7AF89R/8zk9UlEPDQUQPmPz6ELI/FHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767532232; c=relaxed/simple;
	bh=sImsGIn9EgTlTBgNqCOoY51nPdt4KBN0It3Txnu22Aw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HM6HplNvsdaNb7xyMhX9+a8q45t17xDe7T4ynYov4F6fD6/Q2DkmLkVJJKGj/zxxE+d2pn/MFECgUDKkxDCZ1NplJRwwlux7rX70M0W8PfEBoWA7UzVFcS9k8gT9fwxAM1V8CVQUj8S8Jrkj35vu04iBj940zYl0u6Kn77wXCf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fs8d/GkF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153E4C4CEF7;
	Sun,  4 Jan 2026 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767532231;
	bh=sImsGIn9EgTlTBgNqCOoY51nPdt4KBN0It3Txnu22Aw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Fs8d/GkFsM8kH6IAm8C8dFzxlEBfhIZH7jzWC3oBlIikxsN0Kga+tsQOsfPAoz+wc
	 C0TtT35fX3+dVnkMLf9UVK6b5dooWOyTnTcbM61EmeQ4eZCUaeD3awpAJBdHa4eqLg
	 11KVWeNxMq9VHG2J3+yUiRFhVj/1lUSoml+1mKjBi16ZIHgvieP1S07zwFETyJfKIg
	 UkieU3013zlEHTxfjoZxsF9MS4PLENjG05F1vfA/MbnNx4bduEUGLFZf46+sIe+Iih
	 /hPiQc/+aMIMrJOlvsR0kAI2DIZy6JsVOqlQWrLl9CTHz528f/noj/8RsJpl+RhMDV
	 l8hmUFwwW/thQ==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 14:10:27 +0100
Message-Id: <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
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
 <20260104060621.3757812-5-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-5-sunke@kylinos.cn>

On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
> +/// PL031 RTC driver private data.
> +#[pin_data(PinnedDrop)]
> +struct Pl031DrvData {
> +    #[pin]
> +    base: Devres<IoMem<0>>,

Please do not use 0 as generic argument, this should likely be RTC_YLR + 0x=
4
(assuming that this register has a width of 32 bit).

It allows you to perform register accesses until RTC_YLR + 0x4 with infalli=
ble
accessors, since the call to IoMem::new() will validate that the memory reg=
ion
has at least a size of RTC_YLR + 0x4.

> +    variant: VendorVariant,
> +    /// RTC device reference for interrupt handler.
> +    ///
> +    /// Set in `init_rtcdevice` and remains valid for the driver's lifet=
ime
> +    /// because the RTC device is managed by devres.
> +    rtc_device: Option<ARef<RtcDevice>>,

I don't see a reason for a separate init_rtcdevice() method. Creating the R=
TC
device should happen in probe(), which also gets you rid of this odd Option=
.

> +}
> +
> +// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (S=
end+Sync),
> +// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync beca=
use `RtcDevice` is
> +// Send+Sync).
> +unsafe impl Send for Pl031DrvData {}
> +// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (S=
end+Sync),
> +// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync beca=
use `RtcDevice` is
> +// Send+Sync).
> +unsafe impl Sync for Pl031DrvData {}

Why not implement Send + Sync for RtcDevice then?

> +// Use AMBA device table for matching
> +kernel::amba_device_table!(
> +    ID_TABLE,
> +    MODULE_ID_TABLE,
> +    <Pl031DrvData as rtc::DriverGeneric<rtc::AmbaBus>>::IdInfo,
> +    [
> +        (
> +            amba::DeviceId::new_with_data(0x00041031, 0x000fffff, Pl031V=
ariant::ARM.to_usize()),
> +            Pl031Variant::ARM
> +        ),
> +        (
> +            amba::DeviceId::new_with_data(0x00180031, 0x00ffffff, Pl031V=
ariant::STV1.to_usize()),
> +            Pl031Variant::STV1
> +        ),
> +        (
> +            amba::DeviceId::new_with_data(0x00280031, 0x00ffffff, Pl031V=
ariant::STV2.to_usize()),

Why a constructor new_with_data() if you already store data through the gen=
eric
device ID mechanism right below?

> +            Pl031Variant::STV2
> +        ),
> +    ]
> +);


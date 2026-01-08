Return-Path: <linux-rtc+bounces-5690-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E18C9D0297A
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 13:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F482300DB07
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 12:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78C74D247E;
	Thu,  8 Jan 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jr8KAtK/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DB14D2477;
	Thu,  8 Jan 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873478; cv=none; b=XeyMC5LbDNgSfYPZKtEMzsIW8UNUnWRcXRof2VeHSWjLWc/JRvgVbuC1D1IYSDQ18D9ldvkGihrNWUVliYYJ0teTIpNLb2H0r5dURX1j3Dpt3QK6f3+8b4HAaG2mDztfJ+nOsB0zd6v5ZqykNmyRbrgCRu7fn715cd7K4A90G04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873478; c=relaxed/simple;
	bh=Z20toNNIFHGUKGrlfI/unnkmIS+rWevTQiz6zIPDKCE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Uj7DF2iuHbCUo0k0cg00WrvX2QDoTSnnzepaMzjuthCoDtAasjtJ3atnLl+1n/yppHncgwcLJG3JpQjL9d1hn7Xb3KD3dcd4B7/sYiw4B2C/yF8p81X4my0SZ6VTNh/S2H5PyBOl5X6gqYeuJPMQQg0I9LxfmnRqY+EiNeeGZys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jr8KAtK/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2D0C116C6;
	Thu,  8 Jan 2026 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767873477;
	bh=Z20toNNIFHGUKGrlfI/unnkmIS+rWevTQiz6zIPDKCE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=jr8KAtK/1ZZYfJcEGDjmTTUpBWVM9Ae+YP5tarPs7IbNNHyk6KVf4VKlsL96qcaZt
	 O2weNjb9KZ7GeJ7xODzdrnfPbntyQZY7tqZBqiMSFFGkxkMV+dtU1aBLVVtbh+vZ0X
	 PYorU6LURfSXuVsT0x8VadYM0533/CuMeykNL2MhFJiQQ7KXoj7FNtVanN8vfi9Hva
	 Exfdodlp/Vm9269sDr16zKvsHtt9For3IGXiaDMvSWTCYS1kCOUbixN17IF7G2ibc9
	 qkIDO5ung4LdB21H30pmC2OGWUjCwO4W2qZMcWlr+Hk0/cKjvHOkAcNLTfEXV//UYY
	 V0vflTPAZ51/A==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 12:57:53 +0100
Message-Id: <DFJ6UDWFODEP.3RJFR83S468HV@kernel.org>
Subject: Re: [RFC PATCH v2 5/5] rust: add PL031 RTC driver
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alvin Sun" <sk.alvin.x@gmail.com>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-6-sunke@kylinos.cn>
In-Reply-To: <20260107143738.3021892-6-sunke@kylinos.cn>

On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
> +impl amba::Driver for Pl031AmbaDriver {
> +    type IdInfo =3D Pl031Variant;
> +    const AMBA_ID_TABLE: Option<amba::IdTable<Self::IdInfo>> =3D Some(&I=
D_TABLE);
> +
> +    fn probe(
> +        adev: &amba::Device<Core>,
> +        id_info: Option<&Self::IdInfo>,
> +    ) -> impl PinInit<Self, Error> {
> +        let dev =3D adev.as_ref();
> +        let io_request =3D adev.io_request().ok_or(ENODEV)?;
> +        let variant =3D id_info
> +            .map(|info| info.variant)
> +            .unwrap_or(VendorVariant::Arm);
> +
> +        let rtcdev =3D RtcDevice::<Pl031DrvData>::new(
> +            dev,
> +            try_pin_init!(Pl031DrvData {
> +                base <- IoMem::new(io_request),
> +                variant,
> +            }),
> +        )?;
> +
> +        dev.devm_init_wakeup()?;
> +
> +        let drvdata =3D rtcdev.drvdata()?;
> +        let base_guard =3D drvdata.base.try_access().ok_or(ENXIO)?;

You can just use drvdata.base.access(adev.as_ref()), the &amba::Device<Core=
>
(which derives to device::Device<Bound>) proves that this access is valid
without any sychronization.

(This is also the reason why you want the parent device as &Device<Bound> i=
n
your class device callbacks.)

> +        let base =3D base_guard.deref();
> +
> +        let mut cr =3D base.read32(RTC_CR);
> +        if variant.clockwatch() {
> +            cr |=3D RTC_CR_CWEN;
> +        } else {
> +            cr |=3D RTC_CR_EN;
> +        }
> +        base.write32(cr, RTC_CR);
> +
> +        if variant.st_weekday() {
> +            let bcd_year =3D base.read32(RTC_YDR);
> +            if bcd_year =3D=3D 0x2000 {
> +                let st_time =3D base.read32(RTC_DR);
> +                if (st_time & (RTC_MON_MASK | RTC_MDAY_MASK | RTC_WDAY_M=
ASK)) =3D=3D 0x02120000 {
> +                    base.write32(0x2000, RTC_YLR);
> +                    base.write32(st_time | (0x7 << RTC_WDAY_SHIFT), RTC_=
LR);
> +                }
> +            }
> +        }
> +
> +        rtcdev.set_range_min(variant.range_min());
> +        rtcdev.set_range_max(variant.range_max());
> +
> +        let irq_flags =3D if variant =3D=3D VendorVariant::StV2 {
> +            kernel::irq::Flags::SHARED | kernel::irq::Flags::COND_SUSPEN=
D
> +        } else {
> +            kernel::irq::Flags::SHARED
> +        };
> +
> +        let rtcdev_clone =3D rtcdev.clone();
> +        let init =3D adev.request_irq_by_index(
> +            irq_flags,
> +            0,
> +            c_str!("rtc-pl031"),
> +            try_pin_init!(Pl031IrqHandler {
> +                _pin: PhantomPinned,
> +                rtcdev: rtcdev_clone,
> +            }),
> +        );
> +
> +        match kernel::devres::register(dev, init, GFP_KERNEL) {

This is not needed, request_irq_by_index() already returns an
impl PinInit<Devres<_>, Error>, just store this in Pl031AmbaDriver.

> +            Ok(()) =3D> {
> +                if let Ok(irq) =3D adev.irq_by_index(0) {
> +                    irq.set_wake_irq()?;
> +                }
> +            }
> +            Err(_) =3D> rtcdev.clear_feature(bindings::RTC_FEATURE_ALARM=
),
> +        }
> +
> +        Registration::<Pl031DrvData>::register(dev, rtcdev)?;
> +        Ok(Pl031AmbaDriver)
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for Pl031DrvData {
> +    fn drop(self: Pin<&mut Self>) {
> +        // Resources are automatically cleaned up by devres.
> +    }
> +}

No need for this empty impl.


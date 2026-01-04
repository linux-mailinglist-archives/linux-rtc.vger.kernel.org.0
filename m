Return-Path: <linux-rtc+bounces-5642-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4900CF0FF4
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 14:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78BF33002935
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 13:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9E230DD38;
	Sun,  4 Jan 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXH8B4n+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B53233721;
	Sun,  4 Jan 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767533498; cv=none; b=AQZJBs7GLNAZsCWtVMYgDkTj04H0/HcSQw6rsXy8jx/8BBoqeh+YmDZDJ8Ys1JUQ4Q8txPcPqWz00SNpLT3cjCHLy2I2zCV8Wznoy3pzXbHD6nOIwetE8rbZP0+0o/go5DqC5YJ3Nx+ylHbVQl67hhta+zV08sjDWKTyjcIZlEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767533498; c=relaxed/simple;
	bh=qKVTbviAdHMDymvnlVI/evpD1JirgIJ2l3kfw83e80Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aV8TFXzAOLOcLJRB3vOgyPCHcptCb9VyB5TtkE/T8AgAteOZ3op1X/XHhagoPEkFbm4ZWmZ9Szt4aIEhe+45ogOiJDiMD3bZZn5tEjOtgf7FHNMZCA6HBKcc9gZ3tAIio7hk/RjtjGh6tiO8LuCYVapfSWl3wl3U2khCVH9x/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXH8B4n+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031ACC4CEF7;
	Sun,  4 Jan 2026 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767533497;
	bh=qKVTbviAdHMDymvnlVI/evpD1JirgIJ2l3kfw83e80Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=kXH8B4n+WiaoXnK5DlLZ7ajnsm88egM+BSk1woBsdL+M9WtBhXFK8jSQXwOxsrrCF
	 AF1PGVJP6xR4SdIBOMqfe5N4ZTIdOcxBIETSvlSbsOtXYk9QfCE+3QKfr0cMjMbI4E
	 mreKnuoUIXvlG5pE2ilqcwBFwSLPslNPK7zjALUFELsrEl9E9wxVA8Z93JQMnROgfh
	 bUYNOnYyDd6NOuK3oQzpIGLOaTSqSIDT65GIyJGdV+4tZHYDR/ZHJHAnYFzbanQF9K
	 Wo6PZjgCqR8zFZmwrlUtO1XZXQY9Jq7/WPsILe0tJcgauF0r64DDFiQ2usvL6Ti+tE
	 EA2CBRf06aUAA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 14:31:33 +0100
Message-Id: <DFFUBX61WWDD.3FE0Q8P9IMYXI@kernel.org>
Subject: Re: [RFC PATCH v1 2/4] rust: add device wakeup support
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-rtc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Alvin Sun"
 <sk.alvin.x@gmail.com>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-3-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-3-sunke@kylinos.cn>

(Cc: Greg, Rafael)

On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index c79be2e2bfe38..c064111a24531 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -325,6 +325,41 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>>=
 {
>          // - We've just checked that the type of the driver's private da=
ta is in fact `T`.
>          Ok(unsafe { self.drvdata_unchecked() })
>      }
> +
> +    /// Initialize device wakeup capability.
> +    ///
> +    /// Marks the device as wakeup-capable and enables wakeup. The wakeu=
p capability is
> +    /// automatically disabled when the device is removed (resource-mana=
ged).

Let's use "when the device is unbound". While "remove" is a common term for=
 this
as well, I prefer "unbind" since it is less ambiguous in this context.

> +    ///
> +    /// Returns `Ok(())` on success, or an error code on failure.
> +    pub fn init_wakeup(&self) -> Result {

Please call this devm_init_wakeup().

> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct devic=
e`.
> +        // The function is exported from bindings_helper module via pub =
use.
> +        let ret =3D unsafe { bindings::devm_device_init_wakeup(self.as_r=
aw()) };
> +        if ret !=3D 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +        Ok(())

Please use to_result() instead.

> +    }
> +
> +    /// Set a device interrupt as a wake IRQ.
> +    ///
> +    /// Attaches the interrupt `irq` as a wake IRQ for this device. The =
wake IRQ is
> +    /// automatically configured for wake-up from suspend. Must be calle=
d after
> +    /// [`Device::init_wakeup`].
> +    ///
> +    /// Returns `Ok(())` on success, or an error code on failure.
> +    pub fn set_wake_irq(&self, irq: i32) -> Result {

The irq argument should be a new type holding the irq number and a
&'a Device<Bound>, i.e. IrqRequest [1].

Technically, this can also be implemented on IrqRequest directly, this way =
no
additional check for comparing the device pointers is needed; but the metho=
d is
fallible anyways, and it is a bit odd to have this method on IrqRequest, so=
 I'd
abstain from this.

> +        if irq < 0 {
> +            return Err(crate::error::code::EINVAL);

You do not need the full qualified name, just EINVAL should work, but with =
the
above you don't need any manual irq number validation anyways.

> +        }
> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct devic=
e`.
> +        let ret =3D unsafe { bindings::dev_pm_set_wake_irq(self.as_raw()=
, irq) };
> +        if ret !=3D 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +        Ok(())

Please use to_result() instead.

> +    }
>  }

[1] https://rust.docs.kernel.org/kernel/irq/struct.IrqRequest.html


Return-Path: <linux-rtc+bounces-5639-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C90CF0EF0
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 13:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED2BC3000B0D
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 12:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740682C0F97;
	Sun,  4 Jan 2026 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5fSJLGS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B05621CC44;
	Sun,  4 Jan 2026 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767530269; cv=none; b=Ajei/DolnWR8ykkOF8il8E1gkbwbssMDrUO9VQBXQ5WkpuvAcSMXSb/1viParNdA1hvjObiPHhBEAC5u4zByV4ZtPgZy0/vhhIaOnMv4ZDMnL8sucH1paR5dC8VYh+j41FdjOjZYdDIsqyFRqC46psZgG9I+v0If+1NQe27QgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767530269; c=relaxed/simple;
	bh=GofnBp9Gm0p+t98w+nAQ/wFFuASBFnBUVDE1VLoggM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dCcI8tQeoofYfjNNA1azFjccjfp3n7L3Zh06BxbwrkU/a0ShSNJv+rh+ZDw+zCBBkTZn0DI4HIVIbrFDW1msGcLBm5lAhvwwo/yL77oIPyWFQnbNB21xSjcuZEyz5DO8SrMm5ieEMUXHgeo9jkC+zUG63ot9SdBodL8+Gp2Bb9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5fSJLGS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338DBC4CEF7;
	Sun,  4 Jan 2026 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767530268;
	bh=GofnBp9Gm0p+t98w+nAQ/wFFuASBFnBUVDE1VLoggM8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=o5fSJLGSOQHI6Fq88P0aJO5LHv/qYuA4Uzepsbu4IJ2wF8QZhDbjFaTInBlsWlQRd
	 AwGOYMdHYfHsXRlAW1Q5ACqSkwep8rmarNEmVS7s+VHmmCme6J6DikMvg0HPd+k+ao
	 ca/R7f2ZitLqgwQ0Rh4F3+tHV566aaNZFekWDn+SvFrd6wip/5yHThylIaaNhe7Rkl
	 hJHqPyEJD2eSmtfTjLN7uR1pPg9tOA+GkpAfjDEGiE8A0JdWi0SwR7HexoR6ok8gBc
	 7KedP65lYTLZF6lVh+wyLFTbDr1g/zcZilIuQp4Wnmy/uQNLf7gYNFd573W3B4nVhs
	 R1A09RJQY7QvA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 13:37:44 +0100
Message-Id: <DFFT6PR57TZ4.IG4LJVST0X8C@kernel.org>
Subject: Re: [RFC PATCH v1 1/4] rust: add AMBA bus abstractions
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
 <20260104060621.3757812-2-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-2-sunke@kylinos.cn>

On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
> Add Rust abstractions for the ARM AMBA bus, including:
> - Device type wrapper for amba_device
> - DeviceId for device matching
> - TryFrom implementation for converting device::Device to amba::Device
> - IRQ and I/O resource management methods

I don't see any Driver trait or Adapter implementation implementing to regi=
ster
and probe an AMBA driver.

Since I had a look at your RTC abstractions, I can see the reason why, i.e.=
 you
baked that part into the RTC abstractions, but this is not how the device /
driver model works. I will comment about this in the RTC patch. But for thi=
s
one, please implement thing analogous to platform, PCI, etc.

> +impl DeviceId {
> +    /// Creates a new device ID from an AMBA device ID and mask.
> +    ///
> +    /// A driver binds to a device when `(hardware_device_id & mask) =3D=
=3D id`.
> +    #[inline(always)]
> +    pub const fn new(id: u32, mask: u32) -> Self {
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut amba: bindings::amba_id =3D unsafe { core::mem::zeroed()=
 };

Please use pin_init::zeroed() instead.

> +        amba.id =3D id;
> +        amba.mask =3D mask;
> +        amba.data =3D core::ptr::null_mut();
> +
> +        Self(amba)
> +    }
> +
> +    /// Creates a new device ID with driver-specific data.
> +    #[inline(always)]
> +    pub const fn new_with_data(id: u32, mask: u32, data: usize) -> Self =
{
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut amba: bindings::amba_id =3D unsafe { core::mem::zeroed()=
 };

Same here.

> +        amba.id =3D id;
> +        amba.mask =3D mask;
> +        amba.data =3D data as *mut core::ffi::c_void;

What is this data? The driver specific data is derived from the index store=
d in
DRIVER_DATA_OFFSET. This does interfere with each other.

You already get driver specific data per entry from the generic code, you c=
an
just drop this.

> +    /// Returns the memory resource.
> +    pub fn resource(&self) -> Option<&Resource> {

Why does this return an Option if you do not have a None case? Are you sure
resource can never be NULL?

> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct =
amba_device`.
> +        let resource =3D unsafe { &raw mut (*self.as_raw()).res };
> +        // SAFETY: `resource` is a valid pointer to a `struct resource`.
> +        Some(unsafe { Resource::from_raw(resource) })
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<C=
tx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a
> +        // valid `struct amba_device`.
> +        let dev =3D unsafe { &raw mut (*self.as_raw()).dev };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +// SAFETY: `Device` is a transparent wrapper that doesn't depend on its =
generic
> +// argument.
> +crate::impl_device_context_deref!(unsafe { Device });
> +crate::impl_device_context_into_aref!(Device);
> +
> +impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Devi=
ce<Ctx> {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> =
{
> +        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is =
a valid pointer
> +        // to a `struct device`.
> +        if !unsafe { bindings::dev_is_amba(dev.as_raw()) } {
> +            return Err(crate::error::code::EINVAL);
> +        }
> +
> +        // SAFETY: We've just verified that the bus type of `dev` equals
> +        // `bindings::amba_bustype`, hence `dev` must be embedded in a v=
alid
> +        // `struct amba_device` as guaranteed by the corresponding C cod=
e.
> +        let adev =3D unsafe { container_of!(dev.as_raw(), bindings::amba=
_device, dev) };
> +
> +        // SAFETY: `adev` is a valid pointer to a `struct amba_device`.
> +        Ok(unsafe { &*adev.cast() })
> +    }
> +}

Please implement the AsBusDevice trait instead, this TryFrom solution you
probably found in the platform and PCI bus are for very specific cases. For
instance, if you have a driver that exports and auxiliary device, but is
supported on two busses.

In your case, you simply want to derive an amba device from a generic devic=
e in
a class device abstraction (RTC device), hence please incorporate the
AsBusDevice trait.

> +impl Device<device::Core> {}
> +
> +impl Device<device::Bound> {
> +    /// Returns an [`IoRequest`] for the memory resource.
> +    pub fn io_request(&self) -> Option<IoRequest<'_>> {
> +        self.resource()
> +            // SAFETY: `resource` is valid for the lifetime of the `IoRe=
quest`.
> +            .map(|resource| unsafe { IoRequest::new(self.as_ref(), resou=
rce) })
> +    }
> +
> +    /// Returns an [`IrqRequest`] for the IRQ at the given index.
> +    pub fn irq_by_index(&self, index: u32) -> Result<IrqRequest<'_>> {
> +        if index >=3D bindings::AMBA_NR_IRQS {
> +            return Err(crate::error::code::EINVAL);
> +        }
> +
> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct =
amba_device`.
> +        let irq =3D unsafe { (*self.as_raw()).irq[index as usize] };
> +
> +        if irq =3D=3D 0 {
> +            return Err(crate::error::code::ENXIO);
> +        }
> +
> +        // SAFETY: `irq` is guaranteed to be a valid IRQ number for `&se=
lf`.
> +        Ok(unsafe { IrqRequest::new(self.as_ref(), irq) })
> +    }
> +
> +    /// Requests an IRQ at the given index and returns a [`irq::Registra=
tion`].
> +    pub fn request_irq_by_index<'a, T: irq::Handler + 'static>(
> +        &'a self,
> +        flags: irq::Flags,
> +        index: u32,
> +        name: &'static CStr,
> +        handler: impl PinInit<T, Error> + 'a,
> +    ) -> Result<impl PinInit<irq::Registration<T>, Error> + 'a> {

Please don't return a Result here, the error code is already within the imp=
l
PinInit<T, Error>. Please use pin_init::pin_init_scope() instead.

> +        let request =3D self.irq_by_index(index)?;
> +
> +        Ok(irq::Registration::<T>::new(request, flags, name, handler))
> +    }
> +}


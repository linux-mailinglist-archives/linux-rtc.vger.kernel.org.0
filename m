Return-Path: <linux-rtc+bounces-5688-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6F7D0352A
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 896953009267
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 14:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD473A4F4D;
	Thu,  8 Jan 2026 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMhTZRBN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF043A4F5D;
	Thu,  8 Jan 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871767; cv=none; b=AFL/sr+oYVgUFqjqGHrH152TusEP5pe5u42xP+ehZdoufHxkucZeLlVNMZfiUcso1LRFPToQ4C1Tullb9dHufbwaehThShqtJyY/alRxSyFxM8Y0LHugOfpsfb5IulJrb44CDIBIsBBJ+p42wEIpMu0/IHUa/oFSH/nkaDBiqh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871767; c=relaxed/simple;
	bh=Kwnpczpjn/3AIA5iDcfX6v57+QXbIIoCKMks+IY6IqI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=I9tEA2rh2XzM6mB720G8UuFGuwrVQpe1GuK7RY+7DIXQoDs1of7diORFwzv2KUVYqMd28p4NaDS/2V0ORPnjgBUAcKMMp3zdXGU/kVNcgh6f8z9TdKwoixzQduUsdOLisEiS9UakWTX+qgaGY0Dw5zwR4Ci5O+RKioMe1MRjdmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMhTZRBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C9BC116C6;
	Thu,  8 Jan 2026 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767871767;
	bh=Kwnpczpjn/3AIA5iDcfX6v57+QXbIIoCKMks+IY6IqI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=UMhTZRBNCHum/7x+ZxNpjPAR5ge6GlVyBD1qp9NaFY9/Lu7Ctis5mLptS4jh5PRxK
	 oazn0Wh2j97m25EVWiQPYckZDWmRdFbbqTvDXsgAc01bTW0d8IWW5vGQDqefV/GJCG
	 euG0iWp5/xVj8xCOPyd+IQ/DaqTlJ4XfqrjJuKyvQSFm46m+TMV3z6l9l5rAD/WUDm
	 QNAsjjLLdiVMpn+S1VCtpfhRiEtUBHtICyR1pS1v5YjJFF+Rnr7UMPs7zjEJ19CIGC
	 BziVnicNxPnGL83GzdDiWOtT8emAZKmj2sSqnceFFnl/LpkmjGELSUS5tdDkK98naO
	 v5q7qvIODuUlg==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 12:29:22 +0100
Message-Id: <DFJ68JXI1A8L.3IMGZCIQQM2XE@kernel.org>
Subject: Re: [RFC PATCH v2 2/5] rust: add AMBA bus driver support
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
 <20260107143738.3021892-3-sunke@kylinos.cn>
In-Reply-To: <20260107143738.3021892-3-sunke@kylinos.cn>

On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
> +impl DeviceId {
> +    /// Creates a new device ID from an AMBA device ID and mask.
> +    #[inline(always)]
> +    pub const fn new(id: u32, mask: u32) -> Self {
> +        let mut amba: bindings::amba_id =3D pin_init::zeroed();
> +        amba.id =3D id;
> +        amba.mask =3D mask;
> +        Self(amba)
> +    }
> +
> +    /// Creates a new device ID with driver-specific data.
> +    #[inline(always)]
> +    pub const fn new_with_data(id: u32, mask: u32, data: usize) -> Self =
{
> +        let mut amba: bindings::amba_id =3D pin_init::zeroed();
> +        amba.id =3D id;
> +        amba.mask =3D mask;
> +        amba.data =3D data as *mut core::ffi::c_void;

I already mentioned that in the last version, you don't need this function =
and
writing the data pointer here is wrong, as it is already handled by common =
code,
i.e. through the offset given to RawDeviceIdIndex above.

> +        Self(amba)
> +    }

<snip>

> +impl Device<device::Core> {}

No need to add an empty impl block.

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
> +            return Err(EINVAL);
> +        }
> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct =
amba_device`.
> +        let irq =3D unsafe { (*self.as_raw()).irq[index as usize] };
> +        if irq =3D=3D 0 {
> +            return Err(ENXIO);
> +        }
> +        // SAFETY: `irq` is guaranteed to be a valid IRQ number for `&se=
lf`.
> +        Ok(unsafe { IrqRequest::new(self.as_ref(), irq) })
> +    }
> +
> +    /// Returns a [`irq::Registration`] for the IRQ at the given index.
> +    pub fn request_irq_by_index<'a, T: irq::Handler + 'static>(
> +        &'a self,
> +        flags: irq::Flags,
> +        index: u32,
> +        name: &'static CStr,
> +        handler: impl PinInit<T, Error> + 'a,
> +    ) -> impl PinInit<irq::Registration<T>, Error> + 'a {
> +        pin_init::pin_init_scope(move || {
> +            let request =3D self.irq_by_index(index).map_err(|_| EINVAL)=
?;

Why do you remap the error code from irq_by_index() to EINVAL unconditional=
ly?

> +            Ok(irq::Registration::<T>::new(request, flags, name, handler=
))
> +        })
> +    }
> +}

<snip>

> +    extern "C" fn shutdown_callback(adev: *mut bindings::amba_device) {
> +        // SAFETY: `shutdown_callback` is only ever called for a valid `=
adev`.
> +        let adev =3D unsafe { &*adev.cast::<Device<device::CoreInternal>=
>() };
> +        // SAFETY: `shutdown_callback` is only ever called after a succe=
ssful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drv=
data()` has been called
> +        // and stored a `Pin<KBox<T>>`.
> +        let data =3D unsafe { adev.as_ref().drvdata_obtain::<T>() };

Please use drvdata_borrow() instead, we must not free the device private da=
ta on
shutdown().

> +        T::shutdown(adev, data.as_ref());
> +    }
> +
> +    fn amba_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdIn=
fo>> {
> +        T::AMBA_ID_TABLE
> +    }
> +
> +    fn amba_id_info(
> +        _dev: &Device,
> +        id: *const bindings::amba_id,
> +    ) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
> +        if id.is_null() {
> +            return None;
> +        }
> +        let table =3D Self::amba_id_table()?;
> +        // SAFETY: `id` is a valid pointer to a `struct amba_id` that wa=
s matched by the kernel.
> +        // `DeviceId` is a `#[repr(transparent)]` wrapper of `struct amb=
a_id` and does not add
> +        // additional invariants, so it's safe to transmute.
> +        let device_id =3D unsafe { &*id.cast::<DeviceId>() };
> +        Some(table.info(<DeviceId as RawDeviceIdIndex>::index(device_id)=
))
> +    }
> +}
> +
> +impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
> +    type IdInfo =3D T::IdInfo;
> +
> +    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
> +        None
> +    }
> +
> +    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
> +        None
> +    }

There is no point implementing this trait with both functions returning Non=
e.

> +/// The AMBA driver trait.
> +///
> +/// Drivers must implement this trait in order to get an AMBA driver reg=
istered.
> +pub trait Driver: Send {
> +    /// The type holding information about each device id supported by t=
he driver.
> +    type IdInfo: 'static;
> +    /// The table of device ids supported by the driver.
> +    const AMBA_ID_TABLE: Option<IdTable<Self::IdInfo>> =3D None;

If it is the only ID table an AMBA driver can be matched through, it does n=
ot
make sense for the ID table to be optional.


Return-Path: <linux-rtc+bounces-5689-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42614D04481
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 17:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D97CC3154FC0
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 15:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C724968F5;
	Thu,  8 Jan 2026 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQ8Umqh8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D53B4963D2;
	Thu,  8 Jan 2026 11:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873057; cv=none; b=thiqJNy/5/P+jEmsvLNL+CEwoDNqu7/sD98v1LZCeBgmcBUt28tRDa2gQG020J9MJoJv6MAD+BiGaDZNXWf67P8A0EuHYa8MQyxv+JekJ32jhKlJZB9GrAbKVXxzhkxwVVDsotAPWRTt5ip0YRU4cJgc/HxSdlk68JoMi++XU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873057; c=relaxed/simple;
	bh=kNpCXbyUaj+8Nxh1eAE9fHdzSIyTw3PYaCCFB28Mamo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=m0HNYIS9y+23106RE/zxat/Jf5S1GbZDTj1flE2gXMUoO5fwVYker6Zfiuypd9v0foUyhvWQplUFoRDZfkfqLov06aM9vgU21YinOoNCBDzrTpOBs7A9HKNAHoablyM981YRmAuIBCBbAIbTXVSGIR5mGMBC/IFgLn2XXzGbUP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQ8Umqh8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C85C116C6;
	Thu,  8 Jan 2026 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767873056;
	bh=kNpCXbyUaj+8Nxh1eAE9fHdzSIyTw3PYaCCFB28Mamo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=iQ8Umqh8eLtGMwHhEhatu8iBSGwue7IWbs0Lo5k6QFwotAYv4VDv9cNJpHY9cPzH+
	 lF4F2rz+jTfGtxzNkRYk7WK8hCBfZSUpCofeMvQDHWWDy8fBl4lDAt4VwoATc3mow1
	 O0SdG5euScXwyPMPL81IVfFW+ZFT344IZrMY2ZEK37hJnhYwPSdPNIP3n9HCDczSsH
	 b5amgjrxwc79JPIUdzSLg4OiQMrDze+fn9f9qq+UIb+Hq+mKtbDv6iDiqIx3ccShwO
	 hJ/t6sJFx7RfSzq+D6938q+k1/2t54hisjViKR25Jty5S+sZGMXt7JJi6IziONDipr
	 ntPfrCqX507ow==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 12:50:52 +0100
Message-Id: <DFJ6P0ITWD1O.2PAYKPU63UFFC@kernel.org>
Subject: Re: [RFC PATCH v2 4/5] rust: add RTC core abstractions and data
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
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-5-sunke@kylinos.cn>
In-Reply-To: <20260107143738.3021892-5-sunke@kylinos.cn>

On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
> +/// A Rust wrapper for the C `struct rtc_device`.
> +///
> +/// This type provides safe access to RTC device operations. The underly=
ing `rtc_device`
> +/// is managed by the kernel and remains valid for the lifetime of the `=
RtcDevice`.
> +///
> +/// # Invariants
> +///
> +/// A [`RtcDevice`] instance holds a pointer to a valid [`struct rtc_dev=
ice`] that is
> +/// registered and managed by the kernel.
> +///
> +/// # Examples
> +///
> +/// ```rust
> +/// # use kernel::{
> +/// #     prelude::*,
> +/// #     rtc::RtcDevice, //
> +/// # };
> +/// // Example: Set the time range for the RTC device
> +/// // rtc.set_range_min(0);
> +/// // rtc.set_range_max(u64::MAX);
> +/// //     Ok(())
> +/// // }

This example looks pretty odd, and I don't think it does compile. Did you t=
est
with CONFIG_RUST_KERNEL_DOCTESTS=3Dy?

> +/// ```
> +///
> +/// [`struct rtc_device`]: https://docs.kernel.org/driver-api/rtc.html
> +#[repr(transparent)]
> +pub struct RtcDevice<T: 'static =3D ()>(Opaque<bindings::rtc_device>, Ph=
antomData<T>);
> +
> +impl<T: 'static> RtcDevice<T> {
> +    /// Obtain the raw [`struct rtc_device`] pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::rtc_device {
> +        self.0.get()
> +    }
> +
> +    /// Set the minimum time range for the RTC device.
> +    #[inline]
> +    pub fn set_range_min(&self, min: i64) {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid poin=
ter to a
> +        // `struct rtc_device`, and we're only writing to the `range_min=
` field.
> +        unsafe {
> +            (*self.as_raw()).range_min =3D min;
> +        }
> +    }
> +
> +    /// Set the maximum time range for the RTC device.
> +    #[inline]
> +    pub fn set_range_max(&self, max: u64) {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid poin=
ter to a
> +        // `struct rtc_device`, and we're only writing to the `range_max=
` field.
> +        unsafe {
> +            (*self.as_raw()).range_max =3D max;
> +        }
> +    }
> +
> +    /// Get the minimum time range for the RTC device.
> +    #[inline]
> +    pub fn range_min(&self) -> i64 {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid poin=
ter to a
> +        // `struct rtc_device`, and we're only reading the `range_min` f=
ield.
> +        unsafe { (*self.as_raw()).range_min }
> +    }
> +
> +    /// Get the maximum time range for the RTC device.
> +    #[inline]
> +    pub fn range_max(&self) -> u64 {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid poin=
ter to a
> +        // `struct rtc_device`, and we're only reading the `range_max` f=
ield.
> +        unsafe { (*self.as_raw()).range_max }
> +    }
> +
> +    /// Notify the RTC framework that an interrupt has occurred.
> +    ///
> +    /// Should be called from interrupt handlers. Schedules work to hand=
le the interrupt
> +    /// in process context.
> +    #[inline]
> +    pub fn update_irq(&self, num: usize, events: usize) {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid poin=
ter to a
> +        // `struct rtc_device`. The rtc_update_irq function handles NULL=
/ERR checks internally.
> +        unsafe {
> +            bindings::rtc_update_irq(self.as_raw(), num, events);
> +        }
> +    }
> +
> +    /// Clear a feature bit in the RTC device.
> +    #[inline]
> +    pub fn clear_feature(&self, feature: u32) {
> +        // SAFETY: By the type invariants, self.as_raw() is a valid poin=
ter to a
> +        // `struct rtc_device`, and features is a valid bitmap array wit=
h RTC_FEATURE_CNT bits.
> +        let features_bitmap =3D unsafe {
> +            Bitmap::from_raw_mut(
> +                (*self.as_raw()).features.as_mut_ptr().cast::<usize>(),
> +                bindings::RTC_FEATURE_CNT as usize,
> +            )
> +        };
> +        features_bitmap.clear_bit(feature as usize);
> +    }
> +}
> +
> +impl<T: 'static, Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> =
for RtcDevice<T> {

This should just be

	impl<T: 'static> AsRef<device::Device> for RtcDevice<T>

as class devices do not have a device context.

> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        let raw =3D self.as_raw();
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct rtc_device`.
> +        let dev =3D unsafe { &raw mut (*raw).dev };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +// SAFETY: `RtcDevice` is a transparent wrapper of `struct rtc_device`.
> +// The offset is guaranteed to point to a valid device field inside `Rtc=
Device`.
> +unsafe impl<T: 'static, Ctx: device::DeviceContext> device::AsBusDevice<=
Ctx> for RtcDevice<T> {
> +    const OFFSET: usize =3D core::mem::offset_of!(bindings::rtc_device, =
dev);
> +}

Please do not abuse this trait as container_of!(), as the name implies, it =
is
only for bus devices (hence also the device context generic). RTC devices a=
re
class devices.

> +impl<T: RtcOps> RtcDevice<T> {
> +    /// Allocates a new RTC device managed by devres.
> +    ///
> +    /// This function allocates an RTC device and sets the driver data. =
The device will be
> +    /// automatically freed when the parent device is removed.
> +    pub fn new(
> +        parent_dev: &device::Device,

This must be a &Device<Bound>, otherwise you are not allowed to pass it to
devm_rtc_allocate_device().

> +        init: impl PinInit<T, Error>,
> +    ) -> Result<ARef<Self>> {
> +        // SAFETY: `Device<Bound>` and `Device<CoreInternal>` have the s=
ame layout.
> +        let dev_internal: &device::Device<device::CoreInternal> =3D
> +            unsafe { &*core::ptr::from_ref(parent_dev).cast() };
> +
> +        // Allocate RTC device.
> +        // SAFETY: `devm_rtc_allocate_device` returns a pointer to a dev=
m-managed rtc_device.
> +        // We use `dev_internal.as_raw()` which is `pub(crate)`, but we =
can access it through
> +        // the same device pointer.
> +        let rtc: *mut bindings::rtc_device =3D
> +            unsafe { bindings::devm_rtc_allocate_device(dev_internal.as_=
raw()) };
> +        if rtc.is_null() {
> +            return Err(ENOMEM);
> +        }
> +
> +        // Set the RTC device ops.
> +        // SAFETY: We just allocated the RTC device, so it's safe to set=
 the ops.
> +        unsafe {
> +            (*rtc).ops =3D Adapter::<T>::VTABLE.as_raw();
> +        }
> +
> +        // SAFETY: `rtc` is a valid pointer to a newly allocated rtc_dev=
ice.
> +        // `RtcDevice` is `#[repr(transparent)]` over `Opaque<rtc_device=
>`, so we can safely cast.
> +        let rtc_device =3D unsafe { ARef::from_raw(NonNull::new_unchecke=
d(rtc.cast::<Self>())) };
> +        rtc_device.set_drvdata(init)?;
> +        Ok(rtc_device)
> +    }
> +
> +    /// Store a pointer to the bound driver's private data.
> +    pub fn set_drvdata(&self, data: impl PinInit<T, Error>) -> Result {

This should not be public, as you should only use it in RtcDevice::new().

> +        let data =3D KBox::pin_init(data, GFP_KERNEL)?;
> +        let dev: &device::Device<device::Bound> =3D self.as_ref();
> +
> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct rtc_d=
evice`.
> +        unsafe { bindings::dev_set_drvdata(dev.as_raw(), data.into_forei=
gn().cast()) };
> +        Ok(())
> +    }

<snip>

> +/// A resource guard that ensures the RTC device is properly registered.
> +///
> +/// This struct is intended to be managed by the `devres` framework by t=
ransferring its ownership
> +/// via [`devres::register`]. This ties the lifetime of the RTC device r=
egistration
> +/// to the lifetime of the underlying device.
> +pub struct Registration<T: 'static> {
> +    #[allow(dead_code)]
> +    rtc_device: ARef<RtcDevice<T>>,
> +}
> +
> +impl<T: 'static> Registration<T> {
> +    /// Registers an RTC device with the RTC subsystem.
> +    ///
> +    /// Transfers its ownership to the `devres` framework, which ties it=
s lifetime
> +    /// to the parent device.
> +    /// On unbind of the parent device, the `devres` entry will be dropp=
ed, automatically
> +    /// cleaning up the RTC device. This function should be called from =
the driver's `probe`.
> +    pub fn register(dev: &device::Device<device::Bound>, rtc_device: ARe=
f<RtcDevice<T>>) -> Result {
> +        let rtc_dev: &device::Device =3D rtc_device.as_ref();
> +        let rtc_parent =3D rtc_dev.parent().ok_or(EINVAL)?;
> +        if dev.as_raw() !=3D rtc_parent.as_raw() {
> +            return Err(EINVAL);
> +        }
> +
> +        // Registers an RTC device with the RTC subsystem.
> +        // SAFETY: The device will be automatically unregistered when th=
e parent device
> +        // is removed (devm cleanup). The helper function uses `THIS_MOD=
ULE` internally.
> +        let err =3D unsafe { bindings::devm_rtc_register_device(rtc_devi=
ce.as_raw()) };
> +        if err !=3D 0 {
> +            return Err(Error::from_errno(err));
> +        }
> +
> +        let registration =3D Registration { rtc_device };
> +
> +        devres::register(dev, registration, GFP_KERNEL)

You are using devm_rtc_register_device() above already, hence you neither n=
eed
an instance of Registration, nor do you need to manage this Registration wi=
th
devres through devres::register().

> +    }
> +}
> +
> +/// Options for creating an RTC device.
> +#[derive(Copy, Clone)]
> +pub struct RtcDeviceOptions {
> +    /// The name of the RTC device.
> +    pub name: &'static CStr,
> +}
> +
> +/// Trait implemented by RTC device operations.
> +///
> +/// This trait defines the operations that an RTC device driver must imp=
lement.
> +/// Most methods are optional and have default implementations that retu=
rn an error.
> +#[vtable]
> +pub trait RtcOps: Sized + 'static {

Please utilize the AsBusDevice trait to be able to provide the parent devic=
e of
the RTC device as &Device<Bound>, similarly to what is done in [1].

[1] https://lore.kernel.org/all/20260106-rust_leds-v10-1-e0a1564884f9@poste=
o.de/


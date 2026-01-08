Return-Path: <linux-rtc+bounces-5698-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B4D02F15
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 14:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 592FA3006738
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 13:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB0F4EAC89;
	Thu,  8 Jan 2026 13:17:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60E74E2A33
	for <linux-rtc@vger.kernel.org>; Thu,  8 Jan 2026 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878274; cv=none; b=qgJKzWnNoVMriwN22xrrVMtNPzmMxFBPuXxonrB+FQSaSrTdT4MfP9OSSHBFLkvBo0WZX7VbLEGqOY5sRKUm9cceyT9o3+s0v7WoGxpCwVh4IOuyt5lNBDDR6q1msNutWQRoWwKYLtYSiML+zh3tNRO/MoZCpIEggT5TBdCaoVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878274; c=relaxed/simple;
	bh=dtWa+YGtzddfNIUwkFmFlIOlV9VWXlUrri3DNFVZWpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IREBJ/zZZuKtNDD4I7uaadYDHeI9Jvf+CIf9LBlffe0Wj/Y213rIKneWEpYQcoGyA3xKnPgWnDrHhpgUTswrXPMJycuASGhf0ay6Ax1iKJF9FR4+I0UpYtxgFi0zNRjmlpsjWYMIIK/g/y0EXWd7KXRxLtTZLD7YBuFAU9fn3x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso24581145ad.3
        for <linux-rtc@vger.kernel.org>; Thu, 08 Jan 2026 05:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878269; x=1768483069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmEjhzYCxeCjE/oSSYNX31iUbZURZ9YpqT93kz8/CW8=;
        b=RkBMttAY9Q8xfLAVe8er8sAoQWopk5W72gJG7crZSInjf+u+G0zo/SkpTQcMFtsPtt
         VUC6vN5vyG3A03Y4MIsbiAQ/78N33ZHz1gXkMXWL1fSt9/maz/lTOdhd+4zJN54PSrtn
         YwScQqrRxMfXxhTTGJmP1PQPjf2Ff2URJReOQiBsk9w46qXJ+Z7ghlcIU7/iYF2DW1NZ
         A14L//vht8KZ1akuSxXXI9k5E/py/P6t8c9CUktbZ+PZnUPd+IQJlOiOMyt6mD0YTSu1
         A/9EsYUZzD5ZemAUAmTCVYfI8WbfI+OZcPwTqG6i2TgO/kJsjbZvAEYufX7TZE/3geue
         jJZA==
X-Forwarded-Encrypted: i=1; AJvYcCXrTlTRq4pusdNLFMZUW52Iq0HhQxruzwXt6AeFUDFkQAV0p4BcXxzsIRWaVuALEFd9s89zQQo4BRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/N3d1Hnu3l2fMfyc/4BEITqkMODC5fZdIuANk5Wht4lO3C4tY
	VKyPp4zzT2i3iq020g8lzEbsmx/+FvIvx2gx8uPVudNuldtnquKJtqNe
X-Gm-Gg: AY/fxX59hM0cwIQm5AhOoJzZqgRf1Uw6rtGlz8Aln3/829MIxEcT5QlKTS2/5vInj6b
	kgWtqPkPZTx4uCR+9cWU4OUgux4j3HZ7HyTySo7JytnekGNQkqLNtMKNXxnZ3CSO91W/tsr33AA
	q9nroGa1tJ9Jkn/dh+c0fWFwnUXGBc0DrvZ/4PrP60eMvK6KUgzh3mfbAMHYjtIKOcthbB3b00s
	iCXWqVIOTcil/pF4aZlkJVsmzm3iDVFq8Aj3H+9p3VkHDrJGiysV46JfeCeckAPEkNirAsiR6GK
	A8L/SQ3y5hWCRRZ0sG1FUXO90bLpDPf58Ce7qACBRFUzC8Wz41jadMkzKBG+V07zvxJe6TMv4BL
	rbNs1ScG9irzvs41o83Ot4lXw5OZS2N1VRF0L7bZ0BTVTrQ/kplPqRlgLA85qtNldp9/lyiJfDT
	FDoZVYs+MCqVW7JkE3WjZfmdg=
X-Google-Smtp-Source: AGHT+IEObFGUSFZADO3xkr1oXwRAkd6d18XHZKIq6Q9weG1w6TkFFMBEPsdYdjbgida6bF4M6xEeOw==
X-Received: by 2002:a17:903:1250:b0:24c:da3b:7376 with SMTP id d9443c01a7336-2a3ee43a15fmr56497845ad.26.1767878268870;
        Thu, 08 Jan 2026 05:17:48 -0800 (PST)
Received: from [192.168.200.2] ([45.142.165.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a4fcsm80637585ad.12.2026.01.08.05.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:17:48 -0800 (PST)
Message-ID: <b69749e0-e66d-425f-9d95-2d1bd4104e19@kylinos.cn>
Date: Thu, 8 Jan 2026 21:17:41 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/5] rust: add RTC core abstractions and data
 structures
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-5-sunke@kylinos.cn>
 <DFJ6P0ITWD1O.2PAYKPU63UFFC@kernel.org>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DFJ6P0ITWD1O.2PAYKPU63UFFC@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 19:50, Danilo Krummrich wrote:
> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
>> +/// A Rust wrapper for the C `struct rtc_device`.
>> +///
>> +/// This type provides safe access to RTC device operations. The underlying `rtc_device`
>> +/// is managed by the kernel and remains valid for the lifetime of the `RtcDevice`.
>> +///
>> +/// # Invariants
>> +///
>> +/// A [`RtcDevice`] instance holds a pointer to a valid [`struct rtc_device`] that is
>> +/// registered and managed by the kernel.
>> +///
>> +/// # Examples
>> +///
>> +/// ```rust
>> +/// # use kernel::{
>> +/// #     prelude::*,
>> +/// #     rtc::RtcDevice, //
>> +/// # };
>> +/// // Example: Set the time range for the RTC device
>> +/// // rtc.set_range_min(0);
>> +/// // rtc.set_range_max(u64::MAX);
>> +/// //     Ok(())
>> +/// // }
> This example looks pretty odd, and I don't think it does compile. Did you test
> with CONFIG_RUST_KERNEL_DOCTESTS=y?
Yes. Dirk suggested doctest in another patch series, which I enabled. I also

run clippy checks and QEMU tests for every change.


❯ cat .config| grep DOCTEST
CONFIG_RUST_KERNEL_DOCTESTS=y
❯ make Image CLIPPY=1
   CALL    scripts/checksyscalls.sh

>
>> +/// ```
>> +///
>> +/// [`struct rtc_device`]: https://docs.kernel.org/driver-api/rtc.html
>> +#[repr(transparent)]
>> +pub struct RtcDevice<T: 'static = ()>(Opaque<bindings::rtc_device>, PhantomData<T>);
>> +
>> +impl<T: 'static> RtcDevice<T> {
>> +    /// Obtain the raw [`struct rtc_device`] pointer.
>> +    #[inline]
>> +    pub fn as_raw(&self) -> *mut bindings::rtc_device {
>> +        self.0.get()
>> +    }
>> +
>> +    /// Set the minimum time range for the RTC device.
>> +    #[inline]
>> +    pub fn set_range_min(&self, min: i64) {
>> +        // SAFETY: By the type invariants, self.as_raw() is a valid pointer to a
>> +        // `struct rtc_device`, and we're only writing to the `range_min` field.
>> +        unsafe {
>> +            (*self.as_raw()).range_min = min;
>> +        }
>> +    }
>> +
>> +    /// Set the maximum time range for the RTC device.
>> +    #[inline]
>> +    pub fn set_range_max(&self, max: u64) {
>> +        // SAFETY: By the type invariants, self.as_raw() is a valid pointer to a
>> +        // `struct rtc_device`, and we're only writing to the `range_max` field.
>> +        unsafe {
>> +            (*self.as_raw()).range_max = max;
>> +        }
>> +    }
>> +
>> +    /// Get the minimum time range for the RTC device.
>> +    #[inline]
>> +    pub fn range_min(&self) -> i64 {
>> +        // SAFETY: By the type invariants, self.as_raw() is a valid pointer to a
>> +        // `struct rtc_device`, and we're only reading the `range_min` field.
>> +        unsafe { (*self.as_raw()).range_min }
>> +    }
>> +
>> +    /// Get the maximum time range for the RTC device.
>> +    #[inline]
>> +    pub fn range_max(&self) -> u64 {
>> +        // SAFETY: By the type invariants, self.as_raw() is a valid pointer to a
>> +        // `struct rtc_device`, and we're only reading the `range_max` field.
>> +        unsafe { (*self.as_raw()).range_max }
>> +    }
>> +
>> +    /// Notify the RTC framework that an interrupt has occurred.
>> +    ///
>> +    /// Should be called from interrupt handlers. Schedules work to handle the interrupt
>> +    /// in process context.
>> +    #[inline]
>> +    pub fn update_irq(&self, num: usize, events: usize) {
>> +        // SAFETY: By the type invariants, self.as_raw() is a valid pointer to a
>> +        // `struct rtc_device`. The rtc_update_irq function handles NULL/ERR checks internally.
>> +        unsafe {
>> +            bindings::rtc_update_irq(self.as_raw(), num, events);
>> +        }
>> +    }
>> +
>> +    /// Clear a feature bit in the RTC device.
>> +    #[inline]
>> +    pub fn clear_feature(&self, feature: u32) {
>> +        // SAFETY: By the type invariants, self.as_raw() is a valid pointer to a
>> +        // `struct rtc_device`, and features is a valid bitmap array with RTC_FEATURE_CNT bits.
>> +        let features_bitmap = unsafe {
>> +            Bitmap::from_raw_mut(
>> +                (*self.as_raw()).features.as_mut_ptr().cast::<usize>(),
>> +                bindings::RTC_FEATURE_CNT as usize,
>> +            )
>> +        };
>> +        features_bitmap.clear_bit(feature as usize);
>> +    }
>> +}
>> +
>> +impl<T: 'static, Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for RtcDevice<T> {
> This should just be
>
> 	impl<T: 'static> AsRef<device::Device> for RtcDevice<T>
>
> as class devices do not have a device context.
>
>> +    fn as_ref(&self) -> &device::Device<Ctx> {
>> +        let raw = self.as_raw();
>> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
>> +        // `struct rtc_device`.
>> +        let dev = unsafe { &raw mut (*raw).dev };
>> +
>> +        // SAFETY: `dev` points to a valid `struct device`.
>> +        unsafe { device::Device::from_raw(dev) }
>> +    }
>> +}
>> +
>> +// SAFETY: `RtcDevice` is a transparent wrapper of `struct rtc_device`.
>> +// The offset is guaranteed to point to a valid device field inside `RtcDevice`.
>> +unsafe impl<T: 'static, Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for RtcDevice<T> {
>> +    const OFFSET: usize = core::mem::offset_of!(bindings::rtc_device, dev);
>> +}
> Please do not abuse this trait as container_of!(), as the name implies, it is
> only for bus devices (hence also the device context generic). RTC devices are
> class devices.
>
>> +impl<T: RtcOps> RtcDevice<T> {
>> +    /// Allocates a new RTC device managed by devres.
>> +    ///
>> +    /// This function allocates an RTC device and sets the driver data. The device will be
>> +    /// automatically freed when the parent device is removed.
>> +    pub fn new(
>> +        parent_dev: &device::Device,
> This must be a &Device<Bound>, otherwise you are not allowed to pass it to
> devm_rtc_allocate_device().
>
>> +        init: impl PinInit<T, Error>,
>> +    ) -> Result<ARef<Self>> {
>> +        // SAFETY: `Device<Bound>` and `Device<CoreInternal>` have the same layout.
>> +        let dev_internal: &device::Device<device::CoreInternal> =
>> +            unsafe { &*core::ptr::from_ref(parent_dev).cast() };
>> +
>> +        // Allocate RTC device.
>> +        // SAFETY: `devm_rtc_allocate_device` returns a pointer to a devm-managed rtc_device.
>> +        // We use `dev_internal.as_raw()` which is `pub(crate)`, but we can access it through
>> +        // the same device pointer.
>> +        let rtc: *mut bindings::rtc_device =
>> +            unsafe { bindings::devm_rtc_allocate_device(dev_internal.as_raw()) };
>> +        if rtc.is_null() {
>> +            return Err(ENOMEM);
>> +        }
>> +
>> +        // Set the RTC device ops.
>> +        // SAFETY: We just allocated the RTC device, so it's safe to set the ops.
>> +        unsafe {
>> +            (*rtc).ops = Adapter::<T>::VTABLE.as_raw();
>> +        }
>> +
>> +        // SAFETY: `rtc` is a valid pointer to a newly allocated rtc_device.
>> +        // `RtcDevice` is `#[repr(transparent)]` over `Opaque<rtc_device>`, so we can safely cast.
>> +        let rtc_device = unsafe { ARef::from_raw(NonNull::new_unchecked(rtc.cast::<Self>())) };
>> +        rtc_device.set_drvdata(init)?;
>> +        Ok(rtc_device)
>> +    }
>> +
>> +    /// Store a pointer to the bound driver's private data.
>> +    pub fn set_drvdata(&self, data: impl PinInit<T, Error>) -> Result {
> This should not be public, as you should only use it in RtcDevice::new().
>
>> +        let data = KBox::pin_init(data, GFP_KERNEL)?;
>> +        let dev: &device::Device<device::Bound> = self.as_ref();
>> +
>> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct rtc_device`.
>> +        unsafe { bindings::dev_set_drvdata(dev.as_raw(), data.into_foreign().cast()) };
>> +        Ok(())
>> +    }
> <snip>
>
>> +/// A resource guard that ensures the RTC device is properly registered.
>> +///
>> +/// This struct is intended to be managed by the `devres` framework by transferring its ownership
>> +/// via [`devres::register`]. This ties the lifetime of the RTC device registration
>> +/// to the lifetime of the underlying device.
>> +pub struct Registration<T: 'static> {
>> +    #[allow(dead_code)]
>> +    rtc_device: ARef<RtcDevice<T>>,
>> +}
>> +
>> +impl<T: 'static> Registration<T> {
>> +    /// Registers an RTC device with the RTC subsystem.
>> +    ///
>> +    /// Transfers its ownership to the `devres` framework, which ties its lifetime
>> +    /// to the parent device.
>> +    /// On unbind of the parent device, the `devres` entry will be dropped, automatically
>> +    /// cleaning up the RTC device. This function should be called from the driver's `probe`.
>> +    pub fn register(dev: &device::Device<device::Bound>, rtc_device: ARef<RtcDevice<T>>) -> Result {
>> +        let rtc_dev: &device::Device = rtc_device.as_ref();
>> +        let rtc_parent = rtc_dev.parent().ok_or(EINVAL)?;
>> +        if dev.as_raw() != rtc_parent.as_raw() {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Registers an RTC device with the RTC subsystem.
>> +        // SAFETY: The device will be automatically unregistered when the parent device
>> +        // is removed (devm cleanup). The helper function uses `THIS_MODULE` internally.
>> +        let err = unsafe { bindings::devm_rtc_register_device(rtc_device.as_raw()) };
>> +        if err != 0 {
>> +            return Err(Error::from_errno(err));
>> +        }
>> +
>> +        let registration = Registration { rtc_device };
>> +
>> +        devres::register(dev, registration, GFP_KERNEL)
> You are using devm_rtc_register_device() above already, hence you neither need
> an instance of Registration, nor do you need to manage this Registration with
> devres through devres::register().
>
>> +    }
>> +}
>> +
>> +/// Options for creating an RTC device.
>> +#[derive(Copy, Clone)]
>> +pub struct RtcDeviceOptions {
>> +    /// The name of the RTC device.
>> +    pub name: &'static CStr,
>> +}
>> +
>> +/// Trait implemented by RTC device operations.
>> +///
>> +/// This trait defines the operations that an RTC device driver must implement.
>> +/// Most methods are optional and have default implementations that return an error.
>> +#[vtable]
>> +pub trait RtcOps: Sized + 'static {
> Please utilize the AsBusDevice trait to be able to provide the parent device of
> the RTC device as &Device<Bound>, similarly to what is done in [1].
>
> [1] https://lore.kernel.org/all/20260106-rust_leds-v10-1-e0a1564884f9@posteo.de/
Some code was implemented by mimicking existing patterns without fully
understanding the rationale behind them.


Thanks for the detailed review. I'll carefully go through your comments.


Best regards,

Ke Sun


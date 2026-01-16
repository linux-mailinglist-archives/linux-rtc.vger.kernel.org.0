Return-Path: <linux-rtc+bounces-5769-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB33D33779
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Jan 2026 17:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A265730057C2
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Jan 2026 16:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23609394472;
	Fri, 16 Jan 2026 16:22:35 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA9318ED8
	for <linux-rtc@vger.kernel.org>; Fri, 16 Jan 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580555; cv=none; b=utKRrf5oCak3gqWrJmFsUb2Ihywz/yrcAKfLL3xHMK2bhf5yLXhKXTdD0hVq68qz3Wk28d+HARw00uuhX5cIqqWaXStrSzX/0lX8pZZBglLZ0o/dBF46TvVYYXE2ThU2VrItUMai6MzCn5+oGTxPThBUqeJZgVGPF+uOPNXEH2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580555; c=relaxed/simple;
	bh=mfVYrkmmQy0ZHFNaF/jVK3cVIboT8w30QFoYPBVrInE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuL75oHeWYpFNE4rFnJcAualGvD7YZ0tpKs17groXNxtDe4GbQMSBIgJlIgE4i5s9Ep0qNtyHbj3nAXLrHYUYduY7h2rqEIdp9Pjcwyw897HquFNaR3ijCGnZnNP8mtFty6Yi+WGLXpI5Q6uYOBrM5KIxVlAVGKpujHuIg86trE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29f0f875bc5so15581855ad.3
        for <linux-rtc@vger.kernel.org>; Fri, 16 Jan 2026 08:22:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580550; x=1769185350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ntn59F0kgeO5XJuek3mV8D0BQrnddma8OAo+S4DU0kU=;
        b=Zp0V8gNvmo55yimp7I//uk4Mi148MfiTsscKFuNRSDdh0cBPsrJ2BpN4qJPFpr2dp8
         CyynwOYC53p9dmpe9r4njQfwrIwN2c5ybv2V3uZRtOc4IhbBk3riA5ay2MuY96YLgVsx
         o1ZJXoSbfzdVTma3vT7T2cyPGdtDP6JzV+o/BnB2IiafmO0PxpY8yffvZZi70wpUEpmv
         DUHSs6618fBr3HHp+k/vCgQQj8Q4ctAfw7+1BaFLOYkYHmx5fYtQDyvRJAi7PO3czqTW
         cg+b9s1YGaXV1O91gEq4d2mamii9ub5jqeeLjzqStrYiXb9159Y1vpziAjJQODBAqKsM
         /xwg==
X-Gm-Message-State: AOJu0YywD22oifOHwfO1w0cEUFYJi5EpGBjCUclxTCyPQt4DUYi9GBzF
	Nm5wXcaVMWsKfRgaNDqx5oO+PtJpA1Mi5Qr4Tgy5fV8IBwvIdqrz6NDC
X-Gm-Gg: AY/fxX4U5sxK5pBzAbv07NX++i67vfaaIciaY423bTOABpUMlPk2E/GFo3MAUpriNgb
	hD5lmv3ie1V4ua3fZwdskJpvra3EbIxWEIBmuB5l2Er3qvpbLanTHhICkZmCgLQnPjn7S7FHojU
	xpn9ywfEX9E3YmJKE4xYdzEl9lASIF83e/vjhKfCBF32p8fXdrYIm/LhqbTLVeS3oyWaRv/RIvS
	+szAvxMl0H1uSJnPXfj6s8POkNL30tbH6FUWdQUftvnuux+QhpsrC4TX83HkaGWDjDCqzb/IEtU
	7cPxwOgmcpjBPQRazXB0GvIb8vv/Mz2HEiATHePqqGWSZyFYSUslyMQ83fihbelo/rBjObjxpoj
	HyyM5Nm/g0nicqiDy05UOjUk2uE6oZmQJKDY41yNY6irHeRuKPmiXtDIR6zHZYBMZ4325VzGxvG
	CHS2+ltq/JaYOr08vzDraFNwPL8fXiANlK9ss22fENh9JfQF+Zj66T+N4=
X-Received: by 2002:a17:903:15c7:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a7177d43d6mr37647805ad.47.1768580549569;
        Fri, 16 Jan 2026 08:22:29 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa333sm25165245ad.5.2026.01.16.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:22:29 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alvin Sun <sk.alvin.x@gmail.com>,
	Ke Sun <sunke@kylinos.cn>
Subject: [RFC PATCH v3 2/5] rust: add AMBA bus driver support
Date: Sat, 17 Jan 2026 00:22:00 +0800
Message-ID: <20260116162203.296844-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116162203.296844-1-sunke@kylinos.cn>
References: <20260116162203.296844-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rust abstractions for ARM AMBA bus drivers, enabling Rust drivers
to interact with AMBA devices through a type-safe interface.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/amba.rs             | 441 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 444 insertions(+)
 create mode 100644 rust/kernel/amba.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422..fa697287cf71b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <linux/amba/bus.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/rust/kernel/amba.rs b/rust/kernel/amba.rs
new file mode 100644
index 0000000000000..0564595c3655d
--- /dev/null
+++ b/rust/kernel/amba.rs
@@ -0,0 +1,441 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! ARM AMBA bus abstractions.
+//!
+//! C header: [`include/linux/amba/bus.h`](srctree/include/linux/amba/bus.h)
+
+use crate::{
+    bindings,
+    device,
+    device_id::{
+        RawDeviceId,
+        RawDeviceIdIndex, //
+    },
+    driver,
+    error::{
+        from_result,
+        to_result, //
+    },
+    io::{
+        mem::IoRequest,
+        resource::Resource, //
+    },
+    irq::{
+        self,
+        IrqRequest, //
+    },
+    prelude::*,
+    sync::aref::AlwaysRefCounted,
+    types::Opaque,
+    ThisModule, //
+};
+
+use core::{
+    marker::PhantomData,
+    mem::offset_of,
+    ptr::NonNull, //
+};
+
+/// Device ID table type for AMBA drivers.
+pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
+
+/// AMBA device identifier.
+///
+/// Wraps the C `struct amba_id` from `include/linux/amba/bus.h`.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct DeviceId(pub(crate) bindings::amba_id);
+
+// SAFETY: `DeviceId` is a transparent wrapper over `amba_id` with no
+// additional invariants.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType = bindings::amba_id;
+}
+
+// SAFETY: The offset matches the `data` field in `struct amba_id`.
+unsafe impl RawDeviceIdIndex for DeviceId {
+    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::amba_id, data);
+
+    fn index(&self) -> usize {
+        self.0.data as usize
+    }
+}
+
+impl DeviceId {
+    /// Creates a new device ID from an AMBA device ID and mask.
+    #[inline(always)]
+    pub const fn new(id: u32, mask: u32) -> Self {
+        let mut amba: bindings::amba_id = pin_init::zeroed();
+        amba.id = id;
+        amba.mask = mask;
+        Self(amba)
+    }
+
+    /// Returns the device ID.
+    #[inline(always)]
+    pub const fn id(&self) -> u32 {
+        self.0.id
+    }
+
+    /// Returns the device ID mask.
+    #[inline(always)]
+    pub const fn mask(&self) -> u32 {
+        self.0.mask
+    }
+}
+
+/// Creates an AMBA device ID table with a module alias for modpost.
+#[macro_export]
+macro_rules! amba_device_table {
+    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
+        const $table_name: $crate::device_id::IdArray<
+            $crate::amba::DeviceId,
+            $id_info_type,
+            { $table_data.len() },
+        > = $crate::device_id::IdArray::new($table_data);
+
+        $crate::module_device_table!("amba", $module_table_name, $table_name);
+    };
+}
+
+/// The AMBA device representation.
+///
+/// This structure represents the Rust abstraction for a C `struct
+/// amba_device`. The implementation abstracts the usage of an already
+/// existing C `struct amba_device` within Rust code that we get passed
+/// from the C side.
+///
+/// # Invariants
+///
+/// A [`Device`] instance represents a valid `struct amba_device` created
+/// by the C portion of the kernel.
+#[repr(transparent)]
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::amba_device>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    fn as_raw(&self) -> *mut bindings::amba_device {
+        self.0.get()
+    }
+
+    /// Returns the memory resource, if any.
+    ///
+    /// AMBA devices have a single memory resource that can be accessed
+    /// via this method.
+    pub fn resource(&self) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct
+        // amba_device`.
+        let resource = unsafe { &raw mut (*self.as_raw()).res };
+        if resource.is_null() {
+            None
+        } else {
+            // SAFETY: `resource` is a valid pointer to a `struct resource`
+            // as returned by the AMBA bus.
+            Some(unsafe { Resource::from_raw(resource) })
+        }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a
+        // pointer to a valid `struct amba_device`.
+        let dev = unsafe { &raw mut (*self.as_raw()).dev };
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper that doesn't depend on its
+// generic argument.
+crate::impl_device_context_deref!(unsafe { Device });
+crate::impl_device_context_into_aref!(Device);
+
+impl Device<device::Bound> {
+    /// Returns an [`IoRequest`] for the memory resource, if any.
+    ///
+    /// This method provides access to the device's memory-mapped I/O region.
+    pub fn io_request(&self) -> Option<IoRequest<'_>> {
+        self.resource()
+            // SAFETY: `resource` is a valid resource for `&self` during the
+            // lifetime of the `IoRequest`.
+            .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
+    }
+
+    /// Returns an [`IrqRequest`] for the IRQ at the given index, if any.
+    ///
+    /// # Errors
+    ///
+    /// Returns `EINVAL` if `index` is out of bounds, or `ENXIO` if the
+    /// IRQ at that index is not configured.
+    pub fn irq_by_index(&self, index: u32) -> Result<IrqRequest<'_>> {
+        if index >= bindings::AMBA_NR_IRQS {
+            return Err(EINVAL);
+        }
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct
+        // amba_device`.
+        let irq = unsafe { (*self.as_raw()).irq[index as usize] };
+        if irq == 0 {
+            return Err(ENXIO);
+        }
+        // SAFETY: `irq` is guaranteed to be a valid IRQ number for
+        // `&self` as it was read from the device structure.
+        Ok(unsafe { IrqRequest::new(self.as_ref(), irq) })
+    }
+
+    /// Returns a [`irq::Registration`] for the IRQ at the given index.
+    ///
+    /// This method registers an interrupt handler for the IRQ at the
+    /// specified index.
+    pub fn request_irq_by_index<'a, T: irq::Handler + 'static>(
+        &'a self,
+        flags: irq::Flags,
+        index: u32,
+        name: &'static CStr,
+        handler: impl PinInit<T, Error> + 'a,
+    ) -> impl PinInit<irq::Registration<T>, Error> + 'a {
+        pin_init::pin_init_scope(move || {
+            let request = self.irq_by_index(index)?;
+            Ok(irq::Registration::<T>::new(request, flags, name, handler))
+        })
+    }
+}
+
+// SAFETY: Instances of `Device` are always reference-counted.
+unsafe impl AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that
+        // the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        let adev: *mut bindings::amba_device = obj.cast().as_ptr();
+        // SAFETY: `amba_device` contains `device` as its first field.
+        let dev: *mut bindings::device = unsafe { &raw mut (*adev).dev };
+        // SAFETY: The safety requirements guarantee that the refcount is
+        // non-zero.
+        unsafe { bindings::put_device(dev) }
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper of `struct amba_device`.
+// The offset is guaranteed to point to a valid device field inside
+// `Device`.
+unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Device<Ctx> {
+    const OFFSET: usize = offset_of!(bindings::amba_device, dev);
+}
+
+// SAFETY: A `Device` is always reference-counted and can be released
+// from any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: `Device` can be shared among threads because all methods of
+// `Device` (i.e., `Device<Normal>`) are thread-safe.
+unsafe impl Sync for Device {}
+
+/// An adapter for the registration of AMBA drivers.
+///
+/// This adapter bridges the gap between the Rust [`Driver`] trait and
+/// the C `struct amba_driver`. It handles the registration and
+/// unregistration of AMBA drivers with the kernel's AMBA bus subsystem.
+pub struct Adapter<T: Driver>(T);
+
+// SAFETY: A call to `unregister` for a given instance of `RegType` is
+// guaranteed to be valid if a preceding call to `register` has been
+// successful.
+unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
+    type RegType = bindings::amba_driver;
+
+    unsafe fn register(
+        adrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        let amba_table = T::AMBA_ID_TABLE.as_ptr();
+        // SAFETY: It's safe to set the fields of `struct amba_driver` on
+        // initialization.
+        unsafe {
+            (*adrv.get()).drv.name = name.as_char_ptr();
+            (*adrv.get()).probe = Some(Self::probe_callback);
+            (*adrv.get()).remove = Some(Self::remove_callback);
+            (*adrv.get()).shutdown = Some(Self::shutdown_callback);
+            (*adrv.get()).id_table = amba_table;
+        }
+        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
+        to_result(unsafe { bindings::__amba_driver_register(adrv.get(), module.0) })
+    }
+
+    unsafe fn unregister(adrv: &Opaque<Self::RegType>) {
+        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
+        unsafe { bindings::amba_driver_unregister(adrv.get()) };
+    }
+}
+
+impl<T: Driver + 'static> Adapter<T> {
+    extern "C" fn probe_callback(
+        adev: *mut bindings::amba_device,
+        id: *const bindings::amba_id,
+    ) -> kernel::ffi::c_int {
+        // SAFETY: The AMBA bus only ever calls the probe callback with a
+        // valid pointer to a `struct amba_device`.
+        //
+        // INVARIANT: `adev` is valid for the duration of `probe_callback()`.
+        let dev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+        let info = Self::amba_id_info(dev, id);
+        from_result(|| {
+            let datapin = T::probe(dev, info);
+            dev.as_ref().set_drvdata(datapin)?;
+            Ok(0)
+        })
+    }
+
+    extern "C" fn remove_callback(adev: *mut bindings::amba_device) {
+        // SAFETY: The AMBA bus only ever calls the remove callback with a
+        // valid pointer to a `struct amba_device`.
+        //
+        // INVARIANT: `adev` is valid for the duration of `remove_callback()`.
+        let dev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+        // SAFETY: `remove_callback` is only ever called after a successful
+        // call to `probe_callback`, hence it's guaranteed that
+        // `Device::set_drvdata()` has been called and stored a
+        // `Pin<KBox<T>>`.
+        let data = unsafe { dev.as_ref().drvdata_obtain::<T>() };
+        T::unbind(dev, data.as_ref());
+    }
+
+    extern "C" fn shutdown_callback(adev: *mut bindings::amba_device) {
+        // SAFETY: `shutdown_callback` is only ever called for a valid `adev`.
+        //
+        // INVARIANT: `adev` is valid for the duration of `shutdown_callback()`.
+        let dev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+        // SAFETY: `shutdown_callback` is only ever called after a
+        // successful call to `probe_callback`, hence it's guaranteed that
+        // `Device::set_drvdata()` has been called and stored a
+        // `Pin<KBox<T>>`.
+        let data = unsafe { dev.as_ref().drvdata_borrow::<T>() };
+        T::shutdown(dev, data.as_ref());
+    }
+
+    /// Extracts the device ID information from a matched AMBA device ID.
+    ///
+    /// This function looks up the driver-specific information associated
+    /// with the matched `struct amba_id` in the driver's device ID table.
+    fn amba_id_info(_dev: &Device, id: *const bindings::amba_id) -> Option<&'static T::IdInfo> {
+        if id.is_null() {
+            return None;
+        }
+        let table = T::AMBA_ID_TABLE;
+        // SAFETY: `id` is a valid pointer to a `struct amba_id` that was
+        // matched by the kernel. `DeviceId` is a `#[repr(transparent)]`
+        // wrapper of `struct amba_id` and does not add additional
+        // invariants, so it's safe to transmute.
+        let device_id = unsafe { &*id.cast::<DeviceId>() };
+        Some(table.info(<DeviceId as RawDeviceIdIndex>::index(device_id)))
+    }
+}
+
+/// The AMBA driver trait.
+///
+/// Drivers must implement this trait in order to get an AMBA driver registered.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::{amba, bindings, c_str, device::Core};
+///
+/// struct MyDriver;
+///
+/// kernel::amba_device_table!(
+///     AMBA_TABLE,
+///     MODULE_AMBA_TABLE,
+///     <MyDriver as amba::Driver>::IdInfo,
+///     [
+///         (amba::DeviceId::new(0x00041031, 0x000fffff), ())
+///     ]
+/// );
+///
+/// impl amba::Driver for MyDriver {
+///     type IdInfo = ();
+///     const AMBA_ID_TABLE: amba::IdTable<Self::IdInfo> = &AMBA_TABLE;
+///
+///     fn probe(
+///         _adev: &amba::Device<Core>,
+///         _id_info: Option<&Self::IdInfo>,
+///     ) -> impl PinInit<Self, Error> {
+///         Err(ENODEV)
+///     }
+/// }
+/// ```
+pub trait Driver: Send {
+    /// The type holding driver private data about each device id
+    /// supported by the driver.
+    type IdInfo: 'static;
+    /// The table of device ids supported by the driver.
+    const AMBA_ID_TABLE: IdTable<Self::IdInfo>;
+
+    /// AMBA driver probe.
+    ///
+    /// Called when a new AMBA device is added or discovered.
+    /// Implementers should attempt to initialize the device here.
+    fn probe(
+        dev: &Device<device::Core>,
+        id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error>;
+
+    /// AMBA driver shutdown.
+    ///
+    /// Called by the kernel during system reboot or power-off to allow
+    /// the [`Driver`] to bring the [`Device`] into a safe state.
+    /// Implementing this callback is optional.
+    ///
+    /// Typical actions include stopping transfers, disabling interrupts,
+    /// or resetting the hardware to prevent undesired behavior during
+    /// shutdown.
+    ///
+    /// This callback is distinct from final resource cleanup, as the
+    /// driver instance remains valid after it returns. Any deallocation
+    /// or teardown of driver-owned resources should instead be handled in
+    /// `Self::drop`.
+    fn shutdown(dev: &Device<device::Core>, this: Pin<&Self>) {
+        let _ = (dev, this);
+    }
+
+    /// AMBA driver unbind.
+    ///
+    /// Called when the [`Device`] is unbound from its bound [`Driver`].
+    /// Implementing this callback is optional.
+    ///
+    /// This callback serves as a place for drivers to perform teardown
+    /// operations that require a `&Device<Core>` or `&Device<Bound>`
+    /// reference. For instance, drivers may try to perform I/O operations
+    /// to gracefully tear down the device.
+    ///
+    /// Otherwise, release operations for driver resources should be
+    /// performed in `Self::drop`.
+    fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
+        let _ = (dev, this);
+    }
+}
+
+/// Declares a kernel module that exposes a single AMBA driver.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::module_amba_driver! {
+///     type: MyDriver,
+///     name: "Module name",
+///     authors: ["Author name"],
+///     description: "Description",
+///     license: "GPL v2",
+/// }
+/// ```
+#[macro_export]
+macro_rules! module_amba_driver {
+    ($($f:tt)*) => {
+        $crate::module_driver!(<T>, $crate::amba::Adapter<T>, { $($f)* });
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf1200428..3e557335fc5fe 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -66,6 +66,8 @@
 
 pub mod acpi;
 pub mod alloc;
+#[cfg(CONFIG_ARM_AMBA)]
+pub mod amba;
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
 pub mod bitmap;
-- 
2.43.0



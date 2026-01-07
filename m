Return-Path: <linux-rtc+bounces-5668-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86539CFE646
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 15:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69A5C3043E64
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 14:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B3C348884;
	Wed,  7 Jan 2026 14:38:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A6346AC9
	for <linux-rtc@vger.kernel.org>; Wed,  7 Jan 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796692; cv=none; b=sQzZWarT1h7HPYap5eJR6zz2uOwBbLPrRcmPwujQ6G8IK98Kp5Yxcbg0ECBgjThTK8CtIq2QMONiudI27/237lmoxAKVXSi9pfykVG1JS61KXJoqok0QT4PQjeE+GiEGqI1wXBQ72c2VlvckMBGHi3KkCJy2+u6+GVJiqQ9tKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796692; c=relaxed/simple;
	bh=wESkbAHiu1Z5TXOCht/y+rriWbd6w33tR6KmuB+NJ3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wos26uKlamjBAYxZj0Itu7ClX0tp+pS1vqAK57N6ZfWAC68Pp5pS3oWK/PrHORviidy2HcFxxIc4IjtwyZChNbVM5JHPukhNclLFnehw6Z/qp+28/Es5mtCztbwEYpbvKS2DQSHaZDTfkvzH5VBosOKq0qsBDhjYU57iQ+e94MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7ba55660769so1366075b3a.1
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 06:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796686; x=1768401486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jpoBKLHqOgiiZmOR48PFD35bSM7UA0SiGbgnVBCM9U=;
        b=DUXWsA2lJ72wU9eh21kG1QwhbajWXpvEhOlpmUwg16NZyyV/6Qmwu++TOr6Mv042QR
         zieBDTHJE9R+R3tWkmMNvG9G0iw0slw98RHpPdEBD+XgGP0yGSz2AR5ijDGWELHILQDT
         zFhf7QNFuEbMx4/URkfZYcrGa0RiRGrORUn0q+Ypr6XEDp3BbNqtFZgjhysNvAYebDTo
         6HaGVqUzRlrxZDj2EEdqm9UhZS1XplZncCkxTGmMkenEBw1kg5tNrlJIgTjusAoTqU90
         AeZBz0H3GU9ws1JrL/LB7gyd/0SW70EFsfZAnQrNSG4Y9tQI5hdc/C5dtHz94NkTTyNy
         AL6Q==
X-Gm-Message-State: AOJu0Yw/NuLOCM+HObrx+uQc4IzfXaUwDDuq+lHZgOAZ4gVuVhRZT6UJ
	qWS0ujXWwk6RIDWW7994eH8wBJNYSpsPttUiTR/AgKSO46/hSrlsVMHp
X-Gm-Gg: AY/fxX7o8GKg1t1bmoyaZ7ycOdQAVy6nArhkt5fKFPITGopmo4UW1fXCaAl3C4NoJUi
	/fHfoeiSuh127fPasBurqnvtdWtHcAFdTNIHF4/xofso/gy9TO8MzuCKXdojx92hLtyKAuddTAD
	SentMV5XAnLnekyVslXeDyRhrZ4Pon6rwnMBFjluPQiE8Mg1pVXLHmntsIkh+JEdcKvexI6S8zC
	LovPWfQNiXAWC1jGT/4ljzsS/1n012wxwMNXX+ACQ//S6emrnwxwl6QPd/YvSXF7FQJnT1aOA+M
	XmbhHH3lRZS4/S3D9JP/ghxdDnTa6vYoojYoeV04hBmuiVit9euWyCjIEL534djZZG18efVuMqD
	/gdtWifbWSyzgpRgL873ANB2A1QLg8r9jdXomWGuCqKZ7Ccm3J1RHhXn4Sozxc6rZwTjROKjzJd
	z8akYD32EZ6iBbkaYmLRFE
X-Google-Smtp-Source: AGHT+IEtkHVwntJEqoD4TveGCjGSOMI605VMtmSMQdTk6sxd0tn4nvfJWhkleo3rafzeqD7f602bzQ==
X-Received: by 2002:a05:6a20:430e:b0:35d:b963:f877 with SMTP id adf61e73a8af0-3898f896e65mr2553269637.25.1767796686336;
        Wed, 07 Jan 2026 06:38:06 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm5470352a12.2.2026.01.07.06.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:38:05 -0800 (PST)
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
Subject: [RFC PATCH v2 2/5] rust: add AMBA bus driver support
Date: Wed,  7 Jan 2026 22:37:34 +0800
Message-ID: <20260107143738.3021892-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107143738.3021892-1-sunke@kylinos.cn>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
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
 rust/kernel/amba.rs             | 396 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 399 insertions(+)
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
index 0000000000000..29b37fd3d1b56
--- /dev/null
+++ b/rust/kernel/amba.rs
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! ARM AMBA bus abstractions.
+//!
+//! C header: [`include/linux/amba/bus.h`](srctree/include/linux/amba/bus.h)
+
+use crate::{
+    acpi,
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
+    of,
+    prelude::*,
+    sync::aref::AlwaysRefCounted,
+    types::Opaque,
+    ThisModule, //
+};
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
+// SAFETY: `DeviceId` is a transparent wrapper over `amba_id` with no additional invariants.
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
+    /// Creates a new device ID with driver-specific data.
+    #[inline(always)]
+    pub const fn new_with_data(id: u32, mask: u32, data: usize) -> Self {
+        let mut amba: bindings::amba_id = pin_init::zeroed();
+        amba.id = id;
+        amba.mask = mask;
+        amba.data = data as *mut core::ffi::c_void;
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
+/// This structure represents the Rust abstraction for a C `struct amba_device`. The
+/// implementation abstracts the usage of an already existing C `struct amba_device` within Rust
+/// code that we get passed from the C side.
+///
+/// # Invariants
+///
+/// A [`Device`] instance represents a valid `struct amba_device` created by the C portion of
+/// the kernel.
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
+    /// Returns the resource at `index`, if any.
+    pub fn resource(&self) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct amba_device`.
+        let resource = unsafe { &raw mut (*self.as_raw()).res };
+        if resource.is_null() {
+            None
+        } else {
+            // SAFETY: `resource` is a valid pointer to a `struct resource`.
+            Some(unsafe { Resource::from_raw(resource) })
+        }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a
+        // valid `struct amba_device`.
+        let dev = unsafe { &raw mut (*self.as_raw()).dev };
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper that doesn't depend on its generic
+// argument.
+crate::impl_device_context_deref!(unsafe { Device });
+crate::impl_device_context_into_aref!(Device);
+
+impl Device<device::Core> {}
+
+impl Device<device::Bound> {
+    /// Returns an [`IoRequest`] for the memory resource.
+    pub fn io_request(&self) -> Option<IoRequest<'_>> {
+        self.resource()
+            // SAFETY: `resource` is valid for the lifetime of the `IoRequest`.
+            .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
+    }
+
+    /// Returns an [`IrqRequest`] for the IRQ at the given index.
+    pub fn irq_by_index(&self, index: u32) -> Result<IrqRequest<'_>> {
+        if index >= bindings::AMBA_NR_IRQS {
+            return Err(EINVAL);
+        }
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct amba_device`.
+        let irq = unsafe { (*self.as_raw()).irq[index as usize] };
+        if irq == 0 {
+            return Err(ENXIO);
+        }
+        // SAFETY: `irq` is guaranteed to be a valid IRQ number for `&self`.
+        Ok(unsafe { IrqRequest::new(self.as_ref(), irq) })
+    }
+
+    /// Returns a [`irq::Registration`] for the IRQ at the given index.
+    pub fn request_irq_by_index<'a, T: irq::Handler + 'static>(
+        &'a self,
+        flags: irq::Flags,
+        index: u32,
+        name: &'static CStr,
+        handler: impl PinInit<T, Error> + 'a,
+    ) -> impl PinInit<irq::Registration<T>, Error> + 'a {
+        pin_init::pin_init_scope(move || {
+            let request = self.irq_by_index(index).map_err(|_| EINVAL)?;
+            Ok(irq::Registration::<T>::new(request, flags, name, handler))
+        })
+    }
+}
+
+// SAFETY: `Device` instances are always reference-counted via the underlying `device`.
+unsafe impl AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: A shared reference guarantees the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        let adev: *mut bindings::amba_device = obj.cast().as_ptr();
+        // SAFETY: `amba_device` contains `device` as its first field.
+        let dev: *mut bindings::device = unsafe { &raw mut (*adev).dev };
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(dev) }
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper of `struct amba_device`.
+unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Device<Ctx> {
+    const OFFSET: usize = offset_of!(bindings::amba_device, dev);
+}
+
+// SAFETY: `Device` is reference-counted and can be released from any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: All methods of `Device` (i.e., `Device<Normal>`) are thread-safe.
+unsafe impl Sync for Device {}
+
+/// An adapter for the registration of AMBA drivers.
+pub struct Adapter<T: Driver>(T);
+
+// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// a preceding call to `register` has been successful.
+unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
+    type RegType = bindings::amba_driver;
+
+    unsafe fn register(
+        adrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        let amba_table = match T::AMBA_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+        // SAFETY: It's safe to set the fields of `struct amba_driver` on initialization.
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
+        // SAFETY: The AMBA bus only ever calls the probe callback with a valid pointer to a
+        // `struct amba_device`. `adev` is valid for the duration of `probe_callback()`.
+        let adev_internal = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+        let info = Self::amba_id_info(adev_internal, id);
+        from_result(|| {
+            let datapin = T::probe(adev_internal, info);
+            adev_internal.as_ref().set_drvdata(datapin)?;
+            Ok(0)
+        })
+    }
+
+    extern "C" fn remove_callback(adev: *mut bindings::amba_device) {
+        // SAFETY: The AMBA bus only ever calls the remove callback with a valid pointer to a
+        // `struct amba_device`. `adev` is valid for the duration of `remove_callback()`.
+        let adev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+        // SAFETY: `remove_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
+        // and stored a `Pin<KBox<T>>`.
+        let data = unsafe { adev.as_ref().drvdata_obtain::<T>() };
+        T::unbind(adev, data.as_ref());
+    }
+
+    extern "C" fn shutdown_callback(adev: *mut bindings::amba_device) {
+        // SAFETY: `shutdown_callback` is only ever called for a valid `adev`.
+        let adev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+        // SAFETY: `shutdown_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
+        // and stored a `Pin<KBox<T>>`.
+        let data = unsafe { adev.as_ref().drvdata_obtain::<T>() };
+        T::shutdown(adev, data.as_ref());
+    }
+
+    fn amba_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInfo>> {
+        T::AMBA_ID_TABLE
+    }
+
+    fn amba_id_info(
+        _dev: &Device,
+        id: *const bindings::amba_id,
+    ) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
+        if id.is_null() {
+            return None;
+        }
+        let table = Self::amba_id_table()?;
+        // SAFETY: `id` is a valid pointer to a `struct amba_id` that was matched by the kernel.
+        // `DeviceId` is a `#[repr(transparent)]` wrapper of `struct amba_id` and does not add
+        // additional invariants, so it's safe to transmute.
+        let device_id = unsafe { &*id.cast::<DeviceId>() };
+        Some(table.info(<DeviceId as RawDeviceIdIndex>::index(device_id)))
+    }
+}
+
+impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
+    type IdInfo = T::IdInfo;
+
+    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
+        None
+    }
+
+    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
+        None
+    }
+}
+
+/// The AMBA driver trait.
+///
+/// Drivers must implement this trait in order to get an AMBA driver registered.
+pub trait Driver: Send {
+    /// The type holding information about each device id supported by the driver.
+    type IdInfo: 'static;
+    /// The table of device ids supported by the driver.
+    const AMBA_ID_TABLE: Option<IdTable<Self::IdInfo>> = None;
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
+    /// Called by the kernel during system reboot or power-off to allow the [`Driver`] to bring the
+    /// [`Device`] into a safe state. Implementing this callback is optional.
+    ///
+    /// Typical actions include stopping transfers, disabling interrupts, or resetting the hardware
+    /// to prevent undesired behavior during shutdown.
+    ///
+    /// This callback is distinct from final resource cleanup, as the driver instance remains valid
+    /// after it returns. Any deallocation or teardown of driver-owned resources should instead be
+    /// handled in `Self::drop`.
+    fn shutdown(dev: &Device<device::Core>, this: Pin<&Self>) {
+        let _ = (dev, this);
+    }
+
+    /// AMBA driver unbind.
+    ///
+    /// Called when the [`Device`] is unbound from its bound [`Driver`]. Implementing this
+    /// callback is optional.
+    ///
+    /// This callback serves as a place for drivers to perform teardown operations that require a
+    /// `&Device<Core>` or `&Device<Bound>` reference. For instance, drivers may try to perform I/O
+    /// operations to gracefully tear down the device.
+    ///
+    /// Otherwise, release operations for driver resources should be performed in `Self::drop`.
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



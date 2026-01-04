Return-Path: <linux-rtc+bounces-5632-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1069CF0A3D
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 07:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95E2B3002FDC
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 06:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0E9264602;
	Sun,  4 Jan 2026 06:06:50 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4601DA60D
	for <linux-rtc@vger.kernel.org>; Sun,  4 Jan 2026 06:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506810; cv=none; b=XQxO08YtHvOXLX44M8HkcNtEYGruYbX1zWRxbQE++MoTRSCjlnjby/DaZumMPOzQNCgh1veg9UGpnEirF7xYesGp5fQUM1q8QhjJawsXA3RSzuXnlmXT/kY72zD2mayRrkwXPbzXZeVggBWNxVYUxBls44J2ni2ktLIZjrOT2yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506810; c=relaxed/simple;
	bh=10/YTMh7lCXeH1umj9LkSHE2mRe7KHKvu3jqV9ggFV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdopaJ7DGpbLHCVpbE6Y40SP81f0UR+zxpUHrWim7G9GO0nrKakllt1FupY7r8maTFIKvuC55LbOXDTInQACNv2kXmDSKryHKM0ryo8qzIFR1RrXOiPgYM9kdXzE285eh6nFOno9ua98YIiGrtUa4j7iZprehxzjJKzjD7lPpNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so10340763a91.0
        for <linux-rtc@vger.kernel.org>; Sat, 03 Jan 2026 22:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767506805; x=1768111605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mn2dRyJN7VYAI0Cm0PXHjYD5lfWjE5W4apbUD/La9qs=;
        b=ddXVMejaSonoNn/Vab1AEFnrpF/X1fxXyWAvm8y/RZrxKQS+yTre7dlEhMKLYeZQy7
         iJuA8qRaJ2xDi4q2eO6iP6MngAr+uKKJTeyRkOwb+10hmgGmwxT0CaYaR6XWsnUuycVr
         Gt5rpewapEwIpY28mDRhN6lXXcUexRFN1PQlM0hdjUPHfa0ghRfGHo4jccLzjiKXm45h
         +bRQDGKKrb6Ka4bdS1/W4Nlg8AakXrMzujnvtNJy29Rd0xLeUGBu1smrhMzKfJ6kikyg
         1n+Z1dDP68AEC6YbyWzBL2GgeWTiPbWJb5j1G8qSrZeS3UezZ+KTG2o4ZY1BfFESTWvr
         XY2Q==
X-Gm-Message-State: AOJu0Yw+H1qG7Upw4DcxW93aJ84Go6NXm/MGb+BOz9yssKjAfn3NGOS9
	pNur2UVZ6kgfkjJLbLkw3Uli8oDC8FBoQbIJ+4lTzdX9Tgf7c9GM9isZ
X-Gm-Gg: AY/fxX6vtE+J0jeQyr7JSs/zwbrekOn4oXZSPKNDl2XM9lvY5I/+rs6Q60ouTtAYc1i
	fJHqcMg/oIVVxIDXOnciTJrzLghCbfuAsq3nXDTsMFd7uFzcVCkdw7WO+Q4vFQAIAKPNeoe7zDO
	NVyu/0D6ekkSsO1UWk3TGrZ+BVUo1GkF04kJHTyyohwZ8Cdf9aJFNLCrD/NVw2qTybNmQn0+4sJ
	u5r7AM8lwAsa9sJuYp1OpXhGfrWtQ/ZGY49lYdF+w6JQ9to6WRcg5WIrU8NMbIHpEX6gie1Vx8E
	my924ArAMiCYCbZ/z1OETEZDLpQ83Pp43uif/7SjTYLMSjAB6djyFLSIx5JPtQZFmCQnIwhltuA
	FaQDkWDpCDE4XBEDMsJOp2/hRPX2ZGOwUjXuL2lQ3HqQ6bA/BNluOj4YBCkQaIxd0h96FNg+zvs
	GZGzbXr+eHxORAr/2AUkZ4
X-Google-Smtp-Source: AGHT+IHI1nXg4QbE2Zo8eRA3FhjTVEpabPe7dmY9VK9rhQxcyzIi5nQ7gOmJYFk7wlZJzDh12bsMeg==
X-Received: by 2002:a17:90b:3849:b0:33f:ebc2:643 with SMTP id 98e67ed59e1d1-34e921be35fmr35076279a91.23.1767506804536;
        Sat, 03 Jan 2026 22:06:44 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm40408449a12.17.2026.01.03.22.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 22:06:44 -0800 (PST)
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
Subject: [RFC PATCH v1 1/4] rust: add AMBA bus abstractions
Date: Sun,  4 Jan 2026 14:06:18 +0800
Message-ID: <20260104060621.3757812-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104060621.3757812-1-sunke@kylinos.cn>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rust abstractions for the ARM AMBA bus, including:
- Device type wrapper for amba_device
- DeviceId for device matching
- TryFrom implementation for converting device::Device to amba::Device
- IRQ and I/O resource management methods

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/amba.rs             | 234 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 237 insertions(+)
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
index 0000000000000..44528082ab44c
--- /dev/null
+++ b/rust/kernel/amba.rs
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! ARM AMBA bus abstractions.
+//!
+//! C header: [`include/linux/amba/bus.h`](srctree/include/linux/amba/bus.h)
+
+use crate::{
+    bindings,
+    container_of,
+    device,
+    device_id::{
+        RawDeviceId,
+        RawDeviceIdIndex, //
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
+    types::Opaque, //
+};
+use core::{
+    marker::PhantomData,
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
+// SAFETY: `DeviceId` is a transparent wrapper over `amba_id` with no additional
+// invariants.
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
+    ///
+    /// A driver binds to a device when `(hardware_device_id & mask) == id`.
+    #[inline(always)]
+    pub const fn new(id: u32, mask: u32) -> Self {
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut amba: bindings::amba_id = unsafe { core::mem::zeroed() };
+        amba.id = id;
+        amba.mask = mask;
+        amba.data = core::ptr::null_mut();
+
+        Self(amba)
+    }
+
+    /// Creates a new device ID with driver-specific data.
+    #[inline(always)]
+    pub const fn new_with_data(id: u32, mask: u32, data: usize) -> Self {
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut amba: bindings::amba_id = unsafe { core::mem::zeroed() };
+        amba.id = id;
+        amba.mask = mask;
+        amba.data = data as *mut core::ffi::c_void;
+
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
+/// An AMBA device.
+///
+/// Wraps the C `struct amba_device` from `include/linux/amba/bus.h`.
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::amba_device>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    /// Obtain the raw `struct amba_device` pointer.
+    pub fn as_raw(&self) -> *mut bindings::amba_device {
+        self.0.get()
+    }
+
+    /// Returns the memory resource.
+    pub fn resource(&self) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct amba_device`.
+        let resource = unsafe { &raw mut (*self.as_raw()).res };
+        // SAFETY: `resource` is a valid pointer to a `struct resource`.
+        Some(unsafe { Resource::from_raw(resource) })
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a
+        // valid `struct amba_device`.
+        let dev = unsafe { &raw mut (*self.as_raw()).dev };
+
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
+impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
+    type Error = kernel::error::Error;
+
+    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
+        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer
+        // to a `struct device`.
+        if !unsafe { bindings::dev_is_amba(dev.as_raw()) } {
+            return Err(crate::error::code::EINVAL);
+        }
+
+        // SAFETY: We've just verified that the bus type of `dev` equals
+        // `bindings::amba_bustype`, hence `dev` must be embedded in a valid
+        // `struct amba_device` as guaranteed by the corresponding C code.
+        let adev = unsafe { container_of!(dev.as_raw(), bindings::amba_device, dev) };
+
+        // SAFETY: `adev` is a valid pointer to a `struct amba_device`.
+        Ok(unsafe { &*adev.cast() })
+    }
+}
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
+            return Err(crate::error::code::EINVAL);
+        }
+
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct amba_device`.
+        let irq = unsafe { (*self.as_raw()).irq[index as usize] };
+
+        if irq == 0 {
+            return Err(crate::error::code::ENXIO);
+        }
+
+        // SAFETY: `irq` is guaranteed to be a valid IRQ number for `&self`.
+        Ok(unsafe { IrqRequest::new(self.as_ref(), irq) })
+    }
+
+    /// Requests an IRQ at the given index and returns a [`irq::Registration`].
+    pub fn request_irq_by_index<'a, T: irq::Handler + 'static>(
+        &'a self,
+        flags: irq::Flags,
+        index: u32,
+        name: &'static CStr,
+        handler: impl PinInit<T, Error> + 'a,
+    ) -> Result<impl PinInit<irq::Registration<T>, Error> + 'a> {
+        let request = self.irq_by_index(index)?;
+
+        Ok(irq::Registration::<T>::new(request, flags, name, handler))
+    }
+}
+
+// SAFETY: `Device` instances are always reference-counted via the underlying
+// `device`.
+unsafe impl AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: A shared reference guarantees the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // Use `put_device` directly since `amba_device_put` is just a wrapper
+        // around it.
+        let adev: *mut bindings::amba_device = obj.cast().as_ptr();
+        // SAFETY: `amba_device` contains `device` as its first field.
+        let dev: *mut bindings::device = unsafe { &raw mut (*adev).dev };
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(dev) }
+    }
+}
+
+// SAFETY: `Device` is reference-counted and can be released from any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: All methods of `Device` (i.e., `Device<Normal>`) are thread-safe.
+unsafe impl Sync for Device {}
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



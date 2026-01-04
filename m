Return-Path: <linux-rtc+bounces-5635-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F2CF0A43
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 07:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7188300E3C6
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 06:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798D82D879C;
	Sun,  4 Jan 2026 06:07:05 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A33441C63
	for <linux-rtc@vger.kernel.org>; Sun,  4 Jan 2026 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506825; cv=none; b=ZwUVDoi8emquYwIbvAjixiaKF3Hy1TIMk8XnwziwXZfhaCCBYjXZONTv6XuTvmiS0cY18ojsZOxQHoDLr3+Dkkn2H4124Y2pHdoLYvYG8bDMh7OLxbg/NIJv/0IsolyJ+j19Ab4pAD4giFRCOxz6JXZ15YCbPH+3DOGNLTYuMiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506825; c=relaxed/simple;
	bh=HKcaWZzyPitSDFKRyBcypsW4terJ3mr+O+62Qdbh6Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7y5mcHoKFWSlYTjdfUcgEdTl6ztegjGpzvA9EfrrOXS+zWTbZQ2PIGHfAuyogAJFEgGgp5DyfTnkIew8SQxRtYvTGxylR8JDm1eIp9Cx+q3yY1YvBqWMJd+UEbU2AnzxaCQfHpNYI6LcQAcBHMVQ9jb4TmVm4zBLllGQNVAcxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso10385728b3a.0
        for <linux-rtc@vger.kernel.org>; Sat, 03 Jan 2026 22:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767506823; x=1768111623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lIcJk2qDwLQtQ+17HTbPVTopkMuvkQpVHsPgSwRvQHg=;
        b=AMmZk2B2P5IsTnyWVscoqqiMy7H5hZf7WktFV+P97KXHiCGiIkXmp+xvr/umMisu6u
         gHq4Sy4fxbloHNTv3JiuSeV37NO73QjlhA0Q0F1uu+fzXno5YdPLq8TIIsHg/VgaM2nd
         YAJFSKDSKpsnn43SeOrhmmAoAZ3aHB6UoFRz/VKB9pPn0+qmphvr1EERAFbFhFvXBx00
         GOg6zzStNgHGeplLe+LP4EWxFC9Kig/DlZuinnD2Sxk+GhhnmpfvHYHpnqhku8iV4xBn
         Q3JEvGKRgJPfA1u787E0Jlm2/VJ7fiMI2T1mCxjC3KOAjCnybM2Raz2d0Jj+dpv23pcH
         FD6A==
X-Gm-Message-State: AOJu0YyOznEC4ES/HJj+nmVfkBpKABHef+H0Fv5ddx0A2wp4H9MLcKZL
	u8KI6WPISsVKSPoJAydE1fu5lNPq44HOEcsp1c8Uo4txTWHgA8Zs5BGo
X-Gm-Gg: AY/fxX50Fd6o+8n+eQui8VYFI/e3ofdguHcPzOP+Q8ckUptPeY7XmNaeX5YQ2lhRhVo
	UbYydh2j0GGfT/G1xoqdHWIYO6Er5x5d9WrueU2OFm1lAsMDRXs/AwX4VtwfITOOjhcM4FDSi6m
	IJemSQYdFY9adKpHty0SBfg/Yx4fAUoaK4SMX2DuBDjhzgvLUkNHzBtJY6h4KuOmOEJ5DfZEDab
	iUvkfnXdfG5D3G/kjpkMpuLViIZQ3ZnjL/QWupRPa8owpEynSWMl/iqskJUVhvK40kpz3jUbtmW
	Q2nTbv5xqvfFGS4cIO/PhYRfIA/Yv0/UzGy31uuEbOtv+AGDWV0DCbvJanhqH7GiLIS/pbfa5xC
	bKp/kdzqbw/OwFmALhcdwP0HCksbt+b4ExZsGEN5SA6BP3hZ4OqI5LhoyOuyrCSyLmKYfcIWAvB
	YPRROBOaCEaYi6fxYekH0U
X-Google-Smtp-Source: AGHT+IGj/Pib9Qk3z4v8xsvq/It0YCo4xC765Rf8DWOqzjUKkCKtkHkNtEwLzbX4OpJfSpSc6ZrAkg==
X-Received: by 2002:a05:6a20:244e:b0:366:14b2:313 with SMTP id adf61e73a8af0-376aa1ef20amr42885192637.70.1767506822569;
        Sat, 03 Jan 2026 22:07:02 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm40408449a12.17.2026.01.03.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 22:07:02 -0800 (PST)
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
Subject: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
Date: Sun,  4 Jan 2026 14:06:21 +0800
Message-ID: <20260104060621.3757812-5-sunke@kylinos.cn>
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

Add Rust implementation of the ARM AMBA PrimeCell 031 RTC driver.

This driver supports:
- ARM, ST v1, and ST v2 variants
- Time read/write operations
- Alarm read/write operations
- Interrupt handling
- Wake-up support

The driver uses the AMBA bus abstractions and RTC core framework
introduced in previous commits.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 drivers/rtc/Kconfig           |  11 +
 drivers/rtc/Makefile          |   1 +
 drivers/rtc/rtc_pl031_rust.rs | 529 ++++++++++++++++++++++++++++++++++
 3 files changed, 541 insertions(+)
 create mode 100644 drivers/rtc/rtc_pl031_rust.rs

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 50dc779f7f983..c7ce188dcc5cf 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1591,6 +1591,17 @@ config RTC_DRV_PL031
 	  To compile this driver as a module, choose M here: the
 	  module will be called rtc-pl031.
 
+config RTC_DRV_PL031_RUST
+	tristate "ARM AMBA PL031 RTC (Rust)"
+	depends on RUST && RTC_CLASS && RUST_BUILD_ASSERT_ALLOW
+	help
+	  This is the Rust implementation of the PL031 RTC driver.
+	  It provides the same functionality as the C driver but is
+	  written in Rust for improved memory safety.
+
+	  This driver requires CONFIG_RUST_BUILD_ASSERT_ALLOW to be enabled
+	  because it uses build-time assertions for memory safety checks.
+
 config RTC_DRV_AT91RM9200
 	tristate "AT91RM9200 or some AT91SAM9 RTC"
 	depends on ARCH_AT91 || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 6cf7e066314e1..10f540e7409b4 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -139,6 +139,7 @@ obj-$(CONFIG_RTC_DRV_PCF8583)	+= rtc-pcf8583.o
 obj-$(CONFIG_RTC_DRV_PIC32)	+= rtc-pic32.o
 obj-$(CONFIG_RTC_DRV_PL030)	+= rtc-pl030.o
 obj-$(CONFIG_RTC_DRV_PL031)	+= rtc-pl031.o
+obj-$(CONFIG_RTC_DRV_PL031_RUST)	+= rtc_pl031_rust.o
 obj-$(CONFIG_RTC_DRV_PM8XXX)	+= rtc-pm8xxx.o
 obj-$(CONFIG_RTC_DRV_POLARFIRE_SOC)	+= rtc-mpfs.o
 obj-$(CONFIG_RTC_DRV_PS3)	+= rtc-ps3.o
diff --git a/drivers/rtc/rtc_pl031_rust.rs b/drivers/rtc/rtc_pl031_rust.rs
new file mode 100644
index 0000000000000..c00a49c2bf94e
--- /dev/null
+++ b/drivers/rtc/rtc_pl031_rust.rs
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//! Real Time Clock interface for ARM AMBA PrimeCell 031 RTC
+//!
+//! This is a Rust port of the C driver in rtc-pl031.c
+//!
+//! Author: Ke Sun <sunke@kylinos.cn>
+//! Based on: drivers/rtc/rtc-pl031.c
+
+use core::ops::Deref;
+use kernel::{
+    amba,
+    bindings,
+    c_str,
+    device,
+    devres::Devres,
+    error::code,
+    io::mem::IoMem,
+    irq::{
+        Handler,
+        IrqReturn, //
+    },
+    prelude::*,
+    rtc::{
+        self,
+        RtcDevice,
+        RtcDeviceOptions,
+        RtcOperations,
+        RtcTime,
+        RtcWkAlrm, //
+    },
+    sync::aref::ARef, //
+};
+
+// Register definitions
+const RTC_DR: usize = 0x00; // Data read register
+const RTC_MR: usize = 0x04; // Match register
+const RTC_LR: usize = 0x08; // Data load register
+const RTC_CR: usize = 0x0c; // Control register
+const RTC_IMSC: usize = 0x10; // Interrupt mask and set register
+const RTC_RIS: usize = 0x14; // Raw interrupt status register
+const RTC_MIS: usize = 0x18; // Masked interrupt status register
+const RTC_ICR: usize = 0x1c; // Interrupt clear register
+const RTC_YDR: usize = 0x30; // Year data read register
+const RTC_YMR: usize = 0x34; // Year match register
+const RTC_YLR: usize = 0x38; // Year data load register
+
+// Control register bits
+const RTC_CR_EN: u32 = 1 << 0; // Counter enable bit
+const RTC_CR_CWEN: u32 = 1 << 26; // Clockwatch enable bit
+
+// Interrupt status and control register bits
+const RTC_BIT_AI: u32 = 1 << 0; // Alarm interrupt bit
+
+// RTC event flags
+#[allow(dead_code)]
+const RTC_AF: u32 = bindings::RTC_AF;
+#[allow(dead_code)]
+const RTC_IRQF: u32 = bindings::RTC_IRQF;
+
+// ST v2 time format bit definitions
+const RTC_SEC_SHIFT: u32 = 0;
+const RTC_SEC_MASK: u32 = 0x3F << RTC_SEC_SHIFT; // Second [0-59]
+const RTC_MIN_SHIFT: u32 = 6;
+const RTC_MIN_MASK: u32 = 0x3F << RTC_MIN_SHIFT; // Minute [0-59]
+const RTC_HOUR_SHIFT: u32 = 12;
+const RTC_HOUR_MASK: u32 = 0x1F << RTC_HOUR_SHIFT; // Hour [0-23]
+const RTC_WDAY_SHIFT: u32 = 17;
+const RTC_WDAY_MASK: u32 = 0x7 << RTC_WDAY_SHIFT; // Day of week [1-7], 1=Sunday
+const RTC_MDAY_SHIFT: u32 = 20;
+const RTC_MDAY_MASK: u32 = 0x1F << RTC_MDAY_SHIFT; // Day of month [1-31]
+const RTC_MON_SHIFT: u32 = 25;
+const RTC_MON_MASK: u32 = 0xF << RTC_MON_SHIFT; // Month [1-12], 1=January
+
+/// Vendor-specific data for different PL031 variants
+#[derive(Copy, Clone, PartialEq)]
+enum VendorVariant {
+    /// Original ARM version
+    Arm,
+    /// First ST derivative
+    StV1,
+    /// Second ST derivative
+    StV2,
+}
+
+impl VendorVariant {
+    fn clockwatch(&self) -> bool {
+        matches!(self, VendorVariant::StV1 | VendorVariant::StV2)
+    }
+
+    #[allow(dead_code)]
+    fn st_weekday(&self) -> bool {
+        matches!(self, VendorVariant::StV1 | VendorVariant::StV2)
+    }
+
+    #[allow(dead_code)]
+    fn range_min(&self) -> i64 {
+        match self {
+            VendorVariant::Arm | VendorVariant::StV1 => 0,
+            VendorVariant::StV2 => bindings::RTC_TIMESTAMP_BEGIN_0000,
+        }
+    }
+
+    #[allow(dead_code)]
+    fn range_max(&self) -> u64 {
+        match self {
+            VendorVariant::Arm | VendorVariant::StV1 => u64::from(u32::MAX),
+            VendorVariant::StV2 => bindings::RTC_TIMESTAMP_END_9999,
+        }
+    }
+}
+
+/// PL031 RTC driver private data.
+#[pin_data(PinnedDrop)]
+struct Pl031DrvData {
+    #[pin]
+    base: Devres<IoMem<0>>,
+    variant: VendorVariant,
+    /// RTC device reference for interrupt handler.
+    ///
+    /// Set in `init_rtcdevice` and remains valid for the driver's lifetime
+    /// because the RTC device is managed by devres.
+    rtc_device: Option<ARef<RtcDevice>>,
+}
+
+// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync),
+// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync because `RtcDevice` is
+// Send+Sync).
+unsafe impl Send for Pl031DrvData {}
+// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync),
+// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync because `RtcDevice` is
+// Send+Sync).
+unsafe impl Sync for Pl031DrvData {}
+
+/// Vendor-specific data for different PL031 variants.
+#[derive(Copy, Clone)]
+struct Pl031Variant {
+    variant: VendorVariant,
+}
+
+impl Pl031Variant {
+    const ARM: Self = Self {
+        variant: VendorVariant::Arm,
+    };
+    const STV1: Self = Self {
+        variant: VendorVariant::StV1,
+    };
+    const STV2: Self = Self {
+        variant: VendorVariant::StV2,
+    };
+}
+
+impl Pl031Variant {
+    const fn to_usize(self) -> usize {
+        self.variant as usize
+    }
+}
+
+// Use AMBA device table for matching
+kernel::amba_device_table!(
+    ID_TABLE,
+    MODULE_ID_TABLE,
+    <Pl031DrvData as rtc::DriverGeneric<rtc::AmbaBus>>::IdInfo,
+    [
+        (
+            amba::DeviceId::new_with_data(0x00041031, 0x000fffff, Pl031Variant::ARM.to_usize()),
+            Pl031Variant::ARM
+        ),
+        (
+            amba::DeviceId::new_with_data(0x00180031, 0x00ffffff, Pl031Variant::STV1.to_usize()),
+            Pl031Variant::STV1
+        ),
+        (
+            amba::DeviceId::new_with_data(0x00280031, 0x00ffffff, Pl031Variant::STV2.to_usize()),
+            Pl031Variant::STV2
+        ),
+    ]
+);
+
+impl rtc::DriverGeneric<rtc::AmbaBus> for Pl031DrvData {
+    type IdInfo = Pl031Variant;
+
+    fn probe(
+        adev: &amba::Device<device::Core>,
+        id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            let io_request = adev.io_request().ok_or(code::ENODEV)?;
+
+            let variant = id_info
+                .map(|info| info.variant)
+                .unwrap_or(VendorVariant::Arm);
+
+            Ok(try_pin_init!(Self {
+                base <- IoMem::new(io_request),
+                variant,
+                // Set in init_rtcdevice
+                rtc_device: None,
+            }))
+        })
+    }
+
+    fn init_rtcdevice(
+        rtc: &RtcDevice,
+        drvdata: &mut Self,
+        id_info: Option<&Self::IdInfo>,
+    ) -> Result {
+        let parent = rtc.bound_parent_device();
+        let amba_dev_bound: &amba::Device<device::Bound> = parent.try_into()?;
+
+        amba_dev_bound.as_ref().init_wakeup()?;
+
+        let variant = id_info
+            .map(|info| info.variant)
+            .unwrap_or(VendorVariant::Arm);
+
+        // Initialize RTC control register: enable clockwatch (ST variants) or counter (ARM).
+        {
+            let base_guard = drvdata.base.try_access().ok_or(code::ENXIO)?;
+            let base = base_guard.deref();
+            let mut data = base.try_read32(RTC_CR)?;
+            if variant.clockwatch() {
+                data |= RTC_CR_CWEN;
+            } else {
+                data |= RTC_CR_EN;
+            }
+            base.try_write32(data, RTC_CR)?;
+        }
+
+        rtc.set_range_min(variant.range_min());
+        rtc.set_range_max(variant.range_max());
+
+        // Fix ST weekday hardware bug.
+        if variant.st_weekday() {
+            let base_guard = drvdata.base.try_access().ok_or(code::ENXIO)?;
+            let base = base_guard.deref();
+            let bcd_year = base.try_read32(RTC_YDR)?;
+            if bcd_year == 0x2000 {
+                let st_time = base.try_read32(RTC_DR)?;
+                if (st_time & (RTC_MON_MASK | RTC_MDAY_MASK | RTC_WDAY_MASK)) == 0x02120000 {
+                    let fixed_time = st_time | (0x7 << RTC_WDAY_SHIFT);
+                    base.try_write32(0x2000, RTC_YLR)?;
+                    base.try_write32(fixed_time, RTC_LR)?;
+                }
+            }
+        }
+
+        // Store RTC device reference for interrupt handler.
+        drvdata.rtc_device = Some(ARef::from(rtc));
+
+        // Determine IRQ flags: ST v2 shares IRQ with another block.
+        let irq_flags = if variant == VendorVariant::StV2 {
+            kernel::irq::Flags::SHARED | kernel::irq::Flags::COND_SUSPEND
+        } else {
+            kernel::irq::Flags::SHARED
+        };
+
+        // Request IRQ (optional, may not be available).
+        match amba_dev_bound.request_irq_by_index(
+            irq_flags,
+            0,
+            c_str!("rtc-pl031"),
+            try_pin_init!(Pl031IrqHandler {
+                _pin: core::marker::PhantomPinned,
+            }),
+        ) {
+            Ok(init) => {
+                kernel::devres::register(
+                    amba_dev_bound.as_ref(),
+                    init,
+                    kernel::alloc::flags::GFP_KERNEL,
+                )?;
+
+                if let Ok(irq) = amba_dev_bound.irq_by_index(0) {
+                    parent.set_wake_irq(irq.irq() as i32)?;
+                }
+            }
+            Err(_) => {
+                // IRQ not available - clear alarm feature.
+                rtc.clear_feature(bindings::RTC_FEATURE_ALARM);
+            }
+        }
+
+        Ok(())
+    }
+
+    fn rtc_options() -> RtcDeviceOptions {
+        RtcDeviceOptions {
+            name: c_str!("rtc-pl031"),
+        }
+    }
+}
+
+impl rtc::AmbaIdInfos for Pl031DrvData {
+    const ID_TABLE: Option<amba::IdTable<Self::IdInfo>> = Some(&ID_TABLE);
+}
+
+#[pinned_drop]
+impl PinnedDrop for Pl031DrvData {
+    fn drop(self: Pin<&mut Self>) {
+        // Resources are automatically cleaned up by devres.
+    }
+}
+
+/// Converts a Gregorian date to ST v2 RTC format.
+fn stv2_tm_to_time(dev: &device::Device, tm: &RtcTime) -> Result<(u32, u32)> {
+    let year = tm.tm_year() + 1900;
+    let mut wday = tm.tm_wday();
+
+    // Hardware wday masking doesn't work, so wday must be valid.
+    if !(-1..=6).contains(&wday) {
+        dev_err!(dev, "invalid wday value {}\n", tm.tm_wday());
+        return Err(code::EINVAL);
+    } else if wday == -1 {
+        // wday is not provided, calculate it here.
+        let time64 = tm.to_time64();
+        let mut calc_tm = RtcTime::default();
+        calc_tm.set_from_time64(time64);
+        wday = calc_tm.tm_wday();
+    }
+
+    // Convert year to BCD.
+    let bcd_year =
+        (u32::from(bin2bcd((year % 100) as u8))) | (u32::from(bin2bcd((year / 100) as u8)) << 8);
+
+    let st_time = ((tm.tm_mon() + 1) as u32) << RTC_MON_SHIFT
+        | (tm.tm_mday() as u32) << RTC_MDAY_SHIFT
+        | ((wday + 1) as u32) << RTC_WDAY_SHIFT
+        | (tm.tm_hour() as u32) << RTC_HOUR_SHIFT
+        | (tm.tm_min() as u32) << RTC_MIN_SHIFT
+        | (tm.tm_sec() as u32) << RTC_SEC_SHIFT;
+
+    Ok((st_time, bcd_year))
+}
+
+/// Converts ST v2 RTC format to a Gregorian date.
+fn stv2_time_to_tm(st_time: u32, bcd_year: u32, tm: &mut RtcTime) {
+    let year_low = bcd2bin((bcd_year & 0xFF) as u8);
+    let year_high = bcd2bin(((bcd_year >> 8) & 0xFF) as u8);
+    tm.set_tm_year(i32::from(year_low) + i32::from(year_high) * 100);
+    tm.set_tm_mon((((st_time & RTC_MON_MASK) >> RTC_MON_SHIFT) - 1) as i32);
+    tm.set_tm_mday(((st_time & RTC_MDAY_MASK) >> RTC_MDAY_SHIFT) as i32);
+    tm.set_tm_wday((((st_time & RTC_WDAY_MASK) >> RTC_WDAY_SHIFT) - 1) as i32);
+    tm.set_tm_hour(((st_time & RTC_HOUR_MASK) >> RTC_HOUR_SHIFT) as i32);
+    tm.set_tm_min(((st_time & RTC_MIN_MASK) >> RTC_MIN_SHIFT) as i32);
+    tm.set_tm_sec(((st_time & RTC_SEC_MASK) >> RTC_SEC_SHIFT) as i32);
+
+    // Values are from valid RTC time structures and are non-negative.
+    tm.set_tm_yday(tm.year_days());
+    tm.set_tm_year(tm.tm_year() - 1900);
+}
+
+/// Converts a binary value to BCD.
+fn bin2bcd(val: u8) -> u8 {
+    ((val / 10) << 4) | (val % 10)
+}
+
+/// Converts a BCD value to binary.
+fn bcd2bin(val: u8) -> u8 {
+    ((val >> 4) * 10) + (val & 0x0F)
+}
+
+/// IRQ handler for PL031 RTC.
+#[pin_data]
+struct Pl031IrqHandler {
+    #[pin]
+    _pin: core::marker::PhantomPinned,
+}
+
+impl Handler for Pl031IrqHandler {
+    fn handle(&self, dev: &device::Device<device::Bound>) -> IrqReturn {
+        // Get driver data using drvdata.
+        let driver = match dev.drvdata::<Pl031DrvData>() {
+            Ok(driver) => driver,
+            Err(_) => return IrqReturn::None,
+        };
+
+        // Access the MMIO base.
+        let base_guard = match driver.base.try_access() {
+            Some(guard) => guard,
+            None => return IrqReturn::None,
+        };
+        let base = base_guard.deref();
+
+        // Read masked interrupt status.
+        let rtcmis = match base.try_read32(RTC_MIS) {
+            Ok(val) => val,
+            Err(_) => return IrqReturn::None,
+        };
+
+        if (rtcmis & RTC_BIT_AI) != 0 {
+            // Clear the interrupt.
+            if base.try_write32(RTC_BIT_AI, RTC_ICR).is_err() {
+                return IrqReturn::None;
+            }
+
+            // Get RTC device from driver and call rtc_update_irq.
+            if let Some(rtc) = &driver.rtc_device {
+                rtc.update_irq(1, (RTC_AF | RTC_IRQF) as usize);
+            }
+
+            return IrqReturn::Handled;
+        }
+
+        IrqReturn::None
+    }
+}
+
+#[vtable]
+impl RtcOperations for Pl031DrvData {
+    type Ptr = Pin<KBox<Self>>;
+
+    fn read_time(drvdata: Pin<&Self>, tm: &mut RtcTime) -> Result {
+        let base_guard = drvdata.base.try_access().ok_or(code::ENXIO)?;
+        let base = base_guard.deref();
+
+        match drvdata.variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time32: u32 = base.try_read32(RTC_DR)?;
+                let time64 = i64::from(time32);
+                tm.set_from_time64(time64);
+            }
+            VendorVariant::StV2 => {
+                let st_time = base.try_read32(RTC_DR)?;
+                let bcd_year = base.try_read32(RTC_YDR)?;
+                stv2_time_to_tm(st_time, bcd_year, tm);
+            }
+        }
+
+        Ok(())
+    }
+
+    fn set_time(drvdata: Pin<&Self>, tm: &mut RtcTime) -> Result {
+        let base_guard = drvdata.base.try_access().ok_or(code::ENXIO)?;
+        let base = base_guard.deref();
+        let rtc_dev = drvdata.base.device();
+
+        match drvdata.variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time64 = tm.to_time64();
+                base.try_write32(time64 as u32, RTC_LR)?;
+            }
+            VendorVariant::StV2 => {
+                let (st_time, bcd_year) = stv2_tm_to_time(rtc_dev, tm)?;
+                base.try_write32(bcd_year, RTC_YLR)?;
+                base.try_write32(st_time, RTC_LR)?;
+            }
+        }
+
+        Ok(())
+    }
+
+    fn read_alarm(drvdata: Pin<&Self>, alarm: &mut RtcWkAlrm) -> Result {
+        let base_guard = drvdata.base.try_access().ok_or(code::ENXIO)?;
+        let base = base_guard.deref();
+
+        match drvdata.variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time32: u32 = base.try_read32(RTC_MR)?;
+                let time64 = i64::from(time32);
+                crate::rtc::RtcTime::time64_to_tm(time64, alarm.get_time_mut());
+            }
+            VendorVariant::StV2 => {
+                let st_time = base.try_read32(RTC_MR)?;
+                let bcd_year = base.try_read32(RTC_YMR)?;
+                stv2_time_to_tm(st_time, bcd_year, alarm.get_time_mut());
+            }
+        }
+
+        alarm.set_pending(if (base.try_read32(RTC_RIS)? & RTC_BIT_AI) != 0 {
+            1
+        } else {
+            0
+        });
+        alarm.set_enabled(if (base.try_read32(RTC_IMSC)? & RTC_BIT_AI) != 0 {
+            1
+        } else {
+            0
+        });
+
+        Ok(())
+    }
+
+    fn set_alarm(drvdata: Pin<&Self>, alarm: &mut RtcWkAlrm) -> Result {
+        let base_guard = drvdata.base.try_access().ok_or(code::ENXIO)?;
+        let base = base_guard.deref();
+        let rtc_dev = drvdata.base.device();
+
+        match drvdata.variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time64 = alarm.get_time().to_time64();
+                base.try_write32(time64 as u32, RTC_MR)?;
+            }
+            VendorVariant::StV2 => {
+                let (st_time, bcd_year) = stv2_tm_to_time(rtc_dev, alarm.get_time())?;
+                base.try_write32(bcd_year, RTC_YMR)?;
+                base.try_write32(st_time, RTC_MR)?;
+            }
+        }
+
+        Self::alarm_irq_enable(drvdata, u32::from(alarm.enabled()))
+    }
+
+    fn alarm_irq_enable(drvdata: Pin<&Self>, enabled: u32) -> Result {
+        let base_guard = drvdata.base.try_access().ok_or(code::ENXIO)?;
+        let base = base_guard.deref();
+
+        // Clear any pending alarm interrupts.
+        base.try_write32(RTC_BIT_AI, RTC_ICR)?;
+
+        let mut imsc = base.try_read32(RTC_IMSC)?;
+        if enabled == 1 {
+            imsc |= RTC_BIT_AI;
+        } else {
+            imsc &= !RTC_BIT_AI;
+        }
+        base.try_write32(imsc, RTC_IMSC)?;
+
+        Ok(())
+    }
+}
+
+kernel::module_rtc_driver! {
+    bus: AmbaBus,
+    type: Pl031DrvData,
+    name: "rtc-pl031-rust",
+    authors: ["Ke Sun <sunke@kylinos.cn>"],
+    description: "Rust PL031 RTC driver",
+    license: "GPL v2",
+}
-- 
2.43.0



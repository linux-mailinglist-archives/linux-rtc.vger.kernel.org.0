Return-Path: <linux-rtc+bounces-5671-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 080ECCFE7C7
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 16:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E471310274F
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 15:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AEF3491F6;
	Wed,  7 Jan 2026 14:38:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673C33491D3
	for <linux-rtc@vger.kernel.org>; Wed,  7 Jan 2026 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796708; cv=none; b=LOnoT+N+ncAfh2uittUOI1h3whg5CtH2AsU0pX9hnyugRhS2pg1pESP9C0nTAIvRCemyXp9UufL597ouoO5DkvUc6KKdvCQui+p3zMrXWR0Ht8yFsZffwACch28p7pcLoAlxc5QgpwXf2upCR+cDopQWPi6+cMbfaEnBtZ9632A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796708; c=relaxed/simple;
	bh=pIdN6U9CrFYIGw3EHXmdMMyDKJw2lJEc8EnQ9zEGx/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dls2vY7Mkp4iaQygOFhEugPhwt3t5WM0sndhopWp04++0UMS1+yOY1+CtlcMjalA2V/vm3wJhZtRF2wIUmHvVFcN0tfkeSrr6KhhL2SvQ//vadKQp0o7Kbji75Z7OBCEq5MOwleb53dHIOceX3bxzMlRtMBN7XMcsJ52jJSMf4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7f121c00dedso2061728b3a.0
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 06:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796704; x=1768401504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PrhFrf9kc03oj78KXqlcEPCqfgItK/ec4ZMc4LcJuaE=;
        b=OXEMPXDgNvRrGdVwLqPUtxh0MFF0kiAO12tyEWAmxKXpcd3c4qncvDKYkhMIwvO9hK
         SkdCaDwxfsmIIu7Dcmki/WZ+Ixw8+nGYEvr4q2tvbc5kVMEl3vTMVTXChqpY+ztA4fQQ
         txe/JlQkSlt2ELdnobckBrfqMwE9Au4D6sH0+wLSfDDl2D4n3XlNQ91urOjiXEuxHHdE
         Y5D4Kn4oHPtQNKEliZh49qWwcQGHUx8yaewpPetwhR60OOd37kzpVPkCw7+wruD6gRub
         ZZ9Ns0PzSBQUMfp8B7CbIIN83zhzdjDWheaqu0kVwf9Vbp3uym5t7glNEwSd3S+GliIA
         ANbA==
X-Gm-Message-State: AOJu0Yz0Q/JqL5Dt2DHkS/jnUV1leQ1SK2ZrHcsPuTBArF9S7h1GMO4f
	IekX7G8AkHtQ2w8h3pah9Dw+0M75Ce3fKPUGafXpV/plFDX0csajCpQZ
X-Gm-Gg: AY/fxX6D+WNe5/pcnmdCLWmOWcIaN5zhLVZK7uB224ffuYjAg08+XoHWDosQdtIa6sW
	B3VtbJsMo2qgOlO4tRQGcEDIUaSm44o/x89L6yr7stc+5NDJjTAZQqWHvahVXnT4KH1MenV042f
	27Aw64k8iGBytET9vcAdbNt9xsMKIAZ98PS9qDDaHPTCQs7o06YVIzi9LluG0Ix7Uh/ZV4oflcq
	BF1CkVZ1xjbeWeBjk232wRWJqqQFtd72bLDuI5rLvCxcWsxGMfY2ljhQEZK79BnA9Y1FtimVcoB
	vYAQptIiFyTkfCFSmqFMK1z1J2f1r/zs9etHTfQcZgmzbrWLyNlQrWAWM+mq1MV4t1zQe9GCGCq
	OrIR/oPdSHWvMGeiCKFQ1FWJNWSfa1JerAisxbQY93Q7d2zJeaF9vzjKpGAMH1N7IPFQC3GDKPF
	Gg9qhU182wznzGUPM23GKz
X-Google-Smtp-Source: AGHT+IHiOMqMlEIBpoz97Z4RwQ+PQ10eXWYXhdnsrW8y/+yxuvQqgkJE8HM/9wxjmiP2sTmJKlPqAw==
X-Received: by 2002:a05:6a00:8c01:b0:7ab:5e68:e204 with SMTP id d2e1a72fcca58-81b7e259264mr2364768b3a.29.1767796703914;
        Wed, 07 Jan 2026 06:38:23 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm5470352a12.2.2026.01.07.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:38:23 -0800 (PST)
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
Subject: [RFC PATCH v2 5/5] rust: add PL031 RTC driver
Date: Wed,  7 Jan 2026 22:37:37 +0800
Message-ID: <20260107143738.3021892-6-sunke@kylinos.cn>
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

Add Rust implementation of the PL031 RTC driver.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 drivers/rtc/Kconfig           |   9 +
 drivers/rtc/Makefile          |   1 +
 drivers/rtc/rtc_pl031_rust.rs | 503 ++++++++++++++++++++++++++++++++++
 3 files changed, 513 insertions(+)
 create mode 100644 drivers/rtc/rtc_pl031_rust.rs

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 50dc779f7f983..137cea1824edd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1591,6 +1591,15 @@ config RTC_DRV_PL031
 	  To compile this driver as a module, choose M here: the
 	  module will be called rtc-pl031.
 
+config RTC_DRV_PL031_RUST
+	tristate "ARM AMBA PL031 RTC (Rust)"
+	depends on RUST && RTC_CLASS
+	help
+	  This is the Rust implementation of the PL031 RTC driver.
+	  It provides the same functionality as the C driver but is
+	  written in Rust for improved memory safety. The driver supports
+	  ARM, ST v1, and ST v2 variants of the PL031 RTC controller.
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
index 0000000000000..f3cca5c6daa1b
--- /dev/null
+++ b/drivers/rtc/rtc_pl031_rust.rs
@@ -0,0 +1,503 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//! Rust ARM AMBA PrimeCell 031 RTC driver
+//!
+//! This driver provides Real Time Clock functionality for ARM AMBA PrimeCell 031
+//! RTC controllers and their ST Microelectronics derivatives.
+
+use core::{
+    marker::PhantomPinned,
+    ops::Deref, //
+};
+use kernel::{
+    amba,
+    bindings,
+    c_str,
+    device::{
+        self,
+        Core, //
+    },
+    devres::Devres,
+    io::mem::IoMem,
+    irq::{
+        Handler,
+        IrqReturn, //
+    },
+    prelude::*,
+    rtc::{
+        self,
+        Registration,
+        RtcDevice,
+        RtcOps,
+        RtcTime,
+        RtcWkAlrm, //
+    },
+    sync::aref::ARef, //
+};
+
+// Register offsets
+const RTC_DR: usize = 0x00;
+const RTC_MR: usize = 0x04;
+const RTC_LR: usize = 0x08;
+const RTC_CR: usize = 0x0c;
+const RTC_IMSC: usize = 0x10;
+const RTC_RIS: usize = 0x14;
+const RTC_MIS: usize = 0x18;
+const RTC_ICR: usize = 0x1c;
+// ST variants have additional timer functionality
+#[allow(dead_code)]
+const RTC_TDR: usize = 0x20;
+#[allow(dead_code)]
+const RTC_TLR: usize = 0x24;
+#[allow(dead_code)]
+const RTC_TCR: usize = 0x28;
+const RTC_YDR: usize = 0x30;
+const RTC_YMR: usize = 0x34;
+const RTC_YLR: usize = 0x38;
+const PL031_REG_SIZE: usize = RTC_YLR + 4;
+
+// Control register bits
+const RTC_CR_EN: u32 = 1 << 0;
+const RTC_CR_CWEN: u32 = 1 << 26;
+
+#[allow(dead_code)]
+const RTC_TCR_EN: u32 = 1 << 1;
+
+// Interrupt status and control register bits
+const RTC_BIT_AI: u32 = 1 << 0;
+#[allow(dead_code)]
+const RTC_BIT_PI: u32 = 1 << 1;
+
+// RTC event flags
+#[allow(dead_code)]
+const RTC_AF: u32 = bindings::RTC_AF;
+#[allow(dead_code)]
+const RTC_IRQF: u32 = bindings::RTC_IRQF;
+
+// ST v2 time format bit definitions
+const RTC_SEC_SHIFT: u32 = 0;
+const RTC_SEC_MASK: u32 = 0x3F << RTC_SEC_SHIFT;
+const RTC_MIN_SHIFT: u32 = 6;
+const RTC_MIN_MASK: u32 = 0x3F << RTC_MIN_SHIFT;
+const RTC_HOUR_SHIFT: u32 = 12;
+const RTC_HOUR_MASK: u32 = 0x1F << RTC_HOUR_SHIFT;
+const RTC_WDAY_SHIFT: u32 = 17;
+const RTC_WDAY_MASK: u32 = 0x7 << RTC_WDAY_SHIFT;
+const RTC_MDAY_SHIFT: u32 = 20;
+const RTC_MDAY_MASK: u32 = 0x1F << RTC_MDAY_SHIFT;
+const RTC_MON_SHIFT: u32 = 25;
+const RTC_MON_MASK: u32 = 0xF << RTC_MON_SHIFT;
+
+/// Vendor-specific variant identifier for PL031 RTC controllers.
+#[derive(Copy, Clone, PartialEq)]
+enum VendorVariant {
+    /// Original ARM version with 32-bit Unix timestamp format.
+    Arm,
+    /// First ST derivative with clockwatch mode and weekday support.
+    StV1,
+    /// Second ST derivative with packed BCD time format and year register.
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
+/// The driver's private data struct. It holds all necessary devres managed resources.
+#[pin_data(PinnedDrop)]
+struct Pl031DrvData {
+    #[pin]
+    base: Devres<IoMem<PL031_REG_SIZE>>,
+    variant: VendorVariant,
+}
+
+// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync)
+// and `VendorVariant` (Copy).
+unsafe impl Send for Pl031DrvData {}
+// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync)
+// and `VendorVariant` (Copy).
+unsafe impl Sync for Pl031DrvData {}
+
+/// Vendor-specific variant identifier used in AMBA device table.
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
+// Use AMBA device table for matching
+kernel::amba_device_table!(
+    ID_TABLE,
+    MODULE_ID_TABLE,
+    <Pl031AmbaDriver as amba::Driver>::IdInfo,
+    [
+        (
+            amba::DeviceId::new(0x00041031, 0x000fffff),
+            Pl031Variant::ARM
+        ),
+        (
+            amba::DeviceId::new(0x00180031, 0x00ffffff),
+            Pl031Variant::STV1
+        ),
+        (
+            amba::DeviceId::new(0x00280031, 0x00ffffff),
+            Pl031Variant::STV2
+        ),
+    ]
+);
+
+struct Pl031AmbaDriver;
+
+impl amba::Driver for Pl031AmbaDriver {
+    type IdInfo = Pl031Variant;
+    const AMBA_ID_TABLE: Option<amba::IdTable<Self::IdInfo>> = Some(&ID_TABLE);
+
+    fn probe(
+        adev: &amba::Device<Core>,
+        id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        let dev = adev.as_ref();
+        let io_request = adev.io_request().ok_or(ENODEV)?;
+        let variant = id_info
+            .map(|info| info.variant)
+            .unwrap_or(VendorVariant::Arm);
+
+        let rtcdev = RtcDevice::<Pl031DrvData>::new(
+            dev,
+            try_pin_init!(Pl031DrvData {
+                base <- IoMem::new(io_request),
+                variant,
+            }),
+        )?;
+
+        dev.devm_init_wakeup()?;
+
+        let drvdata = rtcdev.drvdata()?;
+        let base_guard = drvdata.base.try_access().ok_or(ENXIO)?;
+        let base = base_guard.deref();
+
+        let mut cr = base.read32(RTC_CR);
+        if variant.clockwatch() {
+            cr |= RTC_CR_CWEN;
+        } else {
+            cr |= RTC_CR_EN;
+        }
+        base.write32(cr, RTC_CR);
+
+        if variant.st_weekday() {
+            let bcd_year = base.read32(RTC_YDR);
+            if bcd_year == 0x2000 {
+                let st_time = base.read32(RTC_DR);
+                if (st_time & (RTC_MON_MASK | RTC_MDAY_MASK | RTC_WDAY_MASK)) == 0x02120000 {
+                    base.write32(0x2000, RTC_YLR);
+                    base.write32(st_time | (0x7 << RTC_WDAY_SHIFT), RTC_LR);
+                }
+            }
+        }
+
+        rtcdev.set_range_min(variant.range_min());
+        rtcdev.set_range_max(variant.range_max());
+
+        let irq_flags = if variant == VendorVariant::StV2 {
+            kernel::irq::Flags::SHARED | kernel::irq::Flags::COND_SUSPEND
+        } else {
+            kernel::irq::Flags::SHARED
+        };
+
+        let rtcdev_clone = rtcdev.clone();
+        let init = adev.request_irq_by_index(
+            irq_flags,
+            0,
+            c_str!("rtc-pl031"),
+            try_pin_init!(Pl031IrqHandler {
+                _pin: PhantomPinned,
+                rtcdev: rtcdev_clone,
+            }),
+        );
+
+        match kernel::devres::register(dev, init, GFP_KERNEL) {
+            Ok(()) => {
+                if let Ok(irq) = adev.irq_by_index(0) {
+                    irq.set_wake_irq()?;
+                }
+            }
+            Err(_) => rtcdev.clear_feature(bindings::RTC_FEATURE_ALARM),
+        }
+
+        Registration::<Pl031DrvData>::register(dev, rtcdev)?;
+        Ok(Pl031AmbaDriver)
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for Pl031DrvData {
+    fn drop(self: Pin<&mut Self>) {
+        // Resources are automatically cleaned up by devres.
+    }
+}
+
+/// Converts a Gregorian date to ST v2 RTC packed BCD format.
+///
+/// Returns a tuple of (packed_time, bcd_year) where packed_time contains
+/// month, day, weekday, hour, minute, and second in a single 32-bit value.
+fn stv2_tm_to_time(tm: &RtcTime) -> Result<(u32, u32)> {
+    let year = tm.tm_year() + 1900;
+    let mut wday = tm.tm_wday();
+
+    // Hardware wday masking doesn't work, so wday must be valid.
+    if !(-1..=6).contains(&wday) {
+        return Err(EINVAL);
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
+/// Converts ST v2 RTC packed BCD format to a Gregorian date.
+///
+/// Extracts time components from the packed 32-bit value and BCD year register,
+/// then populates the RtcTime structure.
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
+/// Interrupt handler for PL031 RTC alarm events.
+#[pin_data]
+struct Pl031IrqHandler {
+    #[pin]
+    _pin: PhantomPinned,
+    rtcdev: ARef<RtcDevice<Pl031DrvData>>,
+}
+
+impl Handler for Pl031IrqHandler {
+    fn handle(&self, _dev: &device::Device<device::Bound>) -> IrqReturn {
+        // Get driver data using drvdata.
+        let drvdata = match self.rtcdev.drvdata() {
+            Ok(drvdata) => drvdata,
+            Err(_) => return IrqReturn::None,
+        };
+
+        // Access the MMIO base.
+        let base_guard = match drvdata.base.try_access() {
+            Some(guard) => guard,
+            None => return IrqReturn::None,
+        };
+        let base = base_guard.deref();
+
+        // Read masked interrupt status.
+        let rtcmis = base.read32(RTC_MIS);
+
+        if (rtcmis & RTC_BIT_AI) != 0 {
+            base.write32(RTC_BIT_AI, RTC_ICR);
+            self.rtcdev.update_irq(1, (RTC_AF | RTC_IRQF) as usize);
+            return IrqReturn::Handled;
+        }
+
+        IrqReturn::None
+    }
+}
+
+#[vtable]
+impl RtcOps for Pl031DrvData {
+    fn read_time(rtcdev: &RtcDevice<Self>, tm: &mut RtcTime) -> Result {
+        let drvdata = rtcdev.drvdata()?;
+        let base_guard = drvdata.base.try_access().ok_or(ENXIO)?;
+        let base = base_guard.deref();
+
+        match drvdata.variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time32: u32 = base.read32(RTC_DR);
+                let time64 = i64::from(time32);
+                tm.set_from_time64(time64);
+            }
+            VendorVariant::StV2 => {
+                let st_time = base.read32(RTC_DR);
+                let bcd_year = base.read32(RTC_YDR);
+                stv2_time_to_tm(st_time, bcd_year, tm);
+            }
+        }
+
+        Ok(())
+    }
+
+    fn set_time(rtcdev: &RtcDevice<Self>, tm: &mut RtcTime) -> Result {
+        let dev: &device::Device<device::Bound> = rtcdev.as_ref();
+        let drvdata = rtcdev.drvdata()?;
+        let base_guard = drvdata.base.try_access().ok_or(ENXIO)?;
+        let base = base_guard.deref();
+
+        match drvdata.variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time64 = tm.to_time64();
+                base.write32(time64 as u32, RTC_LR);
+            }
+            VendorVariant::StV2 => {
+                let (st_time, bcd_year) = stv2_tm_to_time(tm).inspect_err(|&err| {
+                    if err == EINVAL {
+                        dev_err!(dev, "invalid wday value {}\n", tm.tm_wday());
+                    }
+                })?;
+                base.write32(bcd_year, RTC_YLR);
+                base.write32(st_time, RTC_LR);
+            }
+        }
+
+        Ok(())
+    }
+
+    fn read_alarm(rtcdev: &RtcDevice<Self>, alarm: &mut RtcWkAlrm) -> Result {
+        let drvdata = rtcdev.drvdata()?;
+        let base_guard = drvdata.base.try_access().ok_or(ENXIO)?;
+        let base = base_guard.deref();
+
+        match drvdata.variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time32: u32 = base.read32(RTC_MR);
+                let time64 = i64::from(time32);
+                crate::rtc::RtcTime::time64_to_tm(time64, alarm.get_time_mut());
+            }
+            VendorVariant::StV2 => {
+                let st_time = base.read32(RTC_MR);
+                let bcd_year = base.read32(RTC_YMR);
+                stv2_time_to_tm(st_time, bcd_year, alarm.get_time_mut());
+            }
+        }
+
+        alarm.set_pending(if (base.read32(RTC_RIS) & RTC_BIT_AI) != 0 {
+            1
+        } else {
+            0
+        });
+        alarm.set_enabled(if (base.read32(RTC_IMSC) & RTC_BIT_AI) != 0 {
+            1
+        } else {
+            0
+        });
+
+        Ok(())
+    }
+
+    fn set_alarm(rtcdev: &RtcDevice<Self>, alarm: &mut RtcWkAlrm) -> Result {
+        let dev: &device::Device<device::Bound> = rtcdev.as_ref();
+        let drvdata = rtcdev.drvdata()?;
+        let base_guard = drvdata.base.try_access().ok_or(ENXIO)?;
+        let base = base_guard.deref();
+
+        match drvdata.variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time64 = alarm.get_time().to_time64();
+                base.write32(time64 as u32, RTC_MR);
+            }
+            VendorVariant::StV2 => {
+                let (st_time, bcd_year) =
+                    stv2_tm_to_time(alarm.get_time()).inspect_err(|&err| {
+                        if err == EINVAL {
+                            dev_err!(dev, "invalid wday value {}\n", alarm.get_time().tm_wday());
+                        }
+                    })?;
+                base.write32(bcd_year, RTC_YMR);
+                base.write32(st_time, RTC_MR);
+            }
+        }
+
+        Self::alarm_irq_enable(rtcdev, u32::from(alarm.enabled()))
+    }
+
+    fn alarm_irq_enable(rtcdev: &RtcDevice<Self>, enabled: u32) -> Result {
+        let drvdata = rtcdev.drvdata()?;
+        let base_guard = drvdata.base.try_access().ok_or(ENXIO)?;
+        let base = base_guard.deref();
+
+        // Clear any pending alarm interrupts.
+        base.write32(RTC_BIT_AI, RTC_ICR);
+
+        let mut imsc = base.read32(RTC_IMSC);
+        if enabled == 1 {
+            imsc |= RTC_BIT_AI;
+        } else {
+            imsc &= !RTC_BIT_AI;
+        }
+        base.write32(imsc, RTC_IMSC);
+
+        Ok(())
+    }
+}
+
+kernel::module_rtc_amba_driver! {
+    type: Pl031AmbaDriver,
+    name: "rtc-pl031-rust",
+    authors: ["Ke Sun <sunke@kylinos.cn>"],
+    description: "Rust PL031 RTC driver",
+    license: "GPL v2",
+}
-- 
2.43.0



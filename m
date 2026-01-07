Return-Path: <linux-rtc+bounces-5669-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F05ACFE61F
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 15:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F2C2300BD88
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 14:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14C2348893;
	Wed,  7 Jan 2026 14:38:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A564343D90
	for <linux-rtc@vger.kernel.org>; Wed,  7 Jan 2026 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796693; cv=none; b=l7G3AX8xkBQqPG49fipVeVgsBiO9rOZZLjc8lGCsraN2YsTHUZ33HEvO3mwejTXeL5VzvOTCOAlOjRMSbuNTknhYN3sEtsJ1kBNGDXa+MKQn/IGzxZIVuML14sE/By8lJ7eHhspmvQRkCKYjCsIlc7Zll0b5uqMaN1KxIK76NK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796693; c=relaxed/simple;
	bh=Fb2qQV6SPV2yC6RSljust45oNQxitdGxMPsdX6P28qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2nAkn2mYWmNu3psPmt3Z4e/woRuse6iktk7HFNtd8CzOKCHtmsHzbdxDMgBMOu/ap5sn+7zVcXgu1qCuV8YQqjg9Uob/gQk5nx8Mi23viO3nGtjy91Dswriqo6va12OPK4b4V6beGuenmxmFSBMKAmIz0QZyPGtGhECHEEv4Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so1397902a12.2
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 06:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796691; x=1768401491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgTNplJ8NDo29WqtkzBbM5dsPVq+nd4lQpI1B7PMUKA=;
        b=aFdNQjl8uUIapGkA0qwdPvEUTjjgvE7QG8NigIRXtjsydL8aLZNIDALleMtMUHnIfz
         ca4QB8lMp0rUyroblPWz4yBO4sEOiX1MOiIYg9SAxJOIvKzT3laVOFdAmF7g/6sM1P2z
         /wdJUwpPFgtYnJlsPoWTJIDaChjCdo4GK454Xohy9g9dsSAB7xNr/jXAWBzilkegGx1A
         OCM4bi2ZBw9Bjp+nYEG7D/TIhj7UZ37W/G0m7FCJGO3Hfb+yc4fnsHGyE+WdT/dXnjBr
         uyIT29CFr+7AEeB/l6MXGDIbEFDzFI2kt9UxiP7+hJfqVPYVXjM6tBA8Iu9Xqe5lrxKG
         T0pA==
X-Gm-Message-State: AOJu0YxG6H+Q5LnJ0RLtd7Gq1Qx4La2GjkAs2dEvOisObciFCnAS1prj
	Frr5mYYXwiXWEg2drOGG92nCLrh0L/Q+Ey0TRzQoVo3jT7YiWziaYByY
X-Gm-Gg: AY/fxX6R41ENZOU+BylOKqVDW7Rff4dpiffkDBEONiJe2KQtIaWQ+eRQ/R8AlICGf6o
	RHJMvrVau9vRLKcJzmzHSdnSv3xpuZidRo+SojAOyk7R9POR0FK4wxNX7/KC4aUP2lKPu+Ejm02
	HMPvPbhFXy5PhPteagmh8ZLhE77pvd0pt9Qs+SHSR1g1+4wpH3gYkog9h9Fie0p6Nyg0mT38tJp
	SnmOG8QKfPrRiv6M8k7g+lUsQTycnYzfGx6YGbDKVvy1XrkbNx6OJRswf76R1Ss7nIDjrorKE0J
	VMkYlNcnlSm4WWHInA8vd+AvCm0iPuNgt/C/taNeSNgoVnpPiLzhtYBJxZqal36R9wSnoIshvFP
	LSA/l6uRqv0MnTLM8b0hL0j4wMXbLbLeQ+IluyRxS8X6jqgfEerA0EdtDvWPAmzU+/c1plUhvtT
	x41cmWlBgTj7z1ajvEgBJV
X-Google-Smtp-Source: AGHT+IGB+UzVxZCoDujJQkGD4xLs1TjaUXBYLIAMhaZ7oLqSyIgvIBUOlyCgOG+iEwDrc1cKqhT1xw==
X-Received: by 2002:a05:6a20:94cb:b0:364:13c3:3dd0 with SMTP id adf61e73a8af0-3898f9141bdmr2613443637.36.1767796691541;
        Wed, 07 Jan 2026 06:38:11 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm5470352a12.2.2026.01.07.06.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:38:11 -0800 (PST)
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
Subject: [RFC PATCH v2 3/5] rust: add device wakeup capability support
Date: Wed,  7 Jan 2026 22:37:35 +0800
Message-ID: <20260107143738.3021892-4-sunke@kylinos.cn>
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

Add Rust bindings and wrappers for device wakeup functionality,
including devm_device_init_wakeup() and dev_pm_set_wake_irq().

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/device.c           |  7 +++++++
 rust/kernel/device.rs           | 17 ++++++++++++++++-
 rust/kernel/irq/request.rs      |  7 +++++++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index fa697287cf71b..d6c2b06ac4107 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -88,6 +88,8 @@
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
 #include <trace/events/rust_sample.h>
+#include <linux/pm_wakeup.h>
+#include <linux/pm_wakeirq.h>
 
 /*
  * The driver-core Rust code needs to know about some C driver-core private
diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index 9a4316bafedfb..cae26edd83696 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/device.h>
+#include <linux/pm_wakeup.h>
+#include <linux/pm_wakeirq.h>
 
 int rust_helper_devm_add_action(struct device *dev,
 				void (*action)(void *),
@@ -25,3 +27,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+int rust_helper_devm_device_init_wakeup(struct device *dev)
+{
+	return devm_device_init_wakeup(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe38..24fc69adf7bea 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -5,7 +5,9 @@
 //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
 
 use crate::{
-    bindings, fmt,
+    bindings,
+    error::to_result,
+    fmt,
     prelude::*,
     sync::aref::ARef,
     types::{ForeignOwnable, Opaque},
@@ -325,6 +327,19 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
         // - We've just checked that the type of the driver's private data is in fact `T`.
         Ok(unsafe { self.drvdata_unchecked() })
     }
+
+    /// Initialize device wakeup capability.
+    ///
+    /// Marks the device as wakeup-capable and enables wakeup. The wakeup capability is
+    /// automatically disabled when the device is removed (resource-managed).
+    ///
+    /// Returns `Ok(())` on success, or an error code on failure.
+    pub fn devm_init_wakeup(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        // The function is exported from bindings_helper module via pub use.
+        let ret = unsafe { bindings::devm_device_init_wakeup(self.as_raw()) };
+        to_result(ret)
+    }
 }
 
 impl<Ctx: DeviceContext> Device<Ctx> {
diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index b150563fdef80..c73e0c544fec7 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -120,6 +120,13 @@ pub(crate) unsafe fn new(dev: &'a Device<Bound>, irq: u32) -> Self {
     pub fn irq(&self) -> u32 {
         self.irq
     }
+
+    /// Set the IRQ as a wake IRQ.
+    pub fn set_wake_irq(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        let ret = unsafe { bindings::dev_pm_set_wake_irq(self.dev.as_raw(), self.irq as i32) };
+        to_result(ret)
+    }
 }
 
 /// A registration of an IRQ handler for a given IRQ line.
-- 
2.43.0



Return-Path: <linux-rtc+bounces-5770-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EDBD33785
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Jan 2026 17:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05174306901F
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Jan 2026 16:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF3D3939AE;
	Fri, 16 Jan 2026 16:22:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C6E340D86
	for <linux-rtc@vger.kernel.org>; Fri, 16 Jan 2026 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580558; cv=none; b=q2qhvN06v5QllvCV4VAqj6+7mWxGlgopvmBiN1VHR3mDK1e6hgtR4L74A2+ZV1kwpIm2a88PMEsTAglJIBYNH19yHeP0QMTeH20r/embB3QBB6o81bKtKbcryAAfJwMo3mwRajHgBKwbNhxKHJUCq5nOi1CoZFTWKLga9muVuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580558; c=relaxed/simple;
	bh=KR/OsVtnW5ehiqzbPjZ+lpVANdNl8H0turDjlYKvfjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBACyPFMP2gsBNAG2AeJ2nxKXL4I0Z7NQhkvnfu2dH0pkEDk0EGGJVM9vMjAC0xBPYxQYe4MgvM+yGyEgGvqmKygaXc0/98BZUp1A57C6Gyt87GuBZzfMTbQO6FH54DiBekDqbCybBzbqD9dXWCAoTYyLW7kqC8BL0u09wtrgxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29f102b013fso20603495ad.2
        for <linux-rtc@vger.kernel.org>; Fri, 16 Jan 2026 08:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580557; x=1769185357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEtIiuFipIHQrQ+1C6s3Qxk1j1pmthJfwz6lNxHwlRI=;
        b=emFma12s3gyFvgk2PrGD2PIys7KUyNiqrraEtldbu9MvWuO/9XyrsSyrFrpEMB/Lnl
         oV2OkbrPap7sdZpZw0z0ia3OjNbpMs8bY7YuDsDBMSGm9wqodGeGHy9yem6w6M5qdStv
         ThDuZdoXOdY1i+OBUGWunXxpEBvEXO3aozSkLr8z4BXJyPFoeUbqeSSBuHeJaoSbZqsn
         a3bfhC0uRVs2cPWSqLNuvO9ch4jAtBRcRIk7svQps4JfROkAsAinRCbp+rYXHlvKJ2NV
         ZNRCmF8UCAcnXDKfzeZPMMFFEN3zb1wu82ZIwaKUAlO5D6qShxZF67qlAogkTaa4R45h
         xP1Q==
X-Gm-Message-State: AOJu0YxLrKpvd/iF+iIshcelhlWJbllJYk6PtMT/JaZ8GjBJQ0d7J0YV
	1YjxI32l0zVHcNbf8FcTuaQOioKKneAUXDKI6CYyyc0/RwB5svUIzJbf
X-Gm-Gg: AY/fxX6bG1NA9oikMMipEtjz0TPKDjgj5QzOM3qS/iXDn0QzxnceBnbyNVZUFtd04DC
	10o5lG2SrJvZuj39CwIYJapi0sUWqtbd9T7Et0SupDDN0iOZ5Y86fMpabSwp5kQyTnqbPUwXTB7
	MmBhrYBmC27T/AO96OQeI5UeKOD1AN1Y4zEUHFpl20zW5N4MaUjqYe3vHEJN7qffXamWjoZcNa0
	us6rO/HSvbvM4qEyI7mNR2U+Y/HkT5DNi7nwV+i5S+3z7obKlsw4crRWLUyZcQHZp4Ipv0jYyLI
	XKQdaSGceBQJhRlK0sCKyTYDYrIiCI7TRhqdgT1krPVD3QlQlUORYDZwLERMsWNgFe6sYb91cnD
	EmEAXgtiHdYecx913IA513VshX94Zu4HiiIgHfFsvYwaQFLtJP8iG8mqKSCv+SImjsssGTsvk10
	B9wDyz3GX3kq9tygLUz9m+Gi4v0QDwbGdKyaLZkwwNowpN
X-Received: by 2002:a17:903:41d2:b0:295:62d:5004 with SMTP id d9443c01a7336-2a7188a1bb9mr34323665ad.26.1768580556640;
        Fri, 16 Jan 2026 08:22:36 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa333sm25165245ad.5.2026.01.16.08.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:22:36 -0800 (PST)
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
Subject: [RFC PATCH v3 3/5] rust: add device wakeup capability support
Date: Sat, 17 Jan 2026 00:22:01 +0800
Message-ID: <20260116162203.296844-4-sunke@kylinos.cn>
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

Add Rust bindings and wrappers for device wakeup functionality,
including devm_device_init_wakeup() and dev_pm_set_wake_irq().

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/device.c           |  6 ++++++
 rust/kernel/device.rs           | 18 +++++++++++++++++-
 rust/kernel/irq/request.rs      | 17 +++++++++++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

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
index 9a4316bafedfb..5e31e42e8ff00 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/device.h>
+#include <linux/pm_wakeup.h>
 
 int rust_helper_devm_add_action(struct device *dev,
 				void (*action)(void *),
@@ -25,3 +26,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+int rust_helper_devm_device_init_wakeup(struct device *dev)
+{
+	return devm_device_init_wakeup(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 71b200df0f400..b8f7e185e32dd 100644
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
@@ -324,6 +326,20 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
         // - We've just checked that the type of the driver's private data is in fact `T`.
         Ok(unsafe { self.drvdata_unchecked() })
     }
+
+    /// Initialize device wakeup capability.
+    ///
+    /// Marks the device as wakeup-capable and enables wakeup. Both the
+    /// wakeup capability and wakeup enable state are automatically
+    /// cleared when the device is removed (resource-managed).
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
index b150563fdef80..2484e4b53cdc3 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -120,6 +120,23 @@ pub(crate) unsafe fn new(dev: &'a Device<Bound>, irq: u32) -> Self {
     pub fn irq(&self) -> u32 {
         self.irq
     }
+
+    /// Attach the IRQ as a device wake IRQ.
+    ///
+    /// Attaches the device IO interrupt as a wake IRQ. The wake IRQ gets
+    /// automatically configured for wake-up from suspend based on the
+    /// device's sysfs wakeup entry. Typically called during driver probe
+    /// after calling `devm_init_wakeup()`.
+    ///
+    /// The wake IRQ is automatically cleared when the device is removed
+    /// (resource-managed).
+    ///
+    /// Returns `Ok(())` on success, or an error code on failure.
+    pub fn devm_set_wake_irq(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        let ret = unsafe { bindings::devm_pm_set_wake_irq(self.dev.as_raw(), self.irq as i32) };
+        to_result(ret)
+    }
 }
 
 /// A registration of an IRQ handler for a given IRQ line.
-- 
2.43.0



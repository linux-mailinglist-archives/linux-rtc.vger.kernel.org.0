Return-Path: <linux-rtc+bounces-5774-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AACA7D38ADC
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Jan 2026 01:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CD6F301F5F9
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Jan 2026 00:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252D31D5CFE;
	Sat, 17 Jan 2026 00:44:30 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169331C5D44
	for <linux-rtc@vger.kernel.org>; Sat, 17 Jan 2026 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768610670; cv=none; b=GZn1H1/vOgclLjO/1clX+oGoFza/ZSYbB13Z9jJC5VW3qG4D450DMUZ0SU/ZyolkHsMG7Mwr+asxgxIS+1y9Au057uP0QegWH4hVOAT/d6x5rwz8C+jrEXZ4sheSWbBi3YDdklbzAkn5WCi+Tt+SXtiFIMVtB//4k9qgoLmPuwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768610670; c=relaxed/simple;
	bh=CgBRFm2Cv+c7Lf71Brl/A0fgWHhAto09L/NNtNH7Mrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RApjbB9He0cXQ3SfFj6bg8zoP3R/oPDH7Q/Ug6ptdMNpzcem1WoMWufi4lg+u1crFnta3JSgxs/R77GqvZcCUpRThRF8FlqYj1yLHj1y75zeMkSztMhqCD8dIVNd7s5pa5ZN2ZIXkD7TmkmkGZfqHLlwipIWDvVIvzFpi5+wfEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0833b5aeeso25365135ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 16 Jan 2026 16:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768610666; x=1769215466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5LNGXAu1gOIuVgbKQ48AfTz/iHxZtEMCwM5bobAPUCg=;
        b=O1vHqslIAM6JQQa6Qsx2iwPldGtgMJB/mVBpUdsIPrF4lXuleY8h/3hak3X5FvLNRd
         ouEThDBLpXqrzygm8KXXnB7qS0J61K0AkQplVRBJjQvvuDuY77tJjjWiWFcJdFgoXr1N
         x269HxRyQCiYHSk1VtXbQ7bHz8SIUrBNPYGIbi4k5EWGSmIweADhqGz+3KUR/w5oTBKy
         AMefYD8tWrugnY2YR2Zjd54eOWWA+FZqVGhh8CWHOBdXgdsbxngvEg8xZSfNrz0IvBGw
         ym3isvPYQvLB7m3TjKNLVZHhFPoufLDznaVkHYvja0iH46Fzj/Ky/OVSMJ2f+a2IX7zP
         6tqw==
X-Gm-Message-State: AOJu0Yyjls52gn+7xxYUrogM7zXVWhm0YfiBDfnbGpgV37YiYvFJV5CU
	cdxNvbL7VIKCqqX8a0HxqqES52ZIPC2bWi/TKtkl8RjPLuCrXrHqTF0gNDOhPGO5
X-Gm-Gg: AY/fxX5ZpzptlhfoQu+feOVVi4a/TCpKjEOeiu5i7oaAM5T/PVNY+InQWM2JdVfKDBO
	Uumczi7ZDnTlyzDRMKuAXyUmXWTgpvxrojZIPzk6IOhkgxXeYJfaiRnOTMXXnzYzknpluQkebcT
	g3J1sAqb57CGGTxpHbPHvTEwRp/UgKp3BlN7gTp8EQTjLAppxiBQ5l43Lr73Ug05RYCtTO6MYY/
	FRofQTwvYnQ/66BCMds3OF9al2VbHwPWEymm+xF7x24OLVOy5uucIH0zF6wbHh5fU5vAcUaex3P
	zpPYLNMIEZvT7bt73qyQJSJVTp0oAm5rO1b3MT82t2hF4BNAn3e/X0BgpFPiqSFvEryYVMKuOdB
	8Blb2gHBqaNvoUZMqKt7/d4R+R7bof/+K12qgStSDcVtJqa0BgaERUVaG3lkYv6wzDzNVUQP0Qh
	Csz+qn0+r30y0FEprezvp3yyEGizZ9jr75wkhTGHSIoOJo
X-Received: by 2002:a17:903:2ed0:b0:2a0:9081:8a6 with SMTP id d9443c01a7336-2a71887c864mr40490835ad.20.1768610666344;
        Fri, 16 Jan 2026 16:44:26 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a719406505sm30381715ad.84.2026.01.16.16.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:44:25 -0800 (PST)
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
Date: Sat, 17 Jan 2026 08:44:13 +0800
Message-ID: <20260117004413.449027-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116162203.296844-4-sunke@kylinos.cn>
References: <20260116162203.296844-4-sunke@kylinos.cn>
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
Changes:
- Add new include headers in alphabetical order
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/device.c           |  6 ++++++
 rust/kernel/device.rs           | 18 +++++++++++++++++-
 rust/kernel/irq/request.rs      | 17 +++++++++++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index fa697287cf71b..327298fb39b00 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -72,6 +72,8 @@
 #include <linux/pid_namespace.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/poll.h>
 #include <linux/property.h>
 #include <linux/pwm.h>
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



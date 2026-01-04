Return-Path: <linux-rtc+bounces-5633-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF7CF0A3A
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 07:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C511C3006442
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 06:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBCD2D876A;
	Sun,  4 Jan 2026 06:06:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2C41C63
	for <linux-rtc@vger.kernel.org>; Sun,  4 Jan 2026 06:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506813; cv=none; b=OI5rBrd6oKtDaH6gZLE8U3zbAVE/mZi78uWUtF7gsMfq5rURNCZUu0u/vbVzW5y+15bYpUGJDM+krxyj2zVu7YOXjLZnux6cq1+CGbjOmUIhTEKEQ3BMY18o1FWDz0u6gEQyT6QshQQSOEdySwrd8ecqKtZIjP7Mp0qL6oHlbHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506813; c=relaxed/simple;
	bh=UiKSZWJIwCpSZ0POmvhQ82fyeBB1iLLkfyPAwkgu2EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CH3c6JXqWmASweTqbZvVEZmkTJVbW16AjiC2RbV0GrW2UMGhOGwi7oqwk3cO0lRwvRTX5t1pTlig534qZv6LKxvOyyiDiF7RcFbeh1nZQR8X3sKiftm0g7A4+iih8fz5E/d8UbTzzOJP/nr99k22EI27glMVaGeUQii7NEDcOAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0833b5aeeso177701725ad.1
        for <linux-rtc@vger.kernel.org>; Sat, 03 Jan 2026 22:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767506811; x=1768111611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+m/GtzcsiFqg7YzaIi9hheoxPoi1BFhzxVzGP1/WLd8=;
        b=qVRkGB6HI8bhzLtolroGL0oFPeMNQzT1o4ierY3xkkvCXi74YI62C9GLZ3v5ljSzGJ
         59QSC8x6PYhFLPv+S5/N2BPFmfGYq/8RQYIcj1WdjbgPcpDGTflLdcl530py+d/rnFzS
         MqlkR8d+nnmIhSLH52ZDPUErmcV9RZt4HctH6IYxaEYj8QIMfCmg7ruzXGwuK9vx+SZU
         TLWAWJ0VIB/7gpOMY7m1rwHrVwYrMk7zEvOQgdwK2NeZledbTOvT2TNZ0nUTHbwhVFT4
         OrzWb6b/ZO35qJQelhdNaUTEFeoA4nQmkoD+tRS5fCNwBo0qmcLKylV3xeB8feLZNX+u
         6q4Q==
X-Gm-Message-State: AOJu0YwWGeqbu3X0JcUEEQuBDG2pjrFMVHAQMtiDxKu4dUA2yGgKGeHs
	PK0GdETzzmZbH4Dn58TVAhbsK34Hth/378L30pRFkCjBRiRDfWF7wvG/
X-Gm-Gg: AY/fxX7Yy+GP2DNgLMBVmq63aqEnEjyb3rvfWmNQEMD4jE04bYpyuFh595AZERnK9/n
	XBmZeUPp2FvrGGwNxl5Se2Q1XIg1NIocUl9j/L9lKAosnoOa4pgOpfmMO+eVYjQLvBpl8scKWf8
	MWGDFG3+kFflGpupg8Gif3VBfFx5l5UkMKjFLy3Ruv4tnOCp0Nc1PG63nNS/TWF44uWQXByUN/P
	fpQbTmcVgZ0eAHYvFw/GwHQV9UJSFBIHmAovys+WftxkkGvhkP2Fwox2s449qdcJ1Oja8L66nPO
	oDoJ0zNtZC/WguNdR0n0SkjcVSDLkg02G7cB1gVoSlp0wFA1wcyZ32CE8aGfI3F5Jiz9pAlcdgv
	XYZDtBIYKZCY9Kw+10bsEKGk5dVmCEzrDWa1ydt0zwEwCjcSgckuiVOEYi7ZUWf+Td63S9/tvlh
	V07St0XzPKfjYCIziFVN96
X-Google-Smtp-Source: AGHT+IGcn1o1YC/HfI0u7HpdXzspYAgOMchHcV/5rTqfmr7jUGqmUWhMt0FQ8z+bWXTpRO2llbXJQQ==
X-Received: by 2002:a05:6a20:748b:b0:366:14ac:e1e2 with SMTP id adf61e73a8af0-376ab2e78ffmr48873296637.72.1767506811365;
        Sat, 03 Jan 2026 22:06:51 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm40408449a12.17.2026.01.03.22.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 22:06:49 -0800 (PST)
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
Subject: [RFC PATCH v1 2/4] rust: add device wakeup support
Date: Sun,  4 Jan 2026 14:06:19 +0800
Message-ID: <20260104060621.3757812-3-sunke@kylinos.cn>
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

Add device wakeup initialization support to the Rust kernel:
- Add wakeup-related headers to bindings_helper.h
- Add rust_helper_devm_device_init_wakeup helper function
- Add init_wakeup() method to Device<Bound> for resource-managed
  wakeup initialization
- Add set_wake_irq() method to Device<Bound> for setting wakeup IRQ

This enables RTC drivers and other drivers to properly initialize
device wakeup capability.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/device.c           |  7 +++++++
 rust/kernel/device.rs           | 35 +++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

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
index c79be2e2bfe38..c064111a24531 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -325,6 +325,41 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
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
+    pub fn init_wakeup(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        // The function is exported from bindings_helper module via pub use.
+        let ret = unsafe { bindings::devm_device_init_wakeup(self.as_raw()) };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(())
+    }
+
+    /// Set a device interrupt as a wake IRQ.
+    ///
+    /// Attaches the interrupt `irq` as a wake IRQ for this device. The wake IRQ is
+    /// automatically configured for wake-up from suspend. Must be called after
+    /// [`Device::init_wakeup`].
+    ///
+    /// Returns `Ok(())` on success, or an error code on failure.
+    pub fn set_wake_irq(&self, irq: i32) -> Result {
+        if irq < 0 {
+            return Err(crate::error::code::EINVAL);
+        }
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        let ret = unsafe { bindings::dev_pm_set_wake_irq(self.as_raw(), irq) };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(())
+    }
 }
 
 impl<Ctx: DeviceContext> Device<Ctx> {
-- 
2.43.0



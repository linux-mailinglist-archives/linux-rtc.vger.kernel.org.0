Return-Path: <linux-rtc+bounces-5666-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 40885CFE637
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 15:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DA96300F692
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 14:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02F93446C4;
	Wed,  7 Jan 2026 14:37:56 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E503246EE
	for <linux-rtc@vger.kernel.org>; Wed,  7 Jan 2026 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796676; cv=none; b=Gm0RnW1jnr4cAlJ2N65tKkrWGlxGMKFefXw/VgB9Dx/Ds/47TccIdSWRjHrWFMsuzVxjQQ1oG4Oy7G3pJXDTjBZ95ZeN8MdoasmDJMVZB+FCFw02jhYj/U9vk2qfBesk2jLP0uJ8FN3vppHf/oD390HHEyBfU79bmmw3W7gfCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796676; c=relaxed/simple;
	bh=kPiBKjd0tCc+xmV/TMc4nVnRpkWniNPzMfq3q62D0Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3J1bGdbyipTEcVW91jvBcM4BCOs0yAHVGIfpXk1Wl7tGqsmvd3gndkvedD/errH0KiMps7MPFIpL6HPkl/ZfGaZRaqGDRfbgbfcwZJKI8EhJ2PF33iHiRHys4gKuB3idH3wkpch3ckr11MIS0e+DOzLKDJCkgoNBTc6AOa0uNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b9387df58cso2535133b3a.3
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 06:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796674; x=1768401474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNs2LYaQeHQE1lXl20I5Hb2AdyRp2ROQTu/4NHn9+ZU=;
        b=OTJ7lifOWLwR+GNcCtBLiKVCxBnVCuZg731bMssiZXnWleU79X60srgc+x8fgS/Wde
         TS+dSXBuzlhHBlEcJwoNzmsmgATPqqW6pG1o5kBUKgEkidBSbblnEPj+nAAZOLcdsp1e
         sWHA6hE0YRNsiwoEHXnFm6ufsqRu7gk9k/pWHmEATibHYCng6z9lS8+uxSSKLXufdF6h
         5rNPIRbLeu70sp/3Pdg8kbt0ttiPGFomlYmx8fSascVXTjpT9gbXuBHL1eD6x2ZVfA4r
         uB1OPxIg/ScIm3/CFgsBVCV0ub67MEN8Ytu+knmx8HwOW2gmBKGLUsY8K63xPHK+gGL6
         ofIg==
X-Gm-Message-State: AOJu0Yy7INTgfK1YW06qFpBpcPiYAF4/xmNq9oBYQiFfmlpV1ZU2Kr4q
	0dJU5FTnb/dznyjXpOrn9PsB/2NcDoXoneY6ECNv6wS1BaPk11qclgX0
X-Gm-Gg: AY/fxX596/cv/wBlC+FzYHcXfHj9Qtp+/wT/AxrTrQW37hXwuKoG64Y3gqg7p0lP1ja
	TM68+QMk57gpgKIXG/KEJ4Un2KWdzbyhetqRvwYlcHNXOH1hdpnBjrcensonuXGJS0duK+n0ZY6
	9uksQjffFcG+T9q6/S0AIWQtn4XLNE3IwGXxXCG9PkdFcX8eithPYGutZLv9ziRNeRG0vdF1DLZ
	CxTQIYL1I3VLeOgKlStlTDK1I1jGeF0yOCUI6BM6uKHVcGsYZLaoUd+wKYMV/phW9fLKPUh5Do/
	48JiZJ3TLTYhuwETIspMd41QVuQQDm/NLOJEciYy/SW4hdMraoJY78v8ZK+5p1kjEpv3WL6Nm3P
	fdmQOaipzcp8mIL6i/b7b9O19Z/RAfYq2QLFAs/Jrg8t5mPWY6yvyUEKsj/QYAkagGcV9yUNLa+
	GKOCib7V3M38148lvM0of2
X-Google-Smtp-Source: AGHT+IEWNr3TbDmPngYUnqTf5Qq7wLyKeSUUMCdC97oX9M1QQa5Ox9V3uhO067R68fiFJRY9aDva/g==
X-Received: by 2002:a05:6a20:3d1c:b0:364:1403:7c9b with SMTP id adf61e73a8af0-3898f90514amr2623401637.21.1767796674260;
        Wed, 07 Jan 2026 06:37:54 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm5470352a12.2.2026.01.07.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:37:52 -0800 (PST)
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
Subject: [RFC PATCH v2 0/5] rust: Add RTC driver support
Date: Wed,  7 Jan 2026 22:37:32 +0800
Message-ID: <20260107143738.3021892-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds RTC (Real-Time Clock) driver support for the Rust
kernel, including the necessary infrastructure and a complete driver implementation
for the PL031 RTC.

---
v2:
- Migrate RTC driver data storage from parent device to RTC device for unified interface
- Expand AMBA bus abstractions to full driver support with enhanced functionality
- Refactor device wakeup API by moving wake IRQ setup to IRQ layer
- Simplify RTC core framework by removing multi-bus abstractions, focusing on core operations
- Optimize PL031 driver implementation and remove build assertion dependency

v1: https://lore.kernel.org/rust-for-linux/20260104060621.3757812-1-sunke@kylinos.cn/
- Add AMBA bus abstractions
- Add device wakeup support
- Add RTC core framework with multi-bus support
- Add PL031 RTC driver

base-commit:
---

Ke Sun (5):
  rtc: migrate driver data to RTC device
  rust: add AMBA bus driver support
  rust: add device wakeup capability support
  rust: add RTC core abstractions and data structures
  rust: add PL031 RTC driver

 drivers/rtc/Kconfig             |   9 +
 drivers/rtc/Makefile            |   1 +
 drivers/rtc/dev.c               |   4 +-
 drivers/rtc/interface.c         |  18 +-
 drivers/rtc/rtc-pl031.c         |   9 +-
 drivers/rtc/rtc_pl031_rust.rs   | 503 ++++++++++++++++
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/device.c           |   7 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/rtc.c              |   9 +
 rust/kernel/amba.rs             | 396 +++++++++++++
 rust/kernel/device.rs           |  17 +-
 rust/kernel/irq/request.rs      |   7 +
 rust/kernel/lib.rs              |   4 +
 rust/kernel/rtc.rs              | 985 ++++++++++++++++++++++++++++++++
 15 files changed, 1954 insertions(+), 19 deletions(-)
 create mode 100644 drivers/rtc/rtc_pl031_rust.rs
 create mode 100644 rust/helpers/rtc.c
 create mode 100644 rust/kernel/amba.rs
 create mode 100644 rust/kernel/rtc.rs

-- 
2.43.0



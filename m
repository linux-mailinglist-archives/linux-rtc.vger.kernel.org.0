Return-Path: <linux-rtc+bounces-5631-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC1CF0A37
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 07:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E1333006615
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 06:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608B62566E9;
	Sun,  4 Jan 2026 06:06:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB341C63
	for <linux-rtc@vger.kernel.org>; Sun,  4 Jan 2026 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506800; cv=none; b=gd+zOxUPJmy8bBLY1LzWfVYpuHwXDFFTA3mAaDqC0/NQvjJZexmFgbKyvYbip0Mo3pmFp0QZryRvzvwoTIFHsx7eeKWwrpWCcfomN+GjM7ko2FLnXr90U1gy540tQm12SkN6fym7p9NczH1gkO39Z0X/ASd+1nFXKDxnd1KJXDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506800; c=relaxed/simple;
	bh=f25w8P30XwdOFYdYUuubeRWXeDZoWUpUtZtcN44QvLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/3kmtE9ZdnXGV/UBeuaUqAwBjOFK2Ko0LFvctwlWZoT6Qsc59ivWjGBUACSre9BgCw84+08PEd+WE8xohfPdMFpmPlnkX8UvoRoRq+yJEs6/nxQupozMkGex2JqlxnorF7J/o8t0Si0QDA94nUS5S0wTFIuST4shJlPgT6P44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso14116695b3a.1
        for <linux-rtc@vger.kernel.org>; Sat, 03 Jan 2026 22:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767506798; x=1768111598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFisLg7pB0/wjg1yiWyF/1wSgIjJKBjQesBSdc1bhbs=;
        b=JphqclDusdaLJyz8bsuVdwbiw8AIvrw8y7qNuis1H+dBOuaFvc58dK48TeWWE8EQ+s
         9SGX8thwoIK1hfltQOemwm+WtpBgrGuW9oz5RUEV3f/BhbB+QDUapc4pmY/J73XY77QR
         LWqYfdWsdJctecNxXz1xaTzpKmXlRZEI2bTDq3Gu2tyLcn5Dzv/YupxxMM6LnwO0xRyk
         KD0pLDaV81RJjDCEJH4eAF6O5SawG/kZDnmcCPrCK+1hZx+4Mm+brlTEWSepFBjFowKl
         +pHkCtQ/44cah32frEhGO1ca6YhOyXfMKnrhX3D2MxPnQ0kVeey69hKTgxty6UBgRDWR
         LVMw==
X-Gm-Message-State: AOJu0Yz9mBRo9eSqBe8GrYgs0teHszW0PI5S01eU5L+hYntlYAAk1Ncs
	r8EoZrwsOK0wC5NGJbJX4Zbt5klUHGopAGG0NgLZBMY+J1Res+mMsB+8
X-Gm-Gg: AY/fxX7GgXJetocYNrcSEcJ/oS3/cTrTk5L7oPvEU81sjTcS+EhbMyT+MR0uhACFrIm
	7Kh3mJ+MXLHV2xGQ8hKRjVdqNlEPVOptPCuyslbnpt6bNrqZlF7Ygzr+KmG7LiAtwFvdlkKL90A
	iHmFIeEprSkQt6QyWD/z6STTERIQ73ITftrtTF/yOWE3SNrji/DyIY/YbHFTVIEiTnCD+SVdGA5
	p1ho+4Ty7owS9Jcz1oRNPTBn5WS/ufGq2TR9C9egxPFdwuv24QhjIUg0whDwG9CczG//UXbvygD
	7OYVvMYoF3gbyhwuV+7GAyJqczXrQ+hCvukDXaQSwWwY3d+T/2FW2ZISrQiYeQVg3AVf6gY0MKD
	RbiBrUhj8kH4wHqE5n+exsFLqHw8yZYyrqRUOICnCCENpSq1DDxbrPCU+40sgZwHyaC5CPHJpvl
	lrDVjYCITGW3Pqobl8la3T
X-Google-Smtp-Source: AGHT+IF9AK+JALTPPWQqLosv5pj01c7qsNSyZAurq4xyUFOmRaqEL13nw9E73V7Ggd2KxeGALEEhsQ==
X-Received: by 2002:a05:6a21:6da8:b0:366:14ac:e1da with SMTP id adf61e73a8af0-376aaff44a8mr38934085637.64.1767506797751;
        Sat, 03 Jan 2026 22:06:37 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm40408449a12.17.2026.01.03.22.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 22:06:37 -0800 (PST)
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
Subject: [RFC PATCH v1 0/4] rust: Add RTC driver support
Date: Sun,  4 Jan 2026 14:06:17 +0800
Message-ID: <20260104060621.3757812-1-sunke@kylinos.cn>
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
for the ARM AMBA PrimeCell 031 RTC.

The implementation provides a generic RTC framework supporting multiple bus types
(Platform, AMBA, I2C) and demonstrates its usage with a complete PL031 RTC driver.

---
v1:
- Add AMBA bus abstractions
- Add device wakeup support
- Add RTC core framework with multi-bus support
- Add PL031 RTC driver
---

Ke Sun (4):
  rust: add AMBA bus abstractions
  rust: add device wakeup support
  rust: add RTC core abstractions and data structures
  rust: add PL031 RTC driver

 drivers/rtc/Kconfig             |   11 +
 drivers/rtc/Makefile            |    1 +
 drivers/rtc/rtc_pl031_rust.rs   |  529 ++++++++++
 rust/bindings/bindings_helper.h |    3 +
 rust/helpers/device.c           |    7 +
 rust/helpers/helpers.c          |    1 +
 rust/helpers/rtc.c              |    9 +
 rust/kernel/amba.rs             |  234 +++++
 rust/kernel/device.rs           |   35 +
 rust/kernel/lib.rs              |    4 +
 rust/kernel/rtc.rs              | 1710 +++++++++++++++++++++++++++++++
 11 files changed, 2544 insertions(+)
 create mode 100644 drivers/rtc/rtc_pl031_rust.rs
 create mode 100644 rust/helpers/rtc.c
 create mode 100644 rust/kernel/amba.rs
 create mode 100644 rust/kernel/rtc.rs

base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
-- 
2.43.0



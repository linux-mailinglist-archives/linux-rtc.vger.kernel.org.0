Return-Path: <linux-rtc+bounces-2423-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710819B8E44
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0BDEB2182D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 09:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A9A15DBAE;
	Fri,  1 Nov 2024 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TuNZ8Bpt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A71415ADA1
	for <linux-rtc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455062; cv=none; b=ViXNr2nOGkhgQSZF1fYgcC4ladqhhrDUfZtLxd/ehlslL6F+LyphOS++c1M1YV7OuaomBr7hqeqRcqSMdvujYG+Pz3HHs2yrtZ3TQyUgvhRYtMvngauppQklYVx64I7RZeixvPhUdexO27uGK96x7YXP9irH9i8O88mbmyQWpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455062; c=relaxed/simple;
	bh=u7QY7saT7lh9qMQzC1aqvcwYfJEWmT4Ojyxuu/AyZos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hKgjyjLEGXzAvsL6YKJV7bbixCJ43A5Rpd2gHfqi8pHlEAgPHLB4yDbCTiyepCyByvsKt+mD9sR4RrqxFW4aCgoNbSDZO4LaBnfq0mTbpskqbvBmrCAO+NLzKwMRaPGyRvooYvxLxu3YZ5XBBs568pSh3salmowdl87ilheOwJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TuNZ8Bpt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c984352742so2198163a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455056; x=1731059856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VkWLa1FF6BzDGEOlRo45xTi9HEweUx52IMDZUJC3W3A=;
        b=TuNZ8Bpt7/OlYTuWd5HNjRnF/9W/IIE1IZocT5+dcpO4m/ob9w9LfDlYAvLncvpx6Y
         xIaJyTRYPbRY/DNaggkD2xvEOoRu2ZIKIxXmRu3/kHxf+HKu+0xKFJ4y9SSTHxB0v52X
         vo4Xt3c3i4NgPmk3DmU+9V9gf5mZjF+lNNrvOdhrvileNj8DQ8y7HfGEZxjoumfeqn6B
         cDZOR/Fh0sBNZyKssFkSxRK123aQzXxmXigmywenrtQAxC+vu/I/4Ai2Ruxv2PXYcuPR
         GsxDZg+TuQdyjAWwgNFW9vXkkRdFN4HZVx8C29GcDUFGo59mfPClj7QqPYIbGtfz+8lR
         PV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455056; x=1731059856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkWLa1FF6BzDGEOlRo45xTi9HEweUx52IMDZUJC3W3A=;
        b=ppTb+BfMWiijPlcs5ZyafW82cv6/WC9brlqpXFaJWS5McRDa+NbRbUyYUkobhEfzgd
         tGBtRwdXy/D2/gd3gYbXXWSZkHzKSCYdX7JExHm3bqFj4SfEy08jhiqBaMX6J/PCkAHC
         dg8u+/P8ZtuTNPZ6SFNZj94paU1YVLIU35excW/AiVd7zLXiWgM0Dc7VMpcE88fW/gQI
         9JeY1W13sS3LvwENo0oSeQd6UYNMK6Swy1rzRBoQqHWFnerttXUESmBRia83++zNBl4D
         4z6c5QgzwpgAkO2/ZFYVm9Sdzx9dsfzkQsLmFbfv9hoxYDTwmNgC+Uq55A1CyIK3ufpj
         QwoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnbBCjY/yAgD0S6WXQmXgKDXicmzul3rwWtzoVGar1I6Hjja7QqmjjZXEly3Q70MA/bKnWV7uEEkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwanlCkS706Ptdw3nDjWdbDt+t44nP3IknN0iwXv6fy/N3oS8As
	+NPdEO53JHid+3cp9wws6dKlyKhEmWJNiIoZ8VOQsN3LaHQS4nAmTgr7dVauwrU=
X-Google-Smtp-Source: AGHT+IGRtBYD1dOUvQuIQlQLj2pdPegx5k8lcdT/lJDx4obsDzdA8gaMq9JOwdMxgv+GTXcS3XRj5g==
X-Received: by 2002:a05:6402:40cf:b0:5cb:acb4:8f2b with SMTP id 4fb4d7f45d1cf-5cbbf876412mr14451734a12.4.1730455056199;
        Fri, 01 Nov 2024 02:57:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:35 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 0/9] Add RTC support for the Renesas RZ/G3S SoC
Date: Fri,  1 Nov 2024 11:57:11 +0200
Message-Id: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
IP. A 32 KHz crystall oscillator could be connected to the VBATTB
input pins. The logic to control this clock (and pass it to RTC)
is inside the VBATTB IP. For this, the clk-vbattb driver was added
(patches 01-03/09).

Patches:
- 01-03/09: add VBATTB support that provides the RTC clock
-    04/09: fixes compilation error for RTCA3 when building for RISC-V
- 05-08/09: update the device trees with proper nodes to enable RTC
-    09/09: enable proper config flags for RTC to work on RZ/G3S SoC

Merge strategy, if any:
- clock patches (01-03/09) need to go though the same tree because of
  patch 03/09 using the devm_clk_hw_register_gate_parent_hw() introduced
  in patch 02/09
- RTC patch can go though RTC tree
- DTS and defconfig patches can go though Renesas tree

Thank you,
Claudiu Beznea

Changes in v4:
- select VBATTB and RTCA3 as module and adjusted the VBATTB Kconfig
- fixed compilation error for RTCA3 when building for RISC-V
- collected tags
- dropped patches already applied

Changes in v5:
- dropped patches already applied
- fixed build on rtc yaml file
- fixed indentation in patch 01/10 description
- collected tags
- per patch changes are listed in individual patches

Changes in v4:
- added patches
  "dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC"
  "clk: renesas: r9a08g045: Add power domain for RTC"
- squashed the following patches from v3:
  "Add clock IDs for the VBATTB controller"
  "dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB"
- fixed typos in commit description
- moved assigned-clocks, assigned-clock-parents from the RTC
  documentation to the VBATTB documentation; same adjustment has been
  done on the device tree patches
- renamed include/dt-bindings/clock/r9a08g045-vbattb.h to
  include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
- used quartz-load-femtofarads
- used RTC_TIMESTAMP_BEGIN_2000 and RTC_TIMESTAMP_BEGIN_2099 in the RTC
  driver and added a comment in remove API to mention RTC cannot power
  on the system
- squashed defconfig patches
- collected tags
- per patch changes are listed in individual patches

Changes in v3:
- dropped patches "mfd: renesas-vbattb: Add a MFD driver for the Renesas
  VBATTB IP"
- added patches:
-- dt-bindings: clock: r9a08g045-vbattb: Add clock IDs for
   the VBATTB controller
-- clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
- moved Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
  to Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
- addressed review comments
- per patch changes are listed in individual patches

Changes in v2:
- dropped patch "clk: renesas: r9a08g045: Add clock, reset and power domain
  support for the VBATTB IP" as it was already integrated
- kept only a documentation file for both VBATT MFD and clock drivers as
  suggested
- addressed review comments
- used cleanup.h lock helpers
- update startup sequence for the RTC driver
- switch to 24 hours mode on the RTC driver
- fixed range for the RTC driver
- added a generic compatible for the RTC driver as this will also be
  used by RZ/V2H
- used clkin/xin clock names for the VBATTB clock driver to determine
  if bypass should be configured on registers instead of having
  dedicated DT property
- added mfd driver for VBATTB
- updated Kconfig flag names to include vendor name
- removed DT node labels from Documentation files
- used items to describe the interrupts and clocks


Claudiu Beznea (9):
  dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
  clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  rtc: renesas-rtca3: Fix compilation error on RISC-V
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags

 .../clock/renesas,r9a08g045-vbattb.yaml       |  84 +++++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  34 +++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  16 ++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 205 ++++++++++++++++++
 drivers/rtc/rtc-renesas-rtca3.c               |   1 +
 .../clock/renesas,r9a08g045-vbattb.h          |  13 ++
 include/linux/clk-provider.h                  |  18 ++
 10 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

-- 
2.39.2



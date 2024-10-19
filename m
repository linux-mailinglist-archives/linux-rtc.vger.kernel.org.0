Return-Path: <linux-rtc+bounces-2238-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF609A4C25
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 10:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12C80280A47
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 08:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C61E1DED50;
	Sat, 19 Oct 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qx/IXr3Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B6A1DE3B1
	for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327674; cv=none; b=DgiuyZnDu3X+WErMjO7iQKGl3o9VAc5qJ2yN7m++J7lu7/e/PXsMSWU81I/taBHcHLHuMbTNZ8DQ0D+ZnMDfWXgpwfqY5e3qWvTNo2O/NVf61SGNMpPChVDaM51wJgLQJ0ytd4ZFJMrpF9mpRcet6XPchOUtfuxyJv7Ey/g+qCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327674; c=relaxed/simple;
	bh=0humHk0h84GkfzG/89gXUvbWvKrJHsV+L/snou+PUOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fPsgyHCZFiGxvxE1eJTarUbsX2zY0ogHVuDViGNWE/xgP67vhzH8hu0xKfJ2kNGvBFlno1gmqZiGgPNL1RFCM0l+l0jHYD+zX06axtmDRWERK9o2ygof1VNJYMdDtqAyEJjLmFhEFGlCdTTS0PCDz3Wh30qZEYA6fpv4JrORJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qx/IXr3Z; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d495d217bso2688864f8f.0
        for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327670; x=1729932470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnMhDuCRqPR6NBJjRmLAtq7Ajsx92GN7wnYD8LuLv1U=;
        b=qx/IXr3ZL01cyNVpLxPSryBuo7DqP1nLUe/jw25GVG7e6VNMYKE6xfZZv1p1Lo0PZN
         qNd9JAp5spwXBEuL1Ab7Elj3XqXEQjP70Z1j0yg5sn4Qi2PTdHgm/pRZDJUwgSfI7mYt
         fGEixfG0v/WLrPdM/5zlfkM5IMeM8EfPwCG/RMDSXnEz2cREuipEV829aY6z6+P3rOPZ
         colUxyNsxxd5jGqJbEr2lnEESoealFcjiuxMuhEM4zzfulQJt7i68hO+ApSb9wjynoUB
         bcGoPuFkC48y+5Lm0AoTVd6NBzFdFPzfwukpaNMtSxpDuWRSsdaNB3UUbc90/Xb2Ctla
         Hq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327670; x=1729932470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnMhDuCRqPR6NBJjRmLAtq7Ajsx92GN7wnYD8LuLv1U=;
        b=BkL/hRrU987869Mm9riKIDt4d7zNQOLjycexLFJqAWcuUISl9xHCO1FtVxPfg8gRuQ
         jGyqn8OGLtwlbWYtNmqbNO0SbZD3v8Iv8Twn5xPt4igZs+IouiOS8nZKMdnupIbhHhQd
         Oio/Z6uxv6hQPj7+nTKHX/T2vTnM/iHELxveyJo1wLD3LhFNKQejBemWAz60gu9lW43A
         KMAqynsFp2muJ0XbF2qYPRNPdUzBrT9evh8jjkSBWanBSCQzL7uRHDJ4CFqb4uVOrTP2
         FF18Q02M51ONxbcE4kB+FmCQ5fe4oR4Gc0koQjHwf/h+HMy4YD7zT+P5A+AxLGChpciM
         iRmw==
X-Forwarded-Encrypted: i=1; AJvYcCX0REg5KdQaahnuflHm67Dxl7L7fLdcBYnWlE6Oz1QLxiuahrfsCHDbHeK8aOlnQVBwsaw/DcYdlUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjH8FD0Kc15e+8WnlgprIpEsgDPf9JHb5UKO8oxJPQe2crua7P
	WKRnhLyohREJj23Tv4NrGekqW469L7Lqw4NHh5lN6fCSG0mjyQWOJeirnsjw/C4=
X-Google-Smtp-Source: AGHT+IEuVFF3OlCZCByZkHkU1Kuoy8OhgDbN4ed7/j3Yg73Z4X21G1b1EaKoTBw4Z4czo/GauTVxJA==
X-Received: by 2002:a5d:6252:0:b0:37d:511b:aec1 with SMTP id ffacd0b85a97d-37eab755935mr4597795f8f.45.1729327669730;
        Sat, 19 Oct 2024 01:47:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:47:48 -0700 (PDT)
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
Subject: [PATCH v4 00/12] Add RTC support for the Renesas RZ/G3S SoC
Date: Sat, 19 Oct 2024 11:47:26 +0300
Message-Id: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
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
(patches 03-05/12).

Patches:
- 01-02/12: updates with the power domain IDs
- 03-05/12: add VBATTB support that provides the RTC clock
- 06-07/12: add the RTC driver
- 08-11/12: update the device trees with proper nodes to enable RTC
-    12/12: enable proper config flags for RTC to work on RZ/G3S SoC

Merge strategy, if any:
- clock patches (01-05/12) need to go though the same tree because of
  patch 05/12 using the devm_clk_hw_register_gate_parent_hw() introduced
  in patch 04/12
- RTC patches (06-07/12) can go though RTC tree
- DTS and defconfig patches can go though Renesas tree

Thank you,
Claudiu Beznea

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

Claudiu Beznea (12):
  dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC
  clk: renesas: r9a08g045: Add power domain for RTC
  dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
  clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
  rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S
    SoC
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags

 .../clock/renesas,r9a08g045-vbattb.yaml       |  83 ++
 .../bindings/rtc/renesas,rz-rtca3.yaml        |  83 ++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  35 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  17 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   4 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 205 ++++
 drivers/clk/renesas/r9a08g045-cpg.c           |   3 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-renesas-rtca3.c               | 899 ++++++++++++++++++
 include/dt-bindings/clock/r9a08g045-cpg.h     |   1 +
 .../clock/renesas,r9a08g045-vbattb.h          |  13 +
 include/linux/clk-provider.h                  |  18 +
 16 files changed, 1383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 drivers/rtc/rtc-renesas-rtca3.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

-- 
2.39.2



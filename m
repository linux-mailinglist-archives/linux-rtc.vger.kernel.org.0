Return-Path: <linux-rtc+bounces-1798-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C53966236
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141651C23473
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3D11A4B6D;
	Fri, 30 Aug 2024 13:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NqrzlCHR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27E1192D69
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022955; cv=none; b=JuFiaVy1b0C6jRbSmvIb0QCPzEaI+iUtck7KzELbAxh5srghIcDJZImGeU6hXHAjx9UoiiunUOJNKoAhFygqmlnGxyrFzl567ridFT5/qVuSFx/7uxGyXVMGO22T+J73x/n6zmcP4rauG6wYYZUfczRf+2JQ1YZ8xWV2Pg+e8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022955; c=relaxed/simple;
	bh=dt4FKbEMYk/rV0y2plQpOfZYZE9i1bk/j6bo4oeHAGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f+cZkKi8dRRmaJQZ4qPylvzs52Gd2DOz4vnRWOdyL9roUeExaJXFBKovpYnoVeIUwiU+Xvks12lU1FmcVi8S9mvuZ44VwZBufQnpFO5IBw025HvBaZ3FOTjPiVuv+6WfW18hTYjAMCsy8OanUEAxCh3XEyt59x+7v/ABOmkAdSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NqrzlCHR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bbc70cc19so4813315e9.0
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022951; x=1725627751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6nGKHTlsaYnNPo28i56acvgAz+0LehleKY7G1KLCDM=;
        b=NqrzlCHREA+tW6Z0OtQbQVWgX39SHyuSboB92i+EOKDL5K+MfmwZO7k4OQsRWb16HI
         QL5axEW2zjfj4DWxYr4z5IEFb1hVElEFvatCuMlx6cSXGZIcYj6zGUzOyrY5LqMg54Lq
         ZxMk2Zpu5WwPee54ECjiztstAcIeF/R2GtWL5ldZW8hZ3/1h6wqYcjLuzn7lWq1HK22t
         j0s4gYHWXTSQ7459uwj1LH3zyhll0cK1TMDh4/vy1UWEoZQrTgcr/Vh0X5R7n71gqgDG
         HifOLyNJ2gqc1RgmQxDe/2tDH0amS2wMGW0D43QEUFqvbK/22Lw0suEj9OwqAfqdqUOH
         FccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022951; x=1725627751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6nGKHTlsaYnNPo28i56acvgAz+0LehleKY7G1KLCDM=;
        b=YKg65gw8kz+IzLhVqXsYiQF1BgB2z50UR92dnCh/lgUEqlZ27qZMsHl+axjbUkO//r
         7uGhzlTgqqxFUCtUPB/c34OWvIVuYMyuqlVSodF1OYRU58HjREVfxeBG919wH2jKUim1
         btMoA+QsZmR5z36rjqxsYTnqt0OGwe6JoG5mMvrt80XtYoyY6+B8fPQyFMMGbdZEG8eo
         jTQiSwIFOKWRTDR3M5Iudu3Akr/1Mg9ZqfZzMh9p9rLUXg/WvpUSB/Uk3gvjN4rg/ipo
         Ldta2qbRVQPpW2zGwIRTMro8ZTTk0kS76CnFKtRlXx+jEJJYJP0t3OzVaphs0zHXPdJv
         SVng==
X-Forwarded-Encrypted: i=1; AJvYcCUiemwj6dWMmFOCrY+gjkLDVDHYEgFwO1msNLFtXpzK9KHMqyoqJUBNNP704q//mroyJTHB+ajidk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJfVoJXWx8sTkCee+GEiQlZaK0kzxZlSrWceFEjAuNCXVijgK
	ofsj6ae0UTTFarUJRTaWYh/iYM2Xbw2JuJuTL3nzflXVdmnYx64WerIKQNuwqZk=
X-Google-Smtp-Source: AGHT+IFf90G7UI94oipmrsRGbRwetRqyjDJaZ1p7GkAjuXdmmZqJgfa2LrZRlu4lQdJfeM0ibK0EqQ==
X-Received: by 2002:a05:600c:3b89:b0:426:6688:2421 with SMTP id 5b1f17b1804b1-42bb02ee44amr47400445e9.11.1725022950478;
        Fri, 30 Aug 2024 06:02:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:30 -0700 (PDT)
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
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 00/12] Add RTC support for the Renesas RZ/G3S SoC
Date: Fri, 30 Aug 2024 16:02:06 +0300
Message-Id: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
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
(patches 01-04/12).

Patches 05-06/12 add the RTC driver.

Patches 07-10/12 update the device trees with proper nodes to enable RTC.

Patches 11-12/12 enable proper config flags for RTC to work on RZ/G3S SoC.

Merge strategy, if any:
- clock patches (01-04/12) need to go though the same tree because of
  patch 04/12 using the devm_clk_hw_register_gate_parent_hw() introduced
  in patch 03/12
- RTC patches (03-04/12) can go though RTC tree
- DTS and defconfig patches can go though Renesas tree

Thank you,
Claudiu Beznea

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
  dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
  dt-bindings: clock: r9a08g045-vbattb: Add clock IDs for the VBATTB
    controller
  clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
  rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S
    SoC
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB clock
  arm64: defconfig: Enable Renesas RTCA-3 flag

 .../clock/renesas,r9a08g045-vbattb.yaml       |  81 ++
 .../bindings/rtc/renesas,rz-rtca3.yaml        |  86 ++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  36 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  13 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   4 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 204 ++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-renesas-rtca3.c               | 892 ++++++++++++++++++
 include/dt-bindings/clock/r9a08g045-vbattb.h  |  13 +
 include/linux/clk-provider.h                  |  18 +
 14 files changed, 1369 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 drivers/rtc/rtc-renesas-rtca3.c
 create mode 100644 include/dt-bindings/clock/r9a08g045-vbattb.h

-- 
2.39.2



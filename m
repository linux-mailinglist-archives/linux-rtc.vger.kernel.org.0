Return-Path: <linux-rtc+bounces-3507-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9326A632BB
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 23:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14B423B0888
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 22:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B435D1A725A;
	Sat, 15 Mar 2025 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bH99UR+m"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BEA1946A2;
	Sat, 15 Mar 2025 22:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078969; cv=none; b=sS/M688YlDH0G+MlTLRjaJcZ+5OIkEUyU+DGOapOxqVKHgvRQUmn003ywTkrB5GeTW/98lWgbmawDZWE2By1dFS4Lj6KdExUHzalyEbocI2HKPlUQvLhvCDKenlXxBrOZSSj1xAykceaONOii07ljkMrz/CiI5lr96GQvCFs+DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078969; c=relaxed/simple;
	bh=6l/e4BZT8lhxfuw+OPSQude5u1W8+xfcPN/zou8o7Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W2b9wMyAX1lezLnHPRKNvG/KENxTOEJEBZ0PL7kZjZ9b6IujR5fcwHjbInSam4KXL7zp05mToM6lVRcpe1TWlppOMz/EtZkyz0IME/PWVYX55JHfHB0G2AwIFAFNTajgIGLWUO7ijP/DPYZPnBEisDBoAHQDYPrIlcgq+8AoFog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bH99UR+m; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so4793520a12.3;
        Sat, 15 Mar 2025 15:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078966; x=1742683766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxPp+8440mvdLmzWP1tZBfkPbElzdJB6Yj1e0G61KTM=;
        b=bH99UR+mNEGlacGoUheFI3tXkSkhzePDdRhW+9l/UtjJEh9ViS6zA3MeYTH1GWe5lR
         pGI2cZ85Hpn4WkQVTFLhZjIB7XaBBV6juNUIlMJFIHmO0rbuBXaVoNUMnI5I9tBHzsmo
         BSAXEoolx1S5NfFQJwelGSx4+SLp/TNaLmiZ+tm0v9SwvjGf++4q28LDAY3JNvMQPcPq
         xx5fg5u4kzVM405d8oBUG1b/BUsvI90BLPAkA6wiLs4oRBiEHMyI+Uor96F4sExr21U0
         0HYpKzdxwDe8I9tnAHcv0+7Oxr0L+a1bMt4cx+qtmh+RYTWlL5duRf79KriJwtiRLjom
         isnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078966; x=1742683766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxPp+8440mvdLmzWP1tZBfkPbElzdJB6Yj1e0G61KTM=;
        b=i1AkPUjCQaCaDUAbM/IG1Mes8F3rHeBrvv2v+mM0GGXI4n1Ll58LSTZmcyVRGDZlxN
         Da9iFBLbWihpIeRrQUL9/wzpnH9fqwV7mwIl5tJ8kJPfE9yfPyWLLvTemcDFizEGL8mv
         UtQ29j2WGMMwbyOwrNsXwizDOrrB7pBsspCb+9gVhlUyaTKaZTErsylz2/+TF5qTB5fe
         AFCaFEWq2nG9Bv3V6mlG/gaH5JS5+4pfFYUxTFIrf392LLts+xu70gpLvIct7lFbqOdv
         aC2tGN0EnnHBCLVDIjOoS6p7Y5RA37D8KkVd8gaEWdNM//YcK1g5fm8lMXmx/tSDZoA/
         BzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1hyEClvPpZkVirSd0x2YLfi6jluxTUf1slpeE1yODO7HvhJ6Z1YfLKR8If/5WNi9WakDPRxkai0s5@vger.kernel.org, AJvYcCV5+MGItSEUuD+HvXrF26sJa97vJ2U81gO9UDg69xFx4Kay9zCCkhevzs3MUi9VKlmzUusIdm3StYDR@vger.kernel.org, AJvYcCXIPfku8sCIbEOKF7LIIuk2rN/hhjvEyjPxeQQcpUgZ5SaE1bwsPEMPbWA/2oaU2R5tYCDj0oxpAkhg5n8W@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJJhWPx6OCGb0UtuV+PoEJQXFEtVQFfjTt5zb/mFtz9O87dsX
	RAbCQO547nYDARJ3d6O81Kp4Lb6adTlFIr0jyn0SjFidNxE17PvS
X-Gm-Gg: ASbGnctzMv5yfmGOS5PvJ+CLe11rEQY8X9Fo5wGrmzWa2DNddy/SXmQO0XYDW89m2RU
	glTBU2CpxbNLWCBDfbfpLKgAS2xtrZ3dTBWipg6sBQewRhaQKB74nGbc+ByiHcV5VJp0TZdAqNy
	RnJTtphJ0QGL1Qt9NqE3MG8UJXvdjmjfzYsBmam+NheI0z40IFP+2SPxC7HW/3uPLjPc7W/f10L
	gzrJXJcTp1aMkTfFCPDikMn3rG2N2Rf3TJy9iJPASkC2k1LZcmJ1Zmgxn08Os02OgMvIa5LuZvY
	HHp4+Tew0pXbwZD5qh4WdlYRWavs2eUS39FOl7JQdz5IFt04bwueZKEtGA==
X-Google-Smtp-Source: AGHT+IHdHT62KDoek7/Mwf2CB1MTI6zTheDL+LqDwBCokyl7Z15Lwm4YLyTSsTv4EPGqRwqMURzUxw==
X-Received: by 2002:a05:6402:34d6:b0:5e7:c773:ae35 with SMTP id 4fb4d7f45d1cf-5e89e6af985mr8218843a12.5.1742078965711;
        Sat, 15 Mar 2025 15:49:25 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b160dsm3775586a12.41.2025.03.15.15.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:49:25 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 0/3] rtc: sophgo: add rtc support for CV1800
Date: Sat, 15 Mar 2025 23:49:11 +0100
Message-ID: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Real Time Clock (RTC) is an independently powered module within the chip,
which includes a 32KHz oscillator and a Power On Reset/POR submodule. It
can be used for time display and timed alarm generation.

This series aims to provide complete DT bindings, but the drivers are only
focusing on RTC implementation. Possible Power Management and remoteproc
can be implemented later (hence the RTC driver is using syscon, because
MMIO space is really interleaved among different functions).

Series is tested on Milk-V Duo Module 01 EVB (SG2000 SoC).

Changes since v13:
- Dropped MAINTAINERS drivers/soc/sophgo F: entry in favour of the
  existing N: entry
- mfd_cell and platform device names "cv1800-rtc" -> "cv1800b-rtc"
- Removed Cvitek brand from Kconfig
- cv1800-rtcsys.c not build by default if COMPILE_TEST

Changes since v12:
- Moved bindings and stub driver from MFD into SOC subsystem

Changes since v11:
- dropped restart handling (will be implemented in PSCI)
- split RTC driver into MFD stub and a platform RTC driver
- dropped Reviewed-by: Krzysztof Kozlowski from bindings, they've got a
  rework
- changed bindings maintainer from Jingbao Qiu <qiujingbao.dlmu@gmail.com>
  to sophgo@lists.linux.dev
- added link to TRM into bindings description
- bindings: mentioned 8051 core in the description
- bindings are now MFD, not RTC
- bindings: added "syscon" compatible
- bindings: added "interrupt-names", "clock-names" (because of added
  PM/remoteproc)
- bindings: main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"
- new patch "mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)"
- added both MFD and RTC drivers into MAINTAINERS file (N: K: entries
  didn't apply)
- RTC: depends on cv1800-rtcsys MFD driver
- RTC: use syscon for regmap
- RTC: get named clock from parent MFD
Changes since v10:
- only start RTC on set_time;
Changes since v9:
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter()), otherwise
didn't start on SG2000;
- dropped ANA_CALIB modification (has been forgotten in v8 with
the drop of SW calibration to switch to HW calibration);
- successfully tested on SG2000;

Changes since v10:
- only start RTC on set_time;
- add machine restart handler (as separate patch 3/3);

Changes since v9:
- picked up orphaned series;
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter());
- dropped ANA_CALIB modification;
- successfully tested on SG2000;

v9: https://lore.kernel.org/linux-riscv/20240428060848.706573-1-qiujingbao.dlmu@gmail.com/

Changes since v8:
- delete unused macros
- using 0/1 instead of the DISABLE/ENABLE macro
- pass in the correct pointer when applying for IRQ
- convert the incoming pointer into an appropriate
  structure pointer in the irq handler

v8: https://lore.kernel.org/all/20240204044143.415915-1-qiujingbao.dlmu@gmail.com/

Changes since v7:
- pass checkpatch.pl --strict
- using u32 replace uint32
- using devm_kzalloc(*) replace
  devm_kzalloc(sizeof())
- sort header files alphabetically
- delete unnecessary header files
- fix wrap error
- drop dependent description
- using hardware automatic calibration replace
  software calibration. see documentation 197 page

v7: https://lore.kernel.org/all/20240122080500.2621-1-qiujingbao.dlmu@gmail.com/
documentation: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf

Changes since v6:
- completely delete POR dt node
- remove syscon tag
- use devm_regmap_init_mmio() replace
  syscon_node_to_regmap

v6: https://lore.kernel.org/all/20240115160600.5444-1-qiujingbao.dlmu@gmail.com/

Changes since v5:
- remove unnecessary lock
- fix cv1800_rtc_alarm_irq_enable()
- remove duplicate checks
- using alrm->enabled instead of unconditionally
  enabling
- remove disable alarms on probe
- using rtc_update_irq() replace mess of alarm
- remove leak clk
- useing devm_rtc_allocate_device() and
  devm_rtc_register_device() instead old way
- add judgment for rtc_enable_sec_counter()
- add POR nodes in DTS. This POR device shares
  the register region with the RTC device

v5: https://lore.kernel.org/all/20240108072253.30183-1-qiujingbao.dlmu@gmail.com/

Changes since v4:
- remove POR dt-bindings because it empty
- remove MFD dt-bindings because SoC does
  not have MFDs
- add syscon attribute to share registers
  with POR

v4: https://lore.kernel.org/all/20231229090643.116575-1-qiujingbao.dlmu@gmail.com/

Changes since v3:
- temporarily not submitting RTC driver code
  waiting for communication with IC designer
- add MFD dt-bindings
- add POR dt-bindings

v3: https://lore.kernel.org/all/20231226100431.331616-1-qiujingbao.dlmu@gmail.com/

Changes since v2:
- add mfd support for CV1800
- add rtc to mfd
- using regmap replace iomap
- merge register address in dts

v2: https://lore.kernel.org/lkml/20231217110952.78784-1-qiujingbao.dlmu@gmail.com/

Changes since v1
- fix duplicate names in subject
- using RTC replace RTC controller
- improve the properties of dt-bindings
- using `unevaluatedProperties` replace `additionalProperties`
- dt-bindings passed the test
- using `devm_platform_ioremap_resource()` replace
  `platform_get_resource()` and `devm_ioremap_resource()`
- fix random order of the code
- fix wrong wrapping of the `devm_request_irq()` and map the flag with dts
- using devm_clk_get_enabled replace `devm_clk_get()` and
  `clk_prepare_enable()`
- fix return style
- add rtc clock calibration function
- use spinlock when write register on read/set time

v1: https://lore.kernel.org/lkml/20231121094642.2973795-1-qiujingbao.dlmu@gmail.com/

Alexander Sverdlin (1):
  soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)

Jingbao Qiu (2):
  dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC

 .../soc/sophgo/sophgo,cv1800b-rtc.yaml        |  86 +++++++
 MAINTAINERS                                   |   2 +
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 218 ++++++++++++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/sophgo/Kconfig                    |  24 ++
 drivers/soc/sophgo/Makefile                   |   3 +
 drivers/soc/sophgo/cv1800-rtcsys.c            |  63 +++++
 10 files changed, 411 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c

-- 
2.48.1



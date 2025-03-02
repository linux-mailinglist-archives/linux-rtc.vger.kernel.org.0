Return-Path: <linux-rtc+bounces-3355-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC4A4B487
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Mar 2025 20:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AB9C188EA4E
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Mar 2025 19:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4841EB9ED;
	Sun,  2 Mar 2025 19:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyNXI1CP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68F08821;
	Sun,  2 Mar 2025 19:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740945143; cv=none; b=E8IkmnibiRG/DlnqvuCowTTwqd3W1cnoj61P/hbIBVUjFDvFx3pOP/QZGFiqBvzEcApQzt0QXIngdjpwOwSzJZFfVzTuXF2XuIb7HdVnfbn7qFOgZAQGyZP/Ef5QrHaI+K7df95Od7ytwmJhoemTgTn+KhT7f59Vx+DCCnBbGAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740945143; c=relaxed/simple;
	bh=SUMryhbX0X9cF0USX1ziBqd4yeFj5ZOMJW6fQP26vYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QyzTnHmw2BVtc8OMRV8/GuCRu9NWKANh9JcGUDyAvMS4cc8DtJMFBqwGMLufngcapFlcnp+b1fqXdLn/xGYyNn2AoQ8nl5Y2Lpv/tVSgiPzt41ESK4d3DoBmqsLJhqw7epugqgxX/HKsGGM3l6Lb3KWtbCp09x0QBZDLGsKklRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyNXI1CP; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso6642413a12.1;
        Sun, 02 Mar 2025 11:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945140; x=1741549940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYP8t9F2eM7G3LZt0fHBklDkCmd8trcuPA/HoTpu2pc=;
        b=gyNXI1CPCV9gqvH7TD2w3qPxIq3lg0jRJnsy1WzBIAbfXKHu0SUG4e8BBBoAiKyTYE
         jFsjdnY62dvXO/tpiZhK7PDnBMlv54axCqRAlldYMSkNqwsD3dQkkHGtcfF0zPMDMVq0
         6B2PttnLm6NPiiq+vBtv69JYK1eLad7G+98IpIxq9VUbhKSfoZZdWknzrAl9OBAvacBu
         3E/akTcenV5T8MizkXi+h6tW3/TJnEUcUO0uf/20TMw1zsO9Tq9ldWwGgWY1Lwu0ytsy
         5fzO2HwDnj71/aFjY7VqNPbNIKHnBCHA2FIrzBFZsnkahyTA+pjdV7JY6EQmrw62atO0
         FEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945140; x=1741549940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYP8t9F2eM7G3LZt0fHBklDkCmd8trcuPA/HoTpu2pc=;
        b=vb29tCXuY8JcZD+vMwiwKXmeDAHoLeyxG/wkZhX3xWR7SLHaJZ+O6ICdW/YZ/zGdZX
         LpkkgG3FS1R+Kcj2i5MNSiaTLwTZf1AoRvmHMZn3WcGq0rMjap5GbzQrXcSAAvGgekm/
         HtrE4eFjz6WmG7FNYQS9qF8qu5ixI888cEDQTFoG41qv32w7iFx1t/0134JM3swjDuBi
         l9c+c7YQTrQFRZAb8s4QmWBdQy3tMjguWq6V8Smcnrv1TPNJgxJzG/dBFSeDX8EUOa98
         BauJy7a2+B76pKLcWDrG9lshVmxa24Nsan+Pp6R3mDwrjI9KlKJYmwl4ATrEtrXIt6S6
         0N4g==
X-Forwarded-Encrypted: i=1; AJvYcCVCSXoUKKERu7lbuI/N6lj4HVT2zuFO0HVRdJHr/t2sbnbDvlMKZ077kHlZcEbj19kr7P/Edbtrc/icwcQ=@vger.kernel.org, AJvYcCWGxiUX8xWF558h6tTkayEmuv2yUZuMA8VnBpYmMVLBSL5b69CiAtZikLWVPNHAEPmj/sTlnfIiHPHA@vger.kernel.org
X-Gm-Message-State: AOJu0YzGtN3CwwPFlNLu/j4kDg+OioUowIaddmZXpPke8q25KGWMda6v
	rgIpxZ1xrTXEyQTzPsCngEcqUrZxWGlN54wMxzo9LySjRpqHduuE/dg3hypn
X-Gm-Gg: ASbGncsuWduSjpm51qWgFAxuPPPpIMsVZbhDsejosnwwG361zglL5icOlMaRPPSCfCR
	RKhuGmKIq2a6oMQ1f65PwJIkS711I9DhewzPKAJPu2zQTdsGtyedKl7C+/ib9xJWltIJf2Wszko
	p9zEaioaEA1TmBH9cgt0dJ9T8wA2q1AnMl8AdbwmDarXXYF8L8fLPm7sZb0+iRBmHuZDrLGTcj3
	XnQr451vzG4v3QTspZlIqN2MJbQhaLAeIGmgBTTb7A2JOJcWfCmtqt3TGZn2sXSc0Hoo2XFXHWk
	E4PtxC6jUTZh9LIy8mKLSFSGAe/Bsj96hixvmF3qtq0qmXEOvnjnTlV6pA==
X-Google-Smtp-Source: AGHT+IHxK+9x3N2RoBOpHXrRdxjUeE8wFstYk1+WdPhSYJmBzIWPQk2M+kfSD+vWEG2gL6GzseXg5w==
X-Received: by 2002:a05:6402:2113:b0:5de:dfd0:9d20 with SMTP id 4fb4d7f45d1cf-5e4d6b6ea41mr11133730a12.24.1740945139838;
        Sun, 02 Mar 2025 11:52:19 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:19 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: [PATCH v12 0/3] riscv: rtc: sophgo: add rtc support for CV1800
Date: Sun,  2 Mar 2025 20:51:53 +0100
Message-ID: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
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
  mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)

Jingbao Qiu (2):
  dt-bindings: mfd: sophgo: add RTC support for Sophgo CV1800 series SoC
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC

 .../bindings/mfd/sophgo,cv1800b-rtc.yaml      |  86 +++++++
 MAINTAINERS                                   |   2 +
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/cv1800-rtcsys.c                   |  66 ++++++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 218 ++++++++++++++++++
 8 files changed, 400 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
 create mode 100644 drivers/mfd/cv1800-rtcsys.c
 create mode 100644 drivers/rtc/rtc-cv1800.c

-- 
2.48.1



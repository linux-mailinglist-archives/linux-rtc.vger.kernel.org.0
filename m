Return-Path: <linux-rtc+bounces-4573-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF4B11237
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 22:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25A2F5C06EF
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 20:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84982528FC;
	Thu, 24 Jul 2025 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JgsZo+9c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84530243964
	for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 20:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388718; cv=none; b=s4LdxDVdko5K+TZs82OTxBUR/s7rm8rJWnoH0SPk4ZGXGoTKqFhuUArZ9igJ+SPYmEyQbpK6iDhNFToBISRcjtD53GkP9Gt/HxxlXarWN/IceDmrZUBc6DZj/X0jVIS6msNHqjS8p3KlcKtaqM0WqgsAiDSnj8kd1JK/DO92MsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388718; c=relaxed/simple;
	bh=XqFmUKYyFJuP9gT1VB2HqW1p4rCZAg9SeYxN+uj0LfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADqmZhBmr4bjG1eA0lxCNw6m7mbdtKuIvT/Jiv+tlVVFo3b2rOXNXVq7jtExMtdwxbzqGrUB8awKwYTUsQ6YK0v24joHF0J6/gcd4ZCp/fPlDSu1DRnbHgvvJH6bKIkaowit92VXCE9rdeq3CzOvE7REnDMTrgBvK5dRWAMsS1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JgsZo+9c; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3dda399db09so16434455ab.3
        for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 13:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388715; x=1753993515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrEbbbAkAppzih/TPSBGsQGG4aRG/XXDaMLZfTbNAAw=;
        b=JgsZo+9cWFnZxYjldlepDi3rd4ZE95SQfWcAGXn3MPqHRc1jow6Hb+tyyI5X7pNxaP
         1TFeuWiY86dsU1L4b7pUW+HzrPWxhau+hSP1Q7qK3UvsYr2AwZavTKG81wXGKi8RcfEU
         6zaUn/VhSQuTNrfgzjikY18Cc5BbhUx8lN0RhqMbZtN9LTptaEb4rVAGfE3hBrFd/07t
         SLTDQASrk5T6SC8d+ObTuTRNaqC9kQW1X4nZXUyAZWpg5xMQr8QDzHr+UDX9DkFFhUOY
         L7CH5UgHTgrcoykxd76LWCuahDu0k89SMhwFZUMA+JtGbSLMR52GQEYj7JQavDwRtvtm
         cpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388715; x=1753993515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrEbbbAkAppzih/TPSBGsQGG4aRG/XXDaMLZfTbNAAw=;
        b=H8BumPNoJAyd99TIhG+IyE6YyxRsyn1+VlLCR3bktR1xbnL3WEZB231G4COeKn4xIC
         saXRTAO40DBNwnYaMhVNm9Fa+4W/M6BKxhxOYAFstGjw3kahgn+VPd1XCsry/aE7UGGs
         R/Z01Pmqom8L1sNgkZJYt5mOvyC4+06KrKIKVCS+NufZbbOH8DA5OcP8Wbq78mtSdVs/
         fhDV5ZDoclM/al8tK0gTL6AqzpDS/sI5a5lTON/dlNuJj9wfhVQoY4XDcKxqSymJbyTw
         U3Jrnvc/7dFI/o9qGIJp6wgxSQs9FYuYml4FtYY2p+w3U2EeNJ6tX8fdUJjjLwuOymw+
         AXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe9QMwXw1tugRR6ahiHQF6KonaT8oDRz5W/mhi2tlNGiGKkV7sI48VM0+JzvBmnSAcODycVPK8aBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzKuPluIjA6AznylbhxMHuYUoujLcAVVE8F4haxQ8Zrn47JTB1
	ZRIf/UmDfSjvIOdhvvP6mOqhgXphpbboqJDlaX9ImAN0uZeKxi+CzpKvl8jShyb/zbM=
X-Gm-Gg: ASbGncuy9bMK7qUMQULwCz3iyxt/Yw6uLA9+MCQnTiVIViLGfTXlDi33GvGH/H0KyVS
	oDtX9r/oLCtZJZ/v4IRbUToeZBk74DUGJu1fxisUA4Fl1jLGgVEcI04Zy88bu5V07ILDYOOY+EC
	C0hEwGzF3ZP0MK993eoo/cgBqtOb65LoV6wO7Bf7ask6iVLjP8vHGTAkJH2Kir5D7Fl5TAcSF5x
	jRzFahRMAG2Oc0eHM/2QaItz1yqxFyw1C+8bhxDfjiZcus8XxuL3u2nrbmRhRWaQzDyKFQ93nPX
	z3veXIh2bJ+Le/HyZP2/K/BHVXSb8U4cTL4CWwbujBwr/JBipcmBFeC24nCycG4s7VSuGYC29gH
	VXIHgJ6zA15Q7tUngQtdBYk6MUbKFvhGIsSVyM3rZ
X-Google-Smtp-Source: AGHT+IE5uFkVwfcYSkjHyZF/c2W8eIlexXUx47CDYyxHzh9kAbZHbQXPpnACm7peHUuN/ml5vSYqEw==
X-Received: by 2002:a05:6602:1551:b0:87c:6d49:deb1 with SMTP id ca18e2360f4ac-87c6d4a568fmr1148165839f.8.1753388715572;
        Thu, 24 Jul 2025 13:25:15 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:14 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/8] spacemit: introduce P1 PMIC support
Date: Thu, 24 Jul 2025 15:25:01 -0500
Message-ID: <20250724202511.499288-1-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
converters and 12 LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

Version 8 provided the ability in "simple-mfd-i2c.c" to specify the
max_register value for the regmap configuration as an alternative
to providing a "full" regmap structure.  Lee Jones asked that the
max_register value take precedence if the regmap_config was also
provided.

This version changes a few things from v8:
  - Alexandre Belloni's ack is added to patch 5.
  - The max_register value in simple_mfd_data is always used if
    it is non-zero, as requested by Lee Jones.
  - The global regmap_config_8r_8v structure is back to being
    const again.
  - A new function simple_regmap_config() has been added in patch 2
    to encapsulate the logic that determines what regmap_config
    structure will be used.
      - It uses regmap_config_8r_8v if simple_mfd_data is not supplied
        for some reason.
      - It uses regmap_config_8r_8v if the simple_mfd_data defines
        neither regmap_config nor max_register.
      - Otherwise, it dynamically allocates a regmap_config structure.
        If simple_mfd_data refers to a regmap_config structure, it is
	copied into the allocated struct; otherwise regmap_config_8r_8v
	is copied.
      - Finally, if the simple_mfd_data structure provides a non-zero
        max_register value, it is used in the regmap_config.
  - A small duplicated comment in "simple-mfd-i2c.h" is removed.

  					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v9

Between version 8 and version 9:
  - The max_config value is always used if it is provided with the
    simple_mfd_data structure.
  - The regmap_config structure used is allocated dynamically if
    necessary; otherwise regmap_config_8r_8v is used.
  - A small duplicated comment is removed

Here is version 8 of this series:
  https://lore.kernel.org/lkml/20250710175107.1280221-1-elder@riscstar.com/

Between version 7 and version 8:
  - Change the global regmap_config to not be const in patch 2.

Here is version 7 of this series:
  https://lore.kernel.org/lkml/20250702213658.545163-1-elder@riscstar.com/

Between version 6 and version 7:
  - Revise patch 2 to preserve the option to provide a full regmap config

Here is version 6 of this series:
  https://lore.kernel.org/lkml/20250627142309.1444135-1-elder@riscstar.com/

Between version 5 and version 6:
  - Added Rob Herring's reviewed-by to patch 1
  - Add the simple MFD functionality suggested by Lee Jones
  - Update patch 3 (previously 2) accordingly

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.


Alex Elder (8):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: specify max_register
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  50 +++++-
 drivers/mfd/simple-mfd-i2c.h                  |   5 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 647 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
-- 
2.43.0



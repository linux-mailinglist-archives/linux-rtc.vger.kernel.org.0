Return-Path: <linux-rtc+bounces-4355-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F7AE8A16
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 18:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A54C1885D8F
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 16:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB9D2D5431;
	Wed, 25 Jun 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Zrh3HOUS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86B8255E23
	for <linux-rtc@vger.kernel.org>; Wed, 25 Jun 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869687; cv=none; b=DpFA6l64ILCg1MAUiwPPkQ9u5lzOAan/Hv6kUg3eyQti2pPQOWCSiXWi5VUDloe33hsNvkegFEs5HEiRWTeP+YWcYNZhLCtUh6vMxx5wimQEjE0vHiDyfsKyl82wEYrtKGtuI5PotwawgfhZoGN0PPc7KABQBoEFgiSGHBbfr5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869687; c=relaxed/simple;
	bh=J1G4wA185/RC88pABxfSgtgPkiCmT4wLJ8Skkm4M8e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OaltcVlUl7HSkiItPVaR4CnHOnIi/dVdSwY+XpQbxSURll42T/02xtVgnoKRCPyLgN5ufvEpGD7/xSKR6kGVWAhVRi6v7Aohx+fPrJ6gGEQLxumSx6qB48GLjYWHtN3qVHopjuvBJFPsrKj4IqPcKU2pk4sZF91f3n4bV25kN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Zrh3HOUS; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d0a2220fb0so4545785a.3
        for <linux-rtc@vger.kernel.org>; Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869683; x=1751474483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDCKEZvvy/u8mP8K+Ymdr+bMEt+s7GIZAgO/5a0i/oc=;
        b=Zrh3HOUSnh9X3Mi06r+O5wAyrlxTqvX5qejNnuGMcNOFYuLVNOIOAC2v+LOATfid8F
         P690xyYFui6ZS2y7b3qViATLMWtyxnUh/tjwOgGJjuR4kZudjTn7RZJsIv0QwULQgPt0
         Fm4Om5hynBeBioGll3q7l9lCrLOHX6vIMs25iLAfC4rEfqsGWxaQSUabWqTqVhAFNkar
         CBU9YImOSVPHgVHQ4KBS3WvGc+N6kK5Xj+S3I6EDUCvvxkIwnijbjaAy39Tw6DfMVOn5
         pOF66nan/wpxv60KDDiGRvm+Ua5CvelAr3sl5CRQmKcx5nrYCSOT4iGOx6bGYbYk6c7r
         lKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869683; x=1751474483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDCKEZvvy/u8mP8K+Ymdr+bMEt+s7GIZAgO/5a0i/oc=;
        b=V6rTzzR/0jncqFl+dQPMkDm/CqBJeUdJsgjnpyi3N6OSpp5/x3NOXGFwHRjre3l/pH
         TAOd1JuMtLFfuBANFVDIUhOA6OPH15QgS7IBtiDIN2fOFd/ils4jdyEKx0uc4n1EZIAV
         yQq+V+9ADJAYIk42ywZI8zubmGe4DvlnvUNxLN8Z0SpC/lLdSyEuhhQWh4q6sXQ/kMcI
         FT5aoSUF50Dz8ROQVrEs3AANwi8jNhqB1i6DT27Lfq6fruUJAs+gX7rpHdJ1lPMnS6Sk
         VMxlq4bjLRPNARodOlAahkH443F5ur1wYIgPoOUDDJbK510Umrv7egSRgM7OIcNMoLH/
         RvIw==
X-Forwarded-Encrypted: i=1; AJvYcCUv9RwRdhK3TUyUR+R6HHa+8pEEC/f+RZLips9DM67sUhXY3NXb8XXtULyeLiNVij3O9VvwE6G7VWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNzkcFMyx4DsrXzEZ+kv7dH06Caw7jicbru4PuDgZ2P64pE25i
	e+ikylJJQAfZRlzw0WohMeGAgn2IBMe36VxuzEcweXs5Fx2WD267xlL+QknKAssMJZE=
X-Gm-Gg: ASbGncu9ROshO1t8HU7g7hu/ZZeYETI80tzYFUlwCGiThwKfJEAvBymGCg/VkZXYDCA
	qQeAF7U35khmThyjY964J/hrSCLsdhfxiw73Z81YYSR02PbSogeXv/VFhZCWPsMN5g/BrJ1sdlZ
	tYJra4tTwevHNkBfrtk3vVYUed34dunwnhdWgQelbkmo5H6g2PfPQLvXBScsYQ1PwLoYp3RjekS
	YJZnt9yLX4rmo7fqtXPbavoZGUYgzIoUH6ltYuEPBft0o45KeByVytzgiFYIrW9zS3I4Y+rEx37
	PFooUoMZF+bcSFSGgYV9/sTW2ETGfPY1F0zfuIEJQXXYKJTx27IqPDE/uhrU0X1Lk8LYwtYi/Mc
	tfTHhiBuXUj5MyDSgdBaV+G/zNs3WwKWz0xQIlgj2Y7K3xw==
X-Google-Smtp-Source: AGHT+IF0qAzBR+5ebXXveqzmLr/2w4QQCNXjecbTJ4SgCA/yOFBNe+rVWxWjr5FO7bLbStXLn3XERQ==
X-Received: by 2002:a05:620a:40cb:b0:7d3:f1ff:5bac with SMTP id af79cd13be357-7d42972ce65mr495536885a.27.1750869683376;
        Wed, 25 Jun 2025 09:41:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:23 -0700 (PDT)
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
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] spacemit: introduce P1 PMIC support
Date: Wed, 25 Jun 2025 11:41:11 -0500
Message-ID: <20250625164119.1068842-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
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

This version primarily updates the RTC code (in patch 4) based on
review feedback.  It also adds adds a dependency in patch 2, to
ensure the MFD_SIMPLE_MFD_I2C dependencies are met when selected.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v4

					-Alex
Between version 3 and version 4:
  - I got confirmation from SpacemiT that the RTC hardware does not
    implement the "latch" of registers as documented, and updated the
    RTC code accordingly (looping on read)
  - The RTC set_time() callback now returns an error value if one is
    reported when a regmap write re-enables the RTC
  - Renamed the RTC Kconfig option to be RTC_DRV_SPACEMIT_P1
  - Renamed the RTC source file be "rtc-spacemit-p1.c"
  - Replaced an RTC enumerated type with simple numeric indices
  - A message is no longer reported when devm_rtc_register_device()
    returns an error in the RTC driver
  - CONFIG_MFD_SPACEMIT_P1 now depends on I2C, to avoid a build error
        
Here is version 3 of this series:
  https://lore.kernel.org/linux-rtc/20250622032941.3768912-2-elder@riscstar.com/

Between version 2 and version 3:
  - Removed "spacemit-pmic.c" and updated "simple-mfd-i2c.c" instead
  - Added an RTC driver, so that the MFD has more than one sub-device
  - Other suggestions were directed at "spacemit-pmic.c"

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Reviewed-by tag from Mark Brown to patch 3
  - Implemented suggestions from Vivian Wang:
      - Fixed a typo in the subject line in patch 1
      - Now use module_i2c_driver() for the PMIC driver in patch 2
      - Added MODULE_ALIAS() for both drivers (patches 2 and 3)
      - Defined and used DRV_NAME in both drivers
      - Added additional Kconfig module help text for both drivers

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 169 ++++++++++++++++++
 12 files changed, 621 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
-- 
2.45.2



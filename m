Return-Path: <linux-rtc+bounces-4385-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67322AEB9AE
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 16:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0B2B7B02D7
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E872E266C;
	Fri, 27 Jun 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hpd5Aoqp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011E2E265B
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034195; cv=none; b=nTkQMFCHMR61tx8B8FdSWqrRLsbWKfd/QC8xxqhZS9Uz8joFNUSogmGIkhOsQ0PyNOdBO9truQcsA5PlsJzef81+deBcB5syATqP++sjhj0OJI9WaZwTt1TxkEobJS5fv9TSGT6rGPD3qFk6otcIheLlpnw6M0RsD0Fuv2HqlHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034195; c=relaxed/simple;
	bh=9jXWU2dNETFNQehlpjPu6e0VDdTp9Tr5HNt485rVJMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=km3/db1w3YcgXkr1kw1N34Izh7trc+TRh1BA3IA19Pl3dziYVvsaC1Ho8m4cv5Awl/ATEriqMNrWkEBFjHGhblsEHOSonooZnYKtk8wLoScsFja0+XvKE4if66hV4KCtr9sZJG5yULmCrg2mnB1SaKo+dS2X/rxd9weHpH1GQdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hpd5Aoqp; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so21108776d6.1
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034192; x=1751638992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xyZq4ZAe7ICNNo6naMBuUx3eFwikmrrS2wObQQXZubE=;
        b=hpd5Aoqp6xpRgJUysGUQe1ljmU0mkz+zGtZpDPyhUY3tW+OgVd8oWYLYCUh2KZuYOj
         oOl53HNtQIZgfa5+xda9sCrnhtCTOrSnX0FIOIXDtaX7o/A2gyyz+vuaUdYN4/c649PS
         sORznL1jFslAp4ioyTe3GR/pOW5iBlmuNuXXpZB6JjHgX4hd67HJVQ7McYMOgoTkqzz/
         /rQJbTx8xW//+3rtjBlit1xEY8kofsGAW81NkVzl7JoeSPsKE09/9ec0D91LXBOZ5DOA
         GxhtWOEs7czvonLpjX2p92axBOTsZ3fHg8paqR76el8g2p5hvaWr4vtTJzSDjaKpOZ2x
         rbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034192; x=1751638992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyZq4ZAe7ICNNo6naMBuUx3eFwikmrrS2wObQQXZubE=;
        b=JVj3UBW7fNrwJJcsLBHRyqMBKWCbs0buW0h28nxRpLGcHzacDjCNvKS8+N3c5zGRPV
         tYmYTN4YBUz6/ZfIZhDoMFpy7Jnz2bRbyBITQpYeTpqMjv10f04KtdSNtQLsdwjy++UR
         8vqubdNx0OnDRmoggoFPW+PVAGHzH0/Rh++pK09YmY6sREXqoAbS3+kLAwS87jnvkedf
         FeHIqQvP5gnOUVAJ6OZSKO8JJbtdFAvb7VjnzMtX7YmQip6q36qLr8x22HcIdYsq7h+M
         VdemYvnwN7g59Xe+yj5Jd5BG0P2IjEI/KBzsS3F21e2XNArSkVlsppmFLODhdnIiFHnR
         JHuw==
X-Forwarded-Encrypted: i=1; AJvYcCXaPi33xjtvweEWTWBMwD3ywUmLtuXHjQ14ea114p2mB/Ew5xYHhOF3a79GYDguVyP200kO1NbQK/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjoZDSbKifBxMGuLw8JbHmEGiv1pkrVBFmgHAQ/nGHe8zW3UNP
	ATO/DY++VbpUxiV3jMpIzPmdy5AnznA0p5tF9ulKWJDGcce123X8ETYzsIA9iIOMVyw=
X-Gm-Gg: ASbGnctQaAy1QKMM9GfyX2v7XXc8Lft6x95rDXagIA7qblmZSUyOgWI3QpgXCrzJFT2
	4WVLLJ2S287w69PwfsQJBG+lpNG8DNMPHXv8Ir0pJxHz2rjDK0vwOIB7QnEyAZP2pTNL15P6jyN
	mRSP2YAITQLk5yYZbt00LQ+M21HaBJoxMs9hyb/tOffUMbEtLaO4wMWh5y8Vo6fXHSyDkKbSti0
	vADaUDipPmZ8WotNLMYMi391Tt5GCb9YRj0pShEkWzHNGodk53oggVgPEVdr2zNQYRisyEatXRe
	D5VWCsGixWwL7YflQsuVJlO2uIqpvTk+2P30LjTPBX+KXoDXYw23gORj2lhEgr7OZVxrjJgvE4S
	0q6hINvsxfaP4woVEbOcvB1PEtpoJHym/DpU=
X-Google-Smtp-Source: AGHT+IHDtikB0oMUAvmWbAoxLBUqg4pB9xk/P6eVhjckLobTee+bJmH7aBt6iZAeNjzgw6e4ZS5Fcg==
X-Received: by 2002:a05:6214:2e43:b0:6fb:6114:1034 with SMTP id 6a1803df08f44-700131c4812mr68071916d6.39.1751034192321;
        Fri, 27 Jun 2025 07:23:12 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:11 -0700 (PDT)
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
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] spacemit: introduce P1 PMIC support
Date: Fri, 27 Jun 2025 09:22:59 -0500
Message-ID: <20250627142309.1444135-1-elder@riscstar.com>
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

This version adds a new patch to change the simple MFD driver as
suggested by Lee Jones.  Rather than specifying a full regmap config
for each simple MFD, specify the max_register value desired in the
simple_mfd_data structure.  That supports all existing devices (which
don't use the regmap_config option), as well as the SpacemiT P1
(which specifies the max_register).

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v6

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
 drivers/mfd/simple-mfd-i2c.c                  |  30 ++--
 drivers/mfd/simple-mfd-i2c.h                  |   2 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 620 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 2aeda9592360c200085898a258c4754bfe879921
-- 
2.45.2



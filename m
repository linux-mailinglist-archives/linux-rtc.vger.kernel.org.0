Return-Path: <linux-rtc+bounces-4413-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E98AF641C
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 23:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3DF41C45BC9
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 21:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2367243964;
	Wed,  2 Jul 2025 21:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TxhdGMI5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87223ABB6
	for <linux-rtc@vger.kernel.org>; Wed,  2 Jul 2025 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492226; cv=none; b=V6biMfar0Jo3p5pf5RO/1Dfu0SEqQvPuJ6OcMZVqifOQIxvAZloFg3Bdz5BsZOOBmXM83/Hx+dRC+SlrWCBzxQQs3ukqXzcpwlwuEiNydWyJnVVtbjcOM+EqqVOQtlCR2bKrHffw9qFGqN0bZdGULND0yly4xKcPVKZwGf0X/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492226; c=relaxed/simple;
	bh=9zyhz4ntHJdI/jrj1j/VNTF3enbDJI0+6GNjK+mitZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKVuSjWrHOmUbq/VpTMU8fSHn5IDjvxTTu6uP0r5OQMP7fTtRw5uvl0h/vqtTk/mE4/nkWGvUPW28jwniG+MB7P8i2Skh9XUp+EiQa7NYhEKjNrGRTzGYtvwDMi/SZYm2MPB1WdQ2eSvYzjC0LFCoFtzFq7/GUAbQyZz1l/K6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TxhdGMI5; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fb0eb0f0fbso4509696d6.1
        for <linux-rtc@vger.kernel.org>; Wed, 02 Jul 2025 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492224; x=1752097024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCk4qTQ1xZrDDch6I+2pDpmgEt4recKLbuT/8JykNnk=;
        b=TxhdGMI5SA5WoOuL29Bg4AAlAotQznRWw/HxOybxM+P3WtbiJwnq9FJNF9T3YYKaEx
         qcK6vcU2Hwx7Qth2KaO4t/TC0MJB1sTZdTfJz70q8jZ5zYwCSQpOjsdCTvOYdF+M7wdf
         mNjzLTZ3pJu3lHe8f1v4OKNa2Ss4scIlZO8kNosJd/fMA1dSgTrqou4GbvugG3t1oXQW
         BA6TXlUXlkMvcMSTIggB/T1i7xgfhGXOCUMMaTlm3DfY2xIu/W9AJM4yurBWGmay1LAE
         4n2CtHPuGt4Oeo7wujteUdLaByK8MZ0AswD16E9JnVJ/X6VK/iLjTcToZx37TuUPjPqE
         Ed1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492224; x=1752097024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCk4qTQ1xZrDDch6I+2pDpmgEt4recKLbuT/8JykNnk=;
        b=FFtZkUmOxDQFSFaP2tPyDvFSgUbkxOoEcAcfuEaMRXjX00xIi84ZtS6TFK3AmT/FVo
         9MQJl4PmLR0+Yi6F2kOq6ookr1F0bLvG2oijqkmCAfPVO2weSoQ6bZBOYz1w0Cde6v/z
         1npTYg8QrvBy0ODuKSAQP1CdZQPestzaoVs+lRHki53eJjAtMMiFSIJ25CL6r1PkhpvB
         qy2TCTiL4NJwrjr3HyFW6P2iA+g74T5LLIiD+bQkdc/pMn+se0HbAFNx5suRuKEaXPFP
         3qXTjxREE8lp1LhNnV4kS/ONE+PUN04C7t0APlcNq8dYzZK8DP8MjodjqhRd26trDqSX
         6QCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUFozto2MtewptkTJdnUA5OmSHwGCvTvnDW6nJbS6uTllgtu290ZuFjRdix3SaJ0uW+8dCchqUeGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbRGmBfYPH0D90V5zur5qHEFUrNhk0ui0JRDWNW5pHpsAp74rp
	5AO4gmMjsPFV9vhCSyUN6PiVMH6yEv7P9V1QcxoBGJXuKA80UeQuintCZZ4p10tVtKg=
X-Gm-Gg: ASbGncuZ4wfkUyRfHz1K8E6YOkTiZuuMkKd3UhCqWVM1MJQyuoCD5ZUSy2nPc+COXs1
	OwbhoF2n1zFKPhZkGQl0KtCKYp5UGWKqs0u+GjS9p1LSVdT/AGbzzgolQ0x5ziNd4tjqnFna1Xd
	X3HSCfsO4KLYQz7NlDbLgcxQPSaJFinA4Em2G47U0tmPha1xPSOPakkfmr6ohmazcbMNcTQzmaV
	FC+yjffe4IGWOs3DCCEIhl96FIvLrHanHlPaAAZl1z3MFZ+2VxB3wk5/+bnXtDK//91m2x6dteX
	mYHgSC7yeSy5EKyfS5daGE87f0yd8W8Opc5CQfT+gvE25rLCurOVTjx8SKFO1Y2d0DPpoNsCbAT
	WqFH2BhzcWo0ZOXNV8vIkHqRLXGL8G3ZNe8g=
X-Google-Smtp-Source: AGHT+IHErTJvMvE1TJ0g2EYv2CvrFgib6KyBFStvjCoRfS+zf5ffaS+AtP1I5+t4S6JkJyQfcGlk2A==
X-Received: by 2002:a05:6214:4107:b0:6fa:fc4b:8ea7 with SMTP id 6a1803df08f44-702bc4a73acmr16126856d6.21.1751492223736;
        Wed, 02 Jul 2025 14:37:03 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:03 -0700 (PDT)
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
Subject: [PATCH v7 0/8] spacemit: introduce P1 PMIC support
Date: Wed,  2 Jul 2025 16:36:49 -0500
Message-ID: <20250702213658.545163-1-elder@riscstar.com>
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

In v6, a new patch was added to change the simple MFD driver to
allow the regmap max_register value in the simple MFD configuration.
However it also removed the option of specifying a "full" regmap
configuration, and that was not what Lee Jones actually wanted.

This version adds the max_register option, but also retains the
ability to supply a full regmap config.  (If both are specified,
the max_register value is ignored.)

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v7

Between version 5 and version 6:
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
 drivers/mfd/simple-mfd-i2c.c                  |  27 ++-
 drivers/mfd/simple-mfd-i2c.h                  |   1 +
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 626 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
-- 
2.45.2



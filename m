Return-Path: <linux-rtc+bounces-4767-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC8B380BE
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4441916B155
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F9034DCD7;
	Wed, 27 Aug 2025 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5Iv5fLZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26561C860B;
	Wed, 27 Aug 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293773; cv=none; b=IEKA/greM3W7qEzaLnHikcrMUR4MTVt8qnRPjSC9l3OGSr+DX96vIPuX5Sw2fSWmzfJiVX6FOi5rjezGDRZ/z1TdQ6rcUF5hoL8hPDyBIrOKRctm+2XSGvSBgZ2yiFYvqEP7WQPsz8+/hqng7OAuqbEai0IyIr9yFGxSyKXMF2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293773; c=relaxed/simple;
	bh=BRAiQU0QVsPGvQQPoR9GAHwaWmPsrjb1BHI7yNFZ8XM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sqOiqnVZuFSNqXUnJawrXRHJdQikLfFLJ3efAWrS1Vw4IbaB5RiSbuEc16t+2DAqD3gWc8wczwIEyz9ctdKD6BDM7CgYQdcR5JfvwjZdjO0sWrH43o4zXrCnKwS2H7JBJIeRnbQ58dV3W0+oa43HeAqlMl3hZZF9VXTPgpSgYlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5Iv5fLZ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7720f23123dso166087b3a.2;
        Wed, 27 Aug 2025 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293771; x=1756898571; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WsykdY4oidUQ2ahSl97Uv13s0w5qEG0f4eM1c++CGE=;
        b=B5Iv5fLZf8c7PRMWelGXFCm9TfBs7IV2ww4L/Y/UR8v2D7Mo5ZjwT2PGa9fDOTknv+
         wyPuhWttbUNdRFWOMRXFnb7SWud2a9tly2xNuHYLU5vekdDlPLZotDiztVNx/woTEMYE
         KLdJ5IvkFndOpB9TYSbMKIkh3YaxOzzb16ZKqH7rVM4y2pv8pSU0VcRfihIUty6dVoGp
         axKkDMMBedDdmvkpxBUP2Dsi5zCsdtiK9vZJciJ8/Sg8E7wVB1BblbgPVOFRy9q7ZbMf
         X4ZE0/+cA0XEWO4yYmztlV7hco06sDac7QF6YiTBZPsC0mdlDOIlaPjR3j56T+itHoa8
         EN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293771; x=1756898571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WsykdY4oidUQ2ahSl97Uv13s0w5qEG0f4eM1c++CGE=;
        b=pKTOx+/N2qixRgnqYbLg9pXJAYSECex5c7+KpgQXI4YOFu9gTd9BXFzp1JxnLMvbaa
         tNkI1Nt36Dw5Ub3iQt0tZLEYvVuwbCcI3JITyBQSnKCUeOiBUAmrpAB27mBUfMfkFmOA
         7JPuseZFbU3bJ7cyJLAXKwAJtkncpGybQdCMn5cfUbOXm1/WZSvK5CjywM6qtEruyIZd
         bvaJ171vsDG090H7kzB73+FpsLEkKmdCQ09T0Of3PoYgMG4YHAcmRX3trWjvoxZoEX+H
         2d0f4XvXWKVmNplpgGH6cPjUiy9Vks3pST1/O3ytJ+1rxzwFejwHr5mTuVkHYoFXYyhb
         tkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV586yYjpqKP9SSs9BefqUInv20P6g6QFdAMbh8vCQo0yuguupeftkBNyGyyZh9D+AHf2TF86+O0Ljuli8=@vger.kernel.org, AJvYcCVcMOOdC40W4E7pUB+mf82DB2xKYFyzZIT4Id3+8jkuFYsdqxkak5CbD3gk8HlmQ7RoKSd7fo6qVVj8Apg=@vger.kernel.org, AJvYcCVs3NTZBqy3Pb+h2upwupfs2BJbIPeoV/xwXAXE0N/9fsi9lM6HRxiPCOJ9MaMQaZP5+PET2LcuEleZ@vger.kernel.org, AJvYcCWQSVNibTdat31gFi7c8VStAwN9oB3Yy//icfdFk4f4vuffZYWYQJPtsa/HWNANebVoIHGPfCGTLxIxhDtg@vger.kernel.org, AJvYcCWzkAtyTQ/8VB3DqjO1cZY9zzqsasqvGyZSp2vTgK6SuyBfdRkuHVdAHy6EyqJJgeFN+czZ0SgSAuJb@vger.kernel.org
X-Gm-Message-State: AOJu0YzyUsJp5AF+FD8Z1ze+Wg+CbEpN1WY5xEiikxv4t4tufPLM6hBP
	In3fZjKv/7YgC8i2y02at5QXB+HX+GrQPOI7apqXrWdsmyGdkgFtQqfV
X-Gm-Gg: ASbGnctEaJs/U47OzkRgUL3zYxbSrNTV4xoTId+DYy7sqbBswQfJRVcpJK3gOWNn8uU
	ad6pbIUPIV43hoRILXvgow0Ki9p05OM7JpnqTQ6nE9XXGrLJoNrhEfC1U5uwMeHQhtUMvrQ9x69
	DiSDWNvvXNOxeoGeNYcprmkJKmdG9MC4lPC0QFyrnnNi74Hqb+1SXAaUJtCzegkdR8jmSCzjSkr
	Uzb8j3YFgMBYAeA77gDR78w/Z2Y485ZTRwFFdN8ukkZFYjAeKEjWCcGDwDC8yAub0OoNtGuoUUY
	s1DrJdTl1jgifWpnMJh45npOX2m3SjTnADboF5HNfhwMFdVdxP0za3mfb/k8ziPqEyhoxNKag/p
	JeN9LAkW1ilLigKuhfnfFj7Uhf+IS9B1tn96CJQG9AxCSYfl3sVA7MEvPdNcGZ0QIoVcx3GrL76
	4HI3937ubzH0+8YDdh
X-Google-Smtp-Source: AGHT+IElvLvJjhBIATwNxcehv3S3PxbMPKCGvTN/sn1Ljet+JleEGuW/z9D2QKJBapZe81dScV+ejg==
X-Received: by 2002:a17:903:380b:b0:240:6ae4:3695 with SMTP id d9443c01a7336-2462ee0cf11mr236066195ad.4.1756293771130;
        Wed, 27 Aug 2025 04:22:51 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:22:50 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Wed, 27 Aug 2025 21:22:34 +1000
Message-Id: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvqrmgC/13MywrCMBCF4VcpszaSpPTmyveQLupk2g6YVjIal
 JJ3NxbcuPwPnG8DocAkcCo2CBRZeF1y2EMBOA/LRIpdbrDaVro1tfIDikclz6ujKKptdGlRm8Z
 phHy6Bxr5tYOXPvfM8ljDe/ej+a4/qvunolFaVY0bayypGk13nvzAtyOuHvqU0gdx1TXurAAAA
 A==
X-Change-ID: 20250816-macsmc-subdevs-87032c017d0c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5218;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=BRAiQU0QVsPGvQQPoR9GAHwaWmPsrjb1BHI7yNFZ8XM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXtXPmfh44oNsI75FYa69a2LmLVpXs22bxyzjG1XfX
 vBIevP6dJSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjARz0eMDH9D9etqFb/Pq/9+
 9NDe/Y7aZluOHnPIYq75E8T69+PBij2MDFukv3kcfiUwLW+ZnY/gx7Ctp0O5mFr+Zn3w470/Rbn
 mDisA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series adds support for the remaining SMC subdevices. These are the
RTC, hwmon, and HID devices. They are being submitted together as the RTC
and hwmon drivers both require changes to the SMC DT schema.

The RTC driver is responsible for getting and setting the system clock,
and requires an NVMEM cell. This series replaces Sven's original RTC driver
submission [1].

The hwmon function is an interesting one. While each Apple Silicon device
exposes pretty similar sets of sensors, these all seem to be paired to
different SMC keys in the firmware interface. This is true even when the
sensors are on the SoC. For example, an M1 MacBook Pro will use different
keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
necessitates describing which keys correspond to which sensors for each
device individually, and populating the hwmon structs at runtime. We do
this with a node in the device tree. This series includes only the keys
for sensors which we know to be common to all devices. The SMC is also
responsible for monitoring and controlling fan speeds on systems with fans,
which we expose via the hwmon driver.

The SMC also handles the hardware power button and lid switch. Power
button presses and lid opening/closing are emitted as HID events, so we
add a HID subdevice to handle them.

Note that this series is based on a branch with three additional commits
applied to add the parent SMC nodes to the relevant Devicetrees. This
was done to silence build errors. The series applies cleanly to 6.17-rc1.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Addressed Guenter's initial feedback on the hwmon driver
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com

---
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (7):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC HID subdevice
      arm64: dts: apple: Add common hwmon sensors and fans
      arm64: dts: apple: t8103, t600x, t8112: Add common hwmon nodes to devices

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 ++++
 .../bindings/mfd/apple,smc.yaml          |  45 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 MAINTAINERS                              |   5 +
 .../boot/dts/apple/hwmon-common.dtsi     |  37 ++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  24 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  19 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  35 +
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  17 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |   6 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   4 +
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |   6 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 .../arm64/boot/dts/apple/t8112-jxxx.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |   6 +
 drivers/hwmon/Kconfig                    |  12 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/macsmc_hwmon.c             | 848 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-hid.c          | 209 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 36 files changed, 1637 insertions(+)
---
base-commit: 876d6a70b24869f96ebc8672caf86cb4bae72927
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>



Return-Path: <linux-rtc+bounces-5312-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 58396C51FEB
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 12:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2E4A4FD300
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 11:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB16A2F2617;
	Wed, 12 Nov 2025 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JH+yqK/w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5101030AD13
	for <linux-rtc@vger.kernel.org>; Wed, 12 Nov 2025 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946258; cv=none; b=kJpDIgKKSO9/tgJnPHGsFprIQnTll9claKDw+QwKAbnGOQi2TXgflVPprI1HUkuDiCgyFfs0bPa+nEqEYfgsFWUyb3r0h/5FJbO7Rcwja1e3yLOVGWD8CeAjxnz31el95iZ0fANRlU/Jel7RYeT+WJUvIUYhJoQvKszwY9EWuWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946258; c=relaxed/simple;
	bh=P0402Uz3TGlHgNTrUFPCtCcxzRvCHZS96bV6+P1WJZE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M9XggAYIAGpJ5K0zBTsdJX1oePXQhPXf+vmj/YR/N8hY5LOL/cQBv2wM+IZBpdJXCNg6KcngAXDAlnZ5QeL0/Sv0BE5jKdHWzGNurTpJU9F3kYHX4Q3BvjDYDw1gJ/fYUoA/n41cRDnqixMlafbqm2FwLPppf3BbqFce+c361Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JH+yqK/w; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2964d616df7so8741415ad.3
        for <linux-rtc@vger.kernel.org>; Wed, 12 Nov 2025 03:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946255; x=1763551055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7clx8dfZg3jZ+tSq2YUEpFAI0n8/M6CLth3qWizbsA=;
        b=JH+yqK/wikni6qDLU1ilwS82iVM8RIQ/LjhfvRgSzxgMl+pibmFh0tSdodCYoveiQM
         NEGr49st7HSShYc1G2omRWfE0+hUfOh50D4U6lfLQmo3ORV45OOrGG4eYBvKLin8q1UU
         53pFtXvGNbFWw9CfGJzICYw4s7Sr5Q1TdQh1fHpr9p/cRTh1/k5l+wCqcplv/tycUePN
         MmfUtZ3FXSvuCof3uiBLvLK3/Pje1m+bIrMPDPr+si/gks+H1Oh+D0Lp4BU1U0FMPgHb
         THwu4XRTpgidoDjRu+yx+Vkg2+Tef1f6utLcn+bhLt2ztXeMFWiquMoISh/zHkKvgeY7
         LhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946255; x=1763551055;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7clx8dfZg3jZ+tSq2YUEpFAI0n8/M6CLth3qWizbsA=;
        b=DZwMlKy47z9p2H3Rq69bnnduYf1Fdz2epWMRHrl3U5j78jp4PNIqO4b3bgMnqqxo2s
         I1Ic/nMSkO8jhffYeQHOIJlRJKuNqP3MvGncvv3dcgqSxlGVl8EQMOyO/cluVCWvc5ZF
         z2yK491lS1sBlHxlAt3Dx0cBuAU+i0v0K4vuylCmRo9+f09XGAJCSamaXPczNYrLqoOs
         uyeOGo8kUXPlwNmu0RuMig5zz/v4L5f0txz7bMuTuT37fsT9ByflADXK8b2kbKAERzXR
         Lw/FrIWuoiXuOk8sxJ0mCUj1jMRPyyJEsGPi1su5obmvFVvjaxCs25Mcr7xLWJrZz16R
         yhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnnpLIENrsZISekULbqjo/6oM+S0bYJGMbt8dmlW6PalZSkyCTSHVygdg/vi8UCuNsBVZzIEdR1J8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNbEZKBueFGiFco2mA/OCGoeaq2nRUTfmz6ljWAiUEeiLaRFs
	6Tfi3GVFPmdc5+6bpHdyKoYSg7YqMKW4OL98yMBNcXlDEKfT+WyPpWgA
X-Gm-Gg: ASbGncsU0xwv30ZVLhmxu19QTVui4y9bVgytYuw1mcOk2Ak1faJhMF4kxW24w+SLdSM
	OKjg67erX5lD6hsOiVJ5ZYZYxUH1LCQz8ohiXCG4XfV49Mt129AyMfORjCC+muPHtzw17mEx2NK
	hIZaB98Y5GgcEPIxgLjq7cdynz2HEYLx2fuRYI2hORqR7QqEoIaR0lAacOZh/c4ucMauTT2hkY4
	+tDIIt5u+3BO7UhCsRIlPnOAFe44EWIJr3NFbesWAhtUpRrOkqPToOLxkwPMaGYRNw64Fb1QY1U
	2rvCqp2xj2yQMrmRmijwmP7dkUfmfW5hfEbLACgzeDT3v6KHKoqNj9RhSe5jGabMvbZHEh3xPI9
	pJF8SD91HKFP9dxaD2BszTGrnM0GRhR7eBChyWwBMtiLHOOb9CaxC2KvVWxGhkOZZ+F+lWOmqKh
	CZqekkM3WhHyRJgZQQmV/VgmBlFos2uB4Sd7RQP83XfP4nZkDxNj6FHmlXXqBwoheGrrvdb/VZN
	kmBY78/4F0z4ryONiS22H9yV8cDb3sJJgBqD5+EAp0S1i5KjsLDr7w=
X-Google-Smtp-Source: AGHT+IHVEaLkAKMKOQnX2Yk+k2Hy7v2hitB1DZg/c1k61ch6ePvOS7vJ2UEiP4g6NHx8/2s4uaVz5g==
X-Received: by 2002:a17:902:f684:b0:26a:8171:dafa with SMTP id d9443c01a7336-2984ed49524mr36554305ad.21.1762946254443;
        Wed, 12 Nov 2025 03:17:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:17:34 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v5 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Wed, 12 Nov 2025 21:16:46 +1000
Message-Id: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ5sFGkC/2XMQWrDMBCF4asEraswGlmRlVXuUbqQZ8aJoI6D1
 YqW4LtXCTQYe/kefP9dZZmSZHXc3dUkJeU0XutwbztFl3g9i05ct0JAB6056CFSHkjn746lZN1
 6sEhgPAOpim6T9OnnGXz/qPuS8tc4/T77xTze/1RYp4rRoJ3n/kBWXG/C6TzE9LmncVCPVMEFR
 7/hWDmJkxDYNYTtmtsXNwBbbitnz7br2UcBXPNmwdFteFO59Q07CtJFkCWf5/kPEEC78mkBAAA
 =
X-Change-ID: 20250816-macsmc-subdevs-87032c017d0c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7401;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=P0402Uz3TGlHgNTrUFPCtCcxzRvCHZS96bV6+P1WJZE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOcvqqhaZzQtebHiWL3KbwN0ohsKQ0AcxbxY2tMbfr
 G75FXGoYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNV2Vxn+qWvvmalsuUr7mbkmTxgj94QZj97MYlyuOX3zCsdqccceB4b/hVsc/76
 5fDv6W223y9wp7bkbgv4utvZdu7Thxdsr29omcwMA
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
add an input subdevice to handle them.

Since there are no real dependencies between the components of this series,
it should be fine for each subsystem to take the relevant patches through
their trees. The mfd one-liners should be taken in order to avoid trivial
conflicts. Per [2], the hwmon driver should be merged along with the preceding
mfd patch adding the __SMC_KEY macro to avoid build errors.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t
[2] https://lore.kernel.org/asahi/20251106140050.GQ8064@google.com/

---
Changes in v5:
- Drop inadvertent mfd core includes in rtc and input drivers
- Link to v4: https://lore.kernel.org/r/20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com

Changes in v4:
- Added Rob's R-b to hwmon Devicetree schema
- Added missing include to hwmon driver
- Dropped superfluous dev_info() from hwmon probe
- Added Guenter's A-b to hwmon driver
- Renamed INPUT_MACSMC_INPUT to INPUT_MACSMC
- Dropped leftover mention of HID in input driver
- Reinstated input driver MODULE_ALIAS
- Trigger a hard wakeup on power button/lid switch when coming out of
  s2idle
- Suppress KEY_POWER event on wakeup to prevent an immediate shutdown
  when waking up
- Squashed hwmon Devicetree commits into one
- Link to v3: https://lore.kernel.org/r/20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com

Changes in v3:
- Renamed macsmc-hid to macsmc-input
- Switched to pm_wakeup_event in macsmc-input
- macsmc-input now configures its capabilities before registering the device
- Renamed macsmc_hwmon to macsmc-hwmon
- Dropped module aliases in macsmc-input and macsmc_hwmon
- Introduced new SMC FourCC macro to silence GCC errors
- Condensed hwmon binding using $defs
- Made label property optional for hwmon sensors
- Fixed incorrect hwmon is_visible implementation
- Dropped 64-bit math from SMC float ops
- Fixed incorrect use of error numbers in hwmon driver
- Replaced a number of non-fatal dev_errs with dev_dbgs in hwmon driver
- Added hwmon driver documentation
- Added hwmon subdevice directly to the DT SMC node
- Included "common" hwmon sensors in SoC .dtsi files
- Fixed typo in hwmon-common.dtsi
- Added Neal's R-b to series
- Added required nodes to t602x Devicetrees
- Link to v2: https://lore.kernel.org/r/20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com

Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Removed log messages sysfs read/write functions in hwmon driver
- Removed ignored errors from hwmon driver
- Removed uses of dev_err for non-errors in hwmon driver
- Made it more obvious that a number of hwmon fan properties are optional
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com

---
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-input: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (7):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      mfd: macsmc: Add new __SMC_KEY macro
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC input subdevice
      arm64: dts: apple: t8103, t8112, t60xx: Add hwmon SMC subdevice

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  |  86 +++
 .../bindings/mfd/apple,smc.yaml          |  45 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 Documentation/hwmon/macsmc-hwmon.rst     |  71 +++
 MAINTAINERS                              |   6 +
 .../boot/dts/apple/hwmon-common.dtsi     |  33 +
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  22 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  17 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  33 +
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  15 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 arch/arm64/boot/dts/apple/t6001.dtsi     |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |  10 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   3 +
 .../arm64/boot/dts/apple/t602x-die0.dtsi |  10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |  11 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |  11 +
 drivers/hwmon/Kconfig                    |  12 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/macsmc-hwmon.c             | 851 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-input.c        | 207 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 140 ++++
 include/linux/mfd/macsmc.h               |   1 +
 37 files changed, 1671 insertions(+)
---
base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>



Return-Path: <linux-rtc+bounces-3726-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C84A79ED7
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 237C916CA7B
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC16B242913;
	Thu,  3 Apr 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wWFGaMMT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B90241C8C
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670742; cv=none; b=ep2owpkcg/R1LvtLBoy7oZcc6BYbQ3s+HSS7qp1b/wQ4/WNbDkOYVnwGx1Edqujubsq7URvTAU94obfEaZemB5LvQlkVNJ4Iek/Il1bIDRFxqSBlRut1ZDeN3vpRwHIo1h4u+FJ6Bw9HEuFr/zWImDTD9lpWlzsD8L8Fx6VvvVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670742; c=relaxed/simple;
	bh=9YIl0Ri7MGJi7xiDDdu1R4iy16Dhc3dSJ/+St09TRdA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MMLSO66xsMtFKV2QnxAw3RbADAfCgvZDBtoewXOt4Bwe2ndTzd+ebz/whTQnDjoJb0JBvc2P4ggi0VHI8ymBrH3mGorsrkC/Aw6LnJM/8XDCVx/ZesVI+9M8faEVpdApwymrwM2gXJ/Z0ATie8yppmfiZbiQ01+pabPUdlnd6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wWFGaMMT; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so1282557a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670738; x=1744275538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qeT474o+P1WLytoJHvSVOFMjU1o1C8S5UpX9/onC+/Y=;
        b=wWFGaMMTSDdIaYVXWUCnroeTnZ6pErge3BcYTNlZB/0wxRtvaaVaiMUg4S5Q2R75AZ
         mjU6S2mjnhCmLbolEd4M7ys36/jac1XxQ8R0RIWhOCVkHIYr7v6WMcI8zBRLBMFAnaon
         srgbl/1suQ3ckkzHUcFEVqQbU+yW/7Z6L7QbEOucxHwwupjKR5E3NQVUA+4egcSxlv17
         Beffx/E5Ex4zyJQ9d0WRUd10wPstWC59lwV0v7WboHMWwWUnRoIbUvCkJ3F/e1ysDs0y
         7wrUesHS6AVpKnHgSErC/Y4Fe21kzeSUb1F5NfZk6Dkk0FlzKMVbaCj40yUXTJNug9jH
         i7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670738; x=1744275538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeT474o+P1WLytoJHvSVOFMjU1o1C8S5UpX9/onC+/Y=;
        b=IUeiWBEdNqPeA5aQc2hI5u1jAbJNaST/G4Ezav8+iHkWM3yTUNA27Q0IBhWoiVraXe
         epgvzA4SyRhZ7Wyd4X7qkhO15IxEwL7l5OZXbC0caPBvxJtEjYGXq0UFcCzBdjF7g09s
         ZAKbWOH3dhGtnDJHmL3AJQmsOWwbXoPXSlWoEz9RmPI5JgF9GLOPbVC6avG7hQIKFGMn
         x4+AnlNR70GKu6qncAvJpSBPKzmq7CRu6jeOJzc9tgn7Y1KPCGgkk6FeJn8Ijj3MD5Z9
         1dUYtXhim3vR0gNzPjBinockWkUUY9knNmcZDFrJSK0tBJz6PHkfJGDF6XkOfFiYZElD
         V9sg==
X-Forwarded-Encrypted: i=1; AJvYcCVeWWvgEvOt/T23Y42kYq/EQpeEN1cHfVG5jt7uGxse07nfBeUt7pHQlwvl+KklWgfh9+62GQ0Yt1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/iT8niHnABC7/v8xmKApGSDxyalIw85bIreAI2FRY853Z41nQ
	KTECRi14bCrNQegxwAFbeMr0qCQWuhc+iJRTzvQpQF4FWerNsDWeuJhf7ED2V8w=
X-Gm-Gg: ASbGncvR4duWF4Lyi3J9+wwPBmBj/9wSR+Ly29DmgaMtodOqdBzzln0Opq423CJjH53
	Nivbr1z52wNpePCctYM++hnKpP7DKtNvTfv2P5Yabv/3FAa16jABi9YWgH4HfF7btODS9K+s2aW
	4f4vrvi2ENXAK2Ln+B0N3OsMLnPS0hbnH+Rb1NQHmzyxxUO319kU8otJ1hXIfOFXvxv+wNojdiT
	n1+kuwiXgE7alVpc/P6aGq/cfKHgIVcVPxr1S80+wM6pSWt4Vma6IgOtzrUs+LqVWN16NA4lHks
	R9aYlGxQyDFq90zYld0XSRktZo70fzsLkn9jcrQw/jPtTBhbFN5PaEf04gZ6AUJ9eANuABwiyna
	sElYd9aAU9KATWG230v1H5j75ReAx
X-Google-Smtp-Source: AGHT+IFcqnBTtWNtxVdQnxCbmWWWf9RXOD/EtzwnHUDSkLa3WrzSs3GfyFiYhJY/Wa5602oPG/K0KQ==
X-Received: by 2002:a05:6402:27d4:b0:5e7:c782:ba94 with SMTP id 4fb4d7f45d1cf-5f0931f76dcmr1184582a12.13.1743670738358;
        Thu, 03 Apr 2025 01:58:58 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:58:57 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Date: Thu, 03 Apr 2025 09:58:52 +0100
Message-Id: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM1N7mcC/1WMyw6CMBBFf4V0bc20UwRd+R/GBbUDTKKUtKbRE
 P7dQuJreW7uOZOIFJiiOBSTCJQ4sh8y4KYQl74ZOpLsMgsNugTUSkZ9GzsFktrSKbIOwaDI7zF
 Qy4+1dDpn7jnefXiu4aSW9d3ATyMpCdJBvTdYga6gOl55aILf+tCJJZL0r1h/RZ1FWxpHhNjan
 f0T53l+AWNqK8/YAAAA
X-Change-ID: 20250321-s2mpg10-ef5d1ebd3043
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

This series adds initial support for the Samsung S2MPG10 PMIC using the
MFD framework. This is a PMIC for mobile applications and is used on
the Google Pixel 6 and 6 Pro (oriole / raven).

*** dependency note ***

To compile, this depends on the Samsung ACPM driver in Linux next with
the following additional patches:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/

*** dependency note end ***

+++ Kconfig update +++

There is a Kconfig symbol update in this series, because the existing
Samsung S2M driver has been split into core and transport (I2C & ACPM)
parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.

This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
talk via I2C, but via the Samsung ACPM firmware.

+++ Kconfig update end +++

This series must be applied in-order, due to interdependencies of some
of the patches. There are also various cleanup patches to the S2M
drivers. I've kept them ordered as:
  * DT bindings (patches 1 ... 3)
  * s2m mfd prep for adding S2MPG10 support (patches 4 ... 7)
  * split S2M mfd driver into s2m-core and s2m-i2c, including the
    kconfig symbol update (patch 8)
  * S2MPG10 core driver (patch 9)
  * s2m mfd driver cleanup patches (patches 10 ... 23)
  * S2MPG10 clock driver (patch 24)
  * s2m RTC prep for adding S2MPG10 (patch 25 ... 26)
  * S2MPG10 RTC driver (patch 27)
  * s2m RTC cleanup patches (patches 28 ... 31)

I realise these are many, but since some prep-work was required to be
able to add S2MPG anyway, I wanted to get the cleanup patches in as
well :-) Let me know if I should postpone them to a later date instead.

The S2MPG10 includes buck converters, various LDOs, power meters, RTC,
clock outputs, and additional GPIOs interfaces.

This series adds support in the top-level device driver, and for the
RTC and clock. Importantly, having the RTC driver allows to do a proper
reset of the system. Drivers or driver updates for the other components
will be added in future patches.

This will need a DT update for Oriole / Raven to enable this device. I
will send that out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- Krzysztof:
  - keep 'regulators' subnode required even for s2mpg10
  - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
    'additionalProperties' instead
  - add some regulators to examples since s2mpg10 requires them as of
    v3
- sec-acpm:
  - use an enum for struct sec_acpm_bus_context::type
  - consistent name space for all functions sec_pmic_acpm_... to be
    similar to i2c and consistent in this file
- Link to v2: https://lore.kernel.org/r/20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org

Changes in v2:
- Rob:
  - make PMIC node a child of ACPM, and all related changes (binding,
    driver)
- Krzysztof:
  - merge defconfig updates into patch changing the symbols (patch 8)
  - split MODULE_AUTHOR update into a separate patch
  - better alignment fix (patch 11)
  - merge two s2dos05/s2mpu05 related patches into one (patch 14)
- myself:
  - keep PMIC DT parsing in core, not in transport driver
  - several updates in sec-acpm.c, see separate entries in patch 9
  - fix typo in patch 17
  - collect tags
- Link to v1: https://lore.kernel.org/r/20250323-s2mpg10-v1-0-d08943702707@linaro.org

---
André Draszik (32):
      dt-bindings: mfd: samsung,s2mps11: add s2mpg10
      dt-bindings: clock: samsung,s2mps11: add s2mpg10
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      mfd: sec: drop non-existing forward declarations
      mfd: sec: sort includes alphabetically
      mfd: sec: update includes to add missing and remove superfluous ones
      mfd: sec: move private internal API to internal header
      mfd: sec: split into core and transport (i2c) drivers
      mfd: sec: add support for S2MPG10 PMIC
      mfd: sec: merge separate core and irq modules
      mfd: sec: fix open parenthesis alignment (multiple)
      mfd: sec: sort struct of_device_id entries and the device type switch
      mfd: sec: use dev_err_probe() where appropriate
      mfd: sec: s2dos05/s2mpu05: use explicit regmap config and drop default
      mfd: sec: s2dos05: doesn't support interrupts (it seems)
      mfd: sec: don't ignore errors from sec_irq_init()
      mfd: sec: rework platform data and regmap instantiating
      mfd: sec: change device_type to int
      mfd: sec: don't compare against NULL / 0 for errors, use !
      mfd: sec: use sizeof(*var), not sizeof(struct type_of_var)
      mfd: sec: convert to using MFD_CELL macros
      mfd: sec: convert to using REGMAP_IRQ_REG() macros
      mfd: sec: add myself as module author
      clk: s2mps11: add support for S2MPG10 PMIC clock
      rtc: s5m: cache value of platform_get_device_id() during probe
      rtc: s5m: prepare for external regmap
      rtc: s5m: add support for S2MPG10 RTC
      rtc: s5m: fix a typo: peding -> pending
      rtc: s5m: switch to devm_device_init_wakeup
      rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
      rtc: s5m: replace open-coded read/modify/write registers with regmap helpers
      MAINTAINERS: add myself as reviewer for Samsung S2M MFD

 .../devicetree/bindings/clock/samsung,s2mps11.yaml |   1 +
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  35 ++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  26 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/configs/exynos_defconfig                  |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/pxa_defconfig                     |   2 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/clk/clk-s2mps11.c                          |   8 +
 drivers/mfd/Kconfig                                |  35 +-
 drivers/mfd/Makefile                               |   5 +-
 drivers/mfd/sec-acpm.c                             | 465 ++++++++++++++++++++
 drivers/mfd/sec-common.c                           | 301 +++++++++++++
 drivers/mfd/sec-core.c                             | 481 ---------------------
 drivers/mfd/sec-core.h                             |  23 +
 drivers/mfd/sec-i2c.c                              | 239 ++++++++++
 drivers/mfd/sec-irq.c                              | 460 +++++++-------------
 drivers/rtc/rtc-s5m.c                              | 197 ++++++---
 include/linux/mfd/samsung/core.h                   |   7 +-
 include/linux/mfd/samsung/irq.h                    | 103 +++++
 include/linux/mfd/samsung/rtc.h                    |  37 ++
 include/linux/mfd/samsung/s2mpg10.h                | 454 +++++++++++++++++++
 22 files changed, 2024 insertions(+), 864 deletions(-)
---
base-commit: f58dd835f82a5dda6c9d3895ee6f15016431fb1f
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>



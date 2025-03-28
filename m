Return-Path: <linux-rtc+bounces-3667-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E009AA74ACF
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CF501B62B2E
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346D349620;
	Fri, 28 Mar 2025 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLFYjRd1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7F192D87
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168657; cv=none; b=VEY/WbY1q4BR9wg0lnyhCndPtDh1OBYXDP3P2dzcUSB5n98uczk711GXoEXr5kexmKzt7DL2GGgmFuP4i5avZZciiS9PzeY53GgYEgjFkPOyQ/3NI3BCt6bXfK/1Tdfb0hwbexpb355kq4//1P0hpOKoOlsSUDx62lqhJaWQl9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168657; c=relaxed/simple;
	bh=ej4rCGaeftxK2JXTOtoIQ9rhKbtDvQSJvMSbi3kIDdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iDL7PVXwdXYqzPPMGYHPDisLlXD8P9VjSDCZTiD0tQequ12mINqSd8NFN2WNrdYfCjEJNwjAmkYaDFJBRk6o9GRbJ/tNz2Ezm8p/SZzFwh4jFnFge10AGbaCksq+U+eISSgfpgmif0956NVKYVQI7mJrglSSOeO17/yjy5RaTk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLFYjRd1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so280383566b.0
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168653; x=1743773453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRvLbiHiKLkWNaqlgJsovX/nYtjDcjC8MqvumdDWmcw=;
        b=pLFYjRd1jeH8a30Ico34ct7vhyh8RSJ+fWxUF6uUaOMu40FQe8c2cYA+to4rM54mWL
         LQNPjgy5nQpxSd4orBv/Tli3Il/rXxv/9/t0wzUJThtHia8gom2XNbbAGv36BQPQ8SRN
         pt7Juo4RYjCgiccGMhEWIRq0KMETJYz9zQx2ccyRiWj9kLfT8Z2NegxSJnuaMDoyEav0
         eoX9AHXMoacZxgWsjUwd0CXlczOmKVucy0xHoA43bDLKvK/PTBJLlsDGufH4R0kyZxWO
         BOFr5lBQ3cGJdJ4yW1EGCCpndpFJS2FuyiDGdm7I7cKAoR/qOSQdt+aB8CcB0Wv9+Fat
         qmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168653; x=1743773453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRvLbiHiKLkWNaqlgJsovX/nYtjDcjC8MqvumdDWmcw=;
        b=Emzw5syDE3wBG1kNi08AcI+bU9DCHDQQNxQNvLdiVKMvhFRPa6sBWHp9Bx45DQwnLM
         +50tFTeM8XJLDcerx1VZApGgImqF4kws5v4BrhGKnnCmiMNVA60jj5UXEhH3P47Cw/qq
         N+JdBpGCpu+rsT89cA/xXJQqQ4RBLTroO+i7FoPfqvWYOimdX06ZJ3RPxeI84gpm7/HL
         PUtijIcTTcaSGmxRIZFkq4PWdzPimew3iJG6AhmxLUjkxB/YbEMVTK3AyC5+uyWX0DSU
         uo3yAymbl0g3sPVEFXlvzymshmSBPwaIrCXcA0SC/VWYvvwt2x8SfpKBjxc7E+e1eADu
         qRIA==
X-Forwarded-Encrypted: i=1; AJvYcCXsyxLong03CzUhm1dJSikCBe0ZEBxxGZQoSMj8Nino+279rp3qyGl69/xuyoOEkRGWaHdoqoleTLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7srahvEJphgFECkvivRSD037VWzFSeaHr66c4LBYf0vWBE0QZ
	XXVNJUHZCjvnJUb2xwgEyn9bdSdCQkZZaqL3RHHN1gkAA3WATvgZa+O0eQFn4X8=
X-Gm-Gg: ASbGncvEJlrjGWrvQ+ijxHFE24z758aEqCU0Kr2Zbn+XihxGRAfzW3uSgxcHKwLjqA8
	CELfYQv1IuR0z7HaR7MAWiNHsFMtxudWdO/I+JJk51rgFCPhLXdI0DL5jY7xgyPuFnYZeukzBzf
	O56z5Yzicxy/bWQnqBT7Y7aVbcvOvNr4WjyM5dUVD1wNgB1aPp8ZlSZEjag4v0Rkarh/P2Sm3aq
	qarQ+uR8nCl6DSYzO+mkva0X47G8tt73muAmcTcSikVTi/44yoUipTTXXFX4lybzCGxxKkPhwnQ
	HpU3HEcssgubZAVbnYXOukbdiQZwPdwlMUgZ1X0evDE3pLFkL42IaZ9FtYfloIWZkWV3fRBJdXD
	nXn6IhWP4q+YsvNJynj7qEgy9Tfxz
X-Google-Smtp-Source: AGHT+IH1+pjt98yfLPdlHXhG5zwY12ogF7yk18zqK8eCDj7Jf469dISQ7xCv0AXw/+mBhRrdep/+WA==
X-Received: by 2002:a17:907:1c07:b0:ac6:ba91:ca4d with SMTP id a640c23a62f3a-ac6faf04aafmr667626866b.31.1743168652788;
        Fri, 28 Mar 2025 06:30:52 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Date: Fri, 28 Mar 2025 13:28:46 +0000
Message-Id: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA+k5mcC/z3MQQrCMBCF4auUWRuZTFqirryHdFHNNB3QpiQSl
 JK7Gwu6/B+Pb4XEUTjBqVkhcpYkYa5BuwZu0zB7VuJqAyF1aEirRI/Fa1Q8dk7z1RlsDdT3Enm
 U1yZd+tqTpGeI7w3O+rv+DPM3slaoHB6OrbFIFu35LvMQwz5ED30p5QPJmoiqnwAAAA==
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
https://lore.kernel.org/all/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org/
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
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  17 +
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  28 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/configs/exynos_defconfig                  |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/pxa_defconfig                     |   2 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/clk/clk-s2mps11.c                          |   8 +
 drivers/mfd/Kconfig                                |  35 +-
 drivers/mfd/Makefile                               |   5 +-
 drivers/mfd/sec-acpm.c                             | 460 ++++++++++++++++++++
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
 22 files changed, 2002 insertions(+), 865 deletions(-)
---
base-commit: f58dd835f82a5dda6c9d3895ee6f15016431fb1f
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>



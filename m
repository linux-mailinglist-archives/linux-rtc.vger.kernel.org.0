Return-Path: <linux-rtc+bounces-1878-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBAF96EF7C
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Sep 2024 11:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23C4D1C24034
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Sep 2024 09:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5818E1C871F;
	Fri,  6 Sep 2024 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=classfun.cn header.i=@classfun.cn header.b="drSg8Fhk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from classfun.cn (unknown [129.204.178.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481241C870B;
	Fri,  6 Sep 2024 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.204.178.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615485; cv=none; b=XWOizhqOdW73iniJP62hXN8uMORcIBEk1kkt8Eayvvm+ZIz3gLQD/tSMDhonKRrslgEJJ0eyKAdFw0oZYhNL7tIiAU4t6hU0ziPAwOND5d93cQH99qL9sUp4VOFROkgBx6ucWs5UePmGqe97WC4phfJ+RlKOrlal2vM0U7hdOu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615485; c=relaxed/simple;
	bh=0cWAEMyIHMK5hKqCiTZBW3Hcb6kQYvI3HtqeHMi2no4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdDCt7uXIqD4QC9/cvrm0Uu8++2BAxM5+GcDt0p6chN0HMS6EuoVNdy3n5+eKQppkyWGj3lvQlYDYmN183ScjcmrCDt9WpquzkgxYEJSbK8cz6ubg8ZM7qTvJ4Ab4dtvWYcOadryVIx+ahX2ZmxOp77g0SQQyLCFWTYSZm/s2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=classfun.cn; spf=pass smtp.mailfrom=classfun.cn; dkim=pass (1024-bit key) header.d=classfun.cn header.i=@classfun.cn header.b=drSg8Fhk; arc=none smtp.client-ip=129.204.178.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=classfun.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=classfun.cn
Received: from bigfoot-server-storage.classfun.cn (unknown [124.72.163.35])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 1447F789FD;
	Fri,  6 Sep 2024 17:37:42 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 1447F789FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1725615473;
	bh=tyBtwkNnhg6jrvb3pwGGUkiw4PdPR9/Ska2BS2U9HwQ=;
	h=From:To:Cc:Subject:Date:From;
	b=drSg8FhkBGDvt0ogiXR5j9FZTpSiNbJJ0Vg4jDlDzlUVLImcJFq6oI7EFl/IyaB6Q
	 UI4/HSsbUgIfntf02tMCCIX6gZHsoPotBcIOKeo2h08l6hD4qIF7a9GNG0udfQ9mGu
	 E1L9SlY3LJFxoFLLIej8DpWdiqUQsUeClziaoHZE=
From: Junhao Xie <bigfoot@classfun.cn>
To: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Junhao Xie <bigfoot@classfun.cn>
Subject: [PATCH 0/9] Introduce Photonicat power management MCU driver
Date: Fri,  6 Sep 2024 17:36:21 +0800
Message-ID: <20240906093630.2428329-1-bigfoot@classfun.cn>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial support for the power management MCU in the Ariaboard Photonicat
This patch series depends on Add support for Ariaboard Photonicat RK3568 [1]

Currently implemented features:
  Implement serial communication protocol with MCU [2].
  Support watchdog in MCU.
  Shutdown by power button and system notifies MCU to power-off.
  Read charger and battery supply voltage and simply calculate capacity.
  Read board temperature sensor.
  Set status of the network status LED.
  Read and set the MCU real-time clock date time.

[1] https://lore.kernel.org/linux-arm-kernel/20240906045706.1004813-1-bigfoot@classfun.cn/
[2] https://photonicat.com/wiki/PMU_Protocol

Junhao Xie (9):
  mfd: Add driver for Photonicat power management MCU
  power: reset: add Photonicat PMU poweroff driver
  watchdog: Add Photonicat PMU watchdog driver
  power: supply: photonicat-supply: Add Photonicat PMU battery and
    charger
  rtc: Add Photonicat PMU real-time clock
  hwmon: Add support for Photonicat PMU board temperature sensor
  leds: add Photonicat PMU LED driver
  dt-bindings: Add documentation for Photonicat PMU
  arm64: dts: rockchip: add Photonicat PMU support for Ariaboard
    Photonicat

 .../hwmon/ariaboard,photonicat-pmu-hwmon.yaml |  40 ++
 .../leds/ariaboard,photonicat-pmu-leds.yaml   |  41 ++
 .../mfd/ariaboard,photonicat-pmu.yaml         | 107 ++++
 .../ariaboard,photonicat-pmu-poweroff.yaml    |  34 ++
 .../ariaboard,photonicat-pmu-supply.yaml      |  55 ++
 .../rtc/ariaboard,photonicat-pmu-rtc.yaml     |  37 ++
 .../ariaboard,photonicat-pmu-watchdog.yaml    |  37 ++
 .../boot/dts/rockchip/rk3568-photonicat.dts   |  43 ++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/photonicat-hwmon.c              | 129 +++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-photonicat.c                |  75 +++
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/photonicat-pmu.c                  | 501 ++++++++++++++++++
 drivers/power/reset/Kconfig                   |  12 +
 drivers/power/reset/Makefile                  |   1 +
 drivers/power/reset/photonicat-poweroff.c     |  95 ++++
 drivers/power/supply/Kconfig                  |  12 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/photonicat-supply.c      | 250 +++++++++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-photonicat.c                  | 190 +++++++
 drivers/watchdog/Kconfig                      |  12 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/photonicat-wdt.c             | 124 +++++
 include/linux/mfd/photonicat-pmu.h            |  86 +++
 30 files changed, 1933 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ariaboard,photonicat-pmu-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ariaboard,photonicat-pmu-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ariaboard,photonicat-pmu.yaml
 create mode 100644 Documentation/devicetree/bindings/power/reset/ariaboard,photonicat-pmu-poweroff.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/ariaboard,photonicat-pmu-supply.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/ariaboard,photonicat-pmu-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/ariaboard,photonicat-pmu-watchdog.yaml
 create mode 100644 drivers/hwmon/photonicat-hwmon.c
 create mode 100644 drivers/leds/leds-photonicat.c
 create mode 100644 drivers/mfd/photonicat-pmu.c
 create mode 100644 drivers/power/reset/photonicat-poweroff.c
 create mode 100644 drivers/power/supply/photonicat-supply.c
 create mode 100644 drivers/rtc/rtc-photonicat.c
 create mode 100644 drivers/watchdog/photonicat-wdt.c
 create mode 100644 include/linux/mfd/photonicat-pmu.h

-- 
2.46.0



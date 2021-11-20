Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B0C457F5B
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Nov 2021 17:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237698AbhKTQJj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 20 Nov 2021 11:09:39 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:38965 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231523AbhKTQJi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 20 Nov 2021 11:09:38 -0500
Received: from [77.244.183.192] (port=64374 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1moSlC-000Dxh-In; Sat, 20 Nov 2021 16:58:38 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-kernel@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 6/9] watchdog: Kconfig: fix help text indentation
Date:   Sat, 20 Nov 2021 16:57:04 +0100
Message-Id: <20211120155707.4019487-7-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211120155707.4019487-1-luca@lucaceresoli.net>
References: <20211120155707.4019487-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some entries indent their help text with 1 tab + 1 space or 1 tab only
instead of 1 tab + 2 spaces. Add the missing spaces.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

---

Changes in v4: none

Changes in v3: none
---
 drivers/watchdog/Kconfig | 48 ++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9d222ba17ec6..a6d97f30325a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -680,10 +680,10 @@ config MAX77620_WATCHDOG
 	depends on MFD_MAX77620 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
-	 This is the driver for the Max77620 watchdog timer.
-	 Say 'Y' here to enable the watchdog timer support for
-	 MAX77620 chips. To compile this driver as a module,
-	 choose M here: the module will be called max77620_wdt.
+	  This is the driver for the Max77620 watchdog timer.
+	  Say 'Y' here to enable the watchdog timer support for
+	  MAX77620 chips. To compile this driver as a module,
+	  choose M here: the module will be called max77620_wdt.
 
 config IMX2_WDT
 	tristate "IMX2+ Watchdog"
@@ -1440,26 +1440,26 @@ config TQMX86_WDT
 	depends on X86
 	select WATCHDOG_CORE
 	help
-	This is the driver for the hardware watchdog timer in the TQMX86 IO
-	controller found on some of their ComExpress Modules.
+	  This is the driver for the hardware watchdog timer in the TQMX86 IO
+	  controller found on some of their ComExpress Modules.
 
-	To compile this driver as a module, choose M here; the module
-	will be called tqmx86_wdt.
+	  To compile this driver as a module, choose M here; the module
+	  will be called tqmx86_wdt.
 
-	Most people will say N.
+	  Most people will say N.
 
 config VIA_WDT
 	tristate "VIA Watchdog Timer"
 	depends on X86 && PCI
 	select WATCHDOG_CORE
 	help
-	This is the driver for the hardware watchdog timer on VIA
-	southbridge chipset CX700, VX800/VX820 or VX855/VX875.
+	  This is the driver for the hardware watchdog timer on VIA
+	  southbridge chipset CX700, VX800/VX820 or VX855/VX875.
 
-	To compile this driver as a module, choose M here; the module
-	will be called via_wdt.
+	  To compile this driver as a module, choose M here; the module
+	  will be called via_wdt.
 
-	Most people will say N.
+	  Most people will say N.
 
 config W83627HF_WDT
 	tristate "Watchdog timer for W83627HF/W83627DHG and compatibles"
@@ -1745,10 +1745,10 @@ config BCM7038_WDT
 	depends on HAS_IOMEM
 	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
 	help
-	 Watchdog driver for the built-in hardware in Broadcom 7038 and
-	 later SoCs used in set-top boxes.  BCM7038 was made public
-	 during the 2004 CES, and since then, many Broadcom chips use this
-	 watchdog block, including some cable modem chips.
+	  Watchdog driver for the built-in hardware in Broadcom 7038 and
+	  later SoCs used in set-top boxes.  BCM7038 was made public
+	  during the 2004 CES, and since then, many Broadcom chips use this
+	  watchdog block, including some cable modem chips.
 
 config IMGPDC_WDT
 	tristate "Imagination Technologies PDC Watchdog Timer"
@@ -2109,12 +2109,12 @@ config KEEMBAY_WATCHDOG
 	depends on ARCH_KEEMBAY || (ARM64 && COMPILE_TEST)
 	select WATCHDOG_CORE
 	help
-	 This option enable support for an In-secure watchdog timer driver for
-	 Intel Keem Bay SoC. This WDT has a 32 bit timer and decrements in every
-	 count unit. An interrupt will be triggered, when the count crosses
-	 the threshold configured in the register.
+	  This option enable support for an In-secure watchdog timer driver for
+	  Intel Keem Bay SoC. This WDT has a 32 bit timer and decrements in every
+	  count unit. An interrupt will be triggered, when the count crosses
+	  the threshold configured in the register.
 
-	 To compile this driver as a module, choose M here: the
-	 module will be called keembay_wdt.
+	  To compile this driver as a module, choose M here: the
+	  module will be called keembay_wdt.
 
 endif # WATCHDOG
-- 
2.25.1


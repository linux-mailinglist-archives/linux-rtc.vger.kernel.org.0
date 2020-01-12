Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5BC13872F
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2020 18:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgALRNx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 12 Jan 2020 12:13:53 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:39566 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732888AbgALRNx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 12 Jan 2020 12:13:53 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id pVDq2100J5USYZQ01VDqDS; Sun, 12 Jan 2020 18:13:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgoA-0008HJ-H5; Sun, 12 Jan 2020 18:13:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgoA-0005nv-Df; Sun, 12 Jan 2020 18:13:50 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Joe Perches <joe@perches.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] rtc: i2c/spi: Avoid inclusion of REGMAP support when not needed
Date:   Sun, 12 Jan 2020 18:13:49 +0100
Message-Id: <20200112171349.22268-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Merely enabling I2C and RTC selects REGMAP_I2C and REGMAP_SPI, even when
no driver needs it.  While the former can be moduler, the latter cannot,
and thus becomes built-in.

Fix this by moving the select statements for REGMAP_I2C and REGMAP_SPI
from the RTC_I2C_AND_SPI helper to the individual drivers that depend on
it.

Note that the comment for RTC_I2C_AND_SPI refers to SND_SOC_I2C_AND_SPI
for more information, but the latter does not select REGMAP_{I2C,SPI}
itself, and defers that to the individual drivers, too.

Fixes: 080481f54ef62121 ("rtc: merge ds3232 and ds3234")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Joe: When merging addresses, scripts/get_maintainer.pl replaces
     Alexandre's authoritative email address from MAINTAINERS by the
     obsolete address in the SoB-line of the commit referred to by the
     Fixes-line.

 drivers/rtc/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index d77515d8382c7a72..738fa071884094d1 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -848,14 +848,14 @@ config RTC_I2C_AND_SPI
 	default m if I2C=m
 	default y if I2C=y
 	default y if SPI_MASTER=y
-	select REGMAP_I2C if I2C
-	select REGMAP_SPI if SPI_MASTER
 
 comment "SPI and I2C RTC drivers"
 
 config RTC_DRV_DS3232
 	tristate "Dallas/Maxim DS3232/DS3234"
 	depends on RTC_I2C_AND_SPI
+	select REGMAP_I2C if I2C
+	select REGMAP_SPI if SPI_MASTER
 	help
 	  If you say yes here you get support for Dallas Semiconductor
 	  DS3232 and DS3234 real-time clock chips. If an interrupt is associated
@@ -875,6 +875,8 @@ config RTC_DRV_DS3232_HWMON
 config RTC_DRV_PCF2127
 	tristate "NXP PCF2127"
 	depends on RTC_I2C_AND_SPI
+	select REGMAP_I2C if I2C
+	select REGMAP_SPI if SPI_MASTER
 	select WATCHDOG_CORE if WATCHDOG
 	help
 	  If you say yes here you get support for the NXP PCF2127/29 RTC
@@ -891,6 +893,8 @@ config RTC_DRV_PCF2127
 config RTC_DRV_RV3029C2
 	tristate "Micro Crystal RV3029/3049"
 	depends on RTC_I2C_AND_SPI
+	select REGMAP_I2C if I2C
+	select REGMAP_SPI if SPI_MASTER
 	help
 	  If you say yes here you get support for the Micro Crystal
 	  RV3029 and RV3049 RTC chips.
-- 
2.17.1


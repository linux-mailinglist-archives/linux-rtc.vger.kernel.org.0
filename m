Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65F3BD66AF
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2019 17:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732046AbfJNP6q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Oct 2019 11:58:46 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:59479 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732045AbfJNP6q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Oct 2019 11:58:46 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 85FCD1BF203;
        Mon, 14 Oct 2019 15:58:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: meson-vrtc: move config option to proper location
Date:   Mon, 14 Oct 2019 17:58:40 +0200
Message-Id: <20191014155840.22554-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The correct location for this option is under platform driver, not i2c
drivers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 7f9fc905851a..f28aee483c55 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -373,17 +373,6 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
-config RTC_DRV_MESON_VRTC
-	tristate "Amlogic Meson Virtual RTC"
-	depends on ARCH_MESON || COMPILE_TEST
-	default m if ARCH_MESON
-	help
-	  If you say yes here you will get support for the
-	  Virtual RTC of Amlogic SoCs.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called rtc-meson-vrtc.
-
 config RTC_DRV_RK808
 	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
 	depends on MFD_RK808
@@ -1360,6 +1349,17 @@ config RTC_DRV_MESON
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-meson".
 
+config RTC_DRV_MESON_VRTC
+	tristate "Amlogic Meson Virtual RTC"
+	depends on ARCH_MESON || COMPILE_TEST
+	default m if ARCH_MESON
+	help
+	  If you say yes here you will get support for the
+	  Virtual RTC of Amlogic SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-meson-vrtc.
+
 config RTC_DRV_OMAP
 	tristate "TI OMAP Real Time Clock"
 	depends on ARCH_OMAP || ARCH_DAVINCI || COMPILE_TEST
-- 
2.21.0


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591D42BC27D
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Nov 2020 23:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgKUWpe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Nov 2020 17:45:34 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:45403 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728541AbgKUWpd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 21 Nov 2020 17:45:33 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8A4A420006;
        Sat, 21 Nov 2020 22:45:31 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc{,_v2}: enable COMPILE_TEST
Date:   Sat, 21 Nov 2020 23:45:29 +0100
Message-Id: <20201121224529.568237-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Extend code coverage for the rtc-mxc and rtc-mxc-v2 drivers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 4d2c5d1f75cc..9341ab15241e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1754,7 +1754,9 @@ config RTC_DRV_LOONGSON1
 
 config RTC_DRV_MXC
 	tristate "Freescale MXC Real Time Clock"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on OF
 	help
 	   If you say yes here you get support for the Freescale MXC
 	   RTC module.
@@ -1764,7 +1766,9 @@ config RTC_DRV_MXC
 
 config RTC_DRV_MXC_V2
 	tristate "Freescale MXC Real Time Clock for i.MX53"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on OF
 	help
 	   If you say yes here you get support for the Freescale MXC
 	   SRTC module in i.MX53 processor.
-- 
2.28.0


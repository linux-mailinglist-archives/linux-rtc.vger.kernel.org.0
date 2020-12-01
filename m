Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A618A2C99EB
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Dec 2020 09:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbgLAIsy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Dec 2020 03:48:54 -0500
Received: from inva021.nxp.com ([92.121.34.21]:59194 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727058AbgLAIsx (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 1 Dec 2020 03:48:53 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F7892008AB;
        Tue,  1 Dec 2020 09:48:07 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B535B2008EA;
        Tue,  1 Dec 2020 09:48:03 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 27DDA40588;
        Tue,  1 Dec 2020 09:39:34 +0100 (CET)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, alexandre.belloni@bootlin.com,
        anson.huang@nxp.com, aisheng.dong@nxp.com
Cc:     linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        linux-rtc@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [PATCH] rtc: pcf2127: clear the flag TSF1 before enabling interrupt generation
Date:   Tue,  1 Dec 2020 16:47:46 +0800
Message-Id: <20201201084746.20135-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

- clear the flag TSF1 before enabling interrupt generation
- properly set flag WD_CD for rtc chips(pcf2129, pca2129)

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/rtc/rtc-pcf2127.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 07a5630ec841..0a45e2512258 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -601,6 +601,10 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
 	 * Note: Countdown timer disabled and not available.
+	 * For pca2129, pcf2129, only bit[7] is for Symbol WD_CD
+	 * of register watchdg_tim_ctl. The bit[6] is labeled
+	 * as T. Bits labeled as T must always be written with
+	 * logic 0.
 	 */
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
 				 PCF2127_BIT_WD_CTL_CD1 |
@@ -608,7 +612,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 				 PCF2127_BIT_WD_CTL_TF1 |
 				 PCF2127_BIT_WD_CTL_TF0,
 				 PCF2127_BIT_WD_CTL_CD1 |
-				 PCF2127_BIT_WD_CTL_CD0 |
+				 has_nvmem ? (PCF2127_BIT_WD_CTL_CD0) : (0) |
 				 PCF2127_BIT_WD_CTL_TF1);
 	if (ret) {
 		dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__);
@@ -659,6 +663,21 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+	/*
+	 * Clear TSF1 field of ctrl1 register to clear interrupt
+	 * before enabling interrupt generation when
+	 * timestamp flag set. Unless the flag TSF1 won't
+	 * be cleared and the interrupt(INT pin) is
+	 * triggered continueously.
+	 */
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
+				 PCF2127_BIT_CTRL1_TSF1,
+				 0);
+	if (ret) {
+		dev_err(dev, "%s:  control and status register 1 (ctrl1) failed, ret = 0x%x\n",
+			__func__, ret);
+		return ret;
+	}
 	/*
 	 * Enable interrupt generation when TSF1 or TSF2 timestamp flags
 	 * are set. Interrupt signal is an open-drain output and can be
-- 
2.17.1


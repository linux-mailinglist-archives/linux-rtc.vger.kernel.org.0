Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2982CB32E
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Dec 2020 04:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgLBDL1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Dec 2020 22:11:27 -0500
Received: from inva021.nxp.com ([92.121.34.21]:49378 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727132AbgLBDL0 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 1 Dec 2020 22:11:26 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2661B200C86;
        Wed,  2 Dec 2020 04:10:40 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B5F2D200C78;
        Wed,  2 Dec 2020 04:10:36 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3559E402C7;
        Wed,  2 Dec 2020 04:10:32 +0100 (CET)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, alexandre.belloni@bootlin.com,
        anson.huang@nxp.com, aisheng.dong@nxp.com
Cc:     linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        linux-rtc@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [v2 1/2] rtc: pcf2127: properly set flag WD_CD for rtc chips(pcf2129, pca2129)
Date:   Wed,  2 Dec 2020 11:18:39 +0800
Message-Id: <20201202031840.15582-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Properly set flag WD_CD for rtc chips(pcf2129, pca2129)

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- set flag WD_CD according to compatible

 drivers/rtc/rtc-pcf2127.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 03c9cb6b0b6e..a5418b657c50 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -620,6 +620,10 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
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
@@ -627,7 +631,8 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 				 PCF2127_BIT_WD_CTL_TF1 |
 				 PCF2127_BIT_WD_CTL_TF0,
 				 PCF2127_BIT_WD_CTL_CD1 |
-				 PCF2127_BIT_WD_CTL_CD0 |
+				 (device_property_match_string(dev, "compatible", "nxp,pcf2127")
+				  ? (PCF2127_BIT_WD_CTL_CD0) : (0)) |
 				 PCF2127_BIT_WD_CTL_TF1);
 	if (ret) {
 		dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__);
-- 
2.17.1


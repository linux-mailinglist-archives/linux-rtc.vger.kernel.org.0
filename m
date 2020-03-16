Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B87331868F5
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2020 11:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbgCPK1L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Mar 2020 06:27:11 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:58729 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730550AbgCPK1L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Mar 2020 06:27:11 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id EF11B100050;
        Mon, 16 Mar 2020 10:25:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: 88pm860x: remove platform data support
Date:   Mon, 16 Mar 2020 11:25:37 +0100
Message-Id: <20200316102537.180398-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There is no users of the rtc platform data left, remove its support.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-88pm860x.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index 88bda3e072d8..12d75d717730 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -267,18 +267,15 @@ static int pm860x_rtc_dt_init(struct platform_device *pdev,
 	return 0;
 }
 #else
-#define pm860x_rtc_dt_init(x, y)	(-1)
+#define pm860x_rtc_dt_init(x, y)	do { } while (0)
 #endif
 
 static int pm860x_rtc_probe(struct platform_device *pdev)
 {
 	struct pm860x_chip *chip = dev_get_drvdata(pdev->dev.parent);
-	struct pm860x_rtc_pdata *pdata = NULL;
 	struct pm860x_rtc_info *info;
 	int ret;
 
-	pdata = dev_get_platdata(&pdev->dev);
-
 	info = devm_kzalloc(&pdev->dev, sizeof(struct pm860x_rtc_info),
 			    GFP_KERNEL);
 	if (!info)
@@ -328,12 +325,6 @@ static int pm860x_rtc_probe(struct platform_device *pdev)
 
 #ifdef VRTC_CALIBRATION
 	/* <00> -- 2.7V, <01> -- 2.9V, <10> -- 3.1V, <11> -- 3.3V */
-	if (pm860x_rtc_dt_init(pdev, info)) {
-		if (pdata && pdata->vrtc)
-			info->vrtc = pdata->vrtc & 0x3;
-		else
-			info->vrtc = 1;
-	}
 	pm860x_set_bits(info->i2c, PM8607_MEAS_EN2, MEAS2_VRTC, MEAS2_VRTC);
 
 	/* calibrate VRTC */
-- 
2.24.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B40E17B415
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 02:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCFB5K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 20:57:10 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:43523 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgCFB5K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 20:57:10 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B9030C0003;
        Fri,  6 Mar 2020 01:57:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: cpcap: convert to devm_rtc_allocate_device
Date:   Fri,  6 Mar 2020 02:57:01 +0100
Message-Id: <20200306015703.42101-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-cpcap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index 6a3b70fd7e1f..35f0717661b3 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -256,12 +256,12 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	platform_set_drvdata(pdev, rtc);
-	rtc->rtc_dev = devm_rtc_device_register(dev, "cpcap_rtc",
-						&cpcap_rtc_ops, THIS_MODULE);
-
+	rtc->rtc_dev = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc->rtc_dev))
 		return PTR_ERR(rtc->rtc_dev);
 
+	rtc->rtc_dev->ops = &cpcap_rtc_ops;
+
 	err = cpcap_get_vendor(dev, rtc->regmap, &rtc->vendor);
 	if (err)
 		return err;
@@ -298,7 +298,7 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 		/* ignore error and continue without wakeup support */
 	}
 
-	return 0;
+	return rtc_register_device(rtc->rtc_dev);
 }
 
 static const struct of_device_id cpcap_rtc_of_match[] = {
-- 
2.24.1


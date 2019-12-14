Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5504711F4A6
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfLNWKf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:35 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49537 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfLNWK3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:29 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 37A0740005;
        Sat, 14 Dec 2019 22:10:28 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 05/16] rtc: rv3029: avoid reading the status register uselessly
Date:   Sat, 14 Dec 2019 23:10:11 +0100
Message-Id: <20191214221022.622482-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RV3029_STATUS is read in multiple location but its value is never used
afterwards. Avoid this register access when not necessary.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 4e7514433b79..0e0a10cbfd67 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -333,16 +333,9 @@ static irqreturn_t rv3029_handle_irq(int irq, void *dev_id)
 
 static int rv3029_read_time(struct device *dev, struct rtc_time *tm)
 {
-	u8 buf[1];
 	int ret;
 	u8 regs[RV3029_WATCH_SECTION_LEN] = { 0, };
 
-	ret = rv3029_get_sr(dev, buf);
-	if (ret < 0) {
-		dev_err(dev, "%s: reading SR failed\n", __func__);
-		return -EIO;
-	}
-
 	ret = rv3029_read_regs(dev, RV3029_W_SEC, regs,
 			       RV3029_WATCH_SECTION_LEN);
 	if (ret < 0) {
@@ -380,12 +373,6 @@ static int rv3029_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	int ret;
 	u8 regs[8], controls, flags;
 
-	ret = rv3029_get_sr(dev, regs);
-	if (ret < 0) {
-		dev_err(dev, "%s: reading SR failed\n", __func__);
-		return -EIO;
-	}
-
 	ret = rv3029_read_regs(dev, RV3029_A_SC, regs,
 			       RV3029_ALARM_SECTION_LEN);
 
@@ -459,12 +446,6 @@ static int rv3029_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (tm->tm_year < 100)
 		return -EINVAL;
 
-	ret = rv3029_get_sr(dev, regs);
-	if (ret < 0) {
-		dev_err(dev, "%s: reading SR failed\n", __func__);
-		return -EIO;
-	}
-
 	/* Activate all the alarms with AE_x bit */
 	regs[RV3029_A_SC - RV3029_A_SC] = bin2bcd(tm->tm_sec) | RV3029_A_AE_X;
 	regs[RV3029_A_MN - RV3029_A_SC] = bin2bcd(tm->tm_min) | RV3029_A_AE_X;
@@ -748,7 +729,6 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 {
 	struct rv3029_data *rv3029;
 	int rc = 0;
-	u8 buf[1];
 
 	rv3029 = devm_kzalloc(dev, sizeof(*rv3029), GFP_KERNEL);
 	if (!rv3029)
@@ -759,12 +739,6 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 	rv3029->dev = dev;
 	dev_set_drvdata(dev, rv3029);
 
-	rc = rv3029_get_sr(dev, buf);
-	if (rc < 0) {
-		dev_err(dev, "reading status failed\n");
-		return rc;
-	}
-
 	rv3029_trickle_config(dev);
 	rv3029_hwmon_register(dev, name);
 
-- 
2.23.0


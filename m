Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B099811F4AD
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbfLNWKn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:43 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:50733 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfLNWKc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:32 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A3B9F40008;
        Sat, 14 Dec 2019 22:10:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 11/16] rtc: rv3029: correctly handle PON and VLOW2
Date:   Sat, 14 Dec 2019 23:10:17 +0100
Message-Id: <20191214221022.622482-12-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In case the data is invalid (PON or VLOW2 are set in STATUS, explicitly
tell userspace that the time is invalid. Only remove VLOW2 when setting a
new valid time.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 6ae96baa111a..433aad16897e 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -159,20 +159,21 @@ static int rv3029_eeprom_enter(struct rv3029_data *rv3029)
 	ret = regmap_read(rv3029->regmap, RV3029_STATUS, &sr);
 	if (ret < 0)
 		return ret;
-	if (sr & (RV3029_STATUS_VLOW1 | RV3029_STATUS_VLOW2)) {
+	if (sr & RV3029_STATUS_VLOW2)
+		return -ENODEV;
+	if (sr & RV3029_STATUS_VLOW1) {
 		/* We clear the bits and retry once just in case
 		 * we had a brown out in early startup.
 		 */
 		ret = regmap_update_bits(rv3029->regmap, RV3029_STATUS,
-					 RV3029_STATUS_VLOW1 |
-					 RV3029_STATUS_VLOW2, 0);
+					 RV3029_STATUS_VLOW1, 0);
 		if (ret < 0)
 			return ret;
 		usleep_range(1000, 10000);
 		ret = regmap_read(rv3029->regmap, RV3029_STATUS, &sr);
 		if (ret < 0)
 			return ret;
-		if (sr & (RV3029_STATUS_VLOW1 | RV3029_STATUS_VLOW2)) {
+		if (sr & RV3029_STATUS_VLOW1) {
 			dev_err(rv3029->dev,
 				"Supply voltage is too low to safely access the EEPROM.\n");
 			return -ENODEV;
@@ -306,9 +307,17 @@ static irqreturn_t rv3029_handle_irq(int irq, void *dev_id)
 static int rv3029_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
+	unsigned int sr;
 	int ret;
 	u8 regs[RV3029_WATCH_SECTION_LEN] = { 0, };
 
+	ret = regmap_read(rv3029->regmap, RV3029_STATUS, &sr);
+	if (ret < 0)
+		return ret;
+
+	if (sr & (RV3029_STATUS_VLOW2 | RV3029_STATUS_PON))
+		return -EINVAL;
+
 	ret = regmap_bulk_read(rv3029->regmap, RV3029_W_SEC, regs,
 			       RV3029_WATCH_SECTION_LEN);
 	if (ret < 0) {
@@ -454,9 +463,9 @@ static int rv3029_set_time(struct device *dev, struct rtc_time *tm)
 	if (ret < 0)
 		return ret;
 
-	/* clear PON bit */
+	/* clear PON and VLOW2 bits */
 	return regmap_update_bits(rv3029->regmap, RV3029_STATUS,
-				  RV3029_STATUS_PON, 0);
+				  RV3029_STATUS_PON | RV3029_STATUS_VLOW2, 0);
 }
 
 static int rv3029_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
-- 
2.23.0


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8310344768B
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236782AbhKGW57 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:59 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:52021 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236731AbhKGW54 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:56 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F013C240009;
        Sun,  7 Nov 2021 22:55:11 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] rtc: rx8025: use .set_offset/.read_offset
Date:   Sun,  7 Nov 2021 23:54:57 +0100
Message-Id: <20211107225458.111068-12-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver has its own sysfs file to adjust the clock. Fortunately, it is
already in pbb, however, the sign it expects is the opposite of what the
RTC core does (which actually aligns with the RTC).

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8025.c | 73 ++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index c5b3814f8c8e..5bfdd34a72ff 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -403,17 +403,7 @@ static int rx8025_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	return 0;
 }
 
-static const struct rtc_class_ops rx8025_rtc_ops = {
-	.read_time = rx8025_get_time,
-	.set_time = rx8025_set_time,
-	.read_alarm = rx8025_read_alarm,
-	.set_alarm = rx8025_set_alarm,
-	.alarm_irq_enable = rx8025_alarm_irq_enable,
-};
-
 /*
- * Clock precision adjustment support
- *
  * According to the RX8025 SA/NB application manual the frequency and
  * temperature characteristics can be approximated using the following
  * equation:
@@ -424,11 +414,8 @@ static const struct rtc_class_ops rx8025_rtc_ops = {
  *   a : Coefficient = (-35 +-5) * 10**-9
  *   ut: Ultimate temperature in degree = +25 +-5 degree
  *   t : Any temperature in degree
- *
- * Note that the clock adjustment in ppb must be entered (which is
- * the negative value of the deviation).
  */
-static int rx8025_get_clock_adjust(struct device *dev, int *adj)
+static int rx8025_read_offset(struct device *dev, long *offset)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	int digoff;
@@ -437,63 +424,75 @@ static int rx8025_get_clock_adjust(struct device *dev, int *adj)
 	if (digoff < 0)
 		return digoff;
 
-	*adj = digoff >= 64 ? digoff - 128 : digoff;
-	if (*adj > 0)
-		(*adj)--;
-	*adj *= -RX8025_ADJ_RESOLUTION;
+	*offset = digoff >= 64 ? digoff - 128 : digoff;
+	if (*offset > 0)
+		(*offset)--;
+	*offset *= RX8025_ADJ_RESOLUTION;
 
 	return 0;
 }
 
-static int rx8025_set_clock_adjust(struct device *dev, int adj)
+static int rx8025_set_offset(struct device *dev, long offset)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	u8 digoff;
 	int err;
 
-	adj /= -RX8025_ADJ_RESOLUTION;
-	if (adj > RX8025_ADJ_DATA_MAX)
-		adj = RX8025_ADJ_DATA_MAX;
-	else if (adj < RX8025_ADJ_DATA_MIN)
-		adj = RX8025_ADJ_DATA_MIN;
-	else if (adj > 0)
-		adj++;
-	else if (adj < 0)
-		adj += 128;
-	digoff = adj;
+	offset /= RX8025_ADJ_RESOLUTION;
+	if (offset > RX8025_ADJ_DATA_MAX)
+		offset = RX8025_ADJ_DATA_MAX;
+	else if (offset < RX8025_ADJ_DATA_MIN)
+		offset = RX8025_ADJ_DATA_MIN;
+	else if (offset > 0)
+		offset++;
+	else if (offset < 0)
+		offset += 128;
+	digoff = offset;
 
 	err = rx8025_write_reg(client, RX8025_REG_DIGOFF, digoff);
 	if (err)
 		return err;
 
-	dev_dbg(dev, "%s: write 0x%02x\n", __func__, digoff);
-
 	return 0;
 }
 
+static const struct rtc_class_ops rx8025_rtc_ops = {
+	.read_time = rx8025_get_time,
+	.set_time = rx8025_set_time,
+	.read_alarm = rx8025_read_alarm,
+	.set_alarm = rx8025_set_alarm,
+	.alarm_irq_enable = rx8025_alarm_irq_enable,
+	.read_offset = rx8025_read_offset,
+	.set_offset = rx8025_set_offset,
+};
+
 static ssize_t rx8025_sysfs_show_clock_adjust(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
-	int err, adj;
+	long adj;
+	int err;
 
-	err = rx8025_get_clock_adjust(dev, &adj);
+	dev_warn_once(dev, "clock_adjust_ppb is deprecated, use offset\n");
+	err = rx8025_read_offset(dev, &adj);
 	if (err)
 		return err;
 
-	return sprintf(buf, "%d\n", adj);
+	return sprintf(buf, "%ld\n", -adj);
 }
 
 static ssize_t rx8025_sysfs_store_clock_adjust(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf, size_t count)
 {
-	int adj, err;
+	long adj;
+	int err;
 
-	if (sscanf(buf, "%i", &adj) != 1)
+	dev_warn_once(dev, "clock_adjust_ppb is deprecated, use offset\n");
+	if (kstrtol(buf, 10, &adj) != 0)
 		return -EINVAL;
 
-	err = rx8025_set_clock_adjust(dev, adj);
+	err = rx8025_set_offset(dev, -adj);
 
 	return err ? err : count;
 }
-- 
2.31.1


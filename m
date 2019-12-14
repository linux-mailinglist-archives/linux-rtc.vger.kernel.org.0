Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7F511F4B4
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfLNWK4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:56 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:41099 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbfLNWKc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:32 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 82894FF805;
        Sat, 14 Dec 2019 22:10:31 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 13/16] rtc: rv3029: let the core handle rtc range
Date:   Sat, 14 Dec 2019 23:10:19 +0100
Message-Id: <20191214221022.622482-14-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Despite the comment, the RV3029 uses a 7bit BCD register for the year,
making 2079 the last supported year.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 18 ++----------------
 include/linux/rtc.h        |  1 +
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 555c88c2edbb..001d98aa33cc 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -405,14 +405,6 @@ static int rv3029_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	int ret;
 	u8 regs[8];
 
-	/*
-	 * The clock has an 8 bit wide bcd-coded register (they never learn)
-	 * for the year. tm_year is an offset from 1900 and we are interested
-	 * in the 2000-2099 range, so any value less than 100 is invalid.
-	*/
-	if (tm->tm_year < 100)
-		return -EINVAL;
-
 	/* Activate all the alarms with AE_x bit */
 	regs[RV3029_A_SC - RV3029_A_SC] = bin2bcd(tm->tm_sec) | RV3029_A_AE_X;
 	regs[RV3029_A_MN - RV3029_A_SC] = bin2bcd(tm->tm_min) | RV3029_A_AE_X;
@@ -442,14 +434,6 @@ static int rv3029_set_time(struct device *dev, struct rtc_time *tm)
 	u8 regs[8];
 	int ret;
 
-	/*
-	 * The clock has an 8 bit wide bcd-coded register (they never learn)
-	 * for the year. tm_year is an offset from 1900 and we are interested
-	 * in the 2000-2099 range, so any value less than 100 is invalid.
-	*/
-	if (tm->tm_year < 100)
-		return -EINVAL;
-
 	regs[RV3029_W_SEC - RV3029_W_SEC] = bin2bcd(tm->tm_sec);
 	regs[RV3029_W_MINUTES - RV3029_W_SEC] = bin2bcd(tm->tm_min);
 	regs[RV3029_W_HOURS - RV3029_W_SEC] = bin2bcd(tm->tm_hour);
@@ -751,6 +735,8 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 	}
 
 	rv3029->rtc->ops = &rv3029_rtc_ops;
+	rv3029->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rv3029->rtc->range_max = RTC_TIMESTAMP_END_2079;
 
 	return rtc_register_device(rv3029->rtc);
 }
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 4e9d3c71addb..23990bd29040 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -167,6 +167,7 @@ struct rtc_device {
 #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
 #define RTC_TIMESTAMP_BEGIN_2000	946684800LL /* 2000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_END_2063		2966371199LL /* 2063-12-31 23:59:59 */
+#define RTC_TIMESTAMP_END_2079		3471292799LL /* 2079-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2099		4102444799LL /* 2099-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2199		7258118399LL /* 2199-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_9999		253402300799LL /* 9999-12-31 23:59:59 */
-- 
2.23.0


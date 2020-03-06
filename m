Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32E417B340
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 01:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgCFA6P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 19:58:15 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60519 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgCFA6P (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 19:58:15 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 83124E0005;
        Fri,  6 Mar 2020 00:58:13 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: pl031: remove useless invalid alarm handling
Date:   Fri,  6 Mar 2020 01:58:07 +0100
Message-Id: <20200306005809.38530-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The core will never pass an invalid alarm to .set_alarm, it is not
necessary to check for its validity.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pl031.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index 180caebbd355..2e8e019a6e4c 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -210,17 +210,13 @@ static int pl031_stv2_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	unsigned long bcd_year;
 	int ret;
 
-	/* At the moment, we can only deal with non-wildcarded alarm times. */
-	ret = rtc_valid_tm(&alarm->time);
+	ret = pl031_stv2_tm_to_time(dev, &alarm->time,
+				    &time, &bcd_year);
 	if (ret == 0) {
-		ret = pl031_stv2_tm_to_time(dev, &alarm->time,
-					    &time, &bcd_year);
-		if (ret == 0) {
-			writel(bcd_year, ldata->base + RTC_YMR);
-			writel(time, ldata->base + RTC_MR);
+		writel(bcd_year, ldata->base + RTC_YMR);
+		writel(time, ldata->base + RTC_MR);
 
-			pl031_alarm_irq_enable(dev, alarm->enabled);
-		}
+		pl031_alarm_irq_enable(dev, alarm->enabled);
 	}
 
 	return ret;
@@ -285,14 +281,10 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	unsigned long time;
 	int ret;
 
-	/* At the moment, we can only deal with non-wildcarded alarm times. */
-	ret = rtc_valid_tm(&alarm->time);
+	ret = rtc_tm_to_time(&alarm->time, &time);
 	if (ret == 0) {
-		ret = rtc_tm_to_time(&alarm->time, &time);
-		if (ret == 0) {
-			writel(time, ldata->base + RTC_MR);
-			pl031_alarm_irq_enable(dev, alarm->enabled);
-		}
+		writel(time, ldata->base + RTC_MR);
+		pl031_alarm_irq_enable(dev, alarm->enabled);
 	}
 
 	return ret;
-- 
2.24.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74508182515
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2020 23:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731390AbgCKWkE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Mar 2020 18:40:04 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:37801 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731352AbgCKWkE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Mar 2020 18:40:04 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id DF560100003;
        Wed, 11 Mar 2020 22:40:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] rtc: 88pm860x: stop mangling alarm time
Date:   Wed, 11 Mar 2020 23:39:55 +0100
Message-Id: <20200311223956.51352-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200311223956.51352-1-alexandre.belloni@bootlin.com>
References: <20200311223956.51352-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC core always passes a valid alarm time there is no need to modify
it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-88pm860x.c | 41 +-------------------------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index f5933a08454c..e0b18227514b 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -75,33 +75,6 @@ static int pm860x_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	return 0;
 }
 
-/*
- * Calculate the next alarm time given the requested alarm time mask
- * and the current time.
- */
-static void rtc_next_alarm_time(struct rtc_time *next, struct rtc_time *now,
-				struct rtc_time *alrm)
-{
-	unsigned long next_time;
-	unsigned long now_time;
-
-	next->tm_year = now->tm_year;
-	next->tm_mon = now->tm_mon;
-	next->tm_mday = now->tm_mday;
-	next->tm_hour = alrm->tm_hour;
-	next->tm_min = alrm->tm_min;
-	next->tm_sec = alrm->tm_sec;
-
-	rtc_tm_to_time(now, &now_time);
-	rtc_tm_to_time(next, &next_time);
-
-	if (next_time < now_time) {
-		/* Advance one day */
-		next_time += 60 * 60 * 24;
-		rtc_time_to_tm(next_time, next);
-	}
-}
-
 static int pm860x_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct pm860x_rtc_info *info = dev_get_drvdata(dev);
@@ -187,7 +160,6 @@ static int pm860x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 static int pm860x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct pm860x_rtc_info *info = dev_get_drvdata(dev);
-	struct rtc_time now_tm, alarm_tm;
 	unsigned long ticks, base, data;
 	unsigned char buf[8];
 	int mask;
@@ -200,18 +172,7 @@ static int pm860x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	base = ((unsigned long)buf[1] << 24) | (buf[3] << 16) |
 		(buf[5] << 8) | buf[7];
 
-	/* load 32-bit read-only counter */
-	pm860x_bulk_read(info->i2c, PM8607_RTC_COUNTER1, 4, buf);
-	data = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
-		(buf[1] << 8) | buf[0];
-	ticks = base + data;
-	dev_dbg(info->dev, "get base:0x%lx, RO count:0x%lx, ticks:0x%lx\n",
-		base, data, ticks);
-
-	rtc_time_to_tm(ticks, &now_tm);
-	rtc_next_alarm_time(&alarm_tm, &now_tm, &alrm->time);
-	/* get new ticks for alarm in 24 hours */
-	rtc_tm_to_time(&alarm_tm, &ticks);
+	rtc_tm_to_time(&alrm->time, &ticks);
 	data = ticks - base;
 
 	buf[0] = data & 0xff;
-- 
2.24.1


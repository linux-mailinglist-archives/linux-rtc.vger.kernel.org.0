Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB4217B33D
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 01:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgCFA5j (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 19:57:39 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42523 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgCFA5g (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 19:57:36 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C5E73E0003;
        Fri,  6 Mar 2020 00:57:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: pl030: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 01:57:30 +0100
Message-Id: <20200306005730.38268-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306005730.38268-1-alexandre.belloni@bootlin.com>
References: <20200306005730.38268-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion to avoid the y2106 issue.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pl030.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
index 55776e8fa87c..ebe03eba8f5f 100644
--- a/drivers/rtc/rtc-pl030.c
+++ b/drivers/rtc/rtc-pl030.c
@@ -36,27 +36,24 @@ static int pl030_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct pl030_rtc *rtc = dev_get_drvdata(dev);
 
-	rtc_time_to_tm(readl(rtc->base + RTC_MR), &alrm->time);
+	rtc_time64_to_tm(readl(rtc->base + RTC_MR), &alrm->time);
 	return 0;
 }
 
 static int pl030_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct pl030_rtc *rtc = dev_get_drvdata(dev);
-	unsigned long time;
-	int ret;
 
-	ret = rtc_tm_to_time(&alrm->time, &time);
-	if (ret == 0)
-		writel(time, rtc->base + RTC_MR);
-	return ret;
+	writel(rtc_tm_to_time64(&alrm->time), rtc->base + RTC_MR);
+
+	return 0;
 }
 
 static int pl030_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct pl030_rtc *rtc = dev_get_drvdata(dev);
 
-	rtc_time_to_tm(readl(rtc->base + RTC_DR), tm);
+	rtc_time64_to_tm(readl(rtc->base + RTC_DR), tm);
 
 	return 0;
 }
@@ -72,14 +69,10 @@ static int pl030_read_time(struct device *dev, struct rtc_time *tm)
 static int pl030_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct pl030_rtc *rtc = dev_get_drvdata(dev);
-	unsigned long time;
-	int ret;
 
-	ret = rtc_tm_to_time(tm, &time);
-	if (ret == 0)
-		writel(time + 1, rtc->base + RTC_LR);
+	writel(rtc_tm_to_time64(tm) + 1, rtc->base + RTC_LR);
 
-	return ret;
+	return 0;
 }
 
 static const struct rtc_class_ops pl030_ops = {
-- 
2.24.1


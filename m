Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E30117B367
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 02:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCFBCu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 20:02:50 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:11247 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgCFBCu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 20:02:50 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B55DB240006;
        Fri,  6 Mar 2020 01:02:47 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Guan Xuetao <gxt@pku.edu.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: puv3: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 02:02:39 +0100
Message-Id: <20200306010240.40056-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306010240.40056-1-alexandre.belloni@bootlin.com>
References: <20200306010240.40056-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-puv3.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-puv3.c b/drivers/rtc/rtc-puv3.c
index 3029a52a501e..954b88d2485f 100644
--- a/drivers/rtc/rtc-puv3.c
+++ b/drivers/rtc/rtc-puv3.c
@@ -85,7 +85,7 @@ static int puv3_rtc_setpie(struct device *dev, int enabled)
 /* Time read/write */
 static int puv3_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 {
-	rtc_time_to_tm(readl(RTC_RCNR), rtc_tm);
+	rtc_time64_to_tm(readl(RTC_RCNR), rtc_tm);
 
 	dev_dbg(dev, "read time %ptRr\n", rtc_tm);
 
@@ -94,12 +94,9 @@ static int puv3_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 
 static int puv3_rtc_settime(struct device *dev, struct rtc_time *tm)
 {
-	unsigned long rtc_count = 0;
-
 	dev_dbg(dev, "set time %ptRr\n", tm);
 
-	rtc_tm_to_time(tm, &rtc_count);
-	writel(rtc_count, RTC_RCNR);
+	writel(rtc_tm_to_time64(tm), RTC_RCNR);
 
 	return 0;
 }
@@ -108,7 +105,7 @@ static int puv3_rtc_getalarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rtc_time *alm_tm = &alrm->time;
 
-	rtc_time_to_tm(readl(RTC_RTAR), alm_tm);
+	rtc_time64_to_tm(readl(RTC_RTAR), alm_tm);
 
 	alrm->enabled = readl(RTC_RTSR) & RTC_RTSR_ALE;
 
@@ -120,12 +117,10 @@ static int puv3_rtc_getalarm(struct device *dev, struct rtc_wkalrm *alrm)
 static int puv3_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rtc_time *tm = &alrm->time;
-	unsigned long rtcalarm_count = 0;
 
 	dev_dbg(dev, "set alarm: %d, %ptRr\n", alrm->enabled, tm);
 
-	rtc_tm_to_time(tm, &rtcalarm_count);
-	writel(rtcalarm_count, RTC_RTAR);
+	writel(rtc_tm_to_time64(tm), RTC_RTAR);
 
 	puv3_rtc_setaie(dev, alrm->enabled);
 
-- 
2.24.1


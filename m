Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF21617B35F
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 02:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgCFBCB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 20:02:01 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:33095 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgCFBCA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 20:02:00 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 31B6C20004;
        Fri,  6 Mar 2020 01:01:59 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: sa1100: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 02:01:46 +0100
Message-Id: <20200306010146.39762-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306010146.39762-1-alexandre.belloni@bootlin.com>
References: <20200306010146.39762-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sa1100.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 82a9d4ab368f..9ccc97cf5e09 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -111,20 +111,17 @@ static int sa1100_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct sa1100_rtc *info = dev_get_drvdata(dev);
 
-	rtc_time_to_tm(readl_relaxed(info->rcnr), tm);
+	rtc_time64_to_tm(readl_relaxed(info->rcnr), tm);
 	return 0;
 }
 
 static int sa1100_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct sa1100_rtc *info = dev_get_drvdata(dev);
-	unsigned long time;
-	int ret;
 
-	ret = rtc_tm_to_time(tm, &time);
-	if (ret == 0)
-		writel_relaxed(time, info->rcnr);
-	return ret;
+	writel_relaxed(rtc_tm_to_time64(tm), info->rcnr);
+
+	return 0;
 }
 
 static int sa1100_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
@@ -141,24 +138,18 @@ static int sa1100_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 static int sa1100_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct sa1100_rtc *info = dev_get_drvdata(dev);
-	unsigned long time;
-	int ret;
 
 	spin_lock_irq(&info->lock);
-	ret = rtc_tm_to_time(&alrm->time, &time);
-	if (ret != 0)
-		goto out;
 	writel_relaxed(readl_relaxed(info->rtsr) &
 		(RTSR_HZE | RTSR_ALE | RTSR_AL), info->rtsr);
-	writel_relaxed(time, info->rtar);
+	writel_relaxed(rtc_tm_to_time64(&alrm->time), info->rtar);
 	if (alrm->enabled)
 		writel_relaxed(readl_relaxed(info->rtsr) | RTSR_ALE, info->rtsr);
 	else
 		writel_relaxed(readl_relaxed(info->rtsr) & ~RTSR_ALE, info->rtsr);
-out:
 	spin_unlock_irq(&info->lock);
 
-	return ret;
+	return 0;
 }
 
 static int sa1100_rtc_proc(struct device *dev, struct seq_file *seq)
-- 
2.24.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2428617AA1A
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2020 17:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgCEQFU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 11:05:20 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:59637 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCEQFU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 11:05:20 -0500
Received: from localhost (lfbn-lyo-1-16-97.w86-202.abo.wanadoo.fr [86.202.111.97])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3058B20000B;
        Thu,  5 Mar 2020 16:05:14 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Barry Song <baohua@kernel.org>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: sirfsoc: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Thu,  5 Mar 2020 17:04:52 +0100
Message-Id: <20200305160452.27808-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305160452.27808-1-alexandre.belloni@bootlin.com>
References: <20200305160452.27808-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion to avoid the y2106 issue.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sirfsoc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-sirfsoc.c b/drivers/rtc/rtc-sirfsoc.c
index 8b3c88fb9793..15f4577ddaef 100644
--- a/drivers/rtc/rtc-sirfsoc.c
+++ b/drivers/rtc/rtc-sirfsoc.c
@@ -90,13 +90,13 @@ static int sirfsoc_rtc_read_alarm(struct device *dev,
 	 */
 	/* if alarm is in next overflow cycle */
 	if (rtc_count > rtc_alarm)
-		rtc_time_to_tm((rtcdrv->overflow_rtc + 1)
-				<< (BITS_PER_LONG - RTC_SHIFT)
-				| rtc_alarm >> RTC_SHIFT, &(alrm->time));
+		rtc_time64_to_tm((rtcdrv->overflow_rtc + 1)
+				 << (BITS_PER_LONG - RTC_SHIFT)
+				 | rtc_alarm >> RTC_SHIFT, &alrm->time);
 	else
-		rtc_time_to_tm(rtcdrv->overflow_rtc
-				<< (BITS_PER_LONG - RTC_SHIFT)
-				| rtc_alarm >> RTC_SHIFT, &(alrm->time));
+		rtc_time64_to_tm(rtcdrv->overflow_rtc
+				 << (BITS_PER_LONG - RTC_SHIFT)
+				 | rtc_alarm >> RTC_SHIFT, &alrm->time);
 	if (sirfsoc_rtc_readl(rtcdrv, RTC_STATUS) & SIRFSOC_RTC_AL0E)
 		alrm->enabled = 1;
 
@@ -113,7 +113,7 @@ static int sirfsoc_rtc_set_alarm(struct device *dev,
 	rtcdrv = dev_get_drvdata(dev);
 
 	if (alrm->enabled) {
-		rtc_tm_to_time(&(alrm->time), &rtc_alarm);
+		rtc_alarm = rtc_tm_to_time64(&alrm->time);
 
 		spin_lock_irq(&rtcdrv->lock);
 
@@ -181,8 +181,8 @@ static int sirfsoc_rtc_read_time(struct device *dev,
 		cpu_relax();
 	} while (tmp_rtc != sirfsoc_rtc_readl(rtcdrv, RTC_CN));
 
-	rtc_time_to_tm(rtcdrv->overflow_rtc << (BITS_PER_LONG - RTC_SHIFT) |
-					tmp_rtc >> RTC_SHIFT, tm);
+	rtc_time64_to_tm(rtcdrv->overflow_rtc << (BITS_PER_LONG - RTC_SHIFT)
+			 | tmp_rtc >> RTC_SHIFT, tm);
 	return 0;
 }
 
@@ -193,7 +193,7 @@ static int sirfsoc_rtc_set_time(struct device *dev,
 	struct sirfsoc_rtc_drv *rtcdrv;
 	rtcdrv = dev_get_drvdata(dev);
 
-	rtc_tm_to_time(tm, &rtc_time);
+	rtc_time = rtc_tm_to_time64(tm);
 
 	rtcdrv->overflow_rtc = rtc_time >> (BITS_PER_LONG - RTC_SHIFT);
 
-- 
2.24.1


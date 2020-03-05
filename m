Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4926617B0E6
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2020 22:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgCEVuf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 16:50:35 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53173 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgCEVuf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 16:50:35 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7C22C20002;
        Thu,  5 Mar 2020 21:50:33 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] rtc: davinci: remove useless error handling
Date:   Thu,  5 Mar 2020 22:50:22 +0100
Message-Id: <20200305215022.32533-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305215022.32533-1-alexandre.belloni@bootlin.com>
References: <20200305215022.32533-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

convertfromdays and convert2days never return errors, stop handling non
existent errors.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-davinci.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-davinci.c b/drivers/rtc/rtc-davinci.c
index 55d826dafe1d..73f87a17cdf3 100644
--- a/drivers/rtc/rtc-davinci.c
+++ b/drivers/rtc/rtc-davinci.c
@@ -227,7 +227,7 @@ davinci_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 	return ret;
 }
 
-static int convertfromdays(u16 days, struct rtc_time *tm)
+static void convertfromdays(u16 days, struct rtc_time *tm)
 {
 	int tmp_days, year, mon;
 
@@ -250,10 +250,9 @@ static int convertfromdays(u16 days, struct rtc_time *tm)
 			break;
 		}
 	}
-	return 0;
 }
 
-static int convert2days(u16 *days, struct rtc_time *tm)
+static void convert2days(u16 *days, struct rtc_time *tm)
 {
 	int i;
 	*days = 0;
@@ -262,8 +261,6 @@ static int convert2days(u16 *days, struct rtc_time *tm)
 		*days += rtc_year_days(1, 12, i);
 
 	*days += rtc_year_days(tm->tm_mday, tm->tm_mon, 1900 + tm->tm_year);
-
-	return 0;
 }
 
 static int davinci_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -296,8 +293,7 @@ static int davinci_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	days <<= 8;
 	days |= day0;
 
-	if (convertfromdays(days, tm) < 0)
-		return -EINVAL;
+	convertfromdays(days, tm);
 
 	return 0;
 }
@@ -391,8 +387,7 @@ static int davinci_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	days <<= 8;
 	days |= day0;
 
-	if (convertfromdays(days, &alm->time) < 0)
-		return -EINVAL;
+	convertfromdays(days, &alm->time);
 
 	alm->pending = !!(rtcss_read(davinci_rtc,
 			  PRTCSS_RTC_CCTRL) &
-- 
2.24.1


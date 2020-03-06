Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D7117B78D
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgCFHiP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:38:15 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57515 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgCFHiK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:38:10 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D71C3C000A;
        Fri,  6 Mar 2020 07:38:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] rtc: pm8xxx: : switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 08:37:57 +0100
Message-Id: <20200306073758.58050-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306073758.58050-1-alexandre.belloni@bootlin.com>
References: <20200306073758.58050-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pm8xxx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 71bd56d32c90..2da0d80224c3 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -84,7 +84,7 @@ static int pm8xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	if (!rtc_dd->allow_set_time)
 		return -EACCES;
 
-	rtc_tm_to_time(tm, &secs);
+	secs = rtc_tm_to_time64(tm);
 
 	dev_dbg(dev, "Seconds value to be written to RTC = %lu\n", secs);
 
@@ -208,7 +208,7 @@ static int pm8xxx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	secs = value[0] | (value[1] << 8) | (value[2] << 16) |
 	       ((unsigned long)value[3] << 24);
 
-	rtc_time_to_tm(secs, tm);
+	rtc_time64_to_tm(secs, tm);
 
 	dev_dbg(dev, "secs = %lu, h:m:s == %ptRt, y-m-d = %ptRdr\n", secs, tm, tm);
 
@@ -224,7 +224,7 @@ static int pm8xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
 	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
 
-	rtc_tm_to_time(&alarm->time, &secs);
+	secs = rtc_tm_to_time64(&alarm->time);
 
 	for (i = 0; i < NUM_8_BIT_RTC_REGS; i++) {
 		value[i] = secs & 0xFF;
@@ -280,7 +280,7 @@ static int pm8xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	secs = value[0] | (value[1] << 8) | (value[2] << 16) |
 	       ((unsigned long)value[3] << 24);
 
-	rtc_time_to_tm(secs, &alarm->time);
+	rtc_time64_to_tm(secs, &alarm->time);
 
 	rc = rtc_valid_tm(&alarm->time);
 	if (rc < 0) {
-- 
2.24.1


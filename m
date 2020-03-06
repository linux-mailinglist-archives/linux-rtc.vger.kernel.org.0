Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1A417B775
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgCFHeQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:34:16 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:46169 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgCFHeP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:34:15 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BCBEEE0007;
        Fri,  6 Mar 2020 07:34:13 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: ds1374: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 08:34:03 +0100
Message-Id: <20200306073404.56921-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306073404.56921-1-alexandre.belloni@bootlin.com>
References: <20200306073404.56921-1-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-ds1374.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index 843fcbf5e940..9c51a12cf70f 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -164,7 +164,7 @@ static int ds1374_read_time(struct device *dev, struct rtc_time *time)
 
 	ret = ds1374_read_rtc(client, &itime, DS1374_REG_TOD0, 4);
 	if (!ret)
-		rtc_time_to_tm(itime, time);
+		rtc_time64_to_tm(itime, time);
 
 	return ret;
 }
@@ -172,9 +172,8 @@ static int ds1374_read_time(struct device *dev, struct rtc_time *time)
 static int ds1374_set_time(struct device *dev, struct rtc_time *time)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	unsigned long itime;
+	unsigned long itime = rtc_tm_to_time64(time);
 
-	rtc_tm_to_time(time, &itime);
 	return ds1374_write_rtc(client, itime, DS1374_REG_TOD0, 4);
 }
 
@@ -212,7 +211,7 @@ static int ds1374_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (ret)
 		goto out;
 
-	rtc_time_to_tm(now + cur_alarm, &alarm->time);
+	rtc_time64_to_tm(now + cur_alarm, &alarm->time);
 	alarm->enabled = !!(cr & DS1374_REG_CR_WACE);
 	alarm->pending = !!(sr & DS1374_REG_SR_AF);
 
@@ -237,8 +236,8 @@ static int ds1374_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (ret < 0)
 		return ret;
 
-	rtc_tm_to_time(&alarm->time, &new_alarm);
-	rtc_tm_to_time(&now, &itime);
+	new_alarm = rtc_tm_to_time64(&alarm->time);
+	itime = rtc_tm_to_time64(&now);
 
 	/* This can happen due to races, in addition to dates that are
 	 * truly in the past.  To avoid requiring the caller to check for
-- 
2.24.1


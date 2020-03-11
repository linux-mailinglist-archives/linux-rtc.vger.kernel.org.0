Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B27182516
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2020 23:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731402AbgCKWkH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Mar 2020 18:40:07 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38069 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731376AbgCKWkE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Mar 2020 18:40:04 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id BB972200005;
        Wed, 11 Mar 2020 22:40:02 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] rtc: 88pm860x: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Wed, 11 Mar 2020 23:39:56 +0100
Message-Id: <20200311223956.51352-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200311223956.51352-1-alexandre.belloni@bootlin.com>
References: <20200311223956.51352-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-88pm860x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index e0b18227514b..88bda3e072d8 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -95,7 +95,7 @@ static int pm860x_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	dev_dbg(info->dev, "get base:0x%lx, RO count:0x%lx, ticks:0x%lx\n",
 		base, data, ticks);
 
-	rtc_time_to_tm(ticks, tm);
+	rtc_time64_to_tm(ticks, tm);
 
 	return 0;
 }
@@ -112,7 +112,7 @@ static int pm860x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 			1900 + tm->tm_year);
 		return -EINVAL;
 	}
-	rtc_tm_to_time(tm, &ticks);
+	ticks = rtc_tm_to_time64(tm);
 
 	/* load 32-bit read-only counter */
 	pm860x_bulk_read(info->i2c, PM8607_RTC_COUNTER1, 4, buf);
@@ -150,7 +150,7 @@ static int pm860x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	dev_dbg(info->dev, "get base:0x%lx, RO count:0x%lx, ticks:0x%lx\n",
 		base, data, ticks);
 
-	rtc_time_to_tm(ticks, &alrm->time);
+	rtc_time64_to_tm(ticks, &alrm->time);
 	ret = pm860x_reg_read(info->i2c, PM8607_RTC1);
 	alrm->enabled = (ret & ALARM_EN) ? 1 : 0;
 	alrm->pending = (ret & (ALARM | ALARM_WAKEUP)) ? 1 : 0;
@@ -172,7 +172,7 @@ static int pm860x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	base = ((unsigned long)buf[1] << 24) | (buf[3] << 16) |
 		(buf[5] << 8) | buf[7];
 
-	rtc_tm_to_time(&alrm->time, &ticks);
+	ticks = rtc_tm_to_time64(&alrm->time);
 	data = ticks - base;
 
 	buf[0] = data & 0xff;
-- 
2.24.1


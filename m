Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D9E1C61BC
	for <lists+linux-rtc@lfdr.de>; Tue,  5 May 2020 22:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgEEUNr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 16:13:47 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:36333 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgEEUNr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 16:13:47 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 656A9200003;
        Tue,  5 May 2020 20:13:19 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        =?UTF-8?q?Per=20N=C3=B8rgaard=20Christensen?= 
        <per.christensen@prevas.dk>, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/5] rtc: pcf2127: let the core handle rtc range
Date:   Tue,  5 May 2020 22:13:07 +0200
Message-Id: <20200505201310.255145-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
References: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Let the core handle offsetting and windowing the RTC range.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 4e50d6768f13..136709baaa88 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -137,8 +137,7 @@ static int pcf2127_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_wday = buf[PCF2127_REG_DW] & 0x07;
 	tm->tm_mon = bcd2bin(buf[PCF2127_REG_MO] & 0x1F) - 1; /* rtc mn 1-12 */
 	tm->tm_year = bcd2bin(buf[PCF2127_REG_YR]);
-	if (tm->tm_year < 70)
-		tm->tm_year += 100;	/* assume we are in 1970...2069 */
+	tm->tm_year += 100;
 
 	dev_dbg(dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
@@ -172,7 +171,7 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[i++] = bin2bcd(tm->tm_mon + 1);
 
 	/* year */
-	buf[i++] = bin2bcd(tm->tm_year % 100);
+	buf[i++] = bin2bcd(tm->tm_year - 100);
 
 	/* write register's data */
 	err = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_SC, buf, i);
@@ -433,6 +432,9 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return PTR_ERR(pcf2127->rtc);
 
 	pcf2127->rtc->ops = &pcf2127_rtc_ops;
+	pcf2127->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	pcf2127->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
 
 	pcf2127->wdd.parent = dev;
 	pcf2127->wdd.info = &pcf2127_wdt_info;
-- 
2.26.2


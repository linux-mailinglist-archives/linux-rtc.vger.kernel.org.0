Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0097A28DD
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 23:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfH2V0A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 17:26:00 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:39615 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbfH2V0A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 17:26:00 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 797EF1C000A;
        Thu, 29 Aug 2019 21:25:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 5/5] rtc: pcf8563: let the core handle range offsetting
Date:   Thu, 29 Aug 2019 23:25:47 +0200
Message-Id: <20190829212547.19185-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829212547.19185-1-alexandre.belloni@bootlin.com>
References: <20190829212547.19185-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set the RTC range properly and use the core windowing and offsetting to
(unfortunately) map back to a 1970-2069 range.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8563.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 45462ec460a3..24baa4767b11 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -229,9 +229,7 @@ static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_mday = bcd2bin(buf[PCF8563_REG_DM] & 0x3F);
 	tm->tm_wday = buf[PCF8563_REG_DW] & 0x07;
 	tm->tm_mon = bcd2bin(buf[PCF8563_REG_MO] & 0x1F) - 1; /* rtc mn 1-12 */
-	tm->tm_year = bcd2bin(buf[PCF8563_REG_YR]);
-	if (tm->tm_year < 70)
-		tm->tm_year += 100;	/* assume we are in 1970...2069 */
+	tm->tm_year = bcd2bin(buf[PCF8563_REG_YR]) + 100;
 	/* detect the polarity heuristically. see note above. */
 	pcf8563->c_polarity = (buf[PCF8563_REG_MO] & PCF8563_MO_C) ?
 		(tm->tm_year >= 100) : (tm->tm_year < 100);
@@ -268,7 +266,7 @@ static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[PCF8563_REG_MO] = bin2bcd(tm->tm_mon + 1);
 
 	/* year and century */
-	buf[PCF8563_REG_YR] = bin2bcd(tm->tm_year % 100);
+	buf[PCF8563_REG_YR] = bin2bcd(tm->tm_year - 100);
 	if (pcf8563->c_polarity ? (tm->tm_year >= 100) : (tm->tm_year < 100))
 		buf[PCF8563_REG_MO] |= PCF8563_MO_C;
 
@@ -590,6 +588,9 @@ static int pcf8563_probe(struct i2c_client *client,
 	pcf8563->rtc->ops = &pcf8563_rtc_ops;
 	/* the pcf8563 alarm only supports a minute accuracy */
 	pcf8563->rtc->uie_unsupported = 1;
+	pcf8563->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	pcf8563->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	pcf8563->rtc->set_start_time = true;
 
 	if (client->irq > 0) {
 		err = devm_request_threaded_irq(&client->dev, client->irq,
-- 
2.21.0


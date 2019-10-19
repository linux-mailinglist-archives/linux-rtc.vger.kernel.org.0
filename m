Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8869FDDAF5
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 22:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfJSUtq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 16:49:46 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:48895 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfJSUtq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 16:49:46 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B727F240008;
        Sat, 19 Oct 2019 20:49:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/9] rtc: ds1343: use burst write to set time
Date:   Sat, 19 Oct 2019 22:49:35 +0200
Message-Id: <20191019204941.6203-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
References: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

To avoid possible race condition, use regmap_bulk_write to write all the
date/time registers at once instead of sequentially.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 52 ++++++++++------------------------------
 1 file changed, 12 insertions(+), 40 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index 9d7d571e722b..8a4f1fbb57fd 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -236,46 +236,18 @@ static int ds1343_read_time(struct device *dev, struct rtc_time *dt)
 static int ds1343_set_time(struct device *dev, struct rtc_time *dt)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev);
-	int res;
-
-	res = regmap_write(priv->map, DS1343_SECONDS_REG,
-				bin2bcd(dt->tm_sec));
-	if (res)
-		return res;
-
-	res = regmap_write(priv->map, DS1343_MINUTES_REG,
-				bin2bcd(dt->tm_min));
-	if (res)
-		return res;
-
-	res = regmap_write(priv->map, DS1343_HOURS_REG,
-				bin2bcd(dt->tm_hour) & 0x3F);
-	if (res)
-		return res;
-
-	res = regmap_write(priv->map, DS1343_DAY_REG,
-				bin2bcd(dt->tm_wday + 1));
-	if (res)
-		return res;
-
-	res = regmap_write(priv->map, DS1343_DATE_REG,
-				bin2bcd(dt->tm_mday));
-	if (res)
-		return res;
-
-	res = regmap_write(priv->map, DS1343_MONTH_REG,
-				bin2bcd(dt->tm_mon + 1));
-	if (res)
-		return res;
-
-	dt->tm_year %= 100;
-
-	res = regmap_write(priv->map, DS1343_YEAR_REG,
-				bin2bcd(dt->tm_year));
-	if (res)
-		return res;
-
-	return 0;
+	u8 buf[7];
+
+	buf[0] = bin2bcd(dt->tm_sec);
+	buf[1] = bin2bcd(dt->tm_min);
+	buf[2] = bin2bcd(dt->tm_hour) & 0x3F;
+	buf[3] = bin2bcd(dt->tm_wday + 1);
+	buf[4] = bin2bcd(dt->tm_mday);
+	buf[5] = bin2bcd(dt->tm_mon + 1);
+	buf[6] = bin2bcd(dt->tm_year - 100);
+
+	return regmap_bulk_write(priv->map, DS1343_SECONDS_REG,
+				 buf, sizeof(buf));
 }
 
 static int ds1343_update_alarm(struct device *dev)
-- 
2.21.0


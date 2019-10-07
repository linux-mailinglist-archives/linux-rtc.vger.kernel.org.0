Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47AD1CE41F
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 15:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfJGNrq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 09:47:46 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:41537 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfJGNrg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 09:47:36 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2A111240013;
        Mon,  7 Oct 2019 13:47:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 10/10] rtc: ds1347: handle century register
Date:   Mon,  7 Oct 2019 15:47:24 +0200
Message-Id: <20191007134724.15505-10-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
References: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The DS1347 can handle years from 0 to 9999, add century register support.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1347.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
index a49ce9991916..7025cf3fb9f8 100644
--- a/drivers/rtc/rtc-ds1347.c
+++ b/drivers/rtc/rtc-ds1347.c
@@ -26,6 +26,7 @@
 #define DS1347_DAY_REG		0x0B
 #define DS1347_YEAR_REG		0x0D
 #define DS1347_CONTROL_REG	0x0F
+#define DS1347_CENTURY_REG	0x13
 #define DS1347_STATUS_REG	0x17
 #define DS1347_CLOCK_BURST	0x3F
 
@@ -49,9 +50,9 @@ static const struct regmap_access_table ds1347_access_table = {
 static int ds1347_read_time(struct device *dev, struct rtc_time *dt)
 {
 	struct regmap *map = dev_get_drvdata(dev);
-	unsigned int status;
-	int err;
+	unsigned int status, century, secs;
 	unsigned char buf[8];
+	int err;
 
 	err = regmap_read(map, DS1347_STATUS_REG, &status);
 	if (err)
@@ -60,9 +61,19 @@ static int ds1347_read_time(struct device *dev, struct rtc_time *dt)
 	if (status & DS1347_OSF_BIT)
 		return -EINVAL;
 
-	err = regmap_bulk_read(map, DS1347_CLOCK_BURST, buf, 8);
-	if (err)
-		return err;
+	do {
+		err = regmap_bulk_read(map, DS1347_CLOCK_BURST, buf, 8);
+		if (err)
+			return err;
+
+		err = regmap_read(map, DS1347_CENTURY_REG, &century);
+		if (err)
+			return err;
+
+		err = regmap_read(map, DS1347_SECONDS_REG, &secs);
+		if (err)
+			return err;
+	} while (buf[0] != secs);
 
 	dt->tm_sec = bcd2bin(buf[0]);
 	dt->tm_min = bcd2bin(buf[1] & 0x7f);
@@ -70,7 +81,7 @@ static int ds1347_read_time(struct device *dev, struct rtc_time *dt)
 	dt->tm_mday = bcd2bin(buf[3]);
 	dt->tm_mon = bcd2bin(buf[4]) - 1;
 	dt->tm_wday = bcd2bin(buf[5]) - 1;
-	dt->tm_year = bcd2bin(buf[6]) + 100;
+	dt->tm_year = (bcd2bin(century) * 100) + bcd2bin(buf[6]) - 1900;
 
 	return 0;
 }
@@ -78,6 +89,7 @@ static int ds1347_read_time(struct device *dev, struct rtc_time *dt)
 static int ds1347_set_time(struct device *dev, struct rtc_time *dt)
 {
 	struct regmap *map = dev_get_drvdata(dev);
+	unsigned int century;
 	unsigned char buf[8];
 	int err;
 
@@ -92,19 +104,18 @@ static int ds1347_set_time(struct device *dev, struct rtc_time *dt)
 	buf[3] = bin2bcd(dt->tm_mday);
 	buf[4] = bin2bcd(dt->tm_mon + 1);
 	buf[5] = bin2bcd(dt->tm_wday + 1);
-
-	/* year in linux is from 1900 i.e in range of 100
-	in rtc it is from 00 to 99 */
-	dt->tm_year = dt->tm_year % 100;
-
-	buf[6] = bin2bcd(dt->tm_year);
+	buf[6] = bin2bcd(dt->tm_year % 100);
 	buf[7] = bin2bcd(0x00);
 
-	/* write the rtc settings */
 	err = regmap_bulk_write(map, DS1347_CLOCK_BURST, buf, 8);
 	if (err)
 		return err;
 
+	century = (dt->tm_year / 100) + 19;
+	err = regmap_write(map, DS1347_CENTURY_REG, century);
+	if (err)
+		return err;
+
 	return regmap_update_bits(map, DS1347_STATUS_REG,
 				  DS1347_NEOSC_BIT | DS1347_OSF_BIT, 0);
 }
-- 
2.21.0


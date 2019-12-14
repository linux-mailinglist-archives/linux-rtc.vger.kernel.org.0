Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84D1611F475
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfLNWDb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:31 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:54853 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfLNWDJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:09 -0500
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 80713100003;
        Sat, 14 Dec 2019 22:03:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 15/17] rtc: rv8803: return meaningful value for RTC_VL_READ
Date:   Sat, 14 Dec 2019 23:02:57 +0100
Message-Id: <20191214220259.621996-16-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RV8803_FLAG_V1F means the voltage is too low to keep the temperature
compensation running and the accuracy of the RTC is affected.

RV8803_FLAG_V2F means the voltage dropped so low that data is now invalid.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv8803.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index ed92116bdfa0..93c3a6b627bd 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -411,6 +411,7 @@ static int rv8803_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rv8803_data *rv8803 = dev_get_drvdata(dev);
+	unsigned int vl = 0;
 	int flags, ret = 0;
 
 	switch (cmd) {
@@ -419,18 +420,15 @@ static int rv8803_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		if (flags < 0)
 			return flags;
 
-		if (flags & RV8803_FLAG_V1F)
+		if (flags & RV8803_FLAG_V1F) {
 			dev_warn(&client->dev, "Voltage low, temperature compensation stopped.\n");
+			vl = RTC_VL_ACCURACY_LOW;
+		}
 
 		if (flags & RV8803_FLAG_V2F)
-			dev_warn(&client->dev, "Voltage low, data loss detected.\n");
-
-		flags &= RV8803_FLAG_V1F | RV8803_FLAG_V2F;
+			vl |= RTC_VL_DATA_INVALID;
 
-		if (copy_to_user((void __user *)arg, &flags, sizeof(int)))
-			return -EFAULT;
-
-		return 0;
+		return put_user(vl, (unsigned int __user *)arg);
 
 	case RTC_VL_CLR:
 		mutex_lock(&rv8803->flags_lock);
-- 
2.23.0


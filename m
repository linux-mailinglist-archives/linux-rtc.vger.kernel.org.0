Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C73811F480
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfLNWDo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:44 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:33515 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbfLNWDH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:07 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E9BAE1BF207;
        Sat, 14 Dec 2019 22:03:05 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 09/17] rtc: pcf8563: return meaningful value for RTC_VL_READ
Date:   Sat, 14 Dec 2019 23:02:51 +0100
Message-Id: <20191214220259.621996-10-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PCF8563_SC_LV means the voltage dropped too low and data has been lost.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8563.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 7fc43950cf6c..b282c6b07969 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -277,20 +277,16 @@ static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
 static int pcf8563_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	int vl, ret;
+	int ret;
 
 	switch (cmd) {
 	case RTC_VL_READ:
-
 		ret = i2c_smbus_read_byte_data(client, PCF8563_REG_SC);
 		if (ret < 0)
 			return ret;
 
-		vl = ret & PCF8563_SC_LV ? 1 : 0;
-
-		if (copy_to_user((void __user *)arg, &vl, sizeof(int)))
-			return -EFAULT;
-		return 0;
+		return put_user(ret & PCF8563_SC_LV ? RTC_VL_DATA_INVALID : 0,
+				(unsigned int __user *)arg);
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.23.0


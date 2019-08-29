Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A16DA28DC
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 23:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbfH2VZ7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 17:25:59 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36309 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728141AbfH2VZ7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 17:25:59 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 038ECC0008;
        Thu, 29 Aug 2019 21:25:57 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/5] rtc: pcf8563: remove useless indirection
Date:   Thu, 29 Aug 2019 23:25:46 +0200
Message-Id: <20190829212547.19185-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829212547.19185-1-alexandre.belloni@bootlin.com>
References: <20190829212547.19185-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

pcf8563_rtc_read_time and pcf8563_set_datetime are only used after casting
dev to an i2c_client. Remove that useless indirection.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8563.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 0e375e19c149..45462ec460a3 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -196,8 +196,9 @@ static irqreturn_t pcf8563_irq(int irq, void *dev_id)
  * In the routines that deal directly with the pcf8563 hardware, we use
  * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
  */
-static int pcf8563_get_datetime(struct i2c_client *client, struct rtc_time *tm)
+static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct pcf8563 *pcf8563 = i2c_get_clientdata(client);
 	unsigned char buf[9];
 	int err;
@@ -244,8 +245,9 @@ static int pcf8563_get_datetime(struct i2c_client *client, struct rtc_time *tm)
 	return 0;
 }
 
-static int pcf8563_set_datetime(struct i2c_client *client, struct rtc_time *tm)
+static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct pcf8563 *pcf8563 = i2c_get_clientdata(client);
 	unsigned char buf[9];
 
@@ -299,8 +301,8 @@ static int pcf8563_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long
 		 * because of the cached voltage_low value but do it
 		 * anyway for consistency.
 		 */
-		if (pcf8563_get_datetime(to_i2c_client(dev), &tm))
-			pcf8563_set_datetime(to_i2c_client(dev), &tm);
+		if (pcf8563_rtc_read_time(dev, &tm))
+			pcf8563_rtc_set_time(dev, &tm);
 
 		/* Clear the cached value. */
 		pcf8563->voltage_low = 0;
@@ -314,16 +316,6 @@ static int pcf8563_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long
 #define pcf8563_rtc_ioctl NULL
 #endif
 
-static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
-{
-	return pcf8563_get_datetime(to_i2c_client(dev), tm);
-}
-
-static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
-{
-	return pcf8563_set_datetime(to_i2c_client(dev), tm);
-}
-
 static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-- 
2.21.0


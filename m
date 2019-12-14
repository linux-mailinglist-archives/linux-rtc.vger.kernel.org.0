Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 555B511F46F
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfLNWDV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:21 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:51635 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLNWDK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:10 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E398440006;
        Sat, 14 Dec 2019 22:03:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 16/17] rtc: rx8010: remove RTC_VL_CLR handling
Date:   Sat, 14 Dec 2019 23:02:58 +0100
Message-Id: <20191214220259.621996-17-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove RTC_VL_CLR handling because it is a disservice to userspace as it
removes the important information that the RTC data is invalid. This may
lead userspace to set an invalid system time later on.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8010.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 8102469e27c0..9b106a26c64b 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -389,9 +389,8 @@ static int rx8010_alarm_irq_enable(struct device *dev,
 
 static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
-	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	int ret, tmp;
+	int tmp;
 	int flagreg;
 
 	switch (cmd) {
@@ -406,19 +405,6 @@ static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 
 		return 0;
 
-	case RTC_VL_CLR:
-		flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
-		if (flagreg < 0) {
-			return flagreg;
-		}
-
-		flagreg &= ~RX8010_FLAG_VLF;
-		ret = i2c_smbus_write_byte_data(client, RX8010_FLAG, flagreg);
-		if (ret < 0)
-			return ret;
-
-		return 0;
-
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.23.0


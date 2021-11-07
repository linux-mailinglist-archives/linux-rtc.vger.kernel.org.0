Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12C3447689
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236716AbhKGW56 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:58 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:33085 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236748AbhKGW5y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:54 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1658D240008;
        Sun,  7 Nov 2021 22:55:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] rtc: rx8025: clear RTC_FEATURE_ALARM when alarm are not supported
Date:   Sun,  7 Nov 2021 23:54:55 +0100
Message-Id: <20211107225458.111068-10-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Clear RTC_FEATURE_ALARM to signal alarms are not supported to the core
instead of checking client->irq.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8025.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index 6002305efa2d..fcfdefe94a7c 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -315,9 +315,6 @@ static int rx8025_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 ald[2];
 	int ctrl2, err;
 
-	if (client->irq <= 0)
-		return -EINVAL;
-
 	err = rx8025_read_regs(client, RX8025_REG_ALDMIN, 2, ald);
 	if (err)
 		return err;
@@ -352,9 +349,6 @@ static int rx8025_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 ald[2];
 	int err;
 
-	if (client->irq <= 0)
-		return -EINVAL;
-
 	ald[0] = bin2bcd(t->time.tm_min);
 	if (rx8025->ctrl1 & RX8025_BIT_CTRL1_1224)
 		ald[1] = bin2bcd(t->time.tm_hour);
@@ -559,10 +553,8 @@ static int rx8025_probe(struct i2c_client *client,
 						rx8025_handle_irq,
 						IRQF_ONESHOT,
 						"rx8025", client);
-		if (err) {
-			dev_err(&client->dev, "unable to request IRQ, alarms disabled\n");
-			client->irq = 0;
-		}
+		if (err)
+			clear_bit(RTC_FEATURE_ALARM, rx8025->rtc->features);
 	}
 
 	rx8025->rtc->max_user_freq = 1;
-- 
2.31.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9B4447693
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236739AbhKGW54 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:56 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41627 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236728AbhKGW5x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:53 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5EAE0240006;
        Sun,  7 Nov 2021 22:55:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] rtc: rx8025: let the core handle the alarm resolution
Date:   Sun,  7 Nov 2021 23:54:53 +0100
Message-Id: <20211107225458.111068-8-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Tell the RTC core UIE are not supported because the resolution of the alarm
is a minute.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8025.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index 617b044c66f0..6941e0518290 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -358,17 +358,6 @@ static int rx8025_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	if (client->irq <= 0)
 		return -EINVAL;
 
-	/*
-	 * Hardware alarm precision is 1 minute!
-	 * round up to nearest minute
-	 */
-	if (t->time.tm_sec) {
-		time64_t alarm_time = rtc_tm_to_time64(&t->time);
-
-		alarm_time += 60 - t->time.tm_sec;
-		rtc_time64_to_tm(alarm_time, &t->time);
-	}
-
 	ald[0] = bin2bcd(t->time.tm_min);
 	if (rx8025->ctrl1 & RX8025_BIT_CTRL1_1224)
 		ald[1] = bin2bcd(t->time.tm_hour);
@@ -579,8 +568,8 @@ static int rx8025_probe(struct i2c_client *client,
 
 	rx8025->rtc->max_user_freq = 1;
 
-	/* the rx8025 alarm only supports a minute accuracy */
-	rx8025->rtc->uie_unsupported = 1;
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rx8025->rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rx8025->rtc->features);
 
 	err = devm_rtc_register_device(rx8025->rtc);
 	if (err)
-- 
2.31.1


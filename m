Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D29447686
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhKGW5z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:55 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:59471 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236734AbhKGW5x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:53 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3D43D100005;
        Sun,  7 Nov 2021 22:55:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] rtc: rx8025: set range
Date:   Sun,  7 Nov 2021 23:54:54 +0100
Message-Id: <20211107225458.111068-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set the RTC range, it is a classic BCD RTC, with 00 being a leap
year. Let the core handle range checking.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8025.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index 6941e0518290..6002305efa2d 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -248,9 +248,6 @@ static int rx8025_set_time(struct device *dev, struct rtc_time *dt)
 	u8 date[7];
 	int ret;
 
-	if ((dt->tm_year < 100) || (dt->tm_year > 199))
-		return -EINVAL;
-
 	/*
 	 * Here the read-only bits are written as "0".  I'm not sure if that
 	 * is sound.
@@ -553,6 +550,8 @@ static int rx8025_probe(struct i2c_client *client,
 		return PTR_ERR(rx8025->rtc);
 
 	rx8025->rtc->ops = &rx8025_rtc_ops;
+	rx8025->rtc->range_min = RTC_TIMESTAMP_BEGIN_1900;
+	rx8025->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	if (client->irq > 0) {
 		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
-- 
2.31.1


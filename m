Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D5E44767E
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbhKGW5u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:50 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38465 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236701AbhKGW5s (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:48 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C3DD220007;
        Sun,  7 Nov 2021 22:55:03 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] rtc: rv3032: let the core handle the alarm resolution
Date:   Sun,  7 Nov 2021 23:54:48 +0100
Message-Id: <20211107225458.111068-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Let the RTC core know the resolution of the alarm is a minute.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3032.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index a3c73179ecb1..c3bee305eacc 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -311,14 +311,6 @@ static int rv3032_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	u8 ctrl = 0;
 	int ret;
 
-	/* The alarm has no seconds, round up to nearest minute */
-	if (alrm->time.tm_sec) {
-		time64_t alarm_time = rtc_tm_to_time64(&alrm->time);
-
-		alarm_time += 60 - alrm->time.tm_sec;
-		rtc_time64_to_tm(alarm_time, &alrm->time);
-	}
-
 	ret = regmap_update_bits(rv3032->regmap, RV3032_CTRL2,
 				 RV3032_CTRL2_AIE | RV3032_CTRL2_UIE, 0);
 	if (ret)
@@ -958,6 +950,7 @@ static int rv3032_probe(struct i2c_client *client)
 	rv3032_trickle_charger_setup(&client->dev, rv3032);
 
 	set_bit(RTC_FEATURE_BACKUP_SWITCH_MODE, rv3032->rtc->features);
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rv3032->rtc->features);
 
 	rv3032->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rv3032->rtc->range_max = RTC_TIMESTAMP_END_2099;
-- 
2.31.1


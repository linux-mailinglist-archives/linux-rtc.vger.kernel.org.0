Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789F744767C
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbhKGW5r (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:47 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:38065 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235137AbhKGW5r (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:47 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 039FD240005;
        Sun,  7 Nov 2021 22:55:02 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] rtc: s35390a: let the core handle the alarm resolution
Date:   Sun,  7 Nov 2021 23:54:47 +0100
Message-Id: <20211107225458.111068-2-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-s35390a.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index b5bdeda7d767..26278c770731 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -285,9 +285,6 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 		alm->time.tm_min, alm->time.tm_hour, alm->time.tm_mday,
 		alm->time.tm_mon, alm->time.tm_year, alm->time.tm_wday);
 
-	if (alm->time.tm_sec != 0)
-		dev_warn(&client->dev, "Alarms are only supported on a per minute basis!\n");
-
 	/* disable interrupt (which deasserts the irq line) */
 	err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(sts));
 	if (err < 0)
@@ -491,8 +488,8 @@ static int s35390a_probe(struct i2c_client *client,
 	s35390a->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	s35390a->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	/* supports per-minute alarms only, therefore set uie_unsupported */
-	s35390a->rtc->uie_unsupported = 1;
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, s35390a->rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, s35390a->rtc->features );
 
 	if (status1 & S35390A_FLAG_INT2)
 		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
-- 
2.31.1


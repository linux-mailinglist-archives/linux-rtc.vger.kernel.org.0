Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCEB44767B
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbhKGW5r (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:47 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54461 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbhKGW5r (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:47 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 25BAF20008;
        Sun,  7 Nov 2021 22:55:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] rtc: handle alarms with a minute resolution
Date:   Sun,  7 Nov 2021 23:54:46 +0100
Message-Id: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Handle alarms with a minute resolution in the core. Until now drivers have
been open coding the seconds part removal and have been doing that wrongly.
Most of them are rounding up which means the allow the system to miss
deadlines. So, round down and let __rtc_set_alarm return immediately if the
time has already passed.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/interface.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index d005623e6eb3..d8e835798153 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -423,6 +423,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	if (err)
 		return err;
 	now = rtc_tm_to_time64(&tm);
+
 	if (scheduled <= now)
 		return -ETIME;
 	/*
@@ -447,6 +448,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 
 int rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 {
+	ktime_t alarm_time;
 	int err;
 
 	if (!rtc->ops)
@@ -468,7 +470,15 @@ int rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	if (rtc->aie_timer.enabled)
 		rtc_timer_remove(rtc, &rtc->aie_timer);
 
-	rtc->aie_timer.node.expires = rtc_tm_to_ktime(alarm->time);
+	alarm_time = rtc_tm_to_ktime(alarm->time);
+	/*
+	 * Round down so we never miss a deadline, checking for past deadline is
+	 * done in __rtc_set_alarm
+	 */
+	if (test_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features))
+		alarm_time = ktime_sub_ns(alarm_time, (u64)alarm->time.tm_sec * NSEC_PER_SEC);
+
+	rtc->aie_timer.node.expires = alarm_time;
 	rtc->aie_timer.period = 0;
 	if (alarm->enabled)
 		err = rtc_timer_enqueue(rtc, &rtc->aie_timer);
-- 
2.31.1


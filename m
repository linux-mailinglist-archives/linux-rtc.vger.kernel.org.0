Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078E5DE10B
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 01:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfJTXN0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Oct 2019 19:13:26 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:57447 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfJTXN0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Oct 2019 19:13:26 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6B16040003;
        Sun, 20 Oct 2019 23:13:23 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        syzbot+08116743f8ad6f9a6de7@syzkaller.appspotmail.com
Subject: [PATCH] rtc: disable uie before setting time and enable after
Date:   Mon, 21 Oct 2019 01:13:20 +0200
Message-Id: <20191020231320.8191-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When setting the time in the future with the uie timer enabled,
rtc_timer_do_work will loop for a while because the expiration of the uie
timer was way before the current RTC time and a new timer will be enqueued
until the current rtc time is reached.

If the uie timer is enabled, disable it before setting the time and enable
it after expiring current timers (which may actually be an alarm).

This is the safest thing to do to ensure the uie timer is still
synchronized with the RTC, especially in the UIE emulation case.

Reported-by: syzbot+08116743f8ad6f9a6de7@syzkaller.appspotmail.com
Fixes: 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events")
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/interface.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index eea700723976..f8b7c004d6ec 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -125,7 +125,7 @@ EXPORT_SYMBOL_GPL(rtc_read_time);
 
 int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 {
-	int err;
+	int err, uie;
 
 	err = rtc_valid_tm(tm);
 	if (err != 0)
@@ -137,6 +137,17 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 
 	rtc_subtract_offset(rtc, tm);
 
+#ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
+	uie = rtc->uie_rtctimer.enabled || rtc->uie_irq_active;
+#else
+	uie = rtc->uie_rtctimer.enabled;
+#endif
+	if (uie) {
+		err = rtc_update_irq_enable(rtc, 0);
+		if (err)
+			return err;
+	}
+
 	err = mutex_lock_interruptible(&rtc->ops_lock);
 	if (err)
 		return err;
@@ -153,6 +164,12 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 	/* A timer might have just expired */
 	schedule_work(&rtc->irqwork);
 
+	if (uie) {
+		err = rtc_update_irq_enable(rtc, 1);
+		if (err)
+			return err;
+	}
+
 	trace_rtc_set_time(rtc_tm_to_time64(tm), err);
 	return err;
 }
-- 
2.21.0


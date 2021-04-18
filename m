Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41743632BF
	for <lists+linux-rtc@lfdr.de>; Sun, 18 Apr 2021 02:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236181AbhDRABB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 17 Apr 2021 20:01:01 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57835 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235843AbhDRAA6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 17 Apr 2021 20:00:58 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4A3B3C0004;
        Sun, 18 Apr 2021 00:00:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] rtc: rtc_update_irq_enable: rework UIE emulation
Date:   Sun, 18 Apr 2021 02:00:23 +0200
Message-Id: <20210418000023.995758-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210418000023.995758-1-alexandre.belloni@bootlin.com>
References: <20210418000023.995758-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Now that the core is aware of whether alarms are available, it is possible
to decide whether UIE emulation is required before actually trying to set
the alarm.

This greatly simplifies rtc_update_irq_enable because there is now only one
error value to track and is not relying on the return value of
__rtc_set_alarm anymore.

Tested-by: Łukasz Stelmach <l.stelmach@samsung.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Changes in v2:
 - Fix possible deadlock when using UIE emulation (no impact on Łukasz' test)
 - Remove rc

 drivers/rtc/interface.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index dcb34c73319e..9a2bd4947007 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -545,7 +545,7 @@ EXPORT_SYMBOL_GPL(rtc_alarm_irq_enable);
 
 int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 {
-	int rc = 0, err;
+	int err;
 
 	err = mutex_lock_interruptible(&rtc->ops_lock);
 	if (err)
@@ -561,17 +561,21 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 	if (rtc->uie_rtctimer.enabled == enabled)
 		goto out;
 
-	if (rtc->uie_unsupported) {
-		err = -EINVAL;
-		goto out;
+	if (rtc->uie_unsupported || !test_bit(RTC_FEATURE_ALARM, rtc->features)) {
+		mutex_unlock(&rtc->ops_lock);
+#ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
+		return rtc_dev_update_irq_enable_emul(rtc, enabled);
+#else
+		return -EINVAL;
+#endif
 	}
 
 	if (enabled) {
 		struct rtc_time tm;
 		ktime_t now, onesec;
 
-		rc = __rtc_read_time(rtc, &tm);
-		if (rc)
+		err = __rtc_read_time(rtc, &tm);
+		if (err)
 			goto out;
 		onesec = ktime_set(1, 0);
 		now = rtc_tm_to_ktime(tm);
@@ -585,24 +589,6 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 out:
 	mutex_unlock(&rtc->ops_lock);
 
-	/*
-	 * __rtc_read_time() failed, this probably means that the RTC time has
-	 * never been set or less probably there is a transient error on the
-	 * bus. In any case, avoid enabling emulation has this will fail when
-	 * reading the time too.
-	 */
-	if (rc)
-		return rc;
-
-#ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
-	/*
-	 * Enable emulation if the driver returned -EINVAL to signal that it has
-	 * been configured without interrupts or they are not available at the
-	 * moment.
-	 */
-	if (err == -EINVAL)
-		err = rtc_dev_update_irq_enable_emul(rtc, enabled);
-#endif
 	return err;
 }
 EXPORT_SYMBOL_GPL(rtc_update_irq_enable);
-- 
2.30.2


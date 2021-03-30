Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CA934DCC5
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Mar 2021 02:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhC3AEG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Mar 2021 20:04:06 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35151 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbhC3AEA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Mar 2021 20:04:00 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BCE91C0003;
        Tue, 30 Mar 2021 00:03:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     linux-rtc@vger.kernel.org,
        =?UTF-8?q?Bart=C5=82omiej=20=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/3] rtc: rtc_update_irq_enable: rework UIE emulation
Date:   Tue, 30 Mar 2021 02:03:43 +0200
Message-Id: <20210330000343.801566-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330000343.801566-1-alexandre.belloni@bootlin.com>
References: <YGJqfVFVb7Z1LBTu@piout.net>
 <20210330000343.801566-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
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

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/interface.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index dcb34c73319e..b162964d2b39 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -561,8 +561,12 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 	if (rtc->uie_rtctimer.enabled == enabled)
 		goto out;
 
-	if (rtc->uie_unsupported) {
+	if (rtc->uie_unsupported || !test_bit(RTC_FEATURE_ALARM, rtc->features)) {
+#ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
+		err = rtc_dev_update_irq_enable_emul(rtc, enabled);
+#else
 		err = -EINVAL;
+#endif
 		goto out;
 	}
 
@@ -570,8 +574,8 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
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


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39983DF221
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 17:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbfJUP4h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 11:56:37 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44861 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbfJUP4h (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 11:56:37 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B013660002;
        Mon, 21 Oct 2019 15:56:35 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: disallow update interrupts when time is invalid
Date:   Mon, 21 Oct 2019 17:56:31 +0200
Message-Id: <20191021155631.3342-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191021155631.3342-1-alexandre.belloni@bootlin.com>
References: <20191021155631.3342-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Never enable update interrupts when the time set on the rtc is invalid.
In that case, also avoid enabling the emulation because it will fail for
the same reason.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/interface.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index f8b7c004d6ec..bd8034b7bc93 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -545,7 +545,7 @@ EXPORT_SYMBOL_GPL(rtc_alarm_irq_enable);
 
 int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 {
-	int err;
+	int rc = 0, err;
 
 	err = mutex_lock_interruptible(&rtc->ops_lock);
 	if (err)
@@ -570,7 +570,9 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 		struct rtc_time tm;
 		ktime_t now, onesec;
 
-		__rtc_read_time(rtc, &tm);
+		rc = __rtc_read_time(rtc, &tm);
+		if (rc)
+			goto out;
 		onesec = ktime_set(1, 0);
 		now = rtc_tm_to_ktime(tm);
 		rtc->uie_rtctimer.node.expires = ktime_add(now, onesec);
@@ -582,6 +584,16 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 
 out:
 	mutex_unlock(&rtc->ops_lock);
+
+	/*
+	 * __rtc_read_time() failed, this probably means that the RTC time has
+	 * never been set or less probably there is a transient error on the
+	 * bus. In any case, avoid enabling emulation has this will fail when
+	 * reading the time too.
+	 */
+	if (rc)
+		return rc;
+
 #ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
 	/*
 	 * Enable emulation if the driver returned -EINVAL to signal that it has
-- 
2.21.0


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2080F4322C5
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbhJRPZw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:25:52 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:58753 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232818AbhJRPZw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:25:52 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8C0841BF218;
        Mon, 18 Oct 2021 15:23:39 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: expose RTC_FEATURE_UPDATE_INTERRUPT
Date:   Mon, 18 Oct 2021 17:23:36 +0200
Message-Id: <20211018152337.78732-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set RTC_FEATURE_UPDATE_INTERRUPT by default and clear it when it is not
supported.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/class.c     | 4 ++++
 drivers/rtc/interface.c | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 2e0cbc190a8a..4b460c61f1d8 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -232,6 +232,7 @@ static struct rtc_device *rtc_allocate_device(void)
 	rtc->pie_enabled = 0;
 
 	set_bit(RTC_FEATURE_ALARM, rtc->features);
+	set_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
 	return rtc;
 }
@@ -389,6 +390,9 @@ int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
 	if (!rtc->ops->set_alarm)
 		clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
+	if (rtc->uie_unsupported)
+		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
+
 	if (rtc->ops->set_offset)
 		set_bit(RTC_FEATURE_CORRECTION, rtc->features);
 
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 9a2bd4947007..d005623e6eb3 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -561,7 +561,8 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 	if (rtc->uie_rtctimer.enabled == enabled)
 		goto out;
 
-	if (rtc->uie_unsupported || !test_bit(RTC_FEATURE_ALARM, rtc->features)) {
+	if (!test_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features) ||
+	    !test_bit(RTC_FEATURE_ALARM, rtc->features)) {
 		mutex_unlock(&rtc->ops_lock);
 #ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
 		return rtc_dev_update_irq_enable_emul(rtc, enabled);
-- 
2.31.1


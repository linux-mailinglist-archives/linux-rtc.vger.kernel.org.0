Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23CB82F0A40
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbhAJXSr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:18:47 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:45681 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbhAJXSq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:18:46 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B812420004;
        Sun, 10 Jan 2021 23:18:02 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/17] rtc: introduce features bitfield
Date:   Mon, 11 Jan 2021 00:17:36 +0100
Message-Id: <20210110231752.1418816-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Introduce a bitfield to allow the drivers to announce the available
features for an RTC.

The main use case would be to better handle alarms, that could be present
or not or have a minute resolution or may need a correct week day to be set.

Use the newly introduced RTC_FEATURE_ALARM bit to then test whether alarms
are available instead of relying on the presence of ops->set_alarm.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/class.c      |  5 +++++
 drivers/rtc/interface.c  | 12 ++++++------
 include/linux/rtc.h      |  2 ++
 include/uapi/linux/rtc.h |  5 +++++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 7e470fbd5e4d..03abd0aa229a 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -231,6 +231,8 @@ static struct rtc_device *rtc_allocate_device(void)
 	rtc->pie_timer.function = rtc_pie_update_irq;
 	rtc->pie_enabled = 0;
 
+	set_bit(RTC_FEATURE_ALARM, rtc->features);
+
 	return rtc;
 }
 
@@ -386,6 +388,9 @@ int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
 		return -EINVAL;
 	}
 
+	if (!rtc->ops->set_alarm)
+		clear_bit(RTC_FEATURE_ALARM, rtc->features);
+
 	rtc->owner = owner;
 	rtc_device_get_offset(rtc);
 
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 794a4f036b99..dcb34c73319e 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -186,7 +186,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 
 	if (!rtc->ops) {
 		err = -ENODEV;
-	} else if (!rtc->ops->read_alarm) {
+	} else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->read_alarm) {
 		err = -EINVAL;
 	} else {
 		alarm->enabled = 0;
@@ -392,7 +392,7 @@ int rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 		return err;
 	if (!rtc->ops) {
 		err = -ENODEV;
-	} else if (!rtc->ops->read_alarm) {
+	} else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->read_alarm) {
 		err = -EINVAL;
 	} else {
 		memset(alarm, 0, sizeof(struct rtc_wkalrm));
@@ -436,7 +436,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 
 	if (!rtc->ops)
 		err = -ENODEV;
-	else if (!rtc->ops->set_alarm)
+	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
 		err = -EINVAL;
 	else
 		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
@@ -451,7 +451,7 @@ int rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 
 	if (!rtc->ops)
 		return -ENODEV;
-	else if (!rtc->ops->set_alarm)
+	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
 		return -EINVAL;
 
 	err = rtc_valid_tm(&alarm->time);
@@ -531,7 +531,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 		/* nothing */;
 	else if (!rtc->ops)
 		err = -ENODEV;
-	else if (!rtc->ops->alarm_irq_enable)
+	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		err = -EINVAL;
 	else
 		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
@@ -843,7 +843,7 @@ static int rtc_timer_enqueue(struct rtc_device *rtc, struct rtc_timer *timer)
 
 static void rtc_alarm_disable(struct rtc_device *rtc)
 {
-	if (!rtc->ops || !rtc->ops->alarm_irq_enable)
+	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		return;
 
 	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 568909449c13..bd611e26291d 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -141,6 +141,8 @@ struct rtc_device {
 	 */
 	unsigned long set_offset_nsec;
 
+	unsigned long features[BITS_TO_LONGS(RTC_FEATURE_CNT)];
+
 	time64_t range_min;
 	timeu64_t range_max;
 	time64_t start_secs;
diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index fa9aff91cbf2..f950bff75e97 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -110,6 +110,11 @@ struct rtc_pll_info {
 #define RTC_AF 0x20	/* Alarm interrupt */
 #define RTC_UF 0x10	/* Update interrupt for 1Hz RTC */
 
+/* feature list */
+#define RTC_FEATURE_ALARM		0
+#define RTC_FEATURE_ALARM_RES_MINUTE	1
+#define RTC_FEATURE_NEED_WEEK_DAY	2
+#define RTC_FEATURE_CNT			3
 
 #define RTC_MAX_FREQ	8192
 
-- 
2.29.2


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 398C710ABB8
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2019 09:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfK0I3j (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Nov 2019 03:29:39 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:39463 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfK0I3j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Nov 2019 03:29:39 -0500
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 93296240007;
        Wed, 27 Nov 2019 08:29:36 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: interface fix kerneldoc comments
Date:   Wed, 27 Nov 2019 09:29:32 +0100
Message-Id: <20191127082932.666869-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix kerneldoc warnings:

drivers/rtc/interface.c:619: warning: Function parameter or member 'num' not described in 'rtc_handle_legacy_irq'
drivers/rtc/interface.c:619: warning: Function parameter or member 'mode' not described in 'rtc_handle_legacy_irq'
drivers/rtc/interface.c:804: warning: Function parameter or member 'rtc' not described in 'rtc_timer_enqueue'
drivers/rtc/interface.c:804: warning: Function parameter or member 'timer' not described in 'rtc_timer_enqueue'
drivers/rtc/interface.c:864: warning: Function parameter or member 'rtc' not described in 'rtc_timer_remove'
drivers/rtc/interface.c:864: warning: Function parameter or member 'timer' not described in 'rtc_timer_remove'
drivers/rtc/interface.c:900: warning: Function parameter or member 'work' not described in 'rtc_timer_do_work'
drivers/rtc/interface.c:1035: warning: Function parameter or member 'rtc' not described in 'rtc_read_offset'
drivers/rtc/interface.c:1035: warning: Function parameter or member 'offset' not described in 'rtc_read_offset'
drivers/rtc/interface.c:1070: warning: Function parameter or member 'rtc' not described in 'rtc_set_offset'
drivers/rtc/interface.c:1070: warning: Function parameter or member 'offset' not described in 'rtc_set_offset'

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/interface.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index bd8034b7bc93..794a4f036b99 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -610,6 +610,8 @@ EXPORT_SYMBOL_GPL(rtc_update_irq_enable);
 /**
  * rtc_handle_legacy_irq - AIE, UIE and PIE event hook
  * @rtc: pointer to the rtc device
+ * @num: number of occurence of the event
+ * @mode: type of the event, RTC_AF, RTC_UF of RTC_PF
  *
  * This function is called when an AIE, UIE or PIE mode interrupt
  * has occurred (or been emulated).
@@ -790,8 +792,8 @@ int rtc_irq_set_freq(struct rtc_device *rtc, int freq)
 
 /**
  * rtc_timer_enqueue - Adds a rtc_timer to the rtc_device timerqueue
- * @rtc rtc device
- * @timer timer being added.
+ * @rtc: rtc device
+ * @timer: timer being added.
  *
  * Enqueues a timer onto the rtc devices timerqueue and sets
  * the next alarm event appropriately.
@@ -850,8 +852,8 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
 
 /**
  * rtc_timer_remove - Removes a rtc_timer from the rtc_device timerqueue
- * @rtc rtc device
- * @timer timer being removed.
+ * @rtc: rtc device
+ * @timer: timer being removed.
  *
  * Removes a timer onto the rtc devices timerqueue and sets
  * the next alarm event appropriately.
@@ -888,8 +890,7 @@ static void rtc_timer_remove(struct rtc_device *rtc, struct rtc_timer *timer)
 
 /**
  * rtc_timer_do_work - Expires rtc timers
- * @rtc rtc device
- * @timer timer being removed.
+ * @work: work item
  *
  * Expires rtc timers. Reprograms next alarm event if needed.
  * Called via worktask.
@@ -1022,8 +1023,8 @@ void rtc_timer_cancel(struct rtc_device *rtc, struct rtc_timer *timer)
 
 /**
  * rtc_read_offset - Read the amount of rtc offset in parts per billion
- * @ rtc: rtc device to be used
- * @ offset: the offset in parts per billion
+ * @rtc: rtc device to be used
+ * @offset: the offset in parts per billion
  *
  * see below for details.
  *
@@ -1051,8 +1052,8 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
 
 /**
  * rtc_set_offset - Adjusts the duration of the average second
- * @ rtc: rtc device to be used
- * @ offset: the offset in parts per billion
+ * @rtc: rtc device to be used
+ * @offset: the offset in parts per billion
  *
  * Some rtc's allow an adjustment to the average duration of a second
  * to compensate for differences in the actual clock rate due to temperature,
-- 
2.23.0


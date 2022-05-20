Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44E5152EE47
	for <lists+linux-rtc@lfdr.de>; Fri, 20 May 2022 16:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbiETOeS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 20 May 2022 10:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350398AbiETOeR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 20 May 2022 10:34:17 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DBC170F36
        for <linux-rtc@vger.kernel.org>; Fri, 20 May 2022 07:34:14 -0700 (PDT)
Received: from fsav111.sakura.ne.jp (fsav111.sakura.ne.jp [27.133.134.238])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 24KEXvxJ018150;
        Fri, 20 May 2022 23:33:57 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav111.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav111.sakura.ne.jp);
 Fri, 20 May 2022 23:33:57 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav111.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 24KEXvEW018147
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 20 May 2022 23:33:57 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <ef8d46a0-bef8-f747-8f13-7ad4ec514cbf@I-love.SAKURA.ne.jp>
Date:   Fri, 20 May 2022 23:33:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: [PATCH v3] rtc: Avoid flush_scheduled_work() usage
Content-Language: en-US
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
References: <febf3af2-ba49-fa40-4a25-e67b743cc421@I-love.SAKURA.ne.jp>
 <c96ea697-b4ea-7e34-1a6f-355561fb7e58@I-love.SAKURA.ne.jp>
In-Reply-To: <c96ea697-b4ea-7e34-1a6f-355561fb7e58@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Flushing system-wide workqueues is dangerous and will be forbidden.
Replace system_wq with local rtc_wq.

While we are at it, remove unused rtc_dev_exit().

Link: https://lkml.kernel.org/r/49925af7-78a8-a3dd-bce6-cfc02e1a9236@I-love.SAKURA.ne.jp
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Changes in v3:
  Fix build error.
  Forgot to replace flush_scheduled_work().

Changes in v2:
  Remove unused rtc_dev_exit().

Since rtc_dev_init() is built into vmlinux, there is no point with
recovery.

This patch blindly converts schedule_work() into queue_work() within
drivers/rtc/dev.c, based on an assumption that none of work items
outside of drivers/rtc/dev.c needs to be handled by rtc_wq.
Did I convert correctly?

 drivers/rtc/dev.c      | 18 ++++++++----------
 drivers/rtc/rtc-core.h |  5 -----
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index 69325aeede1a..a7346f03a5b2 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -17,6 +17,7 @@
 #include "rtc-core.h"
 
 static dev_t rtc_devt;
+static struct workqueue_struct *rtc_wq;
 
 #define RTC_DEV_MAX 16 /* 16 RTCs should be enough for everyone... */
 
@@ -62,7 +63,7 @@ static void rtc_uie_task(struct work_struct *work)
 		rtc->uie_timer_active = 1;
 		rtc->uie_task_active = 0;
 		add_timer(&rtc->uie_timer);
-	} else if (schedule_work(&rtc->uie_task) == 0) {
+	} else if (queue_work(rtc_wq, &rtc->uie_task) == 0) {
 		rtc->uie_task_active = 0;
 	}
 	spin_unlock_irq(&rtc->irq_lock);
@@ -78,7 +79,7 @@ static void rtc_uie_timer(struct timer_list *t)
 	spin_lock_irqsave(&rtc->irq_lock, flags);
 	rtc->uie_timer_active = 0;
 	rtc->uie_task_active = 1;
-	if ((schedule_work(&rtc->uie_task) == 0))
+	if (queue_work(rtc_wq, &rtc->uie_task) == 0)
 		rtc->uie_task_active = 0;
 	spin_unlock_irqrestore(&rtc->irq_lock, flags);
 }
@@ -96,7 +97,7 @@ static int clear_uie(struct rtc_device *rtc)
 		}
 		if (rtc->uie_task_active) {
 			spin_unlock_irq(&rtc->irq_lock);
-			flush_scheduled_work();
+			flush_workqueue(rtc_wq);
 			spin_lock_irq(&rtc->irq_lock);
 		}
 		rtc->uie_irq_active = 0;
@@ -119,7 +120,7 @@ static int set_uie(struct rtc_device *rtc)
 		rtc->stop_uie_polling = 0;
 		rtc->oldsecs = tm.tm_sec;
 		rtc->uie_task_active = 1;
-		if (schedule_work(&rtc->uie_task) == 0)
+		if (queue_work(rtc_wq, &rtc->uie_task) == 0)
 			rtc->uie_task_active = 0;
 	}
 	rtc->irq_data = 0;
@@ -562,13 +563,10 @@ void __init rtc_dev_init(void)
 {
 	int err;
 
+	rtc_wq = alloc_workqueue("rtc_wq", 0, 0);
+	BUG_ON(!rtc_wq);
+
 	err = alloc_chrdev_region(&rtc_devt, 0, RTC_DEV_MAX, "rtc");
 	if (err < 0)
 		pr_err("failed to allocate char dev region\n");
 }
-
-void __exit rtc_dev_exit(void)
-{
-	if (rtc_devt)
-		unregister_chrdev_region(rtc_devt, RTC_DEV_MAX);
-}
diff --git a/drivers/rtc/rtc-core.h b/drivers/rtc/rtc-core.h
index 0abf98983e13..4b10a1b8f370 100644
--- a/drivers/rtc/rtc-core.h
+++ b/drivers/rtc/rtc-core.h
@@ -2,7 +2,6 @@
 #ifdef CONFIG_RTC_INTF_DEV
 
 extern void __init rtc_dev_init(void);
-extern void __exit rtc_dev_exit(void);
 extern void rtc_dev_prepare(struct rtc_device *rtc);
 
 #else
@@ -11,10 +10,6 @@ static inline void rtc_dev_init(void)
 {
 }
 
-static inline void rtc_dev_exit(void)
-{
-}
-
 static inline void rtc_dev_prepare(struct rtc_device *rtc)
 {
 }
-- 
2.34.1



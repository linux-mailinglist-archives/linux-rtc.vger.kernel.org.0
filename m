Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8542B507078
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Apr 2022 16:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347832AbiDSObG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Apr 2022 10:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351582AbiDSOa7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Apr 2022 10:30:59 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C958E0CF
        for <linux-rtc@vger.kernel.org>; Tue, 19 Apr 2022 07:28:16 -0700 (PDT)
Received: from fsav113.sakura.ne.jp (fsav113.sakura.ne.jp [27.133.134.240])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 23JES0Lr071504;
        Tue, 19 Apr 2022 23:28:00 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav113.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp);
 Tue, 19 Apr 2022 23:28:00 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 23JES0p5071501
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 19 Apr 2022 23:28:00 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <febf3af2-ba49-fa40-4a25-e67b743cc421@I-love.SAKURA.ne.jp>
Date:   Tue, 19 Apr 2022 23:27:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] rtc: Avoid flush_scheduled_work() usage
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

Link: https://lkml.kernel.org/r/49925af7-78a8-a3dd-bce6-cfc02e1a9236@I-love.SAKURA.ne.jp
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
This patch blindly converts schedule_work() into queue_work() within
drivers/rtc/dev.c, based on an assumption that none of work items
outside of drivers/rtc/dev.c needs to be handled by rtc_wq.
Did I convert correctly? Or, do you want to share this rtc_wq with
drivers/rtc/{interface,rtc-88pm860x,rtc-ds1305,rtc-ds1374.c,rtc-imxdi}.c ?

 drivers/rtc/dev.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index 69325aeede1a..a4a63fc5165f 100644
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
+	if (queue_work(rtc_eq, &rtc->uie_task) == 0)
 		rtc->uie_task_active = 0;
 	spin_unlock_irqrestore(&rtc->irq_lock, flags);
 }
@@ -119,7 +120,7 @@ static int set_uie(struct rtc_device *rtc)
 		rtc->stop_uie_polling = 0;
 		rtc->oldsecs = tm.tm_sec;
 		rtc->uie_task_active = 1;
-		if (schedule_work(&rtc->uie_task) == 0)
+		if (queue_work(rtc_wq, &rtc->uie_task) == 0)
 			rtc->uie_task_active = 0;
 	}
 	rtc->irq_data = 0;
@@ -562,6 +563,9 @@ void __init rtc_dev_init(void)
 {
 	int err;
 
+	rtc_wq = alloc_workqueue("rtc_wq", 0, 0);
+	BUG_ON(!rtc_wq);
+
 	err = alloc_chrdev_region(&rtc_devt, 0, RTC_DEV_MAX, "rtc");
 	if (err < 0)
 		pr_err("failed to allocate char dev region\n");
@@ -571,4 +575,5 @@ void __exit rtc_dev_exit(void)
 {
 	if (rtc_devt)
 		unregister_chrdev_region(rtc_devt, RTC_DEV_MAX);
+	destroy_workqueue(rtc_wq);
 }
-- 
2.32.0

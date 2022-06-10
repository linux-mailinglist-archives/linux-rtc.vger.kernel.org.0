Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A2B5464A1
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jun 2022 12:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345227AbiFJKwt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Jun 2022 06:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344113AbiFJKw0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Jun 2022 06:52:26 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AB030546F
        for <linux-rtc@vger.kernel.org>; Fri, 10 Jun 2022 03:49:01 -0700 (PDT)
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25AAmeRP004665;
        Fri, 10 Jun 2022 19:48:40 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Fri, 10 Jun 2022 19:48:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25AAmdfi004659
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 10 Jun 2022 19:48:40 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <8d3a0f55-d861-ba93-0d25-b1172eaa8343@I-love.SAKURA.ne.jp>
Date:   Fri, 10 Jun 2022 19:48:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v4] rtc: Replace flush_scheduled_work() with flush_work().
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-rtc@vger.kernel.org
References: <febf3af2-ba49-fa40-4a25-e67b743cc421@I-love.SAKURA.ne.jp>
 <c96ea697-b4ea-7e34-1a6f-355561fb7e58@I-love.SAKURA.ne.jp>
 <ef8d46a0-bef8-f747-8f13-7ad4ec514cbf@I-love.SAKURA.ne.jp>
 <Yoe/oPW8MFZ02fEn@mail.local>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Yoe/oPW8MFZ02fEn@mail.local>
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

Since "struct rtc_device" is per a device struct, I assume that clear_uie()
needs to wait for only one work associated with that device. Therefore,
wait for only that work using flush_work().

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
using a macro") for background.

Changes in v4:
  Use flush_work() instead of introducing a dedicated WQ.

 drivers/rtc/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index 69325aeede1a..5cf90daf975c 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -96,7 +96,7 @@ static int clear_uie(struct rtc_device *rtc)
 		}
 		if (rtc->uie_task_active) {
 			spin_unlock_irq(&rtc->irq_lock);
-			flush_scheduled_work();
+			flush_work(&rtc->uie_task);
 			spin_lock_irq(&rtc->irq_lock);
 		}
 		rtc->uie_irq_active = 0;
-- 
2.18.4



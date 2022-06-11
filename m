Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F5E5475AC
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jun 2022 16:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbiFKOjQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 11 Jun 2022 10:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235409AbiFKOjP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 11 Jun 2022 10:39:15 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B39663B5
        for <linux-rtc@vger.kernel.org>; Sat, 11 Jun 2022 07:39:13 -0700 (PDT)
Received: from fsav115.sakura.ne.jp (fsav115.sakura.ne.jp [27.133.134.242])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25BEcqPk002527;
        Sat, 11 Jun 2022 23:38:52 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav115.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav115.sakura.ne.jp);
 Sat, 11 Jun 2022 23:38:52 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav115.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25BEcmth002433
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 11 Jun 2022 23:38:51 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <1e2f9a99-435d-e149-7456-dfacd53be85a@I-love.SAKURA.ne.jp>
Date:   Sat, 11 Jun 2022 23:38:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] rtc: Remove unused rtc_dev_exit().
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

Commit 270a3bd6bdc21407 ("rtc: make class.c explicitly non-modular")
removed rtc_dev_exit() call.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/rtc/dev.c      | 6 ------
 drivers/rtc/rtc-core.h | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index 5cf90daf975c..4aad9bb99868 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -566,9 +566,3 @@ void __init rtc_dev_init(void)
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
2.18.4


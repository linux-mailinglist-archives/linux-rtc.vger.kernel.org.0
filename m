Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA8F4E83DD
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Mar 2022 20:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbiCZToW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 26 Mar 2022 15:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbiCZToW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 26 Mar 2022 15:44:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 70FE418C0F5
        for <linux-rtc@vger.kernel.org>; Sat, 26 Mar 2022 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648323764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=azqELzyuB9oAQJF0V0iHBM8V3/Uqnp5/jPCm+apduZM=;
        b=DoEtQKvtRqfqncKmnTegJCp7piAr03r8WqWHFkQFGKHNiFmK5vkN9xq7PZBUIgPUwK9xUB
        PJdk+TdIr3JuwkIb7ogtGNLnqCGP80zxIIACpJQv9I3Q3UgXqeFcIKJLQADHLstBCkTURm
        juKDVd5aujnMfivzIkecL8sJgNAEUlA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-zeevTotgPJegZJmUVwzWtg-1; Sat, 26 Mar 2022 15:42:43 -0400
X-MC-Unique: zeevTotgPJegZJmUVwzWtg-1
Received: by mail-qv1-f71.google.com with SMTP id z1-20020ad44781000000b00440ded04b09so8339979qvy.22
        for <linux-rtc@vger.kernel.org>; Sat, 26 Mar 2022 12:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=azqELzyuB9oAQJF0V0iHBM8V3/Uqnp5/jPCm+apduZM=;
        b=b/cH1WuQVqroqQLh6K7C89xMTbSihrody6o8ReMqbZqPLfdi7AW9n6Mu3pGbBzh9rO
         xPAlgbelpc7oB6qwEsfJodNRqyRdRunxgg2SOpU40moduZstZWJCSNwhJPA0qiq110g4
         udNKda/CEYried+zvLu4Omwz06C1LMtMJ3xWKF/sW1EsEl2OL/AP0MBg1ipaUcdszQHK
         lZRhz5YSNt9xlwwlMvBU42YyKmrPGZxPWzBung0HfnYtpaz2c4k4KryISt7Ww30X+Qna
         NC3F9+Ovr1MBxFbYAEE2JQzRZmDM2g4SPHgD4YUH4MPWI6EP75ZhdDCYyudpjvDdBjDh
         NeVg==
X-Gm-Message-State: AOAM532jxdoQFlowKleoCR9aPKcSC5EYGDRMtcn93RhZJix9SXcQ5h7s
        5N1P5oqSFsMYXBmFDhqZnirxBgiqduX3aiiVa/mci8OMJnOKVJB0PIW87Uu/RofB1x9C+bMzr58
        9EDIKLm59L+WjwtzQvKyx
X-Received: by 2002:a05:622a:2d5:b0:2e1:ea60:231 with SMTP id a21-20020a05622a02d500b002e1ea600231mr14957962qtx.460.1648323762249;
        Sat, 26 Mar 2022 12:42:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiZjr3dpr/uR4Z7rNTTcx8g6KNr+3tArsL6c+HPu5J7FXrCb3tFzBBP0gPo+UTDziqlHWPdA==
X-Received: by 2002:a05:622a:2d5:b0:2e1:ea60:231 with SMTP id a21-20020a05622a02d500b002e1ea600231mr14957948qtx.460.1648323762064;
        Sat, 26 Mar 2022 12:42:42 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id x19-20020a05622a001300b002e1e78062e3sm7741250qtw.84.2022.03.26.12.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 12:42:41 -0700 (PDT)
From:   trix@redhat.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        nathan@kernel.org, ndesaulniers@google.com, colin.king@intel.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] rtc: check if __rtc_read_time was successful
Date:   Sat, 26 Mar 2022 12:42:36 -0700
Message-Id: <20220326194236.2916310-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this issue
interface.c:810:8: warning: Passed-by-value struct
  argument contains uninitialized data
  now = rtc_tm_to_ktime(tm);
      ^~~~~~~~~~~~~~~~~~~

tm is set by a successful call to __rtc_read_time()
but its return status is not checked.  Check if
it was successful before setting the enabled flag.
Move the decl of err to function scope.

Fixes: 2b2f5ff00f63 ("rtc: interface: ignore expired timers when enqueuing new timers")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/rtc/interface.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index d8e8357981537..9edd662c69ace 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -804,9 +804,13 @@ static int rtc_timer_enqueue(struct rtc_device *rtc, struct rtc_timer *timer)
 	struct timerqueue_node *next = timerqueue_getnext(&rtc->timerqueue);
 	struct rtc_time tm;
 	ktime_t now;
+	int err;
+
+	err = __rtc_read_time(rtc, &tm);
+	if (err)
+		return err;
 
 	timer->enabled = 1;
-	__rtc_read_time(rtc, &tm);
 	now = rtc_tm_to_ktime(tm);
 
 	/* Skip over expired timers */
@@ -820,7 +824,6 @@ static int rtc_timer_enqueue(struct rtc_device *rtc, struct rtc_timer *timer)
 	trace_rtc_timer_enqueue(timer);
 	if (!next || ktime_before(timer->node.expires, next->expires)) {
 		struct rtc_wkalrm alarm;
-		int err;
 
 		alarm.time = rtc_ktime_to_tm(timer->node.expires);
 		alarm.enabled = 1;
-- 
2.26.3


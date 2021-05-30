Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCD0394EEC
	for <lists+linux-rtc@lfdr.de>; Sun, 30 May 2021 03:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhE3Bd6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 29 May 2021 21:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhE3Bd5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 29 May 2021 21:33:57 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93695C061574;
        Sat, 29 May 2021 18:32:19 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so6657092wmf.5;
        Sat, 29 May 2021 18:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gXcCWrrWHs2bkxsocMZtybfh3Gg6Pejim2D3Yr9lwOk=;
        b=ZXnM4qMyQ/mYp2Ej6piF9KuAQ9JY6Ak2YJrHyzj8q7+rWSibttN5tPkwB8NJzK54sE
         sQx0qvttUQSHanr5vqyCCtj/z4mOds99uJnxaHXUyamgRPSGjMtj6IWEZfxQEbGk+OF2
         Bl35uoOiENlRvT4I31fHb0zaPFPaDtWfhxXcydt02hkkbguXvqsLxZOA2ROUQAWwvHFB
         E5LYnBXV44A7fPD+TEsmeSNc1V5xSopSHXsmdKCFItjhphxdlfytNsXRIFWtmGnVVTKk
         r5xs40laUkt/B4Wc1o99iwpvYFY0MXjCJB4ZJshJBatdOZcmKvoGauFFR/4CuQewkQeW
         e09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gXcCWrrWHs2bkxsocMZtybfh3Gg6Pejim2D3Yr9lwOk=;
        b=H+HoYNgyeXUXcMBdWgJjYcBoonrBtxLOIbvM8CUdIZWdW52NuISFB45YHTuHa1FdSs
         kxr+V0IWT9d6IJ3ZyfSyWwmHHQu6nyI4SenehJgv4OgvTywYRJAuDOZAe7IyKtbmwcMM
         jzXJ/lDEaXM0iKwoiaU1BUedoEsY164iULqmqS4Nh0eJrn+dr90cFZvVNJHcf8rsLrf2
         /rdP5mEnAmS8Bidm3rOPnySyT47oHvy1s9yg8Jl4/T2AcvYiFJm10KOZbpg0NGx++v8n
         PvaH5qZQ5VZTQIlXnhwra34k27a7JYFO2hrWKzapaVY9yvguhnKMtJ16floLczzPwhik
         b8fg==
X-Gm-Message-State: AOAM532lzu6hzc6snbmUhBKs2/huDpwjcCgR/KXWtF7lYrUTm8juCXf/
        qi0wcTCYeyD+fmumR/wZBaE=
X-Google-Smtp-Source: ABdhPJx3djGOWL/xag9YZzDflU6xQZGt41GnUGxTWOIRmQcYzv0aciiidIlDPB5bGdfgCZL5Mm+7Pg==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr3621416wmi.101.1622338338119;
        Sat, 29 May 2021 18:32:18 -0700 (PDT)
Received: from othello.cust.communityfibre.co.uk ([2a02:6b64:80a9:0:1be:22d4:3c1d:bcad])
        by smtp.gmail.com with ESMTPSA id r11sm12341936wrp.46.2021.05.29.18.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 18:32:17 -0700 (PDT)
From:   Cassio Neri <cassio.neri@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cassio Neri <cassio.neri@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] rtc: Improve performance of rtc_time64_to_tm. Add tests.
Date:   Sun, 30 May 2021 02:31:59 +0100
Message-Id: <20210530013159.383230-1-cassio.neri@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Signed-off-by: Cassio Neri <cassio.neri@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>

---

Fix link issue on 32 bit platforms raised from the v1.

---
 drivers/rtc/lib_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
index 0060e3a72b50..e50513c8e086 100644
--- a/drivers/rtc/lib_test.c
+++ b/drivers/rtc/lib_test.c
@@ -45,13 +45,16 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test)
 
 	struct rtc_time result;
 	time64_t secs;
+	s64      days;
 
 	for (secs = 0; secs <= total_secs; secs += 86400) {
 
 		rtc_time64_to_tm(secs, &result);
 
+		days = div_s64(secs, 86400);
+
 		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
-			year, month, mday, yday, secs/86400
+			year, month, mday, yday, days
 
 		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
 		KUNIT_ASSERT_EQ_MSG(test, month - 1, result.tm_mon, FAIL_MSG);

base-commit: bcae59d0d45b866d5b9525ea8ece6d671e6767c8
prerequisite-patch-id: ea804a9b3d52cd4f6bfbbf1c53260cb8f2d2c60b
-- 
2.31.0


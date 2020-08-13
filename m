Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEF72433A9
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Aug 2020 07:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgHMFmH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 13 Aug 2020 01:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgHMFmG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 13 Aug 2020 01:42:06 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEE3C061757
        for <linux-rtc@vger.kernel.org>; Wed, 12 Aug 2020 22:42:06 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x6so725922ybp.10
        for <linux-rtc@vger.kernel.org>; Wed, 12 Aug 2020 22:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=K4z6h/ZBrq50C0ovmsW4dSKeXLB4WwD8TYiSUyA2qdo=;
        b=UJ7YhnJgMIiaMtKnMB6qOrejUG2dFZeUxZ46/HNjBls+FfU7g16lyFv5vCUl+VFSmu
         zaYXZ9vjWg3ojYt5AiYLtEzUlxhjnfxZRLsmRXEzitMwn7mta+KmSo0L3X36xtXin0Hn
         +sSXlQMxbQNUdHpi6dO4S3/HDpA4VJcLat8ugbW7I5XA1uIp9u3Y86JAmvGzkcdGvKPq
         h5abmk9/bZJ2LgabX14evoEtBpL33Nzp/wl/5Q17yAjVs8PA2kDyAsfqdl0nKsSkhhcN
         DvI0UUR/Z9EoFnddTU8iuuQO3PH5ESGqPdkIBhT4x1/xMcUR3y7mkiZ6BdYvUg/F4039
         WA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=K4z6h/ZBrq50C0ovmsW4dSKeXLB4WwD8TYiSUyA2qdo=;
        b=cYvD0H6sa/QMDGsrXXxxuqEjhf1zIL2q1nLcW2d5TUv+WkQQQIl9cVO1tIflnm+VTM
         8+Sx9jnY6cD5yF8TNPFJKtdw1md/Z65i5Eky2CECqYyv4+PuS6Js4sBJIQ4fvOWJ8qAe
         UQ4469/PXycB1es2+wpPP7aJ3VuqRw3rK3/w+Lu9pCyXJiuiQHnGgaqVAcbBHrgxbAsd
         fhYDAk6lOGThTbHS0IxdC/coeHUxhQOcJdMICOIaf4qRE+HlHxkUDODPZKYiKvOSz68e
         f81QSb+ZlVB+UoTYz9DYg2CLIXpqpXRF6oBHHfLApSSKwBbf5GlNnW8rLnaiQBFi9Gpn
         mxbg==
X-Gm-Message-State: AOAM5303Q09+r47cvmhJE5h3xMNZCfHV9qEdXlIT57bla3Y8VAJpQRLM
        e9nK40O4424C+HHB2WC8koO/f9j8r76GhMDp
X-Google-Smtp-Source: ABdhPJy1Bm6BaLD7J26+u09kMWFFz+8WIXZI8sBIklgp04H76mKEP1vqFKEYHbpGk54JLdD/OwttkLTZSYlXHygv
X-Received: by 2002:a25:3754:: with SMTP id e81mr4501384yba.22.1597297325101;
 Wed, 12 Aug 2020 22:42:05 -0700 (PDT)
Date:   Thu, 13 Aug 2020 15:41:34 +1000
Message-Id: <20200813154020.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH] rtc: cmos: initialize rtc time when reading alarm
From:   Victor Ding <victording@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Victor Ding <victording@google.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

cmos_read_alarm() may leave certain fields of a struct rtc_time
untouched; therefore, these fields contain garbage if not properly
initialized, leading to inconsistent values when converting into
time64_t.
This patch to set all fields of a struct rtc_time to -1 before calling
cmos_read_alarm().

Signed-off-by: Victor Ding <victording@google.com>
---

 drivers/rtc/rtc-cmos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index bcc96ab7793f..c99af567780d 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1006,6 +1006,7 @@ static int cmos_suspend(struct device *dev)
 			enable_irq_wake(cmos->irq);
 	}
 
+	memset(&cmos->saved_wkalrm.time, -1, sizeof(struct rtc_time));
 	cmos_read_alarm(dev, &cmos->saved_wkalrm);
 
 	dev_dbg(dev, "suspend%s, ctrl %02x\n",
@@ -1054,6 +1055,7 @@ static void cmos_check_wkalrm(struct device *dev)
 		return;
 	}
 
+	memset(&current_alarm.time, -1, sizeof(struct rtc_time));
 	cmos_read_alarm(dev, &current_alarm);
 	t_current_expires = rtc_tm_to_time64(&current_alarm.time);
 	t_saved_expires = rtc_tm_to_time64(&cmos->saved_wkalrm.time);
-- 
2.28.0.236.gb10cc79966-goog


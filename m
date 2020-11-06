Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D976D2A90DD
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Nov 2020 09:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgKFIAp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Nov 2020 03:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgKFIAp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Nov 2020 03:00:45 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D78C0613CF;
        Fri,  6 Nov 2020 00:00:43 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id t6so295036plq.11;
        Fri, 06 Nov 2020 00:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0snfqCwaZDYZ7DsvCpJ92UvHWlqz0IeJ2R+evNn7GWQ=;
        b=XV3lKC7aSAimuTuBcbscNv2wIFnDf/UaGKwxdXryoD9hbcXGuYwjwjBL+gLuqch3SS
         qdmCU6V5sgEz3g52JHtbCMSqIRW17xmWhaVvEnbtuX8J7d/1B2vGBN/GQzTH3t0H4XqS
         ObLTed/RsFqVIQXeJq4cywaUtemDPb3yIobsZar4QjlCG9K9Qf2+psY+Frp0+A5lajkd
         KuG0bq+6AmyqhyZe6rnX921FoOmC4Ds5WqRcpqVy1C/q8/X4x/zdMOIOcDXLoZKfTRiy
         hLIy0cJov4XAznhFnXLLN/D8f+dearHVFnJXFHgSJ7Sjy02eaSLlq2MvJYF/XIU2IXzQ
         rzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0snfqCwaZDYZ7DsvCpJ92UvHWlqz0IeJ2R+evNn7GWQ=;
        b=EzeqGMsfx8oSNNZy0WFBTyjBXU1fLfgfk1fu8pPN1xAuBqntFfb1idPR93faQ6LPql
         YwcX/7NFS7oflfr0suNrFfUjtPGKLyCjXAYnetAZZCEgdK2kls/cO5Jx77GNBFRUm9sR
         56wFhz0vtU0Qpli1/sCcCxKO+4Hvnt6yYBj9TRsuf718D4FW+DgQM7cy3BhrbehbxoVC
         iyPu53GxfsgWOlALhzhdPc2ZpVAOEIfIYbhgc5lP52VgGjvfiP2MiJCu1gxkNS6KldhM
         tNdp1yFqqFS4GsmlvMfK77Gv8ozBHNaVZBwJcEXGu5gpSJsu0nRIZJYeVgRp3axSbQ2a
         xSFw==
X-Gm-Message-State: AOAM533BhUOsjR6IhqcuoGwHiKeQGZf1xSL9cImW6Gn6qBxSAz7lGXeH
        iFhNk5hoPH0Hhj5MvoMJOg==
X-Google-Smtp-Source: ABdhPJwrep0m3UhkLSJEXsMFuBfWX3YTPXU5n8CmXUXrJH1+TmjumnTUI1giVzRqIgA3+HqSmle0PQ==
X-Received: by 2002:a17:902:ba90:b029:d5:cbb1:1733 with SMTP id k16-20020a170902ba90b02900d5cbb11733mr785656pls.6.1604649643183;
        Fri, 06 Nov 2020 00:00:43 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com. [67.216.221.250])
        by smtp.gmail.com with ESMTPSA id y19sm923387pfn.147.2020.11.06.00.00.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 00:00:42 -0800 (PST)
From:   xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
Subject: [PATCH] rtc: da9063: Simplify bool comparison
Date:   Fri,  6 Nov 2020 16:00:37 +0800
Message-Id: <1604649637-1014-1-git-send-email-kaixuxia@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Kaixu Xia <kaixuxia@tencent.com>

Fix the following coccicheck warning:

./drivers/rtc/rtc-da9063.c:246:5-18: WARNING: Comparison to bool

Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 drivers/rtc/rtc-da9063.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index 046b1d4c3dae..6f0a3a711135 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -243,7 +243,7 @@ static int da9063_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	al_secs = rtc_tm_to_time64(&rtc->alarm_time);
 
 	/* handle the rtc synchronisation delay */
-	if (rtc->rtc_sync == true && al_secs - tm_secs == 1)
+	if (rtc->rtc_sync && al_secs - tm_secs == 1)
 		memcpy(tm, &rtc->alarm_time, sizeof(struct rtc_time));
 	else
 		rtc->rtc_sync = false;
-- 
2.20.0


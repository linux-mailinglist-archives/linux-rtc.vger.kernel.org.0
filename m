Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABF52B91AF
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgKSLqT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbgKSLmc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:32 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA295C061A52
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:31 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so6059849wrb.9
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7VHrAKcjAJZgRpVeG2JaXpIwP+wAPdW+wpeYWDjggGQ=;
        b=jDW5blOMKdukJmZOjIFW4bmh+fXJUgWaK6udKmLl1UJMtRZbRqUAAcrRGG6E08NU7Z
         RmUnnIqcvVPKEWhvFU3Md/Rsr7i1kvIGTD+fo2VXq1807b+k89b4pG7aEEoEYURB3Ggf
         wHy4ZudRRk3lqYM9m6dl9C7EzF9XAL5d6Xwq7zzl8nxSHN4MQAXFl/Z9+Lpf6iaifqbN
         sLov24IoqKcf2UJCOtzeHyNRXwLCqSxd9Ea6KwjQs7AmjqpVacDeitPHauuXLLLdRUCz
         W167878fdJ0nOgqP9mvaHjWV2qwzVzmpBqDnwCiLO5s+zuHFQsmz4rkO9C7KYCdPL9mM
         si3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7VHrAKcjAJZgRpVeG2JaXpIwP+wAPdW+wpeYWDjggGQ=;
        b=Y1RXFWqfx3Vu5EgVvoTlryJRK8aOtwDAkJqOu8Qd/0akXDa24c2+AplVgzKiSnhkHl
         9XSA3ptc9SWJ5TcBhVerxnTlmiCuWc8cLbh3ayBb+wNheF3PSK4VH5X3bZhlfWsLMuA2
         iP+e3yQSWHvP8LxRpe0D5ij1Rcn/Lwm3LfMCCV0z3PiCQVt1kZC5ixQqqLVt0l2BsmOM
         eImkjOMXHcAay9Hv9KwJ0V7D7YQyPWYVa1ELs+g9jf4bnnFrnUIf4HW4O4bFSiu956kt
         gSTC6zgpINZPzPveiKD3uhM8FG1vmWltyZ8vt/h6UQQBlWpEg2+gIN4Yp85fLKo/sFCU
         /yEg==
X-Gm-Message-State: AOAM531lgJz1YJkqqF0UYBLwq/5Kk3bl2ZV4djB4YT4cBRicV/dxSaxH
        HTtL1e/vHSjC8T0Q2SBWzjK6BA==
X-Google-Smtp-Source: ABdhPJzcLzORLsiEDSo4DDxDjMTRo/UMmAaW7xxUWwcI6yQd3+sywxHWBSh00wNkZfILpKkIhPIe2g==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr9726671wrq.294.1605786150760;
        Thu, 19 Nov 2020 03:42:30 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:30 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 25/59] rtc: lpc24xx: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:15 +0100
Message-Id: <20201119114149.4117-26-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119114149.4117-1-brgl@bgdev.pl>
References: <20201119114149.4117-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() pair instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-lpc24xx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-lpc24xx.c b/drivers/rtc/rtc-lpc24xx.c
index eec881a81067..e28a00be2c0d 100644
--- a/drivers/rtc/rtc-lpc24xx.c
+++ b/drivers/rtc/rtc-lpc24xx.c
@@ -247,14 +247,18 @@ static int lpc24xx_rtc_probe(struct platform_device *pdev)
 		goto disable_clks;
 	}
 
-	rtc->rtc = devm_rtc_device_register(&pdev->dev, "lpc24xx-rtc",
-					    &lpc24xx_rtc_ops, THIS_MODULE);
+	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc)) {
-		dev_err(&pdev->dev, "can't register rtc device\n");
 		ret = PTR_ERR(rtc->rtc);
 		goto disable_clks;
 	}
 
+	rtc->rtc->ops = &lpc24xx_rtc_ops;
+
+	ret = devm_rtc_register_device(rtc->rtc);
+	if (ret)
+		goto disable_clks;
+
 	return 0;
 
 disable_clks:
-- 
2.29.1


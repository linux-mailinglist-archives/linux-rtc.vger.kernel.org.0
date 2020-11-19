Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE942B9193
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgKSLpG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727343AbgKSLmr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:47 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA03C061A4F
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:46 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id o15so6110022wru.6
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LUz4VOPtCQ6MofHdGqqmUJWFE2OL4Z8r4lVtOSIvBIY=;
        b=cKKwxIc/ulcFNHzwHV96lh8zjQJ9fG6tRReWRE/sRareusRGjRNtFQSUGSzhkYaGC9
         KEVjmDalYMVM9b6SHhlT6FmZ8t709qH+aNASbpM08D9ToTZSAGeZDFqGDFUeWfnlnyN0
         py30BJ9yqnz5Aa9xU16iD2Ft30YT70Mv6rYpLoaNJ5/c4TpSZO/bq8SKrOB4iT3YwC5b
         I4NTGaR+1qX0QtQHbxA3qURHPs8EyCZjLvLJo+6fUepyXZuuTGInlGoaLB6u/6OPrBQo
         v9ALga+6aV9B4T1pgqbRx7Kv0pDjFiM0rz2mSRtyumyNoEdYnKJlXul9yM4rRlVtgIMR
         qIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LUz4VOPtCQ6MofHdGqqmUJWFE2OL4Z8r4lVtOSIvBIY=;
        b=BXdlcEFiBdnqmBG32MaKrOc95RTWR+o4N4TzQCtnW6uwg2vPsFIJPasdwGuF0Qo1hK
         S16KKzoSCNx7N+6zN01jO9ktnPnTOFG1dRKYsJNizmYjJ+Bbh48ZSOQ/x1RBCff8S98N
         v5xD3BdA4XGjRl1DYbFfb0IvxY2F9D7RqnsWgRWn/27l9pjeko+7Vxk+1oNZ5PGP14vT
         /4SkbC/FWae84vnAhNJYRgLjK8sUuYp9telZMX0IKIqItn1hZ2IeWuLGxuMaQomQpUBG
         RhU15tBLknaZ5g8kasL50X43fz4Y09ZQlbDnqxLI0IuYWtkU1ojDRBk5iB8ARaW7zcGP
         WaUg==
X-Gm-Message-State: AOAM533dCnRfU+bD0m0YPmiwwZAX619EzyzUUPvCCJowdrLG72GZ4y+S
        Sn4+zDPpzBIb113D7dO2+sXZsg==
X-Google-Smtp-Source: ABdhPJwZ8AQRAieNo8lotHexkwASuvzYY/5oQ/DCdwd8jIGE/+6rl6f6ykuNrGHAAB4nY81zFwCB+g==
X-Received: by 2002:adf:de85:: with SMTP id w5mr10120007wrl.90.1605786165516;
        Thu, 19 Nov 2020 03:42:45 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:45 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 39/59] rtc: wm8350: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:29 +0100
Message-Id: <20201119114149.4117-40-brgl@bgdev.pl>
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
 drivers/rtc/rtc-wm8350.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-wm8350.c b/drivers/rtc/rtc-wm8350.c
index 2018614f258f..140efe601c88 100644
--- a/drivers/rtc/rtc-wm8350.c
+++ b/drivers/rtc/rtc-wm8350.c
@@ -424,13 +424,11 @@ static int wm8350_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	wm_rtc->rtc = devm_rtc_device_register(&pdev->dev, "wm8350",
-					&wm8350_rtc_ops, THIS_MODULE);
-	if (IS_ERR(wm_rtc->rtc)) {
-		ret = PTR_ERR(wm_rtc->rtc);
-		dev_err(&pdev->dev, "failed to register RTC: %d\n", ret);
-		return ret;
-	}
+	wm_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(wm_rtc->rtc))
+		return PTR_ERR(wm_rtc->rtc);
+
+	wm_rtc->rtc->ops = &wm8350_rtc_ops;
 
 	wm8350_register_irq(wm8350, WM8350_IRQ_RTC_SEC,
 			    wm8350_rtc_update_handler, 0,
@@ -441,7 +439,7 @@ static int wm8350_rtc_probe(struct platform_device *pdev)
 			    wm8350_rtc_alarm_handler, 0,
 			    "RTC Alarm", wm8350);
 
-	return 0;
+	return devm_rtc_register_device(wm_rtc->rtc);
 }
 
 static int wm8350_rtc_remove(struct platform_device *pdev)
-- 
2.29.1


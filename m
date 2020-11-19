Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A172B9170
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgKSLnm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbgKSLnG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:06 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14664C061A55
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:05 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id o15so6110982wru.6
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=exdIJW2r8sVksRfNex+pvgxCMn/tRZ4EbVh8qlTWnAE=;
        b=ChK+v5V+9wopuXs5xYhnhY+T9HTLx7TZP8I2l0ziIUvjeSMv4ncNnK1WMY6mcL6ipG
         ZXYthnLS1QAAnSsu2d2kXZBRIsqhG+FvfiaWKGHGvqKqynlio/hDSSuUMQkgL8G4UFTw
         dCynuQMXO+DnSieNuhKlWodspQyOFWci3gF/hlr5/cLsNjRHvg3PLWNmbkLeMvu07x2s
         /5vAHaOPmQ871YoqWbZA1GFZrF8k8jV6n6l1afWkO+J2u4RZDaRfJ7jxWTCrcsZ7wFhm
         +1BTvqGWttvGZF9qQ8pMz1ccHpsQCrSspcHRnzPjC3IyjxBfmTcq+t7mWiEyGvlyaR3v
         ifZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=exdIJW2r8sVksRfNex+pvgxCMn/tRZ4EbVh8qlTWnAE=;
        b=fm5Yvx1dJ8LRzTQa7mxsGgGim2foOsRWcOyxxYf/elRKUkBqVd7Rhc+xW/fOqBrU2M
         Bu1QVQDdz0gWMGayw3rUummvFqT2o2E//PqOO2zPEYItmVjInGXW7amDhPDjuPsSouhd
         bE9BPbeTmLNhfiHEiIXLq6mdUQbTbRHJ0H+wPMBxsjCn+u9vBdYYeTCanaGGqGV/JnSd
         gMLnsif5HywnfIBRZuoUkDr2vBcsOsuuPCri54kJAilkYjGEGCzmpFNhv5zS11u4zlDy
         SFj/KqBTu4RTR9hiLgvteeHNk+afGYnuRfD1GljCZW/zc3xF4pome/Y0sLlRx/Vy8Bfr
         vqKg==
X-Gm-Message-State: AOAM533LbeovkVZ1JOZBlmuUXDMDSDfG4iXTgSSvoLniHK6ivFq1fLHR
        3y6rKGZMMcweq9ZzBzwssLxYaw==
X-Google-Smtp-Source: ABdhPJyw40WOMlJQ1M8qN73iJ4j6OTt1gen0BdltQbviT9Nc8iPhQR/lZkxcbmzHXUdbZoZym6NZlw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr10287019wrt.66.1605786183894;
        Thu, 19 Nov 2020 03:43:03 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:43:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 55/59] rtc: rtd119x: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:45 +0100
Message-Id: <20201119114149.4117-56-brgl@bgdev.pl>
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
 drivers/rtc/rtc-rtd119x.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rtd119x.c b/drivers/rtc/rtc-rtd119x.c
index bb98f2d574a5..547ab60adb3f 100644
--- a/drivers/rtc/rtc-rtd119x.c
+++ b/drivers/rtc/rtc-rtd119x.c
@@ -205,10 +205,17 @@ static int rtd119x_rtc_probe(struct platform_device *pdev)
 
 	rtd119x_rtc_set_enabled(&pdev->dev, true);
 
-	data->rtcdev = devm_rtc_device_register(&pdev->dev, "rtc",
-						&rtd119x_rtc_ops, THIS_MODULE);
+	data->rtcdev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(data->rtcdev)) {
-		dev_err(&pdev->dev, "failed to register rtc device");
+		clk_disable_unprepare(data->clk);
+		clk_put(data->clk);
+		return PTR_ERR(data->rtcdev);
+	}
+
+	data->rtcdev->ops = &rtd119x_rtc_ops;
+
+	ret = devm_rtc_register_device(data->rtcdev);
+	if (ret) {
 		clk_disable_unprepare(data->clk);
 		clk_put(data->clk);
 		return PTR_ERR(data->rtcdev);
-- 
2.29.1


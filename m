Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACBF32B91C3
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgKSLr1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:47:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgKSLmX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:23 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EA8C061A54
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:21 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a186so4088933wme.1
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pdeHaCdQSZfXoslP2kqPKAedembllLxxJeYfDx6HMQA=;
        b=XZsj9d31BrH46wRzBxS2Ng1vOUP0coHfF4PXQEMbQ9eABosjIvc4RudoDprS3tRGqL
         CQY+JY5AGvOVRaeSt4kdBEPwv5pS87WL5bTLfPhAgjzfQ/DShZtKVVLWYO5Cgnpqg27n
         3WTjFuklHfR0ty1c4ybIbXC6qygRLYx5GWPcb1C6bMI1DUijCsutMSB428AX1tgAOsu+
         4gLC8W7Fc0bznKzgM28k+LDrDiCAGqDzBSIc5+j8Nh0PVcJURqKEFsCB5Y17vdCus6jL
         n4/vgEMpn7VqQLv+fF2YRzr3unPJV1Zpfk9bG8SeU9FXAIl5dhtuWcr41qdu2etoyn51
         cV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pdeHaCdQSZfXoslP2kqPKAedembllLxxJeYfDx6HMQA=;
        b=DGGrM96nAQsr2GNroNRKbd2dj0u/7TRLRU0i4/+awDHRUijg+vomWUjlEHYFjlcUWz
         ReTBEYQLeNvKY+lyK9xRFavxsKmEdVpn7YHbkPfCpgwmJRhBQP7VbpCy+tOOhnbhSO8k
         V65QW4CqkrOs0Uv5w87gxpEM29FWVXEzX9cTRe7I+YeS/cFYidJe62Syj+Gc/r4Bu+6j
         wh07LAWZJHDGHGlGakStWHPobLwzsYVGUkVCTMTapMuEux7PHUuTtEI31qndAjCUZp/n
         smcSq0KSLZHuRuUIiOxpi0/VsshWTPvmFBSloUnmWHe3k4jDLa2/J9FHHxYczZBFchjx
         E4NQ==
X-Gm-Message-State: AOAM531dhMz/IqI8IQz7EEYzOGKr6SxSaXZX8Uo7f2qefrCuir7VSUCb
        KFfkq8WG3NrzrHl5wSr7uE83Yg==
X-Google-Smtp-Source: ABdhPJx0jXljEmr8Y7rG+45wv+DrjZdLaqsrrD1fNRufpNOM9U/5pPOS1AM+vJiWbv8ZBsNcsNIdjA==
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr4160721wmn.102.1605786140321;
        Thu, 19 Nov 2020 03:42:20 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 15/59] rtc: max8907: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:05 +0100
Message-Id: <20201119114149.4117-16-brgl@bgdev.pl>
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
 drivers/rtc/rtc-max8907.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-max8907.c b/drivers/rtc/rtc-max8907.c
index db3495d10274..7987f7f99bcc 100644
--- a/drivers/rtc/rtc-max8907.c
+++ b/drivers/rtc/rtc-max8907.c
@@ -186,13 +186,11 @@ static int max8907_rtc_probe(struct platform_device *pdev)
 	rtc->max8907 = max8907;
 	rtc->regmap = max8907->regmap_rtc;
 
-	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, "max8907-rtc",
-					&max8907_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
-		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
-		return ret;
-	}
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	rtc->rtc_dev->ops = &max8907_rtc_ops;
 
 	rtc->irq = regmap_irq_get_virq(max8907->irqc_rtc,
 				       MAX8907_IRQ_RTC_ALARM0);
@@ -206,7 +204,7 @@ static int max8907_rtc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to request IRQ%d: %d\n",
 			rtc->irq, ret);
 
-	return ret;
+	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
 static struct platform_driver max8907_rtc_driver = {
-- 
2.29.1


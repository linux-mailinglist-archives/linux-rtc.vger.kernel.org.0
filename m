Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F40C2EBA30
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Jan 2021 07:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbhAFGrr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Jan 2021 01:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbhAFGrr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Jan 2021 01:47:47 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CFEC061357
        for <linux-rtc@vger.kernel.org>; Tue,  5 Jan 2021 22:47:06 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n16so2565960wmc.0
        for <linux-rtc@vger.kernel.org>; Tue, 05 Jan 2021 22:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMHBCUZGG9sUTUF6+G1UEasXPArhsLjoOzd5gYYQRUI=;
        b=sdXysKMM4mjqWkND1TXIygHeROQWUW/dxNQBncIe4Xp/Bripdpg73iPzwYzjNd4g+j
         8NrTjeB3sTSKIwhq4m1UZ5oe5LbOSWzsjCmMNWxwW+5tb5bDE7P3B0QrkyaKFCXsqgiV
         kbbQv2mwb/nQuiruKcS/CNXRdXRQLNK5tcdJ09w8V96uIZPDh+19fA65L4l4PLUFW8xz
         8lWwzPt6HVPopC2wJfAQvChqwnU2kQ3aaspIaPy6ofTzWKYi1mBqEVsszLH5rdCqE0uo
         Scp/1gbh+DlFxE7003hSW6pkgtyUc5avVzx2+CV6rZIlOXd/Q6S0bMyp5Go9E+OzhtDU
         TLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMHBCUZGG9sUTUF6+G1UEasXPArhsLjoOzd5gYYQRUI=;
        b=mNso9OMDmToka1GRIOr0a0MOd7Vdiz2wAift8SIAMQMDjtcfUDioKyllV5zmUT8aAq
         i5U1m0JctV9fJ40CY3LsqLrTQLNG/efyIut+RaBs4WWBZDRBxyj0s9U6u9gKBI4XI3YH
         ENXUMSAIto5iJNxHYb/qr4B/JQKlJ6PwxKGinvXz5s4r91qxbaq4s1a2J5vOLz8f9mkh
         SmoRTcwXwnBwGt/J7v7Om94XY6s4uQkxfK4flQcoNuh5xPyxbCkv8P/sl7zWj95vcGGM
         +9PJ3+g/uJs9Y+Ez/u0R8DNaloN+o5LtCkmRxlwBPzIYkIasagpM/4Dp5WwVag+l15Ny
         VOWw==
X-Gm-Message-State: AOAM530ttDFBoRM/BkVtBCty3Ab5yACBiAt4UZm7LrweFyQGqTLd8KK1
        4Y2QchpX9rGr0zhQDM+gwCCzGw==
X-Google-Smtp-Source: ABdhPJyI4V1Ge1LuIAFDBvNl6oGstBIhrAMnzxrD0v1JtGvfnA6kdxD6TGg90cczxECyNH2bh4AyCg==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr2277464wme.137.1609915625531;
        Tue, 05 Jan 2021 22:47:05 -0800 (PST)
Received: from localhost.localdomain (pop.92-184-112-11.mobile.abo.orange.fr. [92.184.112.11])
        by smtp.gmail.com with ESMTPSA id i11sm1729980wmd.47.2021.01.05.22.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 22:47:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] rtc: s5m: use devm_i2c_new_dummy_device()
Date:   Wed,  6 Jan 2021 07:47:01 +0100
Message-Id: <20210106064701.30682-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the managed variant of i2c_new_dummy_device() to shrink code and
remove the goto label. We can drop the remove callback now too.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-s5m.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index eb9dde4095a9..8d42592bc58e 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -760,7 +760,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->i2c = i2c_new_dummy_device(s5m87xx->i2c->adapter, RTC_I2C_ADDR);
+	info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
+					      RTC_I2C_ADDR);
 	if (IS_ERR(info->i2c)) {
 		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
 		return PTR_ERR(info->i2c);
@@ -768,10 +769,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
 	if (IS_ERR(info->regmap)) {
-		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",
-				ret);
-		goto err;
+			ret);
+		return PTR_ERR(info->regmap);
 	}
 
 	info->dev = &pdev->dev;
@@ -781,10 +781,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
 		if (info->irq <= 0) {
-			ret = -EINVAL;
 			dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
 				alarm_irq);
-			goto err;
+			return -EINVAL;
 		}
 	}
 
@@ -797,10 +796,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	info->rtc_dev = devm_rtc_device_register(&pdev->dev, "s5m-rtc",
 						 &s5m_rtc_ops, THIS_MODULE);
 
-	if (IS_ERR(info->rtc_dev)) {
-		ret = PTR_ERR(info->rtc_dev);
-		goto err;
-	}
+	if (IS_ERR(info->rtc_dev))
+		return PTR_ERR(info->rtc_dev);
 
 	if (!info->irq) {
 		dev_info(&pdev->dev, "Alarm IRQ not available\n");
@@ -813,23 +810,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
 			info->irq, ret);
-		goto err;
+		return ret;
 	}
 
-	return 0;
-
-err:
-	i2c_unregister_device(info->i2c);
-
-	return ret;
-}
-
-static int s5m_rtc_remove(struct platform_device *pdev)
-{
-	struct s5m_rtc_info *info = platform_get_drvdata(pdev);
-
-	i2c_unregister_device(info->i2c);
-
 	return 0;
 }
 
@@ -874,7 +857,6 @@ static struct platform_driver s5m_rtc_driver = {
 		.pm	= &s5m_rtc_pm_ops,
 	},
 	.probe		= s5m_rtc_probe,
-	.remove		= s5m_rtc_remove,
 	.id_table	= s5m_rtc_id,
 };
 
-- 
2.29.1


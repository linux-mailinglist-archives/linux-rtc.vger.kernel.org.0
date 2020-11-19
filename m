Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59C22B91B8
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgKSLqn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbgKSLm3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:29 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1589C08E861
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:26 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h21so6460754wmb.2
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MXWwO3xQMpsZXQIjSZeQSg/sLrhlY0LSBGkxq2KXeMs=;
        b=KmS/Tq6wy2Oze3dapdaVMToX2QyN7Ag1Z/55ZVOWxRtT24z+zGvA9zF3uQ1XaSmuiF
         24/sjU35LfDLvBAqHdz23ScSeHF505y1mB3t9IpwsHW1myTodpFyt3ANPf42fYmU4YWd
         xWLomWY+doh+qhjAM8oFi+P9i0y6fonHwKDEGXG1YEM0qXozPwnDm17iwCKSaC5mlOWO
         bPKLg5Ten2EX9ZUHhOogeS1CyR7ffBex/CGuOOn0ES5O2dm5YhK6JP8acYYenRE3ewty
         1pYdw5rxueKsXHSKp+ooJTpN+ie6OkvQDJJr43GhqLUh396hkI1kDJuhALGF3dDAg/jr
         Pyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MXWwO3xQMpsZXQIjSZeQSg/sLrhlY0LSBGkxq2KXeMs=;
        b=AaramUyuTgpFA4Q7zlj7+vh0gazD8X0LhgBKuIung9vG1h0wj7Vebfq9xTlvsEuP2T
         xKTOGqMBm8Y5yT1ZOldDepuqjgmdEKiYj2IA3uUJWCpCSF+y885pm2Var3Ku4u+XFrxR
         z9rl1fsBwBQAIgU9gY/DrNwsnvtA2JqpKctB95ZtVZ+Rz86ah4dQltStVdqFstA4ijIH
         /U53mKPg6QFxAC+R29DOvuitoZ6PONOSD93H/PVBLAytFRlYS1Ml0UsJjzmi/iS+iZoH
         qOfdHFMUEAjQPqyaMIdvQv0cgjZ4Bv0XgBaslhg+IHbAc/9oemlfCgCxyn3WZC6UOtM1
         oW5A==
X-Gm-Message-State: AOAM532Hdjpzw48uVsZT7YUnd0sBqy2UhWSvF/2gAastQfk/+sKrRONd
        159Z+BhzcSlsrUr8HBgOQuDRjA==
X-Google-Smtp-Source: ABdhPJxZc2cutGdrEH6kTMjZ2J+3v1B4hp0FHi1vNVY13c1Veu5oAAWR1xpOB+p/XQOrDepc5mlPPA==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr3993921wmh.44.1605786145490;
        Thu, 19 Nov 2020 03:42:25 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 20/59] rtc: s5m: use devm_i2c_new_dummy_device()
Date:   Thu, 19 Nov 2020 12:41:10 +0100
Message-Id: <20201119114149.4117-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119114149.4117-1-brgl@bgdev.pl>
References: <20201119114149.4117-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the managed variant of i2c_new_dummy_device() to shrink code and
remove the goto label.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-s5m.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index eb9dde4095a9..3432c6213b4c 100644
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
@@ -813,15 +810,10 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
 			info->irq, ret);
-		goto err;
+		return ret;
 	}
 
 	return 0;
-
-err:
-	i2c_unregister_device(info->i2c);
-
-	return ret;
 }
 
 static int s5m_rtc_remove(struct platform_device *pdev)
-- 
2.29.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9372F1277
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 13:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbhAKMl7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 07:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbhAKMl6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 07:41:58 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52E7C0617AA
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:39 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 3so14916958wmg.4
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLQSMu4kyOWwZDRuRCxs8aoK2DhXG2sbIHqKebgLZs8=;
        b=YtHZifkBaY0OPg54db/1GEuBl6VpUDZZNAf4YQVSyEgPjRg25raahc/YvwMJ0nvVnx
         6V/vWalce3AnXvu7lqT5zQ8X+tW8TmHheC1EpP/njLVKre8dGO2rzPdBuva5n3CYaU9v
         m3xKBt7F68+9mV4hDNyqj10kkiZUPJLMVv3ImgU73RtgzfYCf4LUwYL2ChS2HOy/1UX0
         6qJ3KhL0F0DpStRKvMXxFdW5BtfqZ4lCW1nOxcsQpeiKV0DCPZpfNWJgaoWkU4w5IqGn
         zIIBf/HHj/7r6aZLpYOAMV1dsuFnM2b7g5Uz8d4mXxQ0b2lAYDywqQ7MScdjzsvfPGff
         pMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLQSMu4kyOWwZDRuRCxs8aoK2DhXG2sbIHqKebgLZs8=;
        b=AxM0q8arQpa1M0NCICB2EKrwDU/b4tOuswuu2s7qsyZ0zQTTVJjR8O/LUMYBNkbnVk
         uUG6Gtqb4kuH0Ezp43AfM0cRpRNrX2Hm7FyQ90yCifJsiLSU+a9vXguVnChWmbAZwXNd
         lQ43PVb5SZgSa2cKFbY3foM89gAZPyXxfeLJr+Gb9GAq84SVY6nflGcGRT1/507ZJgB4
         wllDwGwLD2bSva3wbefFsfGn+ALee1GpwREl1tGmY/NVVHb5ZpM4GBqV6Q3/LyCGHe7A
         ughrUAMgIi4PaCjznrok7E7O333QDzwgvPRxIU9FRH+TN/OO0f9IZIImAQ5dCYX3KH8g
         TKsQ==
X-Gm-Message-State: AOAM533M/IQ9s5ecwDKzXNZIGDBBVLI3puA5L2z4vUiZE5ogyqrLeYfY
        jw2AiEigkhqFnfZgIw4N6dPwZUPdMBckUg==
X-Google-Smtp-Source: ABdhPJy7IwW7rqicRJkE+1lyoV7lllzeWL26215H1ry1DCRVDrmCZu4Y2vJ0uDYfSxjfCx2mNGo6Lw==
X-Received: by 2002:a1c:6208:: with SMTP id w8mr14496011wmb.96.1610368838524;
        Mon, 11 Jan 2021 04:40:38 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l8sm26492362wrb.73.2021.01.11.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 04:40:38 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 3/3] rtc: s5m: use devm_i2c_new_dummy_device()
Date:   Mon, 11 Jan 2021 13:40:27 +0100
Message-Id: <20210111124027.21586-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210111124027.21586-1-brgl@bgdev.pl>
References: <20210111124027.21586-1-brgl@bgdev.pl>
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
 drivers/rtc/rtc-s5m.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e0011d3cf61b..80b66f16db89 100644
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
@@ -771,7 +772,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",
 				ret);
-		goto err;
+		return ret;
 	}
 
 	info->dev = &pdev->dev;
@@ -781,10 +782,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
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
 
@@ -799,10 +799,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
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
@@ -815,23 +813,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
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
 
@@ -876,7 +860,6 @@ static struct platform_driver s5m_rtc_driver = {
 		.pm	= &s5m_rtc_pm_ops,
 	},
 	.probe		= s5m_rtc_probe,
-	.remove		= s5m_rtc_remove,
 	.id_table	= s5m_rtc_id,
 };
 
-- 
2.29.1


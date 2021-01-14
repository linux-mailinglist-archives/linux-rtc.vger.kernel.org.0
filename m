Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229C52F5EA6
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 11:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbhANKXq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 05:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbhANKXo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Jan 2021 05:23:44 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A95C0613ED
        for <linux-rtc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:26 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 3so4179634wmg.4
        for <linux-rtc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kGv8QrRdv3vCCcpWkYEIkCuQbV4ftPlge50FODH3uVg=;
        b=uDyryazWNCsTwd2/U5Q6H067pMAoezbQHdb2LTFxZR+KDir/2zSvAxyhdNWyMnzRkB
         0vd92xVYqgCAbmnnTC//9acLIP7H1ePYzpCRcTXR47+j9ZimTtvsDPJ2iT0v/jZ2/U/C
         pDL+cYPMolJzFF5s1cN/fp5EdrMOPm4MQoGXhFPtdN3DvZDllRV3HdQHACjjCFEyhxM2
         fh2sGIouiky9yHexEa1qb0XL+SbfN5Ep7gKlUnqNzxvZ22nXkGN0XNX1XdT65/L2k2Yx
         7Qg7Hj8JPWpyR5U6Mj5p+qdvcn3pV+pITbnf05J/f7eXWCyjzE8f/KdgtSPALJfUl+Do
         F6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kGv8QrRdv3vCCcpWkYEIkCuQbV4ftPlge50FODH3uVg=;
        b=AqJWYW9Zu3d2cCI7iik6bh/1IDdjcbt8ddQPdPR6jU1/4XxBlxVIxmlj/dWnY90/KD
         g3VoJXrGjLNGvKJZBtFXuwPbvfx7FpiTMApMPpjsI3EWsZQ4KGoy5/2gKcolr8kzsyK6
         vuymr4E4VIIoaR6YKdWkKZ3myBCgCkKRzsLBEkYaksGbj1Y00Lf2K3hiPgwYqwi2R9/r
         RohTUef0aDmfhHjMv3s3+yWXtuZUVqK0gMdDLigmTzzHdmBBWrcSDLyWI3QfSEVsTE3e
         OeA8tLSAZGQSkML+TYe8hbFQVS6b12sF8qiEfIOiHO7HMdSqiZD3vfuQIKPLyq/kcfmI
         KWQw==
X-Gm-Message-State: AOAM533Z7edhfZ+VVpZxO1JE9NmsX0fw2zEGgCMQ0YFNKPSREsRoGUKv
        OVWxP0xIfR5XVGni8lwM37phrA==
X-Google-Smtp-Source: ABdhPJwPuTNivU1ONcC79sHPdyUwr+gkIOdzPHxT21bdM5/EZhb/KAkqTItOc0IctSnq2D31VMklww==
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr2019917wmg.183.1610619745017;
        Thu, 14 Jan 2021 02:22:25 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l7sm2468467wmg.41.2021.01.14.02.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 02:22:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 2/3] rtc: s5m: use devm_i2c_new_dummy_device()
Date:   Thu, 14 Jan 2021 11:22:18 +0100
Message-Id: <20210114102219.23682-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210114102219.23682-1-brgl@bgdev.pl>
References: <20210114102219.23682-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the managed variant of i2c_new_dummy_device() to shrink code and
remove the goto label. We can drop the remove callback now too.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/rtc/rtc-s5m.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index eb9dde4095a9..858d5f0e860f 100644
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
 
@@ -797,10 +797,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
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
@@ -813,23 +811,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
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
 
@@ -874,7 +858,6 @@ static struct platform_driver s5m_rtc_driver = {
 		.pm	= &s5m_rtc_pm_ops,
 	},
 	.probe		= s5m_rtc_probe,
-	.remove		= s5m_rtc_remove,
 	.id_table	= s5m_rtc_id,
 };
 
-- 
2.29.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EC02ED111
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Jan 2021 14:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbhAGNmw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Jan 2021 08:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728736AbhAGNmu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Jan 2021 08:42:50 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334EEC0612F8
        for <linux-rtc@vger.kernel.org>; Thu,  7 Jan 2021 05:42:10 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i9so5701281wrc.4
        for <linux-rtc@vger.kernel.org>; Thu, 07 Jan 2021 05:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IJJO5LSRqwbf8XDwJHkWx390vk3Q5Ggb8kvvqef+rMI=;
        b=dX+vbyPKWR8RNhLFFIbBiSru05sQDU+e9a57ZFF6LiDoL81FlcFXLa8NJit1Qm6KKA
         Qosp5wnMKtuQJoUpZYVTV9GHDsMiMbcRRmflRBtL2OcHvqfTMYeXcPLK6Md0dCne8BKw
         4h44t7upRd9VwgoB2JEO6fC+EnG+KXbngas15z5mwtju21qbzsW18SaGlkcFZ6eJnsT+
         na0AomIjCGE/3V4zbNbA7vwW8GxFENeK8aFWy0LztiKLROLSJ9HXtJHdVDHjcVcTeCqq
         TGIx2P7EHO9BtlE2xlSlVPW5rXqbYFJTaRzMsdFsCYXdbMKfq7ps07OYm3pDCtacWJab
         Kx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IJJO5LSRqwbf8XDwJHkWx390vk3Q5Ggb8kvvqef+rMI=;
        b=EF4CesPfGxTRkTiR4yIBHpm5SD35uxOo5P+Bz3lAObyA+dBOnu63cgcb7YK2r2wrUZ
         Da1n9MnX/mWT9Se5xxfqxy+kgS/FsLSzJD/g1ogKfpvJzGy6DeH65WedeoQg2WgE1HF/
         kEzs48fHGgJ0eExVk587GHFKacThMtzd/IPza6LHlyBOIXtr88XtfdONYKsrzPzYvK+d
         AvMSkx8RrKGC3WB6fCz74BOsGlb55UpFvkiYKwkc+ZI89x+SO7TlhgJDjT+86BJ8gzvT
         AnABfSlYFITNp6xmEiDXc3UDdHGCWPR/j53dVYnoBZ8nM6/oB4IzOqk9ezRcuNKI1JT+
         IAAw==
X-Gm-Message-State: AOAM530/+CW3tt9z36NlcQw88R3b49ntO/RM2IZDNNjX33BY3gW63Mp8
        X1lZsCocdq0kvzKvVb9dIqFLAt8UPS9+oQ==
X-Google-Smtp-Source: ABdhPJwuAyQKURaBKiPXvoLrzSLaHsIXX9sVzhwQ4s04puXoUHiDAw70gHHWZ2k4zQTW1P8s+ChtvA==
X-Received: by 2002:a5d:6852:: with SMTP id o18mr8808119wrw.371.1610026928953;
        Thu, 07 Jan 2021 05:42:08 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id g184sm7852710wma.16.2021.01.07.05.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 05:42:08 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 2/2] rtc: s5m: use devm_i2c_new_dummy_device()
Date:   Thu,  7 Jan 2021 14:42:03 +0100
Message-Id: <20210107134203.9388-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210107134203.9388-1-brgl@bgdev.pl>
References: <20210107134203.9388-1-brgl@bgdev.pl>
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
v1 -> v2:
- remove the remove() callback

v2 -> v3:
- fix an error pointed out by the build robot

 drivers/rtc/rtc-s5m.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e0011d3cf61b..b492070afe6a 100644
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
+			PTR_ERR(info->regmap));
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
 
@@ -799,10 +798,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
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
@@ -815,23 +812,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
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
 
@@ -876,7 +859,6 @@ static struct platform_driver s5m_rtc_driver = {
 		.pm	= &s5m_rtc_pm_ops,
 	},
 	.probe		= s5m_rtc_probe,
-	.remove		= s5m_rtc_remove,
 	.id_table	= s5m_rtc_id,
 };
 
-- 
2.29.1


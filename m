Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A46F365E0A
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Apr 2021 19:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbhDTRCH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Apr 2021 13:02:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50067 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbhDTRCE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Apr 2021 13:02:04 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtki-0004Sd-2X
        for linux-rtc@vger.kernel.org; Tue, 20 Apr 2021 17:01:32 +0000
Received: by mail-ej1-f69.google.com with SMTP id p25-20020a1709061419b0290378364a6464so5028421ejc.15
        for <linux-rtc@vger.kernel.org>; Tue, 20 Apr 2021 10:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G40+ggJ5/BUsbwdccSqO8JqtdoxRrS30UvEQCJ2OFE4=;
        b=FvciXQPmZ5rhedAydVjBAKktN9anwh+RZ98mNzP8A8CruILw51gE0RXmYkwh1lkLW2
         fY9s927wJXQOCEGvBHPfc6jL9tIbm6pn+ba4Z3kxrNx6MRL16psbfCvKoAzRmictKGko
         fzZ+3bXsXDNXvCUuX1z8sD1X0mM3A8CfBKorrta1huRa38qqJBv672gw8arFU2BPF6V+
         C900ECrdDM4P13m0O7xPKpOsNqb+T1z2J6cRNixGtv8Lm7+pLk+c+O8m4OmM/erWCdXw
         rmbMU2IJzTWkzFAWF+D8eWRwFJrHauNpk3T2VJL0tUX69n6D8VLElXChwMwo05FdFbPt
         ZdOQ==
X-Gm-Message-State: AOAM533IiDtTilaz/v0u2UHizV+FSGsinIf6jQZ/TfkzfEU8yeVETWX5
        H9JVLjoLKrwP8RUtHQZFNBfDMBPM8R5LAjKZLw7IyzaukPXaFioZD5PHG44TBh0eHWMAiVzEFNF
        BN5MfklojY9sleVYHWC/ebdlSC+hIiNaNfiJa4w==
X-Received: by 2002:a17:906:7c4a:: with SMTP id g10mr29295867ejp.325.1618938091679;
        Tue, 20 Apr 2021 10:01:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5/RbdFmHFfQlMnizEq9tbD/ZtDoZ+o42mxE6WfppD7PT3wIgD8ZYXTuliN8iYgnsedYkV4Q==
X-Received: by 2002:a17:906:7c4a:: with SMTP id g10mr29295835ejp.325.1618938091392;
        Tue, 20 Apr 2021 10:01:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id x7sm16334441eds.67.2021.04.20.10.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:01:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 1/9] mfd: sec: Drop support for board files and require devicetree
Date:   Tue, 20 Apr 2021 19:01:10 +0200
Message-Id: <20210420170118.12788-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Samsung PMIC drivers since long time are used only on devicetree
platforms (Samsung Exynos) and there are no users with board files.

Drop the support for board files entirely and depend on OF for matching.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/Kconfig    |  1 +
 drivers/mfd/sec-core.c | 59 +++++++++++-------------------------------
 2 files changed, 16 insertions(+), 44 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b100191..93a1610128c8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1133,6 +1133,7 @@ config MFD_RN5T618
 config MFD_SEC_CORE
 	tristate "Samsung Electronics PMIC Series Support"
 	depends on I2C=y
+	depends on OF || COMPILE_TEST
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 15dd4c579937..c61c1fc62165 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -94,7 +94,6 @@ static const struct mfd_cell s2mpu02_devs[] = {
 	{ .name = "s2mpu02-regulator", },
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id sec_dt_match[] = {
 	{
 		.compatible = "samsung,s5m8767-pmic",
@@ -122,7 +121,6 @@ static const struct of_device_id sec_dt_match[] = {
 	},
 };
 MODULE_DEVICE_TABLE(of, sec_dt_match);
-#endif
 
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
 {
@@ -282,7 +280,6 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
 	}
 }
 
-#ifdef CONFIG_OF
 /*
  * Only the common platform data elements for s5m8767 are parsed here from the
  * device tree. Other sub-modules of s5m8767 such as pmic, rtc , charger and
@@ -313,28 +310,12 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 						"samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
-#else
-static struct sec_platform_data *
-sec_pmic_i2c_parse_dt_pdata(struct device *dev)
-{
-	return NULL;
-}
-#endif
-
-static inline unsigned long sec_i2c_get_driver_data(struct i2c_client *i2c,
-						const struct i2c_device_id *id)
-{
-	if (i2c->dev.of_node)
-		return (unsigned long)of_device_get_match_data(&i2c->dev);
-
-	return id->driver_data;
-}
 
 static int sec_pmic_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
-	struct sec_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	const struct regmap_config *regmap;
+	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
 	struct sec_pmic_dev *sec_pmic;
 	unsigned long device_type;
@@ -349,22 +330,19 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	sec_pmic->dev = &i2c->dev;
 	sec_pmic->i2c = i2c;
 	sec_pmic->irq = i2c->irq;
-	device_type = sec_i2c_get_driver_data(i2c, id);
-
-	if (sec_pmic->dev->of_node) {
-		pdata = sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev);
-		if (IS_ERR(pdata)) {
-			ret = PTR_ERR(pdata);
-			return ret;
-		}
-		pdata->device_type = device_type;
-	}
-	if (pdata) {
-		sec_pmic->device_type = pdata->device_type;
-		sec_pmic->irq_base = pdata->irq_base;
-		sec_pmic->wakeup = pdata->wakeup;
-		sec_pmic->pdata = pdata;
+	device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
+
+	pdata = sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev);
+	if (IS_ERR(pdata)) {
+		ret = PTR_ERR(pdata);
+		return ret;
 	}
+	pdata->device_type = device_type;
+
+	sec_pmic->device_type = pdata->device_type;
+	sec_pmic->irq_base = pdata->irq_base;
+	sec_pmic->wakeup = pdata->wakeup;
+	sec_pmic->pdata = pdata;
 
 	switch (sec_pmic->device_type) {
 	case S2MPA01:
@@ -404,7 +382,7 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	if (pdata && pdata->cfg_pmic_irq)
+	if (pdata->cfg_pmic_irq)
 		pdata->cfg_pmic_irq();
 
 	sec_irq_init(sec_pmic);
@@ -529,21 +507,14 @@ static int sec_pmic_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 
-static const struct i2c_device_id sec_pmic_id[] = {
-	{ "sec_pmic", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, sec_pmic_id);
-
 static struct i2c_driver sec_pmic_driver = {
 	.driver = {
 		   .name = "sec_pmic",
 		   .pm = &sec_pmic_pm_ops,
-		   .of_match_table = of_match_ptr(sec_dt_match),
+		   .of_match_table = sec_dt_match,
 	},
 	.probe = sec_pmic_probe,
 	.shutdown = sec_pmic_shutdown,
-	.id_table = sec_pmic_id,
 };
 module_i2c_driver(sec_pmic_driver);
 
-- 
2.25.1


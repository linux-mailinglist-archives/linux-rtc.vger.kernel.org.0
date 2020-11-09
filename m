Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2B62AC0EF
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Nov 2020 17:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbgKIQe2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Nov 2020 11:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730470AbgKIQe1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Nov 2020 11:34:27 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34399C0613D3
        for <linux-rtc@vger.kernel.org>; Mon,  9 Nov 2020 08:34:26 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id r17so5446954wrw.1
        for <linux-rtc@vger.kernel.org>; Mon, 09 Nov 2020 08:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EdWO80ekdIGOam/IycY9P9YIMIf9q8yGCtQJH+FwiQk=;
        b=kRDtCA+CDf+cOEZ0aZyeOBAILZVes6wSjrhzDDop+01V0CfVKHyyZkPncHDTEvxiGF
         G7iXdCuTYKTOA49DQLhpQCyIphHtoY78Ll9JQIqnRxVI5cappbo5lWLJhHDPnHOe+BFN
         XYnXtOuwuaIfJ//HROOCtzAodohvpKi4byKm1bE78KDGkNc/7XKLu+CCzXvUODfeym4C
         noIxc4KpsoGKYDrMFiWHtYDhkW5SGu80pFqil8oTDNogjNdvYNV5fp7y3bIve/mbjZDz
         Sv27VhOUf8wm/7u5OasNifBSWF42dwTLM482OjAA3JYx0xaLrdjE3eMHOHxQTqO7m8Bh
         t/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdWO80ekdIGOam/IycY9P9YIMIf9q8yGCtQJH+FwiQk=;
        b=ZDPrX4WNpP7N8gEa1vMciO/daf1GUgGD2vKwPuu5IctijFUlZX2+P5IBtDIO08mTvs
         NMkaGVyG+eDDjHAwysS4mFgrV6xGYPJxkuiM69D+YTcBbCVXxBpgrpNZ6VJABQisxFkm
         XWu+OCRYxAY0TQw9AcdZax799dwZvPecXQTjdOD5J782URdjiqoU7zl1A/H3Sony+Znj
         5fYWYObCkgsloA42mq9YLM2xY0JwtPT15IDAe1teHOXzThkGd5IBJbIt5sETiqprXsuQ
         Y/NmrRlawYeaiPogddr2Q97irvaKjHkkoZWCYNwkR/fvGgId4jA7QZ7V5U6h+c0GZcvW
         g7PA==
X-Gm-Message-State: AOAM532OWy7xReJ0tbI6Na+kKnjxHzbKtvilFL+A48runBH2bA1abxce
        yp163qg0d/a/R5ds8UB/ArwA7A==
X-Google-Smtp-Source: ABdhPJzmToGJfdf4lTCtm+PA/1BBsuadSZaznILUFizTSxQzjdyvTemokQRpXWHtNktN02TWnDczmw==
X-Received: by 2002:a05:6000:100f:: with SMTP id a15mr18521513wrx.309.1604939664890;
        Mon, 09 Nov 2020 08:34:24 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id 89sm15072542wrp.58.2020.11.09.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 08:34:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 5/8] rtc: add devm_ prefix to rtc_nvmem_register()
Date:   Mon,  9 Nov 2020 17:34:06 +0100
Message-Id: <20201109163409.24301-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109163409.24301-1-brgl@bgdev.pl>
References: <20201109163409.24301-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

rtc_nvmem_register() is a managed interface. It doesn't require any
release function to be called at driver detach. To avoid confusing
driver authors, let's rename it to devm_rtc_nvmem_register() and add it
to the list of managed interfaces in Documentation/.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 drivers/rtc/nvmem.c                              | 4 ++--
 drivers/rtc/rtc-cmos.c                           | 2 +-
 drivers/rtc/rtc-ds1305.c                         | 2 +-
 drivers/rtc/rtc-ds1307.c                         | 2 +-
 drivers/rtc/rtc-ds1343.c                         | 2 +-
 drivers/rtc/rtc-ds1511.c                         | 2 +-
 drivers/rtc/rtc-ds1553.c                         | 2 +-
 drivers/rtc/rtc-ds1685.c                         | 2 +-
 drivers/rtc/rtc-ds1742.c                         | 2 +-
 drivers/rtc/rtc-ds3232.c                         | 2 +-
 drivers/rtc/rtc-isl12026.c                       | 2 +-
 drivers/rtc/rtc-isl1208.c                        | 2 +-
 drivers/rtc/rtc-m48t59.c                         | 2 +-
 drivers/rtc/rtc-m48t86.c                         | 2 +-
 drivers/rtc/rtc-meson.c                          | 2 +-
 drivers/rtc/rtc-omap.c                           | 2 +-
 drivers/rtc/rtc-pcf2127.c                        | 2 +-
 drivers/rtc/rtc-pcf85063.c                       | 2 +-
 drivers/rtc/rtc-pcf85363.c                       | 2 +-
 drivers/rtc/rtc-rp5c01.c                         | 2 +-
 drivers/rtc/rtc-rv3028.c                         | 4 ++--
 drivers/rtc/rtc-rv3029c2.c                       | 2 +-
 drivers/rtc/rtc-rv3032.c                         | 4 ++--
 drivers/rtc/rtc-rv8803.c                         | 2 +-
 drivers/rtc/rtc-rx8581.c                         | 2 +-
 drivers/rtc/rtc-stk17ta8.c                       | 2 +-
 drivers/rtc/rtc-tx4939.c                         | 2 +-
 include/linux/rtc.h                              | 8 ++++----
 29 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 6ffc0f07404f..5df7ba54a4ba 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -414,6 +414,7 @@ RESET
 RTC
   devm_rtc_device_register()
   devm_rtc_allocate_device()
+  devm_rtc_nvmem_register()
 
 SERDEV
   devm_serdev_device_open()
diff --git a/drivers/rtc/nvmem.c b/drivers/rtc/nvmem.c
index 5e0b178a3b65..7502deb6390e 100644
--- a/drivers/rtc/nvmem.c
+++ b/drivers/rtc/nvmem.c
@@ -10,7 +10,7 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/rtc.h>
 
-int rtc_nvmem_register(struct rtc_device *rtc,
+int devm_rtc_nvmem_register(struct rtc_device *rtc,
 		       struct nvmem_config *nvmem_config)
 {
 	struct nvmem_device *nvmem;
@@ -24,4 +24,4 @@ int rtc_nvmem_register(struct rtc_device *rtc,
 
 	return PTR_ERR_OR_ZERO(nvmem);
 }
-EXPORT_SYMBOL_GPL(rtc_nvmem_register);
+EXPORT_SYMBOL_GPL(devm_rtc_nvmem_register);
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index adca0de76e53..eea91c1538aa 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -869,7 +869,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 
 	/* export at least the first block of NVRAM */
 	nvmem_cfg.size = address_space - NVRAM_OFFSET;
-	if (rtc_nvmem_register(cmos_rtc.rtc, &nvmem_cfg))
+	if (devm_rtc_nvmem_register(cmos_rtc.rtc, &nvmem_cfg))
 		dev_err(dev, "nvmem registration failed\n");
 
 	dev_info(dev, "%s%s, %d bytes nvram%s\n",
diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index a1ed539d41b4..a4e768261b43 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -698,7 +698,7 @@ static int ds1305_probe(struct spi_device *spi)
 	if (status)
 		return status;
 
-	rtc_nvmem_register(ds1305->rtc, &ds1305_nvmem_cfg);
+	devm_rtc_nvmem_register(ds1305->rtc, &ds1305_nvmem_cfg);
 
 	/* Maybe set up alarm IRQ; be ready to handle it triggering right
 	 * away.  NOTE that we don't share this.  The signal is active low,
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 2e6063807bd4..1dc377e0b225 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -2047,7 +2047,7 @@ static int ds1307_probe(struct i2c_client *client,
 			.priv = ds1307,
 		};
 
-		rtc_nvmem_register(ds1307->rtc, &nvmem_cfg);
+		devm_rtc_nvmem_register(ds1307->rtc, &nvmem_cfg);
 	}
 
 	ds1307_hwmon_register(ds1307);
diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index e7604e844cbd..ea663e24a34c 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -413,7 +413,7 @@ static int ds1343_probe(struct spi_device *spi)
 		return res;
 
 	nvmem_cfg.priv = priv;
-	rtc_nvmem_register(priv->rtc, &nvmem_cfg);
+	devm_rtc_nvmem_register(priv->rtc, &nvmem_cfg);
 
 	priv->irq = spi->irq;
 
diff --git a/drivers/rtc/rtc-ds1511.c b/drivers/rtc/rtc-ds1511.c
index 33c483d759c8..d5f48216e851 100644
--- a/drivers/rtc/rtc-ds1511.c
+++ b/drivers/rtc/rtc-ds1511.c
@@ -470,7 +470,7 @@ static int ds1511_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rtc_nvmem_register(pdata->rtc, &ds1511_nvmem_cfg);
+	devm_rtc_nvmem_register(pdata->rtc, &ds1511_nvmem_cfg);
 
 	/*
 	 * if the platform has an interrupt in mind for this device,
diff --git a/drivers/rtc/rtc-ds1553.c b/drivers/rtc/rtc-ds1553.c
index c6a5563504e5..2d2eb739d92b 100644
--- a/drivers/rtc/rtc-ds1553.c
+++ b/drivers/rtc/rtc-ds1553.c
@@ -309,7 +309,7 @@ static int ds1553_rtc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (rtc_nvmem_register(pdata->rtc, &nvmem_cfg))
+	if (devm_rtc_nvmem_register(pdata->rtc, &nvmem_cfg))
 		dev_err(&pdev->dev, "unable to register nvmem\n");
 
 	return 0;
diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 9043c96e8845..bef588fce266 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1317,7 +1317,7 @@ ds1685_rtc_probe(struct platform_device *pdev)
 		return ret;
 
 	nvmem_cfg.priv = rtc;
-	ret = rtc_nvmem_register(rtc_dev, &nvmem_cfg);
+	ret = devm_rtc_nvmem_register(rtc_dev, &nvmem_cfg);
 	if (ret)
 		return ret;
 
diff --git a/drivers/rtc/rtc-ds1742.c b/drivers/rtc/rtc-ds1742.c
index 291bbed90ef8..29792a8cce97 100644
--- a/drivers/rtc/rtc-ds1742.c
+++ b/drivers/rtc/rtc-ds1742.c
@@ -195,7 +195,7 @@ static int ds1742_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (rtc_nvmem_register(rtc, &nvmem_cfg))
+	if (devm_rtc_nvmem_register(rtc, &nvmem_cfg))
 		dev_err(&pdev->dev, "Unable to register nvmem\n");
 
 	return 0;
diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index 69c37ab64352..16b89035d135 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -518,7 +518,7 @@ static int ds3232_probe(struct device *dev, struct regmap *regmap, int irq,
 	if (IS_ERR(ds3232->rtc))
 		return PTR_ERR(ds3232->rtc);
 
-	ret = rtc_nvmem_register(ds3232->rtc, &nvmem_cfg);
+	ret = devm_rtc_nvmem_register(ds3232->rtc, &nvmem_cfg);
 	if(ret)
 		return ret;
 
diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 5b6b17fb6d62..fff8d8253669 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -465,7 +465,7 @@ static int isl12026_probe_new(struct i2c_client *client)
 
 	priv->rtc->ops = &isl12026_rtc_ops;
 	nvm_cfg.priv = priv;
-	ret = rtc_nvmem_register(priv->rtc, &nvm_cfg);
+	ret = devm_rtc_nvmem_register(priv->rtc, &nvm_cfg);
 	if (ret)
 		return ret;
 
diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index ebb691fa48a6..08d778b10e9e 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -890,7 +890,7 @@ isl1208_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (rc)
 		return rc;
 
-	rc = rtc_nvmem_register(isl1208->rtc, &isl1208->nvmem_config);
+	rc = devm_rtc_nvmem_register(isl1208->rtc, &isl1208->nvmem_config);
 	if (rc)
 		return rc;
 
diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index ee1d8f0146fd..e966a66ab2d3 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -466,7 +466,7 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	m48t59->rtc->ops = ops;
 
 	nvmem_cfg.size = pdata->offset;
-	ret = rtc_nvmem_register(m48t59->rtc, &nvmem_cfg);
+	ret = devm_rtc_nvmem_register(m48t59->rtc, &nvmem_cfg);
 	if (ret)
 		return ret;
 
diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index 2b1135590dd5..182cfe59e4e0 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -259,7 +259,7 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	rtc_nvmem_register(info->rtc, &m48t86_nvmem_cfg);
+	devm_rtc_nvmem_register(info->rtc, &m48t86_nvmem_cfg);
 
 	/* read battery status */
 	reg = m48t86_readb(&pdev->dev, M48T86_D);
diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 47ebcf834cc2..938267713a4d 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -365,7 +365,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	}
 
 	meson_rtc_nvmem_config.priv = rtc;
-	ret = rtc_nvmem_register(rtc->rtc, &meson_rtc_nvmem_config);
+	ret = devm_rtc_nvmem_register(rtc->rtc, &meson_rtc_nvmem_config);
 	if (ret)
 		goto out_disable_vdd;
 
diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 606fa80ad6e0..e65f79fc7718 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -890,7 +890,7 @@ static int omap_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	rtc_nvmem_register(rtc->rtc, &omap_rtc_nvmem_config);
+	devm_rtc_nvmem_register(rtc->rtc, &omap_rtc_nvmem_config);
 
 	if (rtc->is_pmic_controller) {
 		if (!pm_power_off) {
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 07a5630ec841..b803bbbca7b8 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -594,7 +594,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			.size = 512,
 		};
 
-		ret = rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
+		ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
 	/*
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index f8b99cb72959..c19f139e9b8d 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -607,7 +607,7 @@ static int pcf85063_probe(struct i2c_client *client)
 	}
 
 	nvmem_cfg.priv = pcf85063->regmap;
-	rtc_nvmem_register(pcf85063->rtc, &nvmem_cfg);
+	devm_rtc_nvmem_register(pcf85063->rtc, &nvmem_cfg);
 
 #ifdef CONFIG_COMMON_CLK
 	/* register clk in common clk framework */
diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 3450d615974d..23cf14ca2c96 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -422,7 +422,7 @@ static int pcf85363_probe(struct i2c_client *client,
 
 	for (i = 0; i < config->num_nvram; i++) {
 		nvmem_cfg[i].priv = pcf85363;
-		rtc_nvmem_register(pcf85363->rtc, &nvmem_cfg[i]);
+		devm_rtc_nvmem_register(pcf85363->rtc, &nvmem_cfg[i]);
 	}
 
 	return ret;
diff --git a/drivers/rtc/rtc-rp5c01.c b/drivers/rtc/rtc-rp5c01.c
index a69e8adcc4a1..8bc476c0905f 100644
--- a/drivers/rtc/rtc-rp5c01.c
+++ b/drivers/rtc/rtc-rp5c01.c
@@ -255,7 +255,7 @@ static int __init rp5c01_rtc_probe(struct platform_device *dev)
 	priv->rtc = rtc;
 
 	nvmem_cfg.priv = priv;
-	error = rtc_nvmem_register(rtc, &nvmem_cfg);
+	error = devm_rtc_nvmem_register(rtc, &nvmem_cfg);
 	if (error)
 		return error;
 
diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index fa226f0fe67d..f788df979750 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -891,9 +891,9 @@ static int rv3028_probe(struct i2c_client *client)
 		return ret;
 
 	nvmem_cfg.priv = rv3028->regmap;
-	rtc_nvmem_register(rv3028->rtc, &nvmem_cfg);
+	devm_rtc_nvmem_register(rv3028->rtc, &nvmem_cfg);
 	eeprom_cfg.priv = rv3028;
-	rtc_nvmem_register(rv3028->rtc, &eeprom_cfg);
+	devm_rtc_nvmem_register(rv3028->rtc, &eeprom_cfg);
 
 	rv3028->rtc->max_user_freq = 1;
 
diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 62718231731b..ad359b3b74b2 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -755,7 +755,7 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 		return rc;
 
 	nvmem_cfg.priv = rv3029->regmap;
-	rtc_nvmem_register(rv3029->rtc, &nvmem_cfg);
+	devm_rtc_nvmem_register(rv3029->rtc, &nvmem_cfg);
 
 	return 0;
 }
diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 3e67f71f4261..c95fa7cd0bfe 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -890,9 +890,9 @@ static int rv3032_probe(struct i2c_client *client)
 		return ret;
 
 	nvmem_cfg.priv = rv3032;
-	rtc_nvmem_register(rv3032->rtc, &nvmem_cfg);
+	devm_rtc_nvmem_register(rv3032->rtc, &nvmem_cfg);
 	eeprom_cfg.priv = rv3032;
-	rtc_nvmem_register(rv3032->rtc, &eeprom_cfg);
+	devm_rtc_nvmem_register(rv3032->rtc, &eeprom_cfg);
 
 	rv3032->rtc->max_user_freq = 1;
 
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 1d888da48c7c..44e1818a751c 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -591,7 +591,7 @@ static int rv8803_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	rtc_nvmem_register(rv8803->rtc, &nvmem_cfg);
+	devm_rtc_nvmem_register(rv8803->rtc, &nvmem_cfg);
 
 	rv8803->rtc->max_user_freq = 1;
 
diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 490f70f57636..017f74721cc0 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -302,7 +302,7 @@ static int rx8581_probe(struct i2c_client *client,
 
 	for (i = 0; i < config->num_nvram; i++) {
 		nvmem_cfg[i].priv = rx8581;
-		rtc_nvmem_register(rx8581->rtc, &nvmem_cfg[i]);
+		devm_rtc_nvmem_register(rx8581->rtc, &nvmem_cfg[i]);
 	}
 
 	return ret;
diff --git a/drivers/rtc/rtc-stk17ta8.c b/drivers/rtc/rtc-stk17ta8.c
index 1ccf0d5d05b4..ad616bce7bca 100644
--- a/drivers/rtc/rtc-stk17ta8.c
+++ b/drivers/rtc/rtc-stk17ta8.c
@@ -313,7 +313,7 @@ static int stk17ta8_rtc_probe(struct platform_device *pdev)
 	pdata->rtc->ops = &stk17ta8_rtc_ops;
 
 	nvmem_cfg.priv = pdata;
-	ret = rtc_nvmem_register(pdata->rtc, &nvmem_cfg);
+	ret = devm_rtc_nvmem_register(pdata->rtc, &nvmem_cfg);
 	if (ret)
 		return ret;
 
diff --git a/drivers/rtc/rtc-tx4939.c b/drivers/rtc/rtc-tx4939.c
index abbb62b14d7a..11f46272bad3 100644
--- a/drivers/rtc/rtc-tx4939.c
+++ b/drivers/rtc/rtc-tx4939.c
@@ -271,7 +271,7 @@ static int __init tx4939_rtc_probe(struct platform_device *pdev)
 	pdata->rtc = rtc;
 
 	nvmem_cfg.priv = pdata;
-	ret = rtc_nvmem_register(rtc, &nvmem_cfg);
+	ret = devm_rtc_nvmem_register(rtc, &nvmem_cfg);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 0983ab9faffb..cbca651d8ca4 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -244,11 +244,11 @@ extern int rtc_hctosys_ret;
 #endif
 
 #ifdef CONFIG_RTC_NVMEM
-int rtc_nvmem_register(struct rtc_device *rtc,
-		       struct nvmem_config *nvmem_config);
+int devm_rtc_nvmem_register(struct rtc_device *rtc,
+			    struct nvmem_config *nvmem_config);
 #else
-static inline int rtc_nvmem_register(struct rtc_device *rtc,
-				     struct nvmem_config *nvmem_config)
+static inline int devm_rtc_nvmem_register(struct rtc_device *rtc,
+					  struct nvmem_config *nvmem_config)
 {
 	return 0;
 }
-- 
2.29.1


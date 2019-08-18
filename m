Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC002919D9
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 00:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfHRWAs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 18 Aug 2019 18:00:48 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:53651 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfHRWAs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 18 Aug 2019 18:00:48 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1D085240003;
        Sun, 18 Aug 2019 22:00:43 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] rtc: remove superfluous error message
Date:   Mon, 19 Aug 2019 00:00:41 +0200
Message-Id: <20190818220041.17833-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818220041.17833-1-alexandre.belloni@bootlin.com>
References: <20190818220041.17833-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC core now has error messages in case of registration failure, there
is no need to have other messages in the drivers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-88pm80x.c           |  5 ++---
 drivers/rtc/rtc-ab-eoz9.c           | 24 ++++++++----------------
 drivers/rtc/rtc-ac100.c             | 10 +---------
 drivers/rtc/rtc-armada38x.c         |  6 +-----
 drivers/rtc/rtc-aspeed.c            |  6 +-----
 drivers/rtc/rtc-bd70528.c           |  6 +-----
 drivers/rtc/rtc-brcmstb-waketimer.c |  4 +---
 drivers/rtc/rtc-cadence.c           | 13 +++----------
 drivers/rtc/rtc-ds1305.c            |  7 ++-----
 drivers/rtc/rtc-imx-sc.c            |  4 +---
 drivers/rtc/rtc-jz4740.c            |  4 +---
 drivers/rtc/rtc-mt6397.c            |  4 +---
 drivers/rtc/rtc-puv3.c              |  4 +---
 drivers/rtc/rtc-rv3028.c            |  3 +--
 drivers/rtc/rtc-rv8803.c            |  3 +--
 drivers/rtc/rtc-sc27xx.c            |  1 -
 drivers/rtc/rtc-sd3078.c            |  4 +---
 drivers/rtc/rtc-sunxi.c             | 10 +---------
 drivers/rtc/rtc-tegra.c             |  4 +---
 drivers/rtc/rtc-tps6586x.c          |  5 +----
 drivers/rtc/rtc-tps65910.c          |  8 +-------
 21 files changed, 31 insertions(+), 104 deletions(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index 9aa4a59dbf47..75779e8501a3 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -295,10 +295,9 @@ static int pm80x_rtc_probe(struct platform_device *pdev)
 	info->rtc_dev->range_max = U32_MAX;
 
 	ret = rtc_register_device(info->rtc_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
+	if (ret)
 		goto out_rtc;
-	}
+
 	/*
 	 * enable internal XO instead of internal 3.25MHz clock since it can
 	 * free running in PMIC power-down state.
diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index e4f6e0061ccf..d690985caa4c 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -390,35 +390,31 @@ static int abeoz9_probe(struct i2c_client *client,
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
 				     I2C_FUNC_SMBUS_BYTE_DATA |
-				     I2C_FUNC_SMBUS_I2C_BLOCK)) {
-		ret = -ENODEV;
-		goto err;
-	}
+				     I2C_FUNC_SMBUS_I2C_BLOCK))
+		return -ENODEV;
 
 	regmap = devm_regmap_init_i2c(client, &abeoz9_rtc_regmap_config);
 	if (IS_ERR(regmap)) {
 		ret = PTR_ERR(regmap);
 		dev_err(dev, "regmap allocation failed: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!data)
+		return -ENOMEM;
 
 	data->regmap = regmap;
 	dev_set_drvdata(dev, data);
 
 	ret = abeoz9_rtc_setup(dev, client->dev.of_node);
 	if (ret)
-		goto err;
+		return ret;
 
 	data->rtc = devm_rtc_allocate_device(dev);
 	ret = PTR_ERR_OR_ZERO(data->rtc);
 	if (ret)
-		goto err;
+		return ret;
 
 	data->rtc->ops = &rtc_ops;
 	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
@@ -426,14 +422,10 @@ static int abeoz9_probe(struct i2c_client *client,
 
 	ret = rtc_register_device(data->rtc);
 	if (ret)
-		goto err;
+		return ret;
 
 	abeoz9_hwmon_register(dev, data);
 	return 0;
-
-err:
-	dev_err(dev, "unable to register RTC device (%d)\n", ret);
-	return ret;
 }
 
 #ifdef CONFIG_OF
diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index a4dcf2950396..29223931aba7 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -610,15 +610,7 @@ static int ac100_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = rtc_register_device(chip->rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to register device\n");
-		return ret;
-	}
-
-	dev_info(&pdev->dev, "RTC enabled\n");
-
-	return 0;
+	return rtc_register_device(chip->rtc);
 }
 
 static int ac100_rtc_remove(struct platform_device *pdev)
diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index 8e8b8079b60a..2ed227b56084 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -561,11 +561,7 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
 
 	rtc->rtc_dev->range_max = U32_MAX;
 
-	ret = rtc_register_device(rtc->rtc_dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
-
-	return ret;
+	return rtc_register_device(rtc->rtc_dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index af3eb676d7c3..75cdb91b0863 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -107,11 +107,7 @@ static int aspeed_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
 	rtc->rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
 
-	ret = rtc_register_device(rtc->rtc_dev);
-	if (ret)
-		return ret;
-
-	return 0;
+	return rtc_register_device(rtc->rtc_dev);
 }
 
 static const struct of_device_id aspeed_rtc_match[] = {
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 3e745c05bc22..7744333b0f40 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -476,11 +476,7 @@ static int bd70528_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = rtc_register_device(rtc);
-	if (ret)
-		dev_err(&pdev->dev, "Registering RTC failed\n");
-
-	return ret;
+	return rtc_register_device(rtc);
 }
 
 static struct platform_driver bd70528_rtc = {
diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index 2f65943867f5..3e9800f9878a 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -255,10 +255,8 @@ static int brcmstb_waketmr_probe(struct platform_device *pdev)
 	timer->rtc->range_max = U32_MAX;
 
 	ret = rtc_register_device(timer->rtc);
-	if (ret) {
-		dev_err(dev, "unable to register device\n");
+	if (ret)
 		goto err_notifier;
-	}
 
 	dev_info(dev, "registered, with irq %d\n", timer->irq);
 
diff --git a/drivers/rtc/rtc-cadence.c b/drivers/rtc/rtc-cadence.c
index 3b7d643c8a63..592aae23cbaf 100644
--- a/drivers/rtc/rtc-cadence.c
+++ b/drivers/rtc/rtc-cadence.c
@@ -289,12 +289,8 @@ static int cdns_rtc_probe(struct platform_device *pdev)
 	}
 
 	crtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(crtc->rtc_dev)) {
-		ret = PTR_ERR(crtc->rtc_dev);
-		dev_err(&pdev->dev,
-			"Failed to allocate the RTC device, %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(crtc->rtc_dev))
+		return PTR_ERR(crtc->rtc_dev);
 
 	platform_set_drvdata(pdev, crtc);
 
@@ -343,11 +339,8 @@ static int cdns_rtc_probe(struct platform_device *pdev)
 	writel(CDNS_RTC_KRTCR_KRTC, crtc->regs + CDNS_RTC_KRTCR);
 
 	ret = rtc_register_device(crtc->rtc_dev);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Failed to register the RTC device, %d\n", ret);
+	if (ret)
 		goto err_disable_wakeup;
-	}
 
 	return 0;
 
diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index e04d6e862c42..4420fbf2f8fe 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -690,19 +690,16 @@ static int ds1305_probe(struct spi_device *spi)
 
 	/* register RTC ... from here on, ds1305->ctrl needs locking */
 	ds1305->rtc = devm_rtc_allocate_device(&spi->dev);
-	if (IS_ERR(ds1305->rtc)) {
+	if (IS_ERR(ds1305->rtc))
 		return PTR_ERR(ds1305->rtc);
-	}
 
 	ds1305->rtc->ops = &ds1305_ops;
 
 	ds1305_nvmem_cfg.priv = ds1305;
 	ds1305->rtc->nvram_old_abi = true;
 	status = rtc_register_device(ds1305->rtc);
-	if (status) {
-		dev_dbg(&spi->dev, "register rtc --> %d\n", status);
+	if (status)
 		return status;
-	}
 
 	rtc_nvmem_register(ds1305->rtc, &ds1305_nvmem_cfg);
 
diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
index c933045fe04b..cf2c12107f2b 100644
--- a/drivers/rtc/rtc-imx-sc.c
+++ b/drivers/rtc/rtc-imx-sc.c
@@ -167,10 +167,8 @@ static int imx_sc_rtc_probe(struct platform_device *pdev)
 	imx_sc_rtc->range_max = U32_MAX;
 
 	ret = rtc_register_device(imx_sc_rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register rtc: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	imx_scu_irq_register_notifier(&imx_sc_rtc_alarm_sc_notifier);
 
diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 3ec6bb230cd5..3089645e0ce8 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -360,10 +360,8 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	rtc->rtc->range_max = U32_MAX;
 
 	ret = rtc_register_device(rtc->rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register rtc device: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_request_irq(&pdev->dev, rtc->irq, jz4740_rtc_irq, 0,
 				pdev->name, rtc);
diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index b46ed4dc7015..704229eb0cac 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -343,10 +343,8 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
 
 	ret = rtc_register_device(rtc->rtc_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "register rtc device failed\n");
+	if (ret)
 		goto out_free_irq;
-	}
 
 	return 0;
 
diff --git a/drivers/rtc/rtc-puv3.c b/drivers/rtc/rtc-puv3.c
index 56a7cf1547a7..89ff713163dd 100644
--- a/drivers/rtc/rtc-puv3.c
+++ b/drivers/rtc/rtc-puv3.c
@@ -235,10 +235,8 @@ static int puv3_rtc_probe(struct platform_device *pdev)
 	/* register RTC and exit */
 	rtc->ops = &puv3_rtcops;
 	ret = rtc_register_device(rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "cannot attach rtc\n");
+	if (ret)
 		goto err_nortc;
-	}
 
 	/* platform setup code should have handled this; sigh */
 	if (!device_can_wakeup(&pdev->dev))
diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 06884ebb7a61..2b316661a578 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -639,9 +639,8 @@ static int rv3028_probe(struct i2c_client *client)
 		dev_warn(&client->dev, "An alarm may have been missed.\n");
 
 	rv3028->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(rv3028->rtc)) {
+	if (IS_ERR(rv3028->rtc))
 		return PTR_ERR(rv3028->rtc);
-	}
 
 	if (client->irq > 0) {
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index fc5243400108..4960f0a2b249 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -564,9 +564,8 @@ static int rv8803_probe(struct i2c_client *client,
 		dev_warn(&client->dev, "An alarm maybe have been missed.\n");
 
 	rv8803->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(rv8803->rtc)) {
+	if (IS_ERR(rv8803->rtc))
 		return PTR_ERR(rv8803->rtc);
-	}
 
 	if (client->irq > 0) {
 		err = devm_request_threaded_irq(&client->dev, client->irq,
diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index 698e1e51efca..3474f7a20493 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -654,7 +654,6 @@ static int sprd_rtc_probe(struct platform_device *pdev)
 	rtc->rtc->range_max = 5662310399LL;
 	ret = rtc_register_device(rtc->rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register rtc device\n");
 		device_init_wakeup(&pdev->dev, 0);
 		return ret;
 	}
diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index 42cb90db7f94..a7aa943c1183 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -193,10 +193,8 @@ static int sd3078_probe(struct i2c_client *client,
 	sd3078->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	ret = rtc_register_device(sd3078->rtc);
-	if (ret) {
-		dev_err(&client->dev, "failed to register rtc device\n");
+	if (ret)
 		return ret;
-	}
 
 	sd3078_enable_reg_write(sd3078);
 
diff --git a/drivers/rtc/rtc-sunxi.c b/drivers/rtc/rtc-sunxi.c
index 0bb69a7f9e46..9b6f2483c1c6 100644
--- a/drivers/rtc/rtc-sunxi.c
+++ b/drivers/rtc/rtc-sunxi.c
@@ -472,15 +472,7 @@ static int sunxi_rtc_probe(struct platform_device *pdev)
 
 	chip->rtc->ops = &sunxi_rtc_ops;
 
-	ret = rtc_register_device(chip->rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to register device\n");
-		return ret;
-	}
-
-	dev_info(&pdev->dev, "RTC enabled\n");
-
-	return 0;
+	return rtc_register_device(chip->rtc);
 }
 
 static struct platform_driver sunxi_rtc_driver = {
diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 14bf835229e6..69d695bf9500 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -332,10 +332,8 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	}
 
 	ret = rtc_register_device(info->rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register device: %d\n", ret);
+	if (ret)
 		goto disable_clk;
-	}
 
 	dev_notice(&pdev->dev, "Tegra internal Real Time Clock\n");
 
diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index d6434e514a52..859d901fa6cb 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -259,7 +259,6 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc)) {
 		ret = PTR_ERR(rtc->rtc);
-		dev_err(&pdev->dev, "RTC allocate device: ret %d\n", ret);
 		goto fail_rtc_register;
 	}
 
@@ -280,10 +279,8 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 	disable_irq(rtc->irq);
 
 	ret = rtc_register_device(rtc->rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "RTC device register: ret %d\n", ret);
+	if (ret)
 		goto fail_rtc_register;
-	}
 
 	return 0;
 
diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index 7078f6da1cbc..2c0467a9e717 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -425,13 +425,7 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
 	tps_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	tps_rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	ret = rtc_register_device(tps_rtc->rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "RTC device register: err %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return rtc_register_device(tps_rtc->rtc);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.21.0


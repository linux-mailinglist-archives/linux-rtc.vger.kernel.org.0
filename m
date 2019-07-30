Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE977B194
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jul 2019 20:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388046AbfG3SSf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Jul 2019 14:18:35 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38087 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388044AbfG3SQc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Jul 2019 14:16:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so30269890pfn.5
        for <linux-rtc@vger.kernel.org>; Tue, 30 Jul 2019 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XTLaosyoqzCcWrscKTb+G2WqCKPqrc+O6Jsxt+wg5Oc=;
        b=hROCUSUAICU4ySTuieMSmi8VrJWcPrS1+o8O2BfXsNuFwRVr9+iExeWmw64ZE4lKDZ
         WPM/SLNJfX4xHbkAKKxxZlYBNuDKTTqWntK7zqFHE5AJRKB8AzsQCgYLfzjbFrwmVJvM
         9Vbsrfs37OpxUlM1n24KID23GNcEgEzboPs7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XTLaosyoqzCcWrscKTb+G2WqCKPqrc+O6Jsxt+wg5Oc=;
        b=Txh2ifWNbZy6s/pcWKA3oUrYWq+cHE6DV8k6cUzn78Yl+puYD4BgIEOO976ff8TJby
         ccgPcZxkLKLzQLBq+AExFWnEtKo4wMEsYWzDQauU68xqWIbDY9+1BvfkllnSMEXtVbtU
         qfeXmy0JV+cWxDSzTAzJcs6b72j+mR+b0me1PvSgh48xfe6kif0RQl5UjcESm3oeobAW
         dOVznBxz1D4/TdFq6+Rg34KAl5mLXbYMZ00UffG9yS+lBYRuobs2P1xN7tlhW1NM6p9j
         7mI196FlfU+jyxZJ3URh5/R7wscLKJJfRCJ20uwUFBsaTDxX9pyZKSw9AHX+5wDMyfoA
         L03Q==
X-Gm-Message-State: APjAAAWR2tyH+XuLwHWArXW29ahJncsF+y9ZGOyPZRN+V/Q2Udjs9llb
        Yt2IQZQIs4+kK2ZYNIxSRdmHIw==
X-Google-Smtp-Source: APXvYqzQSs9m0BRQ3h662PZWxePXJe4jVR7JM2JInhtaXxMG3/cRTUC5apiYzKTSUK6jxva9ql4aNw==
X-Received: by 2002:a63:506:: with SMTP id 6mr108698278pgf.434.1564510590797;
        Tue, 30 Jul 2019 11:16:30 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:30 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 39/57] rtc: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:39 -0700
Message-Id: <20190730181557.90391-40-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/rtc/rtc-88pm80x.c    | 1 -
 drivers/rtc/rtc-88pm860x.c   | 4 +---
 drivers/rtc/rtc-ac100.c      | 4 +---
 drivers/rtc/rtc-armada38x.c  | 5 +----
 drivers/rtc/rtc-asm9260.c    | 4 +---
 drivers/rtc/rtc-at91rm9200.c | 4 +---
 drivers/rtc/rtc-at91sam9.c   | 4 +---
 drivers/rtc/rtc-bd70528.c    | 5 +----
 drivers/rtc/rtc-davinci.c    | 4 +---
 drivers/rtc/rtc-jz4740.c     | 4 +---
 drivers/rtc/rtc-max77686.c   | 5 +----
 drivers/rtc/rtc-mt7622.c     | 1 -
 drivers/rtc/rtc-pic32.c      | 4 +---
 drivers/rtc/rtc-pm8xxx.c     | 4 +---
 drivers/rtc/rtc-puv3.c       | 8 ++------
 drivers/rtc/rtc-pxa.c        | 8 ++------
 drivers/rtc/rtc-rk808.c      | 6 +-----
 drivers/rtc/rtc-s3c.c        | 8 ++------
 drivers/rtc/rtc-sc27xx.c     | 4 +---
 drivers/rtc/rtc-spear.c      | 4 +---
 drivers/rtc/rtc-stm32.c      | 1 -
 drivers/rtc/rtc-sun6i.c      | 4 +---
 drivers/rtc/rtc-sunxi.c      | 4 +---
 drivers/rtc/rtc-tegra.c      | 4 +---
 drivers/rtc/rtc-vt8500.c     | 4 +---
 drivers/rtc/rtc-xgene.c      | 4 +---
 drivers/rtc/rtc-zynqmp.c     | 8 ++------
 27 files changed, 28 insertions(+), 92 deletions(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index e4d5a19fd1c9..9aa4a59dbf47 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -264,7 +264,6 @@ static int pm80x_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	info->irq = platform_get_irq(pdev, 0);
 	if (info->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
 		ret = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index 434285f495e0..4743b16a8d84 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -328,10 +328,8 @@ static int pm860x_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 	info->irq = platform_get_irq(pdev, 0);
-	if (info->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
+	if (info->irq < 0)
 		return info->irq;
-	}
 
 	info->chip = chip;
 	info->i2c = (chip->id == CHIP_PM8607) ? chip->client : chip->companion;
diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index 2e5a8b15b222..a4dcf2950396 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -578,10 +578,8 @@ static int ac100_rtc_probe(struct platform_device *pdev)
 	chip->regmap = ac100->regmap;
 
 	chip->irq = platform_get_irq(pdev, 0);
-	if (chip->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
+	if (chip->irq < 0)
 		return chip->irq;
-	}
 
 	chip->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(chip->rtc))
diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index 19d6980e90fb..8e8b8079b60a 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -530,11 +530,8 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc->regs_soc);
 
 	rtc->irq = platform_get_irq(pdev, 0);
-
-	if (rtc->irq < 0) {
-		dev_err(&pdev->dev, "no irq\n");
+	if (rtc->irq < 0)
 		return rtc->irq;
-	}
 
 	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc_dev))
diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index d45a44936308..10413d803caa 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -257,10 +257,8 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	irq_alarm = platform_get_irq(pdev, 0);
-	if (irq_alarm < 0) {
-		dev_err(dev, "No alarm IRQ resource defined\n");
+	if (irq_alarm < 0)
 		return irq_alarm;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->iobase = devm_ioremap_resource(dev, res);
diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index 82a54e93ff04..d119c6e6353e 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -378,10 +378,8 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq resource defined\n");
+	if (irq < 0)
 		return -ENXIO;
-	}
 
 	at91_rtc_regs = devm_ioremap(&pdev->dev, regs->start,
 				     resource_size(regs));
diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 4daf3789b978..bb3ba7bfe6a5 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -342,10 +342,8 @@ static int at91_rtc_probe(struct platform_device *pdev)
 	struct of_phandle_args args;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get interrupt resource\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index f9bdd555e1a2..3e745c05bc22 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -416,11 +416,8 @@ static int bd70528_probe(struct platform_device *pdev)
 	bd_rtc->dev = &pdev->dev;
 
 	irq = platform_get_irq_byname(pdev, "bd70528-rtc-alm");
-
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Failed to get irq\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	platform_set_drvdata(pdev, bd_rtc);
 
diff --git a/drivers/rtc/rtc-davinci.c b/drivers/rtc/rtc-davinci.c
index fcb71bf4d492..d8e0db2e7fc6 100644
--- a/drivers/rtc/rtc-davinci.c
+++ b/drivers/rtc/rtc-davinci.c
@@ -477,10 +477,8 @@ static int __init davinci_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	davinci_rtc->irq = platform_get_irq(pdev, 0);
-	if (davinci_rtc->irq < 0) {
-		dev_err(dev, "no RTC irq\n");
+	if (davinci_rtc->irq < 0)
 		return davinci_rtc->irq;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	davinci_rtc->base = devm_ioremap_resource(dev, res);
diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 9e7b3a04debc..3ec6bb230cd5 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -323,10 +323,8 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 		rtc->type = id->driver_data;
 
 	rtc->irq = platform_get_irq(pdev, 0);
-	if (rtc->irq < 0) {
-		dev_err(&pdev->dev, "Failed to get platform irq\n");
+	if (rtc->irq < 0)
 		return -ENOENT;
-	}
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	rtc->base = devm_ioremap_resource(&pdev->dev, mem);
diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 4aff349ae301..a6135d8258d9 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -673,11 +673,8 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		struct platform_device *pdev = to_platform_device(info->dev);
 
 		info->rtc_irq = platform_get_irq(pdev, 0);
-		if (info->rtc_irq < 0) {
-			dev_err(info->dev, "Failed to get rtc interrupts: %d\n",
-				info->rtc_irq);
+		if (info->rtc_irq < 0)
 			return info->rtc_irq;
-		}
 	} else {
 		info->rtc_irq =  parent_i2c->irq;
 	}
diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 82b0816ec6c1..16bd26b5aa6f 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -329,7 +329,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 
 	hw->irq = platform_get_irq(pdev, 0);
 	if (hw->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
 		ret = hw->irq;
 		goto err;
 	}
diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index 1c4de6e90da0..17653ed52ebb 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -308,10 +308,8 @@ static int pic32_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pdata);
 
 	pdata->alarm_irq = platform_get_irq(pdev, 0);
-	if (pdata->alarm_irq < 0) {
-		dev_err(&pdev->dev, "no irq for alarm\n");
+	if (pdata->alarm_irq < 0)
 		return pdata->alarm_irq;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pdata->reg_base = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 9f9839c47e2f..f5a30e0f16c2 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -468,10 +468,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	}
 
 	rtc_dd->rtc_alarm_irq = platform_get_irq(pdev, 0);
-	if (rtc_dd->rtc_alarm_irq < 0) {
-		dev_err(&pdev->dev, "Alarm IRQ resource absent!\n");
+	if (rtc_dd->rtc_alarm_irq < 0)
 		return -ENXIO;
-	}
 
 	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
 						      "allow-set-time");
diff --git a/drivers/rtc/rtc-puv3.c b/drivers/rtc/rtc-puv3.c
index 63b9e73fb97d..56a7cf1547a7 100644
--- a/drivers/rtc/rtc-puv3.c
+++ b/drivers/rtc/rtc-puv3.c
@@ -186,16 +186,12 @@ static int puv3_rtc_probe(struct platform_device *pdev)
 
 	/* find the IRQs */
 	puv3_rtc_tickno = platform_get_irq(pdev, 1);
-	if (puv3_rtc_tickno < 0) {
-		dev_err(&pdev->dev, "no irq for rtc tick\n");
+	if (puv3_rtc_tickno < 0)
 		return -ENOENT;
-	}
 
 	puv3_rtc_alarmno = platform_get_irq(pdev, 0);
-	if (puv3_rtc_alarmno < 0) {
-		dev_err(&pdev->dev, "no irq for alarm\n");
+	if (puv3_rtc_alarmno < 0)
 		return -ENOENT;
-	}
 
 	dev_dbg(&pdev->dev, "PKUnity_rtc: tick irq %d, alarm irq %d\n",
 		 puv3_rtc_tickno, puv3_rtc_alarmno);
diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index a7827fe7fb7b..d2f1d8f754bf 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -324,15 +324,11 @@ static int __init pxa_rtc_probe(struct platform_device *pdev)
 	}
 
 	sa1100_rtc->irq_1hz = platform_get_irq(pdev, 0);
-	if (sa1100_rtc->irq_1hz < 0) {
-		dev_err(dev, "No 1Hz IRQ resource defined\n");
+	if (sa1100_rtc->irq_1hz < 0)
 		return -ENXIO;
-	}
 	sa1100_rtc->irq_alarm = platform_get_irq(pdev, 1);
-	if (sa1100_rtc->irq_alarm < 0) {
-		dev_err(dev, "No alarm IRQ resource defined\n");
+	if (sa1100_rtc->irq_alarm < 0)
 		return -ENXIO;
-	}
 
 	pxa_rtc->base = devm_ioremap(dev, pxa_rtc->ress->start,
 				resource_size(pxa_rtc->ress));
diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
index c34540baa12a..c0334c602e88 100644
--- a/drivers/rtc/rtc-rk808.c
+++ b/drivers/rtc/rtc-rk808.c
@@ -434,12 +434,8 @@ static int rk808_rtc_probe(struct platform_device *pdev)
 	rk808_rtc->rtc->ops = &rk808_rtc_ops;
 
 	rk808_rtc->irq = platform_get_irq(pdev, 0);
-	if (rk808_rtc->irq < 0) {
-		if (rk808_rtc->irq != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Wake up is not possible as irq = %d\n",
-				rk808_rtc->irq);
+	if (rk808_rtc->irq < 0)
 		return rk808_rtc->irq;
-	}
 
 	/* request alarm irq of rk808 */
 	ret = devm_request_threaded_irq(&pdev->dev, rk808_rtc->irq, NULL,
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 74bf6473a05d..7801249c254b 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -453,10 +453,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
 	/* find the IRQs */
 	info->irq_tick = platform_get_irq(pdev, 1);
-	if (info->irq_tick < 0) {
-		dev_err(&pdev->dev, "no irq for rtc tick\n");
+	if (info->irq_tick < 0)
 		return info->irq_tick;
-	}
 
 	info->dev = &pdev->dev;
 	info->data = of_device_get_match_data(&pdev->dev);
@@ -470,10 +468,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 
 	info->irq_alarm = platform_get_irq(pdev, 0);
-	if (info->irq_alarm < 0) {
-		dev_err(&pdev->dev, "no irq for alarm\n");
+	if (info->irq_alarm < 0)
 		return info->irq_alarm;
-	}
 
 	dev_dbg(&pdev->dev, "s3c2410_rtc: tick irq %d, alarm irq %d\n",
 		info->irq_tick, info->irq_alarm);
diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index b4eb3b3c6c2c..698e1e51efca 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -614,10 +614,8 @@ static int sprd_rtc_probe(struct platform_device *pdev)
 	}
 
 	rtc->irq = platform_get_irq(pdev, 0);
-	if (rtc->irq < 0) {
-		dev_err(&pdev->dev, "failed to get RTC irq number\n");
+	if (rtc->irq < 0)
 		return rtc->irq;
-	}
 
 	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc))
diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
index 0567944fd4f8..9f23b24f466c 100644
--- a/drivers/rtc/rtc-spear.c
+++ b/drivers/rtc/rtc-spear.c
@@ -358,10 +358,8 @@ static int spear_rtc_probe(struct platform_device *pdev)
 
 	/* alarm irqs */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no update irq?\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	status = devm_request_irq(&pdev->dev, irq, spear_rtc_irq, 0, pdev->name,
 			config);
diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 773a1990b93f..2999e33a7e37 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -776,7 +776,6 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 
 	rtc->irq_alarm = platform_get_irq(pdev, 0);
 	if (rtc->irq_alarm <= 0) {
-		dev_err(&pdev->dev, "no alarm irq\n");
 		ret = rtc->irq_alarm;
 		goto err;
 	}
diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index c0e75c373605..dbd676db431e 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -610,10 +610,8 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 	chip->dev = &pdev->dev;
 
 	chip->irq = platform_get_irq(pdev, 0);
-	if (chip->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
+	if (chip->irq < 0)
 		return chip->irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, chip->irq, sun6i_rtc_alarmirq,
 			       0, dev_name(&pdev->dev), chip);
diff --git a/drivers/rtc/rtc-sunxi.c b/drivers/rtc/rtc-sunxi.c
index 6eeabb81106f..0bb69a7f9e46 100644
--- a/drivers/rtc/rtc-sunxi.c
+++ b/drivers/rtc/rtc-sunxi.c
@@ -442,10 +442,8 @@ static int sunxi_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->base);
 
 	chip->irq = platform_get_irq(pdev, 0);
-	if (chip->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
+	if (chip->irq < 0)
 		return chip->irq;
-	}
 	ret = devm_request_irq(&pdev->dev, chip->irq, sunxi_rtc_alarmirq,
 			0, dev_name(&pdev->dev), chip);
 	if (ret) {
diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 8fa1b3febf69..14bf835229e6 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -290,10 +290,8 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(info->base);
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret <= 0) {
-		dev_err(&pdev->dev, "failed to get platform IRQ: %d\n", ret);
+	if (ret <= 0)
 		return ret;
-	}
 
 	info->irq = ret;
 
diff --git a/drivers/rtc/rtc-vt8500.c b/drivers/rtc/rtc-vt8500.c
index f59d232810de..d5d14cf86e0d 100644
--- a/drivers/rtc/rtc-vt8500.c
+++ b/drivers/rtc/rtc-vt8500.c
@@ -212,10 +212,8 @@ static int vt8500_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, vt8500_rtc);
 
 	vt8500_rtc->irq_alarm = platform_get_irq(pdev, 0);
-	if (vt8500_rtc->irq_alarm < 0) {
-		dev_err(&pdev->dev, "No alarm IRQ resource defined\n");
+	if (vt8500_rtc->irq_alarm < 0)
 		return vt8500_rtc->irq_alarm;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	vt8500_rtc->regbase = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index 9888383f0088..9683fbf7c78d 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -157,10 +157,8 @@ static int xgene_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata->rtc);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
+	if (irq < 0)
 		return irq;
-	}
 	ret = devm_request_irq(&pdev->dev, irq, xgene_rtc_interrupt, 0,
 			       dev_name(&pdev->dev), pdata);
 	if (ret) {
diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 00639594de0c..2c762757fb54 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -218,10 +218,8 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(xrtcdev->reg_base);
 
 	xrtcdev->alarm_irq = platform_get_irq_byname(pdev, "alarm");
-	if (xrtcdev->alarm_irq < 0) {
-		dev_err(&pdev->dev, "no irq resource\n");
+	if (xrtcdev->alarm_irq < 0)
 		return xrtcdev->alarm_irq;
-	}
 	ret = devm_request_irq(&pdev->dev, xrtcdev->alarm_irq,
 			       xlnx_rtc_interrupt, 0,
 			       dev_name(&pdev->dev), xrtcdev);
@@ -231,10 +229,8 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	}
 
 	xrtcdev->sec_irq = platform_get_irq_byname(pdev, "sec");
-	if (xrtcdev->sec_irq < 0) {
-		dev_err(&pdev->dev, "no irq resource\n");
+	if (xrtcdev->sec_irq < 0)
 		return xrtcdev->sec_irq;
-	}
 	ret = devm_request_irq(&pdev->dev, xrtcdev->sec_irq,
 			       xlnx_rtc_interrupt, 0,
 			       dev_name(&pdev->dev), xrtcdev);
-- 
Sent by a computer through tubes


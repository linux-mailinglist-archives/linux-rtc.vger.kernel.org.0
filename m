Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB5C2EF30A
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Jan 2021 14:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhAHNap (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Jan 2021 08:30:45 -0500
Received: from mail-lf1-f41.google.com ([209.85.167.41]:35574 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbhAHNao (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Jan 2021 08:30:44 -0500
Received: by mail-lf1-f41.google.com with SMTP id u25so2148178lfc.2;
        Fri, 08 Jan 2021 05:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2qJAwYymfylRIjK4vhriozmue/FnoeApEB0Z+QWfUNU=;
        b=QFCeBBo6KQW5ddd8ze7K2eGd6l85/n3i0VVd+sQ4nwAgHMe9Za6O0ql4JPxVm1z7CM
         0ke03KbJp459IVBiYtZRygMDRTFAGT48+X4uNRz9Wiha4R6lEVpNpjhUICsq7HUM6jaA
         CTJIMaN+ap4lQvlg0/oEmioKqXU3ChlpDKg3Ki2LrVfR5qsikq/hgCcea/WGwlvlM72k
         dJVxt2OOnzgnI/KucCPgNyrkNk3C0ZKxaPkr+0g1ytXtFCqT9x5sUKGjObMm6Kv+XqGb
         YdOf0WNlQQKb2nG9lyTNhjcXKWGM8pxGndgEGrZLmrH7JSa1vPJ0qW49t85JRPXdsTpL
         DkQg==
X-Gm-Message-State: AOAM5303Fu5TJcnZSH0Ch/QL4dQyY6WffxKyqpFuVU5DjdsDkRWwWbPg
        Qy6HW2BZq/bXX/Vfeqgx4pU=
X-Google-Smtp-Source: ABdhPJwbWVP1ItwCPaPpTcsfDE7zi2j4Mmv6bQL2nHxay3zzITx7H1zRHqb8akJyRFKkDGX/laRkTg==
X-Received: by 2002:a05:6512:4d9:: with SMTP id w25mr1537659lfq.199.1610112600873;
        Fri, 08 Jan 2021 05:30:00 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id q6sm1960224lfc.56.2021.01.08.05.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:30:00 -0800 (PST)
Date:   Fri, 8 Jan 2021 15:29:52 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH 01/15] rtc: bd70528: Do not require parent data
Message-ID: <fc961d2730c14f634e2cda1813c0a871cbd2a7f4.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The ROHM BD71828 and BD71815 RTC drivers only need the regmap
pointer from parent. Regmap can be obtained via dev_get_regmap()
so do not require parent to populate driver data for that.

BD70528 on the other hand requires parent data to access the
watchdog so leave the parent data for BD70528 here for now.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Please note that this same change has been sent individually:
https://lore.kernel.org/lkml/20210105152350.GA3714833@localhost.localdomain/
It is present in this series only because some patches depend on it.


 drivers/rtc/rtc-bd70528.c | 67 ++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 4492b770422c..a255aac6740a 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -52,6 +52,7 @@ struct bd70528_rtc_alm {
 
 struct bd70528_rtc {
 	struct rohm_regmap_dev *parent;
+	struct regmap *regmap;
 	struct device *dev;
 	u8 reg_time_start;
 	bool has_rtc_timers;
@@ -234,9 +235,8 @@ static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	int ret;
 	struct bd71828_rtc_alm alm;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(parent->regmap, BD71828_REG_RTC_ALM_START,
+	ret = regmap_bulk_read(r->regmap, BD71828_REG_RTC_ALM_START,
 			       &alm, sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
@@ -250,7 +250,7 @@ static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	else
 		alm.alm_mask |= BD70528_MASK_ALM_EN;
 
-	ret = regmap_bulk_write(parent->regmap, BD71828_REG_RTC_ALM_START,
+	ret = regmap_bulk_write(r->regmap, BD71828_REG_RTC_ALM_START,
 				&alm, sizeof(alm));
 	if (ret)
 		dev_err(dev, "Failed to set alarm time\n");
@@ -265,17 +265,16 @@ static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	struct bd70528_rtc_alm alm;
 	int ret;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_WAKE_START,
-			       &wake, sizeof(wake));
+	ret = regmap_bulk_read(r->regmap, BD70528_REG_RTC_WAKE_START, &wake,
+			       sizeof(wake));
 	if (ret) {
 		dev_err(dev, "Failed to read wake regs\n");
 		return ret;
 	}
 
-	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_ALM_START,
-			       &alm, sizeof(alm));
+	ret = regmap_bulk_read(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
+			       sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
 		return ret;
@@ -292,15 +291,14 @@ static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 		wake.ctrl &= ~BD70528_MASK_WAKE_EN;
 	}
 
-	ret = regmap_bulk_write(parent->regmap,
-				BD70528_REG_RTC_WAKE_START, &wake,
+	ret = regmap_bulk_write(r->regmap, BD70528_REG_RTC_WAKE_START, &wake,
 				sizeof(wake));
 	if (ret) {
 		dev_err(dev, "Failed to set wake time\n");
 		return ret;
 	}
-	ret = regmap_bulk_write(parent->regmap, BD70528_REG_RTC_ALM_START,
-				&alm, sizeof(alm));
+	ret = regmap_bulk_write(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
+				sizeof(alm));
 	if (ret)
 		dev_err(dev, "Failed to set alarm time\n");
 
@@ -312,9 +310,8 @@ static int bd71828_read_alarm(struct device *dev, struct rtc_wkalrm *a)
 	int ret;
 	struct bd71828_rtc_alm alm;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(parent->regmap, BD71828_REG_RTC_ALM_START,
+	ret = regmap_bulk_read(r->regmap, BD71828_REG_RTC_ALM_START,
 			       &alm, sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
@@ -336,10 +333,9 @@ static int bd70528_read_alarm(struct device *dev, struct rtc_wkalrm *a)
 	struct bd70528_rtc_alm alm;
 	int ret;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_ALM_START,
-			       &alm, sizeof(alm));
+	ret = regmap_bulk_read(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
+			       sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
 		return ret;
@@ -360,14 +356,12 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 	int ret, tmpret, old_states;
 	struct bd70528_rtc_data rtc_data;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
 	ret = bd70528_disable_rtc_based_timers(r, &old_states);
 	if (ret)
 		return ret;
 
-	tmpret = regmap_bulk_read(parent->regmap,
-				  r->reg_time_start, &rtc_data,
+	tmpret = regmap_bulk_read(r->regmap, r->reg_time_start, &rtc_data,
 				  sizeof(rtc_data));
 	if (tmpret) {
 		dev_err(dev, "Failed to read RTC time registers\n");
@@ -375,8 +369,7 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 	}
 	tm2rtc(t, &rtc_data);
 
-	tmpret = regmap_bulk_write(parent->regmap,
-				   r->reg_time_start, &rtc_data,
+	tmpret = regmap_bulk_write(r->regmap, r->reg_time_start, &rtc_data,
 				   sizeof(rtc_data));
 	if (tmpret) {
 		dev_err(dev, "Failed to set RTC time\n");
@@ -410,13 +403,11 @@ static int bd70528_set_time(struct device *dev, struct rtc_time *t)
 static int bd70528_get_time(struct device *dev, struct rtc_time *t)
 {
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 	struct bd70528_rtc_data rtc_data;
 	int ret;
 
 	/* read the RTC date and time registers all at once */
-	ret = regmap_bulk_read(parent->regmap,
-			       r->reg_time_start, &rtc_data,
+	ret = regmap_bulk_read(r->regmap, r->reg_time_start, &rtc_data,
 			       sizeof(rtc_data));
 	if (ret) {
 		dev_err(dev, "Failed to read RTC time (err %d)\n", ret);
@@ -443,7 +434,7 @@ static int bd70528_alm_enable(struct device *dev, unsigned int enabled)
 		dev_err(dev, "Failed to change wake state\n");
 		goto out_unlock;
 	}
-	ret = regmap_update_bits(r->parent->regmap, BD70528_REG_RTC_ALM_MASK,
+	ret = regmap_update_bits(r->regmap, BD70528_REG_RTC_ALM_MASK,
 				 BD70528_MASK_ALM_EN, enableval);
 	if (ret)
 		dev_err(dev, "Failed to change alarm state\n");
@@ -462,7 +453,7 @@ static int bd71828_alm_enable(struct device *dev, unsigned int enabled)
 	if (!enabled)
 		enableval = 0;
 
-	ret = regmap_update_bits(r->parent->regmap, BD71828_REG_RTC_ALM0_MASK,
+	ret = regmap_update_bits(r->regmap, BD71828_REG_RTC_ALM0_MASK,
 				 BD70528_MASK_ALM_EN, enableval);
 	if (ret)
 		dev_err(dev, "Failed to change alarm state\n");
@@ -498,7 +489,6 @@ static int bd70528_probe(struct platform_device *pdev)
 {
 	struct bd70528_rtc *bd_rtc;
 	const struct rtc_class_ops *rtc_ops;
-	struct rohm_regmap_dev *parent;
 	const char *irq_name;
 	int ret;
 	struct rtc_device *rtc;
@@ -508,20 +498,25 @@ static int bd70528_probe(struct platform_device *pdev)
 	u8 hour_reg;
 	enum rohm_chip_type chip = platform_get_device_id(pdev)->driver_data;
 
-	parent = dev_get_drvdata(pdev->dev.parent);
-	if (!parent) {
-		dev_err(&pdev->dev, "No MFD driver data\n");
-		return -EINVAL;
-	}
 	bd_rtc = devm_kzalloc(&pdev->dev, sizeof(*bd_rtc), GFP_KERNEL);
 	if (!bd_rtc)
 		return -ENOMEM;
 
-	bd_rtc->parent = parent;
+	bd_rtc->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!bd_rtc->regmap) {
+		dev_err(&pdev->dev, "No regmap\n");
+		return -EINVAL;
+	}
+
 	bd_rtc->dev = &pdev->dev;
 
 	switch (chip) {
 	case ROHM_CHIP_TYPE_BD70528:
+		bd_rtc->parent = dev_get_drvdata(pdev->dev.parent);
+		if (!bd_rtc->parent) {
+			dev_err(&pdev->dev, "No MFD data\n");
+			return -EINVAL;
+		}
 		irq_name = "bd70528-rtc-alm";
 		bd_rtc->has_rtc_timers = true;
 		bd_rtc->reg_time_start = BD70528_REG_RTC_START;
@@ -547,7 +542,7 @@ static int bd70528_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bd_rtc);
 
-	ret = regmap_read(parent->regmap, hour_reg, &hr);
+	ret = regmap_read(bd_rtc->regmap, hour_reg, &hr);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to reag RTC clock\n");
@@ -595,7 +590,7 @@ static int bd70528_probe(struct platform_device *pdev)
 	 *  from sub-registers when IRQ is disabled or freed.
 	 */
 	if (enable_main_irq) {
-		ret = regmap_update_bits(parent->regmap,
+		ret = regmap_update_bits(bd_rtc->regmap,
 				 BD70528_REG_INT_MAIN_MASK,
 				 BD70528_INT_RTC_MASK, 0);
 		if (ret) {
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 

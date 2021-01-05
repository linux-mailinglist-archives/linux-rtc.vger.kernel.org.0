Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2612EAE2D
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Jan 2021 16:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbhAEPYl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Jan 2021 10:24:41 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:42724 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbhAEPYl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Jan 2021 10:24:41 -0500
Received: by mail-lf1-f47.google.com with SMTP id b26so73478453lff.9;
        Tue, 05 Jan 2021 07:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=EvIUlmcUi1h94ah6Wo1CJiYpyfNqQPjJ7OiVHY9liGE=;
        b=L06daQqSdc0gvheBTkQrZGumX3+Wp9CsddR1+iljDg2oBmt7urClYa+Rfdh0dJQW/Q
         Op4BtbMKMxWypvRm0qdq7Lq6nqBS04JZmGwPtBc863afH87TTVe6kjcR1gt9s5PYqiX4
         rPoAi1oJMPF/q9EVSfnn9qA0U3XCvI+0ib6xaxQV3q64S/L5CvfTHkK/J0F+QYCdZPTG
         tRgpFslLT9rE6pnWBj/aY+ZK4gJverO8daHl82+AWKqasNeHf39v0fHscREdw10Rirgy
         LbPCQFZwDwiPnUsSvPpdRd7g865T5eU+xuU55VuqhuNYowyNRo5D1UPjfcp89OW7sgRP
         VFGg==
X-Gm-Message-State: AOAM530ZOOolZUEZHD8XQt98/XXBsIPSfJCgWChOh9muPBQwnhX/uvwA
        Hw/sr1lhI+J1/hlQ7nLF/OY=
X-Google-Smtp-Source: ABdhPJwld5rB84yii0oFf1F1xB9W8smbQGPEzMwTYcujATjxpY/kbO7mO8kGlxvLXgYTgjLtRwXMqw==
X-Received: by 2002:a19:3f94:: with SMTP id m142mr9991085lfa.196.1609860237647;
        Tue, 05 Jan 2021 07:23:57 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id r16sm7961ljk.93.2021.01.05.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 07:23:56 -0800 (PST)
Date:   Tue, 5 Jan 2021 17:23:50 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-power@fi.rohmeurope.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: bd70528: Do not require parent data
Message-ID: <20210105152350.GA3714833@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

As a side-note - I am unsure what is the fate of BD70528. Last time I
checked this IC was not being in mass-production and decision how to
proceed was not done. Currently I know only one board (done by the
Embedded Artist) which uses the BD70528 - and there, as far as I know -
the control towards PMIC is done from M4 core which is not running Linux.

I will try to find out if BD70528 is going to fade away. *maybe* we
can  soon just remove the BD70528 specific code branches. Oh, and
if anybody who reads this is using the BD70528 driver - please yell :)

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

base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
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

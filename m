Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F54D330B5F
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Mar 2021 11:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhCHKjk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Mar 2021 05:39:40 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:33670 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbhCHKjf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Mar 2021 05:39:35 -0500
Received: by mail-lj1-f174.google.com with SMTP id h4so15452825ljl.0;
        Mon, 08 Mar 2021 02:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T/h53cvHrez6oLaNKwTtFOxPE3VDr5f8n3VLG5jkT/Y=;
        b=kdGpNprmjdCm0TQU0VJ2BsQhaI+rXyGjRmqnsG8P0LQUEoJHISU3eEFLqOny9UVHVU
         D77s+V53/+d/smmNa7bAM6vQsyB9DMAY/uBS6fyjoam+0XH+Zc9WA7X5hnnn8cEEa4QJ
         x3zr7O7wshEugVWVWiNq/dt5Tkqy7CSA/Y9DN75c9MclkGe0K+9KqQrw8jKySBXe0Skl
         Uc9ekwKnVZ9fErEghhsr37SAiJstGfAJyNZyNea/kF3+SXRVZX18iYBdKc+Ms2ikLHhL
         hfjXBBr6waOGRiCQdiEtwtHSNSTt+I1o2f6+9u7uhNpXFPDpCd9P7L3nRWaZ3oG5UbZ9
         oCPQ==
X-Gm-Message-State: AOAM532xu99jJfvgaXX4GtCRM2OA3d13q2CiGveEeCSLwXixgyDhqmXm
        IHnGkyappVl/DOVk51fQoa8=
X-Google-Smtp-Source: ABdhPJznSBKdBoIOgR4JzOvgOw1EVM9UK33YlRQd5O97pvNWBERc6z9j3lOLRumx7iSw9wJeaL4hGA==
X-Received: by 2002:a2e:b4b1:: with SMTP id q17mr13663385ljm.497.1615199974566;
        Mon, 08 Mar 2021 02:39:34 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id f26sm1308950lfe.118.2021.03.08.02.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:39:34 -0800 (PST)
Date:   Mon, 8 Mar 2021 12:39:27 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH v3 01/15] rtc: bd70528: Do not require parent data
Message-ID: <76f86737e84e39288baf737ac2f3d7f05cfcea79.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The ROHM BD71828 and BD71815 RTC drivers only need the regmap
pointer from parent. Regmap can be obtained via dev_get_regmap()
so do not require parent to populate driver data for that.

BD70528 on the other hand requires parent data to access the
watchdog so leave the parent data for BD70528 here for now.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-bd70528.c | 67 ++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 17cb67f5bf6e..fb4476bb5ab6 100644
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

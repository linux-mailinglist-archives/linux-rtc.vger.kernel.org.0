Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752513541CB
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 13:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233768AbhDELpE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 07:45:04 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:38829 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbhDELpE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 07:45:04 -0400
Received: by mail-lj1-f179.google.com with SMTP id s17so12399427ljc.5;
        Mon, 05 Apr 2021 04:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U0CyRmeyleZ4lvEoqQtGqAf4e0MllNlG193uWSSjCXU=;
        b=p3HHGAo43Nf8PIMFOtgz4LbdaKcYhXgs8go3FEp61Wsa7lgOPz/9uzVb5yPRf10bo6
         DnfBZKXFHyv2kWtpcqQOvDIQ8rgdWbK6mOJgOyFRn/zlanAapWbfo+tIh6uQ99ZA7e4m
         e7tPIsnBaSl+i0jeQT57Q1D6uqU5JBpkG01Ykqr6u1pwpnmmW7oIMTnNbR6gTLR+242k
         sYUWhqxWeu2F9DqqYaSWgbDZ+Z16O2bZHHDGDjqOgCWyCKsZuCC8IZu5C/s9xT6Gs2SX
         93iysEfK5ipSZ13rYQpF+F4p30zy/NqOR2uPwH+gK1MzFhj8GYqYkem/N2QgagP1xK55
         YyLQ==
X-Gm-Message-State: AOAM530ZxO4P07NZGwqt0B3roDDslO0eEcl8foonMXT+32Mgr6miJ6fh
        lpK13g2iBvGyXvv0mBOYhTc=
X-Google-Smtp-Source: ABdhPJxwpYwhYS18W+Rzd5OtldaO7AYCSEK9tYBaqj+icOrgw4j5J46X7MQl3tdvbWpcl7drKVUlYg==
X-Received: by 2002:a2e:7007:: with SMTP id l7mr16082402ljc.436.1617623097121;
        Mon, 05 Apr 2021 04:44:57 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id z64sm1747129lfa.92.2021.04.05.04.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 04:44:56 -0700 (PDT)
Date:   Mon, 5 Apr 2021 14:44:50 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH v6 15/16] rtc: bd70528: Support RTC on ROHM BD71815
Message-ID: <d80d584ca3f0676a66beb003259ac3eecc2ae07c.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

BD71815 contains similar RTC block as BD71828. Only the address offsets
seem different. Support also BD71815 RTC using rtc-bd70528.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Changes since v3:
 - No changes
 drivers/rtc/Kconfig       |  6 +++---
 drivers/rtc/rtc-bd70528.c | 45 ++++++++++++++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ce723dc54aa4..622af1314ece 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -501,11 +501,11 @@ config RTC_DRV_M41T80_WDT
 	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
 
 config RTC_DRV_BD70528
-	tristate "ROHM BD70528 PMIC RTC"
-	depends on MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
+	tristate "ROHM BD70528, BD71815 and BD71828 PMIC RTC"
+	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
 	help
 	  If you say Y here you will get support for the RTC
-	  block on ROHM BD70528 and BD71828 Power Management IC.
+	  block on ROHM BD70528, BD71815 and BD71828 Power Management IC.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-bd70528.
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index fb4476bb5ab6..6454afca02a6 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -6,6 +6,7 @@
 
 #include <linux/bcd.h>
 #include <linux/mfd/rohm-bd70528.h>
+#include <linux/mfd/rohm-bd71815.h>
 #include <linux/mfd/rohm-bd71828.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -13,6 +14,12 @@
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 
+/*
+ * On BD71828 and BD71815 the ALM0 MASK is 14 bytes after the ALM0
+ * block start
+ */
+#define BD718XX_ALM_EN_OFFSET 14
+
 /*
  * We read regs RTC_SEC => RTC_YEAR
  * this struct is ordered according to chip registers.
@@ -55,6 +62,7 @@ struct bd70528_rtc {
 	struct regmap *regmap;
 	struct device *dev;
 	u8 reg_time_start;
+	u8 bd718xx_alm_block_start;
 	bool has_rtc_timers;
 };
 
@@ -236,8 +244,8 @@ static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	struct bd71828_rtc_alm alm;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
 
-	ret = regmap_bulk_read(r->regmap, BD71828_REG_RTC_ALM_START,
-			       &alm, sizeof(alm));
+	ret = regmap_bulk_read(r->regmap, r->bd718xx_alm_block_start, &alm,
+			       sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
 		return ret;
@@ -250,8 +258,8 @@ static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	else
 		alm.alm_mask |= BD70528_MASK_ALM_EN;
 
-	ret = regmap_bulk_write(r->regmap, BD71828_REG_RTC_ALM_START,
-				&alm, sizeof(alm));
+	ret = regmap_bulk_write(r->regmap, r->bd718xx_alm_block_start, &alm,
+				sizeof(alm));
 	if (ret)
 		dev_err(dev, "Failed to set alarm time\n");
 
@@ -311,8 +319,8 @@ static int bd71828_read_alarm(struct device *dev, struct rtc_wkalrm *a)
 	struct bd71828_rtc_alm alm;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
 
-	ret = regmap_bulk_read(r->regmap, BD71828_REG_RTC_ALM_START,
-			       &alm, sizeof(alm));
+	ret = regmap_bulk_read(r->regmap, r->bd718xx_alm_block_start, &alm,
+			       sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
 		return ret;
@@ -453,8 +461,9 @@ static int bd71828_alm_enable(struct device *dev, unsigned int enabled)
 	if (!enabled)
 		enableval = 0;
 
-	ret = regmap_update_bits(r->regmap, BD71828_REG_RTC_ALM0_MASK,
-				 BD70528_MASK_ALM_EN, enableval);
+	ret = regmap_update_bits(r->regmap, r->bd718xx_alm_block_start +
+				 BD718XX_ALM_EN_OFFSET, BD70528_MASK_ALM_EN,
+				 enableval);
 	if (ret)
 		dev_err(dev, "Failed to change alarm state\n");
 
@@ -524,9 +533,28 @@ static int bd70528_probe(struct platform_device *pdev)
 		enable_main_irq = true;
 		rtc_ops = &bd70528_rtc_ops;
 		break;
+	case ROHM_CHIP_TYPE_BD71815:
+		irq_name = "bd71815-rtc-alm-0";
+		bd_rtc->reg_time_start = BD71815_REG_RTC_START;
+
+		/*
+		 * See also BD718XX_ALM_EN_OFFSET:
+		 * This works for BD71828 and BD71815 as they have same offset
+		 * between ALM0 start and ALM0_MASK. If new ICs are to be
+		 * added this requires proper check as ALM0_MASK is not located
+		 * at the end of ALM0 block - but after all ALM blocks so if
+		 * amount of ALMs differ the offset to enable/disable is likely
+		 * to be incorrect and enable/disable must be given as own
+		 * reg address here.
+		 */
+		bd_rtc->bd718xx_alm_block_start = BD71815_REG_RTC_ALM_START;
+		hour_reg = BD71815_REG_HOUR;
+		rtc_ops = &bd71828_rtc_ops;
+		break;
 	case ROHM_CHIP_TYPE_BD71828:
 		irq_name = "bd71828-rtc-alm-0";
 		bd_rtc->reg_time_start = BD71828_REG_RTC_START;
+		bd_rtc->bd718xx_alm_block_start = BD71828_REG_RTC_ALM_START;
 		hour_reg = BD71828_REG_RTC_HOUR;
 		rtc_ops = &bd71828_rtc_ops;
 		break;
@@ -605,6 +633,7 @@ static int bd70528_probe(struct platform_device *pdev)
 static const struct platform_device_id bd718x7_rtc_id[] = {
 	{ "bd70528-rtc", ROHM_CHIP_TYPE_BD70528 },
 	{ "bd71828-rtc", ROHM_CHIP_TYPE_BD71828 },
+	{ "bd71815-rtc", ROHM_CHIP_TYPE_BD71815 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_rtc_id);
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

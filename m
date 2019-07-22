Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE905704BF
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2019 17:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbfGVP6f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jul 2019 11:58:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37048 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbfGVP6e (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jul 2019 11:58:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id f17so35851171wme.2
        for <linux-rtc@vger.kernel.org>; Mon, 22 Jul 2019 08:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ozab7TKuVjgd19+PwAJ1QogRi0GHSiiCvUe4mlKEf2k=;
        b=nSnxO1V2UTEWQdS7SU3dNpMJjCfKtNtTeJvBtGPI3wGKfVfO23g8Pkp1iN08mxfhM8
         RR58ER7Pf9xDjLpahBZmbri+PImC7AefqZQqXp85RIdCQ7AUMjR5KjOLvsbPQ0ba24So
         a0B3+7QtA5E0ieXumQ1jb49RvPrwJzBsMV7HrOucT0/OUj2RrbQwrJssia8qHyWYA781
         VkO8M1SReKqqpLa3SJ+3BrecH/hS11t7s8wRt9KSZw0U+RUBXIOTov+x4uXJxoeI+Syr
         mTFVinXI8uvEHLpyldmrkoKK8ygnut0P3gv5yKwphgNMudgJMsEP+3XcGeQsh8sx6j6q
         qFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ozab7TKuVjgd19+PwAJ1QogRi0GHSiiCvUe4mlKEf2k=;
        b=U+DiN/sGsH8gCjAEEnmAi92wu/nMa21+/0Om2n7Jgn83XkIzD5EP2JIHoK2/0hxokC
         6uVZ8ekBY2bjZOjc2cLnRfdURGv3XJzVvqFX6DiMZ5CcgSmMZFmmNovb0P+zz8QQR/eT
         alfa7xw1dQmLKbIhDRf+QaHxN/lnXtIvGkCqozeBbFji4My6RQPkTxI1FNdsjgJAEz/f
         uJwep6RcArMXyEqFKM8awkg6WMn1CPZVwHSXguFw12xz/c5vOJZ77QekdOduclYbEA8B
         CbIUNHDdkWkDt9EDqwJQSC4R3MCNWhtLSnHWltJpKd5M+7DN+jiGS+mwBN4jBsCk0wbp
         /iHg==
X-Gm-Message-State: APjAAAVVsCZLjOoASQD+ABrAbHDOEvjeGhS+yUm0uSesr8At+tNjq3i7
        dtoq6oDPtwY89/P0CLLB+4RoF+7nOEY=
X-Google-Smtp-Source: APXvYqxj2aj9djXEDBBEYXoPBbx3+Nj4E2hXbMTu9ly096ejXIdc4wr6J5tnIX0RFBb5QWPx3eoVfw==
X-Received: by 2002:a1c:7d08:: with SMTP id y8mr44397882wmc.50.1563811111309;
        Mon, 22 Jul 2019 08:58:31 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id 91sm84840716wrp.3.2019.07.22.08.58.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:58:30 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        bruno.thomsen@gmail.com, bth@kamstrup.com,
        u.kleine-koenig@pengutronix.de
Subject: [PATCH 4/4] rtc: pcf2127: add watchdog feature support
Date:   Mon, 22 Jul 2019 17:58:11 +0200
Message-Id: <20190722155811.11980-5-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722155811.11980-1-bruno.thomsen@gmail.com>
References: <20190722155811.11980-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add partial support for the watchdog functionality of
PCF2127 and PCF2129 with Kconfig option.

The programmable watchdog timer is currently using a fixed
clock source of 1Hz. This result in a selectable range of
1-255 seconds, which covers most embedded Linux use-cases.

Clock sources of 4096Hz, 64Hz and 1/60Hz is mostly useful
in MCU use-cases.

Module parameter, wdt_margin, follows same interface as M41T80
and DS1374 RTC drivers.

Countdown timer not available when using watchdog feature.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/Kconfig       |  10 +++
 drivers/rtc/rtc-pcf2127.c | 155 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..45a123761784 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -881,6 +881,16 @@ config RTC_DRV_PCF2127
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-pcf2127.
 
+config RTC_DRV_PCF2127_WDT
+	bool "NXP PCF2127 watchdog timer"
+	depends on RTC_DRV_PCF2127
+	help
+	  If you say Y here you will get support for the watchdog timer
+	  in the NXP PCF2127 and PCF2129 real-time clock chips.
+
+	  The watchdog is usually used together with systemd or the
+	  watchdog daemon. Watchdog trigger cause system reset.
+
 config RTC_DRV_RV3029C2
 	tristate "Micro Crystal RV3029/3049"
 	depends on RTC_I2C_AND_SPI
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index ff09bedc02d4..442aa0a06886 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -5,6 +5,9 @@
  *
  * Author: Renaud Cerrato <r.cerrato@til-technologies.fr>
  *
+ * Watchdog and tamper functions
+ * Author: Bruno Thomsen <bruno.thomsen@gmail.com>
+ *
  * based on the other drivers in this same directory.
  *
  * Datasheet: http://cache.nxp.com/documents/data_sheet/PCF2127.pdf
@@ -18,6 +21,10 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#ifdef CONFIG_RTC_DRV_PCF2127_WDT
+#include <linux/miscdevice.h>
+#include <linux/watchdog.h>
+#endif
 
 /* Control register 1 */
 #define PCF2127_REG_CTRL1		0x00
@@ -42,6 +49,13 @@
 #define PCF2127_REG_DW			0x07
 #define PCF2127_REG_MO			0x08
 #define PCF2127_REG_YR			0x09
+/* Watchdog registers */
+#define PCF2127_REG_WD_CTL		0x10
+#define PCF2127_BIT_WD_CTL_TF0			BIT(0)
+#define PCF2127_BIT_WD_CTL_TF1			BIT(1)
+#define PCF2127_BIT_WD_CTL_CD0			BIT(6)
+#define PCF2127_BIT_WD_CTL_CD1			BIT(7)
+#define PCF2127_REG_WD_VAL		0x11
 /* Tamper timestamp registers */
 #define PCF2127_REG_TS_CTRL		0x12
 #define PCF2127_BIT_TS_CTRL_TSOFF		BIT(6)
@@ -62,6 +76,11 @@
 #define PCF2127_REG_RAM_WRT_CMD		0x1C
 #define PCF2127_REG_RAM_RD_CMD		0x1D
 
+/* Watchdog timer value constants */
+#define PCF2127_WD_VAL_STOP		0
+#define PCF2127_WD_VAL_MIN		1
+#define PCF2127_WD_VAL_MAX		255
+#define PCF2127_WD_VAL_DEFAULT		60
 
 struct pcf2127 {
 	struct rtc_device *rtc;
@@ -245,6 +264,108 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
 	return ret ?: bytes;
 }
 
+/* watchdog driver */
+
+#ifdef CONFIG_RTC_DRV_PCF2127_WDT
+
+static struct pcf2127 *saved_pcf2127;
+
+static int wdt_margin = PCF2127_WD_VAL_DEFAULT;
+module_param(wdt_margin, int, 0);
+MODULE_PARM_DESC(wdt_margin, "Watchdog timeout in seconds (default "
+		 __stringify(PCF2127_WD_VAL_DEFAULT) "s)");
+
+static void pcf2127_wdt_adjust_margin(int new_margin)
+{
+	if (new_margin < PCF2127_WD_VAL_MIN)
+		new_margin = PCF2127_WD_VAL_DEFAULT;
+	if (new_margin > PCF2127_WD_VAL_MAX)
+		new_margin = PCF2127_WD_VAL_MAX;
+
+	wdt_margin = new_margin;
+}
+
+static int pcf2127_wdt_ping(void)
+{
+	return regmap_write(saved_pcf2127->regmap, PCF2127_REG_WD_VAL,
+			    wdt_margin);
+}
+
+static int pcf2127_wdt_disable(void)
+{
+	return regmap_write(saved_pcf2127->regmap, PCF2127_REG_WD_VAL,
+			    PCF2127_WD_VAL_STOP);
+}
+
+static ssize_t pcf2127_wdt_write(struct file *file, const char __user *data,
+				 size_t len, loff_t *ppos)
+{
+	if (len) {
+		pcf2127_wdt_ping();
+		return 1;
+	}
+
+	return 0;
+}
+
+static const struct watchdog_info pcf2127_wdt_info = {
+	.identity = "NXP PCF2127/PCF2129 Watchdog",
+	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+};
+
+static long pcf2127_wdt_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	int options, new_margin;
+
+	switch (cmd) {
+	case WDIOC_GETSUPPORT:
+		return copy_to_user((struct watchdog_info __user *)arg,
+				    &pcf2127_wdt_info,
+				    sizeof(pcf2127_wdt_info)) ? -EFAULT : 0;
+	case WDIOC_SETOPTIONS:
+		if (copy_from_user(&options, (int __user *)arg, sizeof(int)))
+			return -EFAULT;
+		if (options & WDIOS_DISABLECARD) {
+			pr_info("%s: disable watchdog\n", __func__);
+			return pcf2127_wdt_disable();
+		}
+		if (options & WDIOS_ENABLECARD) {
+			pr_info("%s: enable watchdog\n", __func__);
+			return pcf2127_wdt_ping();
+		}
+		return -EINVAL;
+	case WDIOC_KEEPALIVE:
+		return pcf2127_wdt_ping();
+	case WDIOC_SETTIMEOUT:
+		if (get_user(new_margin, (int __user *)arg))
+			return -EFAULT;
+		pcf2127_wdt_adjust_margin(new_margin);
+		pr_info("%s: new watchdog timeout: %is (requested: %is)\n",
+			__func__, wdt_margin, new_margin);
+		pcf2127_wdt_ping();
+		/* Fall through */
+	case WDIOC_GETTIMEOUT:
+		return put_user(wdt_margin, (int __user *)arg);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations pcf2127_wdt_fops = {
+	.owner = THIS_MODULE,
+	.write = pcf2127_wdt_write,
+	.unlocked_ioctl = pcf2127_wdt_ioctl,
+};
+
+static struct miscdevice pcf2127_miscdev = {
+	.minor = WATCHDOG_MINOR,
+	.name = "watchdog",
+	.fops = &pcf2127_wdt_fops,
+};
+
+#endif /* CONFIG_RTC_DRV_PCF2127_WDT */
+
 /* sysfs interface */
 
 static ssize_t timestamp0_store(struct device *dev,
@@ -394,6 +515,37 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+#ifdef CONFIG_RTC_DRV_PCF2127_WDT
+	/*
+	 * Watchdog timer enabled and reset pin /RST activated when timed out.
+	 * Select 1Hz clock source for watchdog timer.
+	 * Note: Countdown timer disabled and not available.
+	 */
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
+				 PCF2127_BIT_WD_CTL_CD1 |
+				 PCF2127_BIT_WD_CTL_CD0 |
+				 PCF2127_BIT_WD_CTL_TF1 |
+				 PCF2127_BIT_WD_CTL_TF0,
+				 PCF2127_BIT_WD_CTL_CD1 |
+				 PCF2127_BIT_WD_CTL_CD0 |
+				 PCF2127_BIT_WD_CTL_TF1);
+	if (ret) {
+		dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__);
+		return ret;
+	}
+
+	/*
+	 * Fails if another watchdog driver is loaded.
+	 */
+	ret = misc_register(&pcf2127_miscdev);
+	if (ret) {
+		dev_err(dev, "%s: watchdog register failed\n", __func__);
+		return ret;
+	}
+
+	saved_pcf2127 = pcf2127;
+#endif /* CONFIG_RTC_DRV_PCF2127_WDT */
+
 	ret = rtc_add_group(pcf2127->rtc, &pcf2127_attr_group);
 	if (ret) {
 		dev_err(dev, "%s: tamper register failed\n", __func__);
@@ -639,6 +791,9 @@ module_init(pcf2127_init)
 
 static void __exit pcf2127_exit(void)
 {
+#ifdef CONFIG_RTC_DRV_PCF2127_WDT
+	misc_deregister(&pcf2127_miscdev);
+#endif /* CONFIG_RTC_DRV_PCF2127_WDT */
 	pcf2127_spi_unregister_driver();
 	pcf2127_i2c_unregister_driver();
 }
-- 
2.21.0


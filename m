Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A188994C4
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 15:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732397AbfHVNT4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 09:19:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37610 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732317AbfHVNT4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 09:19:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id d16so5767951wme.2;
        Thu, 22 Aug 2019 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=92nMDvehPAphgE3W+p66OZbjPeMAsNp+BOuLVquGoGQ=;
        b=Cfc83J0v/Ew0hWKOMmfBXZss2fc7lThi1Ga1cootvccELcM5Q8ltoBOxm+ThqND2bw
         jQf7/niuivQqOUyG0aH4lnIFCOQDtRD96lmkDQs4ZcLHVkWofj9K2gzEh0WvlKLdI4fQ
         oM89CpYcbw6ujFtHWQUkDeU5UvHOyFqEajFpEZSRZXsKQSnGGkVOPNcj3Hf1yVxE0zMJ
         JZPPUSxKJrceM9M9w8LHBhY4sLw7x0FuSe3Ym4kFf2DG0jsQkbkzAmpFDXtRHEVPnOiz
         +B6/xMxzlnMq6gMTbPPF6sb4ohcE3CaDtgxvQk+RK/5wBI6bsKMskne0WMHpXFQi3ZHq
         rhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=92nMDvehPAphgE3W+p66OZbjPeMAsNp+BOuLVquGoGQ=;
        b=q8+w0ndcu4YN8W1VEVnxzip3usjaNk06ImpcOk4lnTt0tb/ZoL64Zg3lgyhLFEkNpv
         bcTVxJ6aTYqPZb/7rsnBs6O48mY4FU7zQLwojvl09fh0IClbiLKUI5bnJHB27FBV7O7l
         6na/nKKk7DHIG6ZQQvywWD3Vbj4bO/14bPvZNMjVAU2ND/6M1zDc57ESqobJLYHu5VG8
         e6/YWLs7JxLyQm7hu7Z1z9mHdQUjj/88HWoiYwP4Z3sZcrbFgheoSw+IffvGAET4CxFH
         PLXNKuHTAgQ0qRhYRksBN2pO80usPVelvxjzDtQ0ADlTNc/tEKs0W4JcO4yKCiB+93dQ
         Bfcg==
X-Gm-Message-State: APjAAAVRQSzS/SxdEBJTc6E+luvCbx5AHazNDaAxszMwbRvI/a0YzGKW
        f76SYP7q/mUkCpKld+ZhN/94brXeKcbomA==
X-Google-Smtp-Source: APXvYqwLAHhGOvCky81U0xxNvcb/DWdmGy9cyXq9bf7LCgz3Tb/sK5fjhC0S+pY914Zt+MBo/lD7UQ==
X-Received: by 2002:a05:600c:da:: with SMTP id u26mr6279036wmm.70.1566479992925;
        Thu, 22 Aug 2019 06:19:52 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id d19sm34644045wrb.7.2019.08.22.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 06:19:52 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com,
        bruno.thomsen@gmail.com
Subject: [PATCH v3 4/5] rtc: pcf2127: add watchdog feature support
Date:   Thu, 22 Aug 2019 15:19:35 +0200
Message-Id: <20190822131936.18772-4-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822131936.18772-1-bruno.thomsen@gmail.com>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add partial support for the watchdog functionality of
both PCF2127 and PCF2129 chips.

The programmable watchdog timer is currently using a fixed
clock source of 1Hz. This result in a selectable range of
1-255 seconds, which covers most embedded Linux use-cases.

Clock sources of 4096Hz, 64Hz and 1/60Hz is mostly useful
in MCU use-cases.

Countdown timer not available when using watchdog feature.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
v3: removed 2 x dev_info() and 1 x dev_err() traces.
    lowered dev_info() to dbg_info() in pcf2127_wdt_set_timeout.
    removed unneeded ret variable in pcf2127_wdt_set_timeout.
v2: use new watchdog api, e.g. devm_watchdog_register_device.
    remove watchdog Kconfig option.
    update existing Kconfig option with additional information.

 drivers/rtc/Kconfig       |   7 ++-
 drivers/rtc/rtc-pcf2127.c | 118 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..a3bb58a08879 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -876,7 +876,12 @@ config RTC_DRV_PCF2127
 	depends on RTC_I2C_AND_SPI
 	help
 	  If you say yes here you get support for the NXP PCF2127/29 RTC
-	  chips.
+	  chips with integrated quartz crystal for industrial applications.
+	  Both chips also have watchdog timer and tamper switch detection
+	  features.
+
+	  PCF2127 has an additional feature of 512 bytes battery backed
+	  memory that's accessible using nvmem interface.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-pcf2127.
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index ee4921e4a47c..8d6eda455d81 100644
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
@@ -18,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <linux/watchdog.h>
 
 /* Control register 1 */
 #define PCF2127_REG_CTRL1		0x00
@@ -35,6 +39,13 @@
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
 /*
  * RAM registers
  * PCF2127 has 512 bytes general-purpose static RAM (SRAM) that is
@@ -45,9 +56,15 @@
 #define PCF2127_REG_RAM_WRT_CMD		0x1C
 #define PCF2127_REG_RAM_RD_CMD		0x1D
 
+/* Watchdog timer value constants */
+#define PCF2127_WD_VAL_STOP		0
+#define PCF2127_WD_VAL_MIN		2
+#define PCF2127_WD_VAL_MAX		255
+#define PCF2127_WD_VAL_DEFAULT		60
 
 struct pcf2127 {
 	struct rtc_device *rtc;
+	struct watchdog_device wdd;
 	struct regmap *regmap;
 };
 
@@ -220,6 +237,74 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
 	return ret ?: bytes;
 }
 
+/* watchdog driver */
+
+static int pcf2127_wdt_ping(struct watchdog_device *wdd)
+{
+	struct pcf2127 *pcf2127 = watchdog_get_drvdata(wdd);
+
+	return regmap_write(pcf2127->regmap, PCF2127_REG_WD_VAL, wdd->timeout);
+}
+
+/*
+ * Restart watchdog timer if feature is active.
+ *
+ * Note: Reading CTRL2 register causes watchdog to stop which is unfortunate,
+ * since register also contain control/status flags for other features.
+ * Always call this function after reading CTRL2 register.
+ */
+static int pcf2127_wdt_active_ping(struct watchdog_device *wdd)
+{
+	int ret = 0;
+
+	if (watchdog_active(wdd)) {
+		ret = pcf2127_wdt_ping(wdd);
+		if (ret)
+			dev_err(wdd->parent,
+				"%s: watchdog restart failed, ret=%d\n",
+				__func__, ret);
+	}
+
+	return ret;
+}
+
+static int pcf2127_wdt_start(struct watchdog_device *wdd)
+{
+	return pcf2127_wdt_ping(wdd);
+}
+
+static int pcf2127_wdt_stop(struct watchdog_device *wdd)
+{
+	struct pcf2127 *pcf2127 = watchdog_get_drvdata(wdd);
+
+	return regmap_write(pcf2127->regmap, PCF2127_REG_WD_VAL,
+			    PCF2127_WD_VAL_STOP);
+}
+
+static int pcf2127_wdt_set_timeout(struct watchdog_device *wdd,
+				   unsigned int new_timeout)
+{
+	dev_dbg(wdd->parent, "new watchdog timeout: %is (old: %is)\n",
+		new_timeout, wdd->timeout);
+
+	wdd->timeout = new_timeout;
+
+	return pcf2127_wdt_active_ping(wdd);
+}
+
+static const struct watchdog_info pcf2127_wdt_info = {
+	.identity = "NXP PCF2127/PCF2129 Watchdog",
+	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+};
+
+static const struct watchdog_ops pcf2127_watchdog_ops = {
+	.owner = THIS_MODULE,
+	.start = pcf2127_wdt_start,
+	.stop = pcf2127_wdt_stop,
+	.ping = pcf2127_wdt_ping,
+	.set_timeout = pcf2127_wdt_set_timeout,
+};
+
 static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
@@ -242,6 +327,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	pcf2127->rtc->ops = &pcf2127_rtc_ops;
 
+	pcf2127->wdd.parent = dev;
+	pcf2127->wdd.info = &pcf2127_wdt_info;
+	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
+	pcf2127->wdd.min_timeout = PCF2127_WD_VAL_MIN;
+	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
+	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
+	pcf2127->wdd.min_hw_heartbeat_ms = 500;
+
+	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
+
 	if (has_nvmem) {
 		struct nvmem_config nvmem_cfg = {
 			.priv = pcf2127,
@@ -253,6 +348,29 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		ret = rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
+	/*
+	 * Watchdog timer enabled and reset pin /RST activated when timed out.
+	 * Select 1Hz clock source for watchdog timer.
+	 * Timer is not started until WD_VAL is loaded with a valid value.
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
+	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
+	if (ret)
+		return ret;
+
 	return rtc_register_device(pcf2127->rtc);
 }
 
-- 
2.21.0


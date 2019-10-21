Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C16DDE3F9
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 07:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfJUFlv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 01:41:51 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:39302 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727160AbfJUFlr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 01:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=References:In-Reply-To:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wfg7aYCy6uBCNFeKVZP8RHbxAsqqNzB9YdHZKSVnsjc=; b=cJZTkQD+ZDecptvukmGlzSsw4
        rC035bTc1meOaM4GUuaIJxTOzy5x/1NOxbnAaX9toErqam4a9rJ7xnSj470A4hr/x5JaUAxokKjAI
        69bPN4Zm6nSlgMADoV/KRlThpsodDiEqTxSOq2UIU0XgX9O2hjhrevn5wAc3b9lp/i67I=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRq-0002hc-N7; Mon, 21 Oct 2019 07:41:43 +0200
Received: from andi by localhost with local (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRp-0006ot-LG; Mon, 21 Oct 2019 07:41:41 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver
Date:   Mon, 21 Oct 2019 07:41:04 +0200
Message-Id: <20191021054104.26155-6-andreas@kemnade.info>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021054104.26155-1-andreas@kemnade.info>
References: <20191021054104.26155-1-andreas@kemnade.info>
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add an RTC driver for the RTC device on Ricoh MFD rc5t619,
which is implemented as a variant of rn5t618

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/rtc/Kconfig       |  10 +
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-rc5t619.c | 476 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 487 insertions(+)
 create mode 100644 drivers/rtc/rtc-rc5t619.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..a4dc04c49fec 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -588,6 +588,16 @@ config RTC_DRV_RC5T583
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-rc5t583.
 
+config RTC_DRV_RC5T619
+	tristate "RICOH RC5T619 RTC driver"
+	depends on MFD_RN5T618
+	help
+	  If you say yes here you get support for the RTC on the
+	  RICOH RC5T619 chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-rc5t619.
+
 config RTC_DRV_S35390A
 	tristate "Seiko Instruments S-35390A"
 	select BITREVERSE
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 6b09c21dc1b6..1d0673fd0954 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_RTC_DRV_PXA)	+= rtc-pxa.o
 obj-$(CONFIG_RTC_DRV_R7301)	+= rtc-r7301.o
 obj-$(CONFIG_RTC_DRV_R9701)	+= rtc-r9701.o
 obj-$(CONFIG_RTC_DRV_RC5T583)	+= rtc-rc5t583.o
+obj-$(CONFIG_RTC_DRV_RC5T619)	+= rtc-rc5t619.o
 obj-$(CONFIG_RTC_DRV_RK808)	+= rtc-rk808.o
 obj-$(CONFIG_RTC_DRV_RP5C01)	+= rtc-rp5c01.o
 obj-$(CONFIG_RTC_DRV_RS5C313)	+= rtc-rs5c313.o
diff --git a/drivers/rtc/rtc-rc5t619.c b/drivers/rtc/rtc-rc5t619.c
new file mode 100644
index 000000000000..311788ff0723
--- /dev/null
+++ b/drivers/rtc/rtc-rc5t619.c
@@ -0,0 +1,476 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * drivers/rtc/rtc-ricoh619.c
+ *
+ * Real time clock driver for RICOH R5T619 power management chip.
+ *
+ * Copyright (C) 2019 Andreas Kemnade
+ *
+ * Based on code
+ *  Copyright (C) 2012-2014 RICOH COMPANY,LTD
+ *
+ * Based on code
+ *  Copyright (C) 2011 NVIDIA Corporation
+ */
+
+/* #define debug		1 */
+/* #define verbose_debug	1 */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mfd/rn5t618.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/bcd.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+#include <linux/irqdomain.h>
+
+struct rc5t619_rtc {
+	int			irq;
+	struct rtc_device	*rtc;
+	struct rn5t618 *rn5t618;
+};
+
+#define CTRL1_ALARM_ENABLED 0x40
+#define CTRL1_24HR 0x20
+#define CTRL1_PERIODIC_MASK 0xf
+
+#define CTRL2_PON 0x10
+#define CTRL2_ALARM_STATUS 0x80
+#define CTRL2_CTFG 0x4
+#define CTRL2_CTC 0x1
+
+static int rc5t619_rtc_periodic_disable(struct device *dev)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+	int err;
+
+	/* disable function */
+	err = regmap_update_bits(rtc->rn5t618->regmap,
+			RN5T618_RTC_CTRL1, CTRL1_PERIODIC_MASK, 0);
+	if (err < 0)
+		return err;
+
+	/* clear alarm flag and CTFG */
+	err = regmap_update_bits(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2,
+			CTRL2_ALARM_STATUS | CTRL2_CTFG | CTRL2_CTC, 0);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int rc5t619_rtc_clk_adjust(struct device *dev, uint8_t clk)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+
+	return regmap_write(rtc->rn5t618->regmap, RN5T618_RTC_ADJUST, clk);
+}
+
+static int rc5t619_rtc_pon_get_clr(struct device *dev, uint8_t *pon_f)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+	int err;
+	unsigned int reg_data;
+
+	err = regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2, &reg_data);
+	if (err < 0)
+		return err;
+
+	if (reg_data & CTRL2_PON) {
+		*pon_f = 1;
+		/* clear VDET PON */
+		reg_data &= ~(CTRL2_PON | CTRL2_CTC | 0x4a);	/* 0101-1011 */
+		reg_data |= 0x20;	/* 0010-0000 */
+		err = regmap_write(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2,
+					reg_data);
+	} else {
+		*pon_f = 0;
+	}
+
+	return err;
+}
+
+/* 0-12hour, 1-24hour */
+static int rc5t619_rtc_24hour_mode_set(struct device *dev, int mode)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+
+	return regmap_update_bits(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1,
+			CTRL1_24HR, mode ? CTRL1_24HR : 0);
+}
+
+
+static int rc5t619_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+	u8 buff[7];
+	int err;
+	int cent_flag;
+
+	err = regmap_bulk_read(rtc->rn5t618->regmap, RN5T618_RTC_SECONDS,
+				buff, sizeof(buff));
+	if (err < 0) {
+		dev_err(dev, "failed to read time: %d\n", err);
+		return err;
+	}
+
+	if (buff[5] & 0x80)
+		cent_flag = 1;
+	else
+		cent_flag = 0;
+
+	buff[5] = buff[5] & 0x1f;		/* bit5 19_20 */
+
+	tm->tm_sec  = bcd2bin(buff[0]);
+	tm->tm_min  = bcd2bin(buff[1]);
+	tm->tm_hour = bcd2bin(buff[2]);		/* bit5 PA_H20 */
+	tm->tm_wday = bcd2bin(buff[3]);
+	tm->tm_mday = bcd2bin(buff[4]);
+	tm->tm_mon  = bcd2bin(buff[5]) - 1;	/* back to system 0-11 */
+	tm->tm_year = bcd2bin(buff[6]) + 100 * cent_flag;
+
+	return 0;
+}
+
+static int rc5t619_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+	u8 buff[7];
+	int err;
+	int cent_flag;
+
+	if (tm->tm_year >= 100)
+		cent_flag = 1;
+	else
+		cent_flag = 0;
+
+	tm->tm_mon = tm->tm_mon + 1;
+	buff[0] = bin2bcd(tm->tm_sec);
+	buff[1] = bin2bcd(tm->tm_min);
+	buff[2] = bin2bcd(tm->tm_hour);
+	buff[3] = bin2bcd(tm->tm_wday);
+	buff[4] = bin2bcd(tm->tm_mday);
+	buff[5] = bin2bcd(tm->tm_mon);		/* system set 0-11 */
+	buff[6] = bin2bcd(tm->tm_year - cent_flag * 100);
+
+	if (cent_flag)
+		buff[5] |= 0x80;
+
+	err = regmap_bulk_write(rtc->rn5t618->regmap, RN5T618_RTC_SECONDS,
+				buff, sizeof(buff));
+	if (err < 0) {
+		dev_err(dev, "failed to program new time: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int rc5t619_rtc_alarm_is_enabled(struct device *dev,  uint8_t *enabled)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+	int err;
+	unsigned int reg_data;
+
+	err = regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1, &reg_data);
+	if (err) {
+		dev_err(dev, "read RTC_CTRL1 error %d\n", err);
+		*enabled = 0;
+	} else {
+		if (reg_data & CTRL1_ALARM_ENABLED)
+			*enabled = 1;
+		else
+			*enabled = 0;
+	}
+
+	return err;
+}
+
+/* 0-disable, 1-enable */
+static int rc5t619_rtc_alarm_enable(struct device *dev, unsigned int enabled)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+	int err;
+
+	err = regmap_update_bits(rtc->rn5t618->regmap,
+			RN5T618_RTC_CTRL1,
+			CTRL1_ALARM_ENABLED,
+			enabled ? CTRL1_ALARM_ENABLED : 0);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int rc5t619_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+	u8 buff[6];
+	unsigned int buff_cent;
+	int err;
+	int cent_flag;
+	unsigned int enabled_flag;
+
+	err = regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_MONTH, &buff_cent);
+	if (err < 0) {
+		dev_err(dev, "failed to read time: %d\n", err);
+		return err;
+	}
+
+	if (buff_cent & 0x80)
+		cent_flag = 1;
+	else
+		cent_flag = 0;
+
+	err = regmap_bulk_read(rtc->rn5t618->regmap, RN5T618_RTC_ALARM_Y_SEC,
+				buff, sizeof(buff));
+	if (err)
+		return err;
+
+	err = regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1,
+				&enabled_flag);
+	if (err)
+		return err;
+
+	if (enabled_flag & CTRL1_ALARM_ENABLED)
+		enabled_flag = 1;
+	else
+		enabled_flag = 0;
+
+
+	buff[3] = buff[3] & 0x3f;
+
+	alrm->time.tm_sec  = bcd2bin(buff[0]);
+	alrm->time.tm_min  = bcd2bin(buff[1]);
+	alrm->time.tm_hour = bcd2bin(buff[2]);
+	alrm->time.tm_mday = bcd2bin(buff[3]);
+	alrm->time.tm_mon  = bcd2bin(buff[4]) - 1;
+	alrm->time.tm_year = bcd2bin(buff[5]) + 100 * cent_flag;
+	alrm->enabled = enabled_flag;
+	dev_dbg(dev, "read alarm: %d/%d/%d %d:%d:%d\n",
+		(alrm->time.tm_mon), alrm->time.tm_mday, alrm->time.tm_year,
+		 alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_sec);
+
+	return 0;
+}
+
+static int rc5t619_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+	u8 buff[6];
+	int err;
+	int cent_flag;
+
+	err = 0;
+	rc5t619_rtc_alarm_enable(dev, 0);
+	if (rtc->irq == -1)
+		return -EIO;
+
+	if (alrm->enabled == 0)
+		return 0;
+
+	if (alrm->time.tm_year >= 100)
+		cent_flag = 1;
+	else
+		cent_flag = 0;
+
+	alrm->time.tm_mon += 1;
+	buff[0] = bin2bcd(alrm->time.tm_sec);
+	buff[1] = bin2bcd(alrm->time.tm_min);
+	buff[2] = bin2bcd(alrm->time.tm_hour);
+	buff[3] = bin2bcd(alrm->time.tm_mday);
+	buff[4] = bin2bcd(alrm->time.tm_mon);
+	buff[5] = bin2bcd(alrm->time.tm_year - 100 * cent_flag);
+	buff[3] |= 0x80;	/* set DAL_EXT */
+
+	err = regmap_bulk_write(rtc->rn5t618->regmap, RN5T618_RTC_ALARM_Y_SEC,
+				buff, sizeof(buff));
+	if (err) {
+		dev_err(dev, "unable to set alarm: %d\n", err);
+		return -EBUSY;
+	}
+
+	rc5t619_rtc_alarm_enable(dev, alrm->enabled);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rc5t619_rtc_ops = {
+	.read_time	= rc5t619_rtc_read_time,
+	.set_time	= rc5t619_rtc_set_time,
+	.set_alarm	= rc5t619_rtc_set_alarm,
+	.read_alarm	= rc5t619_rtc_read_alarm,
+	.alarm_irq_enable = rc5t619_rtc_alarm_enable,
+};
+
+static int rc5t619_rtc_alarm_flag_clr(struct device *dev)
+{
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+
+	/* clear alarm-D status bits.*/
+	return regmap_update_bits(rtc->rn5t618->regmap,
+				RN5T618_RTC_CTRL2,
+				CTRL2_ALARM_STATUS | CTRL2_CTC, 0);
+}
+
+static irqreturn_t rc5t619_rtc_irq(int irq, void *data)
+{
+	struct device *dev = data;
+	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
+
+	rc5t619_rtc_alarm_flag_clr(dev);
+
+	rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_AF);
+	return IRQ_HANDLED;
+}
+
+
+static int rc5t619_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rn5t618 *rn5t618 = dev_get_drvdata(pdev->dev.parent);
+	struct rc5t619_rtc *rtc;
+	uint8_t pon_flag, alarm_flag;
+	int err;
+
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
+	if (IS_ERR(rtc)) {
+		err = PTR_ERR(rtc);
+		dev_err(&pdev->dev, "no enough memory for rc5t619_rtc using\n");
+		return -ENOMEM;
+	}
+
+	rtc->rn5t618 = rn5t618;
+
+	dev_set_drvdata(dev, rtc);
+	rtc->irq = -1;
+
+	if (rn5t618->irq_data)
+		rtc->irq = regmap_irq_get_virq(rn5t618->irq_data,
+				RN5T618_IRQ_RTC);
+
+	if (rtc->irq  < 0) {
+		dev_err(dev, "no irq specified, wakeup is disabled\n");
+		rtc->irq = -1;
+	}
+
+	/* get interrupt flag */
+	err = rc5t619_rtc_alarm_is_enabled(dev, &alarm_flag);
+	if (err)
+		return err;
+
+	/* get PON flag */
+	err = rc5t619_rtc_pon_get_clr(&pdev->dev, &pon_flag);
+	if (err) {
+		dev_err(&pdev->dev, "get PON flag error: %d\n", err);
+		return err;
+	}
+
+	/* using 24h-mode */
+	err = rc5t619_rtc_24hour_mode_set(&pdev->dev, 1);
+
+	/* disable rtc periodic function */
+	err = rc5t619_rtc_periodic_disable(&pdev->dev);
+	if (err) {
+		dev_err(&pdev->dev, "disable rtc periodic int: %d\n", err);
+		return err;
+	}
+
+	/* clearing RTC Adjust register */
+	err = rc5t619_rtc_clk_adjust(&pdev->dev, 0);
+	if (err) {
+		dev_err(&pdev->dev, "unable to program RTC_ADJUST: %d\n", err);
+		return err;
+	}
+
+	/* disable interrupt */
+	err = rc5t619_rtc_alarm_enable(&pdev->dev, 0);
+	if (err) {
+		dev_err(&pdev->dev, "disable alarm interrupt: %d\n", err);
+		return err;
+	}
+
+	if (pon_flag) {
+		alarm_flag = 0;
+		err = rc5t619_rtc_alarm_flag_clr(&pdev->dev);
+		if (err) {
+			dev_err(&pdev->dev,
+				"pon=1 clear alarm flag error: %d\n", err);
+			return err;
+		}
+	}
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
+				       &rc5t619_rtc_ops, THIS_MODULE);
+
+	if (IS_ERR(rtc->rtc)) {
+		err = PTR_ERR(rtc->rtc);
+		dev_err(dev, "RTC device register: err %d\n", err);
+		return err;
+	}
+
+	/* set interrupt and enable it */
+	if (rtc->irq != -1) {
+		err = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
+						rc5t619_rtc_irq,
+						IRQF_ONESHOT,
+						"rtc-rc5t619",
+						&pdev->dev);
+		if (err < 0) {
+			dev_err(&pdev->dev, "request IRQ:%d fail\n", rtc->irq);
+			rtc->irq = -1;
+
+			err = rc5t619_rtc_alarm_enable(&pdev->dev, 0);
+			if (err)
+				return err;
+
+		} else {
+			/* enable wake */
+			enable_irq_wake(rtc->irq);
+			/* enable alarm_d */
+			err = rc5t619_rtc_alarm_enable(&pdev->dev, alarm_flag);
+			if (err) {
+				dev_err(&pdev->dev, "failed rtc setup\n");
+				return -EBUSY;
+			}
+		}
+	} else {
+		/* system don't want to using alarm interrupt, so close it */
+		err = rc5t619_rtc_alarm_enable(&pdev->dev, 0);
+		if (err) {
+			dev_err(&pdev->dev, "disable rtc alarm error\n");
+			return err;
+		}
+
+		dev_err(&pdev->dev, "ricoh61x interrupt is disabled\n");
+	}
+
+	return 0;
+}
+
+static int rc5t619_rtc_remove(struct platform_device *pdev)
+{
+	rc5t619_rtc_alarm_enable(&pdev->dev, 0);
+
+	return 0;
+}
+
+static struct platform_driver rc5t619_rtc_driver = {
+	.driver	= {
+		.name	= "rc5t619-rtc",
+	},
+	.probe	= rc5t619_rtc_probe,
+	.remove	= rc5t619_rtc_remove,
+};
+
+module_platform_driver(rc5t619_rtc_driver);
+MODULE_ALIAS("platform:rc5t619-rtc");
+MODULE_DESCRIPTION("RICOH RC5T619 RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.11.0


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95799883F8
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Aug 2019 22:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbfHIU3S (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Aug 2019 16:29:18 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60313 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728985AbfHIU3R (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Aug 2019 16:29:17 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MV6G6-1hmnLD3sJC-00SB7i; Fri, 09 Aug 2019 22:29:06 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH 14/16] rtc: remove w90x900/nuc900 driver
Date:   Fri,  9 Aug 2019 22:27:42 +0200
Message-Id: <20190809202749.742267-15-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809202749.742267-1-arnd@arndb.de>
References: <20190809202749.742267-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G8qc/wYNLtJbkuHPeqI/QzOt8e9lF3Tmm4TBFiQWdZlmGL8c/cp
 uogjri1+5d1ebyNGebf3HL2775NUYtbTwPNEdG6HjjGSa3v+fdZWaNB5xvRmCWZvBOlzhFK
 02BZy0I0AwwEX4ltQ3LXfCkwRPDAR2DDdrqPqhXkPFH8+gDCCLcEbxe8EgvxTkgp+6wtjLB
 PWonxDLwlz2h1Km/+kpHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6WFg8zv6ofE=:u2heJHDISJ0KANbIVxC8fY
 OXFKBbZSGDola/OaViuqgSk1YxYZIbOLhDLB1RkAOngCyX8BwbA1QI+42sQLGnfclJtiBqOv0
 TsrS54687OMHU3eIf0YBb+GYjy6TdQ28Zbj4Xi6MJd1W2ulGBlgkCa/ZXaMushUI0y/Kil9XL
 sw5uaGjdK9PA496+DHU+ibjt6gcsUaGO+bYe3BdahvShf4RKVib2uqB5SK7gwk9Y+7pJX9iQx
 PfVXh57E6D3OTeLrM6QkamcJWMfCU1tQtkiKTOTYee62i/HorzSE8t2VzJoKavi3KbCC2XrY4
 Ue4nh6qBjHAqcXKyp9dIOxsviInlLzHe4cBrICmBOj9xPdEUNhG7qVe01bZvKGbuEXaOnn2nG
 zSbHglhQ2l0eD//ZtMcyqD+kbqdO+qj5hv2ORitZzjS9rcqlbf9KX2AXtaAYYGHnlCxrItkXx
 2W/p8ZYslRZYcB5tPT9e1wrzBE6hvHZq/PtbZdvIeBMnBm1//Mhid815/r+VYL0JaumdZHWVz
 rzsISkJRfIqsccyHQocofq2OYF23omZkA0GiJhFoqNDkflC1th3FKD/udsth/fPlfgvRkOCOq
 0WC0rMgDfWA7L/oJCA0++O8dUJZVphqEN0rxAI+buCDP026NiP7nu4+cE2LocDPH/wPdp1NV4
 gYUh1CFgOXgL/HyLz8q61WfIpgwcnVcn8cTm9ktf7XYKA7idtjyqrtG19W33mxxEC3tu0MHrB
 sBXETIP7FcjvU6fHtrm47wQ130fl/jAH2kAcrg==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The ARM w90x900 platform is getting removed, so this driver is obsolete.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/Kconfig      |   7 -
 drivers/rtc/Makefile     |   1 -
 drivers/rtc/rtc-nuc900.c | 271 ---------------------------------------
 3 files changed, 279 deletions(-)
 delete mode 100644 drivers/rtc/rtc-nuc900.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..2805cbb32ade 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1247,13 +1247,6 @@ config RTC_DRV_AB8500
 	  Select this to enable the ST-Ericsson AB8500 power management IC RTC
 	  support. This chip contains a battery- and capacitor-backed RTC.
 
-config RTC_DRV_NUC900
-	tristate "NUC910/NUC920 RTC driver"
-	depends on ARCH_W90X900 || COMPILE_TEST
-	help
-	  If you say yes here you get support for the RTC subsystem of the
-	  NUC910/NUC920 used in embedded systems.
-
 config RTC_DRV_OPAL
 	tristate "IBM OPAL RTC driver"
 	depends on PPC_POWERNV
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 6b09c21dc1b6..9fe0e938272c 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -113,7 +113,6 @@ obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
 obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
 obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
 obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
-obj-$(CONFIG_RTC_DRV_NUC900)	+= rtc-nuc900.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
 obj-$(CONFIG_RTC_DRV_PALMAS)	+= rtc-palmas.o
diff --git a/drivers/rtc/rtc-nuc900.c b/drivers/rtc/rtc-nuc900.c
deleted file mode 100644
index 49cc4058614d..000000000000
--- a/drivers/rtc/rtc-nuc900.c
+++ /dev/null
@@ -1,271 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2008-2009 Nuvoton technology corporation.
- *
- * Wan ZongShun <mcuos.com@gmail.com>
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/rtc.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/bcd.h>
-
-/* RTC Control Registers */
-#define REG_RTC_INIR		0x00
-#define REG_RTC_AER		0x04
-#define REG_RTC_FCR		0x08
-#define REG_RTC_TLR		0x0C
-#define REG_RTC_CLR		0x10
-#define REG_RTC_TSSR		0x14
-#define REG_RTC_DWR		0x18
-#define REG_RTC_TAR		0x1C
-#define REG_RTC_CAR		0x20
-#define REG_RTC_LIR		0x24
-#define REG_RTC_RIER		0x28
-#define REG_RTC_RIIR		0x2C
-#define REG_RTC_TTR		0x30
-
-#define RTCSET			0x01
-#define AERRWENB		0x10000
-#define INIRRESET		0xa5eb1357
-#define AERPOWERON		0xA965
-#define AERPOWEROFF		0x0000
-#define LEAPYEAR		0x0001
-#define TICKENB			0x80
-#define TICKINTENB		0x0002
-#define ALARMINTENB		0x0001
-#define MODE24			0x0001
-
-struct nuc900_rtc {
-	int			irq_num;
-	void __iomem		*rtc_reg;
-	struct rtc_device	*rtcdev;
-};
-
-struct nuc900_bcd_time {
-	int bcd_sec;
-	int bcd_min;
-	int bcd_hour;
-	int bcd_mday;
-	int bcd_mon;
-	int bcd_year;
-};
-
-static irqreturn_t nuc900_rtc_interrupt(int irq, void *_rtc)
-{
-	struct nuc900_rtc *rtc = _rtc;
-	unsigned long events = 0, rtc_irq;
-
-	rtc_irq = __raw_readl(rtc->rtc_reg + REG_RTC_RIIR);
-
-	if (rtc_irq & ALARMINTENB) {
-		rtc_irq &= ~ALARMINTENB;
-		__raw_writel(rtc_irq, rtc->rtc_reg + REG_RTC_RIIR);
-		events |= RTC_AF | RTC_IRQF;
-	}
-
-	if (rtc_irq & TICKINTENB) {
-		rtc_irq &= ~TICKINTENB;
-		__raw_writel(rtc_irq, rtc->rtc_reg + REG_RTC_RIIR);
-		events |= RTC_UF | RTC_IRQF;
-	}
-
-	rtc_update_irq(rtc->rtcdev, 1, events);
-
-	return IRQ_HANDLED;
-}
-
-static int *check_rtc_access_enable(struct nuc900_rtc *nuc900_rtc)
-{
-	unsigned int timeout = 0x1000;
-	__raw_writel(INIRRESET, nuc900_rtc->rtc_reg + REG_RTC_INIR);
-
-	mdelay(10);
-
-	__raw_writel(AERPOWERON, nuc900_rtc->rtc_reg + REG_RTC_AER);
-
-	while (!(__raw_readl(nuc900_rtc->rtc_reg + REG_RTC_AER) & AERRWENB)
-								&& --timeout)
-		mdelay(1);
-
-	if (!timeout)
-		return ERR_PTR(-EPERM);
-
-	return NULL;
-}
-
-static void nuc900_rtc_bcd2bin(unsigned int timereg,
-			       unsigned int calreg, struct rtc_time *tm)
-{
-	tm->tm_mday	= bcd2bin(calreg >> 0);
-	tm->tm_mon	= bcd2bin(calreg >> 8);
-	tm->tm_year	= bcd2bin(calreg >> 16) + 100;
-
-	tm->tm_sec	= bcd2bin(timereg >> 0);
-	tm->tm_min	= bcd2bin(timereg >> 8);
-	tm->tm_hour	= bcd2bin(timereg >> 16);
-}
-
-static void nuc900_rtc_bin2bcd(struct device *dev, struct rtc_time *settm,
-						struct nuc900_bcd_time *gettm)
-{
-	gettm->bcd_mday = bin2bcd(settm->tm_mday) << 0;
-	gettm->bcd_mon  = bin2bcd(settm->tm_mon) << 8;
-
-	if (settm->tm_year < 100) {
-		dev_warn(dev, "The year will be between 1970-1999, right?\n");
-		gettm->bcd_year = bin2bcd(settm->tm_year) << 16;
-	} else {
-		gettm->bcd_year = bin2bcd(settm->tm_year - 100) << 16;
-	}
-
-	gettm->bcd_sec  = bin2bcd(settm->tm_sec) << 0;
-	gettm->bcd_min  = bin2bcd(settm->tm_min) << 8;
-	gettm->bcd_hour = bin2bcd(settm->tm_hour) << 16;
-}
-
-static int nuc900_alarm_irq_enable(struct device *dev, unsigned int enabled)
-{
-	struct nuc900_rtc *rtc = dev_get_drvdata(dev);
-
-	if (enabled)
-		__raw_writel(__raw_readl(rtc->rtc_reg + REG_RTC_RIER)|
-				(ALARMINTENB), rtc->rtc_reg + REG_RTC_RIER);
-	else
-		__raw_writel(__raw_readl(rtc->rtc_reg + REG_RTC_RIER)&
-				(~ALARMINTENB), rtc->rtc_reg + REG_RTC_RIER);
-
-	return 0;
-}
-
-static int nuc900_rtc_read_time(struct device *dev, struct rtc_time *tm)
-{
-	struct nuc900_rtc *rtc = dev_get_drvdata(dev);
-	unsigned int timeval, clrval;
-
-	timeval = __raw_readl(rtc->rtc_reg + REG_RTC_TLR);
-	clrval	= __raw_readl(rtc->rtc_reg + REG_RTC_CLR);
-
-	nuc900_rtc_bcd2bin(timeval, clrval, tm);
-
-	return 0;
-}
-
-static int nuc900_rtc_set_time(struct device *dev, struct rtc_time *tm)
-{
-	struct nuc900_rtc *rtc = dev_get_drvdata(dev);
-	struct nuc900_bcd_time gettm;
-	unsigned long val;
-	int *err;
-
-	nuc900_rtc_bin2bcd(dev, tm, &gettm);
-
-	err = check_rtc_access_enable(rtc);
-	if (IS_ERR(err))
-		return PTR_ERR(err);
-
-	val = gettm.bcd_mday | gettm.bcd_mon | gettm.bcd_year;
-	__raw_writel(val, rtc->rtc_reg + REG_RTC_CLR);
-
-	val = gettm.bcd_sec | gettm.bcd_min | gettm.bcd_hour;
-	__raw_writel(val, rtc->rtc_reg + REG_RTC_TLR);
-
-	return 0;
-}
-
-static int nuc900_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct nuc900_rtc *rtc = dev_get_drvdata(dev);
-	unsigned int timeval, carval;
-
-	timeval = __raw_readl(rtc->rtc_reg + REG_RTC_TAR);
-	carval	= __raw_readl(rtc->rtc_reg + REG_RTC_CAR);
-
-	nuc900_rtc_bcd2bin(timeval, carval, &alrm->time);
-
-	return rtc_valid_tm(&alrm->time);
-}
-
-static int nuc900_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct nuc900_rtc *rtc = dev_get_drvdata(dev);
-	struct nuc900_bcd_time tm;
-	unsigned long val;
-	int *err;
-
-	nuc900_rtc_bin2bcd(dev, &alrm->time, &tm);
-
-	err = check_rtc_access_enable(rtc);
-	if (IS_ERR(err))
-		return PTR_ERR(err);
-
-	val = tm.bcd_mday | tm.bcd_mon | tm.bcd_year;
-	__raw_writel(val, rtc->rtc_reg + REG_RTC_CAR);
-
-	val = tm.bcd_sec | tm.bcd_min | tm.bcd_hour;
-	__raw_writel(val, rtc->rtc_reg + REG_RTC_TAR);
-
-	return 0;
-}
-
-static const struct rtc_class_ops nuc900_rtc_ops = {
-	.read_time = nuc900_rtc_read_time,
-	.set_time = nuc900_rtc_set_time,
-	.read_alarm = nuc900_rtc_read_alarm,
-	.set_alarm = nuc900_rtc_set_alarm,
-	.alarm_irq_enable = nuc900_alarm_irq_enable,
-};
-
-static int __init nuc900_rtc_probe(struct platform_device *pdev)
-{
-	struct resource *res;
-	struct nuc900_rtc *nuc900_rtc;
-
-	nuc900_rtc = devm_kzalloc(&pdev->dev, sizeof(struct nuc900_rtc),
-				GFP_KERNEL);
-	if (!nuc900_rtc)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nuc900_rtc->rtc_reg = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(nuc900_rtc->rtc_reg))
-		return PTR_ERR(nuc900_rtc->rtc_reg);
-
-	platform_set_drvdata(pdev, nuc900_rtc);
-
-	nuc900_rtc->rtcdev = devm_rtc_device_register(&pdev->dev, pdev->name,
-						&nuc900_rtc_ops, THIS_MODULE);
-	if (IS_ERR(nuc900_rtc->rtcdev)) {
-		dev_err(&pdev->dev, "rtc device register failed\n");
-		return PTR_ERR(nuc900_rtc->rtcdev);
-	}
-
-	__raw_writel(__raw_readl(nuc900_rtc->rtc_reg + REG_RTC_TSSR) | MODE24,
-					nuc900_rtc->rtc_reg + REG_RTC_TSSR);
-
-	nuc900_rtc->irq_num = platform_get_irq(pdev, 0);
-	if (devm_request_irq(&pdev->dev, nuc900_rtc->irq_num,
-			nuc900_rtc_interrupt, 0, "nuc900rtc", nuc900_rtc)) {
-		dev_err(&pdev->dev, "NUC900 RTC request irq failed\n");
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
-static struct platform_driver nuc900_rtc_driver = {
-	.driver		= {
-		.name	= "nuc900-rtc",
-	},
-};
-
-module_platform_driver_probe(nuc900_rtc_driver, nuc900_rtc_probe);
-
-MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
-MODULE_DESCRIPTION("nuc910/nuc920 RTC driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:nuc900-rtc");
-- 
2.20.0


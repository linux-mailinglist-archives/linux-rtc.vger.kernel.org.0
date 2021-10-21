Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AF4436B47
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Oct 2021 21:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhJUTZ6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Oct 2021 15:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbhJUTZ5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Oct 2021 15:25:57 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E928BC061764;
        Thu, 21 Oct 2021 12:23:40 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l5so403113lja.13;
        Thu, 21 Oct 2021 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IlvbifZsbZAnav3oP7dlLIIybj3gfnsNpn6USl8liNA=;
        b=RNlLVtte0+hNwmYalL05rZDPmkHdRicxBt65l/JCgOrumPFfyTyrMhn/Hfoz0D3MG6
         PDi61JZOdlRBaqsThbbBJpJwEdUSGl4FsuMfrMBQvOIsxMoSYA4pcR7NCupvX0/Z6piG
         F/Noq8Cxjm0LRV1cxAmnaHEyOdbKgV8viuVfJDIdFM0lGibOy9oeIqBG6+0xrTlrgjsR
         cbyCEFWOLlC4CEnoEmf93LBW3oeR+fLIYsbMyWE0uzCbqDFb0q0fCNXrDBwHFKKEnCih
         mm3UQmUo0yJOCuXWX5KWg/o4jVdpxxyyTmTg/cBnzhdLgFub3/hTJeQbviT4AVVZP/fO
         WV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IlvbifZsbZAnav3oP7dlLIIybj3gfnsNpn6USl8liNA=;
        b=q+ngBTPh/UbNiNEaLnhUkbFeZJaNsGypORj+7HTWJfzCaldSCbMbh0FTfUGo7JQ2KE
         UCYi8erOkf+JEfU/84rzvWpaTEN2FNtywwMG0eIKgS556HIb0EjONo71ulbV3XbH6nCh
         duw5qBeWFK2BaP0pNMi3BoYZtU2aC51SsZHUqpicUFhME2pDu+oajgJ5wYdXHvo+pjSm
         7l/FZ7taNierqXInwkQntCHhL2snk7rH1aKcE0ec+qjQuS2yPQSiq+cAsFkH+5xPA5mT
         gu8WQLs2DekzOCxNP8PKE0DwNH2joJqT4jHKFQRgY2tX8WiRr8nPM4Td56FhdOTTIYNN
         iPAQ==
X-Gm-Message-State: AOAM5317PLGgl2oGTNG4vJDsyU3y1a61e3C1Ao4CZJd6Sut2zRUDR+vO
        rYAsKi4DCsc4HF0AHAUa/7k=
X-Google-Smtp-Source: ABdhPJwfEseoK4n0XPnXydLzBZCc1kowdh19zZnVX7N5Cpoi8JV1+OJZWy3DlcaCU7/waSu9ZUAYog==
X-Received: by 2002:a2e:bf26:: with SMTP id c38mr8148464ljr.127.1634844219312;
        Thu, 21 Oct 2021 12:23:39 -0700 (PDT)
Received: from localhost.localdomain (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.gmail.com with ESMTPSA id c20sm533763lfi.182.2021.10.21.12.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 12:23:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v1 1/3] rtc: tps80031: Remove driver
Date:   Thu, 21 Oct 2021 22:22:56 +0300
Message-Id: <20211021192258.21968-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211021192258.21968-1-digetx@gmail.com>
References: <20211021192258.21968-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Driver was upstreamed in 2013 and never got a user, remove it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/rtc/Kconfig        |   8 -
 drivers/rtc/Makefile       |   1 -
 drivers/rtc/rtc-tps80031.c | 324 -------------------------------------
 3 files changed, 333 deletions(-)
 delete mode 100644 drivers/rtc/rtc-tps80031.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 456450722555..058e56a10ab8 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -583,14 +583,6 @@ config RTC_DRV_TPS65910
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-tps65910.
 
-config RTC_DRV_TPS80031
-	tristate "TI TPS80031/TPS80032 RTC driver"
-	depends on MFD_TPS80031
-	help
-	  TI Power Management IC TPS80031 supports RTC functionality
-	  along with alarm. This driver supports the RTC driver for
-	  the TPS80031 RTC module.
-
 config RTC_DRV_RC5T583
 	tristate "RICOH 5T583 RTC driver"
 	depends on MFD_RC5T583
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index e76308053b0f..678a8ef4abae 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -170,7 +170,6 @@ obj-$(CONFIG_RTC_DRV_TEGRA)	+= rtc-tegra.o
 obj-$(CONFIG_RTC_DRV_TEST)	+= rtc-test.o
 obj-$(CONFIG_RTC_DRV_TPS6586X)	+= rtc-tps6586x.o
 obj-$(CONFIG_RTC_DRV_TPS65910)	+= rtc-tps65910.o
-obj-$(CONFIG_RTC_DRV_TPS80031)	+= rtc-tps80031.o
 obj-$(CONFIG_RTC_DRV_TWL4030)	+= rtc-twl.o
 obj-$(CONFIG_RTC_DRV_V3020)	+= rtc-v3020.o
 obj-$(CONFIG_RTC_DRV_VR41XX)	+= rtc-vr41xx.o
diff --git a/drivers/rtc/rtc-tps80031.c b/drivers/rtc/rtc-tps80031.c
deleted file mode 100644
index c77b8eab94a0..000000000000
--- a/drivers/rtc/rtc-tps80031.c
+++ /dev/null
@@ -1,324 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * rtc-tps80031.c -- TI TPS80031/TPS80032 RTC driver
- *
- * RTC driver for TI TPS80031/TPS80032 Fully Integrated
- * Power Management with Power Path and Battery Charger
- *
- * Copyright (c) 2012, NVIDIA Corporation.
- *
- * Author: Laxman Dewangan <ldewangan@nvidia.com>
- */
-
-#include <linux/bcd.h>
-#include <linux/device.h>
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/mfd/tps80031.h>
-#include <linux/platform_device.h>
-#include <linux/pm.h>
-#include <linux/rtc.h>
-#include <linux/slab.h>
-
-#define ENABLE_ALARM_INT			0x08
-#define ALARM_INT_STATUS			0x40
-
-/**
- * Setting bit to 1 in STOP_RTC will run the RTC and
- * setting this bit to 0 will freeze RTC.
- */
-#define STOP_RTC				0x1
-
-/* Power on reset Values of RTC registers */
-#define TPS80031_RTC_POR_YEAR			0
-#define TPS80031_RTC_POR_MONTH			1
-#define TPS80031_RTC_POR_DAY			1
-
-/* Numbers of registers for time and alarms */
-#define TPS80031_RTC_TIME_NUM_REGS		7
-#define TPS80031_RTC_ALARM_NUM_REGS		6
-
-/**
- * PMU RTC have only 2 nibbles to store year information, so using an
- * offset of 100 to set the base year as 2000 for our driver.
- */
-#define RTC_YEAR_OFFSET 100
-
-struct tps80031_rtc {
-	struct rtc_device	*rtc;
-	int			irq;
-};
-
-static int tps80031_rtc_read_time(struct device *dev, struct rtc_time *tm)
-{
-	u8 buff[TPS80031_RTC_TIME_NUM_REGS];
-	int ret;
-
-	ret = tps80031_reads(dev->parent, TPS80031_SLAVE_ID1,
-			TPS80031_SECONDS_REG, TPS80031_RTC_TIME_NUM_REGS, buff);
-	if (ret < 0) {
-		dev_err(dev, "reading RTC_SECONDS_REG failed, err = %d\n", ret);
-		return ret;
-	}
-
-	tm->tm_sec = bcd2bin(buff[0]);
-	tm->tm_min = bcd2bin(buff[1]);
-	tm->tm_hour = bcd2bin(buff[2]);
-	tm->tm_mday = bcd2bin(buff[3]);
-	tm->tm_mon = bcd2bin(buff[4]) - 1;
-	tm->tm_year = bcd2bin(buff[5]) + RTC_YEAR_OFFSET;
-	tm->tm_wday = bcd2bin(buff[6]);
-	return 0;
-}
-
-static int tps80031_rtc_set_time(struct device *dev, struct rtc_time *tm)
-{
-	u8 buff[7];
-	int ret;
-
-	buff[0] = bin2bcd(tm->tm_sec);
-	buff[1] = bin2bcd(tm->tm_min);
-	buff[2] = bin2bcd(tm->tm_hour);
-	buff[3] = bin2bcd(tm->tm_mday);
-	buff[4] = bin2bcd(tm->tm_mon + 1);
-	buff[5] = bin2bcd(tm->tm_year % RTC_YEAR_OFFSET);
-	buff[6] = bin2bcd(tm->tm_wday);
-
-	/* Stop RTC while updating the RTC time registers */
-	ret = tps80031_clr_bits(dev->parent, TPS80031_SLAVE_ID1,
-				TPS80031_RTC_CTRL_REG, STOP_RTC);
-	if (ret < 0) {
-		dev_err(dev->parent, "Stop RTC failed, err = %d\n", ret);
-		return ret;
-	}
-
-	ret = tps80031_writes(dev->parent, TPS80031_SLAVE_ID1,
-			TPS80031_SECONDS_REG,
-			TPS80031_RTC_TIME_NUM_REGS, buff);
-	if (ret < 0) {
-		dev_err(dev, "writing RTC_SECONDS_REG failed, err %d\n", ret);
-		return ret;
-	}
-
-	ret = tps80031_set_bits(dev->parent, TPS80031_SLAVE_ID1,
-				TPS80031_RTC_CTRL_REG, STOP_RTC);
-	if (ret < 0)
-		dev_err(dev->parent, "Start RTC failed, err = %d\n", ret);
-	return ret;
-}
-
-static int tps80031_rtc_alarm_irq_enable(struct device *dev,
-					 unsigned int enable)
-{
-	int ret;
-
-	if (enable)
-		ret = tps80031_set_bits(dev->parent, TPS80031_SLAVE_ID1,
-				TPS80031_RTC_INTERRUPTS_REG, ENABLE_ALARM_INT);
-	else
-		ret = tps80031_clr_bits(dev->parent, TPS80031_SLAVE_ID1,
-				TPS80031_RTC_INTERRUPTS_REG, ENABLE_ALARM_INT);
-	if (ret < 0) {
-		dev_err(dev, "Update on RTC_INT failed, err = %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
-static int tps80031_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	u8 buff[TPS80031_RTC_ALARM_NUM_REGS];
-	int ret;
-
-	buff[0] = bin2bcd(alrm->time.tm_sec);
-	buff[1] = bin2bcd(alrm->time.tm_min);
-	buff[2] = bin2bcd(alrm->time.tm_hour);
-	buff[3] = bin2bcd(alrm->time.tm_mday);
-	buff[4] = bin2bcd(alrm->time.tm_mon + 1);
-	buff[5] = bin2bcd(alrm->time.tm_year % RTC_YEAR_OFFSET);
-	ret = tps80031_writes(dev->parent, TPS80031_SLAVE_ID1,
-			TPS80031_ALARM_SECONDS_REG,
-			TPS80031_RTC_ALARM_NUM_REGS, buff);
-	if (ret < 0) {
-		dev_err(dev, "Writing RTC_ALARM failed, err %d\n", ret);
-		return ret;
-	}
-	return tps80031_rtc_alarm_irq_enable(dev, alrm->enabled);
-}
-
-static int tps80031_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	u8 buff[6];
-	int ret;
-
-	ret = tps80031_reads(dev->parent, TPS80031_SLAVE_ID1,
-			TPS80031_ALARM_SECONDS_REG,
-			TPS80031_RTC_ALARM_NUM_REGS, buff);
-	if (ret < 0) {
-		dev_err(dev->parent,
-			"reading RTC_ALARM failed, err = %d\n", ret);
-		return ret;
-	}
-
-	alrm->time.tm_sec = bcd2bin(buff[0]);
-	alrm->time.tm_min = bcd2bin(buff[1]);
-	alrm->time.tm_hour = bcd2bin(buff[2]);
-	alrm->time.tm_mday = bcd2bin(buff[3]);
-	alrm->time.tm_mon = bcd2bin(buff[4]) - 1;
-	alrm->time.tm_year = bcd2bin(buff[5]) + RTC_YEAR_OFFSET;
-	return 0;
-}
-
-static int clear_alarm_int_status(struct device *dev, struct tps80031_rtc *rtc)
-{
-	int ret;
-	u8 buf;
-
-	/**
-	 * As per datasheet, A dummy read of this  RTC_STATUS_REG register
-	 * is necessary before each I2C read in order to update the status
-	 * register value.
-	 */
-	ret = tps80031_read(dev->parent, TPS80031_SLAVE_ID1,
-				TPS80031_RTC_STATUS_REG, &buf);
-	if (ret < 0) {
-		dev_err(dev, "reading RTC_STATUS failed. err = %d\n", ret);
-		return ret;
-	}
-
-	/* clear Alarm status bits.*/
-	ret = tps80031_set_bits(dev->parent, TPS80031_SLAVE_ID1,
-			TPS80031_RTC_STATUS_REG, ALARM_INT_STATUS);
-	if (ret < 0) {
-		dev_err(dev, "clear Alarm INT failed, err = %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
-static irqreturn_t tps80031_rtc_irq(int irq, void *data)
-{
-	struct device *dev = data;
-	struct tps80031_rtc *rtc = dev_get_drvdata(dev);
-	int ret;
-
-	ret = clear_alarm_int_status(dev, rtc);
-	if (ret < 0)
-		return ret;
-
-	rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_AF);
-	return IRQ_HANDLED;
-}
-
-static const struct rtc_class_ops tps80031_rtc_ops = {
-	.read_time = tps80031_rtc_read_time,
-	.set_time = tps80031_rtc_set_time,
-	.set_alarm = tps80031_rtc_set_alarm,
-	.read_alarm = tps80031_rtc_read_alarm,
-	.alarm_irq_enable = tps80031_rtc_alarm_irq_enable,
-};
-
-static int tps80031_rtc_probe(struct platform_device *pdev)
-{
-	struct tps80031_rtc *rtc;
-	struct rtc_time tm;
-	int ret;
-
-	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
-	if (!rtc)
-		return -ENOMEM;
-
-	rtc->irq = platform_get_irq(pdev, 0);
-	platform_set_drvdata(pdev, rtc);
-
-	/* Start RTC */
-	ret = tps80031_set_bits(pdev->dev.parent, TPS80031_SLAVE_ID1,
-			TPS80031_RTC_CTRL_REG, STOP_RTC);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to start RTC. err = %d\n", ret);
-		return ret;
-	}
-
-	/* If RTC have POR values, set time 01:01:2000 */
-	tps80031_rtc_read_time(&pdev->dev, &tm);
-	if ((tm.tm_year == RTC_YEAR_OFFSET + TPS80031_RTC_POR_YEAR) &&
-		(tm.tm_mon == (TPS80031_RTC_POR_MONTH - 1)) &&
-		(tm.tm_mday == TPS80031_RTC_POR_DAY)) {
-		tm.tm_year = 2000;
-		tm.tm_mday = 1;
-		tm.tm_mon = 1;
-		ret = tps80031_rtc_set_time(&pdev->dev, &tm);
-		if (ret < 0) {
-			dev_err(&pdev->dev,
-				"RTC set time failed, err = %d\n", ret);
-			return ret;
-		}
-	}
-
-	/* Clear alarm intretupt status if it is there */
-	ret = clear_alarm_int_status(&pdev->dev, rtc);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Clear alarm int failed, err = %d\n", ret);
-		return ret;
-	}
-
-	rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-			       &tps80031_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc->rtc)) {
-		ret = PTR_ERR(rtc->rtc);
-		dev_err(&pdev->dev, "RTC registration failed, err %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
-			tps80031_rtc_irq,
-			IRQF_ONESHOT,
-			dev_name(&pdev->dev), rtc);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "request IRQ:%d failed, err = %d\n",
-			 rtc->irq, ret);
-		return ret;
-	}
-	device_set_wakeup_capable(&pdev->dev, 1);
-	return 0;
-}
-
-#ifdef CONFIG_PM_SLEEP
-static int tps80031_rtc_suspend(struct device *dev)
-{
-	struct tps80031_rtc *rtc = dev_get_drvdata(dev);
-
-	if (device_may_wakeup(dev))
-		enable_irq_wake(rtc->irq);
-	return 0;
-}
-
-static int tps80031_rtc_resume(struct device *dev)
-{
-	struct tps80031_rtc *rtc = dev_get_drvdata(dev);
-
-	if (device_may_wakeup(dev))
-		disable_irq_wake(rtc->irq);
-	return 0;
-};
-#endif
-
-static SIMPLE_DEV_PM_OPS(tps80031_pm_ops, tps80031_rtc_suspend,
-			tps80031_rtc_resume);
-
-static struct platform_driver tps80031_rtc_driver = {
-	.driver	= {
-		.name	= "tps80031-rtc",
-		.pm	= &tps80031_pm_ops,
-	},
-	.probe	= tps80031_rtc_probe,
-};
-
-module_platform_driver(tps80031_rtc_driver);
-
-MODULE_ALIAS("platform:tps80031-rtc");
-MODULE_DESCRIPTION("TI TPS80031/TPS80032 RTC driver");
-MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
-MODULE_LICENSE("GPL v2");
-- 
2.32.0


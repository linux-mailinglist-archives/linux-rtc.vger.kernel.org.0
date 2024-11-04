Return-Path: <linux-rtc+bounces-2447-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E39BB7B2
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 15:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4470F285797
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 14:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151A91B4F0C;
	Mon,  4 Nov 2024 14:25:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D071B0F2D;
	Mon,  4 Nov 2024 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730355; cv=none; b=hE2LZVPabX00J9nuLrmmxYn66YJpSflc32SMFPecD8Y2OX78bZOE+0V/3t/9Lsatqpsr+vHyjBCcwiqiWxpoP9uNhYs7HtqwFJsSsy+Oa/Ie47TyYRDwZrQzGDwsWglTDO4AfilbHzpkm0kw4ZL6yVajaLppTRjXnDiuXXEMpOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730355; c=relaxed/simple;
	bh=GP7HTsABxkmS48dQLestQ5D6hhM0H1Jzo6GIqdWlO/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9M94LC5nungCx5InxTKwkdNEr155+DeGXaDHcmW//u/yjCt5AKXBxAenaJdiMf40uLqGjfnMetj8PjptqfiSYEImqCMkCCFaCEZNwbxTNhAJq5y4UjiyhB/oY778lSbJ5uGUfS3d9A6DPsIaqhs/yS2SqUwGTX3VIGBo5yo+Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 4A4EPZSW062422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 4 Nov 2024 22:25:35 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 22:25:35 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <tim609@andestech.com>
Subject: [PATCH V3 1/1] rtc: atcrtc100: Add driver for atcrtc100 RTC
Date: Mon, 4 Nov 2024 22:25:21 +0800
Message-ID: <20241104142521.1100437-2-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104142521.1100437-1-cl634@andestech.com>
References: <20241104142521.1100437-1-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 4A4EPZSW062422

RTC driver for atcrtc100 Real-Time Clock.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 MAINTAINERS                 |   5 +
 drivers/rtc/Kconfig         |  15 ++
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-atcrtc100.c | 479 ++++++++++++++++++++++++++++++++++++
 4 files changed, 500 insertions(+)
 create mode 100644 drivers/rtc/rtc-atcrtc100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 958e935449e5..10342c0fa599 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3354,6 +3354,11 @@ F:	drivers/power/reset/atc260x-poweroff.c
 F:	drivers/regulator/atc260x-regulator.c
 F:	include/linux/mfd/atc260x/*
 
+ATCRTC100 RTC DRIVER
+M:	CL Wang <cl634@andestech.com>
+S:	Supported
+F:	drivers/rtc/rtc-atcrtc100.c
+
 ATHEROS 71XX/9XXX GPIO DRIVER
 M:	Alban Bedel <albeu@free.fr>
 S:	Maintained
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..f4b5cf0bb8c4 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1019,6 +1019,21 @@ config RTC_DRV_ALPHA
 	  Direct support for the real-time clock found on every Alpha
 	  system, specifically MC146818 compatibles.  If in doubt, say Y.
 
+config RTC_DRV_ATCRTC100
+	tristate "Andes ATCRTC100"
+	depends on RISCV
+	select REGMAP_MMIO
+	help
+	  If you say yes here you will get support for the Andes ATCRTC100
+	  RTC driver.
+
+	  This driver provides support for the Andes ATCRTC100 real-time clock
+	  device. It allows setting and retrieving the time and date, as well
+	  as setting alarms.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called rtc-atcrtc100.
+
 config RTC_DRV_DS1216
 	tristate "Dallas DS1216"
 	depends on SNI_RM
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..cc41cd5d3017 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_RTC_DRV_ASM9260)	+= rtc-asm9260.o
 obj-$(CONFIG_RTC_DRV_ASPEED)	+= rtc-aspeed.o
 obj-$(CONFIG_RTC_DRV_AT91RM9200)+= rtc-at91rm9200.o
 obj-$(CONFIG_RTC_DRV_AT91SAM9)	+= rtc-at91sam9.o
+obj-$(CONFIG_RTC_DRV_ATCRTC100) += rtc-atcrtc100.o
 obj-$(CONFIG_RTC_DRV_AU1XXX)	+= rtc-au1xxx.o
 obj-$(CONFIG_RTC_DRV_BBNSM)	+= rtc-nxp-bbnsm.o
 obj-$(CONFIG_RTC_DRV_BD70528)	+= rtc-bd70528.o
diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
new file mode 100644
index 000000000000..137f8c131ab3
--- /dev/null
+++ b/drivers/rtc/rtc-atcrtc100.c
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Andes ATCRTC100 real time clock.
+ *
+ * Copyright (C) 2024 Andes Technology Corporation
+ */
+
+#include <linux/module.h>
+#include <linux/rtc.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/delay.h>
+#include <linux/workqueue.h>
+
+#define RTC_ID		0x00	/* ID and Revision */
+#define ID_OFF		12
+#define ID_MSK		(0xFFFFF << ID_OFF)
+#define ATCRTC100ID	(0x03011 << ID_OFF)
+#define RTC_RSV		0x4	/* Reserve */
+#define RTC_CNT		0x10	/* Counter */
+#define RTC_ALM		0x14	/* Alarm */
+#define DAY_OFF		17
+#define DAY_MSK		0x7FFF
+#define HOUR_OFF	12
+#define HOUR_MSK	0x1F
+#define MIN_OFF		6
+#define MIN_MSK		0x3F
+#define SEC_OFF		0
+#define SEC_MSK		0x3F
+#define RTC_SECOND(x)	((x >> SEC_OFF) & SEC_MSK)	/* RTC sec */
+#define RTC_MINUTE(x)	((x >> MIN_OFF) & MIN_MSK)	/* RTC min */
+#define RTC_HOUR(x)	((x >> HOUR_OFF) & HOUR_MSK)	/* RTC hour */
+#define RTC_DAYS(x)	((x >> DAY_OFF) & DAY_MSK)	/* RTC day */
+
+#define RTC_CR		0x18	/* Control */
+#define RTC_EN		(0x1UL << 0)
+#define ALARM_WAKEUP	(0x1UL << 1)
+#define ALARM_INT	(0x1UL << 2)
+#define DAY_INT		(0x1UL << 3)
+#define HOUR_INT	(0x1UL << 4)
+#define MIN_INT		(0x1UL << 5)
+#define SEC_INT		(0x1UL << 6)
+#define HSEC_INT	(0x1UL << 7)
+#define RTC_STA		0x1C	/* Status */
+#define WRITE_DONE	(0x1UL << 16)
+#define RTC_TRIM	0x20	/* Digital Trimming */
+
+#define ATCRTC_TIME_TO_SEC(D, H, M, S)	(D * 86400LL + H * 3600 + M * 60 + S)
+
+#define ATCRTC_TIMEOUT_US		1000000
+#define ATCRTC_TIMEOUT_USLEEP_MIN	20
+#define ATCRTC_TIMEOUT_USLEEP_MAX	30
+
+struct atcrtc_dev {
+	struct rtc_device	*rtc_dev;
+	struct regmap		*regmap;
+	struct delayed_work	rtc_work;
+	struct mutex		lock;
+	unsigned int		alarm_irq;
+	unsigned int		time_irq;
+	unsigned char		alarm_en;
+};
+
+static const struct regmap_config atcrtc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = RTC_TRIM,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int atcrtc_check_write_done(struct atcrtc_dev *rtc)
+{
+	int loop;
+	int timeout;
+
+	might_sleep();
+	timeout = ATCRTC_TIMEOUT_US / ATCRTC_TIMEOUT_USLEEP_MIN;
+
+	for (loop = 0; loop < timeout; loop++) {
+		if (regmap_test_bits(rtc->regmap, RTC_STA, WRITE_DONE))
+			return 0;
+
+		usleep_range(ATCRTC_TIMEOUT_USLEEP_MIN,
+			     ATCRTC_TIMEOUT_USLEEP_MAX);
+	}
+	dev_err(&rtc->rtc_dev->dev, "Device is busy too long.\n");
+	return -EBUSY;
+}
+
+static irqreturn_t atcrtc_interrupt(int irq, void *dev)
+{
+	struct atcrtc_dev *rtc = dev;
+
+	if (regmap_test_bits(rtc->regmap, RTC_STA, SEC_INT)) {
+		regmap_write_bits(rtc->regmap, RTC_STA, SEC_INT, SEC_INT);
+		rtc_update_irq(rtc->rtc_dev, 1, RTC_UF | RTC_IRQF);
+		return IRQ_HANDLED;
+	}
+	return IRQ_NONE;
+}
+
+static irqreturn_t atcrtc_alarm(int irq, void *dev_id)
+{
+	struct atcrtc_dev *rtc = dev_id;
+
+	if (regmap_test_bits(rtc->regmap, RTC_STA, ALARM_INT)) {
+		regmap_write_bits(rtc->regmap, RTC_STA, ALARM_INT, ALARM_INT);
+		rtc->alarm_en = 0;
+		schedule_delayed_work(&rtc->rtc_work, 0);
+		rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
+		return IRQ_HANDLED;
+	}
+	return IRQ_NONE;
+}
+
+static int atcrtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+
+	ret = atcrtc_check_write_done(rtc);
+	if (ret) {
+		mutex_unlock(&rtc->lock);
+		return ret;
+	}
+
+	if (enabled)
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, ALARM_INT);
+	else
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, 0);
+
+	mutex_unlock(&rtc->lock);
+
+	return 0;
+}
+
+static int atcrtc_alarm_enable(struct device *dev, unsigned int enabled)
+{
+	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+
+	ret = atcrtc_check_write_done(rtc);
+	if (ret) {
+		mutex_unlock(&rtc->lock);
+		return ret;
+	}
+
+	if (enabled)
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_WAKEUP, ALARM_WAKEUP);
+	else
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_WAKEUP, 0);
+
+	mutex_unlock(&rtc->lock);
+
+	return 0;
+}
+
+static void atcrtc_alarm_clear(struct work_struct *work)
+{
+	struct atcrtc_dev *rtc = container_of(work, struct atcrtc_dev, rtc_work.work);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	if (rtc->alarm_en == 0) {
+		ret = atcrtc_check_write_done(rtc);
+		if (ret) {
+			mutex_unlock(&rtc->lock);
+			return;
+		}
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, 0);
+	}
+	mutex_unlock(&rtc->lock);
+}
+
+static time64_t atcrtc_read_rtc_time(struct atcrtc_dev *rtc)
+{
+	time64_t time;
+	unsigned int rtc_cnt;
+
+	regmap_read(rtc->regmap, RTC_CNT, &rtc_cnt);
+	time = ATCRTC_TIME_TO_SEC(RTC_DAYS(rtc_cnt),
+				  RTC_HOUR(rtc_cnt),
+				  RTC_MINUTE(rtc_cnt),
+				  RTC_SECOND(rtc_cnt));
+	return time;
+}
+
+static int atcrtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
+	time64_t time;
+
+	mutex_lock(&rtc->lock);
+	time = atcrtc_read_rtc_time(rtc);
+	mutex_unlock(&rtc->lock);
+
+	rtc_time64_to_tm(time, tm);
+	if (rtc_valid_tm(tm) < 0) {
+		dev_err(dev, "invalid date\n");
+		rtc_time64_to_tm(0, tm);
+	}
+	return 0;
+}
+
+static void atcrtc_set_rtc_time(struct atcrtc_dev *rtc, time64_t time)
+{
+	int rem;
+	unsigned int counter;
+	unsigned int day;
+	unsigned int hour;
+	unsigned int min;
+	unsigned int sec;
+
+	day = div_s64_rem(time, 86400, &rem);
+	hour = rem / 3600;
+	rem -= hour * 3600;
+	min = rem / 60;
+	sec = rem - min * 60;
+	counter = ((day & DAY_MSK) << DAY_OFF)
+		  | ((hour & HOUR_MSK) << HOUR_OFF)
+		  | ((min & MIN_MSK) << MIN_OFF)
+		  | ((sec & SEC_MSK) << SEC_OFF);
+
+	regmap_write(rtc->regmap, RTC_CNT, counter);
+}
+
+static int atcrtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
+	time64_t sys_time;
+	int ret;
+
+	sys_time = rtc_tm_to_time64(tm);
+
+	mutex_lock(&rtc->lock);
+
+	ret = atcrtc_check_write_done(rtc);
+	if (ret) {
+		mutex_unlock(&rtc->lock);
+		return ret;
+	}
+	atcrtc_set_rtc_time(rtc, sys_time);
+
+	mutex_unlock(&rtc->lock);
+
+	return 0;
+}
+
+static int atcrtc_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
+{
+	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &wkalrm->time;
+	unsigned int rtc_alarm;
+
+	mutex_lock(&rtc->lock);
+
+	regmap_read(rtc->regmap, RTC_ALM, &rtc_alarm);
+	wkalrm->enabled = regmap_test_bits(rtc->regmap, RTC_CR, ALARM_INT);
+
+	mutex_unlock(&rtc->lock);
+
+	tm->tm_hour = (rtc_alarm >> HOUR_OFF) & HOUR_MSK;
+	tm->tm_min  = (rtc_alarm >> MIN_OFF) & MIN_MSK;
+	tm->tm_sec  = (rtc_alarm >> SEC_OFF) & SEC_MSK;
+
+	return 0;
+}
+
+static int atcrtc_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
+{
+	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &wkalrm->time;
+	unsigned int alm = 0;
+	int err = rtc_valid_tm(tm);
+	int ret;
+
+	if (err < 0) {
+		dev_err(dev, "invalid alarm value\n");
+		return err;
+	}
+
+	mutex_lock(&rtc->lock);
+
+	ret = atcrtc_check_write_done(rtc);
+	if (ret) {
+		mutex_unlock(&rtc->lock);
+		return ret;
+	}
+
+	/* Disable alarm interrupt and clear the alarm flag */
+	regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, 0);
+	rtc->alarm_en = 0;
+
+	/* Set alarm time */
+	alm |= ((tm->tm_sec & SEC_MSK) << SEC_OFF);
+	alm |= ((tm->tm_min & MIN_MSK) << MIN_OFF);
+	alm |= ((tm->tm_hour & HOUR_MSK) << HOUR_OFF);
+	regmap_write(rtc->regmap, RTC_ALM, alm);
+
+	if (wkalrm->enabled) {
+		rtc->alarm_en = 1;
+		ret = atcrtc_check_write_done(rtc);
+		if (ret) {
+			mutex_unlock(&rtc->lock);
+			return ret;
+		}
+
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, ALARM_INT);
+	}
+
+	mutex_unlock(&rtc->lock);
+	return 0;
+}
+
+static int atcrtc_hw_init(struct atcrtc_dev *rtc)
+{
+	unsigned int rtc_id;
+	int ret;
+
+	regmap_read(rtc->regmap, RTC_ID, &rtc_id);
+	if ((rtc_id & ID_MSK) != ATCRTC100ID)
+		return -ENOENT;
+
+	ret = atcrtc_check_write_done(rtc);
+	if (ret)
+		return ret;
+	regmap_update_bits(rtc->regmap, RTC_CR, RTC_EN, RTC_EN);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = atcrtc_read_time,
+	.set_time = atcrtc_set_time,
+	.read_alarm = atcrtc_read_alarm,
+	.set_alarm = atcrtc_set_alarm,
+	.alarm_irq_enable = atcrtc_alarm_irq_enable,
+};
+
+static int atcrtc_probe(struct platform_device *pdev)
+{
+	struct atcrtc_dev *atcrtc_dev;
+	void __iomem *reg_base;
+	int ret = 0;
+
+	atcrtc_dev = devm_kzalloc(&pdev->dev, sizeof(*atcrtc_dev), GFP_KERNEL);
+	if (!atcrtc_dev)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, atcrtc_dev);
+	mutex_init(&atcrtc_dev->lock);
+
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg_base)) {
+		dev_err(&pdev->dev, "couldn't map io space\n");
+		return PTR_ERR(atcrtc_dev->regmap);
+	}
+
+	atcrtc_dev->regmap = devm_regmap_init_mmio(&pdev->dev, reg_base,
+						   &atcrtc_regmap_config);
+	if (IS_ERR(atcrtc_dev->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		return PTR_ERR(atcrtc_dev->regmap);
+	}
+
+	ret = atcrtc_hw_init(atcrtc_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "driver initialize failed\n");
+		return ret;
+	}
+
+	atcrtc_dev->alarm_irq = platform_get_irq(pdev, 1);
+	if (atcrtc_dev->alarm_irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq %d for alarm\n",
+			atcrtc_dev->alarm_irq);
+		return atcrtc_dev->alarm_irq;
+	}
+	atcrtc_dev->time_irq = platform_get_irq(pdev, 0);
+	if (atcrtc_dev->time_irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq %d for RTC\n",
+			atcrtc_dev->time_irq);
+		return atcrtc_dev->time_irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, atcrtc_dev->alarm_irq, atcrtc_alarm,
+			       0, "atcrtc alarm", atcrtc_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request irq %d: %d for alarm\n",
+			atcrtc_dev->alarm_irq, ret);
+		return ret;
+	}
+
+	ret = devm_request_irq(&pdev->dev, atcrtc_dev->time_irq, atcrtc_interrupt,
+			       0, "atcrtc time", atcrtc_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
+			atcrtc_dev->time_irq, ret);
+		return ret;
+	}
+
+	atcrtc_dev->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(atcrtc_dev->rtc_dev)) {
+		dev_err(&pdev->dev, "Could not allocate rtc device\n");
+		return PTR_ERR(atcrtc_dev->rtc_dev);
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "wakeup-source")) {
+		set_bit(RTC_FEATURE_ALARM, atcrtc_dev->rtc_dev->features);
+		atcrtc_alarm_enable(&pdev->dev, true);
+		device_init_wakeup(&pdev->dev, true);
+		ret = dev_pm_set_wake_irq(&pdev->dev, atcrtc_dev->alarm_irq);
+		if (ret)
+			dev_err(&pdev->dev, "failed to set wake IRQ\n");
+	} else {
+		atcrtc_alarm_enable(&pdev->dev, false);
+		clear_bit(RTC_FEATURE_ALARM, atcrtc_dev->rtc_dev->features);
+	}
+
+	atcrtc_dev->rtc_dev->ops = &rtc_ops;
+	/*
+	 * There are 15 bits in the Day field of the Counter register.
+	 * It can count up to 32,767 days, about 89.8 years.
+	 */
+	atcrtc_dev->rtc_dev->range_max = mktime64(2089, 12, 31, 23, 59, 59);
+	atcrtc_dev->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
+
+	INIT_DELAYED_WORK(&atcrtc_dev->rtc_work, atcrtc_alarm_clear);
+	return devm_rtc_register_device(atcrtc_dev->rtc_dev);
+}
+
+static int atcrtc_resume(struct device *dev)
+{
+	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(rtc->alarm_irq);
+
+	return 0;
+}
+
+static int atcrtc_suspend(struct device *dev)
+{
+	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(rtc->alarm_irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(atcrtc_pm_ops, atcrtc_suspend, atcrtc_resume);
+
+static const struct of_device_id atcrtc_dt_match[] = {
+	{ .compatible = "andestech,atcrtc100" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, atcrtc_dt_match);
+
+static struct platform_driver atcrtc_platform_driver = {
+	.driver = {
+		.name = "atcrtc100",
+		.of_match_table = atcrtc_dt_match,
+		.pm = pm_sleep_ptr(&atcrtc_pm_ops),
+	},
+	.probe = atcrtc_probe,
+};
+
+module_platform_driver(atcrtc_platform_driver);
+
+MODULE_AUTHOR("CL Wang <cl634@andestech.com>");
+MODULE_DESCRIPTION("Andes ATCRTC100 driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1



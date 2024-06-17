Return-Path: <linux-rtc+bounces-1337-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F36290A8A4
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 10:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948FE1C2109E
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 08:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2C319048F;
	Mon, 17 Jun 2024 08:38:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1E619048B
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613538; cv=none; b=P7SnYKTvNRJsMxLwvxb3j5M1iflauEx1I7fKSlIraB5yo1VgNEKT1g4PIlV0Iw/VK63nLsIRaaqMZNIIWdOQ4K6NN7FTXJOLoRnG4QszM9SxCUjy+/nWq+kRDICds3FqcO5et52q/TeK0fqc9iFWsFe7OBIx0iDFbRB3Cwi4nIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613538; c=relaxed/simple;
	bh=c8TGeiEgXwCVa7qmx5UuxuGuoFwy3XKx8pFtdTnbDPo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f8YiBE0W3WhMgluCcjO/MGhxOVb1o9X7+58pVM5zs/lLklworMmNAUthwGsJtia227iFTxDB+pj1H9H+4e8k7ipjHKgGwlVWFs4lLeeeZ2F+bTMETk9S6Qf8PGNAhC9vVQ261znuN72SGWKdJ8q0AfulVi0eDNpb/0fl1Fv6V6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 45H8PhUd079769
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 16:25:43 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 45H8PHAC079704;
	Mon, 17 Jun 2024 16:25:17 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 16:25:17 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <krzk@kernel.org>,
        <linux-rtc@vger.kernel.org>
CC: <tim609@andestech.com>
Subject: [PATCH V2 2/2] rtc: atcrtc100: Add andes atcrtc100 RTC driver
Date: Mon, 17 Jun 2024 16:25:07 +0800
Message-ID: <20240617082507.3968910-3-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617082507.3968910-1-cl634@andestech.com>
References: <20240617082507.3968910-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 45H8PhUd079769

The atcrtc100 module includes a real time counter with alarm.
Add a RTC driver for this function.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 drivers/rtc/Kconfig         |  10 +
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-atcrtc100.c | 457 ++++++++++++++++++++++++++++++++++++
 3 files changed, 468 insertions(+)
 create mode 100644 drivers/rtc/rtc-atcrtc100.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..cea1750c368d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1442,6 +1442,16 @@ config RTC_DRV_OMAP
 	  This driver can also be built as a module, if so, module
 	  will be called rtc-omap.
 
+config RTC_DRV_ATCRTC100
+	tristate "Andes Real Time Clock"
+	depends on RISCV
+	help
+	  If you say Y here you will get access to the real time clock
+	  built into your AE350.
+
+	  To compile this driver as a module, choose M here.
+	  The module will be called rtc-atcrtc100.
+
 config RTC_DRV_S3C
 	tristate "Samsung S3C series SoC RTC"
 	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S5PV210 || \
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
index 000000000000..43957906a8ed
--- /dev/null
+++ b/drivers/rtc/rtc-atcrtc100.c
@@ -0,0 +1,457 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for Andes AE350 RTC module.
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
+
+#define RTC_ID		0x00	/* ID and Revision */
+#define ID_OFF		12
+#define ID_MSK		(0xfffff << ID_OFF)
+#define ATCRTC100ID	(0x03011 << ID_OFF)
+#define RTC_RSV		0x4	/* Reserve */
+#define RTC_CNT		0x10	/* Counter */
+#define RTC_ALM		0x14	/* Alarm */
+#define DAY_OFF		17
+#define DAY_MSK		(0x7fff)
+#define HOUR_OFF	12
+#define HOUR_MSK	(0x1f)
+#define MIN_OFF		6
+#define MIN_MSK		(0x3f)
+#define SEC_OFF		0
+#define SEC_MSK		(0x3f)
+#define RTC_SECOND(x)	\
+			((x >> SEC_OFF) & SEC_MSK) /* RTC sec */
+#define RTC_MINUTE(x)		\
+			((x >> MIN_OFF) & MIN_MSK) /* RTC min */
+#define RTC_HOUR(x)		\
+			((x >> HOUR_OFF) & HOUR_MSK) /* RTC hour */
+#define RTC_DAYS(x)		\
+			((x >> DAY_OFF) & DAY_MSK) /* RTC day */
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
+#define RTC_STA		0x1c	/* Status */
+#define WRITE_DONE	(0x1UL << 16)
+#define RTC_TRIM	0x20	/* Digital Trimming */
+
+#define ATCRTC_TIME_TO_SEC(D, H, M, S)	(D * 86400LL + H * 3600 + M * 60 + S)
+
+/*
+ * The maximum day counter available for the ATCRTC100 hardware is 15 bits
+ * long and can count up to 32767 days. This means that the ATCRTC100 hardware
+ * can count up to about 89 years, so we set range_min to 2000 and range_max
+ * to the end of the year 2089.
+ */
+#define ATCRTC_RTC_TIMESTAMP_END_2089	3786911999LL  /* 2089-12-31 23:59:59 */
+#define ATCRTC_RTC_TIMESTAMP_BEGIN_2000 RTC_TIMESTAMP_BEGIN_2000
+
+struct atc_rtc {
+	struct rtc_device	*rtc_dev;
+	struct regmap		*regmap;
+	unsigned int		alarm_irq;
+	unsigned int		time_irq;
+	spinlock_t		lock; /* Protects this structure */
+};
+
+/*
+ * WARNING: This variable is only intended to pass the LTP test. The Andes
+ * internal implementation of the RTC on FPGA cannot count more than 32 days
+ * because the day counter is 5 bits long.
+ * The real RTC hardware should support a sufficiently large counter, and this
+ * variable is automatically set to 0 if the day counter is sufficient to
+ * represent the date.
+ */
+time64_t total_offset_sec;
+
+static const struct regmap_config atc_rtc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = RTC_TRIM,
+	.cache_type = REGCACHE_NONE,
+};
+
+static irqreturn_t rtc_interrupt(int irq, void *dev_id)
+{
+	struct atc_rtc *rtc = dev_id;
+
+	if (regmap_test_bits(rtc->regmap, RTC_STA, SEC_INT)) {
+		regmap_write_bits(rtc->regmap, RTC_STA, SEC_INT, SEC_INT);
+		rtc_update_irq(rtc->rtc_dev, 1, RTC_UF | RTC_IRQF);
+		return IRQ_HANDLED;
+	}
+	return IRQ_NONE;
+}
+
+static irqreturn_t rtc_alarm(int irq, void *dev_id)
+{
+	struct atc_rtc *rtc = dev_id;
+
+	if (regmap_test_bits(rtc->regmap, RTC_STA, ALARM_INT)) {
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, 0);
+		regmap_write_bits(rtc->regmap, RTC_STA, ALARM_INT, ALARM_INT);
+		rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
+		return IRQ_HANDLED;
+	}
+	return IRQ_NONE;
+}
+
+static int atc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct atc_rtc *rtc = dev_get_drvdata(dev);
+
+	spin_lock_irq(&rtc->lock);
+	if (enabled)
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, ALARM_INT);
+	else
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, 0);
+
+	spin_unlock_irq(&rtc->lock);
+	return 0;
+}
+
+static int atc_alarm_wakeup_enable(struct device *dev, unsigned int enabled)
+{
+	struct atc_rtc *rtc = dev_get_drvdata(dev);
+
+	spin_lock_irq(&rtc->lock);
+	if (enabled)
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_WAKEUP, ALARM_WAKEUP);
+	else
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_WAKEUP, 0);
+	spin_unlock_irq(&rtc->lock);
+	return 0;
+}
+
+
+/**
+ * This function reads the time from the RTC hardware
+ * @rtc: The structure of the atc_rtc.
+ *
+ * This function is called in an atomic operation, so don't add code
+ * to this function that will cause the process to sleep.
+ */
+static time64_t atc_rtc_read_rtc_time(struct atc_rtc *rtc)
+{
+	unsigned int rtc_cnt;
+	time64_t time;
+
+	/* Check the progress of updating the RTC registers. */
+	while (!regmap_test_bits(rtc->regmap, RTC_STA, WRITE_DONE))
+		continue;
+
+	regmap_read(rtc->regmap, RTC_CNT, &rtc_cnt);
+	time = ATCRTC_TIME_TO_SEC(RTC_DAYS(rtc_cnt), RTC_HOUR(rtc_cnt),
+				  RTC_MINUTE(rtc_cnt), RTC_SECOND(rtc_cnt));
+
+	return time;
+}
+
+static int atc_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct atc_rtc *rtc = dev_get_drvdata(dev);
+	time64_t time;
+
+	spin_lock_irq(&rtc->lock);
+	time = atc_rtc_read_rtc_time(rtc) + total_offset_sec;
+	spin_unlock_irq(&rtc->lock);
+
+	rtc_time64_to_tm(time, tm);
+	if (rtc_valid_tm(tm) < 0) {
+		dev_err(dev, "invalid date\n");
+		rtc_time64_to_tm(0, tm);
+	}
+	return 0;
+}
+
+/**
+ * This function write the time to the RTC hardware
+ * @rtc: The structure of the atc_rtc.
+ * @time: The time to set to the RTC
+ *
+ * This function is called in an atomic operation, so don't add code
+ * to this function that will cause the process to sleep.
+ */
+static void atc_rtc_set_rtc_time(struct atc_rtc *rtc, time64_t time)
+{
+	time64_t time_rem;
+	s32 rem;
+	u32 counter;
+
+	counter = ((div_s64_rem(time, 86400, &rem) & DAY_MSK)
+		   << DAY_OFF);
+	time_rem = rem;
+	counter |= ((div_s64_rem(time_rem, 3600, &rem) & HOUR_MSK)
+		    << HOUR_OFF);
+	time_rem = rem;
+	counter |= ((div_s64_rem(time_rem, 60, &rem) & MIN_MSK)
+		    << MIN_OFF);
+	counter |= ((rem & SEC_MSK) << SEC_OFF);
+
+	regmap_write(rtc->regmap, RTC_CNT, counter);
+}
+
+static int atc_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct atc_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time tm_offset;
+	time64_t rtc_time;
+	time64_t sys_time;
+
+	sys_time = rtc_tm_to_time64(tm);
+
+	spin_lock_irq(&rtc->lock);
+	atc_rtc_set_rtc_time(rtc, sys_time);
+
+	/* Ensure the size of day counter is sufficient to represent the date. */
+	rtc_time = atc_rtc_read_rtc_time(rtc);
+
+	if (rtc_time < sys_time) {
+		/*
+		 * The day counter is not enough to represent the date, so
+		 * we need to take an offset to improve the RTC hardware's ability
+		 * to avoid getting the wrong date.
+		 */
+		dev_err(dev, "The size of day counter is insufficient for date representation, and the date may be incorrect when the system is restarted.\n");
+		memcpy(&tm_offset, tm, sizeof(struct rtc_time));
+
+		rtc_time = ATCRTC_TIME_TO_SEC(0, tm_offset.tm_hour, tm_offset.tm_min,
+					      tm_offset.tm_sec);
+		/*
+		 * Only the date (years, months, and days) is stored in the
+		 * total_offset_sec, and the time (hours, minutes, and seconds)
+		 * is stored directly in the hardware of the RTC.
+		 */
+		atc_rtc_set_rtc_time(rtc, rtc_time);
+
+		tm_offset.tm_hour = 0;
+		tm_offset.tm_min = 0;
+		tm_offset.tm_sec = 0;
+		total_offset_sec = rtc_tm_to_time64(&tm_offset);
+	} else {
+		total_offset_sec = 0;
+	}
+
+	spin_unlock_irq(&rtc->lock);
+
+	return 0;
+}
+
+static int atc_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
+{
+	struct atc_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &wkalrm->time;
+	unsigned int rtc_alarm;
+
+	spin_lock_irq(&rtc->lock);
+	regmap_read(rtc->regmap, RTC_ALM, &rtc_alarm);
+	wkalrm->enabled = regmap_test_bits(rtc->regmap, RTC_CR, ALARM_INT);
+	spin_unlock_irq(&rtc->lock);
+
+	tm->tm_sec	= (rtc_alarm >> SEC_OFF) & SEC_MSK;
+	tm->tm_min	= (rtc_alarm >> MIN_OFF) & MIN_MSK;
+	tm->tm_hour	= (rtc_alarm >> HOUR_OFF) & HOUR_MSK;
+
+	return 0;
+}
+
+static int atc_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
+{
+	u32 alm = 0;
+	struct atc_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &wkalrm->time;
+	int err = rtc_valid_tm(tm);
+
+	if (err < 0) {
+		dev_err(dev, "invalid alarm value\n");
+		return err;
+	}
+
+	/* Disable alarm interrupt and clear the alarm flag */
+	regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, 0);
+
+	/* Set alarm time */
+	alm |= ((tm->tm_sec & SEC_MSK) << SEC_OFF);
+	alm |= ((tm->tm_min & MIN_MSK) << MIN_OFF);
+	alm |= ((tm->tm_hour & HOUR_MSK) << HOUR_OFF);
+
+	spin_lock_irq(&rtc->lock);
+	regmap_write(rtc->regmap, RTC_ALM, alm);
+
+	while (!regmap_test_bits(rtc->regmap, RTC_STA, WRITE_DONE))
+		continue;
+
+	if (wkalrm->enabled)
+		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, ALARM_INT);
+
+	spin_unlock_irq(&rtc->lock);
+	return 0;
+}
+
+static int atc_rtc_hw_init(struct atc_rtc *rtc)
+{
+	unsigned int rtc_id;
+
+	regmap_read(rtc->regmap, RTC_ID, &rtc_id);
+	if ((rtc_id & ID_MSK) != ATCRTC100ID)
+		return -ENOENT;
+
+	regmap_update_bits(rtc->regmap, RTC_CR, RTC_EN, RTC_EN);
+
+	return 0;
+}
+
+static const  struct rtc_class_ops rtc_ops = {
+	.alarm_irq_enable = atc_alarm_irq_enable,
+	.read_time	= atc_rtc_read_time,
+	.set_time	= atc_rtc_set_time,
+	.read_alarm	= atc_rtc_read_alarm,
+	.set_alarm	= atc_rtc_set_alarm,
+};
+
+static int atc_rtc_probe(struct platform_device *pdev)
+{
+	struct atc_rtc *atc_rtc;
+	void __iomem *reg_base;
+	int ret = 0;
+
+	atc_rtc = devm_kzalloc(&pdev->dev, sizeof(*atc_rtc), GFP_KERNEL);
+	if (!atc_rtc)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, atc_rtc);
+	spin_lock_init(&atc_rtc->lock);
+
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg_base)) {
+		dev_err(&pdev->dev, "couldn't map io space\n");
+		return PTR_ERR(atc_rtc->regmap);
+	}
+
+	atc_rtc->regmap = devm_regmap_init_mmio(&pdev->dev, reg_base,
+						&atc_rtc_regmap_config);
+	if (IS_ERR(atc_rtc->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		ret = PTR_ERR(atc_rtc->regmap);
+	}
+
+	ret = atc_rtc_hw_init(atc_rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "atc_rtc HW initialize failed\n");
+		return ret;
+	}
+
+	atc_rtc->alarm_irq = platform_get_irq(pdev, 1);
+	if (atc_rtc->alarm_irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq %d for alarm\n",
+			atc_rtc->alarm_irq);
+	}
+	atc_rtc->time_irq = platform_get_irq(pdev, 0);
+	if (atc_rtc->time_irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq %d for RTC\n",
+			atc_rtc->time_irq);
+	}
+
+	ret = devm_request_irq(&pdev->dev, atc_rtc->alarm_irq, rtc_alarm,
+			       0, "rtc alarm", atc_rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request irq %d: %d for alarm\n",
+			atc_rtc->alarm_irq, ret);
+		return ret;
+	}
+
+	ret = devm_request_irq(&pdev->dev, atc_rtc->time_irq, rtc_interrupt,
+			       0, "rtc time", atc_rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
+			atc_rtc->time_irq, ret);
+		return ret;
+	}
+
+	atc_rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(atc_rtc->rtc_dev)) {
+		dev_err(&pdev->dev, "Could not allocate rtc device\n");
+		return PTR_ERR(atc_rtc->rtc_dev);
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "wakeup-source")) {
+		device_init_wakeup(&pdev->dev, true);
+		ret = dev_pm_set_wake_irq(&pdev->dev, atc_rtc->alarm_irq);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to enable irq wake\n");
+			device_init_wakeup(&pdev->dev, false);
+			atc_alarm_wakeup_enable(&pdev->dev, false);
+			clear_bit(RTC_FEATURE_ALARM, atc_rtc->rtc_dev->features);
+		} else {
+			atc_alarm_wakeup_enable(&pdev->dev, true);
+			set_bit(RTC_FEATURE_ALARM, atc_rtc->rtc_dev->features);
+		}
+	} else {
+		atc_alarm_wakeup_enable(&pdev->dev, false);
+		clear_bit(RTC_FEATURE_ALARM, atc_rtc->rtc_dev->features);
+	}
+	atc_rtc->rtc_dev->ops = &rtc_ops;
+	atc_rtc->rtc_dev->range_min = ATCRTC_RTC_TIMESTAMP_BEGIN_2000;
+	atc_rtc->rtc_dev->range_max = ATCRTC_RTC_TIMESTAMP_END_2089;
+
+	return devm_rtc_register_device(atc_rtc->rtc_dev);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int atc_rtc_resume(struct device *dev)
+{
+	struct atc_rtc *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(rtc->alarm_irq);
+
+	return 0;
+}
+
+static int atc_rtc_suspend(struct device *dev)
+{
+	struct atc_rtc *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(rtc->alarm_irq);
+
+	return 0;
+}
+#endif
+static SIMPLE_DEV_PM_OPS(atc_rtc_pm_ops, atc_rtc_suspend, atc_rtc_resume);
+
+static const struct of_device_id atc_rtc_dt_match[] = {
+	{ .compatible = "andestech,atcrtc100" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, atc_rtc_dt_match);
+
+static struct platform_driver atc_rtc_platform_driver = {
+	.driver		= {
+		.name	= "atcrtc100",
+		.of_match_table	= of_match_ptr(atc_rtc_dt_match),
+		.pm = &atc_rtc_pm_ops,
+	},
+	.probe		= atc_rtc_probe,
+};
+
+module_platform_driver(atc_rtc_platform_driver);
+
+MODULE_AUTHOR("CL Wang <cl634@andestech.com>");
+MODULE_DESCRIPTION("Andes ATCRTC100 driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1



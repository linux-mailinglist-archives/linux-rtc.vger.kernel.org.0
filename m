Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 448775C7BA
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2019 05:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfGBDWE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Jul 2019 23:22:04 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:49674 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727095AbfGBDWD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Jul 2019 23:22:03 -0400
X-UUID: 2741074be0394d5a8e2fd74e2d12d483-20190702
X-UUID: 2741074be0394d5a8e2fd74e2d12d483-20190702
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 31873610; Tue, 02 Jul 2019 11:21:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 2 Jul 2019 11:21:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 2 Jul 2019 11:21:45 +0800
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH 2/3] rtc: Add support for the MediaTek MT2712 RTC
Date:   Tue, 2 Jul 2019 11:21:19 +0800
Message-ID: <20190702032120.16539-3-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190702032120.16539-1-ran.bi@mediatek.com>
References: <20190702032120.16539-1-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This add support for the MediaTek MT2712 RTC. It was SoC based RTC, but
had different architecture compared with MT7622 RTC.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 drivers/rtc/Kconfig      |  10 +
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-mt2712.c | 495 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 506 insertions(+)
 create mode 100644 drivers/rtc/rtc-mt2712.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 7b8e156dbf38..87c601dba673 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1762,6 +1762,16 @@ config RTC_DRV_MOXART
 	   This driver can also be built as a module. If so, the module
 	   will be called rtc-moxart
 
+config RTC_DRV_MT2712
+	tristate "MediaTek MT2712 SoC based RTC"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  This enables support for the real time clock built in the MediaTek
+	  SoCs for MT2712.
+
+	  This drive can also be built as a module. If so, the module
+	  will be called rtc-mt2712.
+
 config RTC_DRV_MT6397
 	tristate "MediaTek PMIC based RTC"
 	depends on MFD_MT6397 || (COMPILE_TEST && IRQ_DOMAIN)
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 9d997faa2c26..1ef202af9033 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -107,6 +107,7 @@ obj-$(CONFIG_RTC_DRV_MESON)	+= rtc-meson.o
 obj-$(CONFIG_RTC_DRV_MOXART)	+= rtc-moxart.o
 obj-$(CONFIG_RTC_DRV_MPC5121)	+= rtc-mpc5121.o
 obj-$(CONFIG_RTC_DRV_MSM6242)	+= rtc-msm6242.o
+obj-$(CONFIG_RTC_DRV_MT2712)	+= rtc-mt2712.o
 obj-$(CONFIG_RTC_DRV_MT6397)	+= rtc-mt6397.o
 obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
 obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
new file mode 100644
index 000000000000..f98f0ab114c5
--- /dev/null
+++ b/drivers/rtc/rtc-mt2712.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Ran Bi <ran.bi@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define MTK_RTC_DEV		KBUILD_MODNAME
+
+#define RTC_BBPU		0x0000
+#define RTC_BBPU_CLRPKY		(1U << 4)
+#define RTC_BBPU_RELOAD		(1U << 5)
+#define RTC_BBPU_CBUSY		(1U << 6)
+#define RTC_BBPU_KEY		(0x43 << 8)
+
+#define RTC_IRQ_STA		0x0004
+#define RTC_IRQ_STA_AL		(1U << 0)
+#define RTC_IRQ_STA_TC		(1U << 1)
+
+#define RTC_IRQ_EN		0x0008
+#define RTC_IRQ_EN_AL		(1U << 0)
+#define RTC_IRQ_EN_TC		(1U << 1)
+#define RTC_IRQ_EN_ONESHOT	(1U << 2)
+#define RTC_IRQ_EN_ONESHOT_AL	(RTC_IRQ_EN_ONESHOT | RTC_IRQ_EN_AL)
+
+#define RTC_CII_EN		0x000c
+
+#define RTC_AL_MASK		0x0010
+#define RTC_AL_MASK_DOW		(1U << 4)
+
+#define RTC_TC_SEC		0x0014
+#define RTC_TC_MIN		0x0018
+#define RTC_TC_HOU		0x001c
+#define RTC_TC_DOM		0x0020
+#define RTC_TC_DOW		0x0024
+#define RTC_TC_MTH		0x0028
+#define RTC_TC_YEA		0x002c
+
+#define RTC_AL_SEC		0x0030
+#define RTC_AL_MIN		0x0034
+#define RTC_AL_HOU		0x0038
+#define RTC_AL_DOM		0x003c
+#define RTC_AL_DOW		0x0040
+#define RTC_AL_MTH		0x0044
+#define RTC_AL_YEA		0x0048
+
+#define RTC_SEC_MASK		0x003f
+#define RTC_MIN_MASK		0x003f
+#define RTC_HOU_MASK		0x001f
+#define RTC_DOM_MASK		0x001f
+#define RTC_DOW_MASK		0x0007
+#define RTC_MTH_MASK		0x000f
+#define RTC_YEA_MASK		0x007f
+
+#define RTC_POWERKEY1		0x004c
+#define RTC_POWERKEY2		0x0050
+#define RTC_POWERKEY1_KEY	0xa357
+#define RTC_POWERKEY2_KEY	0x67d2
+
+#define RTC_CON0		0x005c
+#define RTC_CON1		0x0060
+
+#define RTC_PROT		0x0070
+#define RTC_PROT_UNLOCK1	0x9136
+#define RTC_PROT_UNLOCK2	0x586a
+
+#define RTC_WRTGR		0x0078
+
+/* we map HW YEAR 0 to 1968 not 1970 because 2000 is the leap year */
+#define RTC_MIN_YEAR		1968
+#define RTC_BASE_YEAR		1900
+#define RTC_MIN_YEAR_OFFSET	(RTC_MIN_YEAR - RTC_BASE_YEAR)
+
+#define RTC_DEFAULT_YEA		2010
+#define RTC_DEFAULT_MTH		1
+#define RTC_DEFAULT_DOM		1
+
+struct mt2712_rtc {
+	struct device		*dev;
+	struct rtc_device	*rtc_dev;
+	void __iomem		*base;
+	struct mutex		lock;
+	int			irq;
+	u8			irq_wake_enabled;
+};
+
+static inline u32 rtc_readl(struct mt2712_rtc *rtc, u32 reg)
+{
+	return readl(rtc->base + reg);
+}
+
+static inline void rtc_writel(struct mt2712_rtc *rtc, u32 reg, u32 val)
+{
+	writel(val, rtc->base + reg);
+}
+
+static void rtc_write_trigger(struct mt2712_rtc *rtc)
+{
+	unsigned long timeout = jiffies + HZ/10;
+
+	rtc_writel(rtc, RTC_WRTGR, 1);
+	while (1) {
+		if (!(rtc_readl(rtc, RTC_BBPU) & RTC_BBPU_CBUSY))
+			break;
+
+		if (time_after(jiffies, timeout)) {
+			dev_err(rtc->dev, "%s time out!\n", __func__);
+			break;
+		}
+		cpu_relax();
+	}
+}
+
+static void rtc_writeif_unlock(struct mt2712_rtc *rtc)
+{
+	rtc_writel(rtc, RTC_PROT, RTC_PROT_UNLOCK1);
+	rtc_write_trigger(rtc);
+	rtc_writel(rtc, RTC_PROT, RTC_PROT_UNLOCK2);
+	rtc_write_trigger(rtc);
+}
+
+static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
+{
+	struct mt2712_rtc *rtc = data;
+	u16 irqsta, irqen;
+
+	irqsta = rtc_readl(rtc, RTC_IRQ_STA);
+	if (irqsta & RTC_IRQ_STA_AL) {
+		rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
+		irqen = irqsta & ~RTC_IRQ_EN_AL;
+
+		mutex_lock(&rtc->lock);
+		rtc_writel(rtc, RTC_IRQ_EN, irqen);
+		rtc_write_trigger(rtc);
+		mutex_unlock(&rtc->lock);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static void __mtk_rtc_read_time(struct mt2712_rtc *rtc,
+				struct rtc_time *tm, int *sec)
+{
+	mutex_lock(&rtc->lock);
+	tm->tm_sec  = rtc_readl(rtc, RTC_TC_SEC) & RTC_SEC_MASK;
+	tm->tm_min  = rtc_readl(rtc, RTC_TC_MIN) & RTC_MIN_MASK;
+	tm->tm_hour = rtc_readl(rtc, RTC_TC_HOU) & RTC_HOU_MASK;
+	tm->tm_mday = rtc_readl(rtc, RTC_TC_DOM) & RTC_DOM_MASK;
+	tm->tm_mon  = rtc_readl(rtc, RTC_TC_MTH) & RTC_MTH_MASK;
+	tm->tm_year = rtc_readl(rtc, RTC_TC_YEA) & RTC_YEA_MASK;
+
+	*sec = rtc_readl(rtc, RTC_TC_SEC) & RTC_SEC_MASK;
+	mutex_unlock(&rtc->lock);
+}
+
+static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+	time64_t time;
+	int days, sec;
+
+	do {
+		__mtk_rtc_read_time(rtc, tm, &sec);
+	} while (sec < tm->tm_sec);	/* SEC has carried */
+
+	/* HW register use 7 bits to store year data, minus
+	 * RTC_MIN_YEAR_OFFSET brfore write year data to register, and plus
+	 * RTC_MIN_YEAR_OFFSET back after read year from register
+	 */
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
+
+	/* HW register start mon from one, but tm_mon start from zero. */
+	tm->tm_mon--;
+
+	/* rtc_tm_to_time64 convert Gregorian date to seconds since
+	 * 01-01-1970 00:00:00, and this date is Thursday
+	 */
+	time = rtc_tm_to_time64(tm);
+	days = div_s64(time, 86400);
+	tm->tm_wday = (days + 4) % 7;
+
+	return 0;
+}
+
+static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+
+	mutex_lock(&rtc->lock);
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
+	tm->tm_mon++;
+
+	rtc_writel(rtc, RTC_TC_SEC, tm->tm_sec  & RTC_SEC_MASK);
+	rtc_writel(rtc, RTC_TC_MIN, tm->tm_min  & RTC_MIN_MASK);
+	rtc_writel(rtc, RTC_TC_HOU, tm->tm_hour & RTC_HOU_MASK);
+	rtc_writel(rtc, RTC_TC_DOM, tm->tm_mday & RTC_DOM_MASK);
+	rtc_writel(rtc, RTC_TC_MTH, tm->tm_mon  & RTC_MTH_MASK);
+	rtc_writel(rtc, RTC_TC_YEA, tm->tm_year & RTC_YEA_MASK);
+
+	rtc_write_trigger(rtc);
+	mutex_unlock(&rtc->lock);
+
+	return 0;
+}
+
+static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alm->time;
+	u16 irqen;
+
+	mutex_lock(&rtc->lock);
+	irqen = rtc_readl(rtc, RTC_IRQ_EN);
+	alm->enabled = !!(irqen & RTC_IRQ_EN_AL);
+
+	tm->tm_sec  = rtc_readl(rtc, RTC_AL_SEC) & RTC_SEC_MASK;
+	tm->tm_min  = rtc_readl(rtc, RTC_AL_MIN) & RTC_MIN_MASK;
+	tm->tm_hour = rtc_readl(rtc, RTC_AL_HOU) & RTC_HOU_MASK;
+	tm->tm_mday = rtc_readl(rtc, RTC_AL_DOM) & RTC_DOM_MASK;
+	tm->tm_mon  = rtc_readl(rtc, RTC_AL_MTH) & RTC_MTH_MASK;
+	tm->tm_year = rtc_readl(rtc, RTC_AL_YEA) & RTC_YEA_MASK;
+
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
+	tm->tm_mon--;
+	mutex_unlock(&rtc->lock);
+
+	return 0;
+}
+
+static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alm->time;
+	u16 irqen;
+
+	dev_info(rtc->dev, "set al time = %04d-%02d-%02d %02d:%02d:%02d (%d)\n",
+		 tm->tm_year + RTC_BASE_YEAR, tm->tm_mon + 1, tm->tm_mday,
+		 tm->tm_hour, tm->tm_min, tm->tm_sec, alm->enabled);
+
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
+	tm->tm_mon++;
+
+	mutex_lock(&rtc->lock);
+	rtc_writel(rtc, RTC_AL_SEC,
+		   (rtc_readl(rtc, RTC_AL_SEC) & ~(RTC_SEC_MASK)) |
+		    (tm->tm_sec  & RTC_SEC_MASK));
+	rtc_writel(rtc, RTC_AL_MIN,
+		   (rtc_readl(rtc, RTC_AL_MIN) & ~(RTC_MIN_MASK)) |
+		    (tm->tm_min  & RTC_MIN_MASK));
+	rtc_writel(rtc, RTC_AL_HOU,
+		   (rtc_readl(rtc, RTC_AL_HOU) & ~(RTC_HOU_MASK)) |
+		    (tm->tm_hour & RTC_HOU_MASK));
+	rtc_writel(rtc, RTC_AL_DOM,
+		   (rtc_readl(rtc, RTC_AL_DOM) & ~(RTC_DOM_MASK)) |
+		    (tm->tm_mday & RTC_DOM_MASK));
+	rtc_writel(rtc, RTC_AL_MTH,
+		   (rtc_readl(rtc, RTC_AL_MTH) & ~(RTC_MTH_MASK)) |
+		    (tm->tm_mon  & RTC_MTH_MASK));
+	rtc_writel(rtc, RTC_AL_YEA,
+		   (rtc_readl(rtc, RTC_AL_YEA) & ~(RTC_YEA_MASK)) |
+		    (tm->tm_year & RTC_YEA_MASK));
+
+	rtc_writel(rtc, RTC_AL_MASK, RTC_AL_MASK_DOW);	/* mask DOW */
+
+	if (alm->enabled) {
+		irqen = rtc_readl(rtc, RTC_IRQ_EN) | RTC_IRQ_EN_ONESHOT_AL;
+		rtc_writel(rtc, RTC_IRQ_EN, irqen);
+	} else {
+		irqen = rtc_readl(rtc, RTC_IRQ_EN) & ~(RTC_IRQ_EN_ONESHOT_AL);
+		rtc_writel(rtc, RTC_IRQ_EN, irqen);
+	}
+	rtc_write_trigger(rtc);
+	mutex_unlock(&rtc->lock);
+
+	return 0;
+}
+
+static bool valid_rtc_time(struct mt2712_rtc *rtc)
+{
+	struct rtc_time tm;
+	struct rtc_wkalrm alm;
+
+	mtk_rtc_read_time(rtc->dev, &tm);
+	if (rtc_valid_tm(&tm))
+		return false;
+
+	mtk_rtc_read_alarm(rtc->dev, &alm);
+	if (rtc_valid_tm(&alm.time))
+		return false;
+
+	return true;
+}
+
+static void reset_rtc_time(struct mt2712_rtc *rtc)
+{
+	rtc_writel(rtc, RTC_TC_YEA, RTC_DEFAULT_YEA - RTC_MIN_YEAR);
+	rtc_writel(rtc, RTC_TC_MTH, RTC_DEFAULT_MTH);
+	rtc_writel(rtc, RTC_TC_DOM, RTC_DEFAULT_DOM);
+	rtc_writel(rtc, RTC_TC_DOW, 1);
+	rtc_writel(rtc, RTC_TC_HOU, 0);
+	rtc_writel(rtc, RTC_TC_MIN, 0);
+	rtc_writel(rtc, RTC_TC_SEC, 0);
+
+	rtc_writel(rtc, RTC_AL_YEA, 1970 - RTC_MIN_YEAR);
+	rtc_writel(rtc, RTC_AL_MTH, 1);
+	rtc_writel(rtc, RTC_AL_DOM, 1);
+	rtc_writel(rtc, RTC_AL_DOW, 1);
+	rtc_writel(rtc, RTC_AL_HOU, 0);
+	rtc_writel(rtc, RTC_AL_MIN, 0);
+	rtc_writel(rtc, RTC_AL_SEC, 0);
+
+	rtc_write_trigger(rtc);
+}
+
+/* Init RTC register */
+static void rtc_hw_init(struct mt2712_rtc *rtc)
+{
+	u32 p1, p2;
+
+	rtc_writel(rtc, RTC_BBPU, RTC_BBPU_KEY | RTC_BBPU_RELOAD);
+
+	rtc_writel(rtc, RTC_IRQ_EN,  0);
+	rtc_writel(rtc, RTC_IRQ_STA, 0);
+	rtc_writel(rtc, RTC_CII_EN,  0);
+	rtc_writel(rtc, RTC_AL_MASK, 0);
+	/* necessary before set RTC_POWERKEY */
+	rtc_writel(rtc, RTC_CON0, 0x4848);
+	rtc_writel(rtc, RTC_CON1, 0x0048);
+
+	rtc_write_trigger(rtc);
+
+	rtc_readl(rtc, RTC_IRQ_STA);	/* read clear */
+
+	p1 = rtc_readl(rtc, RTC_POWERKEY1);
+	p2 = rtc_readl(rtc, RTC_POWERKEY2);
+	dev_info(rtc->dev, "%s rtc p1 is %x, p2 is %x!\n", __func__, p1, p2);
+
+	 /* RTC need POWERKEY1/2 match, then goto normal work mode */
+	rtc_writel(rtc, RTC_POWERKEY1, RTC_POWERKEY1_KEY);
+	rtc_writel(rtc, RTC_POWERKEY2, RTC_POWERKEY2_KEY);
+	rtc_write_trigger(rtc);
+
+	rtc_writeif_unlock(rtc);
+
+	/*
+	 * register status was not correct,
+	 * need set time and alarm to default
+	 */
+	if (p1 != RTC_POWERKEY1_KEY || p2 != RTC_POWERKEY2_KEY
+	    || !valid_rtc_time(rtc)) {
+		reset_rtc_time(rtc);
+		dev_info(rtc->dev, "first boot init!\n");
+	}
+}
+
+static const struct rtc_class_ops mtk_rtc_ops = {
+	.read_time	= mtk_rtc_read_time,
+	.set_time	= mtk_rtc_set_time,
+	.read_alarm	= mtk_rtc_read_alarm,
+	.set_alarm	= mtk_rtc_set_alarm,
+};
+
+static int mtk_rtc_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct mt2712_rtc *rtc;
+	int ret;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt2712_rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	rtc->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(rtc->base))
+		return PTR_ERR(rtc->base);
+
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0) {
+		dev_err(&pdev->dev, "No IRQ resource\n");
+		return rtc->irq;
+	}
+
+	mutex_init(&rtc->lock);
+	rtc->dev = &pdev->dev;
+	platform_set_drvdata(pdev, rtc);
+
+	rtc->rtc_dev = devm_rtc_allocate_device(rtc->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	ret = request_threaded_irq(rtc->irq, NULL,
+				   rtc_irq_handler_thread,
+				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+				   dev_name(rtc->dev), rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
+			rtc->irq, ret);
+		return ret;
+	}
+
+	/* rtc hw init */
+	rtc_hw_init(rtc);
+
+	device_init_wakeup(&pdev->dev, true);
+
+	rtc->rtc_dev->ops = &mtk_rtc_ops;
+
+	ret = rtc_register_device(rtc->rtc_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "register rtc device failed\n");
+		goto out_free_irq;
+	}
+
+	return 0;
+
+out_free_irq:
+	free_irq(rtc->irq, rtc);
+	return ret;
+}
+
+static int mtk_rtc_remove(struct platform_device *pdev)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(&pdev->dev);
+
+	free_irq(rtc->irq, rtc);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int mt2712_rtc_suspend(struct device *dev)
+{
+	int wake_status = 0;
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev)) {
+		wake_status = enable_irq_wake(rtc->irq);
+		if (!wake_status)
+			rtc->irq_wake_enabled = true;
+	}
+
+	return 0;
+}
+
+static int mt2712_rtc_resume(struct device *dev)
+{
+	int wake_status = 0;
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev) && rtc->irq_wake_enabled) {
+		wake_status = disable_irq_wake(rtc->irq);
+		if (!wake_status)
+			rtc->irq_wake_enabled = false;
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
+			 mt2712_rtc_resume);
+#endif
+
+static const struct of_device_id mt2712_rtc_of_match[] = {
+	{ .compatible = "mediatek,mt2712-rtc", },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, mt2712_rtc_of_match)
+
+static struct platform_driver mtk_rtc_driver = {
+	.driver = {
+		.name = MTK_RTC_DEV,
+		.of_match_table = mt2712_rtc_of_match,
+		.pm = &mt2712_pm_ops,
+	},
+	.probe  = mtk_rtc_probe,
+	.remove = mtk_rtc_remove,
+};
+
+module_platform_driver(mtk_rtc_driver);
+
+MODULE_DESCRIPTION("MediaTek MT2712 SoC based RTC Driver");
+MODULE_AUTHOR("Ran Bi <ran.bi@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
2.18.0


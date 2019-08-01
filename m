Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C335A7D9DA
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Aug 2019 13:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbfHALBs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 1 Aug 2019 07:01:48 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:27357 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727960AbfHALBq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 1 Aug 2019 07:01:46 -0400
X-UUID: b1d4278114784347bc58ae508e5d2218-20190801
X-UUID: b1d4278114784347bc58ae508e5d2218-20190801
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 28907587; Thu, 01 Aug 2019 19:01:35 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 1 Aug 2019 19:01:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 1 Aug 2019 19:01:36 +0800
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
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
Subject: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
Date:   Thu, 1 Aug 2019 19:01:20 +0800
Message-ID: <20190801110122.26834-3-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190801110122.26834-1-ran.bi@mediatek.com>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 48F9A74FC4C5FB3BE1FFBF5800FDA7EE3E52C3A4C46A5B57C1146B7F0245C7C22000:8
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
 drivers/rtc/rtc-mt2712.c | 444 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 455 insertions(+)
 create mode 100644 drivers/rtc/rtc-mt2712.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..977d0f480dc7 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1772,6 +1772,16 @@ config RTC_DRV_MOXART
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
index 6b09c21dc1b6..7c6cf70af281 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_RTC_DRV_MESON)	+= rtc-meson.o
 obj-$(CONFIG_RTC_DRV_MOXART)	+= rtc-moxart.o
 obj-$(CONFIG_RTC_DRV_MPC5121)	+= rtc-mpc5121.o
 obj-$(CONFIG_RTC_DRV_MSM6242)	+= rtc-msm6242.o
+obj-$(CONFIG_RTC_DRV_MT2712)	+= rtc-mt2712.o
 obj-$(CONFIG_RTC_DRV_MT6397)	+= rtc-mt6397.o
 obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
 obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
new file mode 100644
index 000000000000..1eb71ca64c2c
--- /dev/null
+++ b/drivers/rtc/rtc-mt2712.c
@@ -0,0 +1,444 @@
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
+#define MT2712_BBPU		0x0000
+#define MT2712_BBPU_CLRPKY	BIT(4)
+#define MT2712_BBPU_RELOAD	BIT(5)
+#define MT2712_BBPU_CBUSY	BIT(6)
+#define MT2712_BBPU_KEY		(0x43 << 8)
+
+#define MT2712_IRQ_STA		0x0004
+#define MT2712_IRQ_STA_AL	BIT(0)
+#define MT2712_IRQ_STA_TC	BIT(1)
+
+#define MT2712_IRQ_EN		0x0008
+#define MT2712_IRQ_EN_AL	BIT(0)
+#define MT2712_IRQ_EN_TC	BIT(1)
+#define MT2712_IRQ_EN_ONESHOT	BIT(2)
+#define MT2712_IRQ_EN_ONESHOT_AL \
+				(MT2712_IRQ_EN_ONESHOT | MT2712_IRQ_EN_AL)
+
+#define MT2712_CII_EN		0x000c
+
+#define MT2712_AL_MASK		0x0010
+#define MT2712_AL_MASK_DOW	BIT(4)
+
+#define MT2712_TC_SEC		0x0014
+#define MT2712_TC_MIN		0x0018
+#define MT2712_TC_HOU		0x001c
+#define MT2712_TC_DOM		0x0020
+#define MT2712_TC_DOW		0x0024
+#define MT2712_TC_MTH		0x0028
+#define MT2712_TC_YEA		0x002c
+
+#define MT2712_AL_SEC		0x0030
+#define MT2712_AL_MIN		0x0034
+#define MT2712_AL_HOU		0x0038
+#define MT2712_AL_DOM		0x003c
+#define MT2712_AL_DOW		0x0040
+#define MT2712_AL_MTH		0x0044
+#define MT2712_AL_YEA		0x0048
+
+#define MT2712_SEC_MASK		0x003f
+#define MT2712_MIN_MASK		0x003f
+#define MT2712_HOU_MASK		0x001f
+#define MT2712_DOM_MASK		0x001f
+#define MT2712_DOW_MASK		0x0007
+#define MT2712_MTH_MASK		0x000f
+#define MT2712_YEA_MASK		0x007f
+
+#define MT2712_POWERKEY1	0x004c
+#define MT2712_POWERKEY2	0x0050
+#define MT2712_POWERKEY1_KEY	0xa357
+#define MT2712_POWERKEY2_KEY	0x67d2
+
+#define MT2712_CON0		0x005c
+#define MT2712_CON1		0x0060
+
+#define MT2712_PROT		0x0070
+#define MT2712_PROT_UNLOCK1	0x9136
+#define MT2712_PROT_UNLOCK2	0x586a
+
+#define MT2712_WRTGR		0x0078
+
+/* we map HW YEAR 0 to 2000 because 2000 is the leap year */
+#define MT2712_MIN_YEAR		2000
+#define MT2712_BASE_YEAR	1900
+#define MT2712_MIN_YEAR_OFFSET	(MT2712_MIN_YEAR - MT2712_BASE_YEAR)
+#define MT2712_MAX_YEAR_OFFSET	(MT2712_MIN_YEAR_OFFSET + 127)
+
+struct mt2712_rtc {
+	struct device		*dev;
+	struct rtc_device	*rtc_dev;
+	void __iomem		*base;
+	int			irq;
+	u8			irq_wake_enabled;
+};
+
+static inline u32 mt2712_readl(struct mt2712_rtc *rtc, u32 reg)
+{
+	return readl(rtc->base + reg);
+}
+
+static inline void mt2712_writel(struct mt2712_rtc *rtc, u32 reg, u32 val)
+{
+	writel(val, rtc->base + reg);
+}
+
+static void mt2712_rtc_write_trigger(struct mt2712_rtc *rtc)
+{
+	unsigned long timeout = jiffies + HZ/10;
+
+	mt2712_writel(rtc, MT2712_WRTGR, 1);
+	while (1) {
+		if (!(mt2712_readl(rtc, MT2712_BBPU) & MT2712_BBPU_CBUSY))
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
+static void mt2712_rtc_writeif_unlock(struct mt2712_rtc *rtc)
+{
+	mt2712_writel(rtc, MT2712_PROT, MT2712_PROT_UNLOCK1);
+	mt2712_rtc_write_trigger(rtc);
+	mt2712_writel(rtc, MT2712_PROT, MT2712_PROT_UNLOCK2);
+	mt2712_rtc_write_trigger(rtc);
+}
+
+static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
+{
+	struct mt2712_rtc *rtc = data;
+	u16 irqsta, irqen;
+
+	mutex_lock(&rtc->rtc_dev->ops_lock);
+
+	irqsta = mt2712_readl(rtc, MT2712_IRQ_STA);
+	if (irqsta & MT2712_IRQ_STA_AL) {
+		rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
+		irqen = irqsta & ~MT2712_IRQ_EN_AL;
+
+		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
+		mt2712_rtc_write_trigger(rtc);
+
+		mutex_unlock(&rtc->rtc_dev->ops_lock);
+		return IRQ_HANDLED;
+	}
+
+	mutex_unlock(&rtc->rtc_dev->ops_lock);
+	return IRQ_NONE;
+}
+
+static void __mt2712_rtc_read_time(struct mt2712_rtc *rtc,
+				   struct rtc_time *tm, int *sec)
+{
+	tm->tm_sec  = mt2712_readl(rtc, MT2712_TC_SEC) & MT2712_SEC_MASK;
+	tm->tm_min  = mt2712_readl(rtc, MT2712_TC_MIN) & MT2712_MIN_MASK;
+	tm->tm_hour = mt2712_readl(rtc, MT2712_TC_HOU) & MT2712_HOU_MASK;
+	tm->tm_mday = mt2712_readl(rtc, MT2712_TC_DOM) & MT2712_DOM_MASK;
+	tm->tm_mon  = mt2712_readl(rtc, MT2712_TC_MTH) & MT2712_MTH_MASK;
+	tm->tm_year = mt2712_readl(rtc, MT2712_TC_YEA) & MT2712_YEA_MASK;
+
+	*sec = mt2712_readl(rtc, MT2712_TC_SEC) & MT2712_SEC_MASK;
+}
+
+static int mt2712_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+	int sec;
+
+	do {
+		__mt2712_rtc_read_time(rtc, tm, &sec);
+	} while (sec < tm->tm_sec);	/* SEC has carried */
+
+	/* HW register use 7 bits to store year data, minus
+	 * MT2712_MIN_YEAR_OFFSET brfore write year data to register, and plus
+	 * MT2712_MIN_YEAR_OFFSET back after read year from register
+	 */
+	tm->tm_year += MT2712_MIN_YEAR_OFFSET;
+
+	/* HW register start mon from one, but tm_mon start from zero. */
+	tm->tm_mon--;
+
+	if (rtc_valid_tm(tm)) {
+		dev_dbg(rtc->dev, "%s: invalid time %ptR\n", __func__, tm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mt2712_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+
+	if (tm->tm_year > MT2712_MAX_YEAR_OFFSET) {
+		dev_dbg(rtc->dev, "Set year %d out of range. (%d - %d)\n",
+			1900 + tm->tm_year, 1900 + MT2712_MIN_YEAR_OFFSET,
+			1900 + MT2712_MAX_YEAR_OFFSET);
+		return -EINVAL;
+	}
+
+	tm->tm_year -= MT2712_MIN_YEAR_OFFSET;
+	tm->tm_mon++;
+
+	mt2712_writel(rtc, MT2712_TC_SEC, tm->tm_sec  & MT2712_SEC_MASK);
+	mt2712_writel(rtc, MT2712_TC_MIN, tm->tm_min  & MT2712_MIN_MASK);
+	mt2712_writel(rtc, MT2712_TC_HOU, tm->tm_hour & MT2712_HOU_MASK);
+	mt2712_writel(rtc, MT2712_TC_DOM, tm->tm_mday & MT2712_DOM_MASK);
+	mt2712_writel(rtc, MT2712_TC_MTH, tm->tm_mon  & MT2712_MTH_MASK);
+	mt2712_writel(rtc, MT2712_TC_YEA, tm->tm_year & MT2712_YEA_MASK);
+
+	mt2712_rtc_write_trigger(rtc);
+
+	return 0;
+}
+
+static int mt2712_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alm->time;
+	u16 irqen;
+
+	irqen = mt2712_readl(rtc, MT2712_IRQ_EN);
+	alm->enabled = !!(irqen & MT2712_IRQ_EN_AL);
+
+	tm->tm_sec  = mt2712_readl(rtc, MT2712_AL_SEC) & MT2712_SEC_MASK;
+	tm->tm_min  = mt2712_readl(rtc, MT2712_AL_MIN) & MT2712_MIN_MASK;
+	tm->tm_hour = mt2712_readl(rtc, MT2712_AL_HOU) & MT2712_HOU_MASK;
+	tm->tm_mday = mt2712_readl(rtc, MT2712_AL_DOM) & MT2712_DOM_MASK;
+	tm->tm_mon  = mt2712_readl(rtc, MT2712_AL_MTH) & MT2712_MTH_MASK;
+	tm->tm_year = mt2712_readl(rtc, MT2712_AL_YEA) & MT2712_YEA_MASK;
+
+	tm->tm_year += MT2712_MIN_YEAR_OFFSET;
+	tm->tm_mon--;
+
+	if (rtc_valid_tm(tm)) {
+		dev_dbg(rtc->dev, "%s: invalid alarm %ptR\n", __func__, tm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mt2712_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alm->time;
+	u16 irqen;
+
+	if (tm->tm_year > MT2712_MAX_YEAR_OFFSET) {
+		dev_dbg(rtc->dev, "Set year %d out of range. (%d - %d)\n",
+			1900 + tm->tm_year, 1900 + MT2712_MIN_YEAR_OFFSET,
+			1900 + MT2712_MAX_YEAR_OFFSET);
+		return -EINVAL;
+	}
+
+	dev_dbg(rtc->dev, "set al time: %ptR, alm en: %d\n", tm, alm->enabled);
+
+	tm->tm_year -= MT2712_MIN_YEAR_OFFSET;
+	tm->tm_mon++;
+
+	irqen = mt2712_readl(rtc, MT2712_IRQ_EN) & ~(MT2712_IRQ_EN_ONESHOT_AL);
+	mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
+	mt2712_rtc_write_trigger(rtc);
+
+	mt2712_writel(rtc, MT2712_AL_SEC,
+		      (mt2712_readl(rtc, MT2712_AL_SEC) & ~(MT2712_SEC_MASK)) |
+		      (tm->tm_sec  & MT2712_SEC_MASK));
+	mt2712_writel(rtc, MT2712_AL_MIN,
+		      (mt2712_readl(rtc, MT2712_AL_MIN) & ~(MT2712_MIN_MASK)) |
+		      (tm->tm_min  & MT2712_MIN_MASK));
+	mt2712_writel(rtc, MT2712_AL_HOU,
+		      (mt2712_readl(rtc, MT2712_AL_HOU) & ~(MT2712_HOU_MASK)) |
+		      (tm->tm_hour & MT2712_HOU_MASK));
+	mt2712_writel(rtc, MT2712_AL_DOM,
+		      (mt2712_readl(rtc, MT2712_AL_DOM) & ~(MT2712_DOM_MASK)) |
+		      (tm->tm_mday & MT2712_DOM_MASK));
+	mt2712_writel(rtc, MT2712_AL_MTH,
+		      (mt2712_readl(rtc, MT2712_AL_MTH) & ~(MT2712_MTH_MASK)) |
+		      (tm->tm_mon  & MT2712_MTH_MASK));
+	mt2712_writel(rtc, MT2712_AL_YEA,
+		      (mt2712_readl(rtc, MT2712_AL_YEA) & ~(MT2712_YEA_MASK)) |
+		      (tm->tm_year & MT2712_YEA_MASK));
+
+	mt2712_writel(rtc, MT2712_AL_MASK, MT2712_AL_MASK_DOW);	/* mask DOW */
+
+	if (alm->enabled) {
+		irqen = mt2712_readl(rtc, MT2712_IRQ_EN) |
+				     MT2712_IRQ_EN_ONESHOT_AL;
+		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
+	} else {
+		irqen = mt2712_readl(rtc, MT2712_IRQ_EN) &
+				     ~(MT2712_IRQ_EN_ONESHOT_AL);
+		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
+	}
+	mt2712_rtc_write_trigger(rtc);
+
+	return 0;
+}
+
+/* Init RTC register */
+static void mt2712_rtc_hw_init(struct mt2712_rtc *rtc)
+{
+	u32 p1, p2;
+
+	mt2712_writel(rtc, MT2712_BBPU, MT2712_BBPU_KEY | MT2712_BBPU_RELOAD);
+
+	mt2712_writel(rtc, MT2712_CII_EN, 0);
+	mt2712_writel(rtc, MT2712_AL_MASK, 0);
+	/* necessary before set MT2712_POWERKEY */
+	mt2712_writel(rtc, MT2712_CON0, 0x4848);
+	mt2712_writel(rtc, MT2712_CON1, 0x0048);
+
+	mt2712_rtc_write_trigger(rtc);
+
+	mt2712_readl(rtc, MT2712_IRQ_STA);	/* read clear */
+
+	p1 = mt2712_readl(rtc, MT2712_POWERKEY1);
+	p2 = mt2712_readl(rtc, MT2712_POWERKEY2);
+	if (p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY)
+		dev_dbg(rtc->dev, "powerkey not set (lost power)\n");
+
+	/* RTC need POWERKEY1/2 match, then goto normal work mode */
+	mt2712_writel(rtc, MT2712_POWERKEY1, MT2712_POWERKEY1_KEY);
+	mt2712_writel(rtc, MT2712_POWERKEY2, MT2712_POWERKEY2_KEY);
+	mt2712_rtc_write_trigger(rtc);
+
+	mt2712_rtc_writeif_unlock(rtc);
+}
+
+static const struct rtc_class_ops mt2712_rtc_ops = {
+	.read_time	= mt2712_rtc_read_time,
+	.set_time	= mt2712_rtc_set_time,
+	.read_alarm	= mt2712_rtc_read_alarm,
+	.set_alarm	= mt2712_rtc_set_alarm,
+};
+
+static int mt2712_rtc_probe(struct platform_device *pdev)
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
+	rtc->dev = &pdev->dev;
+	platform_set_drvdata(pdev, rtc);
+
+	rtc->rtc_dev = devm_rtc_allocate_device(rtc->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
+					rtc_irq_handler_thread,
+					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+					dev_name(rtc->dev), rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
+			rtc->irq, ret);
+		return ret;
+	}
+
+	/* rtc hw init */
+	mt2712_rtc_hw_init(rtc);
+
+	device_init_wakeup(&pdev->dev, true);
+
+	rtc->rtc_dev->ops = &mt2712_rtc_ops;
+
+	ret = rtc_register_device(rtc->rtc_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "register rtc device failed\n");
+		return ret;
+	}
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
+static struct platform_driver mt2712_rtc_driver = {
+	.driver = {
+		.name = MTK_RTC_DEV,
+		.of_match_table = mt2712_rtc_of_match,
+		.pm = &mt2712_pm_ops,
+	},
+	.probe  = mt2712_rtc_probe,
+};
+
+module_platform_driver(mt2712_rtc_driver);
+
+MODULE_DESCRIPTION("MediaTek MT2712 SoC based RTC Driver");
+MODULE_AUTHOR("Ran Bi <ran.bi@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
2.21.0


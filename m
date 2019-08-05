Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5EEF81173
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 07:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfHEFXR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 01:23:17 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:20050 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727222AbfHEFWv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 01:22:51 -0400
X-UUID: bdbccfe973e34113a132421d215dd87c-20190805
X-UUID: bdbccfe973e34113a132421d215dd87c-20190805
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1095245785; Mon, 05 Aug 2019 13:22:43 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 5 Aug 2019 13:22:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 5 Aug 2019 13:22:43 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH v4 10/10] rtc: Add support for the MediaTek MT6358 RTC
Date:   Mon, 5 Aug 2019 13:21:58 +0800
Message-ID: <1564982518-32163-11-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ran Bi <ran.bi@mediatek.com>

This add support for the MediaTek MT6358 RTC. Driver using
compatible data to store different RTC_WRTGR address offset.

Review-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 drivers/rtc/rtc-mt6397.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 828def7..e23c215 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -12,6 +12,7 @@
 #include <linux/irqdomain.h>
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/io.h>
 #include <linux/mfd/mt6397/core.h>
@@ -19,7 +20,8 @@
 #define RTC_BBPU		0x0000
 #define RTC_BBPU_CBUSY		BIT(6)
 
-#define RTC_WRTGR		0x003c
+#define RTC_WRTGR_MT6358	0x3a
+#define RTC_WRTGR_MT6397	0x3c
 
 #define RTC_IRQ_STA		0x0002
 #define RTC_IRQ_STA_AL		BIT(0)
@@ -63,6 +65,10 @@
 #define RTC_NUM_YEARS		128
 #define RTC_MIN_YEAR_OFFSET	(RTC_MIN_YEAR - RTC_BASE_YEAR)
 
+struct mtk_rtc_compatible {
+	u32			wrtgr_addr;
+};
+
 struct mt6397_rtc {
 	struct device		*dev;
 	struct rtc_device	*rtc_dev;
@@ -70,7 +76,25 @@ struct mt6397_rtc {
 	struct regmap		*regmap;
 	int			irq;
 	u32			addr_base;
+	const struct mtk_rtc_compatible *dev_comp;
+};
+
+static const struct mtk_rtc_compatible mt6358_rtc_compat = {
+	.wrtgr_addr = RTC_WRTGR_MT6358,
+};
+
+static const struct mtk_rtc_compatible mt6397_rtc_compat = {
+	.wrtgr_addr = RTC_WRTGR_MT6397,
+};
+
+static const struct of_device_id mt6397_rtc_of_match[] = {
+	{ .compatible = "mediatek,mt6358-rtc",
+		.data = (void *)&mt6358_rtc_compat, },
+	{ .compatible = "mediatek,mt6397-rtc",
+		.data = (void *)&mt6397_rtc_compat, },
+	{}
 };
+MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
 
 static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 {
@@ -78,7 +102,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	int ret;
 	u32 data;
 
-	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_WRTGR, 1);
+	ret = regmap_write(rtc->regmap,
+			   rtc->addr_base + rtc->dev_comp->wrtgr_addr, 1);
 	if (ret < 0)
 		return ret;
 
@@ -324,6 +349,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
 	struct mt6397_rtc *rtc;
+	const struct of_device_id *of_id;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt6397_rtc), GFP_KERNEL);
@@ -333,6 +359,13 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	rtc->addr_base = res->start;
 
+	of_id = of_match_device(mt6397_rtc_of_match, &pdev->dev);
+	if (!of_id) {
+		dev_err(&pdev->dev, "Failed to probe of_node\n");
+		return -EINVAL;
+	}
+	rtc->dev_comp = of_id->data;
+
 	rtc->irq = platform_get_irq(pdev, 0);
 	if (rtc->irq < 0)
 		return rtc->irq;
@@ -408,12 +441,6 @@ static int mt6397_rtc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
 			mt6397_rtc_resume);
 
-static const struct of_device_id mt6397_rtc_of_match[] = {
-	{ .compatible = "mediatek,mt6397-rtc", },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
-
 static struct platform_driver mtk_rtc_driver = {
 	.driver = {
 		.name = "mt6397-rtc",
-- 
2.6.4


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741979A62E
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 05:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403828AbfHWDp4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 23:45:56 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:8831 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2389951AbfHWDp4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 23:45:56 -0400
X-UUID: 00905a91406b4c2189cae494bdd72ef2-20190823
X-UUID: 00905a91406b4c2189cae494bdd72ef2-20190823
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 283223839; Fri, 23 Aug 2019 11:45:43 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 23 Aug 2019 11:45:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 23 Aug 2019 11:45:36 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH v5 10/10] rtc: mt6397: Add support for the MediaTek MT6358 RTC
Date:   Fri, 23 Aug 2019 11:45:31 +0800
Message-ID: <1566531931-9772-11-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F0764FDB06D62BEE862D7EA509F66EB2C2B5058E838AAF7CCDC98D4C539255B72000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ran Bi <ran.bi@mediatek.com>

This add support for the MediaTek MT6358 RTC. Driver using
compatible data to store different RTC_WRTGR address offset.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 drivers/rtc/rtc-mt6397.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 828def7..d1c2886 100644
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
 
+struct mtk_rtc_data {
+	u32			wrtgr;
+};
+
 struct mt6397_rtc {
 	struct device		*dev;
 	struct rtc_device	*rtc_dev;
@@ -70,15 +76,34 @@ struct mt6397_rtc {
 	struct regmap		*regmap;
 	int			irq;
 	u32			addr_base;
+	const struct mtk_rtc_data *data;
+};
+
+static const struct mtk_rtc_data mt6358_rtc_data = {
+	.wrtgr = RTC_WRTGR_MT6358,
 };
 
+static const struct mtk_rtc_data mt6397_rtc_data = {
+	.wrtgr = RTC_WRTGR_MT6397,
+};
+
+static const struct of_device_id mt6397_rtc_of_match[] = {
+	{ .compatible = "mediatek,mt6358-rtc",
+		.data = (void *)&mt6358_rtc_data, },
+	{ .compatible = "mediatek,mt6397-rtc",
+		.data = (void *)&mt6397_rtc_data, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
+
 static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 {
 	unsigned long timeout = jiffies + HZ;
 	int ret;
 	u32 data;
 
-	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_WRTGR, 1);
+	ret = regmap_write(rtc->regmap,
+			   rtc->addr_base + rtc->data->wrtgr, 1);
 	if (ret < 0)
 		return ret;
 
@@ -333,6 +358,9 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	rtc->addr_base = res->start;
 
+	rtc->data = (struct mtk_rtc_data *)
+			of_device_get_match_data(&pdev->dev);
+
 	rtc->irq = platform_get_irq(pdev, 0);
 	if (rtc->irq < 0)
 		return rtc->irq;
@@ -408,12 +436,6 @@ static int mt6397_rtc_resume(struct device *dev)
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
1.9.1


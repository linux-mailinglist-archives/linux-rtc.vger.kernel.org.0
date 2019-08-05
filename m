Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCC6781179
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 07:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfHEFXZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 01:23:25 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:61864 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726375AbfHEFWt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 01:22:49 -0400
X-UUID: a4f0ef492c274da3a0b5023f92302eab-20190805
X-UUID: a4f0ef492c274da3a0b5023f92302eab-20190805
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1811369814; Mon, 05 Aug 2019 13:22:40 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 5 Aug 2019 13:22:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 5 Aug 2019 13:22:41 +0800
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
        <srv_heupstream@mediatek.com>
Subject: [PATCH v4 01/10] mfd: mt6397: clean up code
Date:   Mon, 5 Aug 2019 13:21:49 +0800
Message-ID: <1564982518-32163-2-git-send-email-hsin-hsiung.wang@mediatek.com>
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

refine some variable name for more readable

Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/mfd/mt6397-core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 337bccc..c070862 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -10,17 +10,17 @@
 #include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/mfd/core.h>
-#include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6323/core.h>
-#include <linux/mfd/mt6397/registers.h>
+#include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6397/registers.h>
 
 #define MT6397_RTC_BASE		0xe000
 #define MT6397_RTC_SIZE		0x3e
 
-#define MT6323_CID_CODE		0x23
-#define MT6391_CID_CODE		0x91
-#define MT6397_CID_CODE		0x97
+#define MT6323_CHIP_ID		0x23
+#define MT6391_CHIP_ID		0x91
+#define MT6397_CHIP_ID		0x97
 
 static const struct resource mt6397_rtc_resources[] = {
 	{
@@ -290,7 +290,7 @@ static int mt6397_probe(struct platform_device *pdev)
 		return pmic->irq;
 
 	switch (id & 0xff) {
-	case MT6323_CID_CODE:
+	case MT6323_CHIP_ID:
 		pmic->int_con[0] = MT6323_INT_CON0;
 		pmic->int_con[1] = MT6323_INT_CON1;
 		pmic->int_status[0] = MT6323_INT_STATUS0;
@@ -304,8 +304,8 @@ static int mt6397_probe(struct platform_device *pdev)
 					   0, pmic->irq_domain);
 		break;
 
-	case MT6397_CID_CODE:
-	case MT6391_CID_CODE:
+	case MT6391_CHIP_ID:
+	case MT6397_CHIP_ID:
 		pmic->int_con[0] = MT6397_INT_CON0;
 		pmic->int_con[1] = MT6397_INT_CON1;
 		pmic->int_status[0] = MT6397_INT_STATUS0;
-- 
2.6.4


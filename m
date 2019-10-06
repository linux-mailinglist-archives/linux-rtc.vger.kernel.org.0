Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA6BBCD0F8
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Oct 2019 12:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfJFKdG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Oct 2019 06:33:06 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3253 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726828AbfJFKdG (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 6 Oct 2019 06:33:06 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A8A85FC4CBFC0474C99B;
        Sun,  6 Oct 2019 18:33:03 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sun, 6 Oct 2019
 18:32:55 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <joel@jms.id.au>, <andrew@aj.id.au>, <nicolas.ferre@microchip.com>,
        <ludovic.desroches@microchip.com>, <computersforpeace@gmail.com>,
        <gregory.0xf0@gmail.com>, <f.fainelli@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linus.walleij@linaro.org>, <baruch@tkos.co.il>,
        <paul@crapouillou.net>, <vz@mleia.com>, <slemieux.tyco@gmail.com>,
        <khilman@baylibre.com>, <eddie.huang@mediatek.com>,
        <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
        <patrice.chotard@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <mripard@kernel.org>, <wens@csie.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux@prisktech.co.nz>, <michal.simek@xilinx.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-tegra@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 16/34] rtc: meson: use devm_platform_ioremap_resource() to simplify code
Date:   Sun, 6 Oct 2019 18:29:35 +0800
Message-ID: <20191006102953.57536-17-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20191006102953.57536-1-yuehaibing@huawei.com>
References: <20191006102953.57536-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/rtc/rtc-meson.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index e08b981..9bd8478 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -292,7 +292,6 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct meson_rtc *rtc;
-	struct resource *res;
 	void __iomem *base;
 	int ret;
 	u32 tm;
@@ -312,8 +311,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	rtc->rtc->ops = &meson_rtc_ops;
 	rtc->rtc->range_max = U32_MAX;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.7.4



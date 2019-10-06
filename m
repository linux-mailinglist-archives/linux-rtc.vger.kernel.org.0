Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 791A2CD090
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Oct 2019 12:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbfJFKcn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Oct 2019 06:32:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3207 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726750AbfJFKcm (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 6 Oct 2019 06:32:42 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id D26F8B3242B4552248AA;
        Sun,  6 Oct 2019 18:32:38 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Sun, 6 Oct 2019
 18:32:30 +0800
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
Subject: [PATCH -next 09/34] rtc: ds1216: use devm_platform_ioremap_resource() to simplify code
Date:   Sun, 6 Oct 2019 18:29:28 +0800
Message-ID: <20191006102953.57536-10-yuehaibing@huawei.com>
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
 drivers/rtc/rtc-ds1216.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1216.c b/drivers/rtc/rtc-ds1216.c
index b225bcf..7eeb3f3 100644
--- a/drivers/rtc/rtc-ds1216.c
+++ b/drivers/rtc/rtc-ds1216.c
@@ -137,7 +137,6 @@ static const struct rtc_class_ops ds1216_rtc_ops = {
 
 static int __init ds1216_rtc_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct ds1216_priv *priv;
 	u8 dummy[8];
 
@@ -147,8 +146,7 @@ static int __init ds1216_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->ioaddr = devm_ioremap_resource(&pdev->dev, res);
+	priv->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->ioaddr))
 		return PTR_ERR(priv->ioaddr);
 
-- 
2.7.4



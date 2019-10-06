Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07D4CD094
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Oct 2019 12:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfJFKcs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Oct 2019 06:32:48 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43382 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726444AbfJFKcr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 6 Oct 2019 06:32:47 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 1E90A458F908C584EBC8;
        Sun,  6 Oct 2019 18:32:44 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sun, 6 Oct 2019
 18:32:34 +0800
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
Subject: [PATCH -next 10/34] rtc: ds1511: use devm_platform_ioremap_resource() to simplify code
Date:   Sun, 6 Oct 2019 18:29:29 +0800
Message-ID: <20191006102953.57536-11-yuehaibing@huawei.com>
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
 drivers/rtc/rtc-ds1511.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1511.c b/drivers/rtc/rtc-ds1511.c
index b6a4775..a63872c 100644
--- a/drivers/rtc/rtc-ds1511.c
+++ b/drivers/rtc/rtc-ds1511.c
@@ -414,7 +414,6 @@ static int ds1511_nvram_write(void *priv, unsigned int pos, void *buf,
 
 static int ds1511_rtc_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct rtc_plat_data *pdata;
 	int ret = 0;
 	struct nvmem_config ds1511_nvmem_cfg = {
@@ -431,8 +430,7 @@ static int ds1511_rtc_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ds1511_base = devm_ioremap_resource(&pdev->dev, res);
+	ds1511_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ds1511_base))
 		return PTR_ERR(ds1511_base);
 	pdata->ioaddr = ds1511_base;
-- 
2.7.4



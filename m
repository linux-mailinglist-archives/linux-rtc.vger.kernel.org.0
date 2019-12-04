Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878D5112399
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2019 08:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfLDHa5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Dec 2019 02:30:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:6746 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725958AbfLDHa5 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 4 Dec 2019 02:30:57 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D9EB019BD49D9D2B1B99;
        Wed,  4 Dec 2019 15:30:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Dec 2019 15:30:44 +0800
From:   Mao Wenan <maowenan@huawei.com>
To:     <eddie.huang@mediatek.com>, <sean.wang@mediatek.com>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <matthias.bgg@gmail.com>, <dan.carpenter@oracle.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Mao Wenan <maowenan@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH v2 -next] rtc: mt6397: drop free_irq of devm_xx allocated irq
Date:   Wed, 4 Dec 2019 15:28:26 +0800
Message-ID: <20191204072826.117432-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204063444.GF1765@kadam>
References: <20191204063444.GF1765@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rtc->irq is requested by devm_request_threaded_irq,
and request_threaded_irq. IRQs requested with this
function will be automatically freed on driver detach.
This patch remove unused error label as well.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: remove error label as Dan Carpenter suggest.
 drivers/rtc/rtc-mt6397.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 5249fc99fd5f..14f3c4915260 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -287,13 +287,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
 
 	ret = rtc_register_device(rtc->rtc_dev);
-	if (ret)
-		goto out_free_irq;
-
-	return 0;
-
-out_free_irq:
-	free_irq(rtc->irq, rtc);
 	return ret;
 }
 
-- 
2.20.1


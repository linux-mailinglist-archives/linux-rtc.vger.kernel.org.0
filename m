Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4475FA4CC
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2019 03:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfKMCSg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Nov 2019 21:18:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6649 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728267AbfKMCSg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 12 Nov 2019 21:18:36 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 10EACF2AFB7F7B0C771E;
        Wed, 13 Nov 2019 10:18:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Wed, 13 Nov 2019 10:18:27 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Josef Friedl <josef.friedl@speed.at>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] rtc: mt6397: drop free_irq of devm_ allocated irq
Date:   Wed, 13 Nov 2019 02:17:20 +0000
Message-ID: <20191113021720.9527-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The devm_request_threaded_irq function allocates irq that is
released when a driver detaches. Thus, there is no reason to
explicitly call free_irq in probe function.

Fixes: 851b87148aa2 ("rtc: mt6397: improvements of rtc driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/rtc/rtc-mt6397.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 5249fc99fd5f..6c585cd1ce10 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -286,15 +286,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
 
-	ret = rtc_register_device(rtc->rtc_dev);
-	if (ret)
-		goto out_free_irq;
-
-	return 0;
-
-out_free_irq:
-	free_irq(rtc->irq, rtc);
-	return ret;
+	return rtc_register_device(rtc->rtc_dev);
 }
 
 #ifdef CONFIG_PM_SLEEP




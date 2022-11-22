Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB6D633C40
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 13:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbiKVMR0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 07:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbiKVMRZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 07:17:25 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2C151C38
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 04:17:24 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NGjq31ztkzJnl7;
        Tue, 22 Nov 2022 20:14:07 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 20:17:22 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <cuigaosheng1@huawei.com>
CC:     <linux-rtc@vger.kernel.org>
Subject: [PATCH] rtc: pic32: Add error handling in pic32_rtc_probe()
Date:   Tue, 22 Nov 2022 20:17:21 +0800
Message-ID: <20221122121721.1647168-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pic32_rtc_enable(pdata, 0) and clk_disable_unprepare(pdata->clk)
should be called in the error handling of devm_rtc_allocate_device(),
fix it.

Fixes: 6515e23b9fde ("rtc: pic32: convert to devm_rtc_allocate_device")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/rtc/rtc-pic32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index 7fb9145c43bd..258136e3fe96 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -331,8 +331,10 @@ static int pic32_rtc_probe(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, 1);
 
 	pdata->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(pdata->rtc))
-		return PTR_ERR(pdata->rtc);
+	if (IS_ERR(pdata->rtc)) {
+		ret = PTR_ERR(pdata->rtc);
+		goto err_nortc;
+	}
 
 	pdata->rtc->ops = &pic32_rtcops;
 	pdata->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-- 
2.25.1


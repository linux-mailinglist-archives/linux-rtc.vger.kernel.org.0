Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A7976E2AD
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Aug 2023 10:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbjHCIPh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Aug 2023 04:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234393AbjHCIPG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Aug 2023 04:15:06 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE8A3594
        for <linux-rtc@vger.kernel.org>; Thu,  3 Aug 2023 01:07:54 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RGhFn55Q9ztRlS;
        Thu,  3 Aug 2023 16:04:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 16:07:52 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/2] rtc: omap: Do not check for 0 return after calling platform_get_irq()
Date:   Thu, 3 Aug 2023 16:07:12 +0800
Message-ID: <20230803080713.4061782-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803080713.4061782-1-ruanjinjie@huawei.com>
References: <20230803080713.4061782-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It is not possible for platform_get_irq() to return 0. Use the
return value from platform_get_irq().

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/rtc/rtc-omap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 8ae4d7824ec9..5b10ab06cd2e 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -747,12 +747,12 @@ static int omap_rtc_probe(struct platform_device *pdev)
 	}
 
 	rtc->irq_timer = platform_get_irq(pdev, 0);
-	if (rtc->irq_timer <= 0)
-		return -ENOENT;
+	if (rtc->irq_timer < 0)
+		return rtc->irq_timer;
 
 	rtc->irq_alarm = platform_get_irq(pdev, 1);
-	if (rtc->irq_alarm <= 0)
-		return -ENOENT;
+	if (rtc->irq_alarm < 0)
+		return rtc->irq_alarm;
 
 	rtc->clk = devm_clk_get(&pdev->dev, "ext-clk");
 	if (!IS_ERR(rtc->clk))
-- 
2.34.1


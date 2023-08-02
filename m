Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E0076C98F
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Aug 2023 11:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbjHBJhY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Aug 2023 05:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjHBJhX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Aug 2023 05:37:23 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95A8E7
        for <linux-rtc@vger.kernel.org>; Wed,  2 Aug 2023 02:37:21 -0700 (PDT)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RG6KM2vKWzVjgX;
        Wed,  2 Aug 2023 17:35:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 17:37:19 +0800
From:   Chen Jiahao <chenjiahao16@huawei.com>
To:     <vincent.sunplus@gmail.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>
CC:     <chenjiahao16@huawei.com>
Subject: [PATCH -next] rtc: sunplus: Clean up redundant dev_err_probe()
Date:   Wed, 2 Aug 2023 17:36:50 +0800
Message-ID: <20230802093650.976352-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500016.china.huawei.com (7.185.36.25)
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

Referring to platform_get_irq()'s definition, the return value has
already been checked if ret < 0, and printed via dev_err_probe().
Calling dev_err_probe() one more time outside platform_get_irq()
is obviously redundant.

Removing dev_err_probe() outside platform_get_irq() to clean up
above problem.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/rtc/rtc-sunplus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sunplus.c b/drivers/rtc/rtc-sunplus.c
index f33dc301f301..20c7e97c2fc8 100644
--- a/drivers/rtc/rtc-sunplus.c
+++ b/drivers/rtc/rtc-sunplus.c
@@ -244,7 +244,7 @@ static int sp_rtc_probe(struct platform_device *plat_dev)
 
 	sp_rtc->irq = platform_get_irq(plat_dev, 0);
 	if (sp_rtc->irq < 0)
-		return dev_err_probe(&plat_dev->dev, sp_rtc->irq, "platform_get_irq failed\n");
+		return sp_rtc->irq;
 
 	ret = devm_request_irq(&plat_dev->dev, sp_rtc->irq, sp_rtc_irq_handler,
 			       IRQF_TRIGGER_RISING, "rtc irq", plat_dev);
-- 
2.34.1


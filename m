Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93CE675B0D8
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jul 2023 16:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjGTOIt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jul 2023 10:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjGTOIt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jul 2023 10:08:49 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 78A842126
        for <linux-rtc@vger.kernel.org>; Thu, 20 Jul 2023 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=3UngDXrAHQ19pAfAY5
        UEDtkmsKF10UxMz5VveAtn+iE=; b=mbQ8IBVZPppcwCzUYZsJWsGC8WgHlDAO4t
        p3nL8v2VxZK6Q6oh1XDmSjcxWhQC+7pTjPFJduBpqQCNrL9v56uZT1SQ48XC5Gnq
        pCZowXKGgDxOf01TtcCKfhegwPpBEWy9IZUTxrg96mBhFcc3Ce6wQBs5GZIryA3t
        fZbbLvGqU=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g0-4 (Coremail) with SMTP id _____wAHgojYP7lk4hFmAw--.47977S4;
        Thu, 20 Jul 2023 22:08:29 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] rtc: use devm_clk_get_enabled() in pic32_rtc_probe()
Date:   Thu, 20 Jul 2023 22:08:23 +0800
Message-Id: <20230720140823.33392-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wAHgojYP7lk4hFmAw--.47977S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UXFy5ur1fZFW7JF4UCFg_yoW8GF1xpa
        ykAFWFk3y2yrWFka4DX3ykZr15Ar1xKa48K3yDu3sa9w15try5Ars3try0vayvyFWkCw1Y
        qw17tFWrAF15urUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUY9agUUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiUQGy5WDESWmofgAAsV
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

in pic32_rtc_probe(), the return value of function
clk_prepare_enable() should be checked, since it may fail.
using devm_clk_get_enabled() instead of devm_clk_get() and
clk_prepare_enable() can avoid this problem.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/rtc/rtc-pic32.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index 4f85e0c3d757..d8000275679e 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -312,7 +312,7 @@ static int pic32_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->reg_base))
 		return PTR_ERR(pdata->reg_base);
 
-	pdata->clk = devm_clk_get(&pdev->dev, NULL);
+	pdata->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(pdata->clk)) {
 		dev_err(&pdev->dev, "failed to find rtc clock source\n");
 		ret = PTR_ERR(pdata->clk);
@@ -326,8 +326,6 @@ static int pic32_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->rtc))
 		return PTR_ERR(pdata->rtc);
 
-	clk_prepare_enable(pdata->clk);
-
 	pic32_rtc_enable(pdata, 1);
 
 	device_init_wakeup(&pdev->dev, 1);
@@ -358,7 +356,6 @@ static int pic32_rtc_probe(struct platform_device *pdev)
 
 err_nortc:
 	pic32_rtc_enable(pdata, 0);
-	clk_disable_unprepare(pdata->clk);
 
 	return ret;
 }
-- 
2.17.1


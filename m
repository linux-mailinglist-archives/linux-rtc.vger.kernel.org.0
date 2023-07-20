Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A562575B0D7
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jul 2023 16:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjGTOIn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jul 2023 10:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjGTOIm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jul 2023 10:08:42 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C4DB211F
        for <linux-rtc@vger.kernel.org>; Thu, 20 Jul 2023 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=aQdjCHvypy7hJkuSlY
        /LzEB92jzQt8h3nBot8st0K/w=; b=mdc2Mcf15oKi4AM6rFtduEmIaKkYTJFaph
        3UfPcBw56HTvDrw30HVfa4EZiudaZomYn9926LaJObLFhF2B48ySa10eN2U9Wm4x
        Z5ibshN3aoU3yYMxLbfdSDhLiBdWNYrvOc9NJiEYY7cZTE/CdIM6p1YmrKB6YBj8
        F3inESp7I=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wDXUcXQP7lkMH1cAw--.19517S4;
        Thu, 20 Jul 2023 22:08:19 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] rtc: use devm_clk_get_enabled() in mv_rtc_probe()
Date:   Thu, 20 Jul 2023 22:08:14 +0800
Message-Id: <20230720140814.33301-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXUcXQP7lkMH1cAw--.19517S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UXFy5ur1fuFykKrWUXFb_yoW8uw1rpF
        Z3AFWrKr1UtFZakry7Xa1Du3WYyr1xt3W0k3yDuwn2vw1Yyry5JFs5tryvvayFyrWkGr15
        tw47tFWfCF4UuwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU5pnPUUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiAuy5VaEF2imEwABsN
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

in mv_rtc_probe(), the return value of function
clk_prepare_enable() should be checked, since it may fail.
using devm_clk_get_enabled() instead of devm_clk_get() and
clk_prepare_enable() can avoid this problem.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/rtc/rtc-mv.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index 6c526e2ec56d..8cd33721be03 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -219,17 +219,16 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->ioaddr))
 		return PTR_ERR(pdata->ioaddr);
 
-	pdata->clk = devm_clk_get(&pdev->dev, NULL);
+	pdata->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	/* Not all SoCs require a clock.*/
-	if (!IS_ERR(pdata->clk))
-		clk_prepare_enable(pdata->clk);
+	if (IS_ERR(pdata->clk))
+		return PTR_ERR(pdata->clk);
 
 	/* make sure the 24 hour mode is enabled */
 	rtc_time = readl(pdata->ioaddr + RTC_TIME_REG_OFFS);
 	if (rtc_time & RTC_HOURS_12H_MODE) {
 		dev_err(&pdev->dev, "12 Hour mode is enabled but not supported.\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	/* make sure it is actually functional */
@@ -238,8 +237,7 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 		rtc_time = readl(pdata->ioaddr + RTC_TIME_REG_OFFS);
 		if (rtc_time == 0x01000000) {
 			dev_err(&pdev->dev, "internal RTC not ticking\n");
-			ret = -ENODEV;
-			goto out;
+			return -ENODEV;
 		}
 	}
 
@@ -249,8 +247,7 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 
 	pdata->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(pdata->rtc)) {
-		ret = PTR_ERR(pdata->rtc);
-		goto out;
+		return PTR_ERR(pdata->rtc);
 	}
 
 	if (pdata->irq >= 0) {
@@ -275,11 +272,6 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 	ret = devm_rtc_register_device(pdata->rtc);
 	if (!ret)
 		return 0;
-out:
-	if (!IS_ERR(pdata->clk))
-		clk_disable_unprepare(pdata->clk);
-
-	return ret;
 }
 
 static int __exit mv_rtc_remove(struct platform_device *pdev)
-- 
2.17.1


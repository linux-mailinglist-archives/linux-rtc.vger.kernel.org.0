Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28166AAA30
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCDNce (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjCDNcb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:31 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41DB22012
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:06 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyN-0000zz-7s; Sat, 04 Mar 2023 14:30:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyL-001nc1-HW; Sat, 04 Mar 2023 14:30:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0027Ii-J5; Sat, 04 Mar 2023 14:30:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 40/41] rtc: xgene: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:27 +0100
Message-Id: <20230304133028.2135435-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ffd3SI9eh75O+w9W1GAB+yH0QKMD3tE0OLRvmNZW6GM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fr5tJ9QZTnyCriPI5z876cmz0fg47Nv7hfm 2fItClkuEGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH6wAKCRDB/BR4rcrs CcQxB/wJf0GbbJTV/YrflB/YNBbhxZyCRWjPyj4G7knJpmPY51WqinhkOEd4VY9fQBMJ3X+8AZE XGoqsaZwEXi7XomBSpXbGS7f5gyKRkiIsVDfdJN47uwLUYKDbvupJlCs+8vn5othpqrCxRYrM7e svCESjP7zcEXIA8gRF4MnCJe288eQRFlOsB8i9Pny/z8aFULGF/c8EnsQqs9jgz0sJ8RTpzIRSv vieDs1Tx328KeOAXX6FxEWjaKpYUY7SQmH0qODUEwOAHvaAIRu2J3QQT1zsxlV4jSM3I59crcrr Am3C8nFZ+5f3smJ0+6/QymUFcy5F+cUs40JpqtP1it70/vlY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-xgene.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index d3d0054e21fd..f78efc9760c0 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -192,14 +192,13 @@ static int xgene_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int xgene_rtc_remove(struct platform_device *pdev)
+static void xgene_rtc_remove(struct platform_device *pdev)
 {
 	struct xgene_rtc_dev *pdata = platform_get_drvdata(pdev);
 
 	xgene_rtc_alarm_irq_enable(&pdev->dev, 0);
 	device_init_wakeup(&pdev->dev, 0);
 	clk_disable_unprepare(pdata->clk);
-	return 0;
 }
 
 static int __maybe_unused xgene_rtc_suspend(struct device *dev)
@@ -264,7 +263,7 @@ MODULE_DEVICE_TABLE(of, xgene_rtc_of_match);
 
 static struct platform_driver xgene_rtc_driver = {
 	.probe		= xgene_rtc_probe,
-	.remove		= xgene_rtc_remove,
+	.remove_new	= xgene_rtc_remove,
 	.driver		= {
 		.name	= "xgene-rtc",
 		.pm = &xgene_rtc_pm_ops,
-- 
2.39.1


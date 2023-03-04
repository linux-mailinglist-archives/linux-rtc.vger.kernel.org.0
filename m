Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149036AAA2F
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjCDNcd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjCDNcb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:31 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F15C222CC
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyM-0000x7-FG; Sat, 04 Mar 2023 14:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-001nbf-VH; Sat, 04 Mar 2023 14:30:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-0027ID-5C; Sat, 04 Mar 2023 14:30:47 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 32/41] rtc: stm32: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:19 +0100
Message-Id: <20230304133028.2135435-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wo4ZpCb09jaV+I9OJsX/61BGqUm7VIOEY4KCLWnhQ2A=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fPD/3y725FcL3zhOi74xeBgcP45+6dC9dfk DAI+8fslMmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHzwAKCRDB/BR4rcrs CXicB/4tMFECnqFEUgdHyFdw3YXNMB65ggPupC9RG6qIWThdiJjoEK4UuBbl4gOOJAwU3Cx2t1t JmrGENDZxbosKC1+yZHudlhTJ7FRnjo675zyWKSTPBKxHwTmA6dBVk3btEDHWifmJsAmw2jEE9J +VoOilg/LZ4eKMFprbkCwt61n/OY1x8bMwxaNL15WEtXBp6CSqZ0NpNdaYK1HzXWp0QRMzifiUM NUZ9J0f09dgUZFnMoEeB44A/lpC5ruJPl7t4QfTdXWrJmFjBshwhr5zMnaWQJgrkJ65H7qnKlZ5 aUTIu+sY2BaE8O47BkpgSQwLvbpzwfdfDKARw3r4zfHfE7fz
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
 drivers/rtc/rtc-stm32.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index ac9e228b56d0..229cb2847cc4 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -846,7 +846,7 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int stm32_rtc_remove(struct platform_device *pdev)
+static void stm32_rtc_remove(struct platform_device *pdev)
 {
 	struct stm32_rtc *rtc = platform_get_drvdata(pdev);
 	const struct stm32_rtc_registers *regs = &rtc->data->regs;
@@ -869,8 +869,6 @@ static int stm32_rtc_remove(struct platform_device *pdev)
 
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -917,7 +915,7 @@ static SIMPLE_DEV_PM_OPS(stm32_rtc_pm_ops,
 
 static struct platform_driver stm32_rtc_driver = {
 	.probe		= stm32_rtc_probe,
-	.remove		= stm32_rtc_remove,
+	.remove_new	= stm32_rtc_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.pm	= &stm32_rtc_pm_ops,
-- 
2.39.1


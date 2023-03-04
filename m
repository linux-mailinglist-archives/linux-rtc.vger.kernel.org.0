Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1436AAA3C
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjCDNdD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjCDNdC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:33:02 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65FC211DE
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0000fI-T8; Sat, 04 Mar 2023 14:30:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-001na3-L3; Sat, 04 Mar 2023 14:30:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0027H6-1E; Sat, 04 Mar 2023 14:30:44 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 15/41] rtc: max77686: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:02 +0100
Message-Id: <20230304133028.2135435-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4R2BJ7Ycjbairv40Vj8Zl/xcRUirl4wyUSjCyTmSnPM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0eWytfoB5ygywh2kxPuy3OtyqMm18OiGcQW3 JZBy1KP2eGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHlgAKCRDB/BR4rcrs CUY7B/9vTP9CgQtQvoLBpxgJPvT+tAzKno3fwjEC4x0NKE2g44qCw0SRzaRHpB0izts3HgfTKUM SihGDhc8yVpFwhz4J3pFK9RuS7nk56CH5uxE2xStiQVxQbkKmXF2DRg1Ei//sZD/dQ7welOe30C Nuw4WbwKoahzAGJZbJaEFIso4KA3EkhOHM45niWpbYJ6Ybtyr0A27bPemWnkI4dPmker+T1FR+j VEngSH1iyw1yBtqeVe4Vcq9eZCW93un2x+uLwA0J6lUHd2y2BW36T1rAl5Jmw/QeaO8s71uzB3n W6lRwEweXnGgZDuCrpF0LK6vwXgXm6sM3p9/3Jl1Qp7eLWa4
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
 drivers/rtc/rtc-max77686.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index b0250d91fb00..35a6021d9ba4 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -806,14 +806,12 @@ static int max77686_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int max77686_rtc_remove(struct platform_device *pdev)
+static void max77686_rtc_remove(struct platform_device *pdev)
 {
 	struct max77686_rtc_info *info = platform_get_drvdata(pdev);
 
 	free_irq(info->virq, info);
 	regmap_del_irq_chip(info->rtc_irq, info->rtc_irq_data);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -877,7 +875,7 @@ static struct platform_driver max77686_rtc_driver = {
 		.pm	= &max77686_rtc_pm_ops,
 	},
 	.probe		= max77686_rtc_probe,
-	.remove		= max77686_rtc_remove,
+	.remove_new	= max77686_rtc_remove,
 	.id_table	= rtc_id,
 };
 
-- 
2.39.1


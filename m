Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678AD6AAA29
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjCDNc2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjCDNcZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3103212B7
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:00 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0000cX-LZ; Sat, 04 Mar 2023 14:30:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-001nZY-MJ; Sat, 04 Mar 2023 14:30:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-0027GY-FU; Sat, 04 Mar 2023 14:30:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 06/41] rtc: at91sam9: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:53 +0100
Message-Id: <20230304133028.2135435-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8HAEr589CFLayBy7V1rBVUbGnZz8AnZOVhx7yW0ta+Y=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0d5JGRdSGd/uhKJJGImXWVmm2DNJj6g6lFZb ESgu8glTNiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHeQAKCRDB/BR4rcrs Ce8rB/wLPYeQeivN7Zvqk0MxRon++wBH0HmJzeaFLeF9Z+o8BzzPMoLLuemKRvOnN+1tasw3w2+ 4PnKoFcfJhuDom/FfQYZlpFFNylP44hU4FH3qSZKANbaF6K+TDSqQrXA1BaUvQ0qZ4ATjgKEvvY RI/dYkab+dcqALdfhcQk3Okuzju0FZZkhGTBJjFG9HIn1mZE7J665smqN/3waZXRsZ+Ea02ZwNB JuiihEnJb6yLBYJwjqxVAgvgCM1vNRM5X5RfITJrBdNkbXDNWLTFnMohYGIivfaO6rAvT1FQyNt XX94kpyv2+MwE5vCE0Ka6PBwuERdSlg4zI4C+u6TCuTqIO5l
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
 drivers/rtc/rtc-at91sam9.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index b7b5ea1a4e67..610f27dfc462 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -442,7 +442,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 /*
  * Disable and remove the RTC driver
  */
-static int at91_rtc_remove(struct platform_device *pdev)
+static void at91_rtc_remove(struct platform_device *pdev)
 {
 	struct sam9_rtc	*rtc = platform_get_drvdata(pdev);
 	u32		mr = rtt_readl(rtc, MR);
@@ -451,8 +451,6 @@ static int at91_rtc_remove(struct platform_device *pdev)
 	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
 
 	clk_disable_unprepare(rtc->sclk);
-
-	return 0;
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
@@ -531,7 +529,7 @@ MODULE_DEVICE_TABLE(of, at91_rtc_dt_ids);
 
 static struct platform_driver at91_rtc_driver = {
 	.probe		= at91_rtc_probe,
-	.remove		= at91_rtc_remove,
+	.remove_new	= at91_rtc_remove,
 	.shutdown	= at91_rtc_shutdown,
 	.driver		= {
 		.name	= "rtc-at91sam9",
-- 
2.39.1


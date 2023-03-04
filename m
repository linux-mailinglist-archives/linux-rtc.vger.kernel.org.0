Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67986AAA39
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjCDNcl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjCDNck (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67BF1F5D9
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyL-0000r9-6p; Sat, 04 Mar 2023 14:30:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-001nbN-Uv; Sat, 04 Mar 2023 14:30:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0027I3-Jr; Sat, 04 Mar 2023 14:30:46 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 29/41] rtc: s3c: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:16 +0100
Message-Id: <20230304133028.2135435-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=w3B4319S7U46/rOh/AueV7KdRYwPtSdh4WpNqHImzko=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQwux+VCX7Yn+PcX21n+NQuVKtQqrvq5+5gzW9znMOvJ Nm23PrQyWjMwsDIxSArpshSV6QlNkFizX+7kiXcMINYmUCmMHBxCsBETk7kYGj0rY8+fidnvpDr /25d/Wfz3feuln0ZVxvke9JNcN69p/8031XO0t+T0csx6c1Cv1wLP/Zoj7q7UWxCshcdzYImcOa 6mrj+SEk0U9zuxss77dB6p+PTPbyfPeayF9C6dqXnQ0wbZ/tdZ+lb9zjffZJVCH15yv+7s3LbHb /2mVXL5y6++o5ZOLCfxa70WVfiy/66Qz6Wkk4SsmGFOv/um/Pw3X3r9Hn6P7XpE0o3aa7TZ793p fHrY70A2SNGu7+//X0sq/xY6Jeq6Qf/7PXSVBb2nmb19U7L/mWy5/liz0tcNZp/R6iwxcr1+bEl /yuNbjPV9PgazbCP1czI15jtlPSvpsl6eWBZlSe/e3EYAA==
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
 drivers/rtc/rtc-s3c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 8fc5efde3e0b..70e1a18e5efd 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -385,7 +385,7 @@ static void s3c6410_rtc_disable(struct s3c_rtc *info)
 	writew(con, info->base + S3C2410_RTCCON);
 }
 
-static int s3c_rtc_remove(struct platform_device *pdev)
+static void s3c_rtc_remove(struct platform_device *pdev)
 {
 	struct s3c_rtc *info = platform_get_drvdata(pdev);
 
@@ -394,8 +394,6 @@ static int s3c_rtc_remove(struct platform_device *pdev)
 	if (info->data->needs_src_clk)
 		clk_unprepare(info->rtc_src_clk);
 	clk_unprepare(info->rtc_clk);
-
-	return 0;
 }
 
 static int s3c_rtc_probe(struct platform_device *pdev)
@@ -600,7 +598,7 @@ MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
 
 static struct platform_driver s3c_rtc_driver = {
 	.probe		= s3c_rtc_probe,
-	.remove		= s3c_rtc_remove,
+	.remove_new	= s3c_rtc_remove,
 	.driver		= {
 		.name	= "s3c-rtc",
 		.pm	= &s3c_rtc_pm_ops,
-- 
2.39.1


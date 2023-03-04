Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 282436AAA24
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjCDNc0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjCDNcX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1FD211FF
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyM-0000xd-Mk; Sat, 04 Mar 2023 14:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyL-001nbr-2k; Sat, 04 Mar 2023 14:30:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0027IY-1M; Sat, 04 Mar 2023 14:30:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 37/41] rtc: twl: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:24 +0100
Message-Id: <20230304133028.2135435-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vD7lH5f0W6vSdLS2Xd8u54BNBcIIgWI8ewZwLMQ89sA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fgfJynnDixzvP4f+gWew5IKpO0kbOr0MZO8 EuVM1Qrvq2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH4AAKCRDB/BR4rcrs CcxoCACZQIOc424Ae2UbsS4PtlS9ImeXpwhqhd1xXuE2PGDOV+JjTCjJ2QQZgNmereaMWn8WXHl skzPDGYmizWvtK7VcZTR1U1Y0+gy8te1OcfHUbo7NlS9tAEc9Jf/gv6LBQ9AfUSDYbUG+QQbS9g uTBEqeBjO1wpD0NWBazv9nAf5lCMZAclSCnYJAuCom5X/Vdcd6qWakb7qbjKMC36pZ987gPLebs EujYdc+M2pzZjd1/6sh/JPxRyO8e3A8/JoJtQGsUcjBBVpFdHxNmVB7j3NQeW4zO2qOnxudnuFK DodTqBsfRJnUjJPRr6m7RjCwJXCzCu14b6BJWK2FcKxHLo75
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
 drivers/rtc/rtc-twl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index c24d1e18f56c..81b36948c2fa 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -586,7 +586,7 @@ static int twl_rtc_probe(struct platform_device *pdev)
  * Disable all TWL RTC module interrupts.
  * Sets status flag to free.
  */
-static int twl_rtc_remove(struct platform_device *pdev)
+static void twl_rtc_remove(struct platform_device *pdev)
 {
 	struct twl_rtc *twl_rtc = platform_get_drvdata(pdev);
 
@@ -599,8 +599,6 @@ static int twl_rtc_remove(struct platform_device *pdev)
 		twl6030_interrupt_mask(TWL6030_RTC_INT_MASK,
 			REG_INT_MSK_STS_A);
 	}
-
-	return 0;
 }
 
 static void twl_rtc_shutdown(struct platform_device *pdev)
@@ -642,7 +640,7 @@ MODULE_DEVICE_TABLE(of, twl_rtc_of_match);
 
 static struct platform_driver twl4030rtc_driver = {
 	.probe		= twl_rtc_probe,
-	.remove		= twl_rtc_remove,
+	.remove_new	= twl_rtc_remove,
 	.shutdown	= twl_rtc_shutdown,
 	.driver		= {
 		.name		= "twl_rtc",
-- 
2.39.1


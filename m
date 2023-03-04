Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE1F6AAA2B
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjCDNc3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjCDNcZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89D61BAEC
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:01 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyM-0000wt-JO; Sat, 04 Mar 2023 14:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-001nbe-UO; Sat, 04 Mar 2023 14:30:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-0027IT-SJ; Sat, 04 Mar 2023 14:30:47 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 36/41] rtc: tps6586x: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:23 +0100
Message-Id: <20230304133028.2135435-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NhyZ9biLfPkzDEDPTZaeZnCsLOvZTaql0nqqo7Ryc4k=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fc7zM/poKLsY6+feJ3i6GusNe6bfYSQmYYa mp0mkwl+nSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH3AAKCRDB/BR4rcrs CX3hCACDnidkeMJb0NWRqjPCAJuDebGMb7G8VZI0BGk36A3p86HSKqyrNfSEwsMhf8GBDFnVvaF ugzWdyAR5VE/rr+8qEJK9o2zBTwvwPQl0u97VTBc1b1BpYd7MC+1utiODUSa9rmCXnAKxPD0rIK /tYY2dHUD7Y+NgTpsq/bWlERZR8lvs4VS2mTFMzT8u8rTGrGbwBY7JyAawU/uX9uJE0nifVL55B XxZBrEz1vY2jAGuc+92hY67049GuCyrgRjZAdurgy1k3cGja5FDxEGk7rWeQ8H5Tv4J1fNtQxYD ZsychHMQwEedhrJyOc+QkCDfKMlNik5x6VD67uuy2dlu3a0X
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
 drivers/rtc/rtc-tps6586x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index 52093e7ba22d..9f14e2475747 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -279,13 +279,12 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 	return ret;
 };
 
-static int tps6586x_rtc_remove(struct platform_device *pdev)
+static void tps6586x_rtc_remove(struct platform_device *pdev)
 {
 	struct device *tps_dev = to_tps6586x_dev(&pdev->dev);
 
 	tps6586x_update(tps_dev, RTC_CTRL, 0,
 		RTC_ENABLE | OSC_SRC_SEL | PRE_BYPASS | CL_SEL_MASK);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -317,7 +316,7 @@ static struct platform_driver tps6586x_rtc_driver = {
 		.pm	= &tps6586x_pm_ops,
 	},
 	.probe	= tps6586x_rtc_probe,
-	.remove	= tps6586x_rtc_remove,
+	.remove_new = tps6586x_rtc_remove,
 };
 module_platform_driver(tps6586x_rtc_driver);
 
-- 
2.39.1


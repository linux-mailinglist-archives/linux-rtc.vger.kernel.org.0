Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECD246AAA21
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjCDNcZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjCDNcW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3842055B
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-0000cy-76; Sat, 04 Mar 2023 14:30:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-001nZp-BO; Sat, 04 Mar 2023 14:30:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-0027Gv-G6; Sat, 04 Mar 2023 14:30:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 12/41] rtc: ftrtc010: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:59 +0100
Message-Id: <20230304133028.2135435-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xBHg3706x1HPwRbGT26FLF7Zze/aj3U7BcO/vZb21QM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0eNxqjC/rXFqS8oJcLXAwetXKDiwM7t3BtAM ENYdu3n0/+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHjQAKCRDB/BR4rcrs CWbQB/44+4sHXgQNQ3mijaIdkEZTLX5E9DbbvBeGw1YtJJbJfnfgh7IIWBrcEcyPDMz0Dihfd4B doz2bszzOoKQS7Tnzi/kx2Rgq8kJ++gbCASROusoJ4WZc62HEsAQFc1rlPiFoGF6cBHEAQNbAKE lFQEgrDCJ8h2IIioVh8WN5BItgtlyz5lnz7SB0zubA3NJXNeesi1kuOSLeVvR78gGfx9Wmdv+TY RHnaBVmUbLWDh8G1fUyMtbLXfc10Q7eQYJwbp6bDKf+rwUtV0+I30oKjgvy/lU3VvxBQDkXWCe/ FCNgLuM4Yb+l03cbXfXuqCYxVwTImlhaeyrDDlY12/LNRYky
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
 drivers/rtc/rtc-ftrtc010.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index 25c6e7d9570f..8bfe7378f653 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -191,7 +191,7 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ftrtc010_rtc_remove(struct platform_device *pdev)
+static void ftrtc010_rtc_remove(struct platform_device *pdev)
 {
 	struct ftrtc010_rtc *rtc = platform_get_drvdata(pdev);
 
@@ -199,8 +199,6 @@ static int ftrtc010_rtc_remove(struct platform_device *pdev)
 		clk_disable_unprepare(rtc->extclk);
 	if (!IS_ERR(rtc->pclk))
 		clk_disable_unprepare(rtc->pclk);
-
-	return 0;
 }
 
 static const struct of_device_id ftrtc010_rtc_dt_match[] = {
@@ -216,7 +214,7 @@ static struct platform_driver ftrtc010_rtc_driver = {
 		.of_match_table = ftrtc010_rtc_dt_match,
 	},
 	.probe		= ftrtc010_rtc_probe,
-	.remove		= ftrtc010_rtc_remove,
+	.remove_new	= ftrtc010_rtc_remove,
 };
 
 module_platform_driver_probe(ftrtc010_rtc_driver, ftrtc010_rtc_probe);
-- 
2.39.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 323236AAA2A
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjCDNc3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjCDNcZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4384C22031
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:01 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyM-0000uw-50; Sat, 04 Mar 2023 14:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-001nbW-Hf; Sat, 04 Mar 2023 14:30:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-0027IM-Hg; Sat, 04 Mar 2023 14:30:47 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Vincent Shih <vincent.sunplus@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 34/41] rtc: sunplus: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:21 +0100
Message-Id: <20230304133028.2135435-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yP5E+JjRB7KwJOV369JtuPd61Qrxq7EV7O4w2cpOIQ4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fWbunhewV2pXPmM9M0M4h27iZV6s7gT3bJA QvIlJsJsyGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH1gAKCRDB/BR4rcrs CcnKB/483puTHUnVwn3UQri2jeeRwXogbPA267SSqeiyvdtdK9tNVGnbzSqw7Qm3+9L3Yq4FYKl Y5KutHKj34PWt07DTGRAIzzwCcel3f8dMyhrFsjqjAwoz95doyWXFOL0vD4lbeh5MmSn0h/ssg0 Hf5aaoQgo5hIpj3TekpAGZd6koFrFY5Rxei/q7GyTVbbYmVXwt0fOqJvQx2qwurCXdXPPK0ZjuI hL3g6gUgNVL4bS1/0UEOUZhgRpw1pXS3EqYTQ02au8swi9VxOtKghAPsAb4ip8vYt8lEWT/u4tP MlbT1xK40RLDVog4NeIegDMKsISaxJyYqLUh7L92tPZ1FaXD
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
 drivers/rtc/rtc-sunplus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-sunplus.c b/drivers/rtc/rtc-sunplus.c
index 4b578e4d44f6..44b8083603c2 100644
--- a/drivers/rtc/rtc-sunplus.c
+++ b/drivers/rtc/rtc-sunplus.c
@@ -304,15 +304,13 @@ static int sp_rtc_probe(struct platform_device *plat_dev)
 	return ret;
 }
 
-static int sp_rtc_remove(struct platform_device *plat_dev)
+static void sp_rtc_remove(struct platform_device *plat_dev)
 {
 	struct sunplus_rtc *sp_rtc = dev_get_drvdata(&plat_dev->dev);
 
 	device_init_wakeup(&plat_dev->dev, 0);
 	reset_control_assert(sp_rtc->rstc);
 	clk_disable_unprepare(sp_rtc->rtcclk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -347,7 +345,7 @@ static SIMPLE_DEV_PM_OPS(sp_rtc_pm_ops, sp_rtc_suspend, sp_rtc_resume);
 
 static struct platform_driver sp_rtc_driver = {
 	.probe   = sp_rtc_probe,
-	.remove  = sp_rtc_remove,
+	.remove_new = sp_rtc_remove,
 	.driver  = {
 		.name	= "sp7021-rtc",
 		.of_match_table = sp_rtc_of_match,
-- 
2.39.1


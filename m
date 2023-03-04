Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450076AAA1D
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjCDNcW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjCDNcU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7D3976C
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:55 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0000oc-Nt; Sat, 04 Mar 2023 14:30:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-001nbB-O5; Sat, 04 Mar 2023 14:30:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0027I6-Q8; Sat, 04 Mar 2023 14:30:46 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 30/41] rtc: sa1100: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:17 +0100
Message-Id: <20230304133028.2135435-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wfMuUZHDWf+5gDhFJkx25lUsempNclHDnDNmMiE2fbQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fJiVKpnCxEIW0DUGkif3PehHX9TOxZ9BAN9 EZSexjwGkCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHyQAKCRDB/BR4rcrs CWboB/9Qp1NZL1UkmtpqzN7OTt0ElMezM9ACSskkruaIBO8aStHWInYO6eebWoHzLqiPUpnFO7v rI/QEmgm03sxn0cZ/F5M5d6tWUhnQUNiHgru5dkTfVK+PAZCLtodyVQCgUokyDyaE+/l5DzM1mc CT9aku+hxxQGGuJ4cbZjzu+f8BfYbBpRxPHb4zD8AyYqnARW+JGzG2UIVYEEoa33APVZihuVI5J N9A1RwUWuilFMPzAth1guh+hdfHlNUW2gvxlsqgrtMaiDdUhjhypXDgckUzhoQPatRyvpZfzlkJ 96SCTvQPllTlW6GpiajakWAan9jeKdpnu2P2uPymeCYzrF0B
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
 drivers/rtc/rtc-sa1100.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 1250887e4382..0b2cfa8ca05b 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -297,7 +297,7 @@ static int sa1100_rtc_probe(struct platform_device *pdev)
 	return sa1100_rtc_init(pdev, info);
 }
 
-static int sa1100_rtc_remove(struct platform_device *pdev)
+static void sa1100_rtc_remove(struct platform_device *pdev)
 {
 	struct sa1100_rtc *info = platform_get_drvdata(pdev);
 
@@ -307,8 +307,6 @@ static int sa1100_rtc_remove(struct platform_device *pdev)
 		spin_unlock_irq(&info->lock);
 		clk_disable_unprepare(info->clk);
 	}
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -343,7 +341,7 @@ MODULE_DEVICE_TABLE(of, sa1100_rtc_dt_ids);
 
 static struct platform_driver sa1100_rtc_driver = {
 	.probe		= sa1100_rtc_probe,
-	.remove		= sa1100_rtc_remove,
+	.remove_new	= sa1100_rtc_remove,
 	.driver		= {
 		.name	= "sa1100-rtc",
 		.pm	= &sa1100_rtc_pm_ops,
-- 
2.39.1


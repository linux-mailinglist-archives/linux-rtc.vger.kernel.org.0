Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89606AAA33
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjCDNcf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjCDNcc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEEA5B9F
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0000cp-UJ; Sat, 04 Mar 2023 14:30:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-001nZl-64; Sat, 04 Mar 2023 14:30:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-0027Gl-Ve; Sat, 04 Mar 2023 14:30:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 09/41] rtc: cmos: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:56 +0100
Message-Id: <20230304133028.2135435-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CIkJt0H4srMlqC9/ClgXG+aGx9806/Rkb6Xe20oVr8Y=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0eD8sT8yB9FY5SncPp+jaP4bZj2wk9bZG/Ws eySUn9nJ1eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHgwAKCRDB/BR4rcrs CRn8B/9LXo75z14KFtc0/Uf8TFJ3ONlTdxv5M8Gy2qMbdreRydcVVDYgf7NfidnuCp2CIedQ67t vPCAYzSDXb7MFWae5fv2QZ1s05eor40Jo1NfpEjvr6PAL0VwaWUblcPEj3w3WoP48HYcOPHhNL7 6rOSXhDcokVvkHZBzMwSb9DxhaThW/rP7l1IcAb+xcMxIrTSzAkYojjdyeZgM9GhudhrX9l5nyQ zavurbRYzHdfj6TNtFDOLaqCTCpEdYUAuz+Mze3BxZC46GESLr30WMSpPdSK/O80NLsVjqo2kOZ KZAMnIVv57wIHr8WX1POMr6cnI708RqFtgnYSNrigR64Um/X
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
 drivers/rtc/rtc-cmos.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 00e2ca7374ec..c9416fe8542d 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1489,10 +1489,9 @@ static int __init cmos_platform_probe(struct platform_device *pdev)
 	return cmos_do_probe(&pdev->dev, resource, irq);
 }
 
-static int cmos_platform_remove(struct platform_device *pdev)
+static void cmos_platform_remove(struct platform_device *pdev)
 {
 	cmos_do_remove(&pdev->dev);
-	return 0;
 }
 
 static void cmos_platform_shutdown(struct platform_device *pdev)
@@ -1514,7 +1513,7 @@ static void cmos_platform_shutdown(struct platform_device *pdev)
 MODULE_ALIAS("platform:rtc_cmos");
 
 static struct platform_driver cmos_platform_driver = {
-	.remove		= cmos_platform_remove,
+	.remove_new	= cmos_platform_remove,
 	.shutdown	= cmos_platform_shutdown,
 	.driver = {
 		.name		= driver_name,
-- 
2.39.1


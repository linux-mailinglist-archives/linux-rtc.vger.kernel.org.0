Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B2D6AAA47
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjCDNwS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCDNwR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:52:17 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1036AEB7A
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:52:16 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-0000bp-Ly; Sat, 04 Mar 2023 14:30:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-001nZL-0G; Sat, 04 Mar 2023 14:30:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-0027GV-9P; Sat, 04 Mar 2023 14:30:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 05/41] rtc: asm9260: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:52 +0100
Message-Id: <20230304133028.2135435-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hH/9+WJOz9SoOoIpOdGLTZIp6nHwDyAGBdi0fMxveGA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0d2GLrqvAh02DTFg6iUELH9ruHkoMLo4D1ID 0pm5KfHdDiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHdgAKCRDB/BR4rcrs CdQBB/91qtK88ulG/WKhfAG27Jf9e3gEV6ckme2k4MczPVFPofVy/mVp7bnNZwZ2Pv912ZvNd/A TcJDG8RaD2ZmwXcwFNqOEF6VX0szYiDQ0LEPvCDkE2uwo795+f4f5KQWENBI0tw2a1mcahtjO6f XKjEQTHNUvESFHcsUG5h38Sx1lJMd4hxJoTvHyS7quU9qeAghPQ6GHK3YlHtULVrdFtmMUOluvy D2pfl7ykQSSqePaSpnu2fSo6HMlzeF5FcYpblrgBfE0UIp096+EXTlRRXFi00n7Uojuv8E7/mKs u8Ym7By1sTqKwBz4DGeuPOVaECfC1LmJs9CX+BlwoxCt0GrA
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
 drivers/rtc/rtc-asm9260.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index de795e489f71..a83b47e0d8f5 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -308,14 +308,13 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int asm9260_rtc_remove(struct platform_device *pdev)
+static void asm9260_rtc_remove(struct platform_device *pdev)
 {
 	struct asm9260_rtc_priv *priv = platform_get_drvdata(pdev);
 
 	/* Disable alarm matching */
 	iowrite32(BM_AMR_OFF, priv->iobase + HW_AMR);
 	clk_disable_unprepare(priv->clk);
-	return 0;
 }
 
 static const struct of_device_id asm9260_dt_ids[] = {
@@ -326,7 +325,7 @@ MODULE_DEVICE_TABLE(of, asm9260_dt_ids);
 
 static struct platform_driver asm9260_rtc_driver = {
 	.probe		= asm9260_rtc_probe,
-	.remove		= asm9260_rtc_remove,
+	.remove_new	= asm9260_rtc_remove,
 	.driver		= {
 		.name	= "asm9260-rtc",
 		.of_match_table = asm9260_dt_ids,
-- 
2.39.1


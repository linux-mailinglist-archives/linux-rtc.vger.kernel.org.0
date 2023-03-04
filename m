Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF216AAA3D
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjCDNdF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjCDNdE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:33:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E89222E1
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:40 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0000hO-96; Sat, 04 Mar 2023 14:30:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-001naN-Dw; Sat, 04 Mar 2023 14:30:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0027HJ-IO; Sat, 04 Mar 2023 14:30:44 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 18/41] rtc: mpfs: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:05 +0100
Message-Id: <20230304133028.2135435-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rJ+uxoSyVi0xpiSqvOg6XeWDbaaKjouhoP5FXih3Wtk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0egsAdFAfPhlrlhdqgp7TvITrbFGGivWjhvZ VUeadKi8dyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHoAAKCRDB/BR4rcrs CWFkB/9PAeiMZeUCBlKdFMUy/66bIhVxWlTVuqqVtvkYs2HuU4/tCO1iqT6g/XxesAzDaylfLfK ocpOggUXytNG+aC31UrAmNsygKVkfCLTHHd5ENLpKv3SInI7H+u5I4szl7vkHNs504DvKCPHFK8 ICbQSptyQXQExHx0hQDoEA0vQNomTkCEX2uELuNhT+OXpuGMyA2HpMDVqXN0vSY8aW2v8e0+P0P yMIfDMOWF5i9T1lTRutDAHu/zcpH3GefM7OLkEvzflBonbWURFiO2cygxvMlJ4YzdL9K/AuNmNQ EZ0Sj+iIUWNEVpBJT4Ppel61Bg0sltKyMJsKDQcveZPFpczu
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
 drivers/rtc/rtc-mpfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 2a479d44f198..5b96a6d39210 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -274,11 +274,9 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtcdev->rtc);
 }
 
-static int mpfs_rtc_remove(struct platform_device *pdev)
+static void mpfs_rtc_remove(struct platform_device *pdev)
 {
 	dev_pm_clear_wake_irq(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mpfs_rtc_of_match[] = {
@@ -290,7 +288,7 @@ MODULE_DEVICE_TABLE(of, mpfs_rtc_of_match);
 
 static struct platform_driver mpfs_rtc_driver = {
 	.probe = mpfs_rtc_probe,
-	.remove = mpfs_rtc_remove,
+	.remove_new = mpfs_rtc_remove,
 	.driver	= {
 		.name = "mpfs_rtc",
 		.of_match_table = mpfs_rtc_of_match,
-- 
2.39.1


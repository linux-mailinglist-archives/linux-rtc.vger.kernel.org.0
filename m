Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B546AAA1A
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjCDNcU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjCDNcT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52908681
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:53 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0000nU-1D; Sat, 04 Mar 2023 14:30:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-001nb4-Am; Sat, 04 Mar 2023 14:30:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0027Hq-2n; Sat, 04 Mar 2023 14:30:46 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 26/41] rtc: rc5t583: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:13 +0100
Message-Id: <20230304133028.2135435-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ufxXHyuEy47uxtxsZuZzS3EDMaLv1+wDGJjZocsYj98=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0e5w2Kxfv79EFd+OeVj7qJ8PQ5zeG54mZOJu bSMgaI3lGmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHuQAKCRDB/BR4rcrs CY6/CACeDaChJLnn5PpemFd4WMgSLfM76IdzAQR0BNNJqGZMU1efIRYs5XwXi1otrtL3lnAjy+c LHoUS+SHBbcmu+aEQkVboZrSAFaKbhBs3HvL6Yp/Ajthkl1d4qvekF/MUMWnnu+GkkC7SIreHOR m8YXAyqBwmnTeVzvC2ySFXtdK7oF6rSpqgoZy08hlUlyHaWPQ8caogugbQqUL90bOSSwYLIb9zn C3qPmXteHQDsOrrQYuPswYKHAEhsMc6VRgumeMB8xRoPCAc3kNMJcZtdBE3iZZ40ShCcb/Nmsay XDGhGhT8t9YcAf+Koqtni5I8rHdmUdC0/U1Cb26ROAQXPeK0
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
 drivers/rtc/rtc-rc5t583.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rc5t583.c b/drivers/rtc/rtc-rc5t583.c
index 18684a7026c4..6f4bf919827a 100644
--- a/drivers/rtc/rtc-rc5t583.c
+++ b/drivers/rtc/rtc-rc5t583.c
@@ -262,12 +262,11 @@ static int rc5t583_rtc_probe(struct platform_device *pdev)
  * Disable rc5t583 RTC interrupts.
  * Sets status flag to free.
  */
-static int rc5t583_rtc_remove(struct platform_device *pdev)
+static void rc5t583_rtc_remove(struct platform_device *pdev)
 {
 	struct rc5t583_rtc *rc5t583_rtc = platform_get_drvdata(pdev);
 
 	rc5t583_rtc_alarm_irq_enable(&rc5t583_rtc->rtc->dev, 0);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -299,7 +298,7 @@ static SIMPLE_DEV_PM_OPS(rc5t583_rtc_pm_ops, rc5t583_rtc_suspend,
 
 static struct platform_driver rc5t583_rtc_driver = {
 	.probe		= rc5t583_rtc_probe,
-	.remove		= rc5t583_rtc_remove,
+	.remove_new	= rc5t583_rtc_remove,
 	.driver		= {
 		.name	= "rtc-rc5t583",
 		.pm	= &rc5t583_rtc_pm_ops,
-- 
2.39.1


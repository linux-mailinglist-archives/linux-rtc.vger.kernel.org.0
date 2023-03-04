Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D02E6AAA32
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjCDNce (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjCDNcc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C32BBBF
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyN-00010N-5z; Sat, 04 Mar 2023 14:30:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyL-001nc4-Jt; Sat, 04 Mar 2023 14:30:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0027Ic-7J; Sat, 04 Mar 2023 14:30:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 38/41] rtc: vt8500: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:25 +0100
Message-Id: <20230304133028.2135435-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=x76vGHCPBfGOBU5IG0MxwHUFv3gJtXwf2Chx7kfW5jg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fkySNihpiA+E698YL2kL90E0S6+vjPHfGaa hghS/uIyK+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH5AAKCRDB/BR4rcrs CXXxB/97rUXDmA1AaWL2oChBdkSiCSFPUOL6MyLB3GHIDyvRKMeTbTygYp/tano8JmHkZPHFd0c GL9A+SmtPTHiT+f5MDeDzjBvziRscszuvTp50hjsRVb6+n6Zk+M29oeB6pBExyqDWzzpYzdh6C8 2YZm/NCI6cr4BEsz7ewUXfniay03EEnZ+WYB+9EA5Yc+kZ0vXuDFiRurUrhniujphBNGWSBtaG5 TTb9itOEIiRoRCbVKlA+yHJ22zB1EkEZ5cBz6lRq/iXCuGQb5muW9afRIgRZXqExnKIAzyMbe7a dwJS5JC+K5o9/iYi5RZ2dgeRmznTnwMVsZTt+1l75S4EFL63
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
 drivers/rtc/rtc-vt8500.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-vt8500.c b/drivers/rtc/rtc-vt8500.c
index 197b649cd629..ccfa76513a2c 100644
--- a/drivers/rtc/rtc-vt8500.c
+++ b/drivers/rtc/rtc-vt8500.c
@@ -235,14 +235,12 @@ static int vt8500_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(vt8500_rtc->rtc);
 }
 
-static int vt8500_rtc_remove(struct platform_device *pdev)
+static void vt8500_rtc_remove(struct platform_device *pdev)
 {
 	struct vt8500_rtc *vt8500_rtc = platform_get_drvdata(pdev);
 
 	/* Disable alarm matching */
 	writel(0, vt8500_rtc->regbase + VT8500_RTC_IS);
-
-	return 0;
 }
 
 static const struct of_device_id wmt_dt_ids[] = {
@@ -253,7 +251,7 @@ MODULE_DEVICE_TABLE(of, wmt_dt_ids);
 
 static struct platform_driver vt8500_rtc_driver = {
 	.probe		= vt8500_rtc_probe,
-	.remove		= vt8500_rtc_remove,
+	.remove_new	= vt8500_rtc_remove,
 	.driver		= {
 		.name	= "vt8500-rtc",
 		.of_match_table = wmt_dt_ids,
-- 
2.39.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA6F6AAA1C
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjCDNcV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjCDNcT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F8B15CB8
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:53 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0000hC-5L; Sat, 04 Mar 2023 14:30:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-001naE-6l; Sat, 04 Mar 2023 14:30:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0027HF-D6; Sat, 04 Mar 2023 14:30:44 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 17/41] rtc: mpc5121: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:04 +0100
Message-Id: <20230304133028.2135435-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BIwZ7qsZIYQ4oydWWuXQYdmqT5U6tUtDKeCtf6yb/JU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0ecJ1CYYFUUA3aDB9tZb8BSkqtU2u2bW8kq2 nF6zNLQJp6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHnAAKCRDB/BR4rcrs CQOWB/9/jRoZaBOE+QCejFwlxDKFjPzQj1ZXet/73ICOS+91AimI8tQCPmQ3PtR/XEaOFbHcbAu 6F6yaL1SbB0yofsBvE3f233YzBBJ6SfxcjcTMpqMKpuMilS3Dh968T8k1nLPzz8AOgYYFRvewG5 pMgoQfHaXzXXUrL8f7AiV3aMBXE/PK8+13B/anGQABbG8Sba7NHEG0pAr27SDXbMir9pwnToi5J s7LAQR3Zd+zGY3TTY0gFQ1Nt8nGeTRfEAUktv1gKWqgk96MKp30xZoX+ANckylndiCVVL3Kux8t /8gQwi1B7GIqtpOP9nVbKBBzwl44+ZIkAoBQ6GgxNORYccqW
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
 drivers/rtc/rtc-mpc5121.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 6d7656a75cae..07df43e4c4d0 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -372,7 +372,7 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 	return err;
 }
 
-static int mpc5121_rtc_remove(struct platform_device *op)
+static void mpc5121_rtc_remove(struct platform_device *op)
 {
 	struct mpc5121_rtc_data *rtc = platform_get_drvdata(op);
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
@@ -383,8 +383,6 @@ static int mpc5121_rtc_remove(struct platform_device *op)
 
 	irq_dispose_mapping(rtc->irq);
 	irq_dispose_mapping(rtc->irq_periodic);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -402,7 +400,7 @@ static struct platform_driver mpc5121_rtc_driver = {
 		.of_match_table = of_match_ptr(mpc5121_rtc_match),
 	},
 	.probe = mpc5121_rtc_probe,
-	.remove = mpc5121_rtc_remove,
+	.remove_new = mpc5121_rtc_remove,
 };
 
 module_platform_driver(mpc5121_rtc_driver);
-- 
2.39.1


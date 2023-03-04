Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292086AAA4A
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjCDNw2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjCDNw1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:52:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B3CEC56
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:52:27 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-0000nC-Qn; Sat, 04 Mar 2023 14:30:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-001nb0-5d; Sat, 04 Mar 2023 14:30:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-0027Hf-H1; Sat, 04 Mar 2023 14:30:45 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 23/41] rtc: pcf50633: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:10 +0100
Message-Id: <20230304133028.2135435-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ZA4AU2ucwbDimVZU/S8rn6cSCR5fjnwKwoFRSiJ7cwY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0evLCBW2NKGHTsOsBiz5Ao73pqrzJZbJbrG0 jyMj/E/nd6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHrwAKCRDB/BR4rcrs CeOiB/98gRkbKQI+oGu/2n1/3ZNOT0x9knmSiewk8OSorWY0Qvy8lR9jSyf4Y82wyQ9ZhaIU1cO zo3D0DInuwIgZB6rFaKy1z5CL+SXR2KZAVLEBMulYERt68lL007t0xsEAloW/v3k8IYHgzzzuoM o9k7ZyZP+vewG8YqpT/oDnvDP3Kw+Y/xo1kHflMZSGn31Q/PI4KhBn3yWUmTP9NTj8EgT25XnG0 qP6kqgvXVZ5uqSSFCUefVbNe2zlknRGkeiVunUbZPg0WctcpHxWP4srCiQVQ12ThSEx6PppY0PT mb7H3C/962M3kgcUtBczNQ28YAFukunQrXGPf/2HmFFUJGVd
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
 drivers/rtc/rtc-pcf50633.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf50633.c b/drivers/rtc/rtc-pcf50633.c
index 48951a16d65d..23edd11aa40c 100644
--- a/drivers/rtc/rtc-pcf50633.c
+++ b/drivers/rtc/rtc-pcf50633.c
@@ -260,14 +260,12 @@ static int pcf50633_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pcf50633_rtc_remove(struct platform_device *pdev)
+static void pcf50633_rtc_remove(struct platform_device *pdev)
 {
 	struct pcf50633_rtc *rtc;
 
 	rtc = platform_get_drvdata(pdev);
 	pcf50633_free_irq(rtc->pcf, PCF50633_IRQ_ALARM);
-
-	return 0;
 }
 
 static struct platform_driver pcf50633_rtc_driver = {
@@ -275,7 +273,7 @@ static struct platform_driver pcf50633_rtc_driver = {
 		.name = "pcf50633-rtc",
 	},
 	.probe = pcf50633_rtc_probe,
-	.remove = pcf50633_rtc_remove,
+	.remove_new = pcf50633_rtc_remove,
 };
 
 module_platform_driver(pcf50633_rtc_driver);
-- 
2.39.1


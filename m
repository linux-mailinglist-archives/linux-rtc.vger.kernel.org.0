Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A846AAA34
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjCDNch (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjCDNcg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EAF1EBE5
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:12 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-0000bj-EV; Sat, 04 Mar 2023 14:30:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-001nZA-Ie; Sat, 04 Mar 2023 14:30:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyD-0027GL-Q0; Sat, 04 Mar 2023 14:30:41 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 02/41] rtc: 88pm860x: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:49 +0100
Message-Id: <20230304133028.2135435-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=pLuKA0Vy2a9dbg3mKwLLNSY79uAuu25kBaAHyl0tESw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0dt6+KuDKo/OqkO9OXomyVXvi2WFASZj/CdH XltM7v9qQGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHbQAKCRDB/BR4rcrs CeA3B/9qaIFhLfD2bNj4VN2DD4Mg9uRjJ9b4l6rPQuUWgxbyRCJVjWB2m9C8B1FiWNzjPHfhAln bEss7FTuqoo49yXQNdOAG7PCG2XzBCRb/eXKZxbFMMMccora/EBUvOU69b51rHV2WQzMbFDbTt+ u3v5i1KlNRcsLDiWpAXSrs3olG/B5h5AV4IoMBAZos24W0tfMxdGROqVXUVH3snrWw6BETVcQlS 1z97YWncWRjCYoo91g7KrHQCTOyBIxpEAxgeMoAz/dzpUbJkktir+QqgJLuSRLXbUhH4ocJDN23 y4M5KQGw/Iq9a3A04OpBj8c//LlhzicVkZEP64ftZSVBDwYh
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
 drivers/rtc/rtc-88pm860x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index 2c809a1a445e..0f124ed5b3e5 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -331,7 +331,7 @@ static int pm860x_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pm860x_rtc_remove(struct platform_device *pdev)
+static void pm860x_rtc_remove(struct platform_device *pdev)
 {
 	struct pm860x_rtc_info *info = platform_get_drvdata(pdev);
 
@@ -340,8 +340,6 @@ static int pm860x_rtc_remove(struct platform_device *pdev)
 	/* disable measurement */
 	pm860x_set_bits(info->i2c, PM8607_MEAS_EN2, MEAS2_VRTC, 0);
 #endif	/* VRTC_CALIBRATION */
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -373,7 +371,7 @@ static struct platform_driver pm860x_rtc_driver = {
 		.pm	= &pm860x_rtc_pm_ops,
 	},
 	.probe		= pm860x_rtc_probe,
-	.remove		= pm860x_rtc_remove,
+	.remove_new	= pm860x_rtc_remove,
 };
 
 module_platform_driver(pm860x_rtc_driver);
-- 
2.39.1


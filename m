Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D306AAA27
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjCDNc1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjCDNcY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA04A212B3
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:59 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyM-0000v3-82; Sat, 04 Mar 2023 14:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-001nbV-IK; Sat, 04 Mar 2023 14:30:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-0027II-B9; Sat, 04 Mar 2023 14:30:47 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 33/41] rtc: stmp3xxx: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:20 +0100
Message-Id: <20230304133028.2135435-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1780; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qu1Wb2WQcVjfZBiUnowOxu6XKSmq8kIXTaVeur0cljk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fTKOS3opN+kqbq5GCVypqgpY5TfQ9SP/Fd2 AWSynmPUBaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH0wAKCRDB/BR4rcrs CVCTB/9DbBNnuh450yNpockNp/1vKu95EDn9LMVE2DFusOqqchP6H59J+gy2CRGNxO2NeoLhOh/ 9nnDHRDIXT1b6qNyYhIUPhMoCVGmY+PJaqB7KuaUg6sXfw+5/jowk+bd9JhDN6hr2JddMx2xkgN nQ45Z/WY8eiICqx5d5i1t+FxKvHBBJNst2OggxM0yTabz3tSp8x5w+gAK3ThYB7p5PZJOAs054n M2Q7GMbkmZEV1aT1zC3jXSieKW7T00o8VBuZOqGjw4XAm1d8ZfATT53VO8wYJEdmVGTUiH1Uf5S QE+kk7fD78z7cHx3//T/wureWucelKT/zfWsksCxvwOhA3NH
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
 drivers/rtc/rtc-stmp3xxx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index aae40d20d086..6f11b745f34d 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -232,17 +232,15 @@ static const struct rtc_class_ops stmp3xxx_rtc_ops = {
 	.set_alarm	= stmp3xxx_rtc_set_alarm,
 };
 
-static int stmp3xxx_rtc_remove(struct platform_device *pdev)
+static void stmp3xxx_rtc_remove(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data = platform_get_drvdata(pdev);
 
 	if (!rtc_data)
-		return 0;
+		return;
 
 	writel(STMP3XXX_RTC_CTRL_ALARM_IRQ_EN,
 		rtc_data->io + STMP3XXX_RTC_CTRL + STMP_OFFSET_REG_CLR);
-
-	return 0;
 }
 
 static int stmp3xxx_rtc_probe(struct platform_device *pdev)
@@ -406,7 +404,7 @@ MODULE_DEVICE_TABLE(of, rtc_dt_ids);
 
 static struct platform_driver stmp3xxx_rtcdrv = {
 	.probe		= stmp3xxx_rtc_probe,
-	.remove		= stmp3xxx_rtc_remove,
+	.remove_new	= stmp3xxx_rtc_remove,
 	.driver		= {
 		.name	= "stmp3xxx-rtc",
 		.pm	= &stmp3xxx_rtc_pm_ops,
-- 
2.39.1


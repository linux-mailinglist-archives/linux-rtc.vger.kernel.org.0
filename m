Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16C936AAA3B
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjCDNdC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:33:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjCDNdB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:33:01 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8612103
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:37 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-0000cR-6h; Sat, 04 Mar 2023 14:30:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-001nZR-E9; Sat, 04 Mar 2023 14:30:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-0027Gc-LH; Sat, 04 Mar 2023 14:30:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 07/41] rtc: brcmstb-waketimer: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:54 +0100
Message-Id: <20230304133028.2135435-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kjnGxqhjIgsGsOQPNMPsXzzsfJnNj8qIf9vPEfGlAz4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0d947p8DBpXn/pK0tti7SJKgxZ9DmxMyGw3w bQgV7OG7XqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHfQAKCRDB/BR4rcrs CURCCACEryE1N+xpB8+OqK4+/0aE2fcqZkCD+Y9m1QobmlFGi6tjWvcY2mKzGNPtd9EdopHvzNh 6ZbFmPjfQXjt/DckQmES5vpVXym7o9Bu0QFvofLc6AwgSFGemGd5tukSmRdbMiM+FmSJgAMxSG7 yWyVVoWQL+nm2yOcI/AxZDo83RtJwg4I4NCWGuIrcvOsvki6Cf7WCTxanlStpNOXrZLF5WKEm9C aCLTfCY4Hu1vzbHviCzWx9tKB6mVk6DkzKK1gsQIcd7mW6zvEWhRCVfnIwQrtFTOgbYkh5TZvnF 3DkS9AxdPQJ6OXNM/VD1QP96lvO3UVjIdOUXTISYay/t65Io
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
 drivers/rtc/rtc-brcmstb-waketimer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index 1efa81cecc27..3cdc015692ca 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -336,14 +336,12 @@ static int brcmstb_waketmr_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int brcmstb_waketmr_remove(struct platform_device *pdev)
+static void brcmstb_waketmr_remove(struct platform_device *pdev)
 {
 	struct brcmstb_waketmr *timer = dev_get_drvdata(&pdev->dev);
 
 	unregister_reboot_notifier(&timer->reboot_notifier);
 	clk_disable_unprepare(timer->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -382,7 +380,7 @@ static const __maybe_unused struct of_device_id brcmstb_waketmr_of_match[] = {
 
 static struct platform_driver brcmstb_waketmr_driver = {
 	.probe			= brcmstb_waketmr_probe,
-	.remove			= brcmstb_waketmr_remove,
+	.remove_new		= brcmstb_waketmr_remove,
 	.driver = {
 		.name		= "brcmstb-waketimer",
 		.pm		= &brcmstb_waketmr_pm_ops,
-- 
2.39.1


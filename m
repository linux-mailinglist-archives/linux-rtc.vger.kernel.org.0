Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9745756A700
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Jul 2022 17:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbiGGPcK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Jul 2022 11:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235526AbiGGPcJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Jul 2022 11:32:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289D130F4F
        for <linux-rtc@vger.kernel.org>; Thu,  7 Jul 2022 08:32:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o9TU3-000658-MR; Thu, 07 Jul 2022 17:32:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o9TTx-004yuB-Rg; Thu, 07 Jul 2022 17:32:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o9TU0-003b2C-Om; Thu, 07 Jul 2022 17:32:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benson Leung <bleung@chromium.org>
Cc:     Guenter Roeck <groeck@chromium.org>, linux-rtc@vger.kernel.org,
        chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH] rtc: cros-ec: Only warn once in .remove() about notifier_chain problems
Date:   Thu,  7 Jul 2022 17:31:56 +0200
Message-Id: <20220707153156.214841-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; h=from:subject; bh=rKlwaawf2TlbOMr0njWGxr8U8gq80b14nj+ASRlyR14=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBixvxpDW5qORKcLum5IH306Unj54IwAR+G15wc1Kg8 BjgGeHKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsb8aQAKCRDB/BR4rcrsCTdKB/ 4in8/w/fLsSW+nXGzJK7HFCBFcWaoZh0W1TsJCXGP3PA2k0amZLhqggucPgpL0Dve5fpTepE1BBezd go1DI4icruIdDymSwIbkEMn6QS5zB5dTAohbwCaXeEIJCPoxbpwxH0ZB67RRh7g6r40KyVItuKVtI6 Wa/Q4Slp/tjJoh1/34KffSDYlwzWnNGq02TSzMHl2pHOth7vFzbFbDS8iacDhP2G93kTRxOpjrSzuG 4xWFgP32C5AD4C8cAcvYLpzEMtd1txW5LJnkjfWjEAaSrHpyAeywnZcYVQtyp7RuieInm+oWuRZZkd LVyC0Ue8D96gEN9tOlSp6xuVETK88a
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When a remove platform device callback returns an error code, the driver
core emits an error message ("remove callback returned a non-zero value.
This will be ignored.\n") and still removes the device. As the driver
already emits a more specific error message, return 0 to suppress the
core's error message.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-cros-ec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 70626793ca69..887f5193e253 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -375,10 +375,8 @@ static int cros_ec_rtc_remove(struct platform_device *pdev)
 	ret = blocking_notifier_chain_unregister(
 				&cros_ec_rtc->cros_ec->event_notifier,
 				&cros_ec_rtc->notifier);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "failed to unregister notifier\n");
-		return ret;
-	}
 
 	return 0;
 }

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1


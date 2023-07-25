Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39C6A760B1E
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jul 2023 09:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbjGYHFG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Jul 2023 03:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjGYHEs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Jul 2023 03:04:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0FD1BCF
        for <linux-rtc@vger.kernel.org>; Tue, 25 Jul 2023 00:04:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOC60-0001Qj-Ux; Tue, 25 Jul 2023 09:04:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOC5y-001we4-W3; Tue, 25 Jul 2023 09:04:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOC5y-007bT5-35; Tue, 25 Jul 2023 09:04:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, David Daney <david.daney@cavium.com>
Subject: [PATCH] rtc: isl12026: Drop "_new" from probe callback name
Date:   Tue, 25 Jul 2023 09:04:29 +0200
Message-Id: <20230725070429.383070-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fcb/usEhyyXaXF0cfexvvkkfklJnjOGiXG6GCBayAGU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkv3P8lIJQZv5zd1R428xmKLgNFGWt5qqLmvpgk a3QRANVtRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZL9z/AAKCRCPgPtYfRL+ ThjjB/4o+S8VBKdKkiF/j1XZHksUauh4tlI+wbLpluU/31pZx/E4kqBJmepaAjYhQGE1jL8lQdx b4xdG8aJRVXLBEKxO8bFAXcbWj2sKm3NqRTz4MmBALsnniQ5DXA/bKCvvHVBvjnzE6Bnb9sPaqE gY1pQhSM0DevdSTkbnFwaHzrprZ90S/pXgCMrqNnQhzFP8h+ct8zjlh3/Ykn13wGPGsnELfxJta xm7dLstJ/WlyHnJyHjpECHvHfpO2dkX7ceX0YHPo7L8F/M726xpFaVEg1JHkSDZICkp3VpBX6w2 D7GDP2/Z2sKErTK5TqyePGYG8RxVFxImP32ehFce2YHoycj5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver was introduced when .probe_new was the right probe callback
to use for i2c drivers. Today .probe is the right one (again) and the
driver was already switched in commit 31b0cecb4042 ("rtc: Switch i2c
drivers back to use .probe()") but the name continued to include "_new"
in its name.

To prevent code readers wondering about what might be new here, drop
that irritating part of the name.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-isl12026.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 5abff5d348ac..634f4e7ee8aa 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -429,7 +429,7 @@ static void isl12026_force_power_modes(struct i2c_client *client)
 	}
 }
 
-static int isl12026_probe_new(struct i2c_client *client)
+static int isl12026_probe(struct i2c_client *client)
 {
 	struct isl12026 *priv;
 	int ret;
@@ -490,7 +490,7 @@ static struct i2c_driver isl12026_driver = {
 		.name	= "rtc-isl12026",
 		.of_match_table = isl12026_dt_match,
 	},
-	.probe		= isl12026_probe_new,
+	.probe		= isl12026_probe,
 	.remove		= isl12026_remove,
 };
 

base-commit: 31b0cecb4042d2676fd48f09379a19bc8b16eadd
-- 
2.39.2


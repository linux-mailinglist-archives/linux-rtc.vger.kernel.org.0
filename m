Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C22E6077CB
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiJUNIj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiJUNIe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDD826C47F
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk5-0001XW-3D; Fri, 21 Oct 2022 15:07:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk2-000Wlf-5j; Fri, 21 Oct 2022 15:07:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk3-009Z8W-Kq; Fri, 21 Oct 2022 15:07:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 3/9] rtc: isl1208: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:07:00 +0200
Message-Id: <20221021130706.178687-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Wu5Pia7g+VpBv2cSsAWl6A05TMlbyivMFJYRUHu0jmY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplgzxX7nAAn88Hu0taurSwp+yv4Upl+Ozcj95ou r5+MdiWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZYAAKCRDB/BR4rcrsCdbdB/ 9rQALHhLSDF+VPmW/rDt0MM4JaegQW0j2D3Ba7oEmzWuTBH0zAwG3bkveOGWJBVW+7pUP3oN7Im2p9 j9JjeqtJNJ/du2OnWvowG86su0MDyY7mG9R75KV66jFerYsABuxp5yJuBfS1nXyQkhsARyKFcsC5Ft eStolS30RbPmCnGcexD7Ae4ekEOE9nOAabvgTEpDfhYSbRGSrB1XPmR2HfSZDMGcvuPIsnn9xy0lX3 sGFZ69c7Gl5zN9U267QVZZ/InxJsBaNA+z9RWDQgM9Jyjr77C/V/J/sinGP3jc9b3W7nvYk1moTGcF weq+oTA/ylYToeRBNTVwII69mZgvS8
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

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in .probe().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-isl1208.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index f448a525333e..73cc6aaf9b8b 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -797,7 +797,7 @@ static int isl1208_setup_irq(struct i2c_client *client, int irq)
 }
 
 static int
-isl1208_probe(struct i2c_client *client, const struct i2c_device_id *id)
+isl1208_probe(struct i2c_client *client)
 {
 	int rc = 0;
 	struct isl1208_state *isl1208;
@@ -821,6 +821,8 @@ isl1208_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		if (!isl1208->config)
 			return -ENODEV;
 	} else {
+		const struct i2c_device_id *id = i2c_match_id(isl1208_id, client);
+
 		if (id->driver_data >= ISL_LAST_ID)
 			return -ENODEV;
 		isl1208->config = &isl1208_configs[id->driver_data];
@@ -906,7 +908,7 @@ static struct i2c_driver isl1208_driver = {
 		.name = "rtc-isl1208",
 		.of_match_table = of_match_ptr(isl1208_of_match),
 	},
-	.probe = isl1208_probe,
+	.probe_new = isl1208_probe,
 	.id_table = isl1208_id,
 };
 
-- 
2.37.2


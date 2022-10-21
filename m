Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2C06077D2
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbiJUNIp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiJUNIh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1151226D223
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk5-0001Xd-AQ; Fri, 21 Oct 2022 15:07:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk2-000Wli-CA; Fri, 21 Oct 2022 15:07:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk3-009Z8Z-SZ; Fri, 21 Oct 2022 15:07:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 4/9] rtc: m41t80: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:07:01 +0200
Message-Id: <20221021130706.178687-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iif85YCOQdO8kjGAQxcjpR+Xnr2fXaRXXqNKPIX0CQM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplkobAmR3HN5zvr72fPl+D/Y6HpB/fcaQ8yo5An hUgdyICJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZZAAKCRDB/BR4rcrsCaCpCA CaJhPx6IHMjEUYVc1S1hCU1Apqjp73wQIys3rg6NhhAKYFFZVWKri8wV+bdbPtZ66MwJwu5kEUobn7 MsZKNn+aoYj96A4Ji/2i70Cbilky/O1/viBT9uvut5eJmsVmW2THjR9+yje/yQzfQ9SuXp0nYkKEFN h+DA7q3K1NqC6T2O8fyadaWQKsOUruhm5VEQg5/bwEJCxUWkTbSNflww+Ku2zTPn/X/UlnHHV/v1Dv 7LGksAuldRYBGF/jI3MF6GhViQWpm9spsmWGS6noDfcHv0xJuhHrRyfFqR69GRhN6n3DIur2p7OPYe etBSLnLSBGXr3S1tIaxR24G093XE+d
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
 drivers/rtc/rtc-m41t80.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index e0b4d3794320..d3144ffdebb5 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -876,8 +876,7 @@ static struct notifier_block wdt_notifier = {
  *****************************************************************************
  */
 
-static int m41t80_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int m41t80_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	int rc = 0;
@@ -897,11 +896,13 @@ static int m41t80_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	m41t80_data->client = client;
-	if (client->dev.of_node)
+	if (client->dev.of_node) {
 		m41t80_data->features = (unsigned long)
 			of_device_get_match_data(&client->dev);
-	else
+	} else {
+		const struct i2c_device_id *id = i2c_match_id(m41t80_id, client);
 		m41t80_data->features = id->driver_data;
+	}
 	i2c_set_clientdata(client, m41t80_data);
 
 	m41t80_data->rtc =  devm_rtc_allocate_device(&client->dev);
@@ -1007,7 +1008,7 @@ static struct i2c_driver m41t80_driver = {
 		.of_match_table = of_match_ptr(m41t80_of_match),
 		.pm = &m41t80_pm,
 	},
-	.probe = m41t80_probe,
+	.probe_new = m41t80_probe,
 	.remove = m41t80_remove,
 	.id_table = m41t80_id,
 };
-- 
2.37.2


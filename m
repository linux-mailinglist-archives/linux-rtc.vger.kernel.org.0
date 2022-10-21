Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA866077CE
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbiJUNIl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbiJUNIg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7545E26C455
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk6-0001YG-7N; Fri, 21 Oct 2022 15:07:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk3-000Wly-7m; Fri, 21 Oct 2022 15:07:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk4-009Z8l-NS; Fri, 21 Oct 2022 15:07:16 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 7/9] rtc: rs5c372: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:07:04 +0200
Message-Id: <20221021130706.178687-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xtfzISt2avLjfBIo2PXDizR2simwmqzaBhBzHiDgZto=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUpluH6t4UldZsfDqswAgEzPG2ZCsVK5E34qmE68+ kAVZ5fiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZbgAKCRDB/BR4rcrsCXj7CA CJJPh+W2+5HXA7XFGfDwQi7O6R100wyR2URQy+rr+91ktAs7wVZ2+ckEk+UHgmaZLbkhiqzzezj9hp sqMvxuXBck75MJx/FKGGVqywcfnxSzKZwDGNfiUmB3ZWvqHjyAy0dGofuMSipe7KdNWj+fIwWWJc+1 7bx3dncaUgXdlMGAUjT8j4a94WGH/Tjd2aN5peT6og39NmNY9xWSxSOnbhW7wQMLGnt3+XFpbY4Xbg 8pg+rXl9kQDN5FbCQycFTee5GJaASJ8c4T0FZOfTvUVou9rQe1YLeEk6QZxyT0/ym59bjoqEzSmEcN Jrov0P3+zzxZhiVLVBt3RJvtus2L4o
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
 drivers/rtc/rtc-rs5c372.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 9562c477e1c9..5047afefcceb 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -791,8 +791,7 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
 	return 0;
 }
 
-static int rs5c372_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int rs5c372_probe(struct i2c_client *client)
 {
 	int err = 0;
 	int smbus_mode = 0;
@@ -826,11 +825,13 @@ static int rs5c372_probe(struct i2c_client *client,
 
 	rs5c372->client = client;
 	i2c_set_clientdata(client, rs5c372);
-	if (client->dev.of_node)
+	if (client->dev.of_node) {
 		rs5c372->type = (enum rtc_type)
 			of_device_get_match_data(&client->dev);
-	else
+	} else {
+		const struct i2c_device_id *id = i2c_match_id(rs5c372_id, client);
 		rs5c372->type = id->driver_data;
+	}
 
 	/* we read registers 0x0f then 0x00-0x0f; skip the first one */
 	rs5c372->regs = &rs5c372->buf[1];
@@ -920,7 +921,7 @@ static struct i2c_driver rs5c372_driver = {
 		.name	= "rtc-rs5c372",
 		.of_match_table = of_match_ptr(rs5c372_of_match),
 	},
-	.probe		= rs5c372_probe,
+	.probe_new	= rs5c372_probe,
 	.remove		= rs5c372_remove,
 	.id_table	= rs5c372_id,
 };
-- 
2.37.2


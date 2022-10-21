Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E44126077D0
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbiJUNIo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiJUNIh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D49E26D224
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk6-0001Yc-L3; Fri, 21 Oct 2022 15:07:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk3-000Wm3-La; Fri, 21 Oct 2022 15:07:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk5-009Z8q-6p; Fri, 21 Oct 2022 15:07:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 8/9] rtc: rv8803: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:07:05 +0200
Message-Id: <20221021130706.178687-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uol4e+9qlflNEtLITMUqZkYUccw/CdQKUYzFlOP0OQU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplxqp52OHRqKVTIcJQssaTa0okiwxPTlVTW1ZEl HI7F5Q+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZcQAKCRDB/BR4rcrsCST/CA CI4UQs+G+rfsYJEBL5W77PJpgr+rznLye49asuEb1uiVj1jeICAyyJ1dLmVfQvz1oi8V0l+Mr9hxHU 5HmmPr39DbaCKoDIvfFCztPIUKXA+DU5A71ThVjjiGrNCRGZ+8kP+bu141kbn2HIdQBzj++TP3bn6q 0o65iSReZ8Qg1fECwJeTV9dOZ9mYEZWSPCI7drckaW+t0EuKOETMYE8CEp9T0mGMZPVQSCkzOVvHvI HzfjcuVYRr0BltdmQRgbusmW9e3gMjLxdETOBWXDhyFI6Zz/cjMoM09ra6YiY/P53GIqs7/yRHtK0H JH9oJH8TCp9D3P9GrFftri9cHj5owK
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
that explicitly in .probe(). The device_id array has to move up for that
to work.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-rv8803.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 3527a0521e9b..b581b6d5ad73 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -576,8 +576,16 @@ static int rv8803_regs_configure(struct rv8803_data *rv8803)
 	return 0;
 }
 
-static int rv8803_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static const struct i2c_device_id rv8803_id[] = {
+	{ "rv8803", rv_8803 },
+	{ "rv8804", rx_8804 },
+	{ "rx8803", rx_8803 },
+	{ "rx8900", rx_8900 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rv8803_id);
+
+static int rv8803_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct rv8803_data *rv8803;
@@ -605,11 +613,14 @@ static int rv8803_probe(struct i2c_client *client,
 
 	mutex_init(&rv8803->flags_lock);
 	rv8803->client = client;
-	if (client->dev.of_node)
+	if (client->dev.of_node) {
 		rv8803->type = (enum rv8803_type)
 			of_device_get_match_data(&client->dev);
-	else
+	} else {
+		const struct i2c_device_id *id = i2c_match_id(rv8803_id, client);
+
 		rv8803->type = id->driver_data;
+	}
 	i2c_set_clientdata(client, rv8803);
 
 	flags = rv8803_read_reg(client, RV8803_FLAG);
@@ -666,15 +677,6 @@ static int rv8803_probe(struct i2c_client *client,
 	return 0;
 }
 
-static const struct i2c_device_id rv8803_id[] = {
-	{ "rv8803", rv_8803 },
-	{ "rv8804", rx_8804 },
-	{ "rx8803", rx_8803 },
-	{ "rx8900", rx_8900 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, rv8803_id);
-
 static const __maybe_unused struct of_device_id rv8803_of_match[] = {
 	{
 		.compatible = "microcrystal,rv8803",
@@ -701,7 +703,7 @@ static struct i2c_driver rv8803_driver = {
 		.name = "rtc-rv8803",
 		.of_match_table = of_match_ptr(rv8803_of_match),
 	},
-	.probe		= rv8803_probe,
+	.probe_new	= rv8803_probe,
 	.id_table	= rv8803_id,
 };
 module_i2c_driver(rv8803_driver);
-- 
2.37.2


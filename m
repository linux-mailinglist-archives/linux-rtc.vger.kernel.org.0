Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7946077CD
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiJUNIk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbiJUNIf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B000426D21D
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk4-0001XU-Ox; Fri, 21 Oct 2022 15:07:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk1-000WlX-O7; Fri, 21 Oct 2022 15:07:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk3-009Z8S-Cu; Fri, 21 Oct 2022 15:07:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/9] rtc: ds1307: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:06:59 +0200
Message-Id: <20221021130706.178687-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1mcvlEPJRbCV9c3G3Bhq4KnnvbsUzxctaqpHYkdvzmg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUpldGQIcotRGaA4Pp/8NF9iivDVjXPd0hNmiyrtY 8T2H/WyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZXQAKCRDB/BR4rcrsCRSUB/ 0f3TAlm85rMCyueTB7mkYVG3NwVdYskzZCRSCEoUNOJJ8u00flrS5Aq8vdVklwG1W5QSkJHabMP4S5 EUJeC9ySKTcw4u/QdDY3yZH97zCdt4USiy/fmKhzwdU2aYy8xs3pRVURkDy6NNFqghlFgiFDsJsB+X fnxVKdVS/Q2wCvzsHoR4ETrLLV4hre9uTxvvCU7D5DQVk6TXhy+eQ2nzfZpHVof0zdVQKIug0x4VAy iIOOaCZYGl15NPXSwyU5IQQfHxa52f5zepE/amDgawAewOyt3JbHUZ+U9enfEmc6eoJDqiyE8hI9rf u1OrUJD9lI9mOJRbtOWA/ItwaDAPJU
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
 drivers/rtc/rtc-ds1307.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index d51565bcc189..70a6755a7d69 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1712,9 +1712,9 @@ static const struct regmap_config regmap_config = {
 	.val_bits = 8,
 };
 
-static int ds1307_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int ds1307_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id;
 	struct ds1307		*ds1307;
 	const void		*match;
 	int			err = -ENODEV;
@@ -1746,7 +1746,7 @@ static int ds1307_probe(struct i2c_client *client,
 	if (match) {
 		ds1307->type = (enum ds_type)match;
 		chip = &chips[ds1307->type];
-	} else if (id) {
+	} else if ((id = i2c_match_id(ds1307_id, client))) {
 		chip = &chips[id->driver_data];
 		ds1307->type = id->driver_data;
 	} else {
@@ -2011,7 +2011,7 @@ static struct i2c_driver ds1307_driver = {
 		.name	= "rtc-ds1307",
 		.of_match_table = ds1307_of_match,
 	},
-	.probe		= ds1307_probe,
+	.probe_new	= ds1307_probe,
 	.id_table	= ds1307_id,
 };
 
-- 
2.37.2


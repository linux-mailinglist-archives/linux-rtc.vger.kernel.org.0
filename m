Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E17A6F82AE
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 14:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjEEMLs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 08:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjEEMLr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 08:11:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C921FED
        for <linux-rtc@vger.kernel.org>; Fri,  5 May 2023 05:11:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puuHn-0000Kf-6M; Fri, 05 May 2023 14:11:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puuHm-001I8b-9U; Fri, 05 May 2023 14:11:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puuHl-001Vhj-GS; Fri, 05 May 2023 14:11:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] rtc: Switch i2c drivers back to use .probe()
Date:   Fri,  5 May 2023 14:11:36 +0200
Message-Id: <20230505121136.1185653-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=16549; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=F/NxFnwpo8DyWt69C48wjWMGpwMHnCrTsVgNP5Ldm3E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVPJ3JinRiQo+ciVrUl2QudVuV2/609hpX0ZYy EkOdNi2aS6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFTydwAKCRCPgPtYfRL+ TrnEB/9pZ0Q/Ncgq3HNG4w+L0fSzzCB3uY97KKKLZMz12/fI+ymj/rBC8ykr2m2oeBcw3iTbV90 gc+/kbwXSoGX+1UKU9Cvn5zIC57ERkcEMW2XD1kVMAW6qvlc2k18Lf7shjmB2t5s3cTn0XfgBeJ YV1w5gUJQnrIU+eWGLu1RnPq6CeVkqTv/CoqFXppxraxXi0hR/Gc07gyN4CDjCQfI2q8pu+9b34 LeQiuS+9n+2cvmfc1pPgwMQipmWlObwCsE2M/qE4T35C2En5qlHk4Wl+n/W2sPolxMd+3d5ERWm NoWgyUGZHksVaDOqqsMlZhtiWW/ggQhE3cDbKSP3tqJGadCl
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

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-ab-b5ze-s3.c | 2 +-
 drivers/rtc/rtc-ab-eoz9.c    | 2 +-
 drivers/rtc/rtc-abx80x.c     | 2 +-
 drivers/rtc/rtc-bq32k.c      | 2 +-
 drivers/rtc/rtc-ds1307.c     | 2 +-
 drivers/rtc/rtc-ds1374.c     | 2 +-
 drivers/rtc/rtc-ds1672.c     | 2 +-
 drivers/rtc/rtc-ds3232.c     | 2 +-
 drivers/rtc/rtc-em3027.c     | 2 +-
 drivers/rtc/rtc-fm3130.c     | 2 +-
 drivers/rtc/rtc-hym8563.c    | 2 +-
 drivers/rtc/rtc-isl12022.c   | 2 +-
 drivers/rtc/rtc-isl12026.c   | 2 +-
 drivers/rtc/rtc-isl1208.c    | 2 +-
 drivers/rtc/rtc-m41t80.c     | 2 +-
 drivers/rtc/rtc-max6900.c    | 2 +-
 drivers/rtc/rtc-nct3018y.c   | 2 +-
 drivers/rtc/rtc-pcf2127.c    | 2 +-
 drivers/rtc/rtc-pcf85063.c   | 2 +-
 drivers/rtc/rtc-pcf8523.c    | 2 +-
 drivers/rtc/rtc-pcf85363.c   | 2 +-
 drivers/rtc/rtc-pcf8563.c    | 2 +-
 drivers/rtc/rtc-pcf8583.c    | 2 +-
 drivers/rtc/rtc-rs5c372.c    | 2 +-
 drivers/rtc/rtc-rv3028.c     | 2 +-
 drivers/rtc/rtc-rv3029c2.c   | 2 +-
 drivers/rtc/rtc-rv3032.c     | 2 +-
 drivers/rtc/rtc-rv8803.c     | 2 +-
 drivers/rtc/rtc-rx6110.c     | 2 +-
 drivers/rtc/rtc-rx8010.c     | 2 +-
 drivers/rtc/rtc-rx8025.c     | 2 +-
 drivers/rtc/rtc-rx8581.c     | 2 +-
 drivers/rtc/rtc-s35390a.c    | 2 +-
 drivers/rtc/rtc-sd3078.c     | 2 +-
 drivers/rtc/rtc-x1205.c      | 2 +-
 35 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index f2b0971d2c65..100062001831 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -944,7 +944,7 @@ static struct i2c_driver abb5zes3_driver = {
 		.pm = &abb5zes3_rtc_pm_ops,
 		.of_match_table = of_match_ptr(abb5zes3_dt_match),
 	},
-	.probe_new = abb5zes3_probe,
+	.probe = abb5zes3_probe,
 	.id_table = abb5zes3_id,
 };
 module_i2c_driver(abb5zes3_driver);
diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 34611f6dedcb..f00c237e2d34 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -584,7 +584,7 @@ static struct i2c_driver abeoz9_driver = {
 		.name = "rtc-ab-eoz9",
 		.of_match_table = of_match_ptr(abeoz9_dt_match),
 	},
-	.probe_new = abeoz9_probe,
+	.probe = abeoz9_probe,
 	.id_table = abeoz9_id,
 };
 
diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index f34a2e59cac7..e08d3181bd2a 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -992,7 +992,7 @@ static struct i2c_driver abx80x_driver = {
 		.name	= "rtc-abx80x",
 		.of_match_table = of_match_ptr(abx80x_of_match),
 	},
-	.probe_new	= abx80x_probe,
+	.probe		= abx80x_probe,
 	.id_table	= abx80x_id,
 };
 
diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 967ddc6bf76d..591e42391747 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -320,7 +320,7 @@ static struct i2c_driver bq32k_driver = {
 		.name	= "bq32k",
 		.of_match_table = of_match_ptr(bq32k_of_match),
 	},
-	.probe_new	= bq32k_probe,
+	.probe		= bq32k_probe,
 	.remove		= bq32k_remove,
 	.id_table	= bq32k_id,
 };
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index e86ba84df6cb..cb5acecc11aa 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -2011,7 +2011,7 @@ static struct i2c_driver ds1307_driver = {
 		.name	= "rtc-ds1307",
 		.of_match_table = ds1307_of_match,
 	},
-	.probe_new	= ds1307_probe,
+	.probe		= ds1307_probe,
 	.id_table	= ds1307_id,
 };
 
diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index 7f089f066163..4a5005cb23f5 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -572,7 +572,7 @@ static struct i2c_driver ds1374_driver = {
 		.of_match_table = of_match_ptr(ds1374_of_match),
 		.pm = &ds1374_pm,
 	},
-	.probe_new = ds1374_probe,
+	.probe = ds1374_probe,
 	.remove = ds1374_remove,
 	.id_table = ds1374_id,
 };
diff --git a/drivers/rtc/rtc-ds1672.c b/drivers/rtc/rtc-ds1672.c
index a3bb2cd9c881..641799f30baa 100644
--- a/drivers/rtc/rtc-ds1672.c
+++ b/drivers/rtc/rtc-ds1672.c
@@ -149,7 +149,7 @@ static struct i2c_driver ds1672_driver = {
 		   .name = "rtc-ds1672",
 		   .of_match_table = of_match_ptr(ds1672_of_match),
 	},
-	.probe_new = ds1672_probe,
+	.probe = ds1672_probe,
 	.id_table = ds1672_id,
 };
 
diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index dd31a60c1fc6..04365d8c5bce 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -603,7 +603,7 @@ static struct i2c_driver ds3232_driver = {
 		.of_match_table = of_match_ptr(ds3232_of_match),
 		.pm	= &ds3232_pm_ops,
 	},
-	.probe_new = ds3232_i2c_probe,
+	.probe = ds3232_i2c_probe,
 	.id_table = ds3232_id,
 };
 
diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
index 53f9f9391a5f..fc772eae5da5 100644
--- a/drivers/rtc/rtc-em3027.c
+++ b/drivers/rtc/rtc-em3027.c
@@ -147,7 +147,7 @@ static struct i2c_driver em3027_driver = {
 		   .name = "rtc-em3027",
 		   .of_match_table = of_match_ptr(em3027_of_match),
 	},
-	.probe_new = em3027_probe,
+	.probe = em3027_probe,
 	.id_table = em3027_id,
 };
 
diff --git a/drivers/rtc/rtc-fm3130.c b/drivers/rtc/rtc-fm3130.c
index f59bb81f23c0..400ce4ad0c49 100644
--- a/drivers/rtc/rtc-fm3130.c
+++ b/drivers/rtc/rtc-fm3130.c
@@ -517,7 +517,7 @@ static struct i2c_driver fm3130_driver = {
 	.driver = {
 		.name	= "rtc-fm3130",
 	},
-	.probe_new	= fm3130_probe,
+	.probe		= fm3130_probe,
 	.id_table	= fm3130_id,
 };
 
diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 7d5a298a9a3b..b018535c842b 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -576,7 +576,7 @@ static struct i2c_driver hym8563_driver = {
 		.pm	= &hym8563_pm_ops,
 		.of_match_table	= hym8563_dt_idtable,
 	},
-	.probe_new	= hym8563_probe,
+	.probe		= hym8563_probe,
 	.id_table	= hym8563_id,
 };
 
diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index e68a79b5e00e..5d68f0359c36 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -262,7 +262,7 @@ static struct i2c_driver isl12022_driver = {
 		.name	= "rtc-isl12022",
 		.of_match_table = isl12022_dt_match,
 	},
-	.probe_new	= isl12022_probe,
+	.probe		= isl12022_probe,
 	.id_table	= isl12022_id,
 };
 
diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 1bfca39079d4..5abff5d348ac 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -490,7 +490,7 @@ static struct i2c_driver isl12026_driver = {
 		.name	= "rtc-isl12026",
 		.of_match_table = isl12026_dt_match,
 	},
-	.probe_new	= isl12026_probe_new,
+	.probe		= isl12026_probe_new,
 	.remove		= isl12026_remove,
 };
 
diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 73cc6aaf9b8b..92a7a1d8d5c3 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -908,7 +908,7 @@ static struct i2c_driver isl1208_driver = {
 		.name = "rtc-isl1208",
 		.of_match_table = of_match_ptr(isl1208_of_match),
 	},
-	.probe_new = isl1208_probe,
+	.probe = isl1208_probe,
 	.id_table = isl1208_id,
 };
 
diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index c1963f7c424d..3cc5151e0986 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -1013,7 +1013,7 @@ static struct i2c_driver m41t80_driver = {
 		.of_match_table = of_match_ptr(m41t80_of_match),
 		.pm = &m41t80_pm,
 	},
-	.probe_new = m41t80_probe,
+	.probe = m41t80_probe,
 	.remove = m41t80_remove,
 	.id_table = m41t80_id,
 };
diff --git a/drivers/rtc/rtc-max6900.c b/drivers/rtc/rtc-max6900.c
index 0a33851cc51f..31b910e4d91a 100644
--- a/drivers/rtc/rtc-max6900.c
+++ b/drivers/rtc/rtc-max6900.c
@@ -224,7 +224,7 @@ static struct i2c_driver max6900_driver = {
 	.driver = {
 		   .name = "rtc-max6900",
 		   },
-	.probe_new = max6900_probe,
+	.probe = max6900_probe,
 	.id_table = max6900_id,
 };
 
diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index 0a3b14c95d90..a4e3f924837e 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -540,7 +540,7 @@ static struct i2c_driver nct3018y_driver = {
 		.name	= "rtc-nct3018y",
 		.of_match_table = of_match_ptr(nct3018y_of_match),
 	},
-	.probe_new	= nct3018y_probe,
+	.probe		= nct3018y_probe,
 	.id_table	= nct3018y_id,
 };
 
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 87f4fc9df68b..ee03b04b74ba 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -923,7 +923,7 @@ static struct i2c_driver pcf2127_i2c_driver = {
 		.name	= "rtc-pcf2127-i2c",
 		.of_match_table = of_match_ptr(pcf2127_of_match),
 	},
-	.probe_new	= pcf2127_i2c_probe,
+	.probe		= pcf2127_i2c_probe,
 	.id_table	= pcf2127_i2c_id,
 };
 
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 71a456355981..e517abfaee2a 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -681,7 +681,7 @@ static struct i2c_driver pcf85063_driver = {
 		.name	= "rtc-pcf85063",
 		.of_match_table = of_match_ptr(pcf85063_of_match),
 	},
-	.probe_new	= pcf85063_probe,
+	.probe		= pcf85063_probe,
 	.id_table	= pcf85063_ids,
 };
 
diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 2e111cdb94f7..791c86a3d44e 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -489,7 +489,7 @@ static struct i2c_driver pcf8523_driver = {
 		.name = "rtc-pcf8523",
 		.of_match_table = pcf8523_of_match,
 	},
-	.probe_new = pcf8523_probe,
+	.probe = pcf8523_probe,
 	.id_table = pcf8523_id,
 };
 module_i2c_driver(pcf8523_driver);
diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 8958eadf1c3e..65b8b1338dbb 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -475,7 +475,7 @@ static struct i2c_driver pcf85363_driver = {
 		.name	= "pcf85363",
 		.of_match_table = of_match_ptr(dev_ids),
 	},
-	.probe_new = pcf85363_probe,
+	.probe = pcf85363_probe,
 };
 
 module_i2c_driver(pcf85363_driver);
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 7e720472213c..ea82b89d8929 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -612,7 +612,7 @@ static struct i2c_driver pcf8563_driver = {
 		.name	= "rtc-pcf8563",
 		.of_match_table = of_match_ptr(pcf8563_of_match),
 	},
-	.probe_new	= pcf8563_probe,
+	.probe		= pcf8563_probe,
 	.id_table	= pcf8563_id,
 };
 
diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c
index 87074d178274..a7e0fc360b6a 100644
--- a/drivers/rtc/rtc-pcf8583.c
+++ b/drivers/rtc/rtc-pcf8583.c
@@ -306,7 +306,7 @@ static struct i2c_driver pcf8583_driver = {
 	.driver = {
 		.name	= "pcf8583",
 	},
-	.probe_new	= pcf8583_probe,
+	.probe		= pcf8583_probe,
 	.id_table	= pcf8583_id,
 };
 
diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index b4c5d016eca3..a5a6c8772ecd 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -921,7 +921,7 @@ static struct i2c_driver rs5c372_driver = {
 		.name	= "rtc-rs5c372",
 		.of_match_table = of_match_ptr(rs5c372_of_match),
 	},
-	.probe_new	= rs5c372_probe,
+	.probe		= rs5c372_probe,
 	.remove		= rs5c372_remove,
 	.id_table	= rs5c372_id,
 };
diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index ec5d7a614e2d..5595a4684f75 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -1000,7 +1000,7 @@ static struct i2c_driver rv3028_driver = {
 		.acpi_match_table = rv3028_i2c_acpi_match,
 		.of_match_table = of_match_ptr(rv3028_of_match),
 	},
-	.probe_new	= rv3028_probe,
+	.probe		= rv3028_probe,
 };
 module_i2c_driver(rv3028_driver);
 
diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 0852f6709a85..4a81feeb00ff 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -824,7 +824,7 @@ static struct i2c_driver rv3029_driver = {
 		.name = "rv3029",
 		.of_match_table = of_match_ptr(rv3029_of_match),
 	},
-	.probe_new	= rv3029_i2c_probe,
+	.probe		= rv3029_i2c_probe,
 	.id_table	= rv3029_id,
 };
 
diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 1ff4f2e6fa77..ec3777ba1fde 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -998,7 +998,7 @@ static struct i2c_driver rv3032_driver = {
 		.acpi_match_table = rv3032_i2c_acpi_match,
 		.of_match_table = of_match_ptr(rv3032_of_match),
 	},
-	.probe_new	= rv3032_probe,
+	.probe		= rv3032_probe,
 };
 module_i2c_driver(rv3032_driver);
 
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 25c3b9e4f515..98679cae13e8 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -739,7 +739,7 @@ static struct i2c_driver rv8803_driver = {
 		.name = "rtc-rv8803",
 		.of_match_table = of_match_ptr(rv8803_of_match),
 	},
-	.probe_new	= rv8803_probe,
+	.probe		= rv8803_probe,
 	.id_table	= rv8803_id,
 };
 module_i2c_driver(rv8803_driver);
diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 37608883a796..8702db6096ba 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -462,7 +462,7 @@ static struct i2c_driver rx6110_i2c_driver = {
 		.name = RX6110_DRIVER_NAME,
 		.acpi_match_table = rx6110_i2c_acpi_match,
 	},
-	.probe_new	= rx6110_i2c_probe,
+	.probe		= rx6110_i2c_probe,
 	.id_table	= rx6110_i2c_id,
 };
 
diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index b9c8dad26208..f44e212c07de 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -424,7 +424,7 @@ static struct i2c_driver rx8010_driver = {
 		.name = "rtc-rx8010",
 		.of_match_table = of_match_ptr(rx8010_of_match),
 	},
-	.probe_new	= rx8010_probe,
+	.probe		= rx8010_probe,
 	.id_table	= rx8010_id,
 };
 
diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index 331c20d4d843..aabe62c283a1 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -581,7 +581,7 @@ static struct i2c_driver rx8025_driver = {
 	.driver = {
 		.name = "rtc-rx8025",
 	},
-	.probe_new	= rx8025_probe,
+	.probe		= rx8025_probe,
 	.id_table	= rx8025_id,
 };
 
diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 14edb7534c97..82881fd2e14a 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -325,7 +325,7 @@ static struct i2c_driver rx8581_driver = {
 		.name	= "rtc-rx8581",
 		.of_match_table = of_match_ptr(rx8581_of_match),
 	},
-	.probe_new	= rx8581_probe,
+	.probe		= rx8581_probe,
 	.id_table	= rx8581_id,
 };
 
diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index b18daaf72b17..90a3028ac574 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -499,7 +499,7 @@ static struct i2c_driver s35390a_driver = {
 		.name	= "rtc-s35390a",
 		.of_match_table = of_match_ptr(s35390a_of_match),
 	},
-	.probe_new	= s35390a_probe,
+	.probe		= s35390a_probe,
 	.id_table	= s35390a_id,
 };
 
diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index e2f90d768ca8..7760394ccd2d 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -217,7 +217,7 @@ static struct i2c_driver sd3078_driver = {
 		.name   = "sd3078",
 		.of_match_table = of_match_ptr(rtc_dt_match),
 	},
-	.probe_new  = sd3078_probe,
+	.probe      = sd3078_probe,
 	.id_table   = sd3078_id,
 };
 
diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c
index f587afa84357..807f953ae0ae 100644
--- a/drivers/rtc/rtc-x1205.c
+++ b/drivers/rtc/rtc-x1205.c
@@ -679,7 +679,7 @@ static struct i2c_driver x1205_driver = {
 		.name	= "rtc-x1205",
 		.of_match_table = x1205_dt_ids,
 	},
-	.probe_new	= x1205_probe,
+	.probe		= x1205_probe,
 	.remove		= x1205_remove,
 	.id_table	= x1205_id,
 };

base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
-- 
2.39.2


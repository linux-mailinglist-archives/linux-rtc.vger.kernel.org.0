Return-Path: <linux-rtc+bounces-1186-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB08C6CED
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2024 21:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B737283C67
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2024 19:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5551F15AADE;
	Wed, 15 May 2024 19:43:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DA23BBEA
	for <linux-rtc@vger.kernel.org>; Wed, 15 May 2024 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715802237; cv=none; b=hamkcrDJfnXL3PaAhoYUPuhz6BAPfQqePdfgV1m+4PjJBOm6A1ZYuH1agaUUXhP6oe30AP0mjUFDh4xnvOOhAWDZFjSZv243bP3Imug8A9jssg2eCdtyhepA8ga0fAUDiBPGYqek3tXluV5KmVT+tZPiVCK+ibWdnMiSH+j+b+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715802237; c=relaxed/simple;
	bh=X9KneUlKZEuiBO3Oy57Z5oYstrxjiTvq+SgWw+JQKnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lwHFUg4Sep7JD7t242U7USocKt9J0i4lIjyMErTOXytN/8VVuNOu4dxwvowHp43HWHTMbTNTKm9pFOBpt7JOGiWFulxRZTCx6HpKYWiHTL8H10F1X7S5jCoLWQiRxoWjLa6fD4WhCZBIGyKFeg3Sp5DXRRr3MQLVuHX8+v2F6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s7KXQ-00043M-5Y; Wed, 15 May 2024 21:43:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s7KXO-001aSm-DQ; Wed, 15 May 2024 21:43:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s7KXO-005Rto-14;
	Wed, 15 May 2024 21:43:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] rtc: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Wed, 15 May 2024 21:43:37 +0200
Message-ID: <20240515194336.58342-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10685; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=X9KneUlKZEuiBO3Oy57Z5oYstrxjiTvq+SgWw+JQKnE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmRRBoW7xduGMZ7nf0REmTzlsfS8pNgJmWGzS/L dQqDKY60W6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZkUQaAAKCRCPgPtYfRL+ TvBCB/47ULqAvGxKQ+Jg2nrCJwAAv/x7lrwptlZ0ujtUaLwS5JEPQpQXgWCdkeFDiVliTb5Vxgr VcyUNnuCe+76iXSaVsnXhRt9fBCvbBm2oQ+znjAVc7Pa+XCZsowDTy4FZjzRZWMqz4i/emO1DHp PBT7msCspwJpILP4M8AF3Xmf2akWUfMCPkg0kUWyEibir8bdxqlM9Xm7b9pZBf8nVXsfSjxZ5sZ VjnKBvGJhuy4ChU7ySfCXi62SgotCusKsl1eWXglXXjIv7S/A/A1AQuOf9wZsquXRvKx2bVx3HB 3D7FA4FNtXDNaNG1TXGUsVYy+TM/Wapc4De6AJmIGSPrLNHi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While add it, also remove a comma after the sentinel entry in
rtc-hym8563.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-ab-b5ze-s3.c | 2 +-
 drivers/rtc/rtc-ab-eoz9.c    | 2 +-
 drivers/rtc/rtc-bq32k.c      | 2 +-
 drivers/rtc/rtc-ds1374.c     | 2 +-
 drivers/rtc/rtc-ds1672.c     | 2 +-
 drivers/rtc/rtc-ds3232.c     | 2 +-
 drivers/rtc/rtc-em3027.c     | 2 +-
 drivers/rtc/rtc-fm3130.c     | 2 +-
 drivers/rtc/rtc-hym8563.c    | 4 ++--
 drivers/rtc/rtc-isl12022.c   | 2 +-
 drivers/rtc/rtc-max31335.c   | 2 +-
 drivers/rtc/rtc-max6900.c    | 2 +-
 drivers/rtc/rtc-nct3018y.c   | 2 +-
 drivers/rtc/rtc-pcf8523.c    | 2 +-
 drivers/rtc/rtc-pcf8563.c    | 6 +++---
 drivers/rtc/rtc-pcf8583.c    | 2 +-
 drivers/rtc/rtc-rv3029c2.c   | 4 ++--
 drivers/rtc/rtc-rx6110.c     | 2 +-
 drivers/rtc/rtc-rx8010.c     | 2 +-
 drivers/rtc/rtc-rx8581.c     | 2 +-
 drivers/rtc/rtc-s35390a.c    | 2 +-
 drivers/rtc/rtc-sd3078.c     | 2 +-
 drivers/rtc/rtc-x1205.c      | 2 +-
 23 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index 100062001831..684f9898d768 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -933,7 +933,7 @@ MODULE_DEVICE_TABLE(of, abb5zes3_dt_match);
 #endif
 
 static const struct i2c_device_id abb5zes3_id[] = {
-	{ "abb5zes3", 0 },
+	{ "abb5zes3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, abb5zes3_id);
diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 04e1b8e93bc1..02f7d0711287 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -575,7 +575,7 @@ MODULE_DEVICE_TABLE(of, abeoz9_dt_match);
 #endif
 
 static const struct i2c_device_id abeoz9_id[] = {
-	{ "abeoz9", 0 },
+	{ "abeoz9" },
 	{ }
 };
 
diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 591e42391747..7ad34539be4d 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -304,7 +304,7 @@ static void bq32k_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bq32k_id[] = {
-	{ "bq32000", 0 },
+	{ "bq32000" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bq32k_id);
diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index 4a5005cb23f5..c2359eb86bc9 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -52,7 +52,7 @@
 #define DS1374_REG_TCR		0x09 /* Trickle Charge */
 
 static const struct i2c_device_id ds1374_id[] = {
-	{ "ds1374", 0 },
+	{ "ds1374" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1374_id);
diff --git a/drivers/rtc/rtc-ds1672.c b/drivers/rtc/rtc-ds1672.c
index 641799f30baa..6e5314215d00 100644
--- a/drivers/rtc/rtc-ds1672.c
+++ b/drivers/rtc/rtc-ds1672.c
@@ -133,7 +133,7 @@ static int ds1672_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ds1672_id[] = {
-	{ "ds1672", 0 },
+	{ "ds1672" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1672_id);
diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index 1485a6ae51e6..dd37b055693c 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -586,7 +586,7 @@ static int ds3232_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ds3232_id[] = {
-	{ "ds3232", 0 },
+	{ "ds3232" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds3232_id);
diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
index fc772eae5da5..dc1ccbc65dcb 100644
--- a/drivers/rtc/rtc-em3027.c
+++ b/drivers/rtc/rtc-em3027.c
@@ -129,7 +129,7 @@ static int em3027_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id em3027_id[] = {
-	{ "em3027", 0 },
+	{ "em3027" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, em3027_id);
diff --git a/drivers/rtc/rtc-fm3130.c b/drivers/rtc/rtc-fm3130.c
index 400ce4ad0c49..f82728ebac0c 100644
--- a/drivers/rtc/rtc-fm3130.c
+++ b/drivers/rtc/rtc-fm3130.c
@@ -53,7 +53,7 @@ struct fm3130 {
 	int			data_valid;
 };
 static const struct i2c_device_id fm3130_id[] = {
-	{ "fm3130", 0 },
+	{ "fm3130" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fm3130_id);
diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index b018535c842b..63f11ea3589d 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -559,8 +559,8 @@ static int hym8563_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id hym8563_id[] = {
-	{ "hym8563", 0 },
-	{},
+	{ "hym8563" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, hym8563_id);
 
diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 4eef7afcc8bc..6fa9a68af9d9 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -366,7 +366,7 @@ static const struct of_device_id isl12022_dt_match[] = {
 MODULE_DEVICE_TABLE(of, isl12022_dt_match);
 
 static const struct i2c_device_id isl12022_id[] = {
-	{ "isl12022", 0 },
+	{ "isl12022" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl12022_id);
diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index a2441e5c2c74..9a456f537d3b 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -669,7 +669,7 @@ static int max31335_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max31335_id[] = {
-	{ "max31335", 0 },
+	{ "max31335" },
 	{ }
 };
 
diff --git a/drivers/rtc/rtc-max6900.c b/drivers/rtc/rtc-max6900.c
index 31b910e4d91a..7be31fce5bc7 100644
--- a/drivers/rtc/rtc-max6900.c
+++ b/drivers/rtc/rtc-max6900.c
@@ -215,7 +215,7 @@ static int max6900_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max6900_id[] = {
-	{ "max6900", 0 },
+	{ "max6900" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max6900_id);
diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index 7a8b4de893b8..76c5f464b2da 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -567,7 +567,7 @@ static int nct3018y_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id nct3018y_id[] = {
-	{ "nct3018y", 0 },
+	{ "nct3018y" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nct3018y_id);
diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 98b77f790b0c..2c63c0ffd05a 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -495,7 +495,7 @@ static int pcf8523_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf8523_id[] = {
-	{ "pcf8523", 0 },
+	{ "pcf8523" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8523_id);
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index ea82b89d8929..af140bde6b53 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -589,9 +589,9 @@ static int pcf8563_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf8563_id[] = {
-	{ "pcf8563", 0 },
-	{ "rtc8564", 0 },
-	{ "pca8565", 0 },
+	{ "pcf8563" },
+	{ "rtc8564" },
+	{ "pca8565" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8563_id);
diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c
index a7e0fc360b6a..652b9dfa7566 100644
--- a/drivers/rtc/rtc-pcf8583.c
+++ b/drivers/rtc/rtc-pcf8583.c
@@ -297,7 +297,7 @@ static int pcf8583_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf8583_id[] = {
-	{ "pcf8583", 0 },
+	{ "pcf8583" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8583_id);
diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 4a81feeb00ff..83331d1fcab0 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -807,8 +807,8 @@ static int rv3029_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rv3029_id[] = {
-	{ "rv3029", 0 },
-	{ "rv3029c2", 0 },
+	{ "rv3029" },
+	{ "rv3029c2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rv3029_id);
diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 834274db8c3f..6f4cde803f3e 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -451,7 +451,7 @@ static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
 
 static const struct i2c_device_id rx6110_i2c_id[] = {
-	{ "rx6110", 0 },
+	{ "rx6110" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index f44e212c07de..2b6198d1cf81 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -50,7 +50,7 @@
 #define RX8010_ALARM_AE		BIT(7)
 
 static const struct i2c_device_id rx8010_id[] = {
-	{ "rx8010", 0 },
+	{ "rx8010" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rx8010_id);
diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 48efd61a114d..b18c12887bdc 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -307,7 +307,7 @@ static int rx8581_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rx8581_id[] = {
-	{ "rx8581", 0 },
+	{ "rx8581" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rx8581_id);
diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 90a3028ac574..2d6b655a4b25 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -50,7 +50,7 @@
 #define S35390A_INT2_MODE_PMIN		(BIT(3) | BIT(2)) /* INT2FE | INT2ME */
 
 static const struct i2c_device_id s35390a_id[] = {
-	{ "s35390a", 0 },
+	{ "s35390a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s35390a_id);
diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index 7760394ccd2d..fe27b54beaad 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -201,7 +201,7 @@ static int sd3078_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sd3078_id[] = {
-	{"sd3078", 0},
+	{ "sd3078" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sd3078_id);
diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c
index 807f953ae0ae..4bcd7ca32f27 100644
--- a/drivers/rtc/rtc-x1205.c
+++ b/drivers/rtc/rtc-x1205.c
@@ -663,7 +663,7 @@ static void x1205_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id x1205_id[] = {
-	{ "x1205", 0 },
+	{ "x1205" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, x1205_id);

base-commit: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
-- 
2.43.0



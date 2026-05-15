Return-Path: <linux-rtc+bounces-6517-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMUyMRRKB2rqwgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6517-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 18:30:12 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3765534A8
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 18:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 096A9311C3E2
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 15:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DF1366820;
	Fri, 15 May 2026 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Ogh7mTuj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05A305687
	for <linux-rtc@vger.kernel.org>; Fri, 15 May 2026 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860055; cv=none; b=WJ7nJZ8Zma1W4YZpNni5X2U0kbBGi9EYgef3HgIIw0YQUPAItYqxguRuqJ4pkSv5nkUgWavk4LkX10ePzKlsxhf8LSM3pMW32NxnvZTBIdP9PwcGob+U92AHpgERNGP/XBBAhZUl3RFrSriXmbtHN4+SJ4sc0C7YYUUUfdvLWxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860055; c=relaxed/simple;
	bh=p+h/xp0eOXHBMBhi6jswwec12KIuN8PQMEpTOzHM1os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tJxG9If9qXxHQ94b1ogynBudny/h60t3Pgbte/2HqqnAjUXUn+q2jU0ek36Yqbj29wjLtpsBVlpoCijS1JfAJneZYnKqZ+Trg/WQrqZIyumVn2Ji+GGDj8DX1q/Py1SlOkwsZloc9/wSIR2MZ8zCaQRa79NbNb+6NJ+f2ms2IzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Ogh7mTuj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso83002635e9.3
        for <linux-rtc@vger.kernel.org>; Fri, 15 May 2026 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778860050; x=1779464850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XG7FpyhQ5qT7TLD8SHnWznrQujk1wwTSxAfWkMjTJWg=;
        b=Ogh7mTujN1tYk2uyhHn2rjaYJ3ZhZIJNJHUMZmish/JyKHMnR1YFbjhMzM7Jt1YQqJ
         Vb0ejJERqF6p5hwWgWinw8rBeMRLrMHwfD5scCyBT4DRpxk9YZJL3Outf+NwMmwpTG+M
         2ckMwftfvn8rmA8EUPwi7FzDLUOA7akKgdZeYwJNTecpTDS7PauDKg/IYixCuwCS/Wf0
         /5DxzLKrAiyyh+LvCop+V+344cjhpMVnLKVLPd6k4gRzac6/exQEcSDGMIkf7k+ihlkl
         //ciqDwyloJAo7pS4KLBM84C+MHkYd9cZS+1iGA8xJ/WOuZG2vV5cXbP5esqjTCtMGNP
         z3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860050; x=1779464850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG7FpyhQ5qT7TLD8SHnWznrQujk1wwTSxAfWkMjTJWg=;
        b=VtZIwZ39vTReyK6Sb/FD/8LiweOThYUtSSDAyGZia6gmUdPt/yQvIRbLNCwxEPmgaO
         sKSipjnznWleMMZerhHUlM4RXofAAYXAReX/BgSvnZtRQ2Ac5t5uvLRWbzomxDfIra7Y
         T0rWB31zDxFB+7Ow6QvmXuAbG/HQB+Ilp9R+SojRHZgt/lf3NSVpYkXBlWBDa66KT9X/
         njJY1fWjHFaBBoPfxOXbbky6uAaeRG+oULb7DzQZWX3ZSqNzJrTvGtVBzM13+yQeZkkU
         /jYBFk3b6+jjyAd5L8KZv7Gis9deaVflHSMRad64Z/ln2QvyGl2s5riODihQ/mINxE3S
         TFyQ==
X-Forwarded-Encrypted: i=1; AFNElJ//N0LUimoOlbWfEnQWAGHoqVmhL0n9v+YsmdA1a6qFUU4yFteC1p8ebMxfoNBjsh+dLHSnJ1oYBF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQX48oouI9sr6b662eegm3DAyEDbp4av9hO8jvOLkqk5VnGdE
	Rt3tPsfyz38ky3n8uK9/ZQfWZQXm4wARBS94tXernYFJB+0ZeEWnAAlECG7RcvUCEGk=
X-Gm-Gg: Acq92OHdVFzmH/xPPxVToFtB4rET2M0ilrhepG0qy4rab0pUO3WDagXPjlJNOxKYHVe
	4OWd7RdYGz9+I4gRd9Xj4i+BNDWm6olTQQvJvnBqgc9L/47HvBO7Vf7ZPzPAPE2ej+fxtLOx6yR
	7sVRDV5kOruZ9+mlGmaTKukYYQEMpGM/sXzjlKof8GkgIdVbnT79UjeOYHjvv7eAq57BSsWFTzh
	UcLlSFYI750rESRNnyWNZNH94aABweGew5sPIond3KzHEH/+gWtU2T3mAJ2ZE5W8DM6Pu1zdgWE
	OetPx5W2INg/FB6SOUCPgZ0wodRiRh6Z6nuopBwi1QEohYKPSkanbtmKtToqhsjjp2yNeZkQn7g
	FBOcuXOZEiqxOV80jpIiy4Jq8Nag+jakZmpgUJvdVKkfm2Z7MAS3zDZqg6nC5SZIMvEVlcNqAmm
	nx6SFbII0HVFyD5UjlkEN/B2RYadMUDGHbLK7NKz24DD6vY0WwTT0EbgH0u4MhqyDG3+ZvIBUQY
	JjaBdUIsLeRg/iQ3E6G7L+X2g==
X-Received: by 2002:a05:600c:198d:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48fe60e552cmr72364905e9.9.1778860050252;
        Fri, 15 May 2026 08:47:30 -0700 (PDT)
Received: from localhost (p200300f65f47db047ce9331f6697a627.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ce9:331f:6697:a627])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe4c834besm69294575e9.3.2026.05.15.08.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:47:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?utf-8?b?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>,
	Dianlong Li <long17.cool@163.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1] rtc: Use named initializers for arrays of i2c_device_data
Date: Fri, 15 May 2026 17:47:20 +0200
Message-ID: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=25562; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=p+h/xp0eOXHBMBhi6jswwec12KIuN8PQMEpTOzHM1os=; b=owGbwMvMwMXY3/A7olbonx/jabUkhix2Bw57xuQw480R3+rK9YUEbmlyOxsbn+R5dUWvVSLJT rN1vUUnozELAyMXg6yYIot945pMqyq5yM61/y7DDGJlApnCwMUpABPpjmL/w8MgaX625+qxpL8/ jXkFA/4/dpdeFPV74fs+8VtPsl715z3N+tdxO8qM0+bhx0lBjA5/buusZEpZtXlW0pUzlzMal65 /spA1+8I04w9J/NKvRCr3HPuc/jJAmjcz9oFoudu6Rb0yOsKGG5LS/Be5Wu5mO8W2QuXWoSDu7T vVG1lldmdfWD8pxHabaMqZz0f+rG1f/Pxv6Yf/GYc7Y8Vy9uUdDX7Pw3lT+ruLfrTXmo2ZW5Z9m B/t6u7GGbiSY6FB3qxTH1W9ZiklCPLyZ3llc/dOyOUVL35fueh3xYG3sTwmZ/1PeOesOp4kmOqj qnF/ulPUnw7D/rmqrcZnK26tsH1gvOL8s9jKJxEi3MYhAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A3765534A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6517-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,codeconstruct.com.au,gmail.com,google.com,163.com,vger.kernel.org,lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email,baylibre.com:mid,cheri-alliance.org:url,lwn.net:url]
X-Rspamd-Action: no action

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify usage of whitespace and commas.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to i2c_device_id is the following:

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	
	 struct i2c_device_id {
	 	char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;     /* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
	index 0123ca8157a8..dfb0b07500a7 100644
	--- a/drivers/regulator/ad5398.c
	+++ b/drivers/regulator/ad5398.c
	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
	 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};
	
	 static const struct i2c_device_id ad5398_id[] = {
	-	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	-	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	+	{ .name = "ad5398", .driver_data_ptr = &df_10_4_120 },
	+	{ .name = "ad5821", .driver_data_ptr = &df_10_4_120 },
	 	{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
	 	struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
	 	struct regulator_config config = { };
	 	struct ad5398_chip_info *chip;
	-	const struct ad5398_current_data_format *df =
	-	                (struct ad5398_current_data_format *)id->driver_data;
	+	const struct ad5398_current_data_format *df = id->driver_data;
	
	 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
	 	if (!chip)

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that. (I didn't find a nice rtc driver that benefits, so
this is "only" a regulator driver example.)

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

Best regards
Uwe

[1] https://cheri-alliance.org/discover-cheri/
    https://lwn.net/Articles/1037974/

 drivers/rtc/rtc-ab-b5ze-s3.c |  2 +-
 drivers/rtc/rtc-ab-eoz9.c    |  2 +-
 drivers/rtc/rtc-abx80x.c     | 20 ++++++++++----------
 drivers/rtc/rtc-bq32k.c      |  2 +-
 drivers/rtc/rtc-ds1307.c     | 36 ++++++++++++++++++------------------
 drivers/rtc/rtc-ds1374.c     |  2 +-
 drivers/rtc/rtc-ds1672.c     |  2 +-
 drivers/rtc/rtc-ds3232.c     |  2 +-
 drivers/rtc/rtc-em3027.c     |  2 +-
 drivers/rtc/rtc-fm3130.c     |  2 +-
 drivers/rtc/rtc-hym8563.c    |  4 ++--
 drivers/rtc/rtc-isl12022.c   |  2 +-
 drivers/rtc/rtc-isl12026.c   |  4 ++--
 drivers/rtc/rtc-isl1208.c    | 10 +++++-----
 drivers/rtc/rtc-m41t80.c     | 22 +++++++++++-----------
 drivers/rtc/rtc-max31335.c   |  4 ++--
 drivers/rtc/rtc-max6900.c    |  2 +-
 drivers/rtc/rtc-nct3018y.c   |  2 +-
 drivers/rtc/rtc-pcf2127.c    |  8 ++++----
 drivers/rtc/rtc-pcf85063.c   | 12 ++++++------
 drivers/rtc/rtc-pcf8523.c    |  2 +-
 drivers/rtc/rtc-pcf8563.c    |  6 +++---
 drivers/rtc/rtc-pcf8583.c    |  2 +-
 drivers/rtc/rtc-rs5c372.c    | 12 ++++++------
 drivers/rtc/rtc-rv3029c2.c   |  4 ++--
 drivers/rtc/rtc-rv8803.c     |  8 ++++----
 drivers/rtc/rtc-rx6110.c     |  2 +-
 drivers/rtc/rtc-rx8010.c     |  2 +-
 drivers/rtc/rtc-rx8025.c     |  4 ++--
 drivers/rtc/rtc-rx8581.c     |  2 +-
 drivers/rtc/rtc-s35390a.c    |  2 +-
 drivers/rtc/rtc-sd2405al.c   |  2 +-
 drivers/rtc/rtc-sd3078.c     |  2 +-
 drivers/rtc/rtc-x1205.c      |  2 +-
 34 files changed, 97 insertions(+), 97 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index 684f9898d768..6439ca427c32 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -933,7 +933,7 @@ MODULE_DEVICE_TABLE(of, abb5zes3_dt_match);
 #endif
 
 static const struct i2c_device_id abb5zes3_id[] = {
-	{ "abb5zes3" },
+	{ .name = "abb5zes3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, abb5zes3_id);
diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index de002f7a39bf..b75f4f665076 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -546,7 +546,7 @@ MODULE_DEVICE_TABLE(of, abeoz9_dt_match);
 #endif
 
 static const struct i2c_device_id abeoz9_id[] = {
-	{ "abeoz9" },
+	{ .name = "abeoz9" },
 	{ }
 };
 
diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 00d7de64ed3e..e5179d0208d6 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -752,16 +752,16 @@ static int abx80x_setup_nvmem(struct abx80x_priv *priv)
 }
 
 static const struct i2c_device_id abx80x_id[] = {
-	{ "abx80x", ABX80X },
-	{ "ab0801", AB0801 },
-	{ "ab0803", AB0803 },
-	{ "ab0804", AB0804 },
-	{ "ab0805", AB0805 },
-	{ "ab1801", AB1801 },
-	{ "ab1803", AB1803 },
-	{ "ab1804", AB1804 },
-	{ "ab1805", AB1805 },
-	{ "rv1805", RV1805 },
+	{ .name = "abx80x", .driver_data = ABX80X },
+	{ .name = "ab0801", .driver_data = AB0801 },
+	{ .name = "ab0803", .driver_data = AB0803 },
+	{ .name = "ab0804", .driver_data = AB0804 },
+	{ .name = "ab0805", .driver_data = AB0805 },
+	{ .name = "ab1801", .driver_data = AB1801 },
+	{ .name = "ab1803", .driver_data = AB1803 },
+	{ .name = "ab1804", .driver_data = AB1804 },
+	{ .name = "ab1805", .driver_data = AB1805 },
+	{ .name = "rv1805", .driver_data = RV1805 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, abx80x_id);
diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 7ad34539be4d..20cd92d00fa1 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -304,7 +304,7 @@ static void bq32k_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bq32k_id[] = {
-	{ "bq32000" },
+	{ .name = "bq32000" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bq32k_id);
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 7205c59ff729..ee8196498443 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1063,24 +1063,24 @@ static const struct chip_desc chips[last_ds_type] = {
 };
 
 static const struct i2c_device_id ds1307_id[] = {
-	{ "ds1307", ds_1307 },
-	{ "ds1308", ds_1308 },
-	{ "ds1337", ds_1337 },
-	{ "ds1338", ds_1338 },
-	{ "ds1339", ds_1339 },
-	{ "ds1388", ds_1388 },
-	{ "ds1340", ds_1340 },
-	{ "ds1341", ds_1341 },
-	{ "ds3231", ds_3231 },
-	{ "m41t0", m41t0 },
-	{ "m41t00", m41t00 },
-	{ "m41t11", m41t11 },
-	{ "mcp7940x", mcp794xx },
-	{ "mcp7941x", mcp794xx },
-	{ "pt7c4338", ds_1307 },
-	{ "rx8025", rx_8025 },
-	{ "isl12057", ds_1337 },
-	{ "rx8130", rx_8130 },
+	{ .name = "ds1307", .driver_data = ds_1307 },
+	{ .name = "ds1308", .driver_data = ds_1308 },
+	{ .name = "ds1337", .driver_data = ds_1337 },
+	{ .name = "ds1338", .driver_data = ds_1338 },
+	{ .name = "ds1339", .driver_data = ds_1339 },
+	{ .name = "ds1388", .driver_data = ds_1388 },
+	{ .name = "ds1340", .driver_data = ds_1340 },
+	{ .name = "ds1341", .driver_data = ds_1341 },
+	{ .name = "ds3231", .driver_data = ds_3231 },
+	{ .name = "m41t0", .driver_data = m41t0 },
+	{ .name = "m41t00", .driver_data = m41t00 },
+	{ .name = "m41t11", .driver_data = m41t11 },
+	{ .name = "mcp7940x", .driver_data = mcp794xx },
+	{ .name = "mcp7941x", .driver_data = mcp794xx },
+	{ .name = "pt7c4338", .driver_data = ds_1307 },
+	{ .name = "rx8025", .driver_data = rx_8025 },
+	{ .name = "isl12057", .driver_data = ds_1337 },
+	{ .name = "rx8130", .driver_data = rx_8130 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1307_id);
diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index c2359eb86bc9..8c247215d611 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -52,7 +52,7 @@
 #define DS1374_REG_TCR		0x09 /* Trickle Charge */
 
 static const struct i2c_device_id ds1374_id[] = {
-	{ "ds1374" },
+	{ .name = "ds1374" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1374_id);
diff --git a/drivers/rtc/rtc-ds1672.c b/drivers/rtc/rtc-ds1672.c
index 6e5314215d00..c610beb55bb5 100644
--- a/drivers/rtc/rtc-ds1672.c
+++ b/drivers/rtc/rtc-ds1672.c
@@ -133,7 +133,7 @@ static int ds1672_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ds1672_id[] = {
-	{ "ds1672" },
+	{ .name = "ds1672" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1672_id);
diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index 18f35823b4b5..d1ef9e0dad34 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -566,7 +566,7 @@ static int ds3232_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ds3232_id[] = {
-	{ "ds3232" },
+	{ .name = "ds3232" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds3232_id);
diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
index dc1ccbc65dcb..d555e5d59881 100644
--- a/drivers/rtc/rtc-em3027.c
+++ b/drivers/rtc/rtc-em3027.c
@@ -129,7 +129,7 @@ static int em3027_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id em3027_id[] = {
-	{ "em3027" },
+	{ .name = "em3027" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, em3027_id);
diff --git a/drivers/rtc/rtc-fm3130.c b/drivers/rtc/rtc-fm3130.c
index f82728ebac0c..28bb6d3f644e 100644
--- a/drivers/rtc/rtc-fm3130.c
+++ b/drivers/rtc/rtc-fm3130.c
@@ -53,7 +53,7 @@ struct fm3130 {
 	int			data_valid;
 };
 static const struct i2c_device_id fm3130_id[] = {
-	{ "fm3130" },
+	{ .name = "fm3130" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fm3130_id);
diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 7a170c0f9710..3156aa5f2d9f 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -564,8 +564,8 @@ static int hym8563_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id hym8563_id[] = {
-	{ "hym8563" },
-	{}
+	{ .name = "hym8563" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, hym8563_id);
 
diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 5fc52dc64213..bc36288854ee 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -604,7 +604,7 @@ static const struct of_device_id isl12022_dt_match[] = {
 MODULE_DEVICE_TABLE(of, isl12022_dt_match);
 
 static const struct i2c_device_id isl12022_id[] = {
-	{ "isl12022" },
+	{ .name = "isl12022" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl12022_id);
diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 45a2c9f676c5..b86a325d8a23 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -485,8 +485,8 @@ static const struct of_device_id isl12026_dt_match[] = {
 MODULE_DEVICE_TABLE(of, isl12026_dt_match);
 
 static const struct i2c_device_id isl12026_id[] = {
-	{ "isl12026" },
-	{ },
+	{ .name = "isl12026" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl12026_id);
 
diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index f71a6bb77b2a..bcaa766a5068 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -110,11 +110,11 @@ static const struct isl1208_config config_raa215300_a0 = {
 };
 
 static const struct i2c_device_id isl1208_id[] = {
-	{ "isl1208", .driver_data = (kernel_ulong_t)&config_isl1208 },
-	{ "isl1209", .driver_data = (kernel_ulong_t)&config_isl1209 },
-	{ "isl1218", .driver_data = (kernel_ulong_t)&config_isl1218 },
-	{ "isl1219", .driver_data = (kernel_ulong_t)&config_isl1219 },
-	{ "raa215300_a0", .driver_data = (kernel_ulong_t)&config_raa215300_a0 },
+	{ .name = "isl1208", .driver_data = (kernel_ulong_t)&config_isl1208 },
+	{ .name = "isl1209", .driver_data = (kernel_ulong_t)&config_isl1209 },
+	{ .name = "isl1218", .driver_data = (kernel_ulong_t)&config_isl1218 },
+	{ .name = "isl1219", .driver_data = (kernel_ulong_t)&config_isl1219 },
+	{ .name = "raa215300_a0", .driver_data = (kernel_ulong_t)&config_raa215300_a0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl1208_id);
diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index b26afef37d9c..3c8c379392c1 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -71,17 +71,17 @@
 #define M41T80_FEATURE_SQ_ALT	BIT(4)	/* RSx bits are in reg 4 */
 
 static const struct i2c_device_id m41t80_id[] = {
-	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
-	{ "m41t65", M41T80_FEATURE_WD },
-	{ "m41t80", M41T80_FEATURE_SQ },
-	{ "m41t81", M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
-	{ "m41t81s", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "m41t82", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "m41t83", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "m41st84", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "m41st85", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "m41st87", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT },
+	{ .name = "m41t62", .driver_data = M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
+	{ .name = "m41t65", .driver_data = M41T80_FEATURE_WD },
+	{ .name = "m41t80", .driver_data = M41T80_FEATURE_SQ },
+	{ .name = "m41t81", .driver_data = M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
+	{ .name = "m41t81s", .driver_data = M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
+	{ .name = "m41t82", .driver_data = M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
+	{ .name = "m41t83", .driver_data = M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
+	{ .name = "m41st84", .driver_data = M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
+	{ .name = "m41st85", .driver_data = M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
+	{ .name = "m41st87", .driver_data = M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
+	{ .name = "rv4162", .driver_data = M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, m41t80_id);
diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index 952b455071d6..595816973851 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -745,8 +745,8 @@ static int max31335_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max31335_id[] = {
-	{ "max31331", (kernel_ulong_t)&chip[ID_MAX31331] },
-	{ "max31335", (kernel_ulong_t)&chip[ID_MAX31335] },
+	{ .name = "max31331", .driver_data = (kernel_ulong_t)&chip[ID_MAX31331] },
+	{ .name = "max31335", .driver_data = (kernel_ulong_t)&chip[ID_MAX31335] },
 	{ }
 };
 
diff --git a/drivers/rtc/rtc-max6900.c b/drivers/rtc/rtc-max6900.c
index 7be31fce5bc7..8ef6d0fcd032 100644
--- a/drivers/rtc/rtc-max6900.c
+++ b/drivers/rtc/rtc-max6900.c
@@ -215,7 +215,7 @@ static int max6900_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max6900_id[] = {
-	{ "max6900" },
+	{ .name = "max6900" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max6900_id);
diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index cd4b1db902e9..700a395fad3a 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -572,7 +572,7 @@ static int nct3018y_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id nct3018y_id[] = {
-	{ "nct3018y" },
+	{ .name = "nct3018y" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nct3018y_id);
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index e4785c5a55d0..1995e9f2756d 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1449,10 +1449,10 @@ static const struct regmap_bus pcf2127_i2c_regmap = {
 static struct i2c_driver pcf2127_i2c_driver;
 
 static const struct i2c_device_id pcf2127_i2c_id[] = {
-	{ "pcf2127", (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
-	{ "pcf2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
-	{ "pca2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
-	{ "pcf2131", (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
+	{ .name = "pcf2127", .driver_data = (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
+	{ .name = "pcf2129", .driver_data = (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
+	{ .name = "pca2129", .driver_data = (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
+	{ .name = "pcf2131", .driver_data = (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index f643e0bd7351..01e209d88f5f 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -665,12 +665,12 @@ static const struct pcf85063_config config_rv8263 = {
 };
 
 static const struct i2c_device_id pcf85063_ids[] = {
-	{ "pca85073a", .driver_data = (kernel_ulong_t)&config_pcf85063a },
-	{ "pcf85063", .driver_data = (kernel_ulong_t)&config_pcf85063 },
-	{ "pcf85063tp", .driver_data = (kernel_ulong_t)&config_pcf85063tp },
-	{ "pcf85063a", .driver_data = (kernel_ulong_t)&config_pcf85063a },
-	{ "rv8263", .driver_data = (kernel_ulong_t)&config_rv8263 },
-	{}
+	{ .name = "pca85073a", .driver_data = (kernel_ulong_t)&config_pcf85063a },
+	{ .name = "pcf85063", .driver_data = (kernel_ulong_t)&config_pcf85063 },
+	{ .name = "pcf85063tp", .driver_data = (kernel_ulong_t)&config_pcf85063tp },
+	{ .name = "pcf85063a", .driver_data = (kernel_ulong_t)&config_pcf85063a },
+	{ .name = "rv8263", .driver_data = (kernel_ulong_t)&config_rv8263 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf85063_ids);
 
diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 2c63c0ffd05a..e8354953836c 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -495,7 +495,7 @@ static int pcf8523_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf8523_id[] = {
-	{ "pcf8523" },
+	{ .name = "pcf8523" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8523_id);
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index b281e9489df1..81d13733b1e9 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -557,9 +557,9 @@ static int pcf8563_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf8563_id[] = {
-	{ "pcf8563" },
-	{ "rtc8564" },
-	{ "pca8565" },
+	{ .name = "pcf8563" },
+	{ .name = "rtc8564" },
+	{ .name = "pca8565" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8563_id);
diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c
index 652b9dfa7566..df5e20cbc26c 100644
--- a/drivers/rtc/rtc-pcf8583.c
+++ b/drivers/rtc/rtc-pcf8583.c
@@ -297,7 +297,7 @@ static int pcf8583_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf8583_id[] = {
-	{ "pcf8583" },
+	{ .name = "pcf8583" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8583_id);
diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 936f4f05c8c7..24bd795d9d95 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -75,12 +75,12 @@ enum rtc_type {
 };
 
 static const struct i2c_device_id rs5c372_id[] = {
-	{ "r2025sd", rtc_r2025sd },
-	{ "r2221tl", rtc_r2221tl },
-	{ "rs5c372a", rtc_rs5c372a },
-	{ "rs5c372b", rtc_rs5c372b },
-	{ "rv5c386", rtc_rv5c386 },
-	{ "rv5c387a", rtc_rv5c387a },
+	{ .name = "r2025sd", .driver_data = rtc_r2025sd },
+	{ .name = "r2221tl", .driver_data = rtc_r2221tl },
+	{ .name = "rs5c372a", .driver_data = rtc_rs5c372a },
+	{ .name = "rs5c372b", .driver_data = rtc_rs5c372b },
+	{ .name = "rv5c386", .driver_data = rtc_rv5c386 },
+	{ .name = "rv5c387a", .driver_data = rtc_rv5c387a },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rs5c372_id);
diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 83331d1fcab0..98953af2a24a 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -807,8 +807,8 @@ static int rv3029_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rv3029_id[] = {
-	{ "rv3029" },
-	{ "rv3029c2" },
+	{ .name = "rv3029" },
+	{ .name = "rv3029c2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rv3029_id);
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 2bf988a89fd7..b9b5fee16ee4 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -631,10 +631,10 @@ static int rv8803_suspend(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(rv8803_pm_ops, rv8803_suspend, rv8803_resume);
 
 static const struct i2c_device_id rv8803_id[] = {
-	{ "rv8803", rv_8803 },
-	{ "rv8804", rx_8804 },
-	{ "rx8803", rx_8803 },
-	{ "rx8900", rx_8900 },
+	{ .name = "rv8803", .driver_data = rv_8803 },
+	{ .name = "rv8804", .driver_data = rx_8804 },
+	{ .name = "rx8803", .driver_data = rx_8803 },
+	{ .name = "rx8900", .driver_data = rx_8900 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rv8803_id);
diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 07bf35ac8d79..1eacd470a27c 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -449,7 +449,7 @@ static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
 
 static const struct i2c_device_id rx6110_i2c_id[] = {
-	{ "rx6110" },
+	{ .name = "rx6110" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 171240e50f48..ce3954132336 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -50,7 +50,7 @@
 #define RX8010_ALARM_AE		BIT(7)
 
 static const struct i2c_device_id rx8010_id[] = {
-	{ "rx8010" },
+	{ .name = "rx8010" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rx8010_id);
diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index c57081f9e02b..5eeaa929f3ef 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -71,8 +71,8 @@ enum rx_model {
 };
 
 static const struct i2c_device_id rx8025_id[] = {
-	{ "rx8025", model_rx_8025 },
-	{ "rx8035", model_rx_8035 },
+	{ .name = "rx8025", .driver_data = model_rx_8025 },
+	{ .name = "rx8035", .driver_data = model_rx_8035 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rx8025_id);
diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 20c2dff01bae..cf4dab94c337 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -294,7 +294,7 @@ static int rx8581_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rx8581_id[] = {
-	{ "rx8581" },
+	{ .name = "rx8581" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rx8581_id);
diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index a4678d7c6cf6..31394f34fb70 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -51,7 +51,7 @@
 #define S35390A_INT2_MODE_PMIN		(BIT(3) | BIT(2)) /* INT2FE | INT2ME */
 
 static const struct i2c_device_id s35390a_id[] = {
-	{ "s35390a" },
+	{ .name = "s35390a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s35390a_id);
diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
index 708ea5d964de..7982a910a537 100644
--- a/drivers/rtc/rtc-sd2405al.c
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -202,7 +202,7 @@ static int sd2405al_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sd2405al_id[] = {
-	{ "sd2405al" },
+	{ .name = "sd2405al" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, sd2405al_id);
diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index 10cc1dcfc774..2c61f0e204a4 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -186,7 +186,7 @@ static int sd3078_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sd3078_id[] = {
-	{ "sd3078" },
+	{ .name = "sd3078" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sd3078_id);
diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c
index b8a0fccef14e..bb1a5c86f621 100644
--- a/drivers/rtc/rtc-x1205.c
+++ b/drivers/rtc/rtc-x1205.c
@@ -663,7 +663,7 @@ static void x1205_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id x1205_id[] = {
-	{ "x1205" },
+	{ .name = "x1205" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, x1205_id);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3



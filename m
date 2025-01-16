Return-Path: <linux-rtc+bounces-2928-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4FCA13319
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 07:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 363FB1679FF
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 06:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846A218FDD5;
	Thu, 16 Jan 2025 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b="R/PsdC9O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F39DA94A
	for <linux-rtc@vger.kernel.org>; Thu, 16 Jan 2025 06:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737008883; cv=none; b=aFygZGrouidXb5Jpy5H9pFA3hOseF4JI3KWn2fFtnF1BxPpsCOIukyEzEG+PbjIyqp0bKPwBO+NU3/fje5wuRFLxuAgGIUFx7/NzEGnBgBQ5BcOsfUDqRnY7X3JLAVu5nGT9KTurQg2/gVTVu0ysClvWXbLN3QM9sC38PNJLfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737008883; c=relaxed/simple;
	bh=gENyl4RBC/HtCkZ1XrUSfrzYKshvc7ZLfer/r/UoJLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RJGMc+J8JBjDPKclpC3VrPRZduvfpAyfmWox/KmqF0O3hxUBGCZRVyUPE8E0aUVZ3TGj6ix1oToGTMd52M4dJ04BvntUuwuRHI2hauGiVYC32YfbDDNbmEM7Oj8xRQkhY7Q8LiT1o6OOTv4Up89IDVwyScOYlH8aeYxqIjW2+10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com; spf=pass smtp.mailfrom=mvista.com; dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b=R/PsdC9O; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mvista.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163dc5155fso8516425ad.0
        for <linux-rtc@vger.kernel.org>; Wed, 15 Jan 2025 22:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1737008880; x=1737613680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+2UIEDT3CO7Oxn8DnlQgRLozGnyF/sPg3vvYuseF88=;
        b=R/PsdC9OG8EpCKwq9UezLiq9YYVdh0JdQeFef1G/bO3yKKPCcqSD4QbmeievGuQ9yO
         EGUDbSaSQyllZKr4dwQ0BNFoC8S+1h8cYadBxyoUEfKf5SBdaKI3Ijgdqje6TR881LYz
         07GLk6P3+RVBiI0qT282wCabDLcstTf54wW/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737008880; x=1737613680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+2UIEDT3CO7Oxn8DnlQgRLozGnyF/sPg3vvYuseF88=;
        b=MOYOlFEw4Yi2M6lNYgxgBPCTKOpfLpBgiyw+dxwn1PO8CDjQiDRz7SgLDUDgvHRPTM
         Ue5Cc7LhaAmZ95X+W0uQUjJ6LPM9kk9lqPDoVxtkqkoL9DYCf9mtyVHE8wsAAOy2P80D
         Q4+JxgUaZb4EFWXUH8HuPh0zCI6MF00rrheoWY3OIyHKZC+7+hP4TS8CEd8sPZQKv4nF
         DplxuWZEyl+flbZxMaQGK9n82q3v69pkBlIuFoCu1vzGItXb38JxU0G9d6vb2bJWCxhq
         dvHyV8t1wOUIwIlYbX34KMqyJC/fKyyhoNBOU/Dja6mTJS+vsKCpUOqMWHii25WCZ7zx
         2knQ==
X-Gm-Message-State: AOJu0YzB5S2fGhEgf6XEAbZvB5jhWczc6x2myAX5G5YPkMjkk3cjtIc7
	mxT+3x9OTNkpxetwtXRasdn0qHDdVOTgPfBcreROp/emCB2TaNfLDrTUaZkbSp8=
X-Gm-Gg: ASbGncs8Tf537QUB+sSaJCNdEZMUIq8UIIdqL6B5+VqP+5e1bXQLGwa3TZP9mZF1Yjl
	T7hvtublqqeVgpcgdYebVN7ZzU8qI2O/Cx0CRj45wdNxbx4Jjv1NK2GzEXpFXAzZF60fmdEAAue
	5HDgnu4B/0kQjQVlgWJYIPDLzR2pZbQ+nkuG7bUTYoubQqwM8k/vLCi8hh9LJB3+Td3IYhHpBlM
	IOZ/+tork4vBsn8MhcWFtBMcTDZHKXDus5Hksnd/HpwI5raTBdm29OHLaqgQ6JdS204mDM=
X-Google-Smtp-Source: AGHT+IGO/JXiAhRonPkK9sTBTPdq8t5RFLLGxRujNl37rlmT8Jb1TVOWPwvmYKAup6OxMtNOrxywvg==
X-Received: by 2002:a17:903:94d:b0:216:4dfe:3ebd with SMTP id d9443c01a7336-21a83fe4616mr481207695ad.50.1737008879633;
        Wed, 15 Jan 2025 22:27:59 -0800 (PST)
Received: from niyas-desktop.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f86bsm90874535ad.36.2025.01.15.22.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 22:27:59 -0800 (PST)
From: nmydeen@mvista.com
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cminyard@mvista.com,
	"A. Niyas Ahamed Mydeen" <nmydeen@mvista.com>
Subject: [PATCH] rtc-m41t62: kickstart ocillator upon failure
Date: Thu, 16 Jan 2025 11:56:41 +0530
Message-Id: <20250116062641.366679-1-nmydeen@mvista.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "A. Niyas Ahamed Mydeen" <nmydeen@mvista.com>

The ocillator on the m41t62 (and other chips of this type) needs
a kickstart upon a failure; the RTC read routine will notice the
oscillator failure and fail reads.  This is added in the RTC write
routine; this allows the system to know that the time in the RTC
is accurate.  This is following the procedure described in section
3.11 of  "https://www.st.com/resource/en/datasheet/m41t62.pdf"

Signed-off-by: A. Niyas Ahamed Mydeen <nmydeen@mvista.com>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/rtc/rtc-m41t80.c | 70 ++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 1f58ae8b151e..77c21c91bae3 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/string.h>
+#include <linux/delay.h>
 #ifdef CONFIG_RTC_DRV_M41T80_WDT
 #include <linux/fs.h>
 #include <linux/ioctl.h>
@@ -204,7 +205,7 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		return flags;
 
 	if (flags & M41T80_FLAGS_OF) {
-		dev_err(&client->dev, "Oscillator failure, data is invalid.\n");
+		dev_err(&client->dev, "Oscillator failure, time may not be accurate, write time to RTC to fix it.\n");
 		return -EINVAL;
 	}
 
@@ -227,21 +228,60 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
+static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *in_tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct m41t80_data *clientdata = i2c_get_clientdata(client);
+	struct rtc_time tm = *in_tm;
 	unsigned char buf[8];
 	int err, flags;
+	time64_t time = 0;
 
+	flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
+	if (flags < 0)
+		return flags;
+	if (flags & M41T80_FLAGS_OF) {
+		/* OF cannot be immediately reset: oscillator has to be restarted. */
+		dev_warn(&client->dev, "OF bit is still set, kickstarting clock.\n");
+		err = i2c_smbus_write_byte_data(client, M41T80_REG_SEC, M41T80_SEC_ST);
+		if (err < 0) {
+			dev_err(&client->dev, "Can't set ST bit\n");
+			return err;
+		}
+		err = i2c_smbus_write_byte_data(client, M41T80_REG_SEC,
+						    flags & ~M41T80_SEC_ST);
+		if (err < 0) {
+			dev_err(&client->dev, "Can't clear ST bit\n");
+			return err;
+		}
+		/* oscillator must run for 4sec before we attempt to reset OF bit */
+		msleep(4000);
+		/* Clear the OF bit of Flags Register */
+		err = i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
+					flags & ~M41T80_FLAGS_OF);
+		if (err < 0) {
+			dev_err(&client->dev, "Unable to write flags register\n");
+			return err;
+		}
+		flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
+		if (flags < 0)
+			return flags;
+		else if (flags & M41T80_FLAGS_OF) {
+			dev_err(&client->dev, "Can't clear the OF bit check battery\n");
+			return err;
+		}
+		/* add 4sec of oscillator stablize time otherwise we are behind 4sec */
+		time = rtc_tm_to_time64(&tm);
+		rtc_time64_to_tm(time+4, &tm);
+	}
 	buf[M41T80_REG_SSEC] = 0;
-	buf[M41T80_REG_SEC] = bin2bcd(tm->tm_sec);
-	buf[M41T80_REG_MIN] = bin2bcd(tm->tm_min);
-	buf[M41T80_REG_HOUR] = bin2bcd(tm->tm_hour);
-	buf[M41T80_REG_DAY] = bin2bcd(tm->tm_mday);
-	buf[M41T80_REG_MON] = bin2bcd(tm->tm_mon + 1);
-	buf[M41T80_REG_YEAR] = bin2bcd(tm->tm_year - 100);
-	buf[M41T80_REG_WDAY] = tm->tm_wday;
+	buf[M41T80_REG_SEC] = bin2bcd(tm.tm_sec);
+	buf[M41T80_REG_MIN] = bin2bcd(tm.tm_min);
+	buf[M41T80_REG_HOUR] = bin2bcd(tm.tm_hour);
+	buf[M41T80_REG_DAY] = bin2bcd(tm.tm_mday);
+	buf[M41T80_REG_MON] = bin2bcd(tm.tm_mon + 1);
+	buf[M41T80_REG_YEAR] = bin2bcd(tm.tm_year - 100);
+	buf[M41T80_REG_WDAY] = tm.tm_wday;
 
 	/* If the square wave output is controlled in the weekday register */
 	if (clientdata->features & M41T80_FEATURE_SQ_ALT) {
@@ -261,18 +301,6 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		return err;
 	}
 
-	/* Clear the OF bit of Flags Register */
-	flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
-	if (flags < 0)
-		return flags;
-
-	err = i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
-					flags & ~M41T80_FLAGS_OF);
-	if (err < 0) {
-		dev_err(&client->dev, "Unable to write flags register\n");
-		return err;
-	}
-
 	return err;
 }
 
-- 
2.34.1



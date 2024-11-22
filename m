Return-Path: <linux-rtc+bounces-2605-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E00BC9D5D16
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 11:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63E2A2873D5
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 10:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EACF1DE2C8;
	Fri, 22 Nov 2024 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FDFuGV7W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857601D7982
	for <linux-rtc@vger.kernel.org>; Fri, 22 Nov 2024 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270503; cv=none; b=k0WJl02bBPk0TzZ69PhPdiE8ki1F+8RWzdzjhXhZQBmHloYOzaEhzRDLNIXXmcLW/UULVnm2SOYgeRI0S7snrYiGiXgr33ppJ0f6e28PeAxP3v05oUUJTuJne2IwY10yy36ziGz2ep+pNMYuRRi8+zgR0F4OBdKrK+XlhTXa1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270503; c=relaxed/simple;
	bh=NuFRz+V303IWhteU9orkViLhPrm638XeiRi9mVJVexU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=udHbOeZZ6KYZCae5tTWAsjuGYoJmgRA6YO6cHHDbVtwoI04qM3xkt0XERqFeDyazTglcBCCUFhjyZmwTtBE764ViA0epo1wkJSbLMmqZsr5WiZVavg5Usx+BSVo29aOQ1VZA0fGP1RVqVtfrHsvxj1hcFpjXqf3SAGFS8rUZ1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FDFuGV7W; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ixahQwW8VT9zz29NcQ7H3mVFKSI558soSf0fx78Kdbg=; b=FDFuGV
	7WxsYKiw2sN08F/rTB+y6cOR8sN/23NmiqxUow+u5XUARFNacFw7GjIZ5TBp70Ed
	GJnnvEQUQsEw5p7HlnfOZC8QxjPTO9QBi+KVtqsWjb17zmBCO4EoBqWKKKmBwDhh
	KmcNoAcOMFmgphUdV42Zf7R5uL8BkbuiQKRxzFY80LpejjQudIXrkTnt29xZBy2U
	VOw/7/EoNfRQAQaKOpYJV0qbPCfDpK6ynpJe/Q8av8px5yR90/Sokh1+FjVk2AH3
	hs8r9MNZpwiH/hJPOLNQAwQ12kSt/IXdicR23p6ske/HCSoA5f6Wwc6yoFDZxcdg
	+A/q5M5+W1ZkBa6g==
Received: (qmail 1555048 invoked from network); 22 Nov 2024 11:14:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2024 11:14:51 +0100
X-UD-Smtp-Session: l3s3148p1@+VRKp30nsIcujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [RFC PATCH 2/2] rtc: rzn1: reduce register access
Date: Fri, 22 Nov 2024 11:14:48 +0100
Message-Id: <20241122101448.4374-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
References: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RTC has special 32bit registers which return multiple of the same
8bit registers at once. Use these to minimize register access. Also, do
the to/from BCD conversions right away, so 'tm' always contains values
as described in time.h.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-rzn1.c | 75 +++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 42 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 4ae6e349faa0..cb220807d925 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -35,13 +35,13 @@
 #define   RZN1_RTC_CTL2_WUST BIT(5)
 #define   RZN1_RTC_CTL2_STOPPED (RZN1_RTC_CTL2_WAIT | RZN1_RTC_CTL2_WST)
 
-#define RZN1_RTC_SEC 0x14
-#define RZN1_RTC_MIN 0x18
-#define RZN1_RTC_HOUR 0x1c
-#define RZN1_RTC_WEEK 0x20
-#define RZN1_RTC_DAY 0x24
-#define RZN1_RTC_MONTH 0x28
-#define RZN1_RTC_YEAR 0x2c
+#define RZN1_RTC_TIME 0x30
+#define RZN1_RTC_TIME_MIN_SHIFT 8
+#define RZN1_RTC_TIME_HOUR_SHIFT 16
+#define RZN1_RTC_CAL 0x34
+#define RZN1_RTC_CAL_DAY_SHIFT 8
+#define RZN1_RTC_CAL_MON_SHIFT 16
+#define RZN1_RTC_CAL_YEAR_SHIFT 24
 
 #define RZN1_RTC_SUBU 0x38
 #define   RZN1_RTC_SUBU_DEV BIT(7)
@@ -52,12 +52,8 @@
 #define RZN1_RTC_ALW 0x48
 
 #define RZN1_RTC_SECC 0x4c
-#define RZN1_RTC_MINC 0x50
-#define RZN1_RTC_HOURC 0x54
-#define RZN1_RTC_WEEKC 0x58
-#define RZN1_RTC_DAYC 0x5c
-#define RZN1_RTC_MONTHC 0x60
-#define RZN1_RTC_YEARC 0x64
+#define RZN1_RTC_TIMEC 0x68
+#define RZN1_RTC_CALC 0x6c
 
 struct rzn1_rtc {
 	struct rtc_device *rtcdev;
@@ -66,13 +62,18 @@ struct rzn1_rtc {
 
 static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
 {
-	tm->tm_sec = readl(rtc->base + RZN1_RTC_SECC);
-	tm->tm_min = readl(rtc->base + RZN1_RTC_MINC);
-	tm->tm_hour = readl(rtc->base + RZN1_RTC_HOURC);
-	tm->tm_wday = readl(rtc->base + RZN1_RTC_WEEKC);
-	tm->tm_mday = readl(rtc->base + RZN1_RTC_DAYC);
-	tm->tm_mon = readl(rtc->base + RZN1_RTC_MONTHC);
-	tm->tm_year = readl(rtc->base + RZN1_RTC_YEARC);
+	u32 val;
+
+	val = readl(rtc->base + RZN1_RTC_TIMEC);
+	tm->tm_sec = bcd2bin(val);
+	tm->tm_min = bcd2bin(val >> RZN1_RTC_TIME_MIN_SHIFT);
+	tm->tm_hour = bcd2bin(val >> RZN1_RTC_TIME_HOUR_SHIFT);
+
+	val = readl(rtc->base + RZN1_RTC_CALC);
+	tm->tm_wday = val & 0x0f;
+	tm->tm_mday = bcd2bin(val >> RZN1_RTC_CAL_DAY_SHIFT);
+	tm->tm_mon = bcd2bin(val >> RZN1_RTC_CAL_MON_SHIFT) - 1;
+	tm->tm_year = bcd2bin(val >> RZN1_RTC_CAL_YEAR_SHIFT) + 100;
 }
 
 static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -90,16 +91,9 @@ static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	rzn1_rtc_get_time_snapshot(rtc, tm);
 	secs = readl(rtc->base + RZN1_RTC_SECC);
-	if (tm->tm_sec != secs)
+	if (tm->tm_sec != bcd2bin(secs))
 		rzn1_rtc_get_time_snapshot(rtc, tm);
 
-	tm->tm_sec = bcd2bin(tm->tm_sec);
-	tm->tm_min = bcd2bin(tm->tm_min);
-	tm->tm_hour = bcd2bin(tm->tm_hour);
-	tm->tm_mday = bcd2bin(tm->tm_mday);
-	tm->tm_mon = bcd2bin(tm->tm_mon) - 1;
-	tm->tm_year = bcd2bin(tm->tm_year) + 100;
-
 	return 0;
 }
 
@@ -109,13 +103,6 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	u32 val;
 	int ret;
 
-	tm->tm_sec = bin2bcd(tm->tm_sec);
-	tm->tm_min = bin2bcd(tm->tm_min);
-	tm->tm_hour = bin2bcd(tm->tm_hour);
-	tm->tm_mday = bin2bcd(tm->tm_mday);
-	tm->tm_mon = bin2bcd(tm->tm_mon + 1);
-	tm->tm_year = bin2bcd(tm->tm_year - 100);
-
 	val = readl(rtc->base + RZN1_RTC_CTL2);
 	if (!(val & RZN1_RTC_CTL2_STOPPED)) {
 		/* Hold the counter if it was counting up */
@@ -129,13 +116,17 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 			return ret;
 	}
 
-	writel(tm->tm_sec, rtc->base + RZN1_RTC_SEC);
-	writel(tm->tm_min, rtc->base + RZN1_RTC_MIN);
-	writel(tm->tm_hour, rtc->base + RZN1_RTC_HOUR);
-	writel(tm->tm_wday, rtc->base + RZN1_RTC_WEEK);
-	writel(tm->tm_mday, rtc->base + RZN1_RTC_DAY);
-	writel(tm->tm_mon, rtc->base + RZN1_RTC_MONTH);
-	writel(tm->tm_year, rtc->base + RZN1_RTC_YEAR);
+	val = bin2bcd(tm->tm_sec);
+	val |= bin2bcd(tm->tm_min) << RZN1_RTC_TIME_MIN_SHIFT;
+	val |= bin2bcd(tm->tm_hour) << RZN1_RTC_TIME_HOUR_SHIFT;
+	writel(val, rtc->base + RZN1_RTC_TIME);
+
+	val = tm->tm_wday;
+	val |= bin2bcd(tm->tm_mday) << RZN1_RTC_CAL_DAY_SHIFT;
+	val |= bin2bcd(tm->tm_mon + 1) << RZN1_RTC_CAL_MON_SHIFT;
+	val |= bin2bcd(tm->tm_year - 100) << RZN1_RTC_CAL_YEAR_SHIFT;
+	writel(val, rtc->base + RZN1_RTC_CAL);
+
 	writel(0, rtc->base + RZN1_RTC_CTL2);
 
 	return 0;
-- 
2.39.2



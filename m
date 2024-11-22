Return-Path: <linux-rtc+bounces-2606-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD799D5D17
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 11:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0E4E287782
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 10:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626A71DE2D3;
	Fri, 22 Nov 2024 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GurcsVsP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F11D61A2
	for <linux-rtc@vger.kernel.org>; Fri, 22 Nov 2024 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270503; cv=none; b=UGvFuOk0WRmetg4hEnB9rbdQAjFpIoMtWEgEWxjrGLLyIjO7wocH5kB0a8TlIghEgLXATumK7QxEC5Ebuahf2OHXXd7iW6MEzZU3rt8JvqlArVIuyLs0WR5r+I5oxUDMcm9gpuduCULs+m7/YOjAoXC5e9LJC1N2/dY253i7y1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270503; c=relaxed/simple;
	bh=xvEJvPkFwS7eLxUO0bzoxOM7iX8Qgx82k/OqvYB3ghM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KfsU2xFRXHHleb39mt6PD1AAZyMg5kwbB8O/WYAioR8Cc9TTFufO/F7Abo/n/86OWK/IeadVKUvRePc5OIPkK5QMjLdIUBTIrVrYnnOu4q6JTJPlgPnYinEGaUT8sXOj5HR/XBq8X87dRkwRimFu7NEegv6pW4oZ5gEMZ+Pl6uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GurcsVsP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Qr6EkVsJn9046R0PVy7pEK/SF2WpOreaHc3BjBndO9o=; b=GurcsV
	sPEcCQ+xqd7O3tbLqeWM88fRo01leKUYKIXOlXifQ8eECn/X5ocCjlcU0kSqwuLO
	3Vrk/oHLK8WtgEzPYw4NZcsy7WP/0+dWaTDjpnTYIuAsEYJmkmYoUh+9jgzaLvc0
	aFM3hVNhJrLmVPCSaecRCWKBCMv9l5bDjw8NIg9MPQfcJaZtZLr493w5YC0w/lsK
	NCwQCZQM28wcXRKPttbNRvNBYT/DMN/hXjJQ2hHZucaej/NhTv/4ikRMP8/gadZK
	ozVQiCr513HyL42ZPaC5UJD13P6oSPm+09FNEwgxABRnobr2AG8RXYUqilaPVNIr
	2H4xVwpySbKjwqbg==
Received: (qmail 1555018 invoked from network); 22 Nov 2024 11:14:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2024 11:14:50 +0100
X-UD-Smtp-Session: l3s3148p1@oVA/p30nrocujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [RFC PATCH 1/2] rtc: rzn1: drop superfluous wday calculation
Date: Fri, 22 Nov 2024 11:14:47 +0100
Message-Id: <20241122101448.4374-2-wsa+renesas@sang-engineering.com>
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

The week register simply counts from 0 to 6 where the numbers do not
even represent a specific weekday. So we can adopt 'tm_wday' numbering
of the RTC core without converting it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-rzn1.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index b0ea2847e982..4ae6e349faa0 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -75,19 +75,6 @@ static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm
 	tm->tm_year = readl(rtc->base + RZN1_RTC_YEARC);
 }
 
-static unsigned int rzn1_rtc_tm_to_wday(struct rtc_time *tm)
-{
-	time64_t time;
-	unsigned int days;
-	u32 secs;
-
-	time = rtc_tm_to_time64(tm);
-	days = div_s64_rem(time, 86400, &secs);
-
-	/* day of the week, 1970-01-01 was a Thursday */
-	return (days + 4) % 7;
-}
-
 static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
@@ -109,7 +96,6 @@ static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_sec = bcd2bin(tm->tm_sec);
 	tm->tm_min = bcd2bin(tm->tm_min);
 	tm->tm_hour = bcd2bin(tm->tm_hour);
-	tm->tm_wday = bcd2bin(tm->tm_wday);
 	tm->tm_mday = bcd2bin(tm->tm_mday);
 	tm->tm_mon = bcd2bin(tm->tm_mon) - 1;
 	tm->tm_year = bcd2bin(tm->tm_year) + 100;
@@ -126,7 +112,6 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_sec = bin2bcd(tm->tm_sec);
 	tm->tm_min = bin2bcd(tm->tm_min);
 	tm->tm_hour = bin2bcd(tm->tm_hour);
-	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
 	tm->tm_mday = bin2bcd(tm->tm_mday);
 	tm->tm_mon = bin2bcd(tm->tm_mon + 1);
 	tm->tm_year = bin2bcd(tm->tm_year - 100);
-- 
2.39.2



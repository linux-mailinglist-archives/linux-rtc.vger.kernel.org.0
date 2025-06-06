Return-Path: <linux-rtc+bounces-4236-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2DAD0628
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Jun 2025 17:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDB603B49D8
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Jun 2025 15:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B259028B401;
	Fri,  6 Jun 2025 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TAopHYqr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DBD28B408
	for <linux-rtc@vger.kernel.org>; Fri,  6 Jun 2025 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224712; cv=none; b=ILfEkhMsKGDDC4aEqEHy6h0dicrrUdQ2llqMo3AVqguVHImSAAdFSw3RhB5yGw5VoVrCc40zfN1IUF95AdmamjINj+fx5VB3OrRTOr9Oa+g71hCOosHeADCFXsFFAG5VaerHCpfhcqGWRoHk7Gw1wUQ/8IPRKe+FyfLjYJNEwEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224712; c=relaxed/simple;
	bh=jZ54zUGYRtaYPC2dNzgFfWoIaofVNb8663snXPh4iuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DBnRx3bydOAQYwmJl+azyjUgjHq0OWMrnjSHDfBe7QMrXR9HZrVO+EOmpailJx0fH3tIRyqmJFcpOAe4c1L00QwskgDbXQuCWuQ7QNNyF9LWWX+Mt1AiGboa7r6wgFQUh2LmGOLi2iV7C7LfGq7cxK/tvAjV/1nURUDy+Ck02z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TAopHYqr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so18087365e9.0
        for <linux-rtc@vger.kernel.org>; Fri, 06 Jun 2025 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749224708; x=1749829508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZGpdp7+aEvwvZZDF4Nd8/ciwU4q/ZoafPYs+J9R60o=;
        b=TAopHYqrrCYwYPM2FYd/BTGmQGgXgUK8KbRyKAsunuV6SGPjs+bBC5mBVlTM9HWfry
         FPmONw5S44PL7t3ti6Sfjp53vGECyig3oETywVBN2D8PuSbV0DTKOYYr9WWb/2LCYdb1
         ZTD6f7PdHgQlmj9eRhUaNC4IYPNFZ47R4dyCkgaYpG7Ez0BfRdpoptcLfFBWmJqoIbJE
         BQ4eL8OreCDSvYIiu7rjxUbdOX8cJ34NrRABq9yJNclXFd3U1cjYkzvvseH3TYS2YNcw
         QkngTRMPFhOauDaHVpQ9+SHzB+8hLGsXMd6A4925sTyZ2yL5efDJnU5FNfU6ZnLn7Nya
         PTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749224708; x=1749829508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZGpdp7+aEvwvZZDF4Nd8/ciwU4q/ZoafPYs+J9R60o=;
        b=KheE+pVhvl31oNHnq+096ctOYT7EufFv6CT+yb4FynCDVPnd9ve5eiCHjpYiMpdIYE
         FpdmOuCsR/EUszI68OD03NUfb7mjQLOe7RKu70/1pqzbXR8WYkgZzht37wMRD3SFbLuD
         iezyvZM/OW51udjWBOoqZ625jlQo7S6HQqOHQsfnzH5esaTSUDUXlMDNE0EfSj+6H5S6
         hL8uTPl+NVk5c91tLII5PoQJezkFLJKyGzKPu9C8G2CCyPrpKiaEs2FC9BNr6jQs4Zmb
         IM/A90DgYOMLO+tUe5hzO3uFojUaOvyyxPBAOgfW7esiWN6EyX944C3rBivUjNpaXC3D
         PNcg==
X-Gm-Message-State: AOJu0Yz5v2L9Fd+84hF3X6nCt6YVaOspojjiY9edLQdNW5PlkU6BRxQB
	sB4i5heFrXw5HukCbDe0kMtqQ/0RhAv0Iw/2wp2O6lSipGVS8FzXTFMTod1cHL78N2Q=
X-Gm-Gg: ASbGncvoWlWqUOrZl0p0043zMiQRrMzDDHeDcjQGW10ajHTWkc187LggN7TH8cOfFGy
	SzEM5BPbpmPndp4ebcMmag/fbcAG2zaX9aNVQfKPkPAtiJhy1i8ntwOwGNgUZV/wmvJPZW1blCY
	BYFLNzxZpcAN/ry/CYWy/cnw9cjC0OCgRgdkz2B5eVCRaM3Vb1A7ESuVbdXMNSuZwHcS7O2ADoY
	SmRy5T8oWznBVQRVYFYWf2+2CpXlaaHzpccSmiEJ/TXaLfcOZTSWoN/q3AkOWzEkZACq9fDf+5K
	f0TaYUSB0+S4RQ4w1yrQrloERnIO+cIl356SdEPJV2N1mxrLXpV9HtiBTUTFQ104E+V/Q/BQFDK
	EeKxPUPT9S0F1hADSUA==
X-Google-Smtp-Source: AGHT+IGnUvlfo0UQ4rvZrlFoNBcvHu2pYraip4kpIwhTpKWAE8txMCEibwhOOsacnXjCerAPk1WK8Q==
X-Received: by 2002:a05:600c:4686:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-45201423593mr39201105e9.27.1749224708154;
        Fri, 06 Jun 2025 08:45:08 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4526e0563cesm27067275e9.1.2025.06.06.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:45:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-rtc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.15.y 1/2] rtc: Make rtc_time64_to_tm() support dates before 1970
Date: Fri,  6 Jun 2025 17:44:38 +0200
Message-ID:  <b36409ef16fd9662b442a0fc908cb44f52535d63.1749223334.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749223334.git.u.kleine-koenig@baylibre.com>
References: <cover.1749223334.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NXKdrbrx/lgAWCXht+l/W99usKyzytg6t1rZeScXRPg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoQwzpEfTPsoXUucetMdYNEH8pvYLptbUGOrYA6 nXm3EGmHYSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEMM6QAKCRCPgPtYfRL+ TrgeB/9+5mt+iPcUBmYczus79vrwere5SvCKwlLfKNDdSAhUJoVDX+6o3pq/LU1TlcSEze8GiQn xs5bPpJWH5Y8+EClDQhKM9HgTJbetCtzpQ6kcd2BrkD5xL5+lB+93k/rA4Dhxg8YSLT7wM0070c AK5cLpt8IdIlcO15mtdAA9oyqd63zuaf3HAURikDZGQbYsBnskh5pRiEHx+RdXExlWUO73xYUqN JUC+W5kxpLxkJYpwvkrF45V8Rz1fEBhOLN/D00Ony1Xs5sZu0+JMp3/9jbfzLVQvR8g75PVeyBd 1elzhhTgDQtdNGSZMCsSKX0QBXMtthWCcC0YHJSgoEYxb9BU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Alexandre Mergnat <amergnat@baylibre.com>

commit 7df4cfef8b351fec3156160bedfc7d6d29de4cce upstream.

Conversion of dates before 1970 is still relevant today because these
dates are reused on some hardwares to store dates bigger than the
maximal date that is representable in the device's native format.
This prominently and very soon affects the hardware covered by the
rtc-mt6397 driver that can only natively store dates in the interval
1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
to such a device, rtc_time64_to_tm() must do the right thing for
time=-2208988800.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Link: https://lore.kernel.org/r/20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/lib.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
index fe361652727a..13b5b1f20465 100644
--- a/drivers/rtc/lib.c
+++ b/drivers/rtc/lib.c
@@ -46,24 +46,38 @@ EXPORT_SYMBOL(rtc_year_days);
  * rtc_time64_to_tm - converts time64_t to rtc_time.
  *
  * @time:	The number of seconds since 01-01-1970 00:00:00.
- *		(Must be positive.)
+ *		Works for values since at least 1900
  * @tm:		Pointer to the struct rtc_time.
  */
 void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 {
-	unsigned int secs;
-	int days;
+	int days, secs;
 
 	u64 u64tmp;
 	u32 u32tmp, udays, century, day_of_century, year_of_century, year,
 		day_of_year, month, day;
 	bool is_Jan_or_Feb, is_leap_year;
 
-	/* time must be positive */
+	/*
+	 * Get days and seconds while preserving the sign to
+	 * handle negative time values (dates before 1970-01-01)
+	 */
 	days = div_s64_rem(time, 86400, &secs);
 
+	/*
+	 * We need 0 <= secs < 86400 which isn't given for negative
+	 * values of time. Fixup accordingly.
+	 */
+	if (secs < 0) {
+		days -= 1;
+		secs += 86400;
+	}
+
 	/* day of the week, 1970-01-01 was a Thursday */
 	tm->tm_wday = (days + 4) % 7;
+	/* Ensure tm_wday is always positive */
+	if (tm->tm_wday < 0)
+		tm->tm_wday += 7;
 
 	/*
 	 * The following algorithm is, basically, Proposition 6.3 of Neri
@@ -93,7 +107,7 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 	 * thus, is slightly different from [1].
 	 */
 
-	udays		= ((u32) days) + 719468;
+	udays		= days + 719468;
 
 	u32tmp		= 4 * udays + 3;
 	century		= u32tmp / 146097;
-- 
2.47.2



Return-Path: <linux-rtc+bounces-4297-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A9AD8F74
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Jun 2025 16:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6B7916857B
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Jun 2025 14:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E098B1547E7;
	Fri, 13 Jun 2025 14:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mRdeFDEc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BB42E11BD
	for <linux-rtc@vger.kernel.org>; Fri, 13 Jun 2025 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824663; cv=none; b=dglBrhZN+2T36yVEfWqnYiotziai4bul9w9nRfqcQyx5Jdvj1H249xTa4gzJc5x+2Ni/4Yq7n3UM7F6fNF+Kd3GhjSvF0StTiZKKrg92Ac3lQKzOjQHAtuKmNtuu6X8J7goUIoaGjGX9+wniPVRy/ASWB3rc2sdaoENC6SSP6Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824663; c=relaxed/simple;
	bh=ySM0p11gwaBRYZtmfgHfPeWf0KOPWOQ0ExyWPvCzOnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K75JRrEnqHAMy31qwfA5s2OSdr4F6diJg7aBzA8ZJXRCHJSIhxONUSgPciMzDdG5xMhAMsY0+R5HDV4wgCF/EgfqTplXxj8wbf/JjRYAY/GYzEITuuUDtZeRZdG0TvsSn/9Ko0zzhrnUszyiuSsr904y8FuMVWTdCo4htpPKxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mRdeFDEc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6086502e750so4200884a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 13 Jun 2025 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749824660; x=1750429460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oGN/fSlRwZ2G+ID7GQyvXGivX3j6ge751YU9hZRZ1hI=;
        b=mRdeFDEcCmqJDSITO1Tbdgj5vZ8V4N1WqFgLVIKKmZrsOyO73Wx6oFpJvRVd8mSDhM
         W1Uya+tNShc1XvGLIei5z8H+mPr7lDOYpY5v4oEvb5pAUeKLdxZrt6Veplswq2MhiWmW
         wBTm6bvoFzdzvvNe55jGQmOUB3qMup0sqjkQ6X4Kh282Dd7gVj9fXIRvSti+JXAAXDMz
         tjCDJVKmnzzPDmrqwQ+YiRxNhWjXF50mqmrxxwYE4dvJfRdtfsRZuG2ypcy6Zi9ljURd
         /apSDeF+NwuJsUO7snjThPYk1kC/Jb/oS8JUZ3IaQJgfSGgnn+TpBQhu0G8zAWlcsFPD
         T3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824660; x=1750429460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGN/fSlRwZ2G+ID7GQyvXGivX3j6ge751YU9hZRZ1hI=;
        b=nQmxXT3zaX6JVZERW1p9ZlnJps5NpMzGx+oGaEtq7uihkgy1IyAnrTun9QAH5urkMO
         1fvC3dDKOzNtW8zeepZqvDdOaKsYv9alYTkXTC18zSTCQ6ouX8YPnHDVCsTPVzQuk2Zi
         Ea9HdsQeKo32DFuXy983M+JFenqfr5gWBZI7yWoTJJ+xIj7aPf5gaColHJdekW8LgLhb
         krb1dfAO09FAkqH0cGuXi97jakxoQfNAThi92Y5pNyCD83IHo4bYYZUSktkAfktsrHM8
         zwu6czNClwtN1bok9zXQiQofySGTvXe8rVLLYoXpbZNPfM0fYBqJhIb03tYrKzDJcKLR
         mu9g==
X-Forwarded-Encrypted: i=1; AJvYcCU0cEk6oMgM0F8WS1qnyKZge60jEsqWMSGX5Uuw9GXeS2nNXUvwY7bNUmOQGKlg+RgqcmzmYge9mhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42yD9SjrR7oWZHpkEc6hZdt0uOBvBVG2V1svwHQTrK0J7cxMN
	s6yi8cdOBOB+bYQ+kFbIsC3XbmXqqOtR8NiL9BmEngzIy+LoMK90hbk0ng7d7It7XPw=
X-Gm-Gg: ASbGnctTuaEcO2DPFBiCulHGDSRmRMLU25fHqLB5t57tLx3g3zCnjPwfIMO76o4kNNl
	EXaBk3v08I5LHLw1UJHNBrptB7QMzACfiw8ChApgMVpop2aK0hPuzUbZfGWnHdUgj8BilB+aDg4
	uW/C1DIw9ovP5iPCQbiBv8bNYnDBiTn/1Ti/50kg2YDFGpJ15smwBHNOCtf+jglqlEqbj/UKeqC
	+LQ0zlgTJnBkd4/rjNgsit+/gnUKvtXaO+CsuSqfEOlARd9cJX/ZQCFyIUtlrUFfXVm/cfvMS+3
	LoI+eYC5uVsyFSYD1KJAqB9BrQaMJXve4yPWkd/CFfj/anbJJvtYF/wJ5SWgfF4tqh0=
X-Google-Smtp-Source: AGHT+IGKcSkFy1nwGYXaETrao7J768QC7bRn1TSL3xSbAx+dTw6czH1lTeyaC+Ij/eiNT7uVDl38Wg==
X-Received: by 2002:a05:6402:51ca:b0:602:15f:5883 with SMTP id 4fb4d7f45d1cf-608b493b6ddmr2789545a12.9.1749824660050;
        Fri, 13 Jun 2025 07:24:20 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-608b4ae3166sm1251248a12.73.2025.06.13.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:24:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Cassio Neri <cassio.neri@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: Optimize calculations in rtc_time64_to_tm()
Date: Fri, 13 Jun 2025 16:24:05 +0200
Message-ID: <20250613142405.253420-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3640; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ySM0p11gwaBRYZtmfgHfPeWf0KOPWOQ0ExyWPvCzOnU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoTDSFNfhwIx5rJR2Pm7yn3jm3XMlG1c1iHbeYy Ojfhh5H9pOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEw0hQAKCRCPgPtYfRL+ ToOyB/4kQqZwADnM0HYDDu+hEsvAGgICmsZh1KgjmQWXKvR5SKTVlbv/hwkpdhcC/rgWM/UOnFB BzTHR8+h7YjeYTpQcYgjmh+to20tmeto7/2b/fEiTQBnx68caS930E/EtadDFeO9MWAwYa/KSVz 4nA0fMiBWp8yDjmAKnsdUnVHxCD+DgNjBwmtZt1ib3Jyoqb2UzZps+LkxzPJDZUmk4S2dPQ7z7l rWW9HqCzaVKRf77H8dKh54/lXVQa1PwMtOp7mx9CBuHL1dcesfDWiMtndWGYUoVy5pBARfOy3Rk W+JYdeY3fVOiiWE5tZdt7PpT1b8SQtQsYrMGi2uBsAPo+XlV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Recently (in commit 7df4cfef8b35 ("rtc: Make rtc_time64_to_tm() support
dates before 1970")) the function rtc_time64_to_tm() was repaired for
times before 1970. This introduced two if blocks. Cassio Neri pointed
out that to be not neccessary and suggested an adaption that allows to
drop the two branch points again.

This is implemented here.

Also adapt the reference to the theoretical paper to link to the final
published article instead of the preprint on Cassio's request.

Suggested-by: Cassio Neri <cassio.neri@gmail.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/lib.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
index 13b5b1f20465..f7051592a6e3 100644
--- a/drivers/rtc/lib.c
+++ b/drivers/rtc/lib.c
@@ -51,7 +51,7 @@ EXPORT_SYMBOL(rtc_year_days);
  */
 void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 {
-	int days, secs;
+	int secs;
 
 	u64 u64tmp;
 	u32 u32tmp, udays, century, day_of_century, year_of_century, year,
@@ -59,28 +59,26 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 	bool is_Jan_or_Feb, is_leap_year;
 
 	/*
-	 * Get days and seconds while preserving the sign to
-	 * handle negative time values (dates before 1970-01-01)
+	 * The time represented by `time` is given in seconds since 1970-01-01
+	 * (UTC). As the division done below might misbehave for negative
+	 * values, we convert it to seconds since 0000-03-01 and then assume it
+	 * will be non-negative.
+	 * Below we do 4 * udays + 3 which should fit into a 32 bit unsigned
+	 * variable. So the latest date this algorithm works for is 1073741823
+	 * days after 0000-03-01 which is in the year 2939805.
 	 */
-	days = div_s64_rem(time, 86400, &secs);
+	time += (u64)719468 * 86400;
+
+	udays = div_s64_rem(time, 86400, &secs);
 
 	/*
-	 * We need 0 <= secs < 86400 which isn't given for negative
-	 * values of time. Fixup accordingly.
+	 * day of the week, 0000-03-01 was a Wednesday (in the proleptic
+	 * Gregorian calendar)
 	 */
-	if (secs < 0) {
-		days -= 1;
-		secs += 86400;
-	}
-
-	/* day of the week, 1970-01-01 was a Thursday */
-	tm->tm_wday = (days + 4) % 7;
-	/* Ensure tm_wday is always positive */
-	if (tm->tm_wday < 0)
-		tm->tm_wday += 7;
+	tm->tm_wday = (udays + 3) % 7;
 
 	/*
-	 * The following algorithm is, basically, Proposition 6.3 of Neri
+	 * The following algorithm is, basically, Figure 12 of Neri
 	 * and Schneider [1]. In a few words: it works on the computational
 	 * (fictitious) calendar where the year starts in March, month = 2
 	 * (*), and finishes in February, month = 13. This calendar is
@@ -100,15 +98,15 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 	 * (using just arithmetics) it's easy to convert it to the
 	 * corresponding date in the Gregorian calendar.
 	 *
-	 * [1] "Euclidean Affine Functions and Applications to Calendar
-	 * Algorithms". https://arxiv.org/abs/2102.06959
+	 * [1] Neri C, Schneider L. Euclidean affine functions and their
+	 *     application to calendar algorithms. Softw Pract Exper.
+	 *     2023;53(4):937-970. doi: 10.1002/spe.3172
+	 *     https://doi.org/10.1002/spe.3172
 	 *
 	 * (*) The numbering of months follows rtc_time more closely and
 	 * thus, is slightly different from [1].
 	 */
 
-	udays		= days + 719468;
-
 	u32tmp		= 4 * udays + 3;
 	century		= u32tmp / 146097;
 	day_of_century	= u32tmp % 146097 / 4;

base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
-- 
2.49.0



Return-Path: <linux-rtc+bounces-4244-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CA0AD2ECA
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 09:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D77A1893734
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 07:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB1127FB18;
	Tue, 10 Jun 2025 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="l+AR8mZ7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DAC27AC44
	for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540929; cv=none; b=eT1ddnuuO72RuhOY7x2OeQLejPw73oNQDf6xPe2d+OdUIB58yIjoPSU4eeUVueDKpoZ4+ZAa4H5ZGmkMRR73E29F4tz5aVKpzv/hnIRCdjD9szPyNxrc1wwN8a6kTj3rcsuag3IEXGoClhpsEmsOMLy7Ro7CGjSsncxmFNbkeK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540929; c=relaxed/simple;
	bh=BLaO1/Df8/QS3t0E4l0Bjo4AEIjv+rDoiQiqU9bUDts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N01aZgUunGvFSGLsF+firJw5cQRwR3aDy8qINuyfAAz9CBHkk6/laxe3BhJ0vYtluTNkvAAq6l/XuRRZK81eLnPjKbySWBVb52MxkIYgjsGfVpEUScbm7B3qERTDseLMdNB0vFSpav0GrK88c4FfJqsNkv/uZP5SNhy1E7wfKAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=l+AR8mZ7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so60762085e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 00:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749540925; x=1750145725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGPDczQfZJe103MK4Dc50M1y0Wa2Ca3Jh9lfYOpDGpE=;
        b=l+AR8mZ7YGzqUtKPg4l5wIDvKHiMEhxJkuubtgzjARy6PG75hQwnSEeZDLsr5HG/+M
         SwgklVHIsYIr0LKKZcsMSVGi2Yq1m0NhwrrqAVGrDOgi8BDBGql2qWiQwqoqKfe3G8CS
         o2hheiO0/rhPL0NALCXBdkQMG8WObtsrpxrBaBz2WpqVqZL9wjjX2i8tobZXjdq+ywn+
         CWWor+CN9H9L58ULebTbootQ6bEV7CvYroeTSh6eTIvJdcwM8TuvFyxaY5mI8v3ZAYf4
         zqCaaTE6c2nFgxRBeJehaalfqA1Bfoygabxomkf9lqGjYODcItwq040agAmc1tOubz3X
         Ai3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540925; x=1750145725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGPDczQfZJe103MK4Dc50M1y0Wa2Ca3Jh9lfYOpDGpE=;
        b=oBM0O0dBt8lrHlqcwPKBIkK26bH/3EFatq/rk7RVcmkjnEEhhh2RtekoAkXraupuT7
         rpvaPAN4Do3bX4T2aKAv+269pZfDv49mby7tFyrunJYFiUGeYwE7K7gqzqCqZZg0x3xW
         Vj42Kl+whQYdwspjMGESB8fUQWGnzZtKJ6dape/W3y4vUlAkwXlYFZZinfTIccZsIuaf
         +OTIcxjqHwKuE/JAN23tdZTCTghAhuo3Q8Y1yRVK+Uq5z5WKFLXHiL8LSIJosI8sLcna
         OCOppeFz7zC54U6AwGT+zarQYtqED1pKPFN9OEQyIk9HCbxdUuo2yf2//VmIZ3U0J6HR
         7DHA==
X-Forwarded-Encrypted: i=1; AJvYcCWkcPptRuC/vnztzBAuYivyHpWeFyx6L2mGS40xva3B0aDuFnSj1tJPMa/k7vYixlwABSYklCPPzyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMadkvlVAmbdBuaC6p6K4eZI3aNvvgRqsYHzuNPQr1D/cvYQi
	gsM6HrSobri54bqNaRrlt9iUCIu/C437slaygNSl0vCZUaX3SFAflAQxpKaimKe4IrM=
X-Gm-Gg: ASbGncv6LxZ+Bjo6PYaHe+zpJglmHe1KAOWGRINZ1b3zO4rs5OavrSYUBe2db1DKwQ/
	/oIQLdmD+JfeQ6k0xEuTCN3oGGI6zrOT40/D+bylaWbs6PWFqTyVp0RGy6SJiynkQFK2ULaX4AJ
	RLrEVOx19+l8+kk81Zx1vt3MxWc1fGcfx4hjmIUnktJZRrtLWBMgSFZCravQFIy2aglsTyuiLBZ
	awxDPwJkGkik5XCndEwY4u3f2nUQVuTruv9kTVPBKjahY9MNzrq9QBe3wy6NMV9DuTgSWcI4AM9
	H0bLqX3qZTCqWeqtBHY+rL7zMIfFm0eagsyE5eYQmrsqaM1pO7XaEuMK+1x9d+6cwGBP+UYfP3w
	7rwQKcsS1QflMpkt2Nl5TbmAgAQDBH8xbTA0VVlo=
X-Google-Smtp-Source: AGHT+IFrJq5ag85iAzoRrcbzHc482N+iiggTmC7haWEU4NbkBJzkxtDv/oyWuhmhRu+6gw4cWEN6KQ==
X-Received: by 2002:a05:600c:1c8b:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-45201294a71mr150722465e9.0.1749540924794;
        Tue, 10 Jun 2025 00:35:24 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452730c73d2sm130202595e9.30.2025.06.10.00.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 00:35:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Cassio Neri <cassio.neri@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	stable@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 5.10.y 1/3] rtc: Improve performance of rtc_time64_to_tm(). Add tests.
Date: Tue, 10 Jun 2025 09:34:58 +0200
Message-ID:  <b301ceb67e1ab9fd522e17433540de464aec2c0b.1749539184.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
References: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8857; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=lWtG+tF1mF7LAmsu3cpOz4FuMN7ZBert8lb4Qg1XoA4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoR+AluVI5hlXmgren82+TunZ0eQHEgPaYuRhWG uWb9CkhrRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEfgJQAKCRCPgPtYfRL+ TqNjB/oD2Je/otNMjJ9pvyzXDv0kKWF2Tr1XU2AqJ8lyZ0nNb9js9f+836AwP4FOxYAoHzhZswT PhhUWp0bwlKQuQ3U1GtTfPkOmHq8aPhT0uqnYFhKGwNaMyh7zCUAO4XwwbeWej5qKjBgNsquXqL tdGv6t8Shj0lu/CZa8dCNrXhcffAyqqjuJsRhsRsoUQfDqvFw1ya5lNhK87sQkVPjsm4SvFAYaT FgTIjH2Q1ZdTFNFlkz25bkfUbbhpjLVjRf6Re7DthUaJ9KLcI4kKUz0vpCwB6DJSoS6SuxNtf3i kzUNhxiQJaFpCznL5RUtnO5eAwWg4nxROI0ARYxhr9RIjYDL
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Cassio Neri <cassio.neri@gmail.com>

commit 1d1bb12a8b1805ddeef9793ebeb920179fb0fa38 upstream.

The current implementation of rtc_time64_to_tm() contains unnecessary
loops, branches and look-up tables. The new one uses an arithmetic-based
algorithm appeared in [1] and is approximately 4.3 times faster (YMMV).

The drawback is that the new code isn't intuitive and contains many 'magic
numbers' (not unusual for this type of algorithm). However, [1] justifies
all those numbers and, given this function's history, the code is unlikely
to need much maintenance, if any at all.

Add a KUnit test case that checks every day in a 160,000 years interval
starting on 1970-01-01 against the expected result. Add a new config
RTC_LIB_KUNIT_TEST symbol to give the option to run this test suite.

[1] Neri, Schneider, "Euclidean Affine Functions and Applications to
Calendar Algorithms". https://arxiv.org/abs/2102.06959

Signed-off-by: Cassio Neri <cassio.neri@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Link: https://lore.kernel.org/r/20210624201343.85441-1-cassio.neri@gmail.com
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/Kconfig    |  10 ++++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/lib.c      | 103 +++++++++++++++++++++++++++++++----------
 drivers/rtc/lib_test.c |  79 +++++++++++++++++++++++++++++++
 4 files changed, 168 insertions(+), 25 deletions(-)
 create mode 100644 drivers/rtc/lib_test.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 8ddd334e049e..6a4aa5abe366 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -10,6 +10,16 @@ config RTC_MC146818_LIB
 	bool
 	select RTC_LIB
 
+config RTC_LIB_KUNIT_TEST
+	tristate "KUnit test for RTC lib functions" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	select RTC_LIB
+	help
+	  Enable this option to test RTC library functions.
+
+	  If unsure, say N.
+
 menuconfig RTC_CLASS
 	bool "Real Time Clock"
 	default n
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index bfb57464118d..03ab2329a0e2 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -183,3 +183,4 @@ obj-$(CONFIG_RTC_DRV_WM8350)	+= rtc-wm8350.o
 obj-$(CONFIG_RTC_DRV_X1205)	+= rtc-x1205.o
 obj-$(CONFIG_RTC_DRV_XGENE)	+= rtc-xgene.o
 obj-$(CONFIG_RTC_DRV_ZYNQMP)	+= rtc-zynqmp.o
+obj-$(CONFIG_RTC_LIB_KUNIT_TEST)	+= lib_test.o
diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
index 23284580df97..fe361652727a 100644
--- a/drivers/rtc/lib.c
+++ b/drivers/rtc/lib.c
@@ -6,6 +6,8 @@
  * Author: Alessandro Zummo <a.zummo@towertech.it>
  *
  * based on arch/arm/common/rtctime.c and other bits
+ *
+ * Author: Cassio Neri <cassio.neri@gmail.com> (rtc_time64_to_tm)
  */
 
 #include <linux/export.h>
@@ -22,8 +24,6 @@ static const unsigned short rtc_ydays[2][13] = {
 	{ 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366 }
 };
 
-#define LEAPS_THRU_END_OF(y) ((y) / 4 - (y) / 100 + (y) / 400)
-
 /*
  * The number of days in the month.
  */
@@ -42,42 +42,95 @@ int rtc_year_days(unsigned int day, unsigned int month, unsigned int year)
 }
 EXPORT_SYMBOL(rtc_year_days);
 
-/*
- * rtc_time64_to_tm - Converts time64_t to rtc_time.
- * Convert seconds since 01-01-1970 00:00:00 to Gregorian date.
+/**
+ * rtc_time64_to_tm - converts time64_t to rtc_time.
+ *
+ * @time:	The number of seconds since 01-01-1970 00:00:00.
+ *		(Must be positive.)
+ * @tm:		Pointer to the struct rtc_time.
  */
 void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 {
-	unsigned int month, year, secs;
+	unsigned int secs;
 	int days;
 
+	u64 u64tmp;
+	u32 u32tmp, udays, century, day_of_century, year_of_century, year,
+		day_of_year, month, day;
+	bool is_Jan_or_Feb, is_leap_year;
+
 	/* time must be positive */
 	days = div_s64_rem(time, 86400, &secs);
 
 	/* day of the week, 1970-01-01 was a Thursday */
 	tm->tm_wday = (days + 4) % 7;
 
-	year = 1970 + days / 365;
-	days -= (year - 1970) * 365
-		+ LEAPS_THRU_END_OF(year - 1)
-		- LEAPS_THRU_END_OF(1970 - 1);
-	while (days < 0) {
-		year -= 1;
-		days += 365 + is_leap_year(year);
-	}
-	tm->tm_year = year - 1900;
-	tm->tm_yday = days + 1;
+	/*
+	 * The following algorithm is, basically, Proposition 6.3 of Neri
+	 * and Schneider [1]. In a few words: it works on the computational
+	 * (fictitious) calendar where the year starts in March, month = 2
+	 * (*), and finishes in February, month = 13. This calendar is
+	 * mathematically convenient because the day of the year does not
+	 * depend on whether the year is leap or not. For instance:
+	 *
+	 * March 1st		0-th day of the year;
+	 * ...
+	 * April 1st		31-st day of the year;
+	 * ...
+	 * January 1st		306-th day of the year; (Important!)
+	 * ...
+	 * February 28th	364-th day of the year;
+	 * February 29th	365-th day of the year (if it exists).
+	 *
+	 * After having worked out the date in the computational calendar
+	 * (using just arithmetics) it's easy to convert it to the
+	 * corresponding date in the Gregorian calendar.
+	 *
+	 * [1] "Euclidean Affine Functions and Applications to Calendar
+	 * Algorithms". https://arxiv.org/abs/2102.06959
+	 *
+	 * (*) The numbering of months follows rtc_time more closely and
+	 * thus, is slightly different from [1].
+	 */
 
-	for (month = 0; month < 11; month++) {
-		int newdays;
+	udays		= ((u32) days) + 719468;
 
-		newdays = days - rtc_month_days(month, year);
-		if (newdays < 0)
-			break;
-		days = newdays;
-	}
-	tm->tm_mon = month;
-	tm->tm_mday = days + 1;
+	u32tmp		= 4 * udays + 3;
+	century		= u32tmp / 146097;
+	day_of_century	= u32tmp % 146097 / 4;
+
+	u32tmp		= 4 * day_of_century + 3;
+	u64tmp		= 2939745ULL * u32tmp;
+	year_of_century	= upper_32_bits(u64tmp);
+	day_of_year	= lower_32_bits(u64tmp) / 2939745 / 4;
+
+	year		= 100 * century + year_of_century;
+	is_leap_year	= year_of_century != 0 ?
+		year_of_century % 4 == 0 : century % 4 == 0;
+
+	u32tmp		= 2141 * day_of_year + 132377;
+	month		= u32tmp >> 16;
+	day		= ((u16) u32tmp) / 2141;
+
+	/*
+	 * Recall that January 01 is the 306-th day of the year in the
+	 * computational (not Gregorian) calendar.
+	 */
+	is_Jan_or_Feb	= day_of_year >= 306;
+
+	/* Converts to the Gregorian calendar. */
+	year		= year + is_Jan_or_Feb;
+	month		= is_Jan_or_Feb ? month - 12 : month;
+	day		= day + 1;
+
+	day_of_year	= is_Jan_or_Feb ?
+		day_of_year - 306 : day_of_year + 31 + 28 + is_leap_year;
+
+	/* Converts to rtc_time's format. */
+	tm->tm_year	= (int) (year - 1900);
+	tm->tm_mon	= (int) month;
+	tm->tm_mday	= (int) day;
+	tm->tm_yday	= (int) day_of_year + 1;
 
 	tm->tm_hour = secs / 3600;
 	secs -= tm->tm_hour * 3600;
diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
new file mode 100644
index 000000000000..2124b67a2f43
--- /dev/null
+++ b/drivers/rtc/lib_test.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: LGPL-2.1+
+
+#include <kunit/test.h>
+#include <linux/rtc.h>
+
+/*
+ * Advance a date by one day.
+ */
+static void advance_date(int *year, int *month, int *mday, int *yday)
+{
+	if (*mday != rtc_month_days(*month - 1, *year)) {
+		++*mday;
+		++*yday;
+		return;
+	}
+
+	*mday = 1;
+	if (*month != 12) {
+		++*month;
+		++*yday;
+		return;
+	}
+
+	*month = 1;
+	*yday  = 1;
+	++*year;
+}
+
+/*
+ * Checks every day in a 160000 years interval starting on 1970-01-01
+ * against the expected result.
+ */
+static void rtc_time64_to_tm_test_date_range(struct kunit *test)
+{
+	/*
+	 * 160000 years	= (160000 / 400) * 400 years
+	 *		= (160000 / 400) * 146097 days
+	 *		= (160000 / 400) * 146097 * 86400 seconds
+	 */
+	time64_t total_secs = ((time64_t) 160000) / 400 * 146097 * 86400;
+
+	int year	= 1970;
+	int month	= 1;
+	int mday	= 1;
+	int yday	= 1;
+
+	struct rtc_time result;
+	time64_t secs;
+	s64 days;
+
+	for (secs = 0; secs <= total_secs; secs += 86400) {
+
+		rtc_time64_to_tm(secs, &result);
+
+		days = div_s64(secs, 86400);
+
+		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
+			year, month, mday, yday, days
+
+		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
+		KUNIT_ASSERT_EQ_MSG(test, month - 1, result.tm_mon, FAIL_MSG);
+		KUNIT_ASSERT_EQ_MSG(test, mday, result.tm_mday, FAIL_MSG);
+		KUNIT_ASSERT_EQ_MSG(test, yday, result.tm_yday, FAIL_MSG);
+
+		advance_date(&year, &month, &mday, &yday);
+	}
+}
+
+static struct kunit_case rtc_lib_test_cases[] = {
+	KUNIT_CASE(rtc_time64_to_tm_test_date_range),
+	{}
+};
+
+static struct kunit_suite rtc_lib_test_suite = {
+	.name = "rtc_lib_test_cases",
+	.test_cases = rtc_lib_test_cases,
+};
+
+kunit_test_suite(rtc_lib_test_suite);
-- 
2.49.0



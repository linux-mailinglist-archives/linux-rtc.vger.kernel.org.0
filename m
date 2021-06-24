Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFC73B37A6
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jun 2021 22:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbhFXUQf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Jun 2021 16:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhFXUQf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Jun 2021 16:16:35 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B05C061574;
        Thu, 24 Jun 2021 13:14:15 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id w13so4815200wmc.3;
        Thu, 24 Jun 2021 13:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpVn6RjHhBseo2RngxWRtIwo5/l3JsKu6wOong2ADk8=;
        b=DrLY8RXhwM3sU1/Jikkw5/qVSKbME/15hEyLzn6h2S0zLmDNbqbMckP7mKvaQowNOx
         BGcqW17Uy5X3/lijEGl3lITq120fo2Gzjxf1d7ySO0KMi15zfKWQuvdUKNoMA67UpRt8
         1qYgdSKG3fgYdJFFLeSnKYCBkPZaUMZJUrqjFTAvQXJmOxORVKVqor+WEJsFr30Sa0Tq
         fgOWI1KGxwx2ju4wZfClfZdvGPe0Z3hOOf8g9TTjEygYcejyL8iVqI3CcvsAHZ9hQeGo
         OWCneWnBXSqFtLLoZmH3pe6sjf4CsChgkaC/MNS3kcRVTQuhVtou+0PL5Bmoym7iihd4
         B7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpVn6RjHhBseo2RngxWRtIwo5/l3JsKu6wOong2ADk8=;
        b=mDV6y5qEM7DwLzkubOWwjb8iaD/jRhDG/WCcrZOX6DHgghQ68H129NbyjOBjOGqyhI
         /58135LYcjTI9sdpxyRERW6iab2Q4SEgQ6vLPSFuvcfZ/IAdDvuk4FBjnzkgLU0gKaGf
         IXdcjdCAb41LHLt+41VlTkWuo+xrZiFzTziJmCAfHGKswNR6Nl4R+Ip1J7+lptKJW2lw
         S2O98bYf9kMrzDehPECOtYAQSRS/EZ41h1dGpmfS8aUt44BO8C1a5x7tWOeWZ0ye36IK
         27cxyW29rrCtC5+81f5v39C0QlAMvpstavVGMlMePR/q0Hs4k+01Em4rEBfvSfZhOfmN
         SsEg==
X-Gm-Message-State: AOAM532lsrNNFY6x1DgOR/N0mw5KlkOPgh/3md1J3Iq0UqdFyuWV+D/U
        3aB/JcbT8DAvtQyEnTgb6vM=
X-Google-Smtp-Source: ABdhPJwVFPt/Sl/l1qLRuDKHHEIZAxTZsCaRyFG0sQytxZ8H6NRGwS1TmnpgaywYYg98tib4uolyvg==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr6335479wmi.69.1624565653911;
        Thu, 24 Jun 2021 13:14:13 -0700 (PDT)
Received: from othello.cust.communityfibre.co.uk ([2a02:6b64:80a9:0:1be:22d4:3c1d:bcad])
        by smtp.gmail.com with ESMTPSA id x1sm4085514wrv.49.2021.06.24.13.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:14:13 -0700 (PDT)
From:   Cassio Neri <cassio.neri@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cassio Neri <cassio.neri@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v5] rtc: Improve performance of rtc_time64_to_tm(). Add tests.
Date:   Thu, 24 Jun 2021 21:13:43 +0100
Message-Id: <20210624201343.85441-1-cassio.neri@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Cassio Neri <cassio.neri@gmail.com>

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

---

* Disclaimer: I'm an author of [1].

* Test evidence: Same test implemented by lib_test.c, compiler switches
are close to kernel's and it's possible to run this test on 32 and 64 bits:

    https://godbolt.org/z/azoPon87s

* Benchmarks: Measures the time taken by each implementation to process
65,536 pseudo-random numbers (time64_t) drawn under the uniform
distribution on the interval corresponding to dates spanning 800 years
starting at 1970-01-01.

    https://quick-bench.com/q/4sEYBU2y3iZiQE-2qKK1BQCsj-Y

(Apologies that the benchmark is in C++ but results in C should be close.
Results need to be taken with a pinch of salt since compiler switches are
not the same as the kernel's.)

* Disasembly: Compiler switches are close to kernel's and shows, in
particular, reduction in code size:

    https://godbolt.org/z/bsE6ebq3v

* History:

v5 Address comments by reviewers of a similar patch sent to the TIMEKEEPING
   subsystem. (FWIW: The patch was accepted. https://tinyurl.com/2emaebs3)
v4 Improve clarity and removed call to is_leap(year) since it's possible to
  figure it out from century and year of century.
v3 Squash previous patches/commits into a single one.
v2 Fix link issue on 32 bit platforms reported by the test robot.
v1 Original patch.

* Thanks to Thomas Gleixner and Joe Perches.

---
 drivers/rtc/Kconfig    |  10 ++++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/lib.c      | 107 ++++++++++++++++++++++++++++++-----------
 drivers/rtc/lib_test.c |  79 ++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+), 27 deletions(-)
 create mode 100644 drivers/rtc/lib_test.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 914497abeef9..af65f5007f78 100644
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
index 2dd0dd956b0e..763d3628c603 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -178,3 +178,4 @@ obj-$(CONFIG_RTC_DRV_WM8350)	+= rtc-wm8350.o
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
-
-	for (month = 0; month < 11; month++) {
-		int newdays;
-
-		newdays = days - rtc_month_days(month, year);
-		if (newdays < 0)
-			break;
-		days = newdays;
-	}
-	tm->tm_mon = month;
-	tm->tm_mday = days + 1;
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
+
+	udays		= ((u32) days) + 719468;
+
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

base-commit: bcae59d0d45b866d5b9525ea8ece6d671e6767c8
-- 
2.32.0


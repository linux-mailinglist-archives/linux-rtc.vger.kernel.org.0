Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF9A3991DC
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 19:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhFBRpS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 13:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhFBRpS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 13:45:18 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF009C061574;
        Wed,  2 Jun 2021 10:43:34 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p13-20020a05600c358db029019f44afc845so2143306wmq.3;
        Wed, 02 Jun 2021 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vUXiy7snUX7XaNkNSqmTLU+IL8lIbtjGJJsIaEZbu1Q=;
        b=lXyA1+wisyvSPYrsE+0vN6ruyUJy6pA8jtSK9LmRNHSco1qZwlE0srnKTbhP3yPk1m
         E+hnUdY5qyWoxdzLB/cpUwoyFvAvds0hbREcC/K8WN1Hr2L7tnZO8x5mRYBOwTFQuoii
         +CtrwY2hqpH/ove1hXTYANpcaX6puIOHu7i7xSQF0niVOsH54zexF8eTIg8q3BjC1bdD
         scw9y1/vpoFOKW28xx6HTyxcMRGC9HI4KxNZ/Ts3evYg7y9E1e26SgRBot7wFIONUmr/
         gtJJ1xJSAkPEvOM6hYl1tXN6qCZZdURHaO+wYEMH9v4S4mCDbtAemQfc251gr00Dfm/3
         CImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vUXiy7snUX7XaNkNSqmTLU+IL8lIbtjGJJsIaEZbu1Q=;
        b=r9AinB8x02LsnX6zTfHd3AzPXT4rNIQAW9wFwKKamUNRjQmLqZY990273PYTt7cpg3
         s94tfBETg/oodqO7fBuVG4qwKaELaDqefXvpnH+SbrTYa948OUcX8s5pDMz0O7b+Z012
         4eYoB3+0P4BxBn0wlBuwtHaG9bERvUa5yqH+TSXnUt0aI77fZm+pNDXbMAWl+TnGocg3
         rwSNjrXhrlFlOYBNsDGNo8BfiWdyJ6x/mKgHDW0xVtqkCb/UV6WBthq5bgQ5BnOX1nRw
         cBokV8t695C4TtopxllMpx2L81XhSL6qJrfCVGjTEeHQFQOPdkGcCAgIml0Qhigr8In3
         IZZw==
X-Gm-Message-State: AOAM532yQuM6KFHcV1C2l94VBdQhxSvxFt0iYyqgCdOoXr0Fd06tztsJ
        xA2D3HGWjmD6kyvkHzJp87s=
X-Google-Smtp-Source: ABdhPJyN5TRm0sX49yzQtN2nm4Ksg0KgWeU6w0p7qm7yYnJip89SZ3/RFHoG1BBnDZ7Rwprr/DpeBA==
X-Received: by 2002:a05:600c:ad2:: with SMTP id c18mr22573055wmr.93.1622655813266;
        Wed, 02 Jun 2021 10:43:33 -0700 (PDT)
Received: from othello.cust.communityfibre.co.uk ([2a02:6b64:80a9:0:1be:22d4:3c1d:bcad])
        by smtp.gmail.com with ESMTPSA id j14sm3417161wmi.32.2021.06.02.10.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 10:43:32 -0700 (PDT)
From:   Cassio Neri <cassio.neri@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cassio Neri <cassio.neri@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v4] rtc: Improve performance of rtc_time64_to_tm. Add tests.
Date:   Wed,  2 Jun 2021 18:43:24 +0100
Message-Id: <20210602174324.37600-1-cassio.neri@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Cassio Neri <cassio.neri@gmail.com>

The current implementation of rtc_time64_to_tm contains unnecessary loops,
branches and look-up tables. The new one uses an arithmetic-based algorithm
appeared in [1] and is ~4.3 times faster.

The drawback is that the new code isn't intuitive and contains many 'magic
numbers' (not unusual for this type of algorithm). However, [1] justifies
all those numbers and, given this function's history, I reckon the code is
unlikely to need much maintenance, if any at all.

Added file drivers/rtc/lib_test.c containing a KUnit test case that checks
every day in a 160,000 years interval starting on 1970-01-01 against the
expected result. A new config RTC_LIB_KUNIT_TEST symbol was introduced to
give the option to run this test suite.

[1] Neri, Schneider, "Euclidean Affine Functions and Applications to
Calendar Algorithms". https://arxiv.org/abs/2102.06959

Signed-off-by: Cassio Neri <cassio.neri@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>

---

* Disclaimer: I'm an author of [1] and, surely, I have an interest in
seeing my algorithm made into the kernel. If not by this patch, I'm
willing to work closely with maintainers, if they wish, in order to write
an appropriate implementation.

* Test evidence: This runs the same test implemented in
drivers/rtc/lib_test.c (see above). It's possible to run it on 32 and 64
bits.

    https://godbolt.org/z/Tn6KjGTzc

* Benchmarks: It measures the time taken by each implementation to process
65,536 numbers. These numbers are pseudo-random under the uniform
distribution on the interval corresponding to dates spanning 800 years
starting at 1970-01-01.

    https://quick-bench.com/q/whT24JkC6TBSDdvfmir2v4b52R4

(Apologies that the benchmark is in C++ but results in C should be close.)

Disasembly: Shows, in particular, reduction in code size.

    https://godbolt.org/z/d145E4Eea

* History:

v4 Improve clarity and removed call to is_leap(year) since it's possible to
  figure it out from century and year of century.
v3 Squash previous patches/commits into a single one.
v2 Fix link issue on 32 bit platforms reported by the test robot.
v1 Original patch.

---
 drivers/rtc/Kconfig    |  10 ++++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/lib.c      | 104 ++++++++++++++++++++++++++++++-----------
 drivers/rtc/lib_test.c |  78 +++++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+), 26 deletions(-)
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
index 23284580df97..6b3b859be9fa 100644
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
@@ -43,41 +43,93 @@ int rtc_year_days(unsigned int day, unsigned int month, unsigned int year)
 EXPORT_SYMBOL(rtc_year_days);
 
 /*
- * rtc_time64_to_tm - Converts time64_t to rtc_time.
- * Convert seconds since 01-01-1970 00:00:00 to Gregorian date.
+ * This function converts time64_t to rtc_time.
+ *
+ * @param[in]  time   The number of seconds since 01-01-1970 00:00:00.
+ *                    (Must be positive.)
+ * @param[out] tm     Pointer to the struct rtc_time.
  */
 void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 {
-	unsigned int month, year, secs;
+	unsigned int secs;
 	int days;
 
+	u64 u64tmp;
+	u32 u32tmp, udays, century, day_of_century, year_of_century, year,
+		day_of_year, month, day, janOrFeb, is_leap;
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
+	 * and Schneider [1]. In a few words: it works on the
+	 * computational (fictitious) calendar where the year starts in
+	 * March, month = 2 (*), and finishes in February, month = 13. This
+	 * calendar is mathematically convenient because the day of the
+	 * year does not depend on whether the year is leap or not. For
+	 * instance:
+	 *
+	 * March    01 is the   0-th day of the year;
+	 * ...
+	 * April    01 is the  31-st day of the year;
+	 * ...
+	 * January  01 is the 306-th day of the year; (Important!)
+	 * ...
+	 * February 28 is the 364-th day of the year;
+	 * February 29 is the 365-th day of the year (provided it exists).
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
+	udays           = ((u32) days) + 719468;
+
+	u32tmp          = 4 * udays + 3;
+	century         = u32tmp / 146097;
+	day_of_century  = u32tmp % 146097 / 4;
+
+	u32tmp          = 4 * day_of_century + 3;
+	u64tmp          = 2939745ULL * u32tmp;
+	year_of_century = u64tmp >> 32;
+	day_of_year     = ((u32) u64tmp) / 2939745 / 4;
+
+	year            = 100 * century + year_of_century;
+	is_leap         = year_of_century != 0 ?
+		year_of_century % 4 == 0 : century % 4 == 0;
+
+	u32tmp          = 2141 * day_of_year + 132377;
+	month           = u32tmp >> 16;
+	day             = ((u16) u32tmp) / 2141;
+
+	/* Recall that January 01 is the 306-th day of the year in the
+	 * computational (not Gregorian) calendar.
+	 */
+	janOrFeb        = day_of_year >= 306;
+
+	/* Converts to the Gregorian calendar. */
+	year            = year + janOrFeb;
+	month           = janOrFeb ? month - 12 : month;
+	day             = day + 1;
+
+	day_of_year     = janOrFeb ?
+		day_of_year - 306 : day_of_year + 31 + 28 + is_leap;
+
+	/* Converts to rtc_time's format. */
+	tm->tm_year     = (int) (year - 1900);
+	tm->tm_mon      = (int) month;
+	tm->tm_mday     = (int) day;
+	tm->tm_yday     = (int) day_of_year + 1;
 
 	tm->tm_hour = secs / 3600;
 	secs -= tm->tm_hour * 3600;
diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
new file mode 100644
index 000000000000..e50513c8e086
--- /dev/null
+++ b/drivers/rtc/lib_test.c
@@ -0,0 +1,78 @@
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
+	 * 160000 years = (160000 / 400) * 400 years
+	 *              = (160000 / 400) * 146097 days
+	 *              = (160000 / 400) * 146097 * 86400 seconds
+	 */
+	time64_t total_secs = ((time64_t) 160000) / 400 * 146097 * 86400;
+	int      year       = 1970;
+	int      month      = 1;
+	int      mday       = 1;
+	int      yday       = 1;
+
+	struct rtc_time result;
+	time64_t secs;
+	s64      days;
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
2.31.0


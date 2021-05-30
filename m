Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7D1395088
	for <lists+linux-rtc@lfdr.de>; Sun, 30 May 2021 13:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhE3LGD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 30 May 2021 07:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE3LGD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 30 May 2021 07:06:03 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2025EC061574;
        Sun, 30 May 2021 04:04:24 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id m18so4600881wmq.0;
        Sun, 30 May 2021 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nI52Rvr0jnN3+S94eUi0eJC+RYQs4R7Rq6J7xxaJo7U=;
        b=Ao8FAm5vwFnCg6okMayo7ZEgxMF0I+RSeVGt7swINmOSRXEIljv2Pj0lXFQhHXTaiW
         tA2txsIZ7kvEoEJFJQITiR1xXsyrri7elLzp1LdGqB8ZLo7YbRdIKZ/0vRxbZMUg7yH2
         vI/v4K2wzs2pQZph4LQt2ee0PnFW/R15quYQS9Ztl9AD1h0G+XKhlbGO1iRrGsH8g+tT
         0ZmmegnbP/ADPgKvK5hMYliLXqtkvYa2jbgPvAnkpPZ7J9Y7zGvfTLa32jC8BOsqHXvg
         cf2uA+SsB3VzDpjyeqOL3Pzm3f28I0wVxD8YWZNSDNcLH3b6GxM/WIwU5zU8yMJ+bMzx
         Vp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nI52Rvr0jnN3+S94eUi0eJC+RYQs4R7Rq6J7xxaJo7U=;
        b=HgxwiqF4NXBB7DxJjYVzcXSQWRY6HbEQTqb2xfLag2R7hI0BQZI22nokuFERMXcKCU
         /0+qomEn130tr60B1gkj/lcMVfUjhf66O3ihfHJtS1wBW/qSDm2/M7muNuMzoXNXgoC4
         b4twLwh3YjMkhqK6+b6VEDYJqB0hZcK21cBOWCwvhsgwJVHgNqVIEL0gXrL6aZNd2Mhl
         /OONyW5YiU6SM5ocNPE5ySacH7hVYGnkEgG/ejCTrx1ZRhB/ptkzkir9lcQVPz6BM9HW
         RFKMrZBVZyHj9fKf2KEDNfTGaLmVivGhzbQSv9jv2H5UzeNmBzj2FGwJx5qbb7sXg2VG
         7miQ==
X-Gm-Message-State: AOAM5320zP9ukhpMLL+amfsF6gt63pP8W2ysLG0fYlfPWNRvE8Jijjv1
        PDQOvRD+TyWvBfp1f6/pdl8=
X-Google-Smtp-Source: ABdhPJwREERMxt2cRKfgVcuEmz77oXkxiIow6qcvrottuKrMLsxmxafAoTZBUaGl+5MOCBITqAuGPw==
X-Received: by 2002:a7b:c7ca:: with SMTP id z10mr17157326wmk.185.1622372662625;
        Sun, 30 May 2021 04:04:22 -0700 (PDT)
Received: from othello.cust.communityfibre.co.uk ([2a02:6b64:80a9:0:1be:22d4:3c1d:bcad])
        by smtp.gmail.com with ESMTPSA id s5sm12039492wmh.37.2021.05.30.04.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 04:04:22 -0700 (PDT)
From:   Cassio Neri <cassio.neri@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cassio Neri <cassio.neri@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v3] rtc: Improve performance of rtc_time64_to_tm. Add tests.
Date:   Sun, 30 May 2021 12:04:13 +0100
Message-Id: <20210530110413.395083-1-cassio.neri@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Cassio Neri <cassio.neri@gmail.com>

The current implementation of rtc_time64_to_tm contains unnecessary loops,
branches and look-up tables. The new one uses an arithmetic-based algorithm
appeared in [1] and is ~3.3 times faster.

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

Disclaimer: I'm an author of [1] and, surely, I have an interest in
seeing my algorithm made into the kernel. If not by this patch, I'm
willing to work closely with maintainers, if they wish, in order to write
an appropriate implementation.

* Benchmarks: It measures the time taken by each implementation to process
65,536 numbers. These numbers are pseudo-random under the uniform
distribution on the interval corresponding to dates spanning 800 years
starting at 1970-01-01.

    https://quick-bench.com/q/ikF-97xNTtGvJlUbG2jLUuCl4e8

(Apologies that the benchmark is in C++ but results in C should be close.)

Disasembly: Shows, in particular, reduction in code size.

    https://godbolt.org/z/dvj9G5vef

* History:

v3 (This patch) Squash previous patches/commits into a single one.
v2 Fix link issue on 32 bit platforms reported by the test robot.
v1 Original patch.

---
 drivers/rtc/Kconfig    | 10 ++++++
 drivers/rtc/Makefile   |  1 +
 drivers/rtc/lib.c      | 79 ++++++++++++++++++++++++++++--------------
 drivers/rtc/lib_test.c | 78 +++++++++++++++++++++++++++++++++++++++++
 include/linux/rtc.h    |  6 +++-
 5 files changed, 147 insertions(+), 27 deletions(-)
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
index 23284580df97..72f049b10751 100644
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
@@ -43,41 +43,68 @@ int rtc_year_days(unsigned int day, unsigned int month, unsigned int year)
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
 
+	u32 r0, n1, q1;
+	u32 r1, n2, q2, r2;
+	u64 u2;
+	u32 n3, q3, r3;
+
+	u32 j;
+	u32 y;
+	u32 m, d;
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
+	 * The following algorithm is Proposition 6.3 of Neri and Schneider,
+	 * "Euclidean Affine Functions and Applications to Calendar Algorithms".
+	 * https://arxiv.org/abs/2102.06959
+	 */
+
+	r0 = days + 719468;
+
+	n1 = 4 * r0 + 3;
+	q1 = n1 / 146097;
+	r1 = n1 % 146097 / 4;
+
+	n2 = 4 * r1 + 3;
+	u2 = ((u64) 2939745) * n2;
+	q2 = u2 >> 32;
+	r2 = ((u32) u2) / 2939745 / 4;
+
+	n3 = 2141 * r2 + 197913;
+	q3 = n3 >> 16;
+	r3 = ((u16) n3) / 2141;
+
+	j = r2 >= 306;
+	y = 100 * q1 + q2 + j;
+	m = j ? q3 - 12 : q3;
+	d = r3 + 1;
+
+	tm->tm_year = y - 1900;
+	tm->tm_mon  = m - 1;
+	tm->tm_mday = d;
+
+	/*
+	 * r2 contains the number of days since previous Mar 1st and j == true
+	 * if and only if month is Jan or Feb. The bellow is then a correction
+	 * to get the numbers of days since previous Jan 1st.
+	 */
+	tm->tm_yday = j ? r2 - 305 : r2 + 60 + is_leap_year(y);
 
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
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index bd611e26291d..a788cdb488b5 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -220,7 +220,11 @@ void rtc_timer_do_work(struct work_struct *work);
 
 static inline bool is_leap_year(unsigned int year)
 {
-	return (!(year % 4) && (year % 100)) || !(year % 400);
+	/* This implementation is more branch-predictor friendly than the
+	 * traditional:
+	 *   return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
+	 */
+	return year % 100 != 0 ? year % 4 == 0 : year % 400 == 0;
 }
 
 #define devm_rtc_register_device(device) \

base-commit: bcae59d0d45b866d5b9525ea8ece6d671e6767c8
-- 
2.31.0


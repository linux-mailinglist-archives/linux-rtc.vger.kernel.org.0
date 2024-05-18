Return-Path: <linux-rtc+bounces-1196-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8E8C8ED5
	for <lists+linux-rtc@lfdr.de>; Sat, 18 May 2024 02:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FCE9282931
	for <lists+linux-rtc@lfdr.de>; Sat, 18 May 2024 00:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF331FBA;
	Sat, 18 May 2024 00:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UStHqVo3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68389637
	for <linux-rtc@vger.kernel.org>; Sat, 18 May 2024 00:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715991423; cv=none; b=ujy3WcrPDv8XPoWxBCOHaceWctpwO4cio3U+ARl4M8paSHAEn3p7IXnwvGYMUePt+luc5X+mp42P0XhkNlw3T5WWBVMmubwQEU7D0AGtMEw1cWRxOvqz6AFD9EHjiTG4QxgYw861OalA+Jyy9at96TYbaAevDUd73mMEq6fmaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715991423; c=relaxed/simple;
	bh=psb/9cAnhp+Xzaq8lXVTJ+5ogfgNeGdZpdDamrOEPi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EEEY/LEvojZo/FAo/7OpPau61sxnAbbfpG/s0emEOWVybbVF4eiBIDbm1yOmrhwE/ZbOR2NdwBUSleZs4Lgni8kiEnS4Qp8sz+KRwET8miQdvCOJzEoR3FgjKu4MJqatI+vLJuL9MdN4yUA+RWvADKV4WEKNAq0I97f2GR68zrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UStHqVo3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ee38966529so8205395ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 17 May 2024 17:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715991422; x=1716596222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irkVL93e2r7C0Hy5+trw8pmsG8779sgzCHeX9n3CiN0=;
        b=UStHqVo3wPfQ6HcIsDMF5je4Krpa6DYNHvc+Mt2pIrNdhO+8Xg+4dyqNWpt+5z7h9B
         OnhYLqPbmpstanrboHbljEM5WcDuZFHRrsmpr6eY+EMv3SOI+9vqApWyI0gbywmC5Ayo
         /qrUvWWX6cr9JfMnBPf9vcObNemy1ZLY+W90w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715991422; x=1716596222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irkVL93e2r7C0Hy5+trw8pmsG8779sgzCHeX9n3CiN0=;
        b=v+gP1vJQbeQxiESYty0ai66zl5HIdL30JYi04/hQEcSpYUsAyo4lwxQIrFwX+rTmEf
         gVrlMrGtTxZtZ05rpc6ViB2yZzi91pVms49BnB0JZsLyHUlG9dcgnRqurqryJyJf96s1
         CTbrIUzVdsyCVMmKvXjNtTwUmi8mzZqq0QgI2TIctfGNNKtVfqbIIEV4ZaWhJt28CQ3X
         Ril97hDQRQm1Z5cBMvILgHIkMGgoWbprhTnPHuqmGGOIRglxhdCUIV/VbrOGCm7clJqg
         KswIscuoH0dbr0KZ6ZyBd6NBbnmT/j8QsITFUatnbM2sOuVvxsBUAZyK0xwiXg6W4rEx
         W4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzBMTim8/gpWDlyVuyEKmYq9uxq/VjXAFdXUXNzFFUX8bbVsu9FPFAjlFQ8sqs1QGlgJzAcUw/YkR/ehGFa7GJdA1JdPxTVISZ
X-Gm-Message-State: AOJu0Yx7qDFe99Is5P06ww9gdB0ZtWxCo6WI0A57OfNPnZRwaeXVIJVa
	+vSZVPaUJh/a1cehusdXEKoyIa1YLPUFGaFuPo8VU7nkEgeMBwBKd1o/VFkwiA==
X-Google-Smtp-Source: AGHT+IGFPQYGhMI5mu4WIG762rhacma10jrth4Odmj51T3CbNjI91oKmi+chX3KkEDy/JeJ4Brsldg==
X-Received: by 2002:a17:902:e752:b0:1e5:5760:a6c1 with SMTP id d9443c01a7336-1f2ed2ebe08mr7151825ad.21.1715991421580;
        Fri, 17 May 2024 17:17:01 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad9da4sm162348915ad.107.2024.05.17.17.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 17:17:00 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] selftests: rtc: rtctest: Do not open-code TEST_HARNESS_MAIN
Date: Fri, 17 May 2024 17:16:58 -0700
Message-Id: <20240518001655.work.053-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5223; i=keescook@chromium.org;
 h=from:subject:message-id; bh=psb/9cAnhp+Xzaq8lXVTJ+5ogfgNeGdZpdDamrOEPi8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmR/N6s/j5oZN920PNFTll/WpzqmtBDGQzJiKQO
 WN+Gr07bhaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZkfzegAKCRCJcvTf3G3A
 JjXID/wMzWXl2uBgZBj8D9wl0hC56WI14SrF0DqQnjVVOg7LoM/vvq3w1s4e2+ZXB/S3ILG7bmj
 MU6ATJTr3PXZ8D2KLL0HjPnjAHXetcJ6zsbNbfuPsydkqbAt35MDp0uoAePnq3vEzRWLZdnMpCX
 75F/1XL6Nm9f4xFfmq9chfi5Z47h0Zt+UyWhs+udLvtadqk3M6nz3xVg67N9N8RvmpqgAOXVAM8
 wL4V3CxKhiamcqGuaUmOqQG5ISBPxUPm56WMM/FD524JaiRRv0YKQPU71Xf5wqfh+2idJvoNIG7
 1F3KWiieBCi0Hyyy1l8GivFac0+RbslIiHtS6oC4XtqnLn1M1FpsaoeRT3oAYTMaDa4ch8t8wnB
 GtUxMnCShZyT+DU8/x4WYr2wP1LzT4cEIktWX/Y7uMS0Y4zNDwJCN/lqQAUkZy8nOtFxNvvRGaP
 DszsKzBQQiBFpq4msqQn8TK2baNbnr97VkD3hu553LBpJlLIIW2AFZj2vWM+8NJE50JOKv6LpY7
 Sqh7k3tUNxdyzpC8rLKRzXj16sWpdHEohdTmzKcjSk7N/phEwMhraCx7Y1Rr0q59ASm4fx1Udzj
 9vUjis3AFvsmdsm1kyESB1sGYgAKnQRnTdWgjmmilHeC/x6DG+U3mELMcmhq+EBtFhhhmD0Nxut
 uzugFPC 4cjHaSJg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Argument processing is specific to the test harness code. Any optional
information needs to be passed via environment variables. Move alternate
path to the RTC_DEV environment variable. Also do not open-code
TEST_HARNESS_MAIN because its definition may change.

Additionally, setup checking can be done in the FIXTURE_SETUP(). With
this adjustment, also improve the error reporting when the device cannot
be opened.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-rtc@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/rtc/Makefile  |  2 +-
 tools/testing/selftests/rtc/rtctest.c | 66 +++++----------------------
 2 files changed, 13 insertions(+), 55 deletions(-)

diff --git a/tools/testing/selftests/rtc/Makefile b/tools/testing/selftests/rtc/Makefile
index 55198ecc04db..654f9d58da3c 100644
--- a/tools/testing/selftests/rtc/Makefile
+++ b/tools/testing/selftests/rtc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS += -O3 -Wl,-no-as-needed -Wall
+CFLAGS += -O3 -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)
 LDLIBS += -lrt -lpthread -lm
 
 TEST_GEN_PROGS = rtctest
diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 63ce02d1d5cc..41cfefcc20e1 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -30,7 +30,18 @@ FIXTURE(rtc) {
 };
 
 FIXTURE_SETUP(rtc) {
+	char *alternate = getenv("RTC_DEV");
+
+	if (alternate)
+		rtc_file = alternate;
+
 	self->fd = open(rtc_file, O_RDONLY);
+
+	if (self->fd == -1 && errno == ENOENT)
+		SKIP(return, "Skipping test since %s does not exist", rtc_file);
+	EXPECT_NE(-1, self->fd) {
+		TH_LOG("%s: %s\n", rtc_file, strerror(errno));
+	}
 }
 
 FIXTURE_TEARDOWN(rtc) {
@@ -41,10 +52,6 @@ TEST_F(rtc, date_read) {
 	int rc;
 	struct rtc_time rtc_tm;
 
-	if (self->fd == -1 && errno == ENOENT)
-		SKIP(return, "Skipping test since %s does not exist", rtc_file);
-	ASSERT_NE(-1, self->fd);
-
 	/* Read the RTC time/date */
 	rc = ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
 	ASSERT_NE(-1, rc);
@@ -88,10 +95,6 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_SEC + 2) {
 	struct rtc_time rtc_tm;
 	time_t start_rtc_read, prev_rtc_read;
 
-	if (self->fd == -1 && errno == ENOENT)
-		SKIP(return, "Skipping test since %s does not exist", rtc_file);
-	ASSERT_NE(-1, self->fd);
-
 	TH_LOG("Continuously reading RTC time for %ds (with %dms breaks after every read).",
 	       READ_LOOP_DURATION_SEC, READ_LOOP_SLEEP_MS);
 
@@ -126,10 +129,6 @@ TEST_F_TIMEOUT(rtc, uie_read, NUM_UIE + 2) {
 	int i, rc, irq = 0;
 	unsigned long data;
 
-	if (self->fd == -1 && errno == ENOENT)
-		SKIP(return, "Skipping test since %s does not exist", rtc_file);
-	ASSERT_NE(-1, self->fd);
-
 	/* Turn on update interrupts */
 	rc = ioctl(self->fd, RTC_UIE_ON, 0);
 	if (rc == -1) {
@@ -155,10 +154,6 @@ TEST_F(rtc, uie_select) {
 	int i, rc, irq = 0;
 	unsigned long data;
 
-	if (self->fd == -1 && errno == ENOENT)
-		SKIP(return, "Skipping test since %s does not exist", rtc_file);
-	ASSERT_NE(-1, self->fd);
-
 	/* Turn on update interrupts */
 	rc = ioctl(self->fd, RTC_UIE_ON, 0);
 	if (rc == -1) {
@@ -198,10 +193,6 @@ TEST_F(rtc, alarm_alm_set) {
 	time_t secs, new;
 	int rc;
 
-	if (self->fd == -1 && errno == ENOENT)
-		SKIP(return, "Skipping test since %s does not exist", rtc_file);
-	ASSERT_NE(-1, self->fd);
-
 	rc = ioctl(self->fd, RTC_RD_TIME, &tm);
 	ASSERT_NE(-1, rc);
 
@@ -256,10 +247,6 @@ TEST_F(rtc, alarm_wkalm_set) {
 	time_t secs, new;
 	int rc;
 
-	if (self->fd == -1 && errno == ENOENT)
-		SKIP(return, "Skipping test since %s does not exist", rtc_file);
-	ASSERT_NE(-1, self->fd);
-
 	rc = ioctl(self->fd, RTC_RD_TIME, &alarm.time);
 	ASSERT_NE(-1, rc);
 
@@ -308,10 +295,6 @@ TEST_F_TIMEOUT(rtc, alarm_alm_set_minute, 65) {
 	time_t secs, new;
 	int rc;
 
-	if (self->fd == -1 && errno == ENOENT)
-		SKIP(return, "Skipping test since %s does not exist", rtc_file);
-	ASSERT_NE(-1, self->fd);
-
 	rc = ioctl(self->fd, RTC_RD_TIME, &tm);
 	ASSERT_NE(-1, rc);
 
@@ -366,10 +349,6 @@ TEST_F_TIMEOUT(rtc, alarm_wkalm_set_minute, 65) {
 	time_t secs, new;
 	int rc;
 
-	if (self->fd == -1 && errno == ENOENT)
-		SKIP(return, "Skipping test since %s does not exist", rtc_file);
-	ASSERT_NE(-1, self->fd);
-
 	rc = ioctl(self->fd, RTC_RD_TIME, &alarm.time);
 	ASSERT_NE(-1, rc);
 
@@ -410,25 +389,4 @@ TEST_F_TIMEOUT(rtc, alarm_wkalm_set_minute, 65) {
 	ASSERT_EQ(new, secs);
 }
 
-static void __attribute__((constructor))
-__constructor_order_last(void)
-{
-	if (!__constructor_order)
-		__constructor_order = _CONSTRUCTOR_ORDER_BACKWARD;
-}
-
-int main(int argc, char **argv)
-{
-	switch (argc) {
-	case 2:
-		rtc_file = argv[1];
-		/* FALLTHROUGH */
-	case 1:
-		break;
-	default:
-		fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
-		return 1;
-	}
-
-	return test_harness_run(argc, argv);
-}
+TEST_HARNESS_MAIN
-- 
2.34.1



Return-Path: <linux-rtc+bounces-3559-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D457CA6A3CA
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Mar 2025 11:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 562F717A193
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Mar 2025 10:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D6D21B9E3;
	Thu, 20 Mar 2025 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Df47gFRR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2C54A1D
	for <linux-rtc@vger.kernel.org>; Thu, 20 Mar 2025 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742466884; cv=none; b=bmXIa3LIFlsEfgDzVmh96uXb9QQnNOovr/EznV/usk8PpDV3Gp9TAgxrR+vNztfGFTZb1X9yfi14IyLZkFmponfTqN+uQaOaCRsR76bRpkmEl3Cq0c9/NrHqW/zMH0nS2FOQ5n8T6yT6A8N+4HILjhD5Lji8LoRYa8qF4D5cjiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742466884; c=relaxed/simple;
	bh=A+GsOcF7yksZA97OFNz4S5sU+EizGW4WHI35k7C0TAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJSt9w/oQ9wgPsFE91CCMgKDwMR4EMZBOK8UIw2uar2DO9byDUNqqv/2yukvDEbG55riibasI3ZTw7YAdyQxjW4A/4E9KGml9ws3LYGomJtNhIWD9ibmKscgRM/wFKrjwdKiS91PW3bIf0VWWLzE9Vwa/hN2smmeIhrOpq0mzvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Df47gFRR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=oNmuFgaI/Z6zyc
	vFg7S/Z2Ytc9xd2ZSpeL2zjdEosaQ=; b=Df47gFRRlKkE24FTQ7g6R3G2F0CaR0
	ouGXHaLhO6uM7oYcpyXUZkG/8TukywijwAYEB8xYcbtkABN5R4Jk8Rkw6Eicym11
	p+iNxnhP4hT7RlHsxZd3c+LwdV9ua9t3xRMlMzFdcckldcpMjxpLz94aiWUqnFp3
	60sp+P/vBbPqbdUJXH5CNew1sfcsvGk7QCk06mXWuDCvA3IHARnMj576qnH7rBUM
	+s6PSZNJA6G8hZRsTs0xGDOSDBi0K76PKaBYfjyKVfRle8nrQ+extPf4viMm9Wl4
	SdNJlWtWTo+N0j3lSQqxAyf00+zBNY9aW3UHSYker9KPSIhcswo7gPgQ==
Received: (qmail 609218 invoked from network); 20 Mar 2025 11:34:38 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2025 11:34:38 +0100
X-UD-Smtp-Session: l3s3148p1@3kdUr8MwjIMgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH] rtc: remove 'setdate' test program
Date: Thu, 20 Mar 2025 11:33:54 +0100
Message-ID: <20250320103433.11673-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tool is not embedded in the testing framework. 'rtc' from rtc-tools
serves as a much better programming example. No need to carry this tool
in the kernel tree.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Alexandre, what is you opinion on this?

 tools/testing/selftests/rtc/.gitignore |  1 -
 tools/testing/selftests/rtc/Makefile   |  2 -
 tools/testing/selftests/rtc/setdate.c  | 77 --------------------------
 3 files changed, 80 deletions(-)
 delete mode 100644 tools/testing/selftests/rtc/setdate.c

diff --git a/tools/testing/selftests/rtc/.gitignore b/tools/testing/selftests/rtc/.gitignore
index fb2d533aa575..a2afe7994e85 100644
--- a/tools/testing/selftests/rtc/.gitignore
+++ b/tools/testing/selftests/rtc/.gitignore
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
 rtctest
-setdate
diff --git a/tools/testing/selftests/rtc/Makefile b/tools/testing/selftests/rtc/Makefile
index 9dbb395c5c79..547c244a2ca5 100644
--- a/tools/testing/selftests/rtc/Makefile
+++ b/tools/testing/selftests/rtc/Makefile
@@ -4,8 +4,6 @@ LDLIBS += -lrt -lpthread -lm
 
 TEST_GEN_PROGS = rtctest
 
-TEST_GEN_PROGS_EXTENDED = setdate
-
 TEST_FILES := settings
 
 include ../lib.mk
diff --git a/tools/testing/selftests/rtc/setdate.c b/tools/testing/selftests/rtc/setdate.c
deleted file mode 100644
index b303890b3de2..000000000000
--- a/tools/testing/selftests/rtc/setdate.c
+++ /dev/null
@@ -1,77 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* Real Time Clock Driver Test
- *	by: Benjamin Gaignard (benjamin.gaignard@linaro.org)
- *
- * To build
- *	gcc rtctest_setdate.c -o rtctest_setdate
- */
-
-#include <stdio.h>
-#include <linux/rtc.h>
-#include <sys/ioctl.h>
-#include <sys/time.h>
-#include <sys/types.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <errno.h>
-
-static const char default_time[] = "00:00:00";
-
-int main(int argc, char **argv)
-{
-	int fd, retval;
-	struct rtc_time new, current;
-	const char *rtc, *date;
-	const char *time = default_time;
-
-	switch (argc) {
-	case 4:
-		time = argv[3];
-		/* FALLTHROUGH */
-	case 3:
-		date = argv[2];
-		rtc = argv[1];
-		break;
-	default:
-		fprintf(stderr, "usage: rtctest_setdate <rtcdev> <DD-MM-YYYY> [HH:MM:SS]\n");
-		return 1;
-	}
-
-	fd = open(rtc, O_RDONLY);
-	if (fd == -1) {
-		perror(rtc);
-		exit(errno);
-	}
-
-	sscanf(date, "%d-%d-%d", &new.tm_mday, &new.tm_mon, &new.tm_year);
-	new.tm_mon -= 1;
-	new.tm_year -= 1900;
-	sscanf(time, "%d:%d:%d", &new.tm_hour, &new.tm_min, &new.tm_sec);
-
-	fprintf(stderr, "Test will set RTC date/time to %d-%d-%d, %02d:%02d:%02d.\n",
-		new.tm_mday, new.tm_mon + 1, new.tm_year + 1900,
-		new.tm_hour, new.tm_min, new.tm_sec);
-
-	/* Write the new date in RTC */
-	retval = ioctl(fd, RTC_SET_TIME, &new);
-	if (retval == -1) {
-		perror("RTC_SET_TIME ioctl");
-		close(fd);
-		exit(errno);
-	}
-
-	/* Read back */
-	retval = ioctl(fd, RTC_RD_TIME, &current);
-	if (retval == -1) {
-		perror("RTC_RD_TIME ioctl");
-		exit(errno);
-	}
-
-	fprintf(stderr, "\n\nCurrent RTC date/time is %d-%d-%d, %02d:%02d:%02d.\n",
-		current.tm_mday, current.tm_mon + 1, current.tm_year + 1900,
-		current.tm_hour, current.tm_min, current.tm_sec);
-
-	close(fd);
-	return 0;
-}
-- 
2.47.2



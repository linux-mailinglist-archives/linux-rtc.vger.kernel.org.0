Return-Path: <linux-rtc+bounces-3217-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8C7A39895
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 11:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB0B1759F9
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 10:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3037922FADE;
	Tue, 18 Feb 2025 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YsBGbMwc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22799230275
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739873760; cv=none; b=phOaonq2uHbKnItAtnRliclASA2SI0TMYf7jJg6bPJpvJ1i8yHPBwrzF/obMuRAId6P2XSH4703SgZyI0uSinwOBICMQnv85zOGsJUwp5ACtGXyKVFs948rqbNySYBLx6pq6Ih5tnJj07TaqBaBWkNccOF0So+v4+K/bxAqajuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739873760; c=relaxed/simple;
	bh=sBTdqtOgD16fApVUeqBYVKlviQM3uaMS7VNpQQS1yRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nCpHRaEpJJr4kbWu2oLLV+kqbMH0DI0Zp7VUsw8nRWxeKrs2ufx9tBPh8RAgXUfH8pLLeiBuCJKpUCG86cW++dwlinm3KawFhnTRultb/2HBarhi/3SFkryA6he6pubU1HQML48+XLNIDA8W0wr996CNgJDpKZ/xXzjtndznfsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YsBGbMwc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=DWNdU6NHbFUKWE
	wBPm/fHWiiYU/V553IRXpMN4Dsz7w=; b=YsBGbMwcvE9NjdbhTQcYvj42UaThrm
	puvdO2MMxHzlTz/Wq3HkwVOtWQg36Uve996i5AoS8T2Z3zZqG1cF8R3gzfzHdzo5
	OrCGGqmY6Frk1ALJXcDXNILfNslz9oC6pOvT+KYQEO8ObYcLqqxXJ8gwGXfseq0a
	c6sXRUx6+QEthvosxh3DYTkh2TbVCzfmO6rhr8jG1TmG9Sj5VAKcJgyoBWwNikR1
	y9Ae6yLwJdgDR/JHIsUeOXAYYsdkJpnLejsoCEBgwnJJ/xGB285N4/iPajfIesIH
	Q3GAhp1BEV2vBwkbsyAENBx15+33vC650Pg8y0A+6c9aiX6On4fnI40A==
Received: (qmail 157857 invoked from network); 18 Feb 2025 11:15:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Feb 2025 11:15:53 +0100
X-UD-Smtp-Session: l3s3148p1@eooI7Wcu9pEujnvP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Joseph Jang <jjang@nvidia.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftest: rtc: skip some tests if the alarm only supports minutes
Date: Tue, 18 Feb 2025 11:15:47 +0100
Message-Id: <20250218101548.6514-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are alarms which have only minute-granularity. The RTC core
already has a flag to describe them. Use this flag to skip tests which
require the alarm to support seconds.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested with a Renesas RZ-N1D board. This RTC obviously has only minute
resolution for the alarms. Output now looks like this:

#  RUN           rtc.alarm_alm_set ...
#      SKIP      Skipping test since alarms has only minute granularity.
#            OK  rtc.alarm_alm_set
ok 5 rtc.alarm_alm_set # SKIP Skipping test since alarms has only minute granularity.

Before it was like this:

#  RUN           rtc.alarm_alm_set ...
# rtctest.c:255:alarm_alm_set:Alarm time now set to 09:40:00.
# rtctest.c:275:alarm_alm_set:data: 1a0
# rtctest.c:281:alarm_alm_set:Expected new (1489743644) == secs (1489743647)


 tools/testing/selftests/rtc/rtctest.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 3e4f0d5c5329..e0a148261e6f 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -29,6 +29,7 @@ enum rtc_alarm_state {
 	RTC_ALARM_UNKNOWN,
 	RTC_ALARM_ENABLED,
 	RTC_ALARM_DISABLED,
+	RTC_ALARM_RES_MINUTE,
 };
 
 FIXTURE(rtc) {
@@ -88,7 +89,7 @@ static void nanosleep_with_retries(long ns)
 	}
 }
 
-static enum rtc_alarm_state get_rtc_alarm_state(int fd)
+static enum rtc_alarm_state get_rtc_alarm_state(int fd, int need_seconds)
 {
 	struct rtc_param param = { 0 };
 	int rc;
@@ -103,6 +104,10 @@ static enum rtc_alarm_state get_rtc_alarm_state(int fd)
 	if ((param.uvalue & _BITUL(RTC_FEATURE_ALARM)) == 0)
 		return RTC_ALARM_DISABLED;
 
+	/* Check if alarm has desired granularity */
+	if (need_seconds && (param.uvalue & _BITUL(RTC_FEATURE_ALARM_RES_MINUTE)))
+		return RTC_ALARM_RES_MINUTE;
+
 	return RTC_ALARM_ENABLED;
 }
 
@@ -227,9 +232,11 @@ TEST_F(rtc, alarm_alm_set) {
 		SKIP(return, "Skipping test since %s does not exist", rtc_file);
 	ASSERT_NE(-1, self->fd);
 
-	alarm_state = get_rtc_alarm_state(self->fd);
+	alarm_state = get_rtc_alarm_state(self->fd, 1);
 	if (alarm_state == RTC_ALARM_DISABLED)
 		SKIP(return, "Skipping test since alarms are not supported.");
+	if (alarm_state == RTC_ALARM_RES_MINUTE)
+		SKIP(return, "Skipping test since alarms has only minute granularity.");
 
 	rc = ioctl(self->fd, RTC_RD_TIME, &tm);
 	ASSERT_NE(-1, rc);
@@ -295,9 +302,11 @@ TEST_F(rtc, alarm_wkalm_set) {
 		SKIP(return, "Skipping test since %s does not exist", rtc_file);
 	ASSERT_NE(-1, self->fd);
 
-	alarm_state = get_rtc_alarm_state(self->fd);
+	alarm_state = get_rtc_alarm_state(self->fd, 1);
 	if (alarm_state == RTC_ALARM_DISABLED)
 		SKIP(return, "Skipping test since alarms are not supported.");
+	if (alarm_state == RTC_ALARM_RES_MINUTE)
+		SKIP(return, "Skipping test since alarms has only minute granularity.");
 
 	rc = ioctl(self->fd, RTC_RD_TIME, &alarm.time);
 	ASSERT_NE(-1, rc);
@@ -357,7 +366,7 @@ TEST_F_TIMEOUT(rtc, alarm_alm_set_minute, 65) {
 		SKIP(return, "Skipping test since %s does not exist", rtc_file);
 	ASSERT_NE(-1, self->fd);
 
-	alarm_state = get_rtc_alarm_state(self->fd);
+	alarm_state = get_rtc_alarm_state(self->fd, 0);
 	if (alarm_state == RTC_ALARM_DISABLED)
 		SKIP(return, "Skipping test since alarms are not supported.");
 
@@ -425,7 +434,7 @@ TEST_F_TIMEOUT(rtc, alarm_wkalm_set_minute, 65) {
 		SKIP(return, "Skipping test since %s does not exist", rtc_file);
 	ASSERT_NE(-1, self->fd);
 
-	alarm_state = get_rtc_alarm_state(self->fd);
+	alarm_state = get_rtc_alarm_state(self->fd, 0);
 	if (alarm_state == RTC_ALARM_DISABLED)
 		SKIP(return, "Skipping test since alarms are not supported.");
 
-- 
2.39.2



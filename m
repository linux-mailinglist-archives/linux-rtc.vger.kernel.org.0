Return-Path: <linux-rtc+bounces-6456-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOEkHKVF82kMzAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6456-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Apr 2026 14:05:57 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD24A290B
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Apr 2026 14:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DB30305BA8B
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Apr 2026 12:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B093FA5EB;
	Thu, 30 Apr 2026 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eoIk2JN9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D933EF66D
	for <linux-rtc@vger.kernel.org>; Thu, 30 Apr 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550606; cv=none; b=Ai4qj+Y02EjlBEJ/vXlerP85wfimiJN9cIX5XdqhNfJjuKk2jquwYc1MumByLG/PfMT9bdjIQIWVVSW/XT2ra2hp6zxfZp9PQ9QY/Z16KYQNn+g03rFarFAhVj5xIBtfVcATToEEa9cIYVOpf2CThmUJ4xv9SzLomUJ/uhnERik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550606; c=relaxed/simple;
	bh=duJWKLbfqTL4D1zNPPk5QveBYRxoms7eL2nTGNWcLqY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=p+Xx+fRxp61wfEg8zR1M9PVU1zL5F3icgJDrnGocGlnh3umE0h4kbFRL6CQsHQX/SoXZQkgieXzaEVCQczdE+wsYF+48sMU8oMEs9ed2MBFtwp5WDfngH2IhXwuJZm9QtbC1vkiK7LzJNJKMVHU1klpP6hjNcNaSNhjnH6JesvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eoIk2JN9; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82fbceb0181so639107b3a.3
        for <linux-rtc@vger.kernel.org>; Thu, 30 Apr 2026 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777550603; x=1778155403; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PvMj/MkllnjgvE6Y7N3WHrJDvNHvsjKi1M8BHUaGO3o=;
        b=eoIk2JN9G0lyeyRKP9OQ4Tmjgi/XHJFUFEOiGH/rT+vjWi0kjVgOWKb+qY6I1IB7Fb
         wxNDv9uZL2Uyy78H22fmrEGDpoyoSt5q0d9mwdFCgHy0hvzfnRZ8PeWDzwdEyGoYRq7Y
         TxMjd4699QKuOgsNckmLFHI5UEdtlx9J7b486gPtkR+REwrcoIY975S4/EPvFyskH+ZF
         88SbgwcJy1UVi/ySM5O9MP6pkU1M4ik5qllBKDgq52rjSS3L0KAfPaMuajVEk2Aj42no
         in24wqfNSh1TOb/MuD2XFSyBxD64T1MlXjPpdASIx+8GVXK/ds13e40kzzg1QMku7hig
         +Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550603; x=1778155403;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvMj/MkllnjgvE6Y7N3WHrJDvNHvsjKi1M8BHUaGO3o=;
        b=h5rx2hP4xILQXkc/TPpMKnMS85JVnj/hoL1KQNnV/Z4/VwL47Vuc4wzv5vwB1pOUh9
         3nRfKAtwoI9JetkGLpcYg+RGmcBJcIHuCD7LoI57Kc15Ujz7VSpg5XD50DF+1IXxjert
         PpX2QeQostKtQ8tSlZ9SIkIbAaqfz/Y2ruAcGy6hEcgcqi2nIMGY7N0H+aXng5u3j96U
         NMwpCmDBRthLrlgsCFaWolsNlIUTgI2xajea4udtXI5Z54SYBX1Fko8H4fHjKqrd2Mre
         1/eRnn0vcCzLEOPTBAN44DZqbLP/XB/nOVaBpbCV8GopZ+o5RSmaNJeDJ+woWvGdZvNb
         2UXQ==
X-Gm-Message-State: AOJu0Yxt8iymC03pmXlFrEe/FEJRgJ9Om1rf4i3IdqYgqbW2A82dO7MI
	+O8ROOY0sD5WR6XwC9+HxUhZjF/p2Md/yVL0P74fzhZOHMR8+yz3wyHdMiy4L1TfxWfjYvnvmQg
	+pw==
X-Received: from pfbgx2.prod.google.com ([2002:a05:6a00:1e02:b0:82f:b322:30fb])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:340a:b0:82f:1973:4b96
 with SMTP id d2e1a72fcca58-834fdcdef18mr2884609b3a.26.1777550602832; Thu, 30
 Apr 2026 05:03:22 -0700 (PDT)
Date: Thu, 30 Apr 2026 20:03:13 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260430120313.4078185-1-wakel@google.com>
Subject: [PATCH] selftests: rtc: fix flaky date_read_loop test
From: Wake Liu <wakel@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 19AD24A290B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6456-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wakel@google.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The test case rtc.date_read_loop in rtctest.c fails intermittently because
it checks that the RTC time does not advance by more than 1 second per loop
iteration. However, the loop sleeps for 11ms via nanosleep(), and if the
test thread is descheduled by the OS scheduler (e.g., under heavy system
load in a VM), more than 1 second can elapse between consecutive RTC reads.
This causes the next RTC time read to be 2 or more seconds ahead of the
previous read, triggering a test assertion failure.

To make the test more resilient against OS scheduling delays, measure the
real elapsed time between iterations using a monotonic clock
(clock_gettime(CLOCK_MONOTONIC)), and compute the actual number of seconds
elapsed (delta_s) between consecutive RTC reads. Then dynamically adjust
the assertion to:
ASSERT_GE(prev_rtc_read + delta_s + 1, rtc_read);

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/rtc/rtctest.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 8047d9879039..54eb5c255a45 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -116,6 +116,7 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_SEC + 2) {
 	long iter_count = 0;
 	struct rtc_time rtc_tm;
 	time_t start_rtc_read, prev_rtc_read;
+	struct timespec prev_mono, cur_mono;
 
 	if (self->fd == -1 && errno == ENOENT)
 		SKIP(return, "Skipping test since %s does not exist", rtc_file);
@@ -126,25 +127,31 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_SEC + 2) {
 
 	rc = ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
 	ASSERT_NE(-1, rc);
+	clock_gettime(CLOCK_MONOTONIC, &prev_mono);
 	start_rtc_read = rtc_time_to_timestamp(&rtc_tm);
 	prev_rtc_read = start_rtc_read;
 
 	do  {
 		time_t rtc_read;
+		time_t delta_s = 0;
 
 		rc = ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
 		ASSERT_NE(-1, rc);
+		clock_gettime(CLOCK_MONOTONIC, &cur_mono);
 
 		rtc_read = rtc_time_to_timestamp(&rtc_tm);
+		delta_s = cur_mono.tv_sec - prev_mono.tv_sec;
+
 		/* Time should not go backwards */
 		ASSERT_LE(prev_rtc_read, rtc_read);
-		/* Time should not increase more then 1s at a time */
-		ASSERT_GE(prev_rtc_read + 1, rtc_read);
+		/* Time should not increase more then elapsed time + 1s */
+		ASSERT_GE(prev_rtc_read + delta_s + 1, rtc_read);
 
 		/* Sleep 11ms to avoid killing / overheating the RTC */
 		nanosleep_with_retries(READ_LOOP_SLEEP_MS * 1000000);
 
 		prev_rtc_read = rtc_read;
+		prev_mono = cur_mono;
 		iter_count++;
 	} while (prev_rtc_read <= start_rtc_read + READ_LOOP_DURATION_SEC);
 
-- 
2.54.0.545.g6539524ca2-goog



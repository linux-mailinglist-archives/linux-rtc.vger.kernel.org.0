Return-Path: <linux-rtc+bounces-6647-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ToE6As5vL2rFAQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6647-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 05:21:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B255268303B
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 05:21:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=U6TaNMeq;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6647-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6647-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FA84300767C
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 03:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043D726E718;
	Mon, 15 Jun 2026 03:21:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D00C1A0B0E
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 03:21:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493704; cv=none; b=gGl/nkaXvhIU9svrm68G29eB7SowYtwHiy1TpxDvix4wzgWn/LuJwYwkvaL3Fu2FTCjkljUvkj7z+V0kLvd0aVpxo6qewsM7YKZUeRsuQpyn/c15Vqu98+6hxfQ7sRBwZKm4Hk+dFl01a7sW5IQuxp4zh71uTDjM7h3pPIURC/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493704; c=relaxed/simple;
	bh=EwERMGPWbO5j9vnUYC/3TZwJyEPuQY8QBN5TamxIe/E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TYesyGNL7fJ0/KQB6BnJ6gr6+E8cKxkmUgy6WZHqgGaEN59chy/ShpXCl7QWPblTkjZNJLi3R+WbVjvcjASON1cwL7Gu4qvqb439HfGRqFT9ZZNJHgHuupyG3KTG6Ub+pAxwuN3rK7Ed58PXncJ4MijVSWfnBDmt08jy86nNZ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U6TaNMeq; arc=none smtp.client-ip=209.85.214.202
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c0532a6588so25774255ad.0
        for <linux-rtc@vger.kernel.org>; Sun, 14 Jun 2026 20:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781493702; x=1782098502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN02iGYP6APaQ7QGZNimyxpm1GxMFcy4Uoxq70tgF+o=;
        b=U6TaNMeqIxLcHkszZlM3iavTODozpRv+lv1l7HlBs9r2efhsoNY7wJSI7dQkQ7ZnVO
         imvNNttfCEQbEOKcPGR4n+GHmNL9hODeCRI2BIz3i7crfzbQ46xIBPjL9oT4xPMe9weO
         vzE5q3MBc9Tn2LWd3FJA/FhI2bAKgRmhAKDFAKfjVr19LpXvmu1McDGmU61GZViTgnDF
         kBqe5PaxQl4+b1rzxl30EAsH7vJp4rFWLcYz3/RKMmVewlWf4I5C0fMyyaRbtVjXPITQ
         iac3XiqGHcMTwJboqD++Zhx711xY9VLuJAa4nI4W6kIcwO7gWnp3X3joyFE2+YWeeyeG
         WbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781493702; x=1782098502;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lN02iGYP6APaQ7QGZNimyxpm1GxMFcy4Uoxq70tgF+o=;
        b=DJ7qhUZBcvzZWh8ZWApPLIEv02GeqO8sP3JItCKFQzkQYvBnTC+k6rOnUgbc6eW7yy
         tV4Zeex/2yirdLnlNksTXqqwzkOh6qQeUVu4wO06kPwL/KRlxexNq0j9HCVgfjCpxyZD
         YsNkQA8uC/zdyI1kLxxCQX+p35ADrW+uxszsXeebvuk+DMT/Wzwmpoy/djoSgnmvpPwo
         NaQfHAPFAyiaW84tsvRWWpT0ZoCy4/NBA+/88XWKUuw6xqGkjA6z39o3ObNScp9XzwSo
         DUYGVqzBaSqlbYwW3qh0pXDJhhkPweCePX2fHn7fmy61XTSGb+UXWKb7JI7+ikmCWw3d
         CtLw==
X-Gm-Message-State: AOJu0Yym+jfB03NyPYvnqK6PBQAn647+JoC7Fn+YfTMvrqlBdgGPy5XB
	13Fp6z5M4NpLBNufYkpm2lEWQIjxDRvCsOMq2UMg12cZFyFCGRPXjY6J+flXxWqR4QcfG/SY+uu
	aIA==
X-Received: from plbli11.prod.google.com ([2002:a17:903:294b:b0:2bd:3ebe:ef7e])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c04:b0:2c2:245a:336c
 with SMTP id d9443c01a7336-2c6641f1e20mr96348485ad.14.1781493702193; Sun, 14
 Jun 2026 20:21:42 -0700 (PDT)
Date: Mon, 15 Jun 2026 03:21:39 +0000
In-Reply-To: <20260430120313.4078185-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260430120313.4078185-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260615032139.4573-1-wakel@google.com>
Subject: [PATCH] selftests: rtc: fix flaky date_read_loop test
From: Wake Liu <wakel@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:shuah@kernel.org,m:linux-rtc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wakel@google.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wakel@google.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6647-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wakel@google.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B255268303B

The test case rtc.date_read_loop in rtctest.c fails intermittently because =
it checks that the RTC time does not advance by more than 1 second per loop=
 iteration. However, the loop sleeps for 11ms via nanosleep(), and if the t=
est thread is descheduled by the OS scheduler (e.g., under heavy system loa=
d in a VM), more than 1 second can elapse between consecutive RTC reads. Th=
is causes the next RTC time read to be 2 or more seconds ahead of the previ=
ous read, triggering a test assertion failure.

To make the test more resilient against OS scheduling delays, measure the r=
eal elapsed time between iterations using a monotonic clock (clock_gettime(=
CLOCK_MONOTONIC)), and compute the actual number of seconds elapsed (delta_=
s) between consecutive RTC reads. Then dynamically adjust the assertion to:=
 ASSERT_GE(prev_rtc_read + delta_s + 1, rtc_read);

Signed-off-by: Wake Liu <wakel@google.com>
---
Gentle ping on this patch. We are still seeing flaky failures in this test
in our automated testing (VTS). It would be great if someone could review i=
t.

 tools/testing/selftests/rtc/rtctest.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftest=
s/rtc/rtctest.c
index 8047d9879039..54eb5c255a45 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -116,6 +116,7 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_=
SEC + 2) {
 	long iter_count =3D 0;
 	struct rtc_time rtc_tm;
 	time_t start_rtc_read, prev_rtc_read;
+	struct timespec prev_mono, cur_mono;
=20
 	if (self->fd =3D=3D -1 && errno =3D=3D ENOENT)
 		SKIP(return, "Skipping test since %s does not exist", rtc_file);
@@ -126,25 +127,31 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATIO=
N_SEC + 2) {
=20
 	rc =3D ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
 	ASSERT_NE(-1, rc);
+	clock_gettime(CLOCK_MONOTONIC, &prev_mono);
 	start_rtc_read =3D rtc_time_to_timestamp(&rtc_tm);
 	prev_rtc_read =3D start_rtc_read;
=20
 	do  {
 		time_t rtc_read;
+		time_t delta_s =3D 0;
=20
 		rc =3D ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
 		ASSERT_NE(-1, rc);
+		clock_gettime(CLOCK_MONOTONIC, &cur_mono);
=20
 		rtc_read =3D rtc_time_to_timestamp(&rtc_tm);
+		delta_s =3D cur_mono.tv_sec - prev_mono.tv_sec;
+
 		/* Time should not go backwards */
 		ASSERT_LE(prev_rtc_read, rtc_read);
-		/* Time should not increase more then 1s at a time */
-		ASSERT_GE(prev_rtc_read + 1, rtc_read);
+		/* Time should not increase more then elapsed time + 1s */
+		ASSERT_GE(prev_rtc_read + delta_s + 1, rtc_read);
=20
 		/* Sleep 11ms to avoid killing / overheating the RTC */
 		nanosleep_with_retries(READ_LOOP_SLEEP_MS * 1000000);
=20
 		prev_rtc_read =3D rtc_read;
+		prev_mono =3D cur_mono;
 		iter_count++;
 	} while (prev_rtc_read <=3D start_rtc_read + READ_LOOP_DURATION_SEC);
=20
--=20
2.54.0.1136.gdb2ca164c4-goog



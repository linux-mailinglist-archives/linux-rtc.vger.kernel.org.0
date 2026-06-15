Return-Path: <linux-rtc+bounces-6657-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4KCsC1YUMGoPNAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6657-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:03:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC0687741
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:03:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=x+5es6Eu;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6657-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6657-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D393E30CCB43
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919C33EF647;
	Mon, 15 Jun 2026 15:01:30 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78366400DF8;
	Mon, 15 Jun 2026 15:01:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535690; cv=none; b=CtqM/46MCIdlWbBLefiyYRqzEb5Qg+7TaOM5XVEQW/9Dcb0WIBRiBI3kX1kKGmsUG1t5dLQS+uDUFH7x5Dle5QkhvOCXOln/M+Fj97F9M5i0cJuzcCt2LvA6kZ7RO+7O7bJcAlE46/AU2f00vxof0NTybS2Uvv4f/bmrpBx9fDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535690; c=relaxed/simple;
	bh=QbZPM/o3KKRe/hxFpnZ/ZSzQM6AbEy+iBkhQv0rHRWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl2fDUFXSCCfY6YmMbQm8bpK54dW6ks/Eg/AkYKs7fhC0edQt+gaQLNb8n/vKB5OFNY+U1BPtFP3QJCpRoZJsLTUzFKkeloXyMd86BpvZl/XNX+ICBcKIS8tOXl+naqmzo2q3Vofdb6bLRpgoId4W7EdfNJ/o27H+zifpifmUPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x+5es6Eu; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD3524E42F00;
	Mon, 15 Jun 2026 15:01:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91F7360015;
	Mon, 15 Jun 2026 15:01:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A193B106C96F4;
	Mon, 15 Jun 2026 17:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781535680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=a2H1p266hfKHQouhbPEscQriyAVv7K2hZno8du8FaLQ=;
	b=x+5es6EuDARWV8i9iIgi3A+HE0q2jtZLw/hyHb7jPlaTlq3OY9StFzaCwMccRNsb49Dfmm
	6Vwj53olnzDiloq0054ZBPKgmnscWDSMTOpO81u85gR3lkKidD+vC1pEvbreun/5R0vzhW
	ON1q24RCEd5QZ76JS7DCYOE+KilKmGKkURxmMMIjqC5HghFdcQqqidbiMad/M6JhIWMSRR
	qdRv+9zGGgT8dTE1U6BEkSsPJaDlzQM8e5YUKYxjm2SU0i/p9YuBH70olh211sKJPAIgXR
	Uy4hpTW7JtxpIW6lv8OUFAoWXIvR1flrjyX1RkNxVWss0Xxwqs9uL9/7X9md6Q==
Date: Mon, 15 Jun 2026 17:01:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wake Liu <wakel@google.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: rtc: fix flaky date_read_loop test
Message-ID: <20260615150119ee47a1aa@mail.local>
References: <20260430120313.4078185-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430120313.4078185-1-wakel@google.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6657-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wakel@google.com,m:shuah@kernel.org,m:linux-rtc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.local:mid,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79CC0687741

On 30/04/2026 20:03:13+0800, Wake Liu wrote:
> The test case rtc.date_read_loop in rtctest.c fails intermittently because
> it checks that the RTC time does not advance by more than 1 second per loop
> iteration. However, the loop sleeps for 11ms via nanosleep(), and if the
> test thread is descheduled by the OS scheduler (e.g., under heavy system
> load in a VM), more than 1 second can elapse between consecutive RTC reads.
> This causes the next RTC time read to be 2 or more seconds ahead of the
> previous read, triggering a test assertion failure.
> 
> To make the test more resilient against OS scheduling delays, measure the
> real elapsed time between iterations using a monotonic clock
> (clock_gettime(CLOCK_MONOTONIC)), and compute the actual number of seconds
> elapsed (delta_s) between consecutive RTC reads. Then dynamically adjust
> the assertion to:
> ASSERT_GE(prev_rtc_read + delta_s + 1, rtc_read);
> 
> Signed-off-by: Wake Liu <wakel@google.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>



> ---
>  tools/testing/selftests/rtc/rtctest.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> index 8047d9879039..54eb5c255a45 100644
> --- a/tools/testing/selftests/rtc/rtctest.c
> +++ b/tools/testing/selftests/rtc/rtctest.c
> @@ -116,6 +116,7 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_SEC + 2) {
>  	long iter_count = 0;
>  	struct rtc_time rtc_tm;
>  	time_t start_rtc_read, prev_rtc_read;
> +	struct timespec prev_mono, cur_mono;
>  
>  	if (self->fd == -1 && errno == ENOENT)
>  		SKIP(return, "Skipping test since %s does not exist", rtc_file);
> @@ -126,25 +127,31 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_SEC + 2) {
>  
>  	rc = ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
>  	ASSERT_NE(-1, rc);
> +	clock_gettime(CLOCK_MONOTONIC, &prev_mono);
>  	start_rtc_read = rtc_time_to_timestamp(&rtc_tm);
>  	prev_rtc_read = start_rtc_read;
>  
>  	do  {
>  		time_t rtc_read;
> +		time_t delta_s = 0;
>  
>  		rc = ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
>  		ASSERT_NE(-1, rc);
> +		clock_gettime(CLOCK_MONOTONIC, &cur_mono);
>  
>  		rtc_read = rtc_time_to_timestamp(&rtc_tm);
> +		delta_s = cur_mono.tv_sec - prev_mono.tv_sec;
> +
>  		/* Time should not go backwards */
>  		ASSERT_LE(prev_rtc_read, rtc_read);
> -		/* Time should not increase more then 1s at a time */
> -		ASSERT_GE(prev_rtc_read + 1, rtc_read);
> +		/* Time should not increase more then elapsed time + 1s */
> +		ASSERT_GE(prev_rtc_read + delta_s + 1, rtc_read);
>  
>  		/* Sleep 11ms to avoid killing / overheating the RTC */
>  		nanosleep_with_retries(READ_LOOP_SLEEP_MS * 1000000);
>  
>  		prev_rtc_read = rtc_read;
> +		prev_mono = cur_mono;
>  		iter_count++;
>  	} while (prev_rtc_read <= start_rtc_read + READ_LOOP_DURATION_SEC);
>  
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


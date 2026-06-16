Return-Path: <linux-rtc+bounces-6676-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3VL0MvzzMGrJZQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6676-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2026 08:58:04 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBFB68CAE0
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2026 08:58:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=UyP5fyXK;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6676-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6676-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF94A3028374
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2026 06:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E67E31B83B;
	Tue, 16 Jun 2026 06:57:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F2317166;
	Tue, 16 Jun 2026 06:57:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593074; cv=none; b=coaxg5ZKMW9Ph/g6VLPDqqTaqAnW3XbDJb+xwxOL6ekurUTXEXL2gspM5G5fbP4e7s937h6bQ8LApE4NqRnBMi3GlNpRBpTI75Kwx6bvqItv8G1uQqqVyU7HIY4dvGi/dQJ0RUIL/DdlV3vfX2wuX9i3FiUOga/4EPt6Ox+ahg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593074; c=relaxed/simple;
	bh=QkSHldmc4jZa/EUTnqrJIuOtViOJcDJyUAcvUqG4Zxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWRuTZ5sWmaCpY6xBDE6ZBmlyKMrEJrjfY+ZQy/Pb4ggT7acW/jBCUuG9d8jYxF8U37rCPQtH62VPeS5aHF+gdBJCl6zOsyoSaEKBCTBJJkE7PWADho7weQ95zZU/+B5YXZaafYN7IgwbCcwznn8NFC4KWX9rqXCtvXyhltb78c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UyP5fyXK; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 00C21C2BB2D;
	Tue, 16 Jun 2026 06:57:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88568601A9;
	Tue, 16 Jun 2026 06:57:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7376106C9A88;
	Tue, 16 Jun 2026 08:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781593069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1I1ePuzgoHF2k9KKmCMFD41Ri8yU5GgK2wB1ej94K3A=;
	b=UyP5fyXKQ/q0GZZkEisb9EUiyGK23UyTThXf9gjZyYxVmwjJ4ejdfHCMY8YCNl9nw4lWjV
	eH3v8lMD+5MBKzOjtcPRrkNYGePmWd0UhtAJak+f/QFVKwj4UELVOFnaSTnqOKXudFdcfl
	J8PTAdmiPwbfxxTA+zgPcxnioF0V1l/4VxX+Mn2hbehdaY8JhOfFxUiod7iSWZhMbq9uRc
	f/oItf5URJX8gBdD7krR0y4TVjZ8aPYv4uMdNoNx1pvOuU/HQ+16oUpdDWa0kMN+3Pueej
	UYbG1S+TRKkjgoAigmHByvGeT6pbakpSs6PCtmzhvhc/A09y0JMa4tlPX3+UQQ==
Date: Tue, 16 Jun 2026 08:57:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: interface: Add rtc time jump debug in
 rtc_timer_do_work()
Message-ID: <202606160657465eab6e41@mail.local>
References: <20260525130825.954214-1-ruanjinjie@huawei.com>
 <2026061515223171f111f5@mail.local>
 <06cdb8b3-8a5d-4f1d-b686-6122fa6f7af9@huawei.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06cdb8b3-8a5d-4f1d-b686-6122fa6f7af9@huawei.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6676-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,huawei.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BBFB68CAE0

Hi,

On 16/06/2026 10:10:19+0800, Jinjie Ruan wrote:
> 
> 
> On 6/15/2026 11:22 PM, Alexandre Belloni wrote:
> > Hello,
> > 
> > On 25/05/2026 21:08:25+0800, Jinjie Ruan wrote:
> >> In virtualization environments like QEMU [1], or during hardware
> >> clocksource anomalies, an extreme time-warp event can occur. When
> >> the system time abruptly jumps forward, the rtc_timer_do_work() handler
> >> falls into a prolonged processing loop to clear accumulated historical
> >> timers via timerqueue_getnext(). Running this loop indefinitely under
> >> the rtc->ops_lock mutex triggers a kernel softlockup, stalling
> >> the system.
> >>
> >> Introduce an adaptive telemetry and loop guard mechanism to enhance debug
> >> visibility and prevent softlockups:
> >>
> >> 1. Record `start_jiffies` upon entry and leverage `time_after()` to
> >>    check if the loop has monopolized the CPU for more than 1s (HZ). If so,
> >>    the handler prints a telemetry warning, triggers a WARN stack dump, and
> >>    breaks the loop to safely yield the CPU.
> >>
> >> 2. Track the execution via a `loop_count` metric. Printing this counter
> >>    in the warning log provides vital diagnostics to distinguish
> >>    an aggressive time-warp storm (high count) from a bogged-down callback
> >>    bug (low count).
> >>
> >> 3. Utilize the kernel format specifier `%ptR` to convert the raw ktime
> >>    into a human-readable timestamp (YYYY-MM-DD HH:MM:SS), allowing
> >>    developers to instantly pinpoint the exact boundary of the time
> >>    jump in dmesg.
> >>
> >> This non-destructive telemetry guard provides precise hardware/emulator
> >> diagnostic visibility while ensuring core kernel availability.
> >>
> >> [1]: https://lore.kernel.org/all/20260114013257.3500578-1-ruanjinjie@huawei.com/
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> ---
> >>  drivers/rtc/interface.c | 15 +++++++++++++--
> >>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> >> index 1906f4884a83..f6c5fd16cc4e 100644
> >> --- a/drivers/rtc/interface.c
> >> +++ b/drivers/rtc/interface.c
> >> @@ -927,10 +927,12 @@ static void rtc_timer_remove(struct rtc_device *rtc, struct rtc_timer *timer)
> >>   */
> >>  void rtc_timer_do_work(struct work_struct *work)
> >>  {
> >> -	struct rtc_timer *timer;
> >> +	unsigned long start_jiffies = jiffies;
> >>  	struct timerqueue_node *next;
> >> -	ktime_t now;
> >> +	struct rtc_timer *timer;
> >>  	struct rtc_time tm;
> >> +	int loop_count = 0;
> >> +	ktime_t now;
> >>  	int err;
> >>  
> >>  	struct rtc_device *rtc =
> >> @@ -945,6 +947,15 @@ void rtc_timer_do_work(struct work_struct *work)
> >>  	}
> >>  	now = rtc_tm_to_ktime(tm);
> >>  	while ((next = timerqueue_getnext(&rtc->timerqueue))) {
> >> +		loop_count++;
> >> +
> >> +		if (unlikely(time_after(jiffies, start_jiffies + HZ))) {
> >> +			dev_warn(&rtc->dev, "RTC time jump (loop: %d) to %ptR.\n",
> >> +				 loop_count, &tm);
> >> +			WARN_ON_ONCE(1);
> > 
> > So, your issue is that it is too slow so you make it even slower? There
> > are already plenty of tracepoints that allow proper debugging in this
> > loop, I'm pretty sure we don't want to bloat the kernel with more
> > messages.
> 
> Hi, Alexandre,
> 
> The point here is not about the performance of the rtc_timer_do_work()
> loop — it’s about making the problem debuggable when things go wrong.
> And we can put it under a debug Kconfig option, so production kernels
> see no extra overhead at all.


But then aren't the tracepoint enough? There are 3 tracepoints in the
loop that are exactly for debugging your issue.

> 
> The patch is installed in the following scenarios:
> 
> If the RTC hardware fails, or if the QEMU-emulated RTC device code in a
> KVM virtual machine has a problem (for example, the x86 RTC emulation
> hardware mc146818 has an overflow issue[1]), the time may jump as shown
> in the log below, which can cause a soft lockup.

This is not clear, you are not explaining the issue. You seem to mix
system time and RTC time. What I understand is that there was a periodic
timer enqueued and then for some reason, the system time jumped forward
by a large amount and now rtc_timer_do_work is firing events for each of
the missed timers. You are not explaining the relationship with the RTC
hardware (I see none). 

> 
> However, when the issue occurs, it is only possible to know that too
> many pending timers have accumulated in the timerqueue (for example, the
> log shows that tens of millions of timer nodes have been processed) by
> temporarily adding diagnostic code in rtc_timer_do_work().
> 

This is not true, there are 3 tracepoints to know what is happening with
the timers. Also, there are always exactly zero, one or two timers in
the queue, never tens of millions.

> To determine whether the root cause is hardware, kernel RTC code, an RTC
> driver issue, or an RTC hardware problem, more debugging is needed. But
> if the problem is indeed caused by RTC hardware, adding a diagnostic
> print of the current RTC time when the loop takes too long (as this
> diagnostic patch does) would make it easy to tell whether QEMU or the
> hardware is faulty.
> 
> [1]: https://lore.kernel.org/all/20260613195116.1807273-21-mjt@tls.msk.ru/
> 
>      kworker/0:1-37      [000] .N..   489.159634: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281423
>      kworker/0:1-37      [000] .N..   489.159635: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281424
>      kworker/0:1-37      [000] .N..   489.159635: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281425
>      kworker/0:1-37      [000] .N..   489.159636: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281426
>      kworker/0:1-37      [000] .N..   489.159637: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281427
>      kworker/0:1-37      [000] .N..   489.159638: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281428
>      kworker/0:1-37      [000] .N..   489.159638: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281429
>      kworker/0:1-37      [000] .N..   489.159639: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281430
>      kworker/0:1-37      [000] .N..   489.159640: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281431
>      kworker/0:1-37      [000] .N..   489.159641: rtc_timer_do_work:
> timerqueue_getnext handle timer node count: 13281432
> 
> 
>    swapper/0-1       [001] .N..    11.579334: __rtc_read_time: rtc:
> 0xff11000109896800, ops->read_time:2026:01:05:09:36:21
>        swapper/0-1       [001] .N..    11.579421: __rtc_read_time: rtc:
> 0xff11000109896800, ops->read_time:2026:01:05:09:36:21
>        swapper/0-1       [001] .N..    11.579469: __rtc_read_time: rtc:
> 0xff11000109896800, ops->read_time:2026:01:05:09:36:21
>        swapper/0-1       [001] .N..    11.580816: __rtc_read_time: rtc:
> 0xff11000109896800, ops->read_time:2026:01:05:09:36:21
>   syz-executor.5-7492    [003] ....   129.807406: __rtc_read_time: rtc:
> 0xff11000109896800, ops->read_time:2033:05:04:07:03:51
>   syz-executor.5-7492    [003] ....   129.807419:
> __rtc_update_irq_enable.part.8: rtc uie on: 0xff11000109896800, now:
> 2033:05:04:07:03:51, expire: 2033:05:04:07:03:52
> 
> 
> Best regards,
> Jinjie
> 
> > 
> > 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-rtc+bounces-6658-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QznTEssYMGrnNQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6658-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:22:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA06879D6
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:22:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=sntga+n2;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6658-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6658-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCCBE300EDB4
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BA7402B82;
	Mon, 15 Jun 2026 15:22:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935BC3FBB56
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:22:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536959; cv=none; b=dCaCZiE/E75C3eqanp+RyOtXiYQ5doqq/MryaWT+oq0uGuJHbk6m6CoKK2HSAsRutC8WoIXbdHmCCeWzZ1i7yoXV5f2ciqi9r8fbn/PSk/rJiFM7q/KzAVnILbUZhD++nMgRYTISy+dGtScsgBp7ae9sfBkJ5SJFQhIvuxj4zZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536959; c=relaxed/simple;
	bh=U2f1bB8a7iTlnZJLXkUE/1QPgJoLJoa3qlY88BOiQKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQqVtbBbXSIA9YLyFAX3rCUK08XQ3ilOTjpcQinKNqvcwuOo8NSkxnjuhjxazMTkzfSRypeRzPwVJU3qhlbp13NRDKB7cKTjwE41xm42kmjm5eB5MnI1Kk2u8X90nzYX+vSy4QB4AGAEjrdImn3hgY/5lJ6AjGLuOcwX9VAFp5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sntga+n2; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 174F64E42F00
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:22:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3DAD60015;
	Mon, 15 Jun 2026 15:22:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85750106C96DF;
	Mon, 15 Jun 2026 17:22:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781536953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=nxGYt1Gi8/nzODJGUg0vDDaiLV6kqx32enra652qxS4=;
	b=sntga+n2noRa/OBaj2xKSH7yF9yUPvEnWG6OpjMHr5iYsWOboNPx2nNN11zkiZ2K7F/1Gl
	Lxn6KSJa9Nqo8ky40svh0urjforUZi9gBVuT7mrMTWmQuCB/brwg9/GY8X6ocNRqStyGEb
	Pc1mF9hvPLP1EILeYK17kVCAMvwqX1841R62qWRSRrJJtMo9BHVgkDbFKShXWHeprqJj42
	8gl6G1UHQCoo6MWXl58xZSDtWYIXalQd252kaF6zsO02mNFaq80y/lukrXTcRZK9DDDVgw
	sXv5Wn/CkRtaiAZxGcKjcZpA0SxNvXgfOuvfRirkeN+ibOTNQgNQNQjWcSF23w==
Date: Mon, 15 Jun 2026 17:22:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: interface: Add rtc time jump debug in
 rtc_timer_do_work()
Message-ID: <2026061515223171f111f5@mail.local>
References: <20260525130825.954214-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525130825.954214-1-ruanjinjie@huawei.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6658-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6DA06879D6

Hello,

On 25/05/2026 21:08:25+0800, Jinjie Ruan wrote:
> In virtualization environments like QEMU [1], or during hardware
> clocksource anomalies, an extreme time-warp event can occur. When
> the system time abruptly jumps forward, the rtc_timer_do_work() handler
> falls into a prolonged processing loop to clear accumulated historical
> timers via timerqueue_getnext(). Running this loop indefinitely under
> the rtc->ops_lock mutex triggers a kernel softlockup, stalling
> the system.
> 
> Introduce an adaptive telemetry and loop guard mechanism to enhance debug
> visibility and prevent softlockups:
> 
> 1. Record `start_jiffies` upon entry and leverage `time_after()` to
>    check if the loop has monopolized the CPU for more than 1s (HZ). If so,
>    the handler prints a telemetry warning, triggers a WARN stack dump, and
>    breaks the loop to safely yield the CPU.
> 
> 2. Track the execution via a `loop_count` metric. Printing this counter
>    in the warning log provides vital diagnostics to distinguish
>    an aggressive time-warp storm (high count) from a bogged-down callback
>    bug (low count).
> 
> 3. Utilize the kernel format specifier `%ptR` to convert the raw ktime
>    into a human-readable timestamp (YYYY-MM-DD HH:MM:SS), allowing
>    developers to instantly pinpoint the exact boundary of the time
>    jump in dmesg.
> 
> This non-destructive telemetry guard provides precise hardware/emulator
> diagnostic visibility while ensuring core kernel availability.
> 
> [1]: https://lore.kernel.org/all/20260114013257.3500578-1-ruanjinjie@huawei.com/
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/rtc/interface.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index 1906f4884a83..f6c5fd16cc4e 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -927,10 +927,12 @@ static void rtc_timer_remove(struct rtc_device *rtc, struct rtc_timer *timer)
>   */
>  void rtc_timer_do_work(struct work_struct *work)
>  {
> -	struct rtc_timer *timer;
> +	unsigned long start_jiffies = jiffies;
>  	struct timerqueue_node *next;
> -	ktime_t now;
> +	struct rtc_timer *timer;
>  	struct rtc_time tm;
> +	int loop_count = 0;
> +	ktime_t now;
>  	int err;
>  
>  	struct rtc_device *rtc =
> @@ -945,6 +947,15 @@ void rtc_timer_do_work(struct work_struct *work)
>  	}
>  	now = rtc_tm_to_ktime(tm);
>  	while ((next = timerqueue_getnext(&rtc->timerqueue))) {
> +		loop_count++;
> +
> +		if (unlikely(time_after(jiffies, start_jiffies + HZ))) {
> +			dev_warn(&rtc->dev, "RTC time jump (loop: %d) to %ptR.\n",
> +				 loop_count, &tm);
> +			WARN_ON_ONCE(1);

So, your issue is that it is too slow so you make it even slower? There
are already plenty of tracepoints that allow proper debugging in this
loop, I'm pretty sure we don't want to bloat the kernel with more
messages.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-rtc+bounces-3856-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C079AA83030
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 21:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32A78164A87
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 19:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42A1278152;
	Wed,  9 Apr 2025 19:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AmWc/8xB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4D827781A;
	Wed,  9 Apr 2025 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226023; cv=none; b=bvfaeoGFGj7H7jmDh2BZC4GW1QcqR3/J605WYGRJcxXsQ/hzJspstEC7742l6YM02fiC90FBjjQfJtYFtxnLaOxR3P3EccKNLptnrRGfXb0Rqs0Wi38oFItUCZKkpBZX0Doo8Rjd0SF9sCz6Da49OH7kLjq2BSiin+Vw+E/WCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226023; c=relaxed/simple;
	bh=bII1RpD7ypSXY5zMoPYZb6959z8htAPPjAzhqYdTo/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llPXJMuSk4WRbQwlHTb69KBzHOFXX5mAJIDw6cGA6mVeYlLEwVJlweNdKQpjMacEq3cgLC4HX/E8NJZ/I3fqhLhV8ZxLSX7qOtG4zKCqeVr1nDmD63FdX/W3OKU6xJjgz6riChnk533jNW0CxamNTE4i5sxu/r2kD13tL1cRQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AmWc/8xB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pBCktiJTF9ueOit2Y8l4DE7XAAKAGJ58t0d/eWAXUGM=; b=AmWc/8xBAGnnECdlqIW9iVhNNM
	HeNPscZWzE1EH0e6+sdXsLXkKwXxcQlliua6O4B+8tbEosd8zRtgPABxpACWabsRlL2AhVumY8k3v
	VGaeXfuz5yLvKlJ7VqRPPvMNwn6Q1PwxlR3p7RxF8AgnAYQ4uhGkqRdpg2bdlN8vF0slGcH5ywvAq
	ylezD+WnpXoXR7cEPeqPrqA4gkvkLcM7hEpu9FumuAev3/XgHy7D13E5p7yBC5qIkzclgJ0CWpYDK
	lbjNiXcY9QlFH3G+rQ3Q7Pze68dz4Ohu/Wntrdh333DnnTr/5MU505oanGJcByd0jq9FZ0qqmVuSo
	j/GMKxpw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2arc-00000008fgp-3V4J;
	Wed, 09 Apr 2025 19:13:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 67ACF3003FF; Wed,  9 Apr 2025 21:13:32 +0200 (CEST)
Date: Wed, 9 Apr 2025 21:13:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: Re: [PATCH] timekeeping: Add a lockdep override in tick_freeze().
Message-ID: <20250409191332.GR9833@noisy.programming.kicks-ass.net>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx>
 <20250403135031.giGKVTEO@linutronix.de>
 <20250403193659.hhUTgJLH@linutronix.de>
 <87r029uh3j.ffs@tglx>
 <20250404133429.pnAzf-eF@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404133429.pnAzf-eF@linutronix.de>

On Fri, Apr 04, 2025 at 03:34:29PM +0200, Sebastian Andrzej Siewior wrote:
> tick_freeze() acquires a raw_spinlock_t (tick_freeze_lock). Later in the
> callchain (timekeeping_suspend() -> mc146818_avoid_UIP()) the RTC driver
> can acquire a spinlock_t which becomes a sleeping lock on PREEMPT_RT.
> Lockdep complains about this lock nesting.
> 
> Add a lockdep override for this special case and a comment explaining
> why it is okay.
> 
> Reported-by: Borislav Petkov <bp@alien8.de>
> Closes: https://lore.kernel.org/all/20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local/
> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Closes: https://lore.kernel.org/all/CAP-bSRZ0CWyZZsMtx046YV8L28LhY0fson2g4EqcwRAVN1Jk+Q@mail.gmail.com/
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

This is of course horrible :-) But yes, probably the best one can do
given how things are.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  kernel/time/tick-common.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> index a47bcf71defcf..8fd8e2ee09fa1 100644
> --- a/kernel/time/tick-common.c
> +++ b/kernel/time/tick-common.c
> @@ -509,6 +509,7 @@ void tick_resume(void)
>  
>  #ifdef CONFIG_SUSPEND
>  static DEFINE_RAW_SPINLOCK(tick_freeze_lock);
> +static DEFINE_WAIT_OVERRIDE_MAP(tick_freeze_map, LD_WAIT_SLEEP);
>  static unsigned int tick_freeze_depth;
>  
>  /**
> @@ -528,9 +529,20 @@ void tick_freeze(void)
>  	if (tick_freeze_depth == num_online_cpus()) {
>  		trace_suspend_resume(TPS("timekeeping_freeze"),
>  				     smp_processor_id(), true);
> +		/*
> +		 * All other CPUs have their interrupts disabled and are
> +		 * suspended to idle. Other tasks have been frozen so there is
> +		 * no scheduling happening. This means that there is no
> +		 * concurrency in the system at this point. Therefore it is okay
> +		 * to acquire a sleeping lock on PREEMPT_RT, such as spinlock_t,
> +		 * because the lock can not be acquired and can not block.
> +		 * Inform lockdep about the situation.
> +		 */
> +		lock_map_acquire_try(&tick_freeze_map);
>  		system_state = SYSTEM_SUSPEND;
>  		sched_clock_suspend();
>  		timekeeping_suspend();
> +		lock_map_release(&tick_freeze_map);
>  	} else {
>  		tick_suspend_local();
>  	}
> @@ -552,8 +564,16 @@ void tick_unfreeze(void)
>  	raw_spin_lock(&tick_freeze_lock);
>  
>  	if (tick_freeze_depth == num_online_cpus()) {
> +		/*
> +		 * Similar to tick_freeze(). On resumption the first CPU may
> +		 * acquire uncontended sleeping locks while other CPUs block on
> +		 * tick_freeze_lock.
> +		 */
> +		lock_map_acquire_try(&tick_freeze_map);
>  		timekeeping_resume();
>  		sched_clock_resume();
> +		lock_map_release(&tick_freeze_map);
> +
>  		system_state = SYSTEM_RUNNING;
>  		trace_suspend_resume(TPS("timekeeping_freeze"),
>  				     smp_processor_id(), false);
> -- 
> 2.49.0
> 


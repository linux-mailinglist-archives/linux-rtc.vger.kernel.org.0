Return-Path: <linux-rtc+bounces-3788-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3167A7BDEC
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 15:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C2D93B94F3
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FD21EF088;
	Fri,  4 Apr 2025 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SiCELOOP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MZVEOIc3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896A618D65F;
	Fri,  4 Apr 2025 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773675; cv=none; b=W/TlcIez2boUWZGoObOnNOIATnvecQS/y1I2KNL7KzHMiH34TDVXY1jU44bvINjPctivMCOXR6uGMCo6Wb8QQkT7pYvQqOWOykpidMuUCqU6mJ+N1URTDC1wkKdz9gSz4plPu1vpePIRTZt0K1OEW3JsI5xpb4u6pVvJWQuT0OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773675; c=relaxed/simple;
	bh=ztTIVrLXRLhv3irvEroVpxQyjNKnySai3btoYBkcTAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcLdCKRHe1cLCBd6At863KHuCWgjO+1eADyF4HGyqisZdLwsVVag2phXxP/6iCYMaFVVL9TqTg555PUQTAi8y3lpCfcDZajoGB06X9hy9iYHp1J7yxdfw3DE8oRbFNliJwoMretp48123G6LRduutU6X4MN+BxeTbnABYfpLL8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SiCELOOP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MZVEOIc3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 4 Apr 2025 15:34:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743773671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7XSOzK8avOwU9ReeIGcsZooY7igMM/lTAPH1PhhFsfY=;
	b=SiCELOOP9CgN6VpkO0wk4cl+UxQYTcniMR1VPd4RWEMwfvXUQBDf0UAwthtMGtLAsRyXq5
	uKaaQscw9EoO3e5J8oClgV6tzt2SnazZlvdymrXOO5dlePBhtdfdg57B+ue5NeYb+avTIn
	Twlj8/tB3QyDmvLcuit3WTW/Zz15FNhxI6ytMSUvzwdKiHXRgDbVufDZemQ/v0RGSklxXE
	gmwI2T9Tw0oDx9J7+2dsztJVOoQqlML1U9XzYpWjoWsVkYreCL6xmEWqZm+GC5MEAYv2wi
	xqXs1VJL34qwHtLRvK1L0oLxGmPOILnV9rMJYmr2tiySko+yqZMSm16+rFUXzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743773671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7XSOzK8avOwU9ReeIGcsZooY7igMM/lTAPH1PhhFsfY=;
	b=MZVEOIc3g61xAdjQoavnhFY8X3Qhy1fH9hmtv8DMCQAzq4I5hAD6LtMmQBAiSmgTb4scRT
	Ew3d1Exh1xOaifCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: [PATCH] timekeeping: Add a lockdep override in tick_freeze().
Message-ID: <20250404133429.pnAzf-eF@linutronix.de>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx>
 <20250403135031.giGKVTEO@linutronix.de>
 <20250403193659.hhUTgJLH@linutronix.de>
 <87r029uh3j.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87r029uh3j.ffs@tglx>

tick_freeze() acquires a raw_spinlock_t (tick_freeze_lock). Later in the
callchain (timekeeping_suspend() -> mc146818_avoid_UIP()) the RTC driver
can acquire a spinlock_t which becomes a sleeping lock on PREEMPT_RT.
Lockdep complains about this lock nesting.

Add a lockdep override for this special case and a comment explaining
why it is okay.

Reported-by: Borislav Petkov <bp@alien8.de>
Closes: https://lore.kernel.org/all/20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local/
Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Closes: https://lore.kernel.org/all/CAP-bSRZ0CWyZZsMtx046YV8L28LhY0fson2g4EqcwRAVN1Jk+Q@mail.gmail.com/
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/time/tick-common.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
index a47bcf71defcf..8fd8e2ee09fa1 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -509,6 +509,7 @@ void tick_resume(void)
 
 #ifdef CONFIG_SUSPEND
 static DEFINE_RAW_SPINLOCK(tick_freeze_lock);
+static DEFINE_WAIT_OVERRIDE_MAP(tick_freeze_map, LD_WAIT_SLEEP);
 static unsigned int tick_freeze_depth;
 
 /**
@@ -528,9 +529,20 @@ void tick_freeze(void)
 	if (tick_freeze_depth == num_online_cpus()) {
 		trace_suspend_resume(TPS("timekeeping_freeze"),
 				     smp_processor_id(), true);
+		/*
+		 * All other CPUs have their interrupts disabled and are
+		 * suspended to idle. Other tasks have been frozen so there is
+		 * no scheduling happening. This means that there is no
+		 * concurrency in the system at this point. Therefore it is okay
+		 * to acquire a sleeping lock on PREEMPT_RT, such as spinlock_t,
+		 * because the lock can not be acquired and can not block.
+		 * Inform lockdep about the situation.
+		 */
+		lock_map_acquire_try(&tick_freeze_map);
 		system_state = SYSTEM_SUSPEND;
 		sched_clock_suspend();
 		timekeeping_suspend();
+		lock_map_release(&tick_freeze_map);
 	} else {
 		tick_suspend_local();
 	}
@@ -552,8 +564,16 @@ void tick_unfreeze(void)
 	raw_spin_lock(&tick_freeze_lock);
 
 	if (tick_freeze_depth == num_online_cpus()) {
+		/*
+		 * Similar to tick_freeze(). On resumption the first CPU may
+		 * acquire uncontended sleeping locks while other CPUs block on
+		 * tick_freeze_lock.
+		 */
+		lock_map_acquire_try(&tick_freeze_map);
 		timekeeping_resume();
 		sched_clock_resume();
+		lock_map_release(&tick_freeze_map);
+
 		system_state = SYSTEM_RUNNING;
 		trace_suspend_resume(TPS("timekeeping_freeze"),
 				     smp_processor_id(), false);
-- 
2.49.0



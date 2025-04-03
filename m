Return-Path: <linux-rtc+bounces-3766-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1555A7A453
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 15:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0823AC333
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 13:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E007C24DFF6;
	Thu,  3 Apr 2025 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a3jnh+b9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6AaDrZr+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BBB24C08D;
	Thu,  3 Apr 2025 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688235; cv=none; b=aQ04SH7VwFaMXUXuQfAuFAvOU0JtvxGs/83Q7BX+AVJ2DpqB4Tv6IZp2KuNXPIcAuZ8Iyzgoz13W4VxJMND/RzvdQjBOuVq9vMxj0jTHnRNyivvCetaElbgDi3bt4bkrrELW+NjR8nIQC0OAkdalsVW/BMuUgdDfzhxlj3DPHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688235; c=relaxed/simple;
	bh=Gcptn4zrh9L38cLYTQcWVT7DNxrzdPy+X9aTv/u0Kb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbx5l73a8sB3vVOD7y9Qt+LTRsxfY1afuIGtJgqV+hm3MyZT+vVRzwmf+rwPg0kk42nTh2l4rWUQKislFbW57bbw+fy0HkyKK+r5RTrrKsHksjah5651X9Gkj66vXv/rQ1xr0EsTZ0qN9ISEiJ2FvRvM8QIuHvv1DvHOeuenN/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a3jnh+b9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6AaDrZr+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 3 Apr 2025 15:50:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743688232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGAAC3uk9NMoi2172cPUUUlkrcEUwohz8LdYAstOFdY=;
	b=a3jnh+b9aokO3yIQi/gautXLqCvyX/H+X82FhB6LQM/ai8+PCU1oWdaUjiwB3M7N4GQM/5
	++1C167sjeapSn6AVJdjgx86aJuRwTe347mtBZQ5QSyx3y4TH5xuZMUnc+81m4ixIljH2a
	K337tx/N6e2krMJTJj1u+6bpR782vgOZETJl1tM/2oc8NbZdU1TlfB4N5h+BU432Y/NAOc
	/xpNjcnT+1a2H11UNJDvlRwoe9hhPWKqjEq+dLVpalMGv8hYlKJY336620F3J6SBGL2Aza
	eQ0x2DeUxsj2haIS9gcoBu+Yo5tM0hg+57Bt2AKprpcfWPGttVl1pBPYQRCFuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743688232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGAAC3uk9NMoi2172cPUUUlkrcEUwohz8LdYAstOFdY=;
	b=6AaDrZr+kPS/vNAu7u2Ann1iY7IDmsGumN2AKO+bE7sqxNYMKbYqUMzgSpiqVKEcJJfOa+
	SJgt2+1EW67GesDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [ BUG: Invalid wait context ] rtc_lock at: mc146818_avoid_UIP
Message-ID: <20250403135031.giGKVTEO@linutronix.de>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sempv17b.ffs@tglx>

On 2025-04-03 15:12:08 [+0200], Thomas Gleixner wrote:
> Converting it to a raw lock "fixes" the problem, but RT people will hunt
> you down with a big latency bat.
> 
> But this is not related to the commit above and not new.
> 
> timekeeping_suspend() has always invoked mach_get_cmos_time() with the
> freeze lock held and mc146818_get_time() has always locked rtc_lock.
> 
> I wonder, why this splat hasn't popped before. On RT lockdep should have
> complained forever. Sebastian???

I sure haven't seen it. But it has to.

> Suspend, whether it's suspend to idle or regular suspend, are weird
> contexts as there is no concurrency possible because interrupts are
> disabled and it is guaranteed that there is only a single CPU which is
> operational. The other CPUs are either in a deep idle state or when they
> are on the way back, they serialize on tick_freeze_lock.
> 
> So taking the non-raw spinlock in that context is safe, but obviously
> lockdep does not know about that.
> 
> Peter, any ideas?

We can tell lockdep that. I will look into this.

> Thanks,
> 
>         tglx

Sebastian


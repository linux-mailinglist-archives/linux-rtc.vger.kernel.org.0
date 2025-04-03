Return-Path: <linux-rtc+bounces-3765-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C99A7A372
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 15:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE74E7A2762
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 13:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2CF24E00E;
	Thu,  3 Apr 2025 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1D6j+Owd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JsEoLJQO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9CE24E004;
	Thu,  3 Apr 2025 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685932; cv=none; b=c+bS8li0ULly5K498/L/tGpReBmY4s0IVGP4ck8WSTJQQwoAc7jsy3NrTJDO3k+xqe60GA9/4aBNUDNOGce6tqx2UJp1GbYIGMemBTY0SS8EkbFTx5Uqw1hBaNz8mrDsJvToUpqf5EDIPtLJno3MphxH/+Dlwgn1YAHigvHt/Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685932; c=relaxed/simple;
	bh=68eT5LFtYjR80kl/OXpnYUQP9j6p61G/kRITiCMz+uY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tFLjWevzQ6UMMwTWD85XwoNZiY8ysXZ3MCsP6e6552SV+E5xRUssPfBJwL4IOKDdHvSINUhNOPt4oMDoepawqcSEzyXFqKWotk9L2gJLfEClu0u2O9JiInKq4mHFoQnMUJjfOl5RVGPhZoPZ7Vv7mu9dWbb2/92wcWVIqQwkXmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1D6j+Owd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JsEoLJQO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743685929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BGM2VtH2E6Yrxa5EvGkRBtgjSnOzJTp+6mrqQoO8oUA=;
	b=1D6j+Owdkds/8uorowOlNv/WxxcJyecQqVmca5mbsAqicNFQyBv90UQaN5M/RBpFA2RKR2
	7S1LdVtUmIvn4UuLBrYVswgLYRWIKZSeyt2mhQv+LjfcQg7ErYRYHsjwO5CtRh5lfuEL8F
	roPwjLXwqSFcGf6O9SQaZm3puo0yjE90J3UfLGNBssHdrwnHDZeR3O+d82MKYqJXjQtGRh
	XEZW5TpT3fzdw7rS2+1J3SgJueXUpn2i3Lc+3F7zaKoJFWxrmWMmAitIq+bnoISTlafOwh
	oAqAoF/DchqtDjwMLThagRSQ6lG89Gb2BNLIAFzY9mnj4RDZM/ejHFq6F80flw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743685929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BGM2VtH2E6Yrxa5EvGkRBtgjSnOzJTp+6mrqQoO8oUA=;
	b=JsEoLJQOxoxaaNBuDNSpEJ/2xitFgnLwraZL2sFPEAHoAI95HNxPdd9jcGFwFvG/4cnQZP
	QbebiH3uipOgHhAg==
To: Borislav Petkov <bp@alien8.de>, linux-rtc@vger.kernel.org, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Mateusz =?utf-8?Q?Jo=C5=84czyk?=
 <mat.jonczyk@o2.pl>
Cc: lkml <linux-kernel@vger.kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [ BUG: Invalid wait context ] rtc_lock at: mc146818_avoid_UIP
In-Reply-To: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
Date: Thu, 03 Apr 2025 15:12:08 +0200
Message-ID: <87sempv17b.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Mar 30 2025 at 13:32, Borislav Petkov wrote:
> while playing with suspend to RAM, I got this lockdep splat below.
>
> Poking around I found:
>
> ec5895c0f2d8 ("rtc: mc146818-lib: extract mc146818_avoid_UIP")
>
> which is doing this funky taking and dropping the rtc_lock and I guess that's
> inherited from ye olde times.
>
> I "fixed" it so lockdeup doesn't warn by converting rtc_lock to a raw spinlock
> but this is definitely not the right fix so let me bounce it off to the folks
> on Cc who might have a better idea perhaps...

Converting it to a raw lock "fixes" the problem, but RT people will hunt
you down with a big latency bat.

But this is not related to the commit above and not new.

timekeeping_suspend() has always invoked mach_get_cmos_time() with the
freeze lock held and mc146818_get_time() has always locked rtc_lock.

I wonder, why this splat hasn't popped before. On RT lockdep should have
complained forever. Sebastian???

Suspend, whether it's suspend to idle or regular suspend, are weird
contexts as there is no concurrency possible because interrupts are
disabled and it is guaranteed that there is only a single CPU which is
operational. The other CPUs are either in a deep idle state or when they
are on the way back, they serialize on tick_freeze_lock.

So taking the non-raw spinlock in that context is safe, but obviously
lockdep does not know about that.

Peter, any ideas?

Thanks,

        tglx


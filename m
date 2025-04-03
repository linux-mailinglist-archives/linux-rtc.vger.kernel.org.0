Return-Path: <linux-rtc+bounces-3767-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6EA7AFC5
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 23:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 484BA17D2BF
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 20:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9810C257AEC;
	Thu,  3 Apr 2025 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VjQaj7pm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J7Yhczbb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7B5253F31;
	Thu,  3 Apr 2025 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709024; cv=none; b=oCseCmhD7pKLpTpAf08pD8qkXazJGjcIdFqaCVDETBZM8uYSqlq6rF4PmCorpov7hPNnhuFfIzkC3uAUCOxMe7RiGhgiWeAXOSibWppP1u7H2+CUdtVPovMg84EcIGxcxXQIPzAh9tAsmcLVYfXH7sXHkAT6j6owPKcYymDftAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709024; c=relaxed/simple;
	bh=lVWZUHL2SxA42sAAgfdxWslhV3zimniyg1+cO9INlL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekhOs6mqLJb3vppnLqQzMnrwSVsXS+yjDn7Zyi4FL/WCLXu2mdG85tFwbZwFtEp3KhV6YFRTUXNR+WKKW73qrFxSZAInOO1Hhk5s/eSyhTQwJADPFegXqE2TpInv0ZdyJFoZH+V8oAuySHGfTYG0RsagTeeZXm0jjQ3jG3p2Rv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VjQaj7pm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J7Yhczbb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 3 Apr 2025 21:36:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743709020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLJILlQSwjqq4ldd1DPe8cQpHFfbl0q04etSdbIwIKs=;
	b=VjQaj7pmVy2ExbvdlFCBNAP8NICj+upZ8ERY37p35D9M3SfEqEDHr3BBY88qvLEdNEM19s
	YSCMVr49fF5LrqDSalAPsujoYmdS1PPhCZw41JvFiyKrQPKNWCRGbSpi1PbXQWkc76jAO1
	CAsDOQLth5KM30NmJNONmOOlKDfiIha2wS7F8FBHM11H8RKluRRO+Pw+sFNHkPL2UlfSKm
	aQ5udNnx+m45T1WOXuBw3xOAqMeSNhbA+lsxRIxhcpvb5lLvLRu2ZoQctb2GkzHmmCf8qC
	XxZTXGxYba7Wc53iTSnkxGWhnEAlHO5b20Msq4cSWGf0pOQhxaRSnilEX6JbJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743709020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLJILlQSwjqq4ldd1DPe8cQpHFfbl0q04etSdbIwIKs=;
	b=J7YhczbbvBXIoKGHLAyYyPavKnJMp63bleM0UBWCW4TttxDTYsIFXzSUEeONNhCf4Lsigv
	ujk8Mii5UImDbCBw==
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
Message-ID: <20250403193659.hhUTgJLH@linutronix.de>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx>
 <20250403135031.giGKVTEO@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403135031.giGKVTEO@linutronix.de>

On 2025-04-03 15:50:32 [+0200], To Thomas Gleixner wrote:
> On 2025-04-03 15:12:08 [+0200], Thomas Gleixner wrote:
> > Converting it to a raw lock "fixes" the problem, but RT people will hunt
> > you down with a big latency bat.
> > 
> > But this is not related to the commit above and not new.
> > 
> > timekeeping_suspend() has always invoked mach_get_cmos_time() with the
> > freeze lock held and mc146818_get_time() has always locked rtc_lock.
> > 
> > I wonder, why this splat hasn't popped before. On RT lockdep should have
> > complained forever. Sebastian???
> 
> I sure haven't seen it. But it has to.

might_sleep() is quite because system_states is SYSTEM_SUSPEND.
lockdep seems to be quiet because I don't have an outer lock while
testing via
	echo mem > /sys/power/state

it is just
| WARNING: CPU: 0 PID: 1007 at kernel/time/timekeeping.c:1858 timekeeping_suspend+0x3b/0x330
| RIP: 0010:timekeeping_suspend+0x3b/0x330
| Call Trace:
|  <TASK>
|  syscore_suspend+0x80/0x2f0
|  suspend_devices_and_enter+0x21c/0xad0
|  pm_suspend+0x25c/0x6b0
|  state_store+0x68/0xd0
|  kernfs_fop_write_iter+0x15e/0x210
|  vfs_write+0x2bb/0x560
|  ksys_write+0x73/0xf0
|  do_syscall_64+0x91/0x1a0

> > Thanks,
> > 
> >         tglx

Sebastian


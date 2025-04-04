Return-Path: <linux-rtc+bounces-3776-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D322CA7B84D
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 09:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 761A8175FE0
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 07:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136AB14F9D9;
	Fri,  4 Apr 2025 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UdF6GUp9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GXyjMqXl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCAE2E62B4;
	Fri,  4 Apr 2025 07:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743752406; cv=none; b=goomakyZhCY50AsMaDfYV8ljQ84DDRvCNIR5OoQKxJfgOKIHawy371gP5YIvsKAmEfGJGisWT74uz/qw2/wP6mxVE47sgVX0wO/O3uXzuTB3IQUPiIe4bdlB6SxMd0rYD6IMIg8VXWXJ2n9N/BPH15jnFINkOOTpCmImsIEXqWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743752406; c=relaxed/simple;
	bh=6drdEe3M9VDdef2q+vmPdjSjqOrQE+RrN76t57AW6yM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FLlRdAWtB6skW4D/IHxQZ9//zET6zKaXePkKSp3o7SP99RyIxc6sM4zeV941epXEMhSHx2ZGti4OKW5NJYJ18AB959qDTcoSIozhb5+0qmHsdPH0tVz3O0ZzMyO1Gn+J7/zWRn6G9g1E8vib9QsUUGZW28tUl2DzJJWmlJZKEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UdF6GUp9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GXyjMqXl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743752397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1X11/PzVSeN7HiSpNwzIwKuDLDjpXuI6Gm6Ww+BsYAw=;
	b=UdF6GUp9aSxm9naoggbJJ10b++bM9ypDF+o+iH+mCunJcj0FCohvZsLRSJYzJL+vuHQpUs
	R4bHIZSwea0DoIx6qH3jOFPGuoF8UuPD/QNqQNeRXb54ScMZEU91bkcWSJrb88gAOy2mCv
	K8X39bGHcLlXAQllWCwxpzC6fuuIydKSVwKsMbdy1jgq4mm6rAuXwG/NrKuCPbPHFsZUW9
	9s+N0d2NFyX11eGHHanRmeDEiF0wVDGkt3oFQSiqVV4g7oPRLU9LbFXpDoOq+iHMM3Cz3O
	GgLFBFwXDOl4xu+VztQQxzOgt/x9EejPY8JC+6QhSA3wuN01q+VmIPKtzpBgCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743752397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1X11/PzVSeN7HiSpNwzIwKuDLDjpXuI6Gm6Ww+BsYAw=;
	b=GXyjMqXlb3FrTWQmVumfclALxdtBoFmXgUz/Oup68QQOXnZujXj8F/mHQiSOefyeycftea
	IH2IVZDzo3MFy5Ag==
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, Borislav Petkov
 <bp@alien8.de>,
 linux-rtc@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Chris Bainbridge
 <chris.bainbridge@gmail.com>
Subject: Re: [ BUG: Invalid wait context ] rtc_lock at: mc146818_avoid_UIP
In-Reply-To: <8b7dedfc-b97d-4ff8-86af-8c92b3fb37cf@o2.pl>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx> <8b7dedfc-b97d-4ff8-86af-8c92b3fb37cf@o2.pl>
Date: Fri, 04 Apr 2025 09:39:56 +0200
Message-ID: <87jz80v0hf.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04 2025 at 01:46, Mateusz Jo=C5=84czyk wrote:
> W dniu 3.04.2025 o=C2=A015:12, Thomas Gleixner pisze:
>> Converting it to a raw lock "fixes" the problem, but RT people will hunt
>> you down with a big latency bat.
>>
>> But this is not related to the commit above and not new.
>>
>> timekeeping_suspend() has always invoked mach_get_cmos_time() with the
>> freeze lock held and mc146818_get_time() has always locked rtc_lock.
>>
>> I wonder, why this splat hasn't popped before. On RT lockdep should have
>> complained forever. Sebastian???
>
> I was able to trigger the bug on Linux 6.1.0 with
> CONFIG_PROVE_RAW_LOCK_NESTING enabled and I suspect it can be
> triggered much earlier.
>
> It is likely that only after
>
> commit 560af5dc839eef ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE=
_LOCKING.")
>
> people are seeing this simply because no one previously did
> the test with CONFIG_PROVE_RAW_LOCK_NESTING=3Dy.

Well. On RT enabled kernels the raw lock nesting was always enabled. So
I just was curious why this didn't show up earlier. Though RT folks
might not regularly test suspend :)

Thanks,

        tglx


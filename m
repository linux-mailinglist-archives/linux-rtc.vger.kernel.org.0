Return-Path: <linux-rtc+bounces-3768-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5CA7B048
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 23:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E9ED188E2B3
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C4C1F8744;
	Thu,  3 Apr 2025 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4T746O8f";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2yZJzqBr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7011F872F;
	Thu,  3 Apr 2025 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711989; cv=none; b=JyszSPiaB8yiVqilKSLnV/RUaW5J5LkFcd92/l7RZvobPnTJS7ZpTRxuUSulDirKKVGsDUYEoX5NZwwXhIVFMuj5je+zIAyfz5WNCyrt9PbEGrqog+dltRbHCfVk9aIhnwz4gqsdQHhOIq29Vdm2Ps6ZLJw3O8tTNiXRn6aUzbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711989; c=relaxed/simple;
	bh=X90zsBVxTQotD5bo0S8sst8ZuDgvG37bwwzg3+rApEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T+ATkMrUDuk8zhnl6ZgOqpH5xtokPB3aaud2BpwnK3Cuf4T46e5feow8Lb7wnF/A9VHM1lkQWvY+aPWSTR0GjnC5HRn75tWevzdR9Z+3I07B4SkpmoW6F4AiPz61lDXVLN7rDuSH95NJY2e9mIaZDXalXRyI8heQRVjaz+ZEStk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4T746O8f; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2yZJzqBr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743711986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BfR7qDOcHGAIRPQiIfP7f4RQll69wV7Xd6njKQbAdGA=;
	b=4T746O8fcu7OC+Gj3DeEBJCoWIVpDQLOD3tjaDgjnfiugxZvANGVSrCqtBrw6+NACf/bYb
	MCWzFkkH+HjKipSdYN9EXOrHhsjOdC9AJe0ZioELrT22Rag4eNU0rh1RF9CanJO8qdVaQU
	A0zD2Mal7F0oiAod/MuIYCbxyfIlbHhJL19LM6w1LvwFDuvSsoYBuxHnswMdynl601v/Cj
	EiLYCWsPtmEYaHMuKXGVRZsGRwY4hW/voV0d9Nb2ArAaSFwHm2KMDEuANNKF/skfoxtpBI
	SoAfOOWpF1eAetiTQhCCmOww3De0Ti45YnVD+3B5D0DkFAjTFhpxMsfdxFVOrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743711986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BfR7qDOcHGAIRPQiIfP7f4RQll69wV7Xd6njKQbAdGA=;
	b=2yZJzqBr2rsLsN+wMfLkyeN9TTAHZl3sDhYxYEmliySQU+PJBBCL0a2Ih0GWdhmZb+OMWo
	58Y5WYRO7cI8j/Cg==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, linux-rtc@vger.kernel.org, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Mateusz =?utf-8?Q?Jo=C5=84czyk?=
 <mat.jonczyk@o2.pl>, lkml <linux-kernel@vger.kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [ BUG: Invalid wait context ] rtc_lock at: mc146818_avoid_UIP
In-Reply-To: <20250403193659.hhUTgJLH@linutronix.de>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx> <20250403135031.giGKVTEO@linutronix.de>
 <20250403193659.hhUTgJLH@linutronix.de>
Date: Thu, 03 Apr 2025 22:26:24 +0200
Message-ID: <87r029uh3j.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 03 2025 at 21:36, Sebastian Andrzej Siewior wrote:
> On 2025-04-03 15:50:32 [+0200], To Thomas Gleixner wrote:
>> > I wonder, why this splat hasn't popped before. On RT lockdep should have
>> > complained forever. Sebastian???
>> 
>> I sure haven't seen it. But it has to.
>
> might_sleep() is quite because system_states is SYSTEM_SUSPEND.
> lockdep seems to be quiet because I don't have an outer lock while
> testing via
> 	echo mem > /sys/power/state

Right. freeze triggers the suspend to idle path

> it is just
> | WARNING: CPU: 0 PID: 1007 at kernel/time/timekeeping.c:1858 timekeeping_suspend+0x3b/0x330

Which kernel version is that? I don't see a warning in timekeeping_suspend()

Thanks,

        tglx


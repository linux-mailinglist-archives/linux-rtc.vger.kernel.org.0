Return-Path: <linux-rtc+bounces-3703-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D974A759D2
	for <lists+linux-rtc@lfdr.de>; Sun, 30 Mar 2025 13:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F28F97A4815
	for <lists+linux-rtc@lfdr.de>; Sun, 30 Mar 2025 11:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524D513B59B;
	Sun, 30 Mar 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QyNYAcWQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A05954782;
	Sun, 30 Mar 2025 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743334345; cv=none; b=Z0xTTVSMfqQJ+Y8njkoyLBzGF15njC6nkkKSUQZfglSCawpbZSfwU/k1PdXyorf/MFkab9UO3n8js6n4dJySI1VRpAEy9jMWYOoFOPCNkqR1/Le6Byk31i1EU1C3dqp7Zj4/56Klnp06MDx4Q1LT0DVyjNR8DvicuSBsOksgMeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743334345; c=relaxed/simple;
	bh=L89VDzDrxjUhtKlbRVWhy2rTq1h8P2KBxfsXrj4WPM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/Q2SexnGdswKI7Z9bXXWgmms4PnCaJx6NNue4RJg2Jh2ostIY+JlFM5entY2y/7tXTx/gRQeL5yoWR/tPm7W8ca1VppV0jjgejK7oaOsvrU4U5DUqpzbtCozSBsSsA8Xvd5iHQPOMi/LcJCN2qv2Kir7TlZxJ2ZdgYY45lD7DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QyNYAcWQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C6D3640E020E;
	Sun, 30 Mar 2025 11:32:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 64dYyB4S8r8Q; Sun, 30 Mar 2025 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743334336; bh=zzWAbLzjfGn0pgAQKhEY2KweSGBfucXGWiRU7SLAA0E=;
	h=Date:From:To:Cc:Subject:From;
	b=QyNYAcWQQ4zEdVJcijr+GMLuXimxE4X6SzYsgpW+0mmePO8fnGfnLete+aXQj7tQ4
	 gfPsK+QHk/4g5En3ac4BpUv9yuzoSnB2DWZKmjYTVUx8CnyO6kgoGV8snogqvLU7WD
	 ISgmVEJcmXpOjnEVhOO3y4xyMzwfWB0JY3h+TqNxsHvDPTidxTLzexWd1aHx4pI1QT
	 Z3u+yRtEzilwZRbbApEAPPhWrIi1Qwgog6DxkDFm7J7IGJ1uNaYEyCC+7X6p8n9mYq
	 ZfsQtl27cLlgbpUbjOaYwwIUJ9JUxHU6YPrNX/adICudIkPRdasMDwiLMr2WCUZv/U
	 BqCqJIQfrYLBN7RexQez8JfucWalamR801bADa+FT5xxShdY9ZQJmVWTEyg9n0uk/B
	 AtMZF5MFgtNlT0iVNPEGpC1xkpwr97I/crasF5qHnr47Ow52zBmyNBPKhkeEDmg0xc
	 Cr3SEBHibASIMI4uupGZJmSKyKyET23s2a6cj5YvGjoUJqw9mwPoacqwThRL6seky1
	 0Vfd/xaN2/03KAqXBVFJCMO11jI7e3zGaZRKWhiZixkzR3jB6yw4tPvdpWAbh3jEu9
	 p/00ScY9xZtknVxTMzcNTDlTvM34WtCayzSNbY5ze24LQgsotiuygCGS9uKnczMfgA
	 OJQerB4ndYWr10vuIpu7SQqk=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E579240E016E;
	Sun, 30 Mar 2025 11:32:08 +0000 (UTC)
Date: Sun, 30 Mar 2025 13:32:02 +0200
From: Borislav Petkov <bp@alien8.de>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [ BUG: Invalid wait context ] rtc_lock at: mc146818_avoid_UIP
Message-ID: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

So,

while playing with suspend to RAM, I got this lockdep splat below.

Poking around I found:

ec5895c0f2d8 ("rtc: mc146818-lib: extract mc146818_avoid_UIP")

which is doing this funky taking and dropping the rtc_lock and I guess that's
inherited from ye olde times.

I "fixed" it so lockdeup doesn't warn by converting rtc_lock to a raw spinlock
but this is definitely not the right fix so let me bounce it off to the folks
on Cc who might have a better idea perhaps...

Thx.

[   95.916425] 
[   95.917942] =============================
[   95.921970] [ BUG: Invalid wait context ]
[   95.925993] 6.14.0-rc7+ #1 Not tainted
[   95.929762] -----------------------------
[   95.933784] swapper/7/0 is trying to lock:
[   95.937898] ffffffff8284ad18 (rtc_lock){....}-{3:3}, at: mc146818_avoid_UIP+0x36/0x120
[   95.945854] other info that might help us debug this:
[   95.950925] context-{5:5}
[   95.953559] 1 lock held by swapper/7/0:
[   95.957409]  #0: ffffffff8299d2f8 (tick_freeze_lock){....}-{2:2}, at: tick_freeze+0x12/0x110
[   95.965884] stack backtrace:
[   95.968779] CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Not tainted 6.14.0-rc7+ #1 PREEMPT(voluntary) 
[   95.968785] Hardware name: Supermicro Super Server/H12SSL-i, BIOS 2.5 09/08/2022
[   95.968787] Call Trace:
[   95.968790]  <TASK>
[   95.968793]  dump_stack_lvl+0x68/0x90
[   95.968802]  __lock_acquire+0xe96/0x2210
[   95.968811]  ? srso_alias_return_thunk+0x5/0xfbef5
[   95.968816]  ? __lock_acquire+0x45d/0x2210
[   95.968825]  lock_acquire+0xd8/0x300
[   95.968829]  ? mc146818_avoid_UIP+0x36/0x120
[   95.968836]  ? lock_acquire+0xd8/0x300
[   95.968842]  ? srso_alias_return_thunk+0x5/0xfbef5
[   95.968850]  ? __pfx_mc146818_get_time_callback+0x10/0x10
[   95.968854]  _raw_spin_lock_irqsave+0x47/0x70
[   95.968860]  ? mc146818_avoid_UIP+0x36/0x120
[   95.968865]  mc146818_avoid_UIP+0x36/0x120
[   95.968874]  mc146818_get_time+0x39/0x110
[   95.968883]  mach_get_cmos_time+0x2d/0x70
[   95.968890]  ? srso_alias_return_thunk+0x5/0xfbef5
[   95.968894]  ? find_held_lock+0x2b/0x80
[   95.968900]  ? ktime_get+0x1a/0xe0
[   95.968908]  timekeeping_suspend+0x28/0x420
[   95.968918]  tick_freeze+0x7e/0x110
[   95.968923]  enter_s2idle_proper+0x21/0x120
[   95.968930]  cpuidle_enter_s2idle+0x65/0x90
[   95.968937]  do_idle+0x237/0x260
[   95.968947]  cpu_startup_entry+0x25/0x30
[   95.968952]  start_secondary+0x11c/0x140
[   95.968960]  common_startup_64+0x13e/0x141
[   95.968980]  </TASK>



-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


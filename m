Return-Path: <linux-rtc+bounces-4207-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA8AC9C42
	for <lists+linux-rtc@lfdr.de>; Sat, 31 May 2025 20:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04BEB9E069D
	for <lists+linux-rtc@lfdr.de>; Sat, 31 May 2025 18:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18D5199FD0;
	Sat, 31 May 2025 18:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMxIR4yn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A88F40;
	Sat, 31 May 2025 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716029; cv=none; b=AlHP5rlOZvSBdpw/9slfie7pmbOS7nPodFCP/wjigg730GrOUwJZPYp3XYiCaAjKidc5XxOuJlAE2F5Ns+D7zjSyd4XQDVA8G9X7cvXKfgDrr6eRzRDx4g2vqTG+ahNo9XxuGRmoyb+sqOsln0kJLlgu3uInjYeLsEG0myAgozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716029; c=relaxed/simple;
	bh=ZOeDWXgXrHFqlu9o3PxRq5KOYpnvjmgKckvdPePoi6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhXwwCpkbqShVyYF4i/2xMrcLItec8p+ASpfX4aZHycQvZTZTs20MtcKz8EKy5pl43x5L6V8QuG1nFRSf64c13RucDoo8CsKu8jI/xOKebAhhGEKUlgQBGFObxf9qOoi7yjop2SohmdgwoY7Ri5pLL5xGxJzlqLbvmdpn4yW5NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMxIR4yn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d3f72391so3846045e9.3;
        Sat, 31 May 2025 11:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748716026; x=1749320826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=05RESsPmrzkuTqXqpIc5GsOlAsLgZ3bjJiYGP08CxsA=;
        b=nMxIR4ynikYRpQ8gWuAKCCtdryfw90ZDMcgIHPad2MQ29XBxFUvNjJeXA7irRMwYJs
         Z+1alXbXdTnZepgPIn+JYMc/tQYrG3qpuqgU1UtBjNQF9e60Y78bt2SbMZRMN5108ZVK
         oDzYxbyC1B07W5BW49xHjTSakkzovLO3jVBZ5dukQrxgQJ8RXVemywUpuqGZ7IlBwpGT
         Cj7vrUSuUoIdXBCry4xhqcaZC3GonewmTA1XwyP9QkWXFTMVHQnShflWny2nS2i4yNap
         I5srDw8CYoANwYQIhQNdfHQOmdsv+puwrVzRQQYKvR9OZXqaR/Lksng7/MeWQWSkQapF
         GTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716026; x=1749320826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05RESsPmrzkuTqXqpIc5GsOlAsLgZ3bjJiYGP08CxsA=;
        b=kvZBQ6WaK5bhnTuIvuAwMMvXFdXWoagN3FArVMS8mHmgNRFsk9uqRTyrQGNEPcP47r
         Z53SheGb2QRmgkrmR6ROekLtzNq4qHYIw94L8/+g08E48u8JvAFnlimQDkfZjFtlneRP
         hFNbCOkisixSFxCgBENBmvvaStTLjwwaJaJx8VKF54T5GAOOLzchAy47ULgFjvpzspLs
         ToVqsipQAudbSXh96CPwpzn9yiShFd3lzZqlUPPlLesbHr5cQmEcctux1txMbYbRq7vM
         qXoXbeZrTilH8ARb/ZJIB9d7VEr68y7wPLraR3is2mvmKa2gmaEgG65M3b/UE5osEOaS
         8KGg==
X-Forwarded-Encrypted: i=1; AJvYcCUHl0Qwn1HG6NwQMZ64AEOpiMM8yVv6tDw1BirRYit7r3kOVxUO/Dtub3fWvNxkh6Yx0OGTwtoXcgE3DXM=@vger.kernel.org, AJvYcCXd88OZOe5JHfs7vvId7iarKpZARhb3lD+eCqo7L0PLhAhW1u8MB2D1YGRZIv0zG9v1uF8bAg/xIYCl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsx3f4nELjNC7N18rr0pJ5JFRbhQ0RMD/KsiGOJzElPcvRzUq6
	fxo4nxGpA68LNCfYWwGdM1w4M3F4L/Int7Uv9FYx8UjmcYFkf3cKVECD
X-Gm-Gg: ASbGncvrPVHAJ/BjUfqDuntI6Twf4Pu3zl2kCVV11W4p0/yEx2+FEn43j0mYlh5eGUt
	lGgbU7QiSUAQVDevLEaxq2LAL+VcftMFIB87IbK3+R79Ls9c2Wi9aJU1d6h/tRp01bSzuN1/bYG
	LyHxkpBGANSahgZxj+VUwVTuW26QgwmtaPtmtcb6B9zDdxQnjqTP1Ot832qf47/gapY3VXUpNIf
	41YPvZtYEqhWqpjQ7NsVlefQx8J/PCmA7tJKgUEcdPFQIiZbPaqNtt/z7ZZeeqVcnZhOC3CheET
	5qbZDjHi2JiKOsKy6lWrHeEhLZkUmtjY/8wJR9Zp2w2J+C7h/Q0WAbEk++QVFOu2
X-Google-Smtp-Source: AGHT+IG365FuJ1CqHc6DPYx6kl2K6EbX2FXiQrKnyScc7d84ZDsZKPlmAD7FOqJZV/xr8ZHOzEh4Bg==
X-Received: by 2002:a05:600c:608a:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-450d87fd857mr57240395e9.6.1748716025785;
        Sat, 31 May 2025 11:27:05 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:eaf:3101:2d68:caee:7294:3fe1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8edf9sm57146225e9.3.2025.05.31.11.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 11:27:05 -0700 (PDT)
Date: Sat, 31 May 2025 19:27:03 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] timekeeping: Add a lockdep override in tick_freeze().
Message-ID: <aDtJ92foPUYmGheF@debian.local>
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

Hi,

I'm getting "WARNING: inconsistent lock state" on resume with this
commit (92e250c624ea37fde64bfd624fd2556f0d846f18):

[   43.747069] ACPI: \_SB_.PEP_: Successfully transitioned to state screen off
[   43.753611] ACPI: \_SB_.PEP_: Successfully transitioned to state lps0 ms entry
[   43.753777] ACPI: \_SB_.PEP_: Successfully transitioned to state lps0 entry
[   43.838479] amd_pmc AMDI0005:00: failed to set RTC: -22
[   43.838489] PM: suspend-to-idle
[   43.838542] amd_pmc: SMU idlemask s0i3: 0xc00e0eb5
[   46.246882] Timekeeping suspended for 2.528 seconds
[   46.249132] PM: Triggering wakeup from IRQ 9
[   46.249292] ACPI: PM: ACPI fixed event wakeup
[   46.249297] PM: resume from suspend-to-idle
[   46.250801] amd_pmc AMDI0005:00: Last suspend didn't reach deepest state
[   46.251096] ACPI: \_SB_.PEP_: Successfully transitioned to state lps0 exit
[   46.257167] ACPI: \_SB_.PEP_: Successfully transitioned to state lps0 ms exit
[   46.258450] ACPI: \_SB_.PEP_: Successfully transitioned to state screen on
[   46.259652] ACPI: EC: interrupt unblocked
[   46.291758] PM: noirq resume of devices complete after 32.885 msecs

[   46.291907] ================================
[   46.291909] WARNING: inconsistent lock state
[   46.291911] 6.15.0-rc1-00002-g92e250c624ea #379 Not tainted
[   46.291914] --------------------------------
[   46.291915] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
[   46.291917] irq/9-acpi/142 [HC0[0]:SC0[0]:HE1:SE1] takes:
[   46.291921] ffffffff88e48d18 (rtc_lock){?...}-{3:3}, at: cmos_interrupt+0x21/0x110
[   46.291939] {IN-HARDIRQ-W} state was registered at:
[   46.291941]   lock_acquire+0xc9/0x2d0
[   46.291946]   _raw_spin_lock+0x30/0x40
[   46.291951]   cmos_interrupt+0x21/0x110
[   46.291956]   __handle_irq_event_percpu+0x81/0x290
[   46.291962]   handle_irq_event+0x38/0x70
[   46.291966]   handle_edge_irq+0x85/0x210
[   46.291970]   __common_interrupt+0x45/0xd0
[   46.291973]   common_interrupt+0x80/0xa0
[   46.291977]   asm_common_interrupt+0x26/0x40
[   46.291981]   cpuidle_enter_state+0x113/0x540
[   46.291985]   cpuidle_enter+0x2d/0x40
[   46.291989]   do_idle+0x1f5/0x250
[   46.291992]   cpu_startup_entry+0x29/0x30
[   46.291994]   start_secondary+0x10c/0x130
[   46.291998]   common_startup_64+0x13e/0x141
[   46.292002] irq event stamp: 877
[   46.292004] hardirqs last  enabled at (877): [<ffffffff88778a90>] _raw_spin_unlock_irqrestore+0x40/0x50
[   46.292010] hardirqs last disabled at (876): [<ffffffff8877884c>] _raw_spin_lock_irqsave+0x5c/0x60
[   46.292014] softirqs last  enabled at (362): [<ffffffff87b0dc3c>] __irq_exit_rcu+0xcc/0xf0
[   46.292019] softirqs last disabled at (353): [<ffffffff87b0dc3c>] __irq_exit_rcu+0xcc/0xf0
[   46.292022] 
               other info that might help us debug this:
[   46.292024]  Possible unsafe locking scenario:

[   46.292025]        CPU0
[   46.292026]        ----
[   46.292027]   lock(rtc_lock);
[   46.292029]   <Interrupt>
[   46.292030]     lock(rtc_lock);
[   46.292032] 
                *** DEADLOCK ***

[   46.292033] no locks held by irq/9-acpi/142.
[   46.292035] 
               stack backtrace:
[   46.292040] CPU: 1 UID: 0 PID: 142 Comm: irq/9-acpi Not tainted 6.15.0-rc1-00002-g92e250c624ea #379 PREEMPT(voluntary) 
[   46.292046] Hardware name: HP HP Pavilion Aero Laptop 13-be0xxx/8916, BIOS F.17 12/18/2024
[   46.292049] Call Trace:
[   46.292052]  <TASK>
[   46.292058]  dump_stack_lvl+0x6e/0x90
[   46.292063]  print_usage_bug.part.0+0x22c/0x2c0
[   46.292067]  mark_lock+0x6f7/0x890
[   46.292072]  ? __lock_acquire+0x449/0x21c0
[   46.292077]  __lock_acquire+0x7e5/0x21c0
[   46.292080]  ? psi_task_switch+0x10a/0x330
[   46.292086]  lock_acquire+0xc9/0x2d0
[   46.292088]  ? cmos_interrupt+0x21/0x110
[   46.292094]  ? acpi_write_bit_register+0x79/0xf0
[   46.292102]  _raw_spin_lock+0x30/0x40
[   46.292106]  ? cmos_interrupt+0x21/0x110
[   46.292110]  cmos_interrupt+0x21/0x110
[   46.292115]  rtc_handler+0x28/0xc0
[   46.292120]  acpi_ev_fixed_event_detect+0xc8/0x140
[   46.292127]  ? irq_thread+0xa4/0x340
[   46.292129]  acpi_ev_sci_xrupt_handler+0x13/0x40
[   46.292132]  acpi_irq+0x16/0x30
[   46.292136]  irq_thread_fn+0x1d/0x50
[   46.292139]  irq_thread+0x1d5/0x340
[   46.292140]  ? irq_copy_pending.isra.0+0x70/0x70
[   46.292144]  ? irq_finalize_oneshot.part.0+0xc0/0xc0
[   46.292147]  ? irq_forced_thread_fn+0x70/0x70
[   46.292149]  kthread+0x10a/0x250
[   46.292154]  ? kthreads_online_cpu+0x130/0x130
[   46.292158]  ret_from_fork+0x31/0x50
[   46.292162]  ? kthreads_online_cpu+0x130/0x130
[   46.292166]  ret_from_fork_asm+0x11/0x20
[   46.292174]  </TASK>
[   46.292918] PM: early resume of devices complete after 0.829 msecs


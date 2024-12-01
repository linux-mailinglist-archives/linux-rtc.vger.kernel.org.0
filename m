Return-Path: <linux-rtc+bounces-2649-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B39DF68A
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Dec 2024 18:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D27FD160592
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Dec 2024 17:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C1E1D356E;
	Sun,  1 Dec 2024 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCfGq8GY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4DB33086;
	Sun,  1 Dec 2024 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733072748; cv=none; b=YdNxdMEjAA17HQhH1tKOkMGcMK9mopYcp9g4EfxY9EnEWE+mxDjnB3qLClAjeEXEy1k0CyQ046ZtvymOwqPYpZgM9WGmFFkRC273jam6ZqduQc9nZn6e96BoqGHmcKcIt7F//aMcOg2y3SFGqy7roHmfZanJCq/8ETnVy6Bczi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733072748; c=relaxed/simple;
	bh=Ngb4mPYyKb39ZT9rbqA6bqawxkeq/VNgZ/autiDydck=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QcHOdukolGGmjmiBtVgZ+njLkjPjEu3e7zZdcKpou4HacdiHYasl1Ya/w3yuTEnYQV2ZUuexsV9cNJhb6vCXSB9nlzoxKspRXSNqxgOWt5uoyrzixSJFXHMbv6CRWF7VkwRi/oUsjr2tq/F5uzHFsa6lBCmo/U4obwEFq2qDQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCfGq8GY; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e399e904940so637123276.2;
        Sun, 01 Dec 2024 09:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733072746; x=1733677546; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ne+IhcpghH/JD4KyT9RwoVP+zX3bQqTcSKbUJivT/DQ=;
        b=TCfGq8GYVajFQ19YKQnsdNqn+ycJAQyqdFye63yHPPu1A50BMDSwDvbj40anmj/DN1
         4VZNx46wbnvHXcDRevM2rQX+Mtnhho/l4pay206gXBhtwXPCyGLPMRcJ1QN+jTOAISGf
         f09OPYLQvKUOz7PwLQTMJ4ykqu2ROBZuZiQn4sOrcDxxpl+UuyadLOYAZkrOn4fbPA0O
         2FPelux/jlFrYddXJ1p5hAelc/MaASjWjK/q+x1a3sAWb7LkcSxKtpNUOoVRGeTRbiUJ
         ouQd3ev6WPOqPsGVDLj8VMpF/qpCFe7COxPH9s2/py7G+vE+z3z5+vieX/9grAVG5OwB
         G4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733072746; x=1733677546;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ne+IhcpghH/JD4KyT9RwoVP+zX3bQqTcSKbUJivT/DQ=;
        b=AbUk1sLeThCFRruNjQfm1abTA5OC1icnN5D4LpyiJ4IRFDUd1QJ9Tw6Arz0MVe6Lx1
         nJNd8afOne9GsAGYFEjuW3jkkj8c45BjCG88NBPJGzPhZxoBVLEfxZij99t+/ikUFuv2
         ZGycgPO9v+Ch8nsl09orsYCOMRdgdsh6EP8T8J2Ozi8k8ZP/OvbbBj+6+ZU6Dq/loDJ0
         zb5m6Vc7xVA5X7ICDpewnMF1DKfs+PXkxhAD3BbB/NjpwlYOUonxyChaeJrkJ1hn3OPj
         3kwupBig8hyjuzt/AZKq41+6IjOrTCjmWtMxcecEOhJP25A+5GMrGG4Rgd7aYB5SBJTI
         lABA==
X-Gm-Message-State: AOJu0YwDOKRM8wVBrSMJ19svLQnLgN8k9Ai38D3W5zASHxB+7wEjAy90
	iy46XmSxyN1GMpJW4+e2sdz9/yyoiFiAlm/VZYaO0fb2Er2VcGDmkA2sEgRV4pXFDQLgkXjP3Yw
	uFMit7pTwyfxtRGP81dSa/XRY5k/jp6GWVBk=
X-Gm-Gg: ASbGnct9QZYrKzbuvBM+y3+Ott/+BNYU5imxIa+kEYdKDJDdXj810Z7UFJ+YnptWWQf
	0H7KM1ihnZh8V829vyVtEue5BA95NL48=
X-Google-Smtp-Source: AGHT+IEVeXOv9AfMtHl0yUXibZV2pVr8c9U2mvAgFSMLBj0AolDenAo/BHzV4b914vrWendpeRz42shEa3PK4LkfSbk=
X-Received: by 2002:a05:6902:2b85:b0:e38:fbd:48db with SMTP id
 3f1490d57ef6-e395b8d7f66mr16766004276.29.1733072746139; Sun, 01 Dec 2024
 09:05:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Sun, 1 Dec 2024 17:05:35 +0000
Message-ID: <CAP-bSRZ0CWyZZsMtx046YV8L28LhY0fson2g4EqcwRAVN1Jk+Q@mail.gmail.com>
Subject: BUG: Invalid wait context at: mc146818_avoid_UIP tick_freeze
To: linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, alexandre.belloni@bootlin.com, 
	mat.jonczyk@o2.pl, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

This splat happens on suspend/resume on a HP laptop. It doesn't appear
to be a recent regression, as a bisect only leads to 560af5dc839e
("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING.") - so
most likely the issue has been around for a while, but a recent kernel
build with lockdep enabled will now show it.

Log is from 6.12.0-12114-g410839faa596:

[   33.831760] PM: suspend entry (s2idle)
[   34.072873] Filesystems sync: 0.241 seconds
[   34.079438] Freezing user space processes
[   34.082049] Freezing user space processes completed (elapsed 0.002 seconds)
[   34.082092] OOM killer disabled.
[   34.082094] Freezing remaining freezable tasks
[   34.083487] Freezing remaining freezable tasks completed (elapsed
0.001 seconds)
[   34.083595] printk: Suspending console(s) (use no_console_suspend to debug)
[   34.118629] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   34.248840] ACPI: EC: interrupt blocked
[   34.387850] =============================
[   34.387851] [ BUG: Invalid wait context ]
[   34.387852] 6.12.0-12114-g410839faa596 #70 Not tainted
[   34.387854] -----------------------------
[   34.387855] swapper/0/0 is trying to lock:
[   34.387857] ffffffff98c69d38 (rtc_lock){....}-{3:3}, at:
mc146818_avoid_UIP (drivers/rtc/rtc-mc146818-lib.c:41)
[   34.387868] other info that might help us debug this:
[   34.387869] context-{5:5}
[   34.387869] 1 lock held by swapper/0/0:
[   34.387870] #0: ffffffff98e5cc18 (tick_freeze_lock){....}-{2:2},
at: tick_freeze (kernel/time/tick-common.c:527)
[   34.387878] stack backtrace:
[   34.387880] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
6.12.0-12114-g410839faa596 #70
[   34.387882] Hardware name: HP HP Pavilion Aero Laptop
13-be0xxx/8916, BIOS F.16 08/01/2024
[   34.387883] Call Trace:
[   34.387884]  <TASK>
[   34.387885] dump_stack_lvl (lib/dump_stack.c:123)
[   34.387889] dump_stack (lib/dump_stack.c:130)
[   34.387890] __lock_acquire (kernel/locking/lockdep.c:4828
kernel/locking/lockdep.c:4898 kernel/locking/lockdep.c:5176)
[   34.387895] lock_acquire (kernel/locking/lockdep.c:467
kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814)
[   34.387897] ? mc146818_avoid_UIP (drivers/rtc/rtc-mc146818-lib.c:41)
[   34.387898] ? __lock_acquire (kernel/locking/lockdep.c:4670
kernel/locking/lockdep.c:5180)
[   34.387900] _raw_spin_lock_irqsave
(./include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
[   34.387907] ? mc146818_avoid_UIP (drivers/rtc/rtc-mc146818-lib.c:41)
[   34.387908] mc146818_avoid_UIP (drivers/rtc/rtc-mc146818-lib.c:41)
[   34.387910] ? rtc_get_dev_attribute_groups
(drivers/rtc/rtc-mc146818-lib.c:112)
[   34.387911] mc146818_get_time (drivers/rtc/rtc-mc146818-lib.c:160)
[   34.387913] mach_get_cmos_time (arch/x86/kernel/rtc.c:69)
[   34.387920] read_persistent_clock64 (arch/x86/kernel/rtc.c:111)
[   34.387921] timekeeping_suspend (kernel/time/timekeeping.c:1924)
[   34.387925] tick_freeze (kernel/time/tick-common.c:538)
[   34.387926] enter_s2idle_proper (drivers/cpuidle/cpuidle.c:161)
[   34.387929] cpuidle_enter_s2idle (drivers/cpuidle/cpuidle.c:203)
[   34.387934] do_idle (kernel/sched/idle.c:205 kernel/sched/idle.c:325)
[   34.387937] cpu_startup_entry (kernel/sched/idle.c:422 (discriminator 1))
[   34.387938] rest_init (./include/linux/rcupdate.h:850 init/main.c:718)
[   34.387939] start_kernel (init/main.c:448 init/main.c:927)
[   34.387944] x86_64_start_reservations (arch/x86/kernel/head64.c:495)
[   34.387951] x86_64_start_kernel (arch/x86/kernel/head64.c:437
(discriminator 17))
[   34.387954] common_startup_64 (arch/x86/kernel/head_64.S:415)
[   34.387966]  </TASK>
[   34.949164] ACPI: EC: interrupt unblocked
[   34.978854] i2c_hid_acpi i2c-ELAN074E:00: i2c_hid_get_input:
incomplete report (14/516)
[   34.979597] [drm] PCIE GART of 1024M enabled.
[   34.979600] [drm] PTB located at 0x000000F41FC00000


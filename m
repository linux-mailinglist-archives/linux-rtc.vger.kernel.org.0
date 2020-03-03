Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5DE41774B5
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Mar 2020 11:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgCCK57 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Mar 2020 05:57:59 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:12723 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgCCK56 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Mar 2020 05:57:58 -0500
X-Originating-IP: 86.202.111.97
Received: from localhost (lfbn-lyo-1-16-97.w86-202.abo.wanadoo.fr [86.202.111.97])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id ED9B524000C;
        Tue,  3 Mar 2020 10:57:55 +0000 (UTC)
Date:   Tue, 3 Mar 2020 11:57:55 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ville Syrjala <ville.syrjala@linux.intel.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: Use spin_lock_irqsave() in cmos_interrupt()
Message-ID: <20200303105755.GE4803@piout.net>
References: <20200221144739.11746-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200221144739.11746-1-ville.syrjala@linux.intel.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/02/2020 16:47:39+0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> cmos_interrupt() isn't always called from hardirq context, so
> we must use spin_lock_irqsave() & co.
> 
> ================================
> WARNING: inconsistent lock state
> 5.6.0-rc2-CI-CI_DRM_7981+ #1 Tainted: G     U
> --------------------------------
> inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> rtcwake/4315 [HC0[0]:SC0[0]:HE1:SE1] takes:
> ffffffff82635198 (rtc_lock){?...}, at: cmos_interrupt+0x18/0x100
> {IN-HARDIRQ-W} state was registered at:
>   lock_acquire+0xa7/0x1c0
>   _raw_spin_lock+0x2a/0x40
>   cmos_interrupt+0x18/0x100
>   rtc_handler+0x75/0xc0
>   acpi_ev_fixed_event_detect+0xf9/0x132
>   acpi_ev_sci_xrupt_handler+0xb/0x28
>   acpi_irq+0x13/0x30
>   __handle_irq_event_percpu+0x41/0x2c0
>   handle_irq_event_percpu+0x2b/0x70
>   handle_irq_event+0x2f/0x50
>   handle_fasteoi_irq+0x8e/0x150
>   do_IRQ+0x7e/0x160
>   ret_from_intr+0x0/0x35
>   mwait_idle+0x7e/0x200
>   do_idle+0x1bb/0x260
>   cpu_startup_entry+0x14/0x20
>   start_secondary+0x15f/0x1b0
>   secondary_startup_64+0xa4/0xb0
> irq event stamp: 42003
> hardirqs last  enabled at (42003): [<ffffffff81a36567>] _raw_spin_unlock_irqrestore+0x47/0x60
> hardirqs last disabled at (42002): [<ffffffff81a362ed>] _raw_spin_lock_irqsave+0xd/0x50
> softirqs last  enabled at (41848): [<ffffffff81e00385>] __do_softirq+0x385/0x47f
> softirqs last disabled at (41841): [<ffffffff810bab3a>] irq_exit+0xba/0xc0
> 
> other info that might help us debug this:
>  Possible unsafe locking scenario:
> 
>        CPU0
>        ----
>   lock(rtc_lock);
>   <Interrupt>
>     lock(rtc_lock);
> 
>  *** DEADLOCK ***
> 
> 6 locks held by rtcwake/4315:
>  #0: ffff888175dc9408 (sb_writers#5){.+.+}, at: vfs_write+0x1a4/0x1d0
>  #1: ffff88817406ca80 (&of->mutex){+.+.}, at: kernfs_fop_write+0xdd/0x1b0
>  #2: ffff888179be85e0 (kn->count#236){.+.+}, at: kernfs_fop_write+0xe6/0x1b0
>  #3: ffffffff82641e00 (system_transition_mutex){+.+.}, at: pm_suspend+0xb3/0x3b0
>  #4: ffffffff826b3ee0 (acpi_scan_lock){+.+.}, at: acpi_suspend_begin+0x47/0x80
>  #5: ffff888178fc3960 (&dev->mutex){....}, at: device_resume+0x92/0x1c0
> 
> stack backtrace:
> CPU: 3 PID: 4315 Comm: rtcwake Tainted: G     U            5.6.0-rc2-CI-CI_DRM_7981+ #1
> Hardware name: Google Soraka/Soraka, BIOS MrChromebox-4.10 08/25/2019
> Call Trace:
>  dump_stack+0x71/0x9b
>  mark_lock+0x49a/0x500
>  ? print_shortest_lock_dependencies+0x200/0x200
>  __lock_acquire+0x6d4/0x15d0
>  ? __lock_acquire+0x460/0x15d0
>  lock_acquire+0xa7/0x1c0
>  ? cmos_interrupt+0x18/0x100
>  _raw_spin_lock+0x2a/0x40
>  ? cmos_interrupt+0x18/0x100
>  cmos_interrupt+0x18/0x100
>  cmos_resume+0x1fd/0x290
>  ? __acpi_pm_set_device_wakeup+0x24/0x100
>  pnp_bus_resume+0x5e/0x90
>  ? pnp_bus_suspend+0x10/0x10
>  dpm_run_callback+0x64/0x280
>  device_resume+0xd4/0x1c0
>  ? dpm_watchdog_set+0x60/0x60
>  dpm_resume+0x106/0x410
>  ? dpm_resume_early+0x38c/0x3e0
>  dpm_resume_end+0x8/0x10
>  suspend_devices_and_enter+0x16f/0xbe0
>  ? rcu_read_lock_sched_held+0x4d/0x80
>  pm_suspend+0x344/0x3b0
>  state_store+0x78/0xe0
>  kernfs_fop_write+0x112/0x1b0
>  vfs_write+0xb9/0x1d0
>  ksys_write+0x9f/0xe0
>  do_syscall_64+0x4f/0x220
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7ff934307154
> Code: 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 8d 05 b1 07 2e 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 f3 c3 66 90 41 54 55 49 89 d4 53 48 89 f5
> RSP: 002b:00007ffe2647c168 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007ff934307154
> RDX: 0000000000000004 RSI: 000055de3ec4e5a0 RDI: 000000000000000a
> RBP: 000055de3ec4e5a0 R08: 000055de3ec4c5e0 R09: 00007ff9349f3740
> R10: 000055de3ec4a010 R11: 0000000000000246 R12: 000055de3ec4c500
> R13: 0000000000000004 R14: 00007ff9345df2a0 R15: 00007ff9345de760
> 
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/rtc/rtc-cmos.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FF733C8A0
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 22:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhCOVmZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 17:42:25 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33497 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhCOVmQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 17:42:16 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8D4CCE0004;
        Mon, 15 Mar 2021 21:42:13 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: Disable irq around direct invocation of cmos_interrupt()
Date:   Mon, 15 Mar 2021 22:42:12 +0100
Message-Id: <161584452659.565124.13401687823388696281.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210305122140.28774-1-chris@chris-wilson.co.uk>
References: <20210305122140.28774-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 5 Mar 2021 12:21:40 +0000, Chris Wilson wrote:
> As previously noted in commit 66e4f4a9cc38 ("rtc: cmos: Use
> spin_lock_irqsave() in cmos_interrupt()"):
> 
> <4>[  254.192378] WARNING: inconsistent lock state
> <4>[  254.192384] 5.12.0-rc1-CI-CI_DRM_9834+ #1 Not tainted
> <4>[  254.192396] --------------------------------
> <4>[  254.192400] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> <4>[  254.192409] rtcwake/5309 [HC0[0]:SC0[0]:HE1:SE1] takes:
> <4>[  254.192429] ffffffff8263c5f8 (rtc_lock){?...}-{2:2}, at: cmos_interrupt+0x18/0x100
> <4>[  254.192481] {IN-HARDIRQ-W} state was registered at:
> <4>[  254.192488]   lock_acquire+0xd1/0x3d0
> <4>[  254.192504]   _raw_spin_lock+0x2a/0x40
> <4>[  254.192519]   cmos_interrupt+0x18/0x100
> <4>[  254.192536]   rtc_handler+0x1f/0xc0
> <4>[  254.192553]   acpi_ev_fixed_event_detect+0x109/0x13c
> <4>[  254.192574]   acpi_ev_sci_xrupt_handler+0xb/0x28
> <4>[  254.192596]   acpi_irq+0x13/0x30
> <4>[  254.192620]   __handle_irq_event_percpu+0x43/0x2c0
> <4>[  254.192641]   handle_irq_event_percpu+0x2b/0x70
> <4>[  254.192661]   handle_irq_event+0x2f/0x50
> <4>[  254.192680]   handle_fasteoi_irq+0x9e/0x150
> <4>[  254.192693]   __common_interrupt+0x76/0x140
> <4>[  254.192715]   common_interrupt+0x96/0xc0
> <4>[  254.192732]   asm_common_interrupt+0x1e/0x40
> <4>[  254.192750]   _raw_spin_unlock_irqrestore+0x38/0x60
> <4>[  254.192767]   resume_irqs+0xba/0xf0
> <4>[  254.192786]   dpm_resume_noirq+0x245/0x3d0
> <4>[  254.192811]   suspend_devices_and_enter+0x230/0xaa0
> <4>[  254.192835]   pm_suspend.cold.8+0x301/0x34a
> <4>[  254.192859]   state_store+0x7b/0xe0
> <4>[  254.192879]   kernfs_fop_write_iter+0x11d/0x1c0
> <4>[  254.192899]   new_sync_write+0x11d/0x1b0
> <4>[  254.192916]   vfs_write+0x265/0x390
> <4>[  254.192933]   ksys_write+0x5a/0xd0
> <4>[  254.192949]   do_syscall_64+0x33/0x80
> <4>[  254.192965]   entry_SYSCALL_64_after_hwframe+0x44/0xae
> <4>[  254.192986] irq event stamp: 43775
> <4>[  254.192994] hardirqs last  enabled at (43775): [<ffffffff81c00c42>] asm_sysvec_apic_timer_interrupt+0x12/0x20
> <4>[  254.193023] hardirqs last disabled at (43774): [<ffffffff81aa691a>] sysvec_apic_timer_interrupt+0xa/0xb0
> <4>[  254.193049] softirqs last  enabled at (42548): [<ffffffff81e00342>] __do_softirq+0x342/0x48e
> <4>[  254.193074] softirqs last disabled at (42543): [<ffffffff810b45fd>] irq_exit_rcu+0xad/0xd0
> <4>[  254.193101]
>                   other info that might help us debug this:
> <4>[  254.193107]  Possible unsafe locking scenario:
> 
> [...]

Applied, thanks!

[1/1] rtc: cmos: Disable irq around direct invocation of cmos_interrupt()
      commit: bd33335aa93d615cac77d991c448b986761e7a8d

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

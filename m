Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADBE432EC13
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Mar 2021 14:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhCEN2M (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Mar 2021 08:28:12 -0500
Received: from mga05.intel.com ([192.55.52.43]:20977 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230051AbhCEN16 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 5 Mar 2021 08:27:58 -0500
IronPort-SDR: tmjqzQ0fntmDPpEDFyU4hBM95MB7yll8HTnsiLsRzNW/OpBjgVkLYrdKL26a9JlJn71tMBU0gg
 NT2hhBlupZVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="272654505"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="272654505"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 05:27:56 -0800
IronPort-SDR: Evm0tMlbj8bglgGiwXr4qE84vOPEnPw4BUZJ3M77qjga+TE/m1rG7aZ0JNfyJ8zpKtqJMEYLo1
 1zBKfMjpktrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="407250711"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by orsmga007.jf.intel.com with SMTP; 05 Mar 2021 05:27:53 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 05 Mar 2021 15:27:52 +0200
Date:   Fri, 5 Mar 2021 15:27:52 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: cmos: Disable irq around direct invocation of
 cmos_interrupt()
Message-ID: <YEIx2MetiHDXdrcL@intel.com>
References: <20210305122140.28774-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210305122140.28774-1-chris@chris-wilson.co.uk>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Mar 05, 2021 at 12:21:40PM +0000, Chris Wilson wrote:
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
> <4>[  254.193112]        CPU0
> <4>[  254.193117]        ----
> <4>[  254.193121]   lock(rtc_lock);
> <4>[  254.193137]   <Interrupt>
> <4>[  254.193142]     lock(rtc_lock);
> <4>[  254.193156]
>                    *** DEADLOCK ***
> 
> <4>[  254.193161] 6 locks held by rtcwake/5309:
> <4>[  254.193174]  #0: ffff888104861430 (sb_writers#5){.+.+}-{0:0}, at: ksys_write+0x5a/0xd0
> <4>[  254.193232]  #1: ffff88810f823288 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0xe7/0x1c0
> <4>[  254.193282]  #2: ffff888100cef3c0 (kn->active#285
> <7>[  254.192706] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]] [CRTC:51:pipe A] hw state readout: disabled
> <4>[  254.193307] ){.+.+}-{0:0}, at: kernfs_fop_write_iter+0xf0/0x1c0
> <4>[  254.193333]  #3: ffffffff82649fa8 (system_transition_mutex){+.+.}-{3:3}, at: pm_suspend.cold.8+0xce/0x34a
> <4>[  254.193387]  #4: ffffffff827a2108 (acpi_scan_lock){+.+.}-{3:3}, at: acpi_suspend_begin+0x47/0x70
> <4>[  254.193433]  #5: ffff8881019ea178 (&dev->mutex){....}-{3:3}, at: device_resume+0x68/0x1e0
> <4>[  254.193485]
>                   stack backtrace:
> <4>[  254.193492] CPU: 1 PID: 5309 Comm: rtcwake Not tainted 5.12.0-rc1-CI-CI_DRM_9834+ #1
> <4>[  254.193514] Hardware name: Google Soraka/Soraka, BIOS MrChromebox-4.10 08/25/2019
> <4>[  254.193524] Call Trace:
> <4>[  254.193536]  dump_stack+0x7f/0xad
> <4>[  254.193567]  mark_lock.part.47+0x8ca/0xce0
> <4>[  254.193604]  __lock_acquire+0x39b/0x2590
> <4>[  254.193626]  ? asm_sysvec_apic_timer_interrupt+0x12/0x20
> <4>[  254.193660]  lock_acquire+0xd1/0x3d0
> <4>[  254.193677]  ? cmos_interrupt+0x18/0x100
> <4>[  254.193716]  _raw_spin_lock+0x2a/0x40
> <4>[  254.193735]  ? cmos_interrupt+0x18/0x100
> <4>[  254.193758]  cmos_interrupt+0x18/0x100
> <4>[  254.193785]  cmos_resume+0x2ac/0x2d0
> <4>[  254.193813]  ? acpi_pm_set_device_wakeup+0x1f/0x110
> <4>[  254.193842]  ? pnp_bus_suspend+0x10/0x10
> <4>[  254.193864]  pnp_bus_resume+0x5e/0x90
> <4>[  254.193885]  dpm_run_callback+0x5f/0x240
> <4>[  254.193914]  device_resume+0xb2/0x1e0
> <4>[  254.193942]  ? pm_dev_err+0x25/0x25
> <4>[  254.193974]  dpm_resume+0xea/0x3f0
> <4>[  254.194005]  dpm_resume_end+0x8/0x10
> <4>[  254.194030]  suspend_devices_and_enter+0x29b/0xaa0
> <4>[  254.194066]  pm_suspend.cold.8+0x301/0x34a
> <4>[  254.194094]  state_store+0x7b/0xe0
> <4>[  254.194124]  kernfs_fop_write_iter+0x11d/0x1c0
> <4>[  254.194151]  new_sync_write+0x11d/0x1b0
> <4>[  254.194183]  vfs_write+0x265/0x390
> <4>[  254.194207]  ksys_write+0x5a/0xd0
> <4>[  254.194232]  do_syscall_64+0x33/0x80
> <4>[  254.194251]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> <4>[  254.194274] RIP: 0033:0x7f07d79691e7
> <4>[  254.194293] Code: 64 89 02 48 c7 c0 ff ff ff ff eb bb 0f 1f 80 00 00 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> <4>[  254.194312] RSP: 002b:00007ffd9cc2c768 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> <4>[  254.194337] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f07d79691e7
> <4>[  254.194352] RDX: 0000000000000004 RSI: 0000556ebfc63590 RDI: 000000000000000b
> <4>[  254.194366] RBP: 0000556ebfc63590 R08: 0000000000000000 R09: 0000000000000004
> <4>[  254.194379] R10: 0000556ebf0ec2a6 R11: 0000000000000246 R12: 0000000000000004
> 
> which breaks S3-resume on fi-kbl-soraka presumably as that's slow enough
> to trigger the alarm during the suspend.
> 
> Fixes: 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")

Sigh. I wish people would at least try to check the code/history
before doing these blind "cleanups" :(

> References: 66e4f4a9cc38 ("rtc: cmos: Use spin_lock_irqsave() in cmos_interrupt()"):
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Xiaofei Tan <tanxiaofei@huawei.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> ---
>  drivers/rtc/rtc-cmos.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 670fd8a2970e..6545afb2f20e 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -1053,7 +1053,9 @@ static void cmos_check_wkalrm(struct device *dev)
>  	 * ACK the rtc irq here
>  	 */
>  	if (t_now >= cmos->alarm_expires && cmos_use_acpi_alarm()) {
> +		local_irq_disable();
>  		cmos_interrupt(0, (void *)cmos->rtc);
> +		local_irq_enable();

Yeah, given what's already happened this seems more likely to
survive a bit longer.

Reviewed-by: Ville Syrj�l� <ville.syrjala@linux.intel.com>

>  		return;
>  	}
>  
> -- 
> 2.20.1

-- 
Ville Syrj�l�
Intel

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E862E733C
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Dec 2020 20:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgL2Tmi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Dec 2020 14:42:38 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:40865 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgL2Tmi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Dec 2020 14:42:38 -0500
Received: by mail-oi1-f169.google.com with SMTP id p5so15687508oif.7;
        Tue, 29 Dec 2020 11:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vCQe4wi6BS3tX0tzI09pDeYN8axsFGNQEB3OCiXr8sw=;
        b=EVkLrdg6z7cqmsAGxbkE3ZZccBMH5WdjUY/83dPmZvzOlJajGmyBsmXqQSyA2OdKrO
         xBqvdVvCRczgfjcbfsf+SgcAyK1i+nZh3usH1NTv7t8E2KM+KNd1UE9GLVryk433u/nW
         g4kcbcyoOE6TsE0oyBzXlBUuiU6bQLHfBHsyxZIw/faHrquu0Qp6jTCvGCs2q0YDvlC1
         +sLVH+NjOKNWDlIhOmTq1gJBCshV8mW565gXavZI5b0gdQosYE65qLgSk7+/kutppHAa
         mkOUrF1i6U/9pbT6uvot4xwry9njmwTmdmZO/ohfeKfYL+CE3PsyRFO6ILpIzHSP5qQU
         qKMA==
X-Gm-Message-State: AOAM5305ceqeKUwQRu+cIX2T2Uj27xU7TkvmqY2Zxg0PHmYPoPIfdeqX
        w99+eUglck1S/ZxHR4XIP48lAC3RBHPoCoFx/Tw=
X-Google-Smtp-Source: ABdhPJyYeYmNS3uORHuhWP0YeMOl5M3apgVxsQG8MVEjZoiEl8XSEZ4gzS5C9+lw/HkcFJ0LrhWKaDE1rDMYLvmI92s=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr3266129oia.148.1609270917016;
 Tue, 29 Dec 2020 11:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20201206214613.444124194@linutronix.de> <20201206220542.062910520@linutronix.de>
In-Reply-To: <20201206220542.062910520@linutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Dec 2020 20:41:46 +0100
Message-ID: <CAMuHMdVB9XMAaMDnKrRzkqvhFugrDGmj=00Vh5sDQT-idnA7DA@mail.gmail.com>
Subject: Re: [patch 5/8] ntp: Make the RTC synchronization more reliable
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Thomas,

On Sun, Dec 6, 2020 at 11:10 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> Miroslav reported that the periodic RTC synchronization in the NTP code
> fails more often than not to hit the specified update window.
>
> The reason is that the code uses delayed_work to schedule the update which
> needs to be in thread context as the underlying RTC might be connected via
> a slow bus, e.g. I2C. In the update function it verifies whether the
> current time is correct vs. the requirements of the underlying RTC.
>
> But delayed_work is using the timer wheel for scheduling which is
> inaccurate by design. Depending on the distance to the expiry the wheel
> gets less granular to allow batching and to avoid the cascading of the
> original timer wheel. See 500462a9de65 ("timers: Switch to a non-cascading
> wheel") and the code for further details.
>
> The code already deals with this by splitting the 660 seconds period into a
> long 659 seconds timer and then retrying with a smaller delta.
>
> But looking at the actual granularities of the timer wheel (which depend on
> the HZ configuration) the 659 seconds timer ends up in an outer wheel level
> and is affected by a worst case granularity of:
>
> HZ          Granularity
> 1000        32s
>  250        16s
>  100        40s
>
> So the initial timer can be already off by max 12.5% which is not a big
> issue as the period of the sync is defined as ~11 minutes.
>
> The fine grained second attempt schedules to the desired update point with
> a timer expiring less than a second from now. Depending on the actual delta
> and the HZ setting even the second attempt can end up in outer wheel levels
> which have a large enough granularity to make the correctness check fail.
>
> As this is a fundamental property of the timer wheel there is no way to
> make this more accurate short of iterating in one jiffies steps towards the
> update point.
>
> Switch it to an hrtimer instead which schedules the actual update work. The
> hrtimer will expire precisely (max 1 jiffie delay when high resolution
> timers are not available). The actual scheduling delay of the work is the
> same as before.
>
> The update is triggered from do_adjtimex() which is a bit racy but not much
> more racy than it was before:
>
>      if (ntp_synced())
>         queue_delayed_work(system_power_efficient_wq, &sync_work, 0);
>
> which is racy when the work is currently executed and has not managed to
> reschedule itself.
>
> This becomes now:
>
>      if (ntp_synced() && !hrtimer_is_queued(&sync_hrtimer))
>         queue_work(system_power_efficient_wq, &sync_work, 0);
>
> which is racy when the hrtimer has expired and the work is currently
> executed and has not yet managed to rearm the hrtimer.
>
> Not a big problem as it just schedules work for nothing.
>
> The new implementation has a safe guard in place to catch the case where
> the hrtimer is queued on entry to the work function and avoids an extra
> update attempt of the RTC that way.
>
> Reported-by: Miroslav Lichvar <mlichvar@redhat.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Thanks for your patch, which is now commit c9e6189fb03123a7 ("ntp: Make
the RTC synchronization more reliable").

Since this commit, the I2C RTC on the R-Car M2-W Koelsch development
board is accessed every two seconds.  Sticking a WARN() in the I2C
activation path gives e.g.

    Modules linked in:
    CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted
5.10.0-rc1-koelsch-00038-gc9e6189fb031-dirty #1021
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    Workqueue: events rtc_timer_do_work
    [<c020ea7c>] (unwind_backtrace) from [<c020a4dc>] (show_stack+0x10/0x14)
    [<c020a4dc>] (show_stack) from [<c090e314>] (dump_stack+0xa0/0xc8)
    [<c090e314>] (dump_stack) from [<c02228a8>] (__warn+0xbc/0xfc)
    [<c02228a8>] (__warn) from [<c090b434>] (warn_slowpath_fmt+0x78/0xb0)
    [<c090b434>] (warn_slowpath_fmt) from [<c058f184>]
(cpg_mstp_clock_endisable+0x94/0x1f4)
    [<c058f184>] (cpg_mstp_clock_endisable) from [<c05881c8>]
(clk_core_enable+0x194/0x29c)
    [<c05881c8>] (clk_core_enable) from [<c05882e8>]
(clk_core_enable_lock+0x18/0x2c)
    [<c05882e8>] (clk_core_enable_lock) from [<c063b5c4>]
(pm_clk_resume+0x68/0xa0)
    [<c063b5c4>] (pm_clk_resume) from [<c063a738>]
(genpd_runtime_resume+0xc8/0x174)
    [<c063a738>] (genpd_runtime_resume) from [<c063236c>]
(__rpm_callback+0x30/0xe0)
    [<c063236c>] (__rpm_callback) from [<c063248c>] (rpm_callback+0x70/0x80)
    [<c063248c>] (rpm_callback) from [<c063216c>] (rpm_resume+0x438/0x4dc)
    [<c063216c>] (rpm_resume) from [<c0632274>] (__pm_runtime_resume+0x64/0x80)
    [<c0632274>] (__pm_runtime_resume) from [<c0731ab4>]
(sh_mobile_i2c_xfer+0x38/0x554)
    [<c0731ab4>] (sh_mobile_i2c_xfer) from [<c072a6c4>]
(__i2c_transfer+0x4e4/0x680)
    [<c072a6c4>] (__i2c_transfer) from [<c072a8b8>] (i2c_transfer+0x58/0xf8)
    [<c072a8b8>] (i2c_transfer) from [<c0645688>] (regmap_i2c_read+0x58/0x94)
    [<c0645688>] (regmap_i2c_read) from [<c0641490>]
(_regmap_raw_read+0x19c/0x2f4)
    [<c0641490>] (_regmap_raw_read) from [<c064162c>]
(_regmap_bus_read+0x44/0x68)
    [<c064162c>] (_regmap_bus_read) from [<c0640308>] (_regmap_read+0x84/0x1a4)
    [<c0640308>] (_regmap_read) from [<c0640984>]
(_regmap_update_bits+0xa8/0xf4)
    [<c0640984>] (_regmap_update_bits) from [<c0641b5c>]
(regmap_update_bits_base+0x4c/0x70)
    [<c0641b5c>] (regmap_update_bits_base) from [<c0728244>]
(regmap_update_bits+0x18/0x20)
    [<c0728244>] (regmap_update_bits) from [<c072491c>]
(rtc_alarm_disable+0x28/0x38)
    [<c072491c>] (rtc_alarm_disable) from [<c0726408>]
(rtc_timer_do_work+0x88/0x294)
    [<c0726408>] (rtc_timer_do_work) from [<c023e27c>]
(process_one_work+0x308/0x524)
    [<c023e27c>] (process_one_work) from [<c023ec80>]
(worker_thread+0x22c/0x2ec)
    [<c023ec80>] (worker_thread) from [<c024417c>] (kthread+0x128/0x138)
    [<c024417c>] (kthread) from [<c020010c>] (ret_from_fork+0x14/0x28)
    Exception stack(0xc220ffb0 to 0xc220fff8)
    ffa0:                                     00000000 00000000
00000000 00000000
    ffc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
    ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
    irq event stamp: 74448
    hardirqs last  enabled at (74447): [<c02a5f90>]
seqcount_lockdep_reader_access.constprop.0+0x58/0x68
    hardirqs last disabled at (74448): [<c0919a68>]
_raw_spin_lock_irqsave+0x20/0x70
    softirqs last  enabled at (74360): [<c02012b0>] __do_softirq+0x1b8/0x468
    softirqs last disabled at (74353): [<c0228f24>] __irq_exit_rcu+0x110/0x17c
    ---[ end trace 8c279400e5758606 ]---

Before, the synchronization happened only every 696s.

Worse, this synchronization may also happen while the system is partly
suspended, sometimes triggering a WARNING during resume from s2ram:

     Disabling non-boot CPUs ...
     Enabling non-boot CPUs ...
    +------------[ cut here ]------------
    +WARNING: CPU: 0 PID: 21 at drivers/i2c/i2c-core.h:54
__i2c_transfer+0x464/0x4a0
    +i2c i2c-6: Transfer while suspended
    +CPU: 0 PID: 21 Comm: kworker/0:1 Not tainted
5.11.0-rc1-shmobile-00107-gcf9760aa181f #829
    +Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    +Workqueue: events_power_efficient sync_hw_clock
    +[<c010dba4>] (unwind_backtrace) from [<c0109b28>] (show_stack+0x10/0x14)
    +[<c0109b28>] (show_stack) from [<c07a120c>] (dump_stack+0x8c/0xa8)
    +[<c07a120c>] (dump_stack) from [<c011c538>] (__warn+0xc0/0xec)
    +[<c011c538>] (__warn) from [<c079a7bc>] (warn_slowpath_fmt+0x78/0xb0)
    +[<c079a7bc>] (warn_slowpath_fmt) from [<c0566574>]
(__i2c_transfer+0x464/0x4a0)
    +[<c0566574>] (__i2c_transfer) from [<c0566608>] (i2c_transfer+0x58/0xf8)
    +[<c0566608>] (i2c_transfer) from [<c0489f80>] (regmap_i2c_read+0x58/0x94)
    +[<c0489f80>] (regmap_i2c_read) from [<c0485e00>]
(_regmap_raw_read+0x108/0x1bc)
    +[<c0485e00>] (_regmap_raw_read) from [<c0485ef8>]
(_regmap_bus_read+0x44/0x68)
    +[<c0485ef8>] (_regmap_bus_read) from [<c0484018>] (_regmap_read+0x84/0x100)
    +[<c0484018>] (_regmap_read) from [<c0485444>]
(_regmap_update_bits+0xa8/0xf4)
    +[<c0485444>] (_regmap_update_bits) from [<c0485574>]
    (_regmap_select_page+0xe4/0x100)
    +[<c0485574>] (_regmap_select_page) from [<c0485664>]
    (_regmap_raw_write_impl+0xd4/0x608)
    +[<c0485664>] (_regmap_raw_write_impl) from [<c04863f4>]
    (_regmap_raw_write+0xd8/0x114)
    +[<c04863f4>] (_regmap_raw_write) from [<c0486488>]
(regmap_raw_write+0x58/0x7c)
    +[<c0486488>] (regmap_raw_write) from [<c04866cc>]
    (regmap_bulk_write+0x118/0x13c)
    +[<c04866cc>] (regmap_bulk_write) from [<c05605b4>]
    (da9063_rtc_set_time+0x44/0x8c)
    +[<c05605b4>] (da9063_rtc_set_time) from [<c055e428>]
(rtc_set_time+0x8c/0x15c)
    +[<c055e428>] (rtc_set_time) from [<c01872cc>] (sync_hw_clock+0x12c/0x210)
    +[<c01872cc>] (sync_hw_clock) from [<c01337d0>]
(process_one_work+0x1bc/0x2ac)
    +[<c01337d0>] (process_one_work) from [<c0133b18>]
(worker_thread+0x22c/0x2d0)
    +[<c0133b18>] (worker_thread) from [<c01388a8>] (kthread+0x100/0x10c)
    +[<c01388a8>] (kthread) from [<c0100150>] (ret_from_fork+0x14/0x24)
    +Exception stack(0xc1195fb0 to 0xc1195ff8)
    +5fa0:                                     00000000 00000000
00000000 00000000
    +5fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
    +5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
    +---[ end trace 5d3a7a10ee0cec3d ]---
    +da9063-rtc da9063-rtc: Failed to set RTC time data: -108
    +da9063-rtc da9063-rtc: Failed to read RTC time data: -108
     CPU1 is up

The latter is probably a pre-existing issue, just more likely to trigger
now the sync interval is 2s.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

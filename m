Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7867D30A93C
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Feb 2021 15:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhBAN77 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 08:59:59 -0500
Received: from depni-mx.sinp.msu.ru ([213.131.7.21]:25 "EHLO
        depni-mx.sinp.msu.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbhBAN76 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 08:59:58 -0500
X-Greylist: delayed 351 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Feb 2021 08:59:55 EST
Received: from spider (unknown [176.192.246.239])
        by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 59A8C1BF45C;
        Mon,  1 Feb 2021 16:53:53 +0300 (MSK)
From:   Serge Belyshev <belyshev@depni.sinp.msu.ru>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Dirk Gouders <dirk@gouders.net>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH V2] rtc: mc146818: Detect and handle broken RTCs
References: <20201206214613.444124194@linutronix.de>
        <20201206220541.594826678@linutronix.de>
        <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
        <871re7hlsg.fsf@nanos.tec.linutronix.de>
        <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
        <87y2gfg18p.fsf@nanos.tec.linutronix.de>
        <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net>
Date:   Mon, 01 Feb 2021 16:53:20 +0300
In-Reply-To: <ghft2hwevu.fsf@gouders.net> (Dirk Gouders's message of "Sun, 31
        Jan 2021 11:59:49 +0100")
Message-ID: <877dnrc2sv.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi!  "Me too":

> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -21,6 +21,13 @@ unsigned int mc146818_get_time(struct rt
>  
>  again:
>  	spin_lock_irqsave(&rtc_lock, flags);
> +	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> +	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x7f) != 0)) {
> +		spin_unlock_irqrestore(&rtc_lock, flags);
> +		memset(time, 0xff, sizeof(*time));
> +		return 0;
> +	}
> +

... triggers here on a different box (Xiaomi mi notebook air 12.5):

[    3.524002] ------------[ cut here ]------------
[    3.528317] WARNING: CPU: 3 PID: 273 at drivers/rtc/rtc-mc146818-lib.c:25 mc146818_get_time+0x1b6/0x210
[    3.532558] CPU: 3 PID: 273 Comm: udevadm Not tainted 5.11.0-rc6 #760
[    3.536748] Hardware name: Timi TM1612/TM1612, BIOS A04 08/06/2016
[    3.540947] RIP: 0010:mc146818_get_time+0x1b6/0x210
[    3.545103] Code: 76 0b 0f b6 d0 83 ea 13 6b d2 64 01 d5 83 fd 45 89 6b 14 7f 06 83 c5 64 89 6b 14 41 83 ed 01 b8 02 00 00 00 44 89 6b 10 eb 39 <0f> 0b 48 c7 c7 b4 e0 9e 82 48 89 ee e8 29 6b 34 00 48 c7 03 ff ff
[    3.549883] RSP: 0000:ffffc900012efe30 EFLAGS: 00010002
[    3.554387] RAX: 0000000000000081 RBX: ffffc900012efe64 RCX: 000000000005b8d7
[    3.558867] RDX: 0000000000000001 RSI: ffff8881000aa000 RDI: 000000000000000d
[    3.563333] RBP: 0000000000000046 R08: 0000000000000004 R09: fffffffe5e075ac6
[    3.567748] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    3.567822] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[    3.567827] R13: ffffc900012efedc R14: 0000000000000008 R15: ffff888100051200
[    3.577223] FS:  0000000000000000(0000) GS:ffff88816ad80000(0000) knlGS:0000000000000000
[    3.579870] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.581947] CR2: 00007fface455e28 CR3: 0000000103244005 CR4: 00000000003706a0
[    3.583836] Call Trace:
[    3.585699]  hpet_rtc_interrupt+0x1af/0x220
[    3.587585]  __handle_irq_event_percpu+0x5a/0xc0
[    3.589230]  handle_irq_event_percpu+0x1b/0x50
[    3.590673]  handle_irq_event+0x22/0x40
[    3.592107]  handle_edge_irq+0x6b/0x190
[    3.593545]  common_interrupt+0x67/0x130
[    3.594983]  ? asm_common_interrupt+0x8/0x40
[    3.596432]  asm_common_interrupt+0x1e/0x40
[    3.597618] RIP: 0033:0x7ffaceac9b31
[    3.598794] Code: 48 83 fe 0a 0f 87 f5 fe ff ff be 41 ff ff 6f 48 29 d6 48 89 04 f1 e9 e4 fe ff ff 48 85 ff 74 79 49 8b 44 24 60 48 85 c0 74 04 <48> 01 78 08 49 8b 44 24 58 48 85 c0 74 04 48 01 78 08 49 8b 44 24
[    3.600048] RSP: 002b:00007ffc12303b00 EFLAGS: 00010202
[    3.601343] RAX: 00007fface455e20 RBX: 000000006ffffdff RCX: 00007fface80c040
[    3.602587] RDX: 0000000000000000 RSI: 0000000000000029 RDI: 00007fface451000
[    3.603809] RBP: 00007ffc12303c50 R08: 000000006fffffff R09: 00000000effffef5
[    3.605015] R10: 0000000070000022 R11: 0000000000000032 R12: 00007fface80c000
[    3.606223] R13: 000000006ffffeff R14: 000000006ffffe35 R15: 00007ffc12303ce0
[    3.607421] ---[ end trace 5922ddf43b0f7b83 ]---
[    3.608692] hpet: Lost 3 RTC interrupts

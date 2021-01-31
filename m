Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5FC309DB2
	for <lists+linux-rtc@lfdr.de>; Sun, 31 Jan 2021 16:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhAaM5m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 31 Jan 2021 07:57:42 -0500
Received: from services.gouders.net ([141.101.32.176]:34444 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhAaMMj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 31 Jan 2021 07:12:39 -0500
Received: from localhost (ltea-047-066-000-239.pools.arcor-ip.net [47.66.0.239])
        (authenticated bits=0)
        by services.gouders.net (8.14.8/8.14.8) with ESMTP id 10VB1PAI023090
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 31 Jan 2021 12:01:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
        t=1612090886; bh=KUAbVvxmDpmlizUYZesXJ4PGh5/kKTawUFx4cELP/IE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date;
        b=HXTT1gmL8cpaIggAoqbUQ5Y2IHX3pn97/MwtiTuHd92rflhsJG4cHqPVXPJaF2uEU
         WOgmLhnbMNYQUNBLjd7zREykqBPP3VogvF/JCRlAT7GOTuNw5CipHE/6yFkHcdquqo
         coCQLfwb+lhBKvFkULw+VblxYQW+a9ZYZoVSL/a4=
From:   Dirk Gouders <dirk@gouders.net>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH V2] rtc: mc146818: Detect and handle broken RTCs
In-Reply-To: <87tur3fx7w.fsf@nanos.tec.linutronix.de> (Thomas Gleixner's
        message of "Tue, 26 Jan 2021 18:02:11 +0100")
References: <20201206214613.444124194@linutronix.de>
        <20201206220541.594826678@linutronix.de>
        <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
        <871re7hlsg.fsf@nanos.tec.linutronix.de>
        <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
        <87y2gfg18p.fsf@nanos.tec.linutronix.de>
        <87tur3fx7w.fsf@nanos.tec.linutronix.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date:   Sun, 31 Jan 2021 11:59:49 +0100
Message-ID: <ghft2hwevu.fsf@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Thomas Gleixner <tglx@linutronix.de> writes:

> The recent fix for handling the UIP bit unearthed another issue in the RTC
> code. If the RTC is advertised but the readout is straight 0xFF because
> it's not available, the old code just proceeded with crappy values, but t=
he
> new code hangs because it waits for the UIP bit to become low.
>
> Add a sanity check in the RTC CMOS probe function which reads the RTC_VAL=
ID
> register (Register D) which should have bit 0-6 cleared. If that's not the
> case then fail to register the CMOS.
>
> Add the same check to mc146818_get_time(), warn once when the condition
> is true and invalidate the rtc_time data.

In case it is helpful: on my hardware this patch triggers a warning
(attached below).

Without it the rtc messages look like this:

[    2.783386] rtc_cmos 00:01: RTC can wake from S4
[    2.784302] rtc_cmos 00:01: registered as rtc0
[    2.785036] rtc_cmos 00:01: setting system clock to 2021-01-31T10:13:40 =
UTC (1612088020)
[    2.785713] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram=
, hpet irqs

Dirk

[    7.258410] ------------[ cut here ]------------
[    7.258414] WARNING: CPU: 2 PID: 0 at drivers/rtc/rtc-mc146818-lib.c:25 =
mc146818_get_time+0x2b/0x1e5
[    7.258420] Modules linked in: iwlmvm(+) mac80211 iwlwifi sdhci_pci amdg=
pu(+) drm_ttm_helper cfg80211 ttm cqhci gpu_sched sdhci ccp thinkpad_acpi(+=
) rng_core nvram tpm_tis(+) tpm_tis_core wmi tpm pinctrl_amd
[    7.258432] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G        W         5.=
11.0-rc5-next-20210129-x86_64 #180
[    7.258434] Hardware name: LENOVO 20U50008GE/20U50008GE, BIOS R19ET26W (=
1.10 ) 06/22/2020
[    7.258435] RIP: 0010:mc146818_get_time+0x2b/0x1e5
[    7.258437] Code: 56 41 55 45 31 ed 41 54 55 53 48 89 fb 48 c7 c7 bc d9 =
eb 82 e8 26 d8 36 00 bf 0d 00 00 00 48 89 c5 e8 6d d1 8f ff a8 7f 74 24 <0f=
> 0b 48 c7 c7 bc d9 eb 82 48 89 ee e8 bc d6 36 00 b0 ff b9 24 00
[    7.258438] RSP: 0018:ffffc9000022cef0 EFLAGS: 00010002
[    7.258440] RAX: 0000000000000031 RBX: ffffc9000022cf24 RCX: 00000000000=
00000
[    7.258441] RDX: 0000000000000001 RSI: ffff888105607000 RDI: 00000000000=
0000d
[    7.258441] RBP: 0000000000000046 R08: ffffc9000022cf24 R09: 00000000000=
00000
[    7.258442] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881056=
07000
[    7.258443] R13: 0000000000000000 R14: ffffc9000022cfa4 R15: 00000000000=
00000
[    7.258444] FS:  0000000000000000(0000) GS:ffff88840ec80000(0000) knlGS:=
0000000000000000
[    7.258445] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.258446] CR2: 00007f2ed26c4160 CR3: 000000000480a000 CR4: 00000000003=
50ee0
[    7.258447] Call Trace:
[    7.258449]  <IRQ>
[    7.258450]  hpet_rtc_interrupt+0xd3/0x1a3
[    7.258454]  __handle_irq_event_percpu+0x6b/0x12e
[    7.258457]  handle_irq_event_percpu+0x2c/0x6f
[    7.258459]  handle_irq_event+0x23/0x43
[    7.258461]  handle_edge_irq+0x9e/0xbb
[    7.258463]  asm_call_irq_on_stack+0x12/0x20
[    7.258467]  </IRQ>
[    7.258467]  common_interrupt+0x9a/0x123
[    7.258470]  asm_common_interrupt+0x1e/0x40
[    7.258472] RIP: 0010:cpuidle_enter_state+0x13e/0x1fe
[    7.258475] Code: 49 89 c4 e8 bd fd ff ff 31 ff e8 3e 80 92 ff 45 84 ff =
74 12 9c 58 0f ba e0 09 73 03 0f 0b fa 31 ff e8 13 16 96 ff fb 45 85 f6 <0f=
> 88 97 00 00 00 49 63 d6 4c 2b 24 24 48 6b ca 68 48 6b c2 30 4c
[    7.258476] RSP: 0018:ffffc90000167eb0 EFLAGS: 00000206
[    7.258477] RAX: ffff88840eca8240 RBX: ffff888101e0d400 RCX: 00000001b0a=
24b16
[    7.258478] RDX: 0000000000000002 RSI: 0000000000000002 RDI: 00000000000=
00000
[    7.258478] RBP: 0000000000000003 R08: 00000000ffffffff R09: 00000000000=
00000
[    7.258479] R10: ffff88810083c4a8 R11: 0000000000000000 R12: 00000001b0a=
24b48
[    7.258480] R13: ffffffff8299cc60 R14: 0000000000000003 R15: 00000000000=
00000
[    7.258482]  cpuidle_enter+0x2b/0x37
[    7.258483]  do_idle+0x126/0x184
[    7.258485]  cpu_startup_entry+0x18/0x1a
[    7.258486]  secondary_startup_64_no_verify+0xb0/0xbb
[    7.258489] ---[ end trace 9da59c3696ed99d8 ]---


> Reported-by: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> ---
> V2: Fixed the sizeof() as spotted by Micka=C3=ABl
> ---
>  drivers/rtc/rtc-cmos.c         |    8 ++++++++
>  drivers/rtc/rtc-mc146818-lib.c |    7 +++++++
>  2 files changed, 15 insertions(+)
>
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -805,6 +805,14 @@ cmos_do_probe(struct device *dev, struct
>=20=20
>  	spin_lock_irq(&rtc_lock);
>=20=20
> +	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> +	if ((CMOS_READ(RTC_VALID) & 0x7f) !=3D 0) {
> +		spin_unlock_irq(&rtc_lock);
> +		dev_warn(dev, "not accessible\n");
> +		retval =3D -ENXIO;
> +		goto cleanup1;
> +	}
> +
>  	if (!(flags & CMOS_RTC_FLAGS_NOFREQ)) {
>  		/* force periodic irq to CMOS reset default of 1024Hz;
>  		 *
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -21,6 +21,13 @@ unsigned int mc146818_get_time(struct rt
>=20=20
>  again:
>  	spin_lock_irqsave(&rtc_lock, flags);
> +	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> +	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x7f) !=3D 0)) {
> +		spin_unlock_irqrestore(&rtc_lock, flags);
> +		memset(time, 0xff, sizeof(*time));
> +		return 0;
> +	}
> +
>  	/*
>  	 * Check whether there is an update in progress during which the
>  	 * readout is unspecified. The maximum update time is ~2ms. Poll

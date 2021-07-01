Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63EB43B95C0
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Jul 2021 19:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhGAR7l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 1 Jul 2021 13:59:41 -0400
Received: from mx-out.tlen.pl ([193.222.135.148]:24324 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229844AbhGAR7j (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 1 Jul 2021 13:59:39 -0400
Received: (wp-smtpd smtp.tlen.pl 5413 invoked from network); 1 Jul 2021 19:57:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1625162226; bh=hHjyh2pu3jaUYOqbd8TsnsK2dNOcTV7XjIMeUGmnTNU=;
          h=Subject:From:To:Cc;
          b=LVxiLODg5VNiqeeCVSXTWFPskQ9KThkfdmYj5Z/u3p5EmLHNdzsfrDQiBNTX0w3Zj
           +37seRNmLfugcwUiT8L49vT/qCA0y5D3bepxqBcQkEuHQ7MCLHHniTOzorV3qHoX0c
           OJ2SJQikgD188MmbD9PSzcvK81T7EMUaYOWYa1vg=
Received: from aafo138.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.144.138])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-rtc@vger.kernel.org>; 1 Jul 2021 19:57:06 +0200
Message-ID: <113c6933-28c8-91cf-f802-5a38417da749@o2.pl>
Date:   Thu, 1 Jul 2021 19:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:90.0) Gecko/20100101
 Thunderbird/90.0
Subject: Re: [BUG] RTC warning after "rtc: mc146818: Detect and handle broken
 RTCs"
Content-Language: en-GB
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>, alexandre.belloni@bootlin.com
References: <23b9f4ab-f510-7f1f-f504-272225518b25@o2.pl>
In-Reply-To: <23b9f4ab-f510-7f1f-f504-272225518b25@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 93ac152746c5e347f18c5db5f110d489
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000002 [8bEn]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Last thought:

Instead of checking for bit 6 in the CMOS register 0x0d, it could be
better to check if the hours register (CMOS register 0x04)
contains a sane value (lower then 25). If it contained 0xff,
something would be strange.

Also the stacktrace below should be sanely formatted:

W dniu 01.07.2021 o 19:34, Mateusz Jończyk pisze:

> Hello,
> On one of our home computers, the Linux RTC code since Linux 5.11 prints a warning message
> with a stacktrace in mc146818_get_time():
> [    0.351685] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.351685] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
> [    0.351685] pinctrl core: initialized pinctrl subsystem
> [    0.351685] ------------[ cut here ]------------
> [    0.351685] WARNING: CPU: 0 PID: 1 at drivers/rtc/rtc-mc146818-lib.c:25 mc146818_get_time+0x1d5/0x230
> [    0.351685] Modules linked in:
> [    0.351685] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0newdeb-mj4 #12
> [    0.351685] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A780GXH/128M, BIOS P1.70 05/14/2010
> [    0.351685] RIP: 0010:mc146818_get_time+0x1d5/0x230
> [    0.351685] Code: 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 4c 89 e6 48 c7 c7 b0 87 56 8f e8 6a 9e 2a 00 bf 58 89 41 00 e8 30 f8 d4 ff e9 43 fe ff ff <0f> 0b 48 c7 c7 b0 87 56 8f 4c 89 e6 e8 4a 9e 2a 00 48 c7 03 ff ff
> [    0.351685] RSP: 0018:ffffb618c001fda8 EFLAGS: 00010002
> [    0.351685] RAX: 00000000000000c0 RBX: ffffb618c001fde4 RCX: 0000000000000000
> [    0.351685] RDX: 0000000000000001 RSI: ffff9378c0456940 RDI: 000000000000000d
> [    0.351685] RBP: ffffb618c001fdd0 R08: ffff9378c0405b60 R09: 0000000000000000
> [    0.351685] R10: 0000000000000000 R11: 605640c07893ffff R12: 0000000000000246
> [    0.351685] R13: 0000000000000000 R14: ffffffff8f54f390 R15: 0000000000000000
> [    0.351685] FS:  0000000000000000(0000) GS:ffff9379d8000000(0000) knlGS:0000000000000000
> [    0.351685] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.351685] CR2: 0000000000000000 CR3: 0000000132810000 CR4: 00000000000006f0
> [    0.351685] Call Trace:
> [    0.351685]  ? wakeup_sources_sysfs_init+0x35/0x35
> [    0.351685]  early_resume_init+0x25/0x9c
> [    0.351685]  ? cn_proc_init+0x3f/0x3f
> [    0.351685]  do_one_initcall+0x48/0x1d0
> [    0.351685]  kernel_init_freeable+0x1dc/0x23a
> [    0.351685]  ? rest_init+0xba/0xba
> [    0.351685]  kernel_init+0xe/0x116
> [    0.351685]  ret_from_fork+0x22/0x30
> [    0.351685] ---[ end trace b30828ec3a66c652 ]---
> [    0.351685] PM: RTC time: 18446744073709551615:18446744073709551615:18446744073709551615, date: 1899-00-18446744073709551615
> [    0.351685] NET: Registered protocol family 16
> This happens every boot on affected kernels. Surprisingly, it appears that the local
> clock gets synchronized from the RTC code nonetheless.
> I have isolated the issue to the following commit:
> commit 211e5db19d15a721b2953ea54b8f26c2963720eb
> Author: Thomas Gleixner<tglx@linutronix.de>
> Date:   Tue Jan 26 18:02:11 2021 +0100
>      rtc: mc146818: Detect and handle broken RTCs
> which was modified later by commit ebb22a05943666155e6da04407cc6e913974c78c
>      rtc: mc146818: Dont test for bit 0-5 in Register D
> After reverting both commits on top of Linux 5.11, the warning disappears.
> The sum of these commits causes Linux kernel to check whether bit 6 in CMOS
> register 0x0D is unset and abort otherwise.
> This computer is a desktop with an ASRock A780GXH/128M motherboard and
> an AMD SB710 southbridge. The southbridge datasheet:
> https://developer.amd.com/wordpress/media/2012/10/43009_sb7xx_rrg_pub_1.00.pdf
> specifies (page 308) that bit 6 of register 0x0D is a scratchbit.
> Apparently, something had set it to 1.
> Reading CMOS register 0x0d with a test patch consistently returns 0xc0, even
> when it is done multiple times consecutively.
> Everything was tested on Ubuntu 20.04.
> Greetings,
> Mateusz Jończyk


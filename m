Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F166C3142B9
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Feb 2021 23:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhBHWS5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Feb 2021 17:18:57 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:55177 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhBHWS5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Feb 2021 17:18:57 -0500
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4BFAC240005;
        Mon,  8 Feb 2021 22:18:14 +0000 (UTC)
Date:   Mon, 8 Feb 2021 23:18:13 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     syzbot <syzbot+975f176f83908ae98694@syzkaller.appspotmail.com>
Cc:     a.zummo@towertech.it, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: WARNING in mc1NUM_get_time
Message-ID: <20210208221813.GE351084@piout.net>
References: <0000000000004cfe9f05ba976125@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000004cfe9f05ba976125@google.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 05/02/2021 06:10:18-0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    dd86e7fa Merge tag 'pci-v5.11-fixes-2' of git://git.kernel..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=147f29c4d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e83e68d0a6aba5f6
> dashboard link: https://syzkaller.appspot.com/bug?extid=975f176f83908ae98694
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+975f176f83908ae98694@syzkaller.appspotmail.com
> 

I believe this was found and fixed independently in:
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=timers/urgent&id=ebb22a05943666155e6da04407cc6e913974c78c

> ------------[ cut here ]------------
> WARNING: CPU: 2 PID: 11674 at drivers/rtc/rtc-mc146818-lib.c:25 mc146818_get_time+0x665/0x860 drivers/rtc/rtc-mc146818-lib.c:25
> Modules linked in:
> CPU: 2 PID: 11674 Comm: syz-executor.2 Not tainted 5.11.0-rc6-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
> RIP: 0010:mc146818_get_time+0x665/0x860 drivers/rtc/rtc-mc146818-lib.c:25
> Code: eb 4e e8 4e 49 c9 fb 4c 89 e6 48 c7 c7 e0 6b b9 8b e8 0f 4f 54 03 bf 58 89 41 00 e8 75 a9 33 fe e9 d5 f9 ff ff e8 2b 49 c9 fb <0f> 0b 48 c7 c7 e0 6b b9 8b 4c 89 e6 45 31 e4 e8 e7 4e 54 03 ba 24
> RSP: 0018:ffffc90000560d68 EFLAGS: 00010046
> RAX: 0000000080010002 RBX: dffffc0000000000 RCX: 0000000000000000
> RDX: ffff88806feaa3c0 RSI: ffffffff85a98a65 RDI: 0000000000000003
> RBP: ffffc90000560e00 R08: 0000000000000001 R09: 0000000000000022
> R10: ffffffff85a98462 R11: 0000000000000000 R12: 0000000000000046
> R13: 0000000000000022 R14: ffffc90000560f18 R15: ffff888010dd8000
> FS:  0000000000000000(0000) GS:ffff88802cc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000002c99708 CR3: 0000000066e59000 CR4: 0000000000150ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <IRQ>
>  hpet_rtc_interrupt+0x2b0/0x380 arch/x86/kernel/hpet.c:1358
>  __handle_irq_event_percpu+0x303/0x8f0 kernel/irq/handle.c:156
>  handle_irq_event_percpu kernel/irq/handle.c:196 [inline]
>  handle_irq_event+0x102/0x290 kernel/irq/handle.c:213
>  handle_edge_irq+0x25f/0xd00 kernel/irq/chip.c:819
>  asm_call_irq_on_stack+0xf/0x20
>  </IRQ>
>  __run_irq_on_irqstack arch/x86/include/asm/irq_stack.h:48 [inline]
>  run_irq_on_irqstack_cond arch/x86/include/asm/irq_stack.h:101 [inline]
>  handle_irq arch/x86/kernel/irq.c:230 [inline]
>  __common_interrupt arch/x86/kernel/irq.c:249 [inline]
>  common_interrupt+0x120/0x200 arch/x86/kernel/irq.c:239
>  asm_common_interrupt+0x1e/0x40 arch/x86/include/asm/idtentry.h:620
> RIP: 0010:lock_release+0x3d5/0x710 kernel/locking/lockdep.c:5450
> Code: 15 02 00 00 48 c7 c7 a0 aa 4b 89 e8 f5 ac a2 07 b8 ff ff ff ff 65 0f c1 05 78 2f a9 7e 83 f8 01 0f 85 67 01 00 00 ff 34 24 9d <48> b8 00 00 00 00 00 fc ff df 48 01 c5 48 c7 45 00 00 00 00 00 c7
> RSP: 0018:ffffc90001d076d0 EFLAGS: 00000246
> RAX: 0000000000000001 RBX: 07b81204c4a70325 RCX: ffffc90001d07720
> RDX: 1ffff1100dfd55a7 RSI: 0000000000000001 RDI: 0000000000000000
> RBP: 1ffff920003a0edc R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
> R13: 0000000000000002 R14: ffff88806feaad40 R15: ffff88806feaa3c0
>  zap_pte_range mm/memory.c:1264 [inline]
>  zap_pmd_range mm/memory.c:1368 [inline]
>  zap_pud_range mm/memory.c:1397 [inline]
>  zap_p4d_range mm/memory.c:1418 [inline]
>  unmap_page_range+0xe30/0x2640 mm/memory.c:1439
>  unmap_single_vma+0x198/0x300 mm/memory.c:1484
>  unmap_vmas+0x168/0x2e0 mm/memory.c:1516
>  exit_mmap+0x2b1/0x5a0 mm/mmap.c:3220
>  __mmput+0x122/0x470 kernel/fork.c:1082
>  mmput+0x53/0x60 kernel/fork.c:1103
>  exit_mm kernel/exit.c:501 [inline]
>  do_exit+0xb6a/0x2ae0 kernel/exit.c:812
>  do_group_exit+0x125/0x310 kernel/exit.c:922
>  get_signal+0x427/0x20f0 kernel/signal.c:2773
>  arch_do_signal_or_restart+0x2a8/0x1eb0 arch/x86/kernel/signal.c:811
>  handle_signal_work kernel/entry/common.c:147 [inline]
>  exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
>  exit_to_user_mode_prepare+0x148/0x250 kernel/entry/common.c:201
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
>  syscall_exit_to_user_mode+0x19/0x50 kernel/entry/common.c:302
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x465b09
> Code: Unable to access opcode bytes at RIP 0x465adf.
> RSP: 002b:00007f665e7a5218 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
> RAX: fffffffffffffe00 RBX: 000000000056bf68 RCX: 0000000000465b09
> RDX: 0000000000000000 RSI: 0000000000000080 RDI: 000000000056bf68
> RBP: 000000000056bf60 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 000000000056bf6c
> R13: 00007ffeb1baab0f R14: 00007f665e7a5300 R15: 0000000000022000
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

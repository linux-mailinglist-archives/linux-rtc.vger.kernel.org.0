Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29EE274D1E
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2019 13:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391890AbfGYLdE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 25 Jul 2019 07:33:04 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40820 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391826AbfGYLdE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 25 Jul 2019 07:33:04 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id D5BFF4BB800F198F5E40;
        Thu, 25 Jul 2019 19:32:58 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Thu, 25 Jul 2019 19:32:53 +0800
From:   Xiongfeng Wang <wangxiongfeng2@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wangxiongfeng2@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: [RFC PATCH] rtc: add a schedule point in 'rtc_timer_do_work'
Date:   Thu, 25 Jul 2019 19:30:30 +0800
Message-ID: <1564054230-32742-1-git-send-email-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When I ran the syzkaller testsuite, it prints out the following calltrace.

[  138.350029] rcu: INFO: rcu_sched self-detected stall on CPU
[  138.354703] rcu: 	2-....: (104998 ticks this GP) idle=ece/1/0x4000000000000002 softirq=2825/2825 fqs=26250
[  138.357771] 	(t=105005 jiffies g=8033 q=1)
[  138.358952] NMI backtrace for cpu 2
[  138.359954] CPU: 2 PID: 170 Comm: kworker/2:1 Not tainted 5.2.0-514.55.6.9.x86_64 #64
[  138.362212] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.10.2-0-g5f4c7b1-prebuilt.qemu-project.org 04/01/2014
[  138.365818] Workqueue: events rtc_timer_do_work
[  138.367122] Call Trace:
[  138.367815]  <IRQ>
[  138.368420]  dump_stack+0xa7/0xf9
[  138.369372]  nmi_cpu_backtrace+0xc2/0xd0
[  138.370516]  ? lapic_can_unplug_cpu+0xa0/0xa0
[  138.371747]  nmi_trigger_cpumask_backtrace+0x14e/0x190
[  138.373201]  rcu_dump_cpu_stacks+0x97/0xc5
[  138.374376]  rcu_sched_clock_irq+0x819/0x8d0
[  138.375571]  ? tick_sched_do_timer+0xb0/0xb0
[  138.376787]  ? tick_sched_do_timer+0xb0/0xb0
[  138.377991]  update_process_times+0x2d/0x60
[  138.379176]  tick_sched_handle+0x2f/0x70
[  138.381088]  tick_sched_timer+0x41/0x90
[  138.382170]  __hrtimer_run_queues+0x11b/0x580
[  138.383386]  hrtimer_interrupt+0x11b/0x280
[  138.384585]  smp_apic_timer_interrupt+0x7a/0x230
[  138.385909]  apic_timer_interrupt+0xf/0x20
[  138.387066]  </IRQ>
[  138.387668] RIP: 0010:debug_lockdep_rcu_enabled+0x6/0x30
[  138.389149] Code: 1f 44 00 00 0f 1f 44 00 00 f0 ff 05 94 08 32 01 c3 0f 1f 00 0f 1f 44 00 00 f0 ff 0d 84 08 32 01 c3 0f 1f 00 8b 0d 2e 59 54 01 <31> c0 85 c9 74 21 8b 15 c2 b8 54 01 85 d2 74 17 65 48 8b 04 25 c0
[  138.394395] RSP: 0018:ffffc9000080fd30 EFLAGS: 00000203 ORIG_RAX: ffffffffffffff13
[  138.397117] RAX: 0000000000000000 RBX: ffff88813b77de10 RCX: 0000000000000002
[  138.399104] RDX: 0000000000000000 RSI: ffffffff81886439 RDI: ffff88813b77de10
[  138.401128] RBP: ffffc9000080fe38 R08: 0000000000000000 R09: 0000000000000000
[  138.403149] R10: 0000000000000001 R11: 0000000000000013 R12: ffff88813b77de98
[  138.405147] R13: ffff88813bab0c00 R14: 1a15e2eb5cd98000 R15: 000000003b9aca00
[  138.407118]  ? rtc_timer_do_work+0x349/0x710
[  138.408344]  rtc_timer_do_work+0x35c/0x710
[  138.409516]  ? graph_unlock+0x41/0x80
[  138.410591]  ? process_one_work+0x1d4/0x710
[  138.412062]  process_one_work+0x272/0x710
[  138.413193]  ? process_one_work+0x1d4/0x710
[  138.414376]  worker_thread+0x58/0x520
[  138.415405]  kthread+0x120/0x160
[  138.416337]  ? process_one_work+0x710/0x710
[  138.417486]  ? kthread_bind+0x20/0x20
[  138.418526]  ret_from_fork+0x24/0x30

After looking into the syzkaller log, I found out it is caused by the
following procedure. Firstly, enable the update interrupt through ioctl
'RTC_UIE_ON'. Secondly, set the rtc time to be a far further time
through ioctl 'RTC_SET_TIME'. This will cause we stuck in
'rtc_timer_do_work()' because the expiring time of 'UIE' is far less
than the current rtc time. This patch add a schedule point to avoid the
RCU calltrace.

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/rtc/interface.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 72b7ddc4..0c8339d 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -911,6 +911,8 @@ void rtc_timer_do_work(struct work_struct *work)
 			timerqueue_add(&rtc->timerqueue, &timer->node);
 			trace_rtc_timer_enqueue(timer);
 		}
+
+		cond_resched();
 	}
 
 	/* Set next alarm */
-- 
1.7.12.4


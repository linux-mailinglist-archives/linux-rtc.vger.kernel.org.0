Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5224DDE0E8
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 00:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfJTWek (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Oct 2019 18:34:40 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:35555 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfJTWek (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Oct 2019 18:34:40 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2A11F1BF20D;
        Sun, 20 Oct 2019 22:34:36 +0000 (UTC)
Date:   Mon, 21 Oct 2019 00:34:36 +0200
From:   Alexandre Belloni <alexandre.belloni@free-electrons.com>
To:     Jiwei Sun <jiwei.sun@windriver.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: adjust the next alarm expiring time to avoid a
 softlockups.
Message-ID: <20191020223436.GQ3125@piout.net>
References: <1523872415-326-1-git-send-email-jiwei.sun@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523872415-326-1-git-send-email-jiwei.sun@windriver.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Jiwei,

I know this has been more than a year but I didn't apply that patch
because I was suspecting that the end result was not correct. I took
some time today to verify that and indeed, this is almost right but it
causes a spurious update going to userspace just after SET_TIME is
called. This had to be eliminated.

I'm sending a patch fixing that now.

On 16/04/2018 17:53:35+0800, Jiwei Sun wrote:
> When run the following test case,
> 
> /*
>  * This expects the new RTC class driver framework, working with
>  * clocks that will often not be clones of what the PC-AT had.
>  * Use the command line to specify another RTC if you need one.
>  */
> static const char default_rtc[] = "/dev/rtc0";
> int main(int argc, char **argv)
> {
> 	int i, fd, retval;
> 	unsigned long data;
> 	struct rtc_time rtc_tm;
> 	const char *rtc = default_rtc;
> 
> 	fd = open(rtc, O_RDONLY);
> 	if (fd == -1) {
> 		perror(rtc);
> 		exit(errno);
> 	}
> 
> 	retval = ioctl(fd, RTC_RD_TIME, &rtc_tm);
> 	if (retval == -1) {
> 		perror("RTC_RD_TIME ioctl");
> 		exit(errno);
> 	}
> 
> 	// Setting time 1970
> 	rtc_tm.tm_year = 70;
> 	retval = ioctl(fd, RTC_SET_TIME, &rtc_tm);
> 	if (retval == -1) {
> 		perror("RTC_SET_TIME ioctl");
> 		exit(errno);
> 	}
> 
> 	/* Turn on update interrupts (one per second) */
> 	retval = ioctl(fd, RTC_UIE_ON, 0);
> 	if (retval == -1) {
> 		if (errno == ENOTTY) {
> 			fprintf(stderr,
> 				"\n...Update IRQs not supported.\n");
> 			goto done;
> 		}
> 		perror("RTC_UIE_ON ioctl");
> 		exit(errno);
> 	}
> 
> 	fprintf(stderr, "Counting 5 update (1/sec) interrupts from reading %s:",
> 			rtc);
> 	fflush(stderr);
> 
> 	for (i=1; i<6; i++) {
> 		if (i == 3) {
> 			// Setting new time 2030
> 			rtc_tm.tm_year = 130;
> 			retval = ioctl(fd, RTC_SET_TIME, &rtc_tm);
> 			if (retval == -1) {
> 				perror("RTC_SET_TIME ioctl");
> 				exit(errno);
> 			}
> 		}
> 
> 		/* This read will block */
> 		retval = read(fd, &data, sizeof(unsigned long));
> 		if (retval == -1) {
> 			perror("read");
> 			exit(errno);
> 		}
> 		fprintf(stderr, " %d, 0x%lx",i, data);
> 		fflush(stderr);
> 	}
> 
> 	/* Turn off update interrupts */
> 	retval = ioctl(fd, RTC_UIE_OFF, 0);
> 	if (retval == -1) {
> 		perror("RTC_UIE_OFF ioctl");
> 		exit(errno);
> 	}
> 
> done:
> 	fprintf(stderr, "\n\n\t\t\t *** Test complete ***\n");
> 
> 	close(fd);
> 
> 	return 0;
> }
> 
> there will be the following call trace in the preempt kernel.
> If the kernel is non-preempt, the softlockups will happen.
> 
> [   29.928336] INFO: rcu_sched self-detected stall on CPU
> [   29.928336] 	2-....: (20934 ticks this GP) idle=f4a/1/4611686018427387906 softirq=754/754 fqs=4704
> [   29.928336] 	 (t=21000 jiffies g=55 c=54 q=42)
> [   29.928336] NMI backtrace for cpu 2
> [   29.928336] CPU: 2 PID: 49 Comm: kworker/2:1 Not tainted 4.16.0 #5
> [   29.928336] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01/01/2011
> [   29.928336] Workqueue: events rtc_timer_do_work
> [   29.928336] Call Trace:
> [   29.928336]  <IRQ>
> [   29.928336]  dump_stack+0x46/0x64
> [   29.928336]  nmi_cpu_backtrace+0xba/0xc0
> [   29.928336]  ? lapic_can_unplug_cpu+0x90/0x90
> [   29.928336]  nmi_trigger_cpumask_backtrace+0x95/0xd0
> [   29.928336]  rcu_dump_cpu_stacks+0x84/0xb4
> [   29.928336]  rcu_check_callbacks+0x6b5/0x800
> [   29.928336]  ? tick_sched_do_timer+0x40/0x40
> [   29.928336]  update_process_times+0x23/0x50
> [   29.928336]  tick_sched_handle+0x21/0x50
> [   29.928336]  tick_sched_timer+0x2f/0x60
> [   29.928336]  __hrtimer_run_queues+0xe4/0x240
> [   29.928336]  hrtimer_interrupt+0x11d/0x270
> [   29.928336]  smp_apic_timer_interrupt+0x51/0x120
> [   29.928336]  apic_timer_interrupt+0xf/0x20
> [   29.928336]  </IRQ>
> [   29.928336] RIP: 0010:_raw_spin_unlock_irqrestore+0x5/0x10
> [   29.928336] RSP: 0018:ffff9db0801abd50 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff12
> [   29.928336] RAX: 0000000000000286 RBX: ffff8dfb869fe800 RCX: 00000000cbfa5590
> [   29.928336] RDX: 0000000000000000 RSI: 0000000000000286 RDI: ffff8dfb869febb0
> [   29.928336] RBP: ffff8dfb869febb0 R08: 0000000000000000 R09: ffff9db0801abcf8
> [   29.928336] R10: 0000000000000010 R11: 0000000000000001 R12: 0000000000000286
> [   29.928336] R13: 0000000000000001 R14: ffff8dfb869fe800 R15: ffff8dfb869fec20
> [   29.928336]  rtc_handle_legacy_irq+0x79/0xb0
> [   29.928336]  rtc_timer_do_work+0xcc/0x200
> [   29.928336]  process_one_work+0x136/0x330
> [   29.928336]  worker_thread+0x3f/0x3b0
> [   29.928336]  kthread+0xf0/0x130
> [   29.928336]  ? process_one_work+0x330/0x330
> [   29.928336]  ? kthread_bind+0x10/0x10
> [   29.928336]  ? call_usermodehelper_exec_async+0x10f/0x110
> [   29.928336]  ret_from_fork+0x35/0x40
> [   29.934096] INFO: rcu_sched detected stalls on CPUs/tasks:
> [   29.934096] 	2-....: (20935 ticks this GP) idle=f4a/1/4611686018427387904 softirq=754/754 fqs=4704
> [   29.934096] 	(detected by 3, t=21019 jiffies, g=55, c=54, q=42)
> [   29.934096] Sending NMI from CPU 3 to CPUs 2:
> [   29.948423] NMI backtrace for cpu 2
> [   29.948423] CPU: 2 PID: 49 Comm: kworker/2:1 Not tainted 4.16.0 #5
> [   29.948423] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01/01/2011
> [   29.952553] Workqueue: events rtc_timer_do_work
> [   29.952553] RIP: 0010:__wake_up_common+0x0/0x120
> [   29.952553] RSP: 0018:ffff9db0801abcf0 EFLAGS: 00000046
> [   29.952553] RAX: 0000000000000292 RBX: ffff8dfb869feb88 RCX: 0000000000000000
> [   29.952553] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff8dfb869feb88
> [   29.952553] RBP: 0000000000000001 R08: 0000000000000000 R09: ffff9db0801abcf8
> [   29.952553] R10: 0000000000000010 R11: 0000000000000001 R12: 0000000000000292
> [   29.952553] R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
> [   29.952553] FS:  0000000000000000(0000) GS:ffff8dfb87d00000(0000) knlGS:0000000000000000
> [   29.952553] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   29.952553] CR2: 00007fff0ee7a9f0 CR3: 00000000062b2000 CR4: 00000000000006e0
> [   29.952553] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   29.952553] DR3: 0000000000000000 DR6: 0000000000000000 DR7: 0000000000000000
> [   29.952553] Call Trace:
> [   29.952553]  __wake_up_common_lock+0x65/0x90
> [   29.952553]  rtc_handle_legacy_irq+0x91/0xb0
> [   29.952553]  rtc_timer_do_work+0xcc/0x200
> [   29.952553]  process_one_work+0x136/0x330
> [   29.952553]  worker_thread+0x3f/0x3b0
> [   29.952553]  kthread+0xf0/0x130
> [   29.952553]  ? process_one_work+0x330/0x330
> [   29.952553]  ? kthread_bind+0x10/0x10
> [   29.952553]  ? call_usermodehelper_exec_async+0x10f/0x110
> [   29.952553]  ret_from_fork+0x35/0x40
> [   29.952553] Code: 90 90 90 90 90 90 90 90 90 90 90 48 8d 47 08 c7 07 00 00 00 00 48 89 47 08 48 89 47 10 c3 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 <41> 57 41 56 4d 89 c6 41 55 41 54 55 4c 89 cd 53 48 83 ec 10 4d
> [   29.952553] INFO: NMI handler (nmi_cpu_backtrace_handler) took too long to run: 6.037 msecs
> 
> The root cause is as following.
> When the hardware clock's time is modified later than the periodic
> alarm clock's expire time, the rtc_timer_do_work's loop may spend
> a long time to process.
> In order to avoid the case, we can adjust the next expire time to
> equating to "now + period".
> 
> Signed-off-by: Jiwei Sun <jiwei.sun@windriver.com>
> ---
>  drivers/rtc/interface.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index 672b192..d76eceb 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -877,6 +877,9 @@ void rtc_timer_do_work(struct work_struct *work)
>  
>  		/* Re-add/fwd periodic timers */
>  		if (ktime_to_ns(timer->period)) {
> +			if (now - next->expires > timer->period)
> +				timer->node.expires = now;
> +
>  			timer->node.expires = ktime_add(timer->node.expires,
>  							timer->period);
>  			timer->enabled = 1;
> -- 
> 1.9.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

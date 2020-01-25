Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F8E1497DB
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Jan 2020 21:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgAYU4h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Jan 2020 15:56:37 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:41513 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgAYU4h (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Jan 2020 15:56:37 -0500
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 96FF5100006;
        Sat, 25 Jan 2020 20:56:35 +0000 (UTC)
Date:   Sat, 25 Jan 2020 21:56:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/3] rtc: cmos: Stop using shared IRQ
Message-ID: <20200125205635.GB2952@piout.net>
References: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/01/2020 15:14:35+0200, Andy Shevchenko wrote:
> As reported by Guilherme G. Piccoli:
> 
> ---8<---8<---8<---
> 
> The rtc-cmos interrupt setting was changed in the commit 079062b28fb4
> ("rtc: cmos: prevent kernel warning on IRQ flags mismatch") in order
> to allow shared interrupts; according to that commit's description,
> some machine got kernel warnings due to the interrupt line being shared
> between rtc-cmos and other hardware, and rtc-cmos didn't allow IRQ sharing
> that time.
> 
> After the aforementioned commit though it was observed a huge increase
> in lost HPET interrupts in some systems, observed through the following
> kernel message:
> 
> [...] hpet1: lost 35 rtc interrupts
> 
> After investigation, it was narrowed down to the shared interrupts
> usage when having the kernel option "irqpoll" enabled. In this case,
> all IRQ handlers are called for non-timer interrupts, if such handlers
> are setup in shared IRQ lines. The rtc-cmos IRQ handler could be set to
> hpet_rtc_interrupt(), which will produce the kernel "lost interrupts"
> message after doing work - lots of readl/writel to HPET registers, which
> are known to be slow.
> 
> Although "irqpoll" is not a default kernel option, it's used in some contexts,
> one being the kdump kernel (which is an already "impaired" kernel usually
> running with 1 CPU available), so the performance burden could be considerable.
> Also, the same issue would happen (in a shorter extent though) when using
> "irqfixup" kernel option.
> 
> In a quick experiment, a virtual machine with uptime of 2 minutes produced
> >300 calls to hpet_rtc_interrupt() when "irqpoll" was set, whereas without
> sharing interrupts this number reduced to 1 interrupt. Machines with more
> hardware than a VM should generate even more unnecessary HPET interrupts
> in this scenario.
> 
> ---8<---8<---8<---
> 
> After looking into the rtc-cmos driver history and DSDT table from
> the Microsoft Surface 3, we may notice that Hans de Goede submitted
> a correct fix (see dependency below). Thus, we simply revert
> the culprit commit.
> 
> Fixes: 079062b28fb4 ("rtc: cmos: prevent kernel warning on IRQ flags mismatch")
> Depends-on: a1e23a42f1bd ("rtc: cmos: Do not assume irq 8 for rtc when there are no legacy irqs")
> Reported-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2: Added tags, rework scissors to avoid cutting commit message (Guilherme)
>  drivers/rtc/rtc-cmos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

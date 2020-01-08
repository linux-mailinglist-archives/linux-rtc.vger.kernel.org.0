Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB346134B91
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Jan 2020 20:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbgAHTkP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Jan 2020 14:40:15 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:51414 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgAHTkO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Jan 2020 14:40:14 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1ipHBU-0002tj-8s; Wed, 08 Jan 2020 20:40:04 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 92D781060B2; Wed,  8 Jan 2020 20:40:03 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, kernel@gpiccoli.net
Subject: Re: [PATCH] rtc: cmos: Don't enable shared interrupts if using HPET-based IRQ handler
In-Reply-To: <20200108174111.GD32742@smile.fi.intel.com>
References: <20200103140240.6507-1-gpiccoli@canonical.com> <20200108174111.GD32742@smile.fi.intel.com>
Date:   Wed, 08 Jan 2020 20:40:03 +0100
Message-ID: <87h815ybxo.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> On Fri, Jan 03, 2020 at 11:02:40AM -0300, Guilherme G. Piccoli wrote:
 
>> This patch changes this behavior by preventing shared interrupts if the
>> HPET-based IRQ handler is used instead of the regular cmos_interrupt()
>> one. Although "irqpoll" is not a default kernel option, it's used in
>> some contexts, one being the kdump kernel (which is an already "impaired"
>> kernel usually running with 1 CPU available), so the performance burden
>> could be considerable. Also, the same issue would happen (in a shorter
>> extent though) when using "irqfixup" kernel option.
...
>> Hi all, thanks for reading/reviewing this patch! One of the
>> alternatives I considered in case sharing interrupts are really
>> desirable is a new kernel parameter to rtc-cmos to allow
>> sharing interrupts, and default the IRQ setup to non-shared.
>> 
>> We could also disable sharing if "irqpoll" or "irqfixup" is set,
>> but this would somewhat "bypass" IRQ code API which I think would
>> be a bit ugly.
>> 
>> Please let me know your thoughts, and thanks in advance.
>
> I think you may ask for Thomas' opinion (Cc'ed now).

I'm a bit wary with binding this to the fact that the HPET is
involved.

Especially I don't know whether the Surface3 which is Intel based
exposes the HPET via ACPI which would pretty much revert the effect of
the mentioned commit which introduced the IRQF_SHARED magic especially
for Surface3.

As this is a Surface3 specific misfeature, it might be trivial enough to
set IRQF_SHARED based on a DMI quirk for the Surface3.

Thanks,

        tglx



Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 884DC13498F
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Jan 2020 18:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgAHRlO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Jan 2020 12:41:14 -0500
Received: from mga11.intel.com ([192.55.52.93]:9313 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728477AbgAHRlO (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 8 Jan 2020 12:41:14 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 09:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="421512897"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jan 2020 09:41:10 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ipFKR-00067E-Tq; Wed, 08 Jan 2020 19:41:11 +0200
Date:   Wed, 8 Jan 2020 19:41:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, kernel@gpiccoli.net,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] rtc: cmos: Don't enable shared interrupts if using
 HPET-based IRQ handler
Message-ID: <20200108174111.GD32742@smile.fi.intel.com>
References: <20200103140240.6507-1-gpiccoli@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103140240.6507-1-gpiccoli@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 03, 2020 at 11:02:40AM -0300, Guilherme G. Piccoli wrote:
> The rtc-cmos interrupt setting was changed in commit 079062b28fb4
> ("rtc: cmos: prevent kernel warning on IRQ flags mismatch") in order to
> allow shared interrupts; according to that commit's description, some
> machine got kernel warnings due to the interrupt line being shared
> between rtc-cmos and other hardware, and rtc-cmos didn't allow IRQ
> sharing that time.
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
> This patch changes this behavior by preventing shared interrupts if the
> HPET-based IRQ handler is used instead of the regular cmos_interrupt()
> one. Although "irqpoll" is not a default kernel option, it's used in
> some contexts, one being the kdump kernel (which is an already "impaired"
> kernel usually running with 1 CPU available), so the performance burden
> could be considerable. Also, the same issue would happen (in a shorter
> extent though) when using "irqfixup" kernel option.
> 
> In a quick experiment, a virtual machine with uptime of 2 minutes produced
> >300 calls to hpet_rtc_interrupt() when "irqpoll" was set, whereas without
> sharing interrupts this number reduced to 1 interrupt. Machines with more
> hardware than a VM should generate even more unnecessary HPET interrupts
> in this scenario.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> ---
> 
> 
> Hi all, thanks for reading/reviewing this patch! One of the
> alternatives I considered in case sharing interrupts are really
> desirable is a new kernel parameter to rtc-cmos to allow
> sharing interrupts, and default the IRQ setup to non-shared.
> 
> We could also disable sharing if "irqpoll" or "irqfixup" is set,
> but this would somewhat "bypass" IRQ code API which I think would
> be a bit ugly.
> 
> Please let me know your thoughts, and thanks in advance.

I think you may ask for Thomas' opinion (Cc'ed now).

> 
> Guilherme
> 
> 
>  drivers/rtc/rtc-cmos.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 033303708c8b..16416154eb00 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -710,6 +710,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
>  	unsigned char			rtc_control;
>  	unsigned			address_space;
>  	u32				flags = 0;
> +	unsigned long			irq_flags;
>  	struct nvmem_config nvmem_cfg = {
>  		.name = "cmos_nvram",
>  		.word_size = 1,
> @@ -839,6 +840,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
>  
>  		if (use_hpet_alarm()) {
>  			rtc_cmos_int_handler = hpet_rtc_interrupt;
> +			irq_flags = 0;
>  			retval = hpet_register_irq_handler(cmos_interrupt);
>  			if (retval) {
>  				hpet_mask_rtc_irq_bit(RTC_IRQMASK);
> @@ -846,11 +848,13 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
>  						" failed in rtc_init().");
>  				goto cleanup1;
>  			}
> -		} else
> +		} else {
>  			rtc_cmos_int_handler = cmos_interrupt;
> +			irq_flags = IRQF_SHARED;
> +		}
>  
>  		retval = request_irq(rtc_irq, rtc_cmos_int_handler,
> -				IRQF_SHARED, dev_name(&cmos_rtc.rtc->dev),
> +				irq_flags, dev_name(&cmos_rtc.rtc->dev),
>  				cmos_rtc.rtc);
>  		if (retval < 0) {
>  			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
> -- 
> 2.24.0
> 

-- 
With Best Regards,
Andy Shevchenko



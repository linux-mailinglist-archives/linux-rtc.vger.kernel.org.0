Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05EBB33D3E3
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 13:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhCPMcu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 08:32:50 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:57769 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbhCPMc2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 08:32:28 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B317EFF80A;
        Tue, 16 Mar 2021 12:32:20 +0000 (UTC)
Date:   Tue, 16 Mar 2021 13:32:20 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ds1307: set uie_unsupported if no interrupt is
 available
Message-ID: <YFClVBShBuy9/VPY@piout.net>
References: <YE/ZLtdK0ZlVFOhp@piout.net>
 <20210305174411.9657-1-l.stelmach@samsung.com>
 <CGME20210316121218eucas1p1f74d6e6cec7fc897051902a7da478fd0@eucas1p1.samsung.com>
 <dleftj1rcfe1rb.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dleftj1rcfe1rb.fsf%l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/03/2021 13:12:08+0100, Lukasz Stelmach wrote:
> It was <2021-03-15 pon 23:01>, when Alexandre Belloni wrote:
> > Hello,
> >
> > On 05/03/2021 18:44:11+0100, Łukasz Stelmach wrote:
> >> For an RTC without an IRQ assigned rtc_update_irq_enable() should
> >> return -EINVAL.  It will, when uie_unsupported is set.
> >> 
> >
> > I'm surprised this is an issue because the current code seems to cover
> > all cases:
> >
> >  - no irq and not wakeup-source => set_alarm should fail
> >  - no irq and wakeup-source => uie_unsupported is set
> >  - irq => UIE should work
> >
> > Can you elaborate on your failing use case?
> 
> I've got ds3231 which supports alarms[1] but is not connected to any
> interrupt line. Hence, client->irq is 0 as well as want_irq[2]. There
> is also no other indirect connection, so I don't set wakeup-source
> property and ds1307_can_wakeup_device remains[3] false. Under these
> conditions
> 
>     want_irq = 0
>     ds1307_can_wakeup_device = false
> 
> uie_unsupported remains[4] false. And this is the problem.
> 
> hwclock(8) when setting system clock from rtc (--hctosys) calls
> synchronize_to_clock_tick_rtc()[5]. There goes
> 
>     ioctl(rtc_fd, RTC_UIE_ON, 0);
> 
> which leads us to
> 
>     rtc_update_irq_enable(rtc, 1);
> 
> and finally here [6]
> 
>     if (rtc->uie_unsupported) {
>         err = -EINVAL;
>         goto out;
>     }
> 
> and we keep going (uie_unsupported = 0). All the following operations
> succeed because chip supports alarms.
> 

But then, HAS_ALARM is not set and ds1337_set_alarm should fail which
makes rtc_timer_enqueue return an error. I admit this whole part is a
mess, I'm just trying to understand how you can hit that.

> We go back to hwclock(8) and we start waiting[7] for the update from
> interrupt which never arrives instead of calling
> busywiat_for_rtc_clock_tick()[8] (mind the invalid indentation) because
> of EINVAL returned from ioctl() (conf. [6])
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-ds1307.c?h=v5.11#n1032
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-ds1307.c?h=v5.11#n1779
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-ds1307.c?h=v5.11#n1802
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-ds1307.c?h=v5.11#n1977
> [5] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/sys-utils/hwclock-rtc.c?h=v2.36.2#n252
> [6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/interface.c?h=v5.11#n564
> [7] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/sys-utils/hwclock-rtc.c?h=v2.36.2#n283
> [8] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/sys-utils/hwclock-rtc.c?h=v2.36.2#n297
> 
> >> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> >> ---
> >>  drivers/rtc/rtc-ds1307.c | 14 +++++++-------
> >>  1 file changed, 7 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> >> index cd8e438bc9c4..b08a9736fa77 100644
> >> --- a/drivers/rtc/rtc-ds1307.c
> >> +++ b/drivers/rtc/rtc-ds1307.c
> >> @@ -1973,13 +1973,6 @@ static int ds1307_probe(struct i2c_client *client,
> >>  	if (IS_ERR(ds1307->rtc))
> >>  		return PTR_ERR(ds1307->rtc);
> >>  
> >> -	if (ds1307_can_wakeup_device && !want_irq) {
> >> -		dev_info(ds1307->dev,
> >> -			 "'wakeup-source' is set, request for an IRQ is disabled!\n");
> >> -		/* We cannot support UIE mode if we do not have an IRQ line */
> >> -		ds1307->rtc->uie_unsupported = 1;
> >> -	}
> >> -
> >>  	if (want_irq) {
> >>  		err = devm_request_threaded_irq(ds1307->dev, client->irq, NULL,
> >>  						chip->irq_handler ?: ds1307_irq,
> >> @@ -1993,6 +1986,13 @@ static int ds1307_probe(struct i2c_client *client,
> >>  		} else {
> >>  			dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);
> >>  		}
> >> +	} else {
> >> +		if (ds1307_can_wakeup_device)
> >> +			dev_info(ds1307->dev,
> >> +				 "'wakeup-source' is set, request for an IRQ is disabled!\n");
> >> +
> >
> > Honestly, just drop this message, it should have been removed by 82e2d43f6315
> >
> >
> 
> Done.
> 
> >> +		/* We cannot support UIE mode if we do not have an IRQ line */
> >> +		ds1307->rtc->uie_unsupported = 1;
> >>  	}
> >>  
> >>  	ds1307->rtc->ops = chip->rtc_ops ?: &ds13xx_rtc_ops;
> >> -- 
> >> 2.26.2
> >> 
> 
> -- 
> Łukasz Stelmach
> Samsung R&D Institute Poland
> Samsung Electronics



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

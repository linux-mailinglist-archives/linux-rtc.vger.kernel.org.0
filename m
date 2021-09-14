Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E2740A913
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Sep 2021 10:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhINIX7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Sep 2021 04:23:59 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:48687 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhINIX6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Sep 2021 04:23:58 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 96022200011;
        Tue, 14 Sep 2021 08:22:39 +0000 (UTC)
Date:   Tue, 14 Sep 2021 10:22:39 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Xiaofei Tan <tanxiaofei@huawei.com>
Subject: Re: [PATCH 7/7] Revert "rtc: cmos: Replace spin_lock_irqsave with
 spin_lock in hard IRQ"
Message-ID: <YUBbzzHfmxiafJUs@piout.net>
References: <20210912124214.81853-1-mat.jonczyk@o2.pl>
 <20210912124214.81853-8-mat.jonczyk@o2.pl>
 <YUBXL7hnd42GwBn9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUBXL7hnd42GwBn9@intel.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/09/2021 11:02:55+0300, Ville Syrjälä wrote:
> On Sun, Sep 12, 2021 at 02:42:14PM +0200, Mateusz Jończyk wrote:
> > Revert
> > commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
> > and add a comment.
> > 
> > As described in a previous
> > commit 66e4f4a9cc38 ("rtc: cmos: Use spin_lock_irqsave() in cmos_interrupt()")
> > from February 2020:
> > 
> >         cmos_interrupt() isn't always called from hardirq context, so
> >         we must use spin_lock_irqsave() & co.
> > 
> > Indeed, cmos_interrupt() is called from cmos_check_wkalrm(), which is
> > called from cmos_resume() - apparently not in an interrupt context.
> > 
> > A later
> > commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
> > did not take account of this and changed spin_lock_irqsave() to spin_lock().
> > This may cause a deadlock as quoted in the body of
> > commit 66e4f4a9cc38 ("rtc: cmos: Use spin_lock_irqsave() in cmos_interrupt()")
> > mentioned earlier.
> 
> This regression was supposed to be fixed by
> https://lore.kernel.org/linux-rtc/20210305122140.28774-1-chris@chris-wilson.co.uk/
> 
> What happened to that one? I don't see it in Linus's tree...
> 

Yes, that's exactly what I was wondering when seeing that patch and it
still sits in my rtc-fixes branch that I forgot to send to Linus...

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

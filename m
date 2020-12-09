Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6F02D3953
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Dec 2020 04:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgLIDwi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Dec 2020 22:52:38 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57829 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgLIDwh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Dec 2020 22:52:37 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8F320C0002;
        Wed,  9 Dec 2020 03:51:55 +0000 (UTC)
Date:   Wed, 9 Dec 2020 04:51:55 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 6/8] ntp, rtc: Move rtc_set_ntp_time() to ntp code
Message-ID: <20201209035155.GA1245199@piout.net>
References: <20201206214613.444124194@linutronix.de>
 <20201206220542.166871172@linutronix.de>
 <20201207205952.GL5487@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207205952.GL5487@ziepe.ca>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 07/12/2020 16:59:52-0400, Jason Gunthorpe wrote:
> On Sun, Dec 06, 2020 at 10:46:19PM +0100, Thomas Gleixner wrote:
> > rtc_set_ntp_time() is not really RTC functionality as the code is just a
> > user of RTC. Move it into the NTP code which allows further cleanups.
> > 
> > Requested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > ---
> >  drivers/rtc/Makefile  |    1 
> >  drivers/rtc/systohc.c |   61 ----------------------------------
> >  include/linux/rtc.h   |   34 -------------------
> >  kernel/time/ntp.c     |   88 ++++++++++++++++++++++++++++++++++++++++++++++++--
> >  4 files changed, 85 insertions(+), 99 deletions(-)
> 
> Fair enough, it is asymmetric with how HCTOSYS works, but not a big
> deal
> 

It is already asymmetric as hctosys will always happen as soon as the
rtc driver is loaded but systohc will only actually be called only if
ntp is enabled.

I must admit I did consider moving it ou of the rtc subsystem instead of
having it moved in class.c to solve the issue with rtc drivers compiled
as modules but I still carry the nasty BITS_PER_LONG check to keep
systemd happy on a 32bit userspace.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

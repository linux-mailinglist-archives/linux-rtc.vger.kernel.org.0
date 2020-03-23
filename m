Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB9F18FE6F
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 21:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgCWUGP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 16:06:15 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54683 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgCWUGP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Mar 2020 16:06:15 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B1FB8C0004;
        Mon, 23 Mar 2020 20:06:13 +0000 (UTC)
Date:   Mon, 23 Mar 2020 21:06:13 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Steve Muckle <smuckle@google.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        LKML <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org,
        "Cc: Android Kernel" <kernel-team@android.com>
Subject: Re: [PATCH] rtc: class: support hctosys from modular RTC drivers
Message-ID: <20200323200508.GA16405@piout.net>
References: <20191106194625.116692-1-smuckle@google.com>
 <20191106231923.GK8309@piout.net>
 <b96f085b-8a0c-7c71-4fde-8af83d49823a@google.com>
 <20191115133627.GT3572@piout.net>
 <CAL21Ktd3JmRbkwPCCb77knXg4AWi0vWdU147sVaDaoWeEMauDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL21Ktd3JmRbkwPCCb77knXg4AWi0vWdU147sVaDaoWeEMauDQ@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/12/2019 12:23:23-0800, Steve Muckle wrote:
> On Fri, Nov 15, 2019 at 5:36 AM Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
> 
> > On 06/11/2019 15:37:49-0800, Steve Muckle wrote:
> > > On 11/6/19 3:19 PM, Alexandre Belloni wrote:
> > > > On 06/11/2019 11:46:25-0800, Steve Muckle wrote:
> > > > > Due to distribution constraints it may not be possible to statically
> > > > > compile the required RTC driver into the kernel.
> > > > >
> > > > > Expand RTC_HCTOSYS support to cover all RTC devices (statically
> > compiled
> > > > > or not) by checking at the end of RTC device registration whether the
> > > > > time should be synced.
> > > > >
> > > >
> > > > This does not really help distributions because most of them will still
> > > > have "rtc0" hardcoded and rtc0 is often the rtc that shouldn't be used.
> > >
> > > Just for my own edification, why is that? Is rtc0 normally useless on PC
> > for
> > > some reason?
> > >
> >
> > On PC, rtc0 is probably fine which is not the case for other
> > architectures where rtc0 is the SoC RTC and is often not battery backed.
> >
> > > On the platforms I'm working with I believe it can be assured that rtc0
> > will
> > > be the correct rtc. That doesn't help typical distributions though.
> > >
> > > What about a kernel parameter to optionally override the rtc hctosys
> > device
> > > at runtime?
> > >
> >
> > What about keeping that in userspace instead which is way easier than
> > messing with kernel parameters?
> >
> 
> This should ideally happen before file systems are mounted so I don't see
> many alternatives for communicating which RTC should be used. Android uses
> the kernel command line for userspace parameters as well and that's an
> option but that defeats part of the value of doing it in userspace IMO.
> There's also device tree but I'm not sure this belongs there.
> 
> Hctosys is also saving and restoring the system time on suspend/resume. It
> seems more efficient to me to do this (which happens very frequently on an
> Android device) in the kernel as opposed to in userspace.
> 
> If I set the initial system time from the rtc in userspace but continue to
> rely on the hctosys suspend/resume code, as it stands there will be a
> window after the rtc driver is loaded but before the system time is set
> where if suspend is entered, the correct time in the rtc will be lost.
> 
> > > Can't you move away from HCTOSYS and do the correct thing in userspace
> > > > instead of the crap hctosys is doing?
> > >
> > > Yes, I just figured it's a small change, and if hctosys can be made to
> > work
> > > might as well use that.
> >
> > The fact is that hctosys is more related to time keeping than it is to
> > the RTC subsytem. It also does a very poor job setting the system time
> > because adding 0.5s is not the smartest thing to do. The rtc granularity
> > is indeed 1 second but is can be very precisely set.
> >
> 
> No argument with that, but millions of devices successfully rely on it
> today. AFAICT this simple patch doesn't make anything worse. Together with
> a change to support a kernel parameter for runtime rtc selection, it should
> allow RTC drivers to be modularized on many systems. Can it be adopted as a
> stopgap measure?

I've applied this patch for 5.7 after removing the unnecessary
reformatting of the kconfig help.

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0901B3618
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2019 10:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730795AbfIPICW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Sep 2019 04:02:22 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:35441 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730792AbfIPICW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Sep 2019 04:02:22 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6536D20000A;
        Mon, 16 Sep 2019 08:02:19 +0000 (UTC)
Date:   Mon, 16 Sep 2019 10:02:19 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nick Crews <ncrews@chromium.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Duncan Laurie <dlaurie@google.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] rtc: wilco-ec: Sanitize values received from RTC
Message-ID: <20190916080219.GV21254@piout.net>
References: <20190910151929.780-1-ncrews@chromium.org>
 <20190912080953.GO21254@piout.net>
 <CAHX4x87M6opd5Ob_TRwCQ3mYgeFaV55DYiTYccM2cNX2nD3oYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHX4x87M6opd5Ob_TRwCQ3mYgeFaV55DYiTYccM2cNX2nD3oYA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/09/2019 23:44:03+0100, Nick Crews wrote:
> Hi Alexandre, thanks for the thoughts.
> 
> On Thu, Sep 12, 2019 at 9:09 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hi Nick,
> >
> > On 10/09/2019 16:19:29+0100, Nick Crews wrote:
> > > Check that the time received from the RTC HW is valid,
> > > otherwise the computation of rtc_year_days() in the next
> > > line could, and sometimes does, crash the kernel.
> > >
> > > While we're at it, fix the license to plain "GPL".
> > >
> > > Signed-off-by: Nick Crews <ncrews@chromium.org>
> > > ---
> > >  drivers/rtc/rtc-wilco-ec.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> > > index 8ad4c4e6d557..0ccbf2dce832 100644
> > > --- a/drivers/rtc/rtc-wilco-ec.c
> > > +++ b/drivers/rtc/rtc-wilco-ec.c
> > > @@ -110,8 +110,16 @@ static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
> > >       tm->tm_mday     = rtc.day;
> > >       tm->tm_mon      = rtc.month - 1;
> > >       tm->tm_year     = rtc.year + (rtc.century * 100) - 1900;
> > > -     tm->tm_yday     = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
> >
> > If your driver doesn't care about yday, userspace doesn't either. You
> > can simply not set it.
> 
> This driver indeed does not care about yday, so it sounds good to me
> to simply not set it. However, I do still want to worry about the HW
> returning some bogus time. It could be indicative of some other problem,
> and I don't want to pass on this illegal time further up the stack. I can't
> think of a reason why an illegal time should exist at all, we should just
> deal with it as soon as possible. How about I remove setting yday as
> you suggest, but still keep the rtc_valid_tm() check?
> 

As rtc_valid_tm would be the last thing the driver does in the callback
and the first thing the core does after returning from the callback,
you'd get two calls back to back which is not useful.

> >
> > >
> > > +     if (rtc_valid_tm(tm)) {
> > > +             dev_warn(dev,
> > > +                      "Time computed from EC RTC is invalid: sec=%d, min=%d, hour=%d, mday=%d, mon=%d, year=%d",
> > > +                      tm->tm_sec, tm->tm_min, tm->tm_hour, tm->mday,
> > > +                      tm->mon, tm->year);
> > > +             return -EIO;
> > > +     }
> > > +
> > > +     tm->tm_yday = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
> > >       /* Don't compute day of week, we don't need it. */
> > >       tm->tm_wday = -1;
> 
> Following our discussion, perhaps I'll just remove this too since the
> RTC core inits this to -1 already?
> 

You can remove it.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

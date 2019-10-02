Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389C2C4B76
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Oct 2019 12:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfJBKck (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Oct 2019 06:32:40 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58703 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfJBKck (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Oct 2019 06:32:40 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9674FE0007;
        Wed,  2 Oct 2019 10:32:37 +0000 (UTC)
Date:   Wed, 2 Oct 2019 12:32:36 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dmitry Torokhov <dtor@google.com>
Cc:     Nick Crews <ncrews@chromium.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, enric.balletbo@collabora.com,
        Benson Leung <bleung@chromium.org>, dlaurie@chromium.org,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v3] rtc: wilco-ec: Handle reading invalid times
Message-ID: <20191002103236.GM4106@piout.net>
References: <20190925203209.79941-1-ncrews@chromium.org>
 <20191001195342.GH4106@piout.net>
 <CAE_wzQ8ugGgRsjfQwfncxhmy4EDOxKdoNm8CJ5AF=Mc5N6X7WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE_wzQ8ugGgRsjfQwfncxhmy4EDOxKdoNm8CJ5AF=Mc5N6X7WQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 01/10/2019 13:42:24-0700, Dmitry Torokhov wrote:
> On Tue, Oct 1, 2019 at 12:53 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hi Nick,
> >
> > On 25/09/2019 14:32:09-0600, Nick Crews wrote:
> > > If the RTC HW returns an invalid time, the rtc_year_days()
> > > call would crash. This patch adds error logging in this
> > > situation, and removes the tm_yday and tm_wday calculations.
> > > These fields should not be relied upon by userspace
> > > according to man rtc, and thus we don't need to calculate
> > > them.
> > >
> > > Signed-off-by: Nick Crews <ncrews@chromium.org>
> > > ---
> > >  drivers/rtc/rtc-wilco-ec.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> > > index 8ad4c4e6d557..53da355d996a 100644
> > > --- a/drivers/rtc/rtc-wilco-ec.c
> > > +++ b/drivers/rtc/rtc-wilco-ec.c
> > > @@ -110,10 +110,15 @@ static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
> > >       tm->tm_mday     = rtc.day;
> > >       tm->tm_mon      = rtc.month - 1;
> > >       tm->tm_year     = rtc.year + (rtc.century * 100) - 1900;
> > > -     tm->tm_yday     = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
> > > -
> > > -     /* Don't compute day of week, we don't need it. */
> > > -     tm->tm_wday = -1;
> > > +     /* Ignore other tm fields, man rtc says userspace shouldn't use them. */
> > > +
> > > +     if (rtc_valid_tm(tm)) {
> > > +             dev_err(dev,
> > > +                      "Time from RTC is invalid: second=%u, minute=%u, hour=%u, day=%u, month=%u, year=%u, century=%u",
> > > +                      rtc.second, rtc.minute, rtc.hour, rtc.day, rtc.month,
> > > +                      rtc.year, rtc.century);
> >
> > Do you mind using %ptR? At this point you already filled the tm struct
> > anyway and if you print century separately, you can infer tm_year.
> 
> I do not think this is a good idea: we have just established that tm
> does not contain valid data. Does %ptR guarantee that it handles junk
> better than, let's say, rtc_year_days(), and does not crash when
> presented with garbage?
> 

It is safe to use. You can also use %ptRr if you want to ensure no
extra operations are done on the value before printing them out.

I'm still not convinced it is useful to have an error in dmesg when the
time is invalid, as long as userspace knows it is invalid. What is the
course of action for the end user when that happens?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

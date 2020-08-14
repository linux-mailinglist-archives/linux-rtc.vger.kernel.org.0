Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F4A244649
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Aug 2020 10:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgHNIPe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Aug 2020 04:15:34 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36111 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgHNIPd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Aug 2020 04:15:33 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E896F1BF204;
        Fri, 14 Aug 2020 08:15:30 +0000 (UTC)
Date:   Fri, 14 Aug 2020 10:15:30 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Victor Ding <victording@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: initialize rtc time when reading alarm
Message-ID: <20200814081530.GA6530@piout.net>
References: <20200813154020.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
 <20200813073325.GK3480@piout.net>
 <CANqTbdZhZL--JebFhZPkf2+VuCUs2b=Me-BoBHgAtt_MvQBX3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANqTbdZhZL--JebFhZPkf2+VuCUs2b=Me-BoBHgAtt_MvQBX3A@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/08/2020 16:10:13+1000, Victor Ding wrote:
> Hi Alexandre,
> 
> On Thu, Aug 13, 2020 at 5:33 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hi,
> >
> > On 13/08/2020 15:41:34+1000, Victor Ding wrote:
> > > cmos_read_alarm() may leave certain fields of a struct rtc_time
> > > untouched; therefore, these fields contain garbage if not properly
> > > initialized, leading to inconsistent values when converting into
> > > time64_t.
> > > This patch to set all fields of a struct rtc_time to -1 before calling
> > > cmos_read_alarm().
> > >
> >
> > I don't think this actually helps with the conversion as mktime64
> > is taking unsigned int so I would think you need the whole logic that is
> > in __rtc_read_alarm
> 
> It's true that this change does not produce a correct time64_t; however,
> it isn't the intention either. The proposed change only produces a
> consistent value: calling obtaining identical struct rtc_time if the CMOS
> wakealarm is unchanged. In the case of suspend/resume, a correct value
> time64_t is not necessary; a consistent value is sufficient to correctly
> perform an equality test for `t_current_expires` and `t_saved_expires`.
> Logic to deduce a correct time64_t is expensive and hence I would like to
> avoid __rtc_read_alarm's logic here.
> 
> Prior to this patch, the struct rtc_time is uninitialized. After calling
> cmos_read_alarm(), the tm_year field is always left untouched and hence
> contains only garbage. On platforms without enhanced RTC timers, the
> tm_mon and tm_mday fields are left with garbage as well. Therefore,
> `t_current_expires` and `t_saved_expires` from garbage data, which leads
> to incorrect equality test results.
> 

Seeing that saved_wkalrm is initialized to zero, wouldn't it be
sufficient to initialize current_alarm to 0? This can be done simply at
the declaration. I personally find the -1 to be confusing especially
since the result ends up being architecture dependent.

> >
> > > Signed-off-by: Victor Ding <victording@google.com>
> > > ---
> > >
> > >  drivers/rtc/rtc-cmos.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> > > index bcc96ab7793f..c99af567780d 100644
> > > --- a/drivers/rtc/rtc-cmos.c
> > > +++ b/drivers/rtc/rtc-cmos.c
> > > @@ -1006,6 +1006,7 @@ static int cmos_suspend(struct device *dev)
> > >                       enable_irq_wake(cmos->irq);
> > >       }
> > >
> > > +     memset(&cmos->saved_wkalrm.time, -1, sizeof(struct rtc_time));
> > >       cmos_read_alarm(dev, &cmos->saved_wkalrm);
> > >
> > >       dev_dbg(dev, "suspend%s, ctrl %02x\n",
> > > @@ -1054,6 +1055,7 @@ static void cmos_check_wkalrm(struct device *dev)
> > >               return;
> > >       }
> > >
> > > +     memset(&current_alarm.time, -1, sizeof(struct rtc_time));
> > >       cmos_read_alarm(dev, &current_alarm);
> > >       t_current_expires = rtc_tm_to_time64(&current_alarm.time);
> > >       t_saved_expires = rtc_tm_to_time64(&cmos->saved_wkalrm.time);
> > > --
> > > 2.28.0.236.gb10cc79966-goog
> > >
> >
> > --
> > Alexandre Belloni, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> Best regards,
> Victor Ding

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573612446A6
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Aug 2020 10:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgHNI4l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Aug 2020 04:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbgHNI4l (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Aug 2020 04:56:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DB3C061384
        for <linux-rtc@vger.kernel.org>; Fri, 14 Aug 2020 01:56:40 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k13so4461800lfo.0
        for <linux-rtc@vger.kernel.org>; Fri, 14 Aug 2020 01:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H74Cx0z7INlxIE76e/bwEKWBIIXIiyO99JQfsOTNz+c=;
        b=fC2m851EepP6y3+PUFFwoHaW8xxT6TI6FbzNMNPsrg/JesnhLqHkvJaxd5tFQycNf0
         V8FaaoydQbWXbrjgIO/bP5wYHxHfaqDANieNPmkvl/tXmwVOcxu5EnmicJvDUU7sPKpW
         P7iP6es/T3PsAln32FalesydnX2NRu0tcyI8TSRjKskSLY7FnpPbGJm7Pu9HkQ+menwx
         HN6z15CxIiQLGAI9aaUwCXe/3m7FQSGW8MNcMnntUVoKCKrtBp+05mvNQYu/jJDc1jjL
         4zAwt2obtcCp1SPvas74t295EvGSCo6p3m51vCtedKH4GOfCx2rTv03zEdTQfZ6EJPW/
         h1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H74Cx0z7INlxIE76e/bwEKWBIIXIiyO99JQfsOTNz+c=;
        b=WNGaY61eE9cNMnCaaknGZnz14u/h08foQz4bJMNOWwlhzIEtryB9TbQ4ljvxKHxbWL
         x3gI2vQCxX5SpQogBCE0pKUY+qFvRErlURsWb1v+Ig0oiixzqOnaoCYfxJt2pplFVbOs
         M9WXRAPElYYEXeagaeTBdZbpskesC8luyPYuEaMm2b/k7NfrCtbcZnLcGeV0CV/Nontq
         Zg2eQI7A0YEx2vnXRkUWCOPn9k+0dT6kukq9mgtx4eJ+Ov6c7yN0SxU+SHvLlZGgRQZD
         YJDP1AEGkYjRU+XKJnzBBmBTMS2siz0aJg9MET7230D58BO5KJAt8nKhTvshbGbcuko2
         1+0g==
X-Gm-Message-State: AOAM532crOfTMtkpmhAc5rkQTKCj7Ir1LS9E5Yupu2HLJSx2ueUKZWUX
        5nsWzRRMC7JDCqZE+7BXNDV2V9HK61IBN6jHSIkrzA==
X-Google-Smtp-Source: ABdhPJwZ7hKmOrS0sEGPPmEpUtzL9l0ws8MRzjbhigkn5PZcz07tk1gy+KU4Rova9kUDRYC1MGuDCJsBIA1IgTUmZx0=
X-Received: by 2002:a19:8644:: with SMTP id i65mr802101lfd.20.1597395399029;
 Fri, 14 Aug 2020 01:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200813154020.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
 <20200813073325.GK3480@piout.net> <CANqTbdZhZL--JebFhZPkf2+VuCUs2b=Me-BoBHgAtt_MvQBX3A@mail.gmail.com>
 <20200814081530.GA6530@piout.net>
In-Reply-To: <20200814081530.GA6530@piout.net>
From:   Victor Ding <victording@google.com>
Date:   Fri, 14 Aug 2020 18:56:02 +1000
Message-ID: <CANqTbdb=nrh-Kva9hsEQp9sowMiM795bm5W+4QKw_cuVKJL2_w@mail.gmail.com>
Subject: Re: [PATCH] rtc: cmos: initialize rtc time when reading alarm
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Fri, Aug 14, 2020 at 6:15 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 14/08/2020 16:10:13+1000, Victor Ding wrote:
> > Hi Alexandre,
> >
> > On Thu, Aug 13, 2020 at 5:33 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hi,
> > >
> > > On 13/08/2020 15:41:34+1000, Victor Ding wrote:
> > > > cmos_read_alarm() may leave certain fields of a struct rtc_time
> > > > untouched; therefore, these fields contain garbage if not properly
> > > > initialized, leading to inconsistent values when converting into
> > > > time64_t.
> > > > This patch to set all fields of a struct rtc_time to -1 before calling
> > > > cmos_read_alarm().
> > > >
> > >
> > > I don't think this actually helps with the conversion as mktime64
> > > is taking unsigned int so I would think you need the whole logic that is
> > > in __rtc_read_alarm
> >
> > It's true that this change does not produce a correct time64_t; however,
> > it isn't the intention either. The proposed change only produces a
> > consistent value: calling obtaining identical struct rtc_time if the CMOS
> > wakealarm is unchanged. In the case of suspend/resume, a correct value
> > time64_t is not necessary; a consistent value is sufficient to correctly
> > perform an equality test for `t_current_expires` and `t_saved_expires`.
> > Logic to deduce a correct time64_t is expensive and hence I would like to
> > avoid __rtc_read_alarm's logic here.
> >
> > Prior to this patch, the struct rtc_time is uninitialized. After calling
> > cmos_read_alarm(), the tm_year field is always left untouched and hence
> > contains only garbage. On platforms without enhanced RTC timers, the
> > tm_mon and tm_mday fields are left with garbage as well. Therefore,
> > `t_current_expires` and `t_saved_expires` from garbage data, which leads
> > to incorrect equality test results.
> >
>
> Seeing that saved_wkalrm is initialized to zero, wouldn't it be
> sufficient to initialize current_alarm to 0? This can be done simply at
> the declaration. I personally find the -1 to be confusing especially
> since the result ends up being architecture dependent.
>

Good point. Initializing the struct to 0 is also sufficient; I'll
update the patch
to initialize the fields to 0 and submit the updated version.

Note that both `saved_wkalrm` and `current_alarm` must be initialized.
`cmos_suspend` may be called multiple times; `cmos_read_alarm` may or
may not update `time.tm_mon` or `time.tm_mday` depends on `cmos->day_alrm`
and `cmos->mon_alrm`. Both `day_alrm` and `mon_alrm` could theoretically
change. Say if at first `day_alrm` is enabled, `cmos_read_alarm` would fill
`time.tm_mday`. Later on, if `day_alrm` becomes disabled, `cmos_read_alarm`
would not update `time.tm_mday` and hence leaves its value as garbage.

> > >
> > > > Signed-off-by: Victor Ding <victording@google.com>
> > > > ---
> > > >
> > > >  drivers/rtc/rtc-cmos.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> > > > index bcc96ab7793f..c99af567780d 100644
> > > > --- a/drivers/rtc/rtc-cmos.c
> > > > +++ b/drivers/rtc/rtc-cmos.c
> > > > @@ -1006,6 +1006,7 @@ static int cmos_suspend(struct device *dev)
> > > >                       enable_irq_wake(cmos->irq);
> > > >       }
> > > >
> > > > +     memset(&cmos->saved_wkalrm.time, -1, sizeof(struct rtc_time));
> > > >       cmos_read_alarm(dev, &cmos->saved_wkalrm);
> > > >
> > > >       dev_dbg(dev, "suspend%s, ctrl %02x\n",
> > > > @@ -1054,6 +1055,7 @@ static void cmos_check_wkalrm(struct device *dev)
> > > >               return;
> > > >       }
> > > >
> > > > +     memset(&current_alarm.time, -1, sizeof(struct rtc_time));
> > > >       cmos_read_alarm(dev, &current_alarm);
> > > >       t_current_expires = rtc_tm_to_time64(&current_alarm.time);
> > > >       t_saved_expires = rtc_tm_to_time64(&cmos->saved_wkalrm.time);
> > > > --
> > > > 2.28.0.236.gb10cc79966-goog
> > > >
> > >
> > > --
> > > Alexandre Belloni, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> > Best regards,
> > Victor Ding
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best regards,
Victor Ding

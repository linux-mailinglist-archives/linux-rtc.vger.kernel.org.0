Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62FC2444DD
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Aug 2020 08:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgHNGKx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Aug 2020 02:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgHNGKw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Aug 2020 02:10:52 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33220C061757
        for <linux-rtc@vger.kernel.org>; Thu, 13 Aug 2020 23:10:52 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v12so8735699ljc.10
        for <linux-rtc@vger.kernel.org>; Thu, 13 Aug 2020 23:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CBGbgQ+17TYFarb+mLVeepEGqaaGnPjpnJL0cl1DvV8=;
        b=dAuId8q4m/LMMsa7LucKk0Erno8ZVyXL1VnzdmXx7f3ZEYYYa/q6H1DM4oh3i+DOpu
         O75vgqDi7ep3r72W9BZwV+9c2JQFWacOzClSZNZiDrXLA9izfnd278d2vyz87VfmxGVp
         hpTnzK5PMSnuKYNQHLkqWOFFFDtmNVU9cE3qmNM/ZPdDncWsZvYuawaP6UNCTZoru0Wq
         M3oJk1M05gApX5XLsEJ4LqEDWMJK3kV2I3DUqYpEmHffbhGw3aQgvuMNVVGkTdVjJuJI
         YV24LojzTHHs46QVLPl7S9emwdDs4eo8KP32hgVESeiUgRjWI2iix3eGXz4a13X3Td4I
         fJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CBGbgQ+17TYFarb+mLVeepEGqaaGnPjpnJL0cl1DvV8=;
        b=mA6xsyiQjR/QWXPls7JgZmzDoBBDKEECQaUNMEXAL/Zw+Xpf2CuzBaY3CRMn58MIOj
         jF/wqXOs2nY3HGJBC6N3W73r85acpUcIuX90mAo/DZYWQk93Uk5Lno2eU4NGCxAgMCxZ
         nR2TuFtlDNIgtrT/72KODfixJ+WLNhCQfX7yjYcaJminLWAS3O+Kjx+YyGfs+dNsG3op
         IYjDmiu+8NK+Rdg8nM24bPvClOjVy36WuiM77709r7zauFA27NcHe+514edDDf3PaFN+
         QAOBs7lunKiHxzgbsjfX9eKDf57F8K/Vzsfb6G+lw0USDrVC2TE3IL6DVQr6FPQRwB2j
         jnQA==
X-Gm-Message-State: AOAM531NtqE7y2z4vUIB2VjLlNWC/XBb8eFS1B6LQtiKUb5BM5bAdaFp
        2PPUfp1RZ2Cx21NzP/ArC9btVbzeym9mY+SlpY1YwQ==
X-Google-Smtp-Source: ABdhPJx8WmGaVlNSSN6nxM+IFTU8UW4nFJsCjZNkdj3n84kkD5dgMVhIH8duYNKI/uV3tsPH8ooDV4iHlKlijHNK6O0=
X-Received: by 2002:a05:651c:204a:: with SMTP id t10mr637880ljo.194.1597385449516;
 Thu, 13 Aug 2020 23:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200813154020.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
 <20200813073325.GK3480@piout.net>
In-Reply-To: <20200813073325.GK3480@piout.net>
From:   Victor Ding <victording@google.com>
Date:   Fri, 14 Aug 2020 16:10:13 +1000
Message-ID: <CANqTbdZhZL--JebFhZPkf2+VuCUs2b=Me-BoBHgAtt_MvQBX3A@mail.gmail.com>
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

On Thu, Aug 13, 2020 at 5:33 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 13/08/2020 15:41:34+1000, Victor Ding wrote:
> > cmos_read_alarm() may leave certain fields of a struct rtc_time
> > untouched; therefore, these fields contain garbage if not properly
> > initialized, leading to inconsistent values when converting into
> > time64_t.
> > This patch to set all fields of a struct rtc_time to -1 before calling
> > cmos_read_alarm().
> >
>
> I don't think this actually helps with the conversion as mktime64
> is taking unsigned int so I would think you need the whole logic that is
> in __rtc_read_alarm

It's true that this change does not produce a correct time64_t; however,
it isn't the intention either. The proposed change only produces a
consistent value: calling obtaining identical struct rtc_time if the CMOS
wakealarm is unchanged. In the case of suspend/resume, a correct value
time64_t is not necessary; a consistent value is sufficient to correctly
perform an equality test for `t_current_expires` and `t_saved_expires`.
Logic to deduce a correct time64_t is expensive and hence I would like to
avoid __rtc_read_alarm's logic here.

Prior to this patch, the struct rtc_time is uninitialized. After calling
cmos_read_alarm(), the tm_year field is always left untouched and hence
contains only garbage. On platforms without enhanced RTC timers, the
tm_mon and tm_mday fields are left with garbage as well. Therefore,
`t_current_expires` and `t_saved_expires` from garbage data, which leads
to incorrect equality test results.

>
> > Signed-off-by: Victor Ding <victording@google.com>
> > ---
> >
> >  drivers/rtc/rtc-cmos.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> > index bcc96ab7793f..c99af567780d 100644
> > --- a/drivers/rtc/rtc-cmos.c
> > +++ b/drivers/rtc/rtc-cmos.c
> > @@ -1006,6 +1006,7 @@ static int cmos_suspend(struct device *dev)
> >                       enable_irq_wake(cmos->irq);
> >       }
> >
> > +     memset(&cmos->saved_wkalrm.time, -1, sizeof(struct rtc_time));
> >       cmos_read_alarm(dev, &cmos->saved_wkalrm);
> >
> >       dev_dbg(dev, "suspend%s, ctrl %02x\n",
> > @@ -1054,6 +1055,7 @@ static void cmos_check_wkalrm(struct device *dev)
> >               return;
> >       }
> >
> > +     memset(&current_alarm.time, -1, sizeof(struct rtc_time));
> >       cmos_read_alarm(dev, &current_alarm);
> >       t_current_expires = rtc_tm_to_time64(&current_alarm.time);
> >       t_saved_expires = rtc_tm_to_time64(&cmos->saved_wkalrm.time);
> > --
> > 2.28.0.236.gb10cc79966-goog
> >
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best regards,
Victor Ding

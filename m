Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0625C330BDF
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Mar 2021 11:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhCHK7J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Mar 2021 05:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhCHK6p (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Mar 2021 05:58:45 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C68C06174A
        for <linux-rtc@vger.kernel.org>; Mon,  8 Mar 2021 02:58:45 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id m9so9680669ybk.8
        for <linux-rtc@vger.kernel.org>; Mon, 08 Mar 2021 02:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P36fOCsUXoR3R0BuSrDVN7P4DFT6GIyipWvY0vZ6dd4=;
        b=T0DPqq7Ba9k2thLxy9cTrs0vd6kJtMJc5W2SThPSVAE6l6eIc7hYYJDSa/3xdXJVQ/
         2dPdbsrlObqyJrp8TtP+A9Rkd1dLpQP6giZQvTPJ+7Q+8lA0dQDgYr5AsC2sRKWNGSfv
         2sd0DqjyvATB+j+Zon7fHOgQjPRc3sSL8shyLObLghe2AZPUFgojjQkbIj+J4O7eHhrM
         SWPJvAqAbZ8E9npSnAHGaQjbw6oJtep+ZnoCtK2i9IsXeQ5OdunKfuzPXiQqt5y2M9NR
         sPMwI1PXOIVWQuoHLOFI/Z0pM4NfG+rWh89FmEPTz955DrG0MM/sJg1I9VDNfL4p+K/7
         DkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P36fOCsUXoR3R0BuSrDVN7P4DFT6GIyipWvY0vZ6dd4=;
        b=XNWNY+pCwS/7RIedvf034vncEq8Vo3HEHwTmiyO3RJHsso/wVbsYZzxvxKdnDJrUiH
         2LCnWm4IPFBKN23Kk2N8MMqEV3LhWHJjJKvkGAjY93dafc46VclKcs2uLLz6L9cVa+19
         Ua4xAMhpa7F6RlIp7cqEgJ6BWB+iS6GiTAsxPP+PrFuCiqYMqB7VsiMYnoEoIyh6wcRc
         jS1xAmOM8lvzdJJ5o8EBT66N12pkmCVtEpKTFDoG39xyjlpP8zSqyQTpR9DBMyFiD/0h
         CTaJ1CgitJVVM3ywb1kkEIn0oSWKYahSnQFK0ANu/IO2EK4j6gKbamgntF8/Ys+NFOOA
         B/AQ==
X-Gm-Message-State: AOAM531w7KN8gCn/xWeIdiHbF+ABIwGlCrZougjLm9W1WTEROxdrssCf
        lmVNATA+NJiLn9kzvASi1DAS6N/v/AjCvQREWpw8B6cHNPE=
X-Google-Smtp-Source: ABdhPJwKv2tkg0nzc+NxWg82axHjuvbTT+q3X8YebhZJEFpjSLjtVb7SXMZWCvLPnRcQHhnJVCNixL/ZfI11nZ5s2qQ=
X-Received: by 2002:a25:dd43:: with SMTP id u64mr33160997ybg.96.1615201124935;
 Mon, 08 Mar 2021 02:58:44 -0800 (PST)
MIME-Version: 1.0
References: <2876529.n6mMd1HPca@tool> <20210112220815.GK3654@piout.net>
In-Reply-To: <20210112220815.GK3654@piout.net>
From:   =?UTF-8?Q?Daniel_Gonz=C3=A1lez_Cabanelas?= <dgcbueu@gmail.com>
Date:   Mon, 8 Mar 2021 11:58:33 +0100
Message-ID: <CABwr4_umehCXezqCauQHXkRbVc39xPZZDA_-FPhedXZxnFUe3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: rs5c372: support alarms up to 1 week
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

El mar, 12 ene 2021 a las 23:08, Alexandre Belloni
(<alexandre.belloni@bootlin.com>) escribi=C3=B3:
>
> Hello,
>
> On 23/11/2020 11:38:44+0100, Daniel Gonz=C3=A1lez Cabanelas wrote:
> > The Ricoh R2221x, R2223x, RS5C372, RV5C387A chips can handle 1 week
> > alarms.
> >
> > Read the "wday" alarm register and convert it to a date to support up 1
> > week in our driver.
> >
> > Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
> > ---
> >  drivers/rtc/rtc-rs5c372.c | 48 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 42 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> > index 3bd6eaa0d..94b778c6e 100644
> > --- a/drivers/rtc/rtc-rs5c372.c
> > +++ b/drivers/rtc/rtc-rs5c372.c
> > @@ -393,7 +393,9 @@ static int rs5c_read_alarm(struct device *dev, stru=
ct rtc_wkalrm *t)
> >  {
> >       struct i2c_client       *client =3D to_i2c_client(dev);
> >       struct rs5c372          *rs5c =3D i2c_get_clientdata(client);
> > -     int                     status;
> > +     int                     status, wday_offs;
> > +     struct rtc_time         rtc;
>
> You have a few spaces before tabs, please fix them.
>
Ok

> > +     unsigned long           alarm_secs;
> >
> >       status =3D rs5c_get_regs(rs5c);
> >       if (status < 0)
> > @@ -403,6 +405,30 @@ static int rs5c_read_alarm(struct device *dev, str=
uct rtc_wkalrm *t)
> >       t->time.tm_sec =3D 0;
> >       t->time.tm_min =3D bcd2bin(rs5c->regs[RS5C_REG_ALARM_A_MIN] & 0x7=
f);
> >       t->time.tm_hour =3D rs5c_reg2hr(rs5c, rs5c->regs[RS5C_REG_ALARM_A=
_HOURS]);
> > +     t->time.tm_wday =3D ffs(rs5c->regs[RS5C_REG_ALARM_A_WDAY] & 0x7f)=
 - 1;
> > +
> > +     /* determine the day, month and year based on alarm wday, taking =
as a
> > +      * reference the current time from the rtc
> > +      */
> > +     status =3D rs5c372_rtc_read_time(dev, &rtc);
> > +     if (status < 0)
> > +             return status;
> > +
> > +     wday_offs =3D t->time.tm_wday - rtc.tm_wday;
>
> Note that you can not rely on tm_wday being set correctly. The core will
> not (currently) enforce that and most tools jut pass a bogus value or 0.
> So you need to calculate wday in rs5c372_rtc_set_time.

will this code be enough for the set_time function?
-------------snip-------------
int wday;
struct rtc_time calc_tm;

/* wday calculate */
rtc_time64_to_tm(rtc_tm_to_time64(tm), &calc_tm);
wday =3D calc_tm.tm_wday;

buf[3] =3D bin2bcd(wday);
-------------snip-------------

> I'm currently working on a way for the drivers to ask the core to ensure
> wday is correct.
>
> > +     alarm_secs =3D mktime64(rtc.tm_year + 1900,
> > +                           rtc.tm_mon + 1,
> > +                           rtc.tm_mday + wday_offs,
> > +                           t->time.tm_hour,
> > +                           t->time.tm_min,
> > +                           t->time.tm_sec);
> > +
> > +     if (wday_offs < 0 || (wday_offs =3D=3D 0 &&
> > +                           (t->time.tm_hour < rtc.tm_hour ||
> > +                            (t->time.tm_hour =3D=3D rtc.tm_hour &&
> > +                             t->time.tm_min <=3D rtc.tm_min))))
> > +             alarm_secs +=3D 7 * 86400;
> > +
> > +     rtc_time64_to_tm(alarm_secs, &t->time);
> >
> >       /* ... and status */
> >       t->enabled =3D !!(rs5c->regs[RS5C_REG_CTRL1] & RS5C_CTRL1_AALE);
> > @@ -417,12 +443,20 @@ static int rs5c_set_alarm(struct device *dev, str=
uct rtc_wkalrm *t)
> >       struct rs5c372          *rs5c =3D i2c_get_clientdata(client);
> >       int                     status, addr, i;
> >       unsigned char           buf[3];
> > +     struct rtc_time         rtc_tm;
> > +     unsigned long           rtc_secs, alarm_secs;
> >
> > -     /* only handle up to 24 hours in the future, like RTC_ALM_SET */
> > -     if (t->time.tm_mday !=3D -1
> > -                     || t->time.tm_mon !=3D -1
> > -                     || t->time.tm_year !=3D -1)
> > +     /* chip only can handle alarms up to one week in the future*/
> > +     status =3D rs5c372_rtc_read_time(dev, &rtc_tm);
> > +     if (status)
> > +             return status;
> > +     rtc_secs =3D rtc_tm_to_time64(&rtc_tm);
> > +     alarm_secs =3D rtc_tm_to_time64(&t->time);
> > +     if (alarm_secs >=3D rtc_secs + 7 * 86400) {
> > +             dev_err(dev, "%s: alarm maximum is one week in the future=
 (%d)\n",
> > +                     __func__, status);
>
> Please avoid adding an error message. It will not be read anyway.
>
> >               return -EINVAL;
>
> Maybe it is a good opportunity to change to -ERANGE?
>
Ok

> > +     }
> >
> >       /* REVISIT: round up tm_sec */
> >
> > @@ -443,7 +477,9 @@ static int rs5c_set_alarm(struct device *dev, struc=
t rtc_wkalrm *t)
> >       /* set alarm */
> >       buf[0] =3D bin2bcd(t->time.tm_min);
> >       buf[1] =3D rs5c_hr2reg(rs5c, t->time.tm_hour);
> > -     buf[2] =3D 0x7f;  /* any/all days */
> > +     /* each bit is the day of the week, 0x7f means all days */
> > +     buf[2] =3D (t->time.tm_wday >=3D 0 && t->time.tm_wday < 7) ?
> > +               BIT(t->time.tm_wday) : 0x7f;
>
> Here, you also need to calculate buf[2] from t->time.tm_mday instead of
> relying on t->time.tm_wday.

I can't se how to calculate the wday using t->time.tm_mday. Again can
I use this?:
-------------snip-------------
rtc_time64_to_tm(rtc_tm_to_time64(tm), &calc_tm);
wday =3D calc_tm.tm_wday;
-------------snip-------------

Regards
Daniel

>
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

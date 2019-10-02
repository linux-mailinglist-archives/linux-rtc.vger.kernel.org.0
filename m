Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0950C8CA7
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Oct 2019 17:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbfJBPUs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Oct 2019 11:20:48 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41969 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728350AbfJBPUs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Oct 2019 11:20:48 -0400
Received: by mail-lf1-f68.google.com with SMTP id r2so13010472lfn.8
        for <linux-rtc@vger.kernel.org>; Wed, 02 Oct 2019 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cm5y6/ru/C9I2VSusEbg3+NWiE1oNKxKWJ8nI5eVPpE=;
        b=e+HZAJr8AzekfpjpvDICihE65P2buZXwIBxjnPwoZjUaa8DYIlZ411wS9EH2Wqx+L0
         3IIG8qyNstNMWhX7MV1QihCRQKoZXXMGKTs4PWndclmhIsERWI2BlCQHgmm887jK/X4s
         4LSh6oyFIbqiC5xhJtc71w2JGJd98PVfXjNlCN6GVR9bIWfwprqsxKpAl4Dh1GDOm4Uf
         KkFqAdqcObzoSOtmU6zUaXmwXz8h65j2MURhjZuxBvLZTZfX1GtpcYV+ZEof01IIQYYx
         E0dhPukf1KSSEJqO6kaaFkc1egOnoliejLLs3Culpb7JQAQvhqu/uJ4ixkijBLwVqoor
         bBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cm5y6/ru/C9I2VSusEbg3+NWiE1oNKxKWJ8nI5eVPpE=;
        b=X5rHgRFV1ypij7S/rx9BIb3057yN/Re1cL2Y6fqPmRvMmtBPI4nJV4ZmMpafi2eQ93
         Jq6b0aaTvo2Mr+s9gOaBM/aM7/dVeZQ5ytCaixmgIU4oVFgMWd2UmAuKZRnjBl/hTIsT
         CmzO8Qewy6WPaytZD4zRrnYDxZktnuxAAuK2SgIku2a3E038bSUmX1tKt9UKnu07hRyA
         CmGpbERFwUwbQa7Iw+ocZMBq7dh8Dn9rAraFUX0PAaWI+rxcoW534dcDXhJQPl3i+9c5
         hsJue69m0moMGwI59tn2OoSgP3ryocUYr40NmFHTOG8+hQ6qYyC9a1a5+0n7cdGWvrhp
         hbiw==
X-Gm-Message-State: APjAAAWMnnGmtIKc15lgDb0c/Let7My/AUL03DbiejzY1nvWcun9a32q
        I57Sr+S6l78ZIiF+nmHoS/aoF3FI8AgAYKEiUZCCPg==
X-Google-Smtp-Source: APXvYqx7gWDvkA6xvZrimGK8XznLipqzN+AmU8yulSOEUx6+7QMOXqK5DEy91JhesL1ch8MperNChxT0leTXt1RiHYQ=
X-Received: by 2002:ac2:4114:: with SMTP id b20mr2720783lfi.19.1570029645385;
 Wed, 02 Oct 2019 08:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190925203209.79941-1-ncrews@chromium.org> <20191001195342.GH4106@piout.net>
 <CAE_wzQ8ugGgRsjfQwfncxhmy4EDOxKdoNm8CJ5AF=Mc5N6X7WQ@mail.gmail.com> <20191002103236.GM4106@piout.net>
In-Reply-To: <20191002103236.GM4106@piout.net>
From:   Dmitry Torokhov <dtor@google.com>
Date:   Wed, 2 Oct 2019 08:20:34 -0700
Message-ID: <CAE_wzQ9AodXUEANpDEQM+VYMVuxWmLoF0_1k-m5HdAfx+=01-A@mail.gmail.com>
Subject: Re: [PATCH v3] rtc: wilco-ec: Handle reading invalid times
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Nick Crews <ncrews@chromium.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, enric.balletbo@collabora.com,
        Benson Leung <bleung@chromium.org>, dlaurie@chromium.org,
        Daniel Kurtz <djkurtz@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Oct 2, 2019 at 3:32 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 01/10/2019 13:42:24-0700, Dmitry Torokhov wrote:
> > On Tue, Oct 1, 2019 at 12:53 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hi Nick,
> > >
> > > On 25/09/2019 14:32:09-0600, Nick Crews wrote:
> > > > If the RTC HW returns an invalid time, the rtc_year_days()
> > > > call would crash. This patch adds error logging in this
> > > > situation, and removes the tm_yday and tm_wday calculations.
> > > > These fields should not be relied upon by userspace
> > > > according to man rtc, and thus we don't need to calculate
> > > > them.
> > > >
> > > > Signed-off-by: Nick Crews <ncrews@chromium.org>
> > > > ---
> > > >  drivers/rtc/rtc-wilco-ec.c | 13 +++++++++----
> > > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> > > > index 8ad4c4e6d557..53da355d996a 100644
> > > > --- a/drivers/rtc/rtc-wilco-ec.c
> > > > +++ b/drivers/rtc/rtc-wilco-ec.c
> > > > @@ -110,10 +110,15 @@ static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
> > > >       tm->tm_mday     = rtc.day;
> > > >       tm->tm_mon      = rtc.month - 1;
> > > >       tm->tm_year     = rtc.year + (rtc.century * 100) - 1900;
> > > > -     tm->tm_yday     = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
> > > > -
> > > > -     /* Don't compute day of week, we don't need it. */
> > > > -     tm->tm_wday = -1;
> > > > +     /* Ignore other tm fields, man rtc says userspace shouldn't use them. */
> > > > +
> > > > +     if (rtc_valid_tm(tm)) {
> > > > +             dev_err(dev,
> > > > +                      "Time from RTC is invalid: second=%u, minute=%u, hour=%u, day=%u, month=%u, year=%u, century=%u",
> > > > +                      rtc.second, rtc.minute, rtc.hour, rtc.day, rtc.month,
> > > > +                      rtc.year, rtc.century);
> > >
> > > Do you mind using %ptR? At this point you already filled the tm struct
> > > anyway and if you print century separately, you can infer tm_year.
> >
> > I do not think this is a good idea: we have just established that tm
> > does not contain valid data. Does %ptR guarantee that it handles junk
> > better than, let's say, rtc_year_days(), and does not crash when
> > presented with garbage?
> >
>
> It is safe to use. You can also use %ptRr if you want to ensure no
> extra operations are done on the value before printing them out.

OK, I'll keeo this in mind then.

>
> I'm still not convinced it is useful to have an error in dmesg when the
> time is invalid, as long as userspace knows it is invalid. What is the
> course of action for the end user when that happens?

Report it, or, in our case, we will see it in the feedback logs.
However I do agree that it is not the best option, even if we report
error to userspace I am not sure if it will handle it properly. What
userspace is supposed to do when presented with -EIO or similar?

Nick, do we know the root cause of the EC/RTC reporting invalid time?

Thanks,
Dmitry

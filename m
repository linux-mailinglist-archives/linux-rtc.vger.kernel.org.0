Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F11B1C41E8
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Oct 2019 22:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfJAUmj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Oct 2019 16:42:39 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42535 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbfJAUmj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 1 Oct 2019 16:42:39 -0400
Received: by mail-lf1-f67.google.com with SMTP id c195so10969649lfg.9
        for <linux-rtc@vger.kernel.org>; Tue, 01 Oct 2019 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2hwZCi70c7qhfFOhnj+Rn4JUCNKdVNtJE8cMrdBeUh0=;
        b=NzMFMc3/fGFF6QjZ2ONoOmmIwcx7onZkZM1S8iWw7sw83fbtDDJP2tUlsNzLSb+49R
         7Sno3jQijk47mtbzvwyyXy/mGq339rgAKN8s/OzrTkGUO9k4LqfdDmtGJrjuOUOy0/b6
         N0I+hcR9ofFqZGdWF9CN4OaRHJSHqWAN+WCWnR5v8CR7a57uTJMWbwrMZKG+ojsXp5d2
         0hU7863GJMYkIqP48c79/W1+KhvRA6hJc1E3TMi79lL75nh38d8aR0tf5ja0n/CEMfjZ
         FaoFO5oAx99PhJ19Yo0q9BcaIYUKwNUSHnZZg3s48rU6E9be2H/bwALuh+LcU9rlCUZE
         2vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2hwZCi70c7qhfFOhnj+Rn4JUCNKdVNtJE8cMrdBeUh0=;
        b=NkrhCEu9aDz/YApnE2HyfiZR+Ms7aAjl1Yc7rk59LdmlwbPzG5v1qB9wgbKTFqpMOU
         H5fnu99zLYrbsG78lbjL27lAPFr/4XFgPYVmkmd+NMTr/BNHNP1iNySIrUQakN7vwVZr
         IG3NelcBjNo3K93LKucWk6fSungyoykKWHpCZQW+CAse3Ow3iShImbSNbofCvQMecEBR
         4/E3t9S7EcHc34eAU4mw4bweZBaRFmHWZsw6mFsN7gKFxZFVLUgfHWTBxg1PllnxodjS
         IcXkozwzNKjO9Z65YLfdJMVXGq9zNxtACLD4wN7UIjfEzbN9sk/Pp2z8E5HZttW/hB9N
         atBA==
X-Gm-Message-State: APjAAAVUrV8QE55bq55mE1Kbp/h8b5w8CoDXRYUfpEm53L41bUhKm7gw
        41xOi9oLpb91cYh5V3AKrc7G1piddUMWN55f4Q4jew==
X-Google-Smtp-Source: APXvYqzg88pOOovnALHaEkRUf8c7S1vddZhPLUe9z8R9u4pZOtR8+L1B92hkrdlhGxiMBSlrIVqUpAwnJmUmdC7qo1I=
X-Received: by 2002:ac2:46d2:: with SMTP id p18mr16217488lfo.140.1569962556369;
 Tue, 01 Oct 2019 13:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190925203209.79941-1-ncrews@chromium.org> <20191001195342.GH4106@piout.net>
In-Reply-To: <20191001195342.GH4106@piout.net>
From:   Dmitry Torokhov <dtor@google.com>
Date:   Tue, 1 Oct 2019 13:42:24 -0700
Message-ID: <CAE_wzQ8ugGgRsjfQwfncxhmy4EDOxKdoNm8CJ5AF=Mc5N6X7WQ@mail.gmail.com>
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

On Tue, Oct 1, 2019 at 12:53 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Nick,
>
> On 25/09/2019 14:32:09-0600, Nick Crews wrote:
> > If the RTC HW returns an invalid time, the rtc_year_days()
> > call would crash. This patch adds error logging in this
> > situation, and removes the tm_yday and tm_wday calculations.
> > These fields should not be relied upon by userspace
> > according to man rtc, and thus we don't need to calculate
> > them.
> >
> > Signed-off-by: Nick Crews <ncrews@chromium.org>
> > ---
> >  drivers/rtc/rtc-wilco-ec.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> > index 8ad4c4e6d557..53da355d996a 100644
> > --- a/drivers/rtc/rtc-wilco-ec.c
> > +++ b/drivers/rtc/rtc-wilco-ec.c
> > @@ -110,10 +110,15 @@ static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
> >       tm->tm_mday     = rtc.day;
> >       tm->tm_mon      = rtc.month - 1;
> >       tm->tm_year     = rtc.year + (rtc.century * 100) - 1900;
> > -     tm->tm_yday     = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
> > -
> > -     /* Don't compute day of week, we don't need it. */
> > -     tm->tm_wday = -1;
> > +     /* Ignore other tm fields, man rtc says userspace shouldn't use them. */
> > +
> > +     if (rtc_valid_tm(tm)) {
> > +             dev_err(dev,
> > +                      "Time from RTC is invalid: second=%u, minute=%u, hour=%u, day=%u, month=%u, year=%u, century=%u",
> > +                      rtc.second, rtc.minute, rtc.hour, rtc.day, rtc.month,
> > +                      rtc.year, rtc.century);
>
> Do you mind using %ptR? At this point you already filled the tm struct
> anyway and if you print century separately, you can infer tm_year.

I do not think this is a good idea: we have just established that tm
does not contain valid data. Does %ptR guarantee that it handles junk
better than, let's say, rtc_year_days(), and does not crash when
presented with garbage?

Thanks,
Dmitry

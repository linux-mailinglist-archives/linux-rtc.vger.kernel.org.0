Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA44266794
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Sep 2020 19:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgIKRpP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Sep 2020 13:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgIKMd6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Sep 2020 08:33:58 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15D7C061756
        for <linux-rtc@vger.kernel.org>; Fri, 11 Sep 2020 05:33:58 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id y9so1020467ilq.2
        for <linux-rtc@vger.kernel.org>; Fri, 11 Sep 2020 05:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c67lZrfuPG9UEb4z+gGzewLHNymIshXcnV6L3t1rNMU=;
        b=kCrWHuwtfF3Kz6oMUFtaIUJYr7GSVZJv9D6I7/BRCW7yvjyLMOlhDR3l+5dk1/eyaR
         3o6dqr2G+mnq7Wjvr7Sg37CwfxuzvzDxIrsidoeEAd98fiz9dLVHS0mhMvrig9lnJ+YQ
         ZiZf82Hr/V+EWT1YkS3G0O3JgiEcg0rs2+eT6gVemAq0LUiqHYSv1OAXTn7h6xFI9Li1
         kLhYCDp1HcXFTINC3q8q8Gw2Mr/Ar/k6mxEHJnk1zZihbWJu1oXT75cVOLSNKGJCPHio
         sTNlxvPvJmuV2NPPHdn8vnIB0a3IgbLsyjvClnEbgS05b6QCVl9IcrMmqLz0Y9mVaWRn
         g92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c67lZrfuPG9UEb4z+gGzewLHNymIshXcnV6L3t1rNMU=;
        b=gbkK172WdbycJjda6Wyq6mpR54qpHBU0D4u3UVBP5fSdgCYBbi6CbzWgnxIY0R9cGP
         rwV3+45NkwbtF1FOUJs9DYOVNByR3LBdWuLyoib0U612EExdHItRJrKTAjOHyr72OAMv
         qQoZuYF+y2yvKDcxmX20MssblbyBcfiTnj4MM9h09RFE38KsGJg0GfGrHrBLNeuBxtMb
         51z41spQa7gTc9rdz2UZRkbg36wuJIqkFAnUNXCHQw207tvKxTQy4bGOxd9Eew8TmBrS
         v5VYVMv09EX9ygcvZ30LgiYK7od7TVvIAjAQAg7txgpBb3RAW97FM7WbMT8ckg1g47uC
         0lAg==
X-Gm-Message-State: AOAM530C8JnbSWNYLlPdoOX/WDjefEv9p29+HpHROiew4W9OMHJLKzqX
        qfBCCi1XPRZVw2GW7a87SaUX0kI8Yd23jbXu6vbtSg==
X-Google-Smtp-Source: ABdhPJwFOIONkdA2ctwGz7VoFzyA3I9mYOs4EIdnHkL4glIXNkqKtMOoHE0l2ZjHBDSg5BPffSEJcCprdPgMSmvPsH0=
X-Received: by 2002:a05:6e02:968:: with SMTP id q8mr1513812ilt.220.1599827637490;
 Fri, 11 Sep 2020 05:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200904152116.2157-1-brgl@bgdev.pl> <20200904152116.2157-8-brgl@bgdev.pl>
 <20200904154144.GL230586@piout.net> <CAMpxmJWwNfLvpuB_1ba037UzVX9UEz7SzDEJuft0jv3txGRJQg@mail.gmail.com>
 <20200911122837.GC230586@piout.net>
In-Reply-To: <20200911122837.GC230586@piout.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Sep 2020 14:33:46 +0200
Message-ID: <CAMRc=MfzGgNR_vOqgDvQGCTQMiVbbiV_OKCOg61z-8B-mEuFyQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] rtc: rx8010: fix indentation in probe()
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Sep 11, 2020 at 2:28 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 07/09/2020 11:34:59+0200, Bartosz Golaszewski wrote:
> > On Fri, Sep 4, 2020 at 5:41 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 04/09/2020 17:21:15+0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > Align the arguments passed to devm_rtc_device_register() with the upper
> > > > line.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > ---
> > > >  drivers/rtc/rtc-rx8010.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> > > > index 181fc21cefa8..ed8ba38b4991 100644
> > > > --- a/drivers/rtc/rtc-rx8010.c
> > > > +++ b/drivers/rtc/rtc-rx8010.c
> > > > @@ -450,7 +450,7 @@ static int rx8010_probe(struct i2c_client *client,
> > > >       }
> > > >
> > > >       rx8010->rtc = devm_rtc_device_register(&client->dev, client->name,
> > > > -             &rx8010_rtc_ops, THIS_MODULE);
> > > > +                                            &rx8010_rtc_ops, THIS_MODULE);
> > > >
> > >
> > > You have bonus points if you replace that patch by switching from
> > > devm_rtc_device_register to devm_rtc_allocate_device and
> > > rtc_register_device.
> > >
> > > More bonus points if you also set range_min and range_max and then get
> > > rid of the range checking in set_time.
> > >
> >
> > Hi Alexandre!
> >
> > I've just looked at the code and wondered why there's no devm
> > counterpart for rtc_register_device(). Then I noticed that the release
> > callback for devm_rtc_allocate_device() takes care of unregistering
> > the device. This looks like serious devres abuse to me. In general the
> > idea is for the release callback to only undo whatever the devres
> > function did and this should be opaque to the concerned resources.
> >
> > In this case I believe there's no need for the 'registered' field in
> > struct rtc_device - this structure should *not* care about this - and
> > there should be devm_rtc_register_device() whose release callback
> > would take care of the unregistering. Since this function would be
> > called after devm_rtc_allocate_device(), it would be released before
> > so the ordering should be fine.
> >
>
> Note that the input subsystem is also doing it that way which is
> probably not a good reason alone to do it like that. But, IIRC, there

I'm seeing this pattern elsewhere in the kernel too and I just
recently fixed this for MDIO. I think it's just a matter of people
copy-pasting a bad implementation.

> was an actual reason this was done this way and it was the ordering of
> the rtc_nvmem_register/rtc_nvmem_unregister with rtc_device_unregister.
> I'm not sure this is still necessary though.
>

To me - each of these should have their own 'unregister' function and
appropriate devres helpers *OR* RTC-related nvmem structures could be
set up and assigned to struct rtc_device after
devm_rtc_allocate_device() and picked up by the registration function
(and also undone by rtc_unregister_device()).

I'll try to allocate some time to look into this but it's not like
it's urgent or anything - it's just a potential improvement.

Bartosz

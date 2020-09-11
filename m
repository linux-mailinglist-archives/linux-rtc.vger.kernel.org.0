Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C9A265F8D
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Sep 2020 14:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgIKM3v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Sep 2020 08:29:51 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:36723 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgIKM2s (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Sep 2020 08:28:48 -0400
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 445B910000B;
        Fri, 11 Sep 2020 12:28:38 +0000 (UTC)
Date:   Fri, 11 Sep 2020 14:28:37 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] rtc: rx8010: fix indentation in probe()
Message-ID: <20200911122837.GC230586@piout.net>
References: <20200904152116.2157-1-brgl@bgdev.pl>
 <20200904152116.2157-8-brgl@bgdev.pl>
 <20200904154144.GL230586@piout.net>
 <CAMpxmJWwNfLvpuB_1ba037UzVX9UEz7SzDEJuft0jv3txGRJQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWwNfLvpuB_1ba037UzVX9UEz7SzDEJuft0jv3txGRJQg@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 07/09/2020 11:34:59+0200, Bartosz Golaszewski wrote:
> On Fri, Sep 4, 2020 at 5:41 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 04/09/2020 17:21:15+0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Align the arguments passed to devm_rtc_device_register() with the upper
> > > line.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  drivers/rtc/rtc-rx8010.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> > > index 181fc21cefa8..ed8ba38b4991 100644
> > > --- a/drivers/rtc/rtc-rx8010.c
> > > +++ b/drivers/rtc/rtc-rx8010.c
> > > @@ -450,7 +450,7 @@ static int rx8010_probe(struct i2c_client *client,
> > >       }
> > >
> > >       rx8010->rtc = devm_rtc_device_register(&client->dev, client->name,
> > > -             &rx8010_rtc_ops, THIS_MODULE);
> > > +                                            &rx8010_rtc_ops, THIS_MODULE);
> > >
> >
> > You have bonus points if you replace that patch by switching from
> > devm_rtc_device_register to devm_rtc_allocate_device and
> > rtc_register_device.
> >
> > More bonus points if you also set range_min and range_max and then get
> > rid of the range checking in set_time.
> >
> 
> Hi Alexandre!
> 
> I've just looked at the code and wondered why there's no devm
> counterpart for rtc_register_device(). Then I noticed that the release
> callback for devm_rtc_allocate_device() takes care of unregistering
> the device. This looks like serious devres abuse to me. In general the
> idea is for the release callback to only undo whatever the devres
> function did and this should be opaque to the concerned resources.
> 
> In this case I believe there's no need for the 'registered' field in
> struct rtc_device - this structure should *not* care about this - and
> there should be devm_rtc_register_device() whose release callback
> would take care of the unregistering. Since this function would be
> called after devm_rtc_allocate_device(), it would be released before
> so the ordering should be fine.
> 

Note that the input subsystem is also doing it that way which is
probably not a good reason alone to do it like that. But, IIRC, there
was an actual reason this was done this way and it was the ordering of
the rtc_nvmem_register/rtc_nvmem_unregister with rtc_device_unregister.
I'm not sure this is still necessary though.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

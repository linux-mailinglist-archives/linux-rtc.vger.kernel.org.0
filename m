Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857E130F101
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Feb 2021 11:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbhBDKhS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 Feb 2021 05:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235346AbhBDKhQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 Feb 2021 05:37:16 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D26AC0613D6
        for <linux-rtc@vger.kernel.org>; Thu,  4 Feb 2021 02:36:36 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id k204so1626912oih.3
        for <linux-rtc@vger.kernel.org>; Thu, 04 Feb 2021 02:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VwdkegGeppc78dF2PFU6pSDmQfAtNSqd3Duj9DFoqr8=;
        b=f5k5VV21T0eHtIsE/JIjtzqo9tONCWAK9IKXqDwemmArJ4XNMjmiBMcQawzbRrnw0K
         YTiI8dvTWlk7wqWJ0idBIFmZiYOqtJiomc1CLXd7d+Vfpt3lfOTZ/Fgmk6npx6SDl6z4
         xgBDZACVLLFmvyZS2d2UTScH/IrGlFlvMZH60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VwdkegGeppc78dF2PFU6pSDmQfAtNSqd3Duj9DFoqr8=;
        b=muW+nWoQwJQTUgxVbpkdYEeFY1WwXittnLvfF9BQ6OUbdKCOLKI3iRTqrtHEQi4rDM
         4qcGVirjqzn065TkwVGE9m84uX1Jv3Dp/9m0K3vG7N9h9o7KPFuyBPL6wGImw3pooAHR
         4R2F8kA/aEFEkWG1QiygdNMlmiuDTq4wg2alLnPqHnVwoS8POLmjAYU0UfOX/3KqkWfr
         HMXfGaYjcxFftp/XIl+UVYPZkimBQCksP6PH8xjrLfPh6QnWTQ09pwaVAbqdi4+jflVQ
         NVx/7Kd536su3RztG4+nLSFUgWmshSpgCzAe3QMCBs29nEFb5x+ro/uI4FwdJr2BHJyI
         FZEA==
X-Gm-Message-State: AOAM532tfqxb9XuwCItK7Z5iUyqHVRAAJxwg/kXTO1+NM99fTXx2mblc
        WqMqsmb0JErHpsAsTC5LSZiHTyssoPy3ECSHNIT0kw==
X-Google-Smtp-Source: ABdhPJwgzZ9kTem2s5DLPzCB4a5HVBFtTEcRM0YmzS/9yA8rya4DMJj9dUJa7RU7vqMUj0nMDTxqlj1goL3lY4CWp+g=
X-Received: by 2002:aca:df42:: with SMTP id w63mr4831731oig.128.1612434995408;
 Thu, 04 Feb 2021 02:36:35 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com> <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
In-Reply-To: <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 4 Feb 2021 11:36:24 +0100
Message-ID: <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Feb 4, 2021 at 11:19 AM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> > > On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > Hi guys,
> > > >
> > > > This is first part of Intel MID outdated platforms removal. It's collected into
> > > > immutable branch with a given tag, please pull to yours subsystems.
> > >
> > > Hi Andy,
> > > Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > > then I should probably start looking at removing the corresponding
> > > parts in GMA500.
> >
> > I have noticed new commits in DRM against GMA500 and it seems now in a
> > conflict with my immutable branch. Are you sure you don't forget to
> > pull it?
>
> Hi Andy, sorry I missed pulling the immutable branch before taking the
> gma500 medfield removal. I was unsure how to do that through drm-misc
> and it's tools so I got sidetracked. What would be the correct way to
> fix this?

Imo Linus can resolve this, it's pretty trivial, as long as both pull
requests point it out to him.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

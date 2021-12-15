Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D00B476657
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Dec 2021 00:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhLOXKv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Dec 2021 18:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbhLOXKv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Dec 2021 18:10:51 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBB6C06173E
        for <linux-rtc@vger.kernel.org>; Wed, 15 Dec 2021 15:10:50 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id b19so33856599ljr.12
        for <linux-rtc@vger.kernel.org>; Wed, 15 Dec 2021 15:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y7DAUjl0wbjv/4De3uR/B1mDYliz+uJw6v1sVT86P/0=;
        b=ChEBPDb8pXFVDfq44AJ/HKzPCkqcS2H4CAqjTnUdbGcwdE+8ICS219FWqZqsO1PcrP
         pFkxIyUKYpFCTxjcs8i5fIhu40y4+ot+YK3lLjE/lSnOqrGFfnWcyzPThJCkBdw7m0gM
         ZfKqw1uxsnKUbFGpGydoXy+dEzY5ClXsgwjSNV5FSZcEfu2iQuRmrwaH1cCKZv0YTFDH
         IbfiwU4MntfMg7IIVEUku+IFYeFNVWTgwwZCDiDQeDuJ4Rl/ELLQV/BXUoWZdLNKbClX
         8NsjywQycnXF/9KN2AFFREOJ+zR0GaqJo0V6v1yD7B5LDwtIFgk4d6PoOzhKXc/uzNLv
         SbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y7DAUjl0wbjv/4De3uR/B1mDYliz+uJw6v1sVT86P/0=;
        b=SlXqNcxcombYEDFYzlJ6qKP/Wue9qwBpGS6KsS5teovVLOCAg3BPC9li4/MTEadato
         H6ad5Wy8bTLQO23KczXE8JkDMPhrwcITcYxlaQjNqXQXNk5PgVyLXF8k8bVwMwO4tLuj
         pGktf6BDcWfmcC8WirKFifyQH6fp/mKEKZbeCoLfbMOd4sLjAhtL1i0oS6+y0r+yAeuJ
         IMjATFFJ2cvuQiFi5gYA0T8IJpyCFkLSc3kdOreeUiXxHzmraV2MInfjidPqDuu+JEdG
         kKHPmlmf+3JWqUayUkQ2hJLr3DwrgpZht1sVUafWcTDdVvq/oxZbGrMW76375fgvYWHO
         KGew==
X-Gm-Message-State: AOAM531MeSrXcJVunC+4wzHgBuglruYfv58L+c4OyUBptP4SFd35G8/o
        MQNHNkYtlwBnsfytJ6DBTdb1GbTTKxyGGmNaD3F4Cg==
X-Google-Smtp-Source: ABdhPJx4cvTTBXFqEZkT1GB0kUVQZrVn1kPQL0HpO20VRBPmvBRZLZsWMjSZw5LuWPt5oJFsHz66EGtUKPCrbnbAwuA=
X-Received: by 2002:a2e:95d3:: with SMTP id y19mr12740025ljh.175.1639609849022;
 Wed, 15 Dec 2021 15:10:49 -0800 (PST)
MIME-Version: 1.0
References: <5af5d2a5-767c-d313-3be6-cb6f426f1980@sent.com>
 <b074f506-2568-4506-9557-4a9bc9cbea83@www.fastmail.com> <87wnkbuuuz.ffs@tglx>
 <4bb238e1-e8fa-44e6-9f5e-d047d1d4a892@www.fastmail.com> <8735mvthk6.ffs@tglx>
 <2ab24da8-e37d-426a-9500-b7541d21f8a3@www.fastmail.com> <CALAqxLXf6TmOn_jCOv68oop=4On+CN-p_KkN-70BDt9OjQhzUw@mail.gmail.com>
 <Ybpe/ND+MQq6tqoR@piout.net> <CALAqxLWe13ZghdWphzWZZsRGa+MeAH58syfem6ktDFHF0WG4Dg@mail.gmail.com>
 <87pmpxlcrd.ffs@tglx>
In-Reply-To: <87pmpxlcrd.ffs@tglx>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 15 Dec 2021 15:10:37 -0800
Message-ID: <CALAqxLUz8c-mOMVUsHj39Vbh35wHA1a8QfbTjLFrnL8qi2Ju6Q@mail.gmail.com>
Subject: Re: Time keeping while suspended in the presence of persistent clock drift
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joel Daniels <jdaniels@sent.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Dec 15, 2021 at 2:33 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Wed, Dec 15 2021 at 14:02, John Stultz wrote:
> > On Wed, Dec 15, 2021 at 1:32 PM Alexandre Belloni
> >> I'd rather lean towards the timekeeping code doing that. The RTC
> >
> > Heh, touche'!  :)
> >
> >> subsystem doesn't know which RTC has to be used.
> >
> > Though the RTC layer *is* the one that tracks which RTC is used, via
> > the logic in drivers/rtc/class.c, and the timekeeping core already has
> > adjtimex for timekeeping corrections, so if we're correcting
> > underlying RTCs it seems such tuning would best be done in the RTC
> > layer.
> >
> > Though how the persistent_clock interface ties into such corrections
> > would be a separate thing.
>
> Might be the final trigger to get rid of that leftover from the last
> millenium?
>

Yeah. Simplifying probably helps for consistency and maintainability.
(on top of the rtc and persistent clock, we also have the nonstop
clocksources that keep running through suspend and can be used. :)

It's just that window after resume but before the sleep time injection
where time would be incorrect always made me uncomfortable, so it was
nice to have some correct way to avoid that, even if all hardware
couldn't utilize it.  But as I'm less involved here, maybe someone
else can simplify things and live with that worry. :)

thanks
-john

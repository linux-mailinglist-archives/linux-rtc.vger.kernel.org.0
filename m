Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1804F2DD57E
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Dec 2020 17:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbgLQQwB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Dec 2020 11:52:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:53714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727253AbgLQQwB (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 17 Dec 2020 11:52:01 -0500
X-Gm-Message-State: AOAM5304DHwpgdskwgv1Fy4ikdK/jpMdUI7F6fdAtJPVxrRMIEIpq7e6
        VCC2VFPsUyvX/wIPAd9LifS5+CXvUnNpRElxHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608223880;
        bh=P5m3N09g7UEzzx6CDYAyM0fEzFb1mPowgoyMkOKqZKA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G8RLUc9w2UVQetcvSaxphIRhXVVnrAQqFD9f92OuLOeVEoH4e7y0HxUC2X5TKgQ/z
         S0gy3uALB+JuCNHh99PMJt/rJCjpZPBIY06G/FfPjT0r04TRb+ri56pBkcuwTfOXG/
         byL+uAwmw/5izHvJquFUhEAKNa3DD7G3cOhnvid7wD7Idy3ScddUsX49rh67+2d1n/
         du72k78TeAByUQBvzEoiEm2wjqdluYpssbJb9ZPLGW9iZPepOC+r0RNce2AFH+2hcD
         I07SlzSLdlhDfApVSYaq5p2ttj8c0Na6USnBZ2MfNIEAht4exowyesWpOXCceiW/nW
         IPGU48CAXukKA==
X-Google-Smtp-Source: ABdhPJyBzkrZgMWMBcvlcnLo3tCgsXg3Xa1J3OEC4I62tFNfvgTBx9zRDZ9KJ3sxjoUoRLKwyU4RbkSynkCO9SPDknk=
X-Received: by 2002:ad4:4a72:: with SMTP id cn18mr29845197qvb.50.1608223879583;
 Thu, 17 Dec 2020 08:51:19 -0800 (PST)
MIME-Version: 1.0
References: <20201204092752.GE74177@piout.net> <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201211215611.24392-2-rasmus.villemoes@prevas.dk> <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
 <b3c05d29-3ed6-d5f5-d1dd-0ddec1f89276@prevas.dk>
In-Reply-To: <b3c05d29-3ed6-d5f5-d1dd-0ddec1f89276@prevas.dk>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 17 Dec 2020 10:51:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+HeeFUR1Yv37X4OnkEPvSiAc2B86=Nshxz7tmvpKk+zw@mail.gmail.com>
Message-ID: <CAL_Jsq+HeeFUR1Yv37X4OnkEPvSiAc2B86=Nshxz7tmvpKk+zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add reset-source property
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 11, 2020 at 5:10 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 11/12/2020 23.30, Rob Herring wrote:
> > On Fri, Dec 11, 2020 at 3:56 PM Rasmus Villemoes
> > <rasmus.villemoes@prevas.dk> wrote:
> >>
> >> Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. But
> >> if the reset pin is not actually wired up, the driver exposes a
> >> watchdog device that doesn't actually work.
> >>
> >> Provide a standard binding that can be used to indicate that a given
> >> RTC can perform a reset of the machine, similar to wakeup-source.
> >
> > Why not use the watchdog 'timeout-sec' property?
>
> Wouldn't that be overloading that property? AFAIU, that is used to ask
> the kernel to program an initial timeout value into the watchdog device.
> But what if one doesn't want to start the watchdog device at kernel
> boot, but just indicate that the RTC has that capability?

Yeah, I guess you're right.

> It's quite possible that if it can act as a watchdog device (and
> has-watchdog was also suggested), one would also want timeout-sec and
> other watchdog bindings to apply. But that can be added later, by those
> who actually want that.
>
> For now, I'd really like to get my board booting again (or rather, not
> get reset by the real watchdog just because the pcf2127 driver now
> exposes something as /dev/wathdog0, pushing the real one to
> /dev/wathcdog1 which doesn't get pinged from userspace).

I'm wondering how you solve which wdog to ping when there are multiple
without relying on numbering. I guess 'reset-source' will solve that
even if that's not your current fix. So I guess I'm fine with this.

But you need to send to the DT list so checks are run.

Rob

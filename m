Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C27F2DD907
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Dec 2020 20:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbgLQTD2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Dec 2020 14:03:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:45116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgLQTD1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 17 Dec 2020 14:03:27 -0500
X-Gm-Message-State: AOAM5330Er0zcEDZSEio7RK8QLxckxDN5K+6kb5j9ojyLtC3D/tpKbgB
        tupso4K7wP7kx+jqik6BLAbymMi86N2V7JcaXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608231767;
        bh=TpIN8ZujmZBne/W8VVXWhgdTUE6iKXCG0iLPVPoLCvA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ePoiBG6Vvg+8oR4Ewrug1ffkgjbPsl5vxgStaBSOi0vDpHsTwSRO3MgslfAMt4Hm2
         dsju36hhJyIr3qei3kCcJxOvYMmcB7lHzD2Zt8fimLpUa/ven2MouzhxU1LPQXJSkR
         iiUuyhU+n8uymVBJKxtrikQBUNmt/6Nx57BUXFnxMoJ3pexp5gDfJZBBg6XZBlGH8n
         nXxHIYzjFsJD/yuT4B1fyf0AL49uTWoV5kFwtSek/jf2nDi3WbZguqM4RV6V6yG02v
         D3vkHOL5bZ8OIk82sb0qNQvj1ZRiIYLjIjYsDERVSRRUmOBSdgqcmQ7tDoV8KkQIUO
         acvKVNf1n24pA==
X-Google-Smtp-Source: ABdhPJwij9UAj8Asg4g1z8ySIrQKSq6BjyTMCXkBOSSr/Fa2MwhtOoY1wR1gADgGKO2CYzTGqSzHD5NCeoQlaRrQwXU=
X-Received: by 2002:a17:906:6713:: with SMTP id a19mr448322ejp.468.1608231765415;
 Thu, 17 Dec 2020 11:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20201204092752.GE74177@piout.net> <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201211215611.24392-2-rasmus.villemoes@prevas.dk> <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
 <b3c05d29-3ed6-d5f5-d1dd-0ddec1f89276@prevas.dk> <CAL_Jsq+HeeFUR1Yv37X4OnkEPvSiAc2B86=Nshxz7tmvpKk+zw@mail.gmail.com>
 <20201217181209.sibyhlfvlpjaewrv@pengutronix.de>
In-Reply-To: <20201217181209.sibyhlfvlpjaewrv@pengutronix.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 17 Dec 2020 13:02:32 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+z10xMig6HgOBK4bEK9_-MMv_ootBaBZeLuJ7TWEYm=g@mail.gmail.com>
Message-ID: <CAL_Jsq+z10xMig6HgOBK4bEK9_-MMv_ootBaBZeLuJ7TWEYm=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add reset-source property
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Dec 17, 2020 at 12:12 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Thu, Dec 17, 2020 at 10:51:08AM -0600, Rob Herring wrote:
> > On Fri, Dec 11, 2020 at 5:10 PM Rasmus Villemoes
> > <rasmus.villemoes@prevas.dk> wrote:
> > >
> > > On 11/12/2020 23.30, Rob Herring wrote:
> > > > On Fri, Dec 11, 2020 at 3:56 PM Rasmus Villemoes
> > > > <rasmus.villemoes@prevas.dk> wrote:
> > > >>
> > > >> Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. B=
ut
> > > >> if the reset pin is not actually wired up, the driver exposes a
> > > >> watchdog device that doesn't actually work.
> > > >>
> > > >> Provide a standard binding that can be used to indicate that a giv=
en
> > > >> RTC can perform a reset of the machine, similar to wakeup-source.
> > > >
> > > > Why not use the watchdog 'timeout-sec' property?
> > >
> > > Wouldn't that be overloading that property? AFAIU, that is used to as=
k
> > > the kernel to program an initial timeout value into the watchdog devi=
ce.
> > > But what if one doesn't want to start the watchdog device at kernel
> > > boot, but just indicate that the RTC has that capability?
> >
> > Yeah, I guess you're right.
>
> I agree, too. The initial suggestion looks fine.
>
> > > It's quite possible that if it can act as a watchdog device (and
> > > has-watchdog was also suggested), one would also want timeout-sec and
> > > other watchdog bindings to apply. But that can be added later, by tho=
se
> > > who actually want that.
> > >
> > > For now, I'd really like to get my board booting again (or rather, no=
t
> > > get reset by the real watchdog just because the pcf2127 driver now
> > > exposes something as /dev/wathdog0, pushing the real one to
> > > /dev/wathcdog1 which doesn't get pinged from userspace).
> >
> > I'm wondering how you solve which wdog to ping when there are multiple
> > without relying on numbering. I guess 'reset-source' will solve that
> > even if that's not your current fix. So I guess I'm fine with this.
>
> I guess you'd need some udev magic that ensures that the right watchdog
> always gets the same number.

Why involve udev and keep the magic numbering important? Provide
enough details on watchdogs' features so an intelligent decision can
be made. It's the same thing every time folks try to number things in
DT.

Rob

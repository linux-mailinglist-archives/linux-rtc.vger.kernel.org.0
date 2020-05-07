Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27BA1C8C60
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 15:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgEGNak (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 09:30:40 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:34953 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgEGNai (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 May 2020 09:30:38 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MNccf-1jmzKh2H0d-00P3HH; Thu, 07 May 2020 15:30:36 +0200
Received: by mail-qk1-f170.google.com with SMTP id c64so5919026qkf.12;
        Thu, 07 May 2020 06:30:36 -0700 (PDT)
X-Gm-Message-State: AGi0PuZOna6DrfvPobXUaOFI2s2I/9zMX1o42KmB6Si5LjPhtbI1LkVC
        VT7Nu5GUwDfytozLlOAlzKwMebct48uhHI/U2ts=
X-Google-Smtp-Source: APiQypLJNp7YV/2uuF1Na6/EtZcY4wn3A6+1qdmSfzt7FWpXKSWZwC8njcVMZ0oKrn+7erfXyM2eyxNsU39GeRGDdsM=
X-Received: by 2002:a37:b543:: with SMTP id e64mr14367745qkf.394.1588858235226;
 Thu, 07 May 2020 06:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
 <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 7 May 2020 15:30:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
Message-ID: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Sinan Kaya <okaya@codeaurora.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VV4mhag20ejTggH8RKiQHnviNGmETBc1ulawZ8x0ZoQq8B3STS5
 SpHWOc2T/GwXPfVqdrzaAmWLHa7b8D8dxXju04ufPXVmf2jTJnqiyOUMxO3ScEULoys1lvO
 ovEc+vzdxFG/XVlm1K9sa4WrQXX56p8TabS4Rxri0ZjRxIt1KQETBW3Eb/QqUoPwe4bfjN5
 QXcnQ8iVD/iit2V/XI6Kw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9+Kv3lA8EAc=:aKNq64v0y2wYEQv64q/seb
 Q9gEcxUnaAfE0XHwWo1vL7AX61KNS/Ze2/nXFMIgyLrsohlpejxRrb+2QyGgCjvudqRBQBS3M
 rsjNAbxTLFQNrlYMLJ8qzuPboNyzdnsifO9Jjel8VTKP0nhOXpC2Uj7HjCmnRJokgmHU4bx4K
 9REn84KuDOf96gQfE7nO6dVrpJoFL7pQHqHY+OQbZhbI6SuooGZru6RNkdQ4j6w5QUReTiPKZ
 CL3Q5JNbAV1ukb6Hsmh8LaxsDYWI8JCY4dRUaY09d2olZjVBtCLTmHMG208Ywr3HXCWQmaHu4
 5SJ2+2lxVw0UJEUTQbZxzJ/7RWQGORhhOup42/5pOE6+e8fdiMal6ooLXK9zNetJILvpBOBkb
 sIWonEUDVpADqLhcjLt0BySpK8/ln3gs4jAy0IGuqMDgXrrl2dwBJXIf5AsO3rGaB08dbCYIm
 JShTm2k4kkVZ+SWKIfGVJnf9+x3h2QtPl6L+1+KMRLpyUq4+NW+WrF/087dbXH5eNcMKglrwf
 6y0vP40w3nA90v9d/IRbA4YrNBGOCZMnn5lwqqTZ5OqqNCtOp2yi9Y51d4Gm/LmCwKYhvpQgC
 0JrPQY29bH8atxU+9Kou5+T9X8MA79T6nQBM5E/sHT5cFYEKy0fe+utPO8klbNLfydslhkC+p
 yCHLRVfjcPenQwvJgfR+Qv/pk7Cn9gkUTmHf4zVRgoI0R9x2kRc2Ddv4cuBTXtlZXegPOGyx8
 h7gvGtt6tr/+G2Y4GovSVlwHMMwD8p+6fD4aV/BkoRObO7xStSt9/eb2igPWjW8tq31fhXi+6
 jldU1/12ief77Lk0P8EDlA/2NxW+zh2mGKkbtsw1+mVbgDkjus=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 7, 2020 at 10:06 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
> On Wed, 6 May 2020, Mikulas Patocka wrote:
> > On Wed, 6 May 2020, Arnd Bergmann wrote:
> > > On Wed, May 6, 2020 at 1:21 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > >
> > > >  /*
> > > >   * The yet supported machines all access the RTC index register via
> > > >   * an ISA port access but the way to access the date register differs ...
> > > > + *
> > > > + * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
> > > > + * we need to add a small delay.
> > > >   */
> > > >  #define CMOS_READ(addr) ({ \
> > > >  outb_p((addr),RTC_PORT(0)); \
> > > > +udelay(2); \
> > > >  inb_p(RTC_PORT(1)); \
> > >
> > >
> > > The inb_p() / outb_p() functions are meant to already have a delay in them,
> > > maybe we should just add it there for alpha?
> > >
> > >      Arnd
> >
> > Yes, that is possible too - it fixes the real time clock hang for me.
> >
> >
> > -#define inb_p                inb
> > -#define inw_p                inw
> > -#define inl_p                inl
> > +#define inb_p(x)     (ndelay(300), inb(x))
> > +#define inw_p(x)     (ndelay(300), inw(x))
> > +#define inl_p(x)     (ndelay(300), inl(x))
> >  #define outb_p               outb
> >  #define outw_p               outw
> >  #define outl_p               outl
>
> 300ns was too low. We need at least 1400ns to fix the hang reliably.

Are you sure that it is in fact the timing that is important here and not
a barrier? I see that inb() is written in terms of readb(), but the
barrier requirements for I/O space are a bit different from those
on PCI memory space.

In the example you gave first, there is a an outb_p() followed by inb_p().
These are normally serialized by the bus, but I/O space also has the
requirement that an outb() completes before we get to the next
instruction (non-posted write), while writeb() is generally posted and
only needs a barrier before the write rather than both before and after
like outb.

    Arnd

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B883D1C93B2
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 17:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgEGPI2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 11:08:28 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:38589 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgEGPI1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 May 2020 11:08:27 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MxYT3-1jDQ8J09Rh-00xqib; Thu, 07 May 2020 17:08:26 +0200
Received: by mail-lj1-f180.google.com with SMTP id u6so6691942ljl.6;
        Thu, 07 May 2020 08:08:25 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ2/09WwbuOdVdAzWDg2MEtbenENTg99YBePJ8UVzzCG3fl94py
        OVAGlIjVogVpDQfi58+Xm7050yy//U53MrPfbcA=
X-Google-Smtp-Source: APiQypKc1KMZzvG4fxxt/Zx65G7XDitSGJW7AY6O5mw60c9L9cyi7P+uoqDisbUCXbomCvJclFxRT6IlNlD+bdpev5k=
X-Received: by 2002:a05:651c:107a:: with SMTP id y26mr8803044ljm.80.1588864105373;
 Thu, 07 May 2020 08:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
 <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 7 May 2020 17:08:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Message-ID: <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Kw0sRAjy3EO2JDIMsJk0VUIAY5hFKOEEdBxZg+ExLrEm7BdVIpx
 0j1h41MFHHG0qKLqiFozq42kqCYpjViVf7yxNDHzea/PSX3eZORhVf2B0WF4ahUqUjQJPYh
 i4vL6QZjK5PDQE2iPsQ3fZ2EkK8NKjHvkPSU1CGrtvy7JZVJzahnnCBcn01kqWjvqC7BgP0
 53Yg3DFEaEVLGgv3yz+gg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oe+P9e+Zc6I=:4jiIuExhbceUtL9fXPgHvy
 UVdSKhhj6/GidJOJ6iHgipujVJOXLR3YUzSNTu/3gdpH/gdN+ni14r8x8jK89GtWAH8qCY0Oe
 TP159Z7utao3eU1fVjPqWbfHFFytiLCWIxfMxcnMUKJFykKBUHS1SxhlKVDWKlcETAKG6OeYc
 sRqSBacIZxjv6M3l2umQdd/IbdekVj3asMlyOWacvwQzo20nu6LsMm/id0rfylcbXu4OBxE0Z
 kF6ihYhK6jl+TtST6dv7Zcg1FOXPWtsZjFWwGX+Kcv5X5yrnPrfYIiTiwDQUfx4gEBvWwBAsq
 ei3h80py8BGc1KZ8CV/8qrxc53aeXnnLR47lbXkJTJ0Yug94BjgPDI8JiQhoyvU+zpAOgDDvV
 3rdjjda04TPdpOo0rjrW46Fvj02mMDvaPX3rXBXKi4TKf7qBnAK8osFekGPrh83+hjRJEjsFD
 9038hFMi8jV0ZIZmMVt9CkD9109BTRMks5ManGsW9d3OBhQ6SFVkWLCYVw2NcssLAzEp+Kfhu
 daMD7ES3wwRoIJVHrdWrYcXw0LhuajZi+vJaB6pWlqXAEE3Vq3Ir8cDipiBPLkqUqcp8KFyTF
 p6opbojr8XE2yrlM5n6RRMsfeAUUja59AATGmU5Xk2n6Hf4vgjm/9rRpmbxzHac3R8H7Nqe3F
 VDqXdyGIeyiF48Dot7w32ma0XbnjR56OuSxuyJI9engrnLiD1IF1qixjLQVwuA5ZnJQJwsNPK
 mrKjM3fcfdO8oYnPHCjvw0jHVE9NNrrhexWZ7+0qK1bgX5TIPngfTg0Q47FRvfgxNMPkhqMsV
 Q8+dWVzP5LwhPjGn0WrW66dM3E0b1HQFXuQPXh2GZUHmtB21Ww=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 7, 2020 at 4:09 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> On Thu, 7 May 2020, Arnd Bergmann wrote:
> > On Thu, May 7, 2020 at 10:06 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> > Are you sure that it is in fact the timing that is important here and not
> > a barrier? I see that inb() is written in terms of readb(), but the
> > barrier requirements for I/O space are a bit different from those
> > on PCI memory space.
>
> The "in" and "out" instructions are serializing on x86. But alpha doesn't
> have dedicated instructions for accessing ports.
>
> Do you think that all the "in[bwl]" and "out[bwl]" macros on alpha should
> be protected by two memory barriers, to emulate the x86 behavior?

That's what we do on some other architectures to emulate the non-posted
behavior of out[bwl], as required by PCI. I can't think of any reasons to
have a barrier before in[bwl], or after write[bwl], but we generally want
one after out[bwl]

> > In the example you gave first, there is a an outb_p() followed by inb_p().
> > These are normally serialized by the bus, but I/O space also has the
> > requirement that an outb() completes before we get to the next
> > instruction (non-posted write), while writeb() is generally posted and
> > only needs a barrier before the write rather than both before and after
> > like outb.
>
> I think that the fact that "writeb" is posted is exactly the problem - it
> gets posted, the processor goes on, sends "readb" and they arrive
> back-to-back to the ISA bus. The ISA bus device doesn't like back-to-back
> accesses and locks up.
>
> Anyway - you can change the "ndelay()" function in this patch to "mb()" -
> "mb()" will provide long enough delay that it fixes this bug.

My preference would be to have whatever makes most sense in theory
and also fixes the problem. If there is some documentation that
says you need a certain amount of time between accesses regardless
of the barriers, then that is fine. I do wonder if there is anything
enforcing the "rpcc" in _delay() to come after the store if there is no
barrier between the two, otherwise the delay method still seems
unreliable.

The barrier after the store at least makes sense to me based on
the theory, both with and without a delay in outb_p().

      Arnd

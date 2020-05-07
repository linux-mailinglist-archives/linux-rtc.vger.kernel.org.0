Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D168F1C8DE1
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 16:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgEGOJl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 10:09:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39307 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726756AbgEGOJj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 May 2020 10:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588860577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fh07MPgVK9wN+Aq5G1NH1K8YQqzBKRp2vvUt+gQpC7Q=;
        b=didKkA6Ph/4cWzFtDj1HvsSTMSnpIr/TJZeFrZ8IE6zXeXcTdISS7+t3R1qi3ry+NjIRqI
        +dD6/FaEtNPf+2d6cuiPO3RR6CqJ7TNZiEUnKopBWCU5zrQoU3/2mxtwANcl2avyko9OQq
        +iFU7euk8NssbJpbYusjWjTaZ+hKuIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-vZYag7oeN2SSaHBG5wU58Q-1; Thu, 07 May 2020 10:09:35 -0400
X-MC-Unique: vZYag7oeN2SSaHBG5wU58Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DEF0100A8F9;
        Thu,  7 May 2020 14:09:34 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 06FD22E045;
        Thu,  7 May 2020 14:09:33 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 047E9XKj005448;
        Thu, 7 May 2020 10:09:33 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 047E9XVI005444;
        Thu, 7 May 2020 10:09:33 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 7 May 2020 10:09:33 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Thu, 7 May 2020, Arnd Bergmann wrote:

> On Thu, May 7, 2020 at 10:06 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > On Wed, 6 May 2020, Mikulas Patocka wrote:
> > > On Wed, 6 May 2020, Arnd Bergmann wrote:
> > > > On Wed, May 6, 2020 at 1:21 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > > >
> > > > >  /*
> > > > >   * The yet supported machines all access the RTC index register via
> > > > >   * an ISA port access but the way to access the date register differs ...
> > > > > + *
> > > > > + * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
> > > > > + * we need to add a small delay.
> > > > >   */
> > > > >  #define CMOS_READ(addr) ({ \
> > > > >  outb_p((addr),RTC_PORT(0)); \
> > > > > +udelay(2); \
> > > > >  inb_p(RTC_PORT(1)); \
> > > >
> > > >
> > > > The inb_p() / outb_p() functions are meant to already have a delay in them,
> > > > maybe we should just add it there for alpha?
> > > >
> > > >      Arnd
> > >
> > > Yes, that is possible too - it fixes the real time clock hang for me.
> > >
> > >
> > > -#define inb_p                inb
> > > -#define inw_p                inw
> > > -#define inl_p                inl
> > > +#define inb_p(x)     (ndelay(300), inb(x))
> > > +#define inw_p(x)     (ndelay(300), inw(x))
> > > +#define inl_p(x)     (ndelay(300), inl(x))
> > >  #define outb_p               outb
> > >  #define outw_p               outw
> > >  #define outl_p               outl
> >
> > 300ns was too low. We need at least 1400ns to fix the hang reliably.
> 
> Are you sure that it is in fact the timing that is important here and not
> a barrier? I see that inb() is written in terms of readb(), but the
> barrier requirements for I/O space are a bit different from those
> on PCI memory space.

The "in" and "out" instructions are serializing on x86. But alpha doesn't 
have dedicated instructions for accessing ports.

Do you think that all the "in[bwl]" and "out[bwl]" macros on alpha should 
be protected by two memory barriers, to emulate the x86 behavior?

> In the example you gave first, there is a an outb_p() followed by inb_p().
> These are normally serialized by the bus, but I/O space also has the
> requirement that an outb() completes before we get to the next
> instruction (non-posted write), while writeb() is generally posted and
> only needs a barrier before the write rather than both before and after
> like outb.
> 
>     Arnd

I think that the fact that "writeb" is posted is exactly the problem - it 
gets posted, the processor goes on, sends "readb" and they arrive 
back-to-back to the ISA bus. The ISA bus device doesn't like back-to-back 
accesses and locks up.

Anyway - you can change the "ndelay()" function in this patch to "mb()" - 
"mb()" will provide long enough delay that it fixes this bug.

Mikulas


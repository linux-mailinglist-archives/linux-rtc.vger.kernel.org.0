Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8189F1C7582
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 17:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbgEFP5Q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 11:57:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43895 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729883AbgEFP5Q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 May 2020 11:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588780634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cmGtqLKbdcuk3GEDBRY8pjioOEUIcpSAuT0yu/iJDjA=;
        b=KBqROWa/+HYK8S/pl/UXzgs/ruLAt5G1rS6SP2znlOxdb0XU4f+skW7oCHnPQuY/pFmz7m
        j9qERethcXBwPsZqqvPhgCr+syUy2zjqmHOUAKQD7q9H/kXiLpEzj84W0ssmk2VqCix3JQ
        HVLQihxoJImYame7pLHAjWGMGgzrl0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-g6fqxtzTPAayF5gxIhVxvw-1; Wed, 06 May 2020 11:57:11 -0400
X-MC-Unique: g6fqxtzTPAayF5gxIhVxvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5446B185547A;
        Wed,  6 May 2020 15:57:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2239860BEC;
        Wed,  6 May 2020 15:57:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 046Fv8iW018222;
        Wed, 6 May 2020 11:57:08 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 046Fv8dP018219;
        Wed, 6 May 2020 11:57:08 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 6 May 2020 11:57:08 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Sinan Kaya <okaya@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2 v2] alpha: add a delay before serial port read
In-Reply-To: <20200506154938.GA3537174@kroah.com>
Message-ID: <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com> <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Wed, 6 May 2020, Greg Kroah-Hartman wrote:

> On Wed, May 06, 2020 at 11:29:29AM -0400, Mikulas Patocka wrote:
> > 
> > 
> > On Wed, 6 May 2020, Greg Kroah-Hartman wrote:
> > 
> > > > Index: linux-stable/drivers/tty/serial/8250/8250_port.c
> > > > ===================================================================
> > > > --- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-06 08:25:19.000000000 +0200
> > > > +++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-06 09:04:17.000000000 +0200
> > > > @@ -442,6 +442,10 @@ static unsigned int mem32be_serial_in(st
> > > >  
> > > >  static unsigned int io_serial_in(struct uart_port *p, int offset)
> > > >  {
> > > > +#ifdef CONFIG_ALPHA
> > > > +/* we need a small delay, the Alpha Avanti chipset locks up with back-to-back accesses */
> > > > +	ndelay(300);
> > > > +#endif
> > > 
> > > We really do not like #ifdef in .c files, especially ones that cause a
> > > coding style violation :)
> > > 
> > > Why can't you do this as a quirk for this specific chipset?  You should
> > > tie it to the serial port hardware type, not to the CPU type.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Do you want this patch? It enables the delay based on the specific PCI-ISA 
> > bridge.
> > 
> > There is still "#if defined(CONFIG_ALPHA) && defined(CONFIG_PCI)" because 
> > if we want to reference a variable defined by the PCI subsystem in the 
> > arch/alpha tree, we must do it conditionally. If you want to get rid of 
> > these #ifs, please describe how.
> > 
> > Mikulas
> > 
> > 
> > From: Mikulas Patocka <mpatocka@redhat.com>
> > 
> > The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
> > barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
> > the Alpha Avanti platform.
> > 
> > The patch changes timing between accesses to the ISA bus, in particular,
> > it reduces the time between "write" access and a subsequent "read" access.
> > 
> > This causes lock-up when accessing the real time clock and serial ports.
> > 
> > This patch fixes the serial ports by adding a small delay before the "inb"
> > instruction.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> > Cc: stable@vger.kernel.org	# v4.17+
> > 
> > ---
> >  arch/alpha/include/asm/pci.h        |    2 ++
> >  arch/alpha/kernel/pci.c             |    4 ++++
> >  drivers/tty/serial/8250/8250_core.c |    7 +++++++
> >  drivers/tty/serial/8250/8250_port.c |    3 +++
> >  include/linux/serial_core.h         |    1 +
> >  5 files changed, 17 insertions(+)
> > 
> > Index: linux-stable/include/linux/serial_core.h
> > ===================================================================
> > --- linux-stable.orig/include/linux/serial_core.h	2020-05-06 17:16:28.000000000 +0200
> > +++ linux-stable/include/linux/serial_core.h	2020-05-06 17:16:28.000000000 +0200
> > @@ -154,6 +154,7 @@ struct uart_port {
> >  
> >  	/* quirks must be updated while holding port mutex */
> >  #define UPQ_NO_TXEN_TEST	BIT(0)
> > +#define UPQ_DELAY_BEFORE_READ	BIT(1)
> >  
> >  	unsigned int		read_status_mask;	/* driver specific */
> >  	unsigned int		ignore_status_mask;	/* driver specific */
> > Index: linux-stable/drivers/tty/serial/8250/8250_core.c
> > ===================================================================
> > --- linux-stable.orig/drivers/tty/serial/8250/8250_core.c	2020-05-06 17:16:28.000000000 +0200
> > +++ linux-stable/drivers/tty/serial/8250/8250_core.c	2020-05-06 17:16:28.000000000 +0200
> > @@ -37,6 +37,9 @@
> >  #ifdef CONFIG_SPARC
> >  #include <linux/sunserialcore.h>
> >  #endif
> > +#if defined(CONFIG_ALPHA) && defined(CONFIG_PCI)
> > +#include <linux/pci.h>
> > +#endif
> 
> Don't need the #if for this.

You're right.

> >  #include <asm/irq.h>
> >  
> > @@ -490,6 +493,10 @@ static void univ8250_rsa_support(struct
> >  static inline void serial8250_apply_quirks(struct uart_8250_port *up)
> >  {
> >  	up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
> > +#if defined(CONFIG_ALPHA) && defined(CONFIG_PCI)
> > +	if (alpha_serial_port_needs_delay)
> > +		up->port.quirks |= UPQ_DELAY_BEFORE_READ;
> > +#endif
> 
> Why is a #define needed here?
> 
> You can do this same type of change without any #ifdefs in any .c files
> and that would be much nicer.

Because alpha_serial_port_needs_delay is defined only on Alpha - so we 
need to guard accesses to it with #ifdef CONFIG_ALPHA - otherwise the 
kernel wouldn't link on non-Alpha platforms.

Should I make it defined for all architectures?

Mikulas


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C339A1C787A
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 19:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgEFRpc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 13:45:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728606AbgEFRpc (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 6 May 2020 13:45:32 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA7082080D;
        Wed,  6 May 2020 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588787131;
        bh=FC+L2GLWiMbL2ccPvEDdx2mvX8qcAbf+wHlhBeXXESE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G9PfYo2qyhQiS0/cDl48Ia5JNuGlSCvsbgwUsQrVyr5tTdE5sgsmoNcPZlYMgT66Q
         lmw0XwpN6KDmsJKbvETgnm/iZ+1V78JsVIhCv3KI9CBlCvIfbi5XENDjA6B0sz49vP
         yxY4j1sWMYJBXDgNhbK6Rp+cdcQM0yiYP8YZISBY=
Date:   Wed, 6 May 2020 19:45:28 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Sinan Kaya <okaya@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2 v3] alpha: add a delay before serial port read
Message-ID: <20200506174528.GB3711921@kroah.com>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506114711.GB3024358@kroah.com>
 <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506160823.GA3559699@kroah.com>
 <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, May 06, 2020 at 01:04:38PM -0400, Mikulas Patocka wrote:
> 
> 
> On Wed, 6 May 2020, Greg Kroah-Hartman wrote:
> 
> > On Wed, May 06, 2020 at 11:57:08AM -0400, Mikulas Patocka wrote:
> > > 
> > > 
> > > On Wed, 6 May 2020, Greg Kroah-Hartman wrote:
> > > 
> > > > On Wed, May 06, 2020 at 11:29:29AM -0400, Mikulas Patocka wrote:
> > > > > 
> > > > > @@ -490,6 +493,10 @@ static void univ8250_rsa_support(struct
> > > > >  static inline void serial8250_apply_quirks(struct uart_8250_port *up)
> > > > >  {
> > > > >  	up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
> > > > > +#if defined(CONFIG_ALPHA) && defined(CONFIG_PCI)
> > > > > +	if (alpha_serial_port_needs_delay)
> > > > > +		up->port.quirks |= UPQ_DELAY_BEFORE_READ;
> > > > > +#endif
> > > > 
> > > > Why is a #define needed here?
> > > > 
> > > > You can do this same type of change without any #ifdefs in any .c files
> > > > and that would be much nicer.
> > > 
> > > Because alpha_serial_port_needs_delay is defined only on Alpha - so we 
> > > need to guard accesses to it with #ifdef CONFIG_ALPHA - otherwise the 
> > > kernel wouldn't link on non-Alpha platforms.
> > > 
> > > Should I make it defined for all architectures?
> > 
> > Yes, it's not the first time we have had to do things like this :)
> 
> I've created this patch that adds a global macro/variable 
> serial_port_needs_delay. I've also deleted UPQ_DELAY_BEFORE_READ and test 
> serial_port_needs_delay directly in io_serial_in, so that the compiler 
> will optimize it out on non-alpha architectures.

That's not good, what about systems with hundreds of serial ports?

> > But, there is no other way to detect this based on hardware
> > signatures/types instead?  That is usually the best way to do it, right?
> 
> It's hard to detect Alpha without using '#ifdef CONFIG_ALPHA' :) The ISA 
> serial port hardware is simple, so I think that you can't distinguish it 
> just based on its behavior.

The ISA serial port hardware does not have a unique vendor/product id
somewhere?  Some other sort of definition that we can use to determine
exactly what type of system we are running on?



> 
> > thanks,
> > 
> > greg k-h
> > 
> 
> 
> From: Mikulas Patocka <mpatocka@redhat.com>
> 
> alpha: add a delay before serial port read
> 
> The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
> barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
> the Alpha Avanti platform.
> 
> The patch changes timing between accesses to the ISA bus, in particular,
> it reduces the time between "write" access and a subsequent "read" access.
> 
> This causes lock-up when accessing the real time clock and serial ports.
> 
> This patch fixes the serial ports by adding a small delay before the "inb"
> instruction.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> Cc: stable@vger.kernel.org	# v4.17+
> 
> ---
>  arch/alpha/include/asm/pci.h        |    3 +++
>  arch/alpha/kernel/pci.c             |    4 ++++
>  drivers/tty/serial/8250/8250_port.c |    4 ++++
>  include/linux/pci.h                 |    4 ++++
>  4 files changed, 15 insertions(+)
> 
> Index: linux-stable/arch/alpha/include/asm/pci.h
> ===================================================================
> --- linux-stable.orig/arch/alpha/include/asm/pci.h	2020-05-06 18:54:24.000000000 +0200
> +++ linux-stable/arch/alpha/include/asm/pci.h	2020-05-06 18:54:24.000000000 +0200
> @@ -97,4 +97,7 @@ extern void pci_adjust_legacy_attr(struc
>  extern int pci_create_resource_files(struct pci_dev *dev);
>  extern void pci_remove_resource_files(struct pci_dev *dev);
>  
> +extern int serial_port_needs_delay;
> +#define serial_port_needs_delay	serial_port_needs_delay
> +
>  #endif /* __ALPHA_PCI_H */
> Index: linux-stable/arch/alpha/kernel/pci.c
> ===================================================================
> --- linux-stable.orig/arch/alpha/kernel/pci.c	2020-05-06 18:54:24.000000000 +0200
> +++ linux-stable/arch/alpha/kernel/pci.c	2020-05-06 18:54:24.000000000 +0200
> @@ -61,9 +61,13 @@ struct pci_controller *pci_isa_hose;
>   * Quirks.
>   */
>  
> +int serial_port_needs_delay = 0;
> +EXPORT_SYMBOL(serial_port_needs_delay);
> +
>  static void quirk_isa_bridge(struct pci_dev *dev)
>  {
>  	dev->class = PCI_CLASS_BRIDGE_ISA << 8;
> +	serial_port_needs_delay = 1;
>  }
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82378, quirk_isa_bridge);
>  
> Index: linux-stable/drivers/tty/serial/8250/8250_port.c
> ===================================================================
> --- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-06 18:54:24.000000000 +0200
> +++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-06 18:54:24.000000000 +0200
> @@ -30,6 +30,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/ktime.h>
> +#include <linux/pci.h>
>  
>  #include <asm/io.h>
>  #include <asm/irq.h>
> @@ -442,6 +443,9 @@ static unsigned int mem32be_serial_in(st
>  
>  static unsigned int io_serial_in(struct uart_port *p, int offset)
>  {
> +	if (serial_port_needs_delay)
> +		ndelay(300);

Again, this should be a per-port thing, not all ports in the system are
this broken, right?

thanks,

greg k-h

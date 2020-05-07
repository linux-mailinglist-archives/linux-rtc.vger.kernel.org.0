Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49161C8D1E
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 15:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgEGN6m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 09:58:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgEGN6m (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 7 May 2020 09:58:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2A4C2073A;
        Thu,  7 May 2020 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588859921;
        bh=hHNVI9XVK6kTyF7ZNA+wVBhmTUd1NmRvhF4KOn40WG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NsLJx9wLFMUUjJsa4zds69au7kCSOk3QdS08jbLrvh58hdTPpT0gfgle2FNvtuxMO
         x8CYEPyfZHjSW62EAsSp48uWQpcGFSpdFOdbAd0yy5kVsfz7pAlaPnuSm4+GD1e4xI
         /StJAHSLncmZS/Uiq8A5boGhLNRJziDsZNVjNkx0=
Date:   Thu, 7 May 2020 15:58:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2 v5] alpha: add a delay before serial port read
Message-ID: <20200507135839.GA1803635@kroah.com>
References: <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506160823.GA3559699@kroah.com>
 <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506174528.GB3711921@kroah.com>
 <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
 <20200507085201.GA1097552@kroah.com>
 <alpine.LRH.2.02.2005070645330.18423@file01.intranet.prod.int.rdu2.redhat.com>
 <20200507111037.GB1490467@kroah.com>
 <alpine.LRH.2.02.2005070853110.27409@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2005070853110.27409@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 07, 2020 at 08:57:09AM -0400, Mikulas Patocka wrote:
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
> We introduce a global variable
> alpha_has_broken_serial_ports_and_needs_delay - it is defined on Alpha and
> it is set to 1 if we have the specific PCI-ISA bridge where this bug
> occurs. We also introduce a new per-port flag UPQ_DELAY_BEFORE_READ, the
> flag is set if alpha_has_broken_serial_ports_and_needs_delay is set and if
> the serial port is an ISA port.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> Cc: stable@vger.kernel.org	# v4.17+
> 
> ---
>  arch/alpha/include/asm/serial.h     |    5 +++++
>  arch/alpha/kernel/pci.c             |    5 +++++
>  drivers/tty/serial/8250/8250_core.c |   17 +++++++++++------
>  drivers/tty/serial/8250/8250_port.c |    3 +++
>  include/linux/serial_core.h         |    1 +
>  5 files changed, 25 insertions(+), 6 deletions(-)
> 
> Index: linux-stable/arch/alpha/kernel/pci.c
> ===================================================================
> --- linux-stable.orig/arch/alpha/kernel/pci.c	2020-05-07 09:57:02.000000000 +0200
> +++ linux-stable/arch/alpha/kernel/pci.c	2020-05-07 14:30:07.000000000 +0200
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/syscalls.h>
>  #include <asm/machvec.h>
> +#include <asm/serial.h>
>  
>  #include "proto.h"
>  #include "pci_impl.h"
> @@ -61,9 +62,13 @@ struct pci_controller *pci_isa_hose;
>   * Quirks.
>   */
>  
> +int alpha_has_broken_serial_ports_and_needs_delay = 0;
> +EXPORT_SYMBOL(alpha_has_broken_serial_ports_and_needs_delay);
> +
>  static void quirk_isa_bridge(struct pci_dev *dev)
>  {
>  	dev->class = PCI_CLASS_BRIDGE_ISA << 8;
> +	alpha_has_broken_serial_ports_and_needs_delay = 1;
>  }
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82378, quirk_isa_bridge);
>  
> Index: linux-stable/drivers/tty/serial/8250/8250_port.c
> ===================================================================
> --- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-07 09:57:02.000000000 +0200
> +++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-07 09:57:02.000000000 +0200
> @@ -442,6 +442,9 @@ static unsigned int mem32be_serial_in(st
>  
>  static unsigned int io_serial_in(struct uart_port *p, int offset)
>  {
> +	if (unlikely(p->quirks & UPQ_DELAY_BEFORE_READ))
> +		ndelay(300);
> +
>  	offset = offset << p->regshift;
>  	return inb(p->iobase + offset);
>  }
> Index: linux-stable/drivers/tty/serial/8250/8250_core.c
> ===================================================================
> --- linux-stable.orig/drivers/tty/serial/8250/8250_core.c	2020-05-07 09:57:02.000000000 +0200
> +++ linux-stable/drivers/tty/serial/8250/8250_core.c	2020-05-07 14:34:16.000000000 +0200
> @@ -487,9 +487,20 @@ static void univ8250_rsa_support(struct
>  #define univ8250_rsa_support(x)		do { } while (0)
>  #endif /* CONFIG_SERIAL_8250_RSA */
>  
> +/*
> + * This "device" covers _all_ ISA 8250-compatible serial devices listed
> + * in the table in include/asm/serial.h
> + */
> +static struct platform_device *serial8250_isa_devs;
> +
>  static inline void serial8250_apply_quirks(struct uart_8250_port *up)
>  {
>  	up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
> +#ifdef alpha_has_broken_serial_ports_and_needs_delay

That is a symbol, not a define, how does that work?

greg k-h

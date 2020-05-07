Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C731C849F
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 10:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgEGIS6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 04:18:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25454 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725849AbgEGIS5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 May 2020 04:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588839535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qspgtcZm0CaRQEUxWr1T4kAFc2ZbtqSE5CP5g8UaW5Q=;
        b=MJIe50Fjc09lq9T7aDoDjpIwDlZoIT2kYlFlorab4JXQa7o+x7bI8lC45JZgvxT0O/A4E/
        c46Yx8CKLpf5MiT0/66SmC4lL+PFl4vmlW5AuHSEcG+xx3RzYxY/gw7HmdveVbOE5MFd4T
        t94QMDYOonRkA0pJjNI/HX1eqxZmlbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-WvjSostANmmgppxFTzBmzA-1; Thu, 07 May 2020 04:18:51 -0400
X-MC-Unique: WvjSostANmmgppxFTzBmzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C61419057A0;
        Thu,  7 May 2020 08:18:50 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 30B9261527;
        Thu,  7 May 2020 08:18:49 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 0478InHX007344;
        Thu, 7 May 2020 04:18:49 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 0478InYx007340;
        Thu, 7 May 2020 04:18:49 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 7 May 2020 04:18:49 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 2/2 v4] alpha: add a delay before serial port read
In-Reply-To: <20200506174528.GB3711921@kroah.com>
Message-ID: <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com> <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506160823.GA3559699@kroah.com> <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com> <20200506174528.GB3711921@kroah.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Wed, 6 May 2020, Greg Kroah-Hartman wrote:

> On Wed, May 06, 2020 at 01:04:38PM -0400, Mikulas Patocka wrote:
> > 
> > I've created this patch that adds a global macro/variable 
> > serial_port_needs_delay. I've also deleted UPQ_DELAY_BEFORE_READ and test 
> > serial_port_needs_delay directly in io_serial_in, so that the compiler 
> > will optimize it out on non-alpha architectures.
> 
> That's not good, what about systems with hundreds of serial ports?

I doubt that someone will conect hundreds of serial ports to such an old 
alpha machine :)

> > > But, there is no other way to detect this based on hardware
> > > signatures/types instead?  That is usually the best way to do it, right?
> > 
> > It's hard to detect Alpha without using '#ifdef CONFIG_ALPHA' :) The ISA 
> > serial port hardware is simple, so I think that you can't distinguish it 
> > just based on its behavior.
> 
> The ISA serial port hardware does not have a unique vendor/product id
> somewhere?  Some other sort of definition that we can use to determine
> exactly what type of system we are running on?

AFAIK it doesn't. You can only distinguish 8250, 16550 and 16550A - but 
not the vendor.

> > Index: linux-stable/drivers/tty/serial/8250/8250_port.c
> > ===================================================================
> > --- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-06 18:54:24.000000000 +0200
> > +++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-06 18:54:24.000000000 +0200
> > @@ -30,6 +30,7 @@
> >  #include <linux/uaccess.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/ktime.h>
> > +#include <linux/pci.h>
> >  
> >  #include <asm/io.h>
> >  #include <asm/irq.h>
> > @@ -442,6 +443,9 @@ static unsigned int mem32be_serial_in(st
> >  
> >  static unsigned int io_serial_in(struct uart_port *p, int offset)
> >  {
> > +	if (serial_port_needs_delay)
> > +		ndelay(300);
> 
> Again, this should be a per-port thing, not all ports in the system are
> this broken, right?
> 
> thanks,
> 
> greg k-h

Here is the patch that uses per-port flag UPQ_DELAY_BEFORE_READ. The flag 
is activated if we have the specific PCI-ISA bridge and if the serial port 
is an ISA port.

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>

The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
the Alpha Avanti platform.

The patch changes timing between accesses to the ISA bus, in particular,
it reduces the time between "write" access and a subsequent "read" access.

This causes lock-up when accessing the real time clock and serial ports.

This patch fixes the serial ports by adding a small delay before the "inb"
instruction.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/pci.h        |    3 +++
 arch/alpha/kernel/pci.c             |    4 ++++
 drivers/tty/serial/8250/8250_core.c |   15 +++++++++------
 drivers/tty/serial/8250/8250_port.c |    3 +++
 include/linux/pci.h                 |    4 ++++
 include/linux/serial_core.h         |    1 +
 6 files changed, 24 insertions(+), 6 deletions(-)

Index: linux-stable/arch/alpha/include/asm/pci.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/pci.h	2020-05-07 09:54:55.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/pci.h	2020-05-07 09:54:55.000000000 +0200
@@ -97,4 +97,7 @@ extern void pci_adjust_legacy_attr(struc
 extern int pci_create_resource_files(struct pci_dev *dev);
 extern void pci_remove_resource_files(struct pci_dev *dev);
 
+extern int serial_port_needs_delay;
+#define serial_port_needs_delay	serial_port_needs_delay
+
 #endif /* __ALPHA_PCI_H */
Index: linux-stable/arch/alpha/kernel/pci.c
===================================================================
--- linux-stable.orig/arch/alpha/kernel/pci.c	2020-05-07 09:54:55.000000000 +0200
+++ linux-stable/arch/alpha/kernel/pci.c	2020-05-07 09:54:55.000000000 +0200
@@ -61,9 +61,13 @@ struct pci_controller *pci_isa_hose;
  * Quirks.
  */
 
+int serial_port_needs_delay = 0;
+EXPORT_SYMBOL(serial_port_needs_delay);
+
 static void quirk_isa_bridge(struct pci_dev *dev)
 {
 	dev->class = PCI_CLASS_BRIDGE_ISA << 8;
+	serial_port_needs_delay = 1;
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82378, quirk_isa_bridge);
 
Index: linux-stable/drivers/tty/serial/8250/8250_port.c
===================================================================
--- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-07 09:54:55.000000000 +0200
+++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-07 09:54:55.000000000 +0200
@@ -442,6 +442,9 @@ static unsigned int mem32be_serial_in(st
 
 static unsigned int io_serial_in(struct uart_port *p, int offset)
 {
+	if (unlikely(p->quirks & UPQ_DELAY_BEFORE_READ))
+		ndelay(300);
+
 	offset = offset << p->regshift;
 	return inb(p->iobase + offset);
 }
Index: linux-stable/include/linux/pci.h
===================================================================
--- linux-stable.orig/include/linux/pci.h	2020-05-07 09:54:55.000000000 +0200
+++ linux-stable/include/linux/pci.h	2020-05-07 09:54:55.000000000 +0200
@@ -2384,6 +2384,10 @@ static inline bool pci_is_thunderbolt_at
 	return false;
 }
 
+#ifndef serial_port_needs_delay
+#define serial_port_needs_delay	0
+#endif
+
 #if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH)
 void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 #endif
Index: linux-stable/drivers/tty/serial/8250/8250_core.c
===================================================================
--- linux-stable.orig/drivers/tty/serial/8250/8250_core.c	2020-05-07 09:54:55.000000000 +0200
+++ linux-stable/drivers/tty/serial/8250/8250_core.c	2020-05-07 09:54:55.000000000 +0200
@@ -34,6 +34,7 @@
 #include <linux/uaccess.h>
 #include <linux/pm_runtime.h>
 #include <linux/io.h>
+#include <linux/pci.h>
 #ifdef CONFIG_SPARC
 #include <linux/sunserialcore.h>
 #endif
@@ -487,9 +488,17 @@ static void univ8250_rsa_support(struct
 #define univ8250_rsa_support(x)		do { } while (0)
 #endif /* CONFIG_SERIAL_8250_RSA */
 
+/*
+ * This "device" covers _all_ ISA 8250-compatible serial devices listed
+ * in the table in include/asm/serial.h
+ */
+static struct platform_device *serial8250_isa_devs;
+
 static inline void serial8250_apply_quirks(struct uart_8250_port *up)
 {
 	up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
+	if (serial_port_needs_delay && serial8250_isa_devs && up->port.dev == &serial8250_isa_devs->dev)
+		up->port.quirks |= UPQ_DELAY_BEFORE_READ;
 }
 
 static void __init serial8250_isa_init_ports(void)
@@ -903,12 +912,6 @@ static struct platform_driver serial8250
 };
 
 /*
- * This "device" covers _all_ ISA 8250-compatible serial devices listed
- * in the table in include/asm/serial.h
- */
-static struct platform_device *serial8250_isa_devs;
-
-/*
  * serial8250_register_8250_port and serial8250_unregister_port allows for
  * 16x50 serial ports to be configured at run-time, to support PCMCIA
  * modems and PCI multiport cards.
Index: linux-stable/include/linux/serial_core.h
===================================================================
--- linux-stable.orig/include/linux/serial_core.h	2020-05-07 09:54:55.000000000 +0200
+++ linux-stable/include/linux/serial_core.h	2020-05-07 09:54:55.000000000 +0200
@@ -154,6 +154,7 @@ struct uart_port {
 
 	/* quirks must be updated while holding port mutex */
 #define UPQ_NO_TXEN_TEST	BIT(0)
+#define UPQ_DELAY_BEFORE_READ	BIT(1)
 
 	unsigned int		read_status_mask;	/* driver specific */
 	unsigned int		ignore_status_mask;	/* driver specific */


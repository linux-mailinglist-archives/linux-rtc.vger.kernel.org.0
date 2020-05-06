Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F50E1C7758
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 19:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbgEFREs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 13:04:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24764 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729414AbgEFREs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 May 2020 13:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588784686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wjZFNGG1vYI43O4pfQ5JvmnuBZcXj6ULJIr0eYxRPg4=;
        b=PrsNf/OnlZqRq+jyyHYAG2Y5iIQS7+IKp4GKQSxCqqMLpZOkJwtdVpoWec11qTdhTL6Jm3
        3rWnXX7LqXHf15MHGiZsJiQs0Ddsc7NskrNN+IlJ5wqVplzNfbzh3AN1lwLorHq/rUgU+M
        dbThw9X1iD6mLh73aIir6dSxFjyGp0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-NfVJ3vBwNdGZwVQTr9g7mQ-1; Wed, 06 May 2020 13:04:42 -0400
X-MC-Unique: NfVJ3vBwNdGZwVQTr9g7mQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 336EC835B69;
        Wed,  6 May 2020 17:04:39 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id F3F1F60C18;
        Wed,  6 May 2020 17:04:38 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 046H4chk023996;
        Wed, 6 May 2020 13:04:38 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 046H4cLb023991;
        Wed, 6 May 2020 13:04:38 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 6 May 2020 13:04:38 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Sinan Kaya <okaya@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 2/2 v3] alpha: add a delay before serial port read
In-Reply-To: <20200506160823.GA3559699@kroah.com>
Message-ID: <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com> <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506160823.GA3559699@kroah.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Wed, 6 May 2020, Greg Kroah-Hartman wrote:

> On Wed, May 06, 2020 at 11:57:08AM -0400, Mikulas Patocka wrote:
> > 
> > 
> > On Wed, 6 May 2020, Greg Kroah-Hartman wrote:
> > 
> > > On Wed, May 06, 2020 at 11:29:29AM -0400, Mikulas Patocka wrote:
> > > > 
> > > > @@ -490,6 +493,10 @@ static void univ8250_rsa_support(struct
> > > >  static inline void serial8250_apply_quirks(struct uart_8250_port *up)
> > > >  {
> > > >  	up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
> > > > +#if defined(CONFIG_ALPHA) && defined(CONFIG_PCI)
> > > > +	if (alpha_serial_port_needs_delay)
> > > > +		up->port.quirks |= UPQ_DELAY_BEFORE_READ;
> > > > +#endif
> > > 
> > > Why is a #define needed here?
> > > 
> > > You can do this same type of change without any #ifdefs in any .c files
> > > and that would be much nicer.
> > 
> > Because alpha_serial_port_needs_delay is defined only on Alpha - so we 
> > need to guard accesses to it with #ifdef CONFIG_ALPHA - otherwise the 
> > kernel wouldn't link on non-Alpha platforms.
> > 
> > Should I make it defined for all architectures?
> 
> Yes, it's not the first time we have had to do things like this :)

I've created this patch that adds a global macro/variable 
serial_port_needs_delay. I've also deleted UPQ_DELAY_BEFORE_READ and test 
serial_port_needs_delay directly in io_serial_in, so that the compiler 
will optimize it out on non-alpha architectures.

> But, there is no other way to detect this based on hardware
> signatures/types instead?  That is usually the best way to do it, right?

It's hard to detect Alpha without using '#ifdef CONFIG_ALPHA' :) The ISA 
serial port hardware is simple, so I think that you can't distinguish it 
just based on its behavior.

> thanks,
> 
> greg k-h
> 


From: Mikulas Patocka <mpatocka@redhat.com>

alpha: add a delay before serial port read

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
 drivers/tty/serial/8250/8250_port.c |    4 ++++
 include/linux/pci.h                 |    4 ++++
 4 files changed, 15 insertions(+)

Index: linux-stable/arch/alpha/include/asm/pci.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/pci.h	2020-05-06 18:54:24.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/pci.h	2020-05-06 18:54:24.000000000 +0200
@@ -97,4 +97,7 @@ extern void pci_adjust_legacy_attr(struc
 extern int pci_create_resource_files(struct pci_dev *dev);
 extern void pci_remove_resource_files(struct pci_dev *dev);
 
+extern int serial_port_needs_delay;
+#define serial_port_needs_delay	serial_port_needs_delay
+
 #endif /* __ALPHA_PCI_H */
Index: linux-stable/arch/alpha/kernel/pci.c
===================================================================
--- linux-stable.orig/arch/alpha/kernel/pci.c	2020-05-06 18:54:24.000000000 +0200
+++ linux-stable/arch/alpha/kernel/pci.c	2020-05-06 18:54:24.000000000 +0200
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
--- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-06 18:54:24.000000000 +0200
+++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-06 18:54:24.000000000 +0200
@@ -30,6 +30,7 @@
 #include <linux/uaccess.h>
 #include <linux/pm_runtime.h>
 #include <linux/ktime.h>
+#include <linux/pci.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -442,6 +443,9 @@ static unsigned int mem32be_serial_in(st
 
 static unsigned int io_serial_in(struct uart_port *p, int offset)
 {
+	if (serial_port_needs_delay)
+		ndelay(300);
+
 	offset = offset << p->regshift;
 	return inb(p->iobase + offset);
 }
Index: linux-stable/include/linux/pci.h
===================================================================
--- linux-stable.orig/include/linux/pci.h	2020-05-06 18:54:24.000000000 +0200
+++ linux-stable/include/linux/pci.h	2020-05-06 18:54:24.000000000 +0200
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


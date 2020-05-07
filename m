Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D1A1C8B81
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 14:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgEGM5Q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 08:57:16 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40582 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725903AbgEGM5Q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 May 2020 08:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588856235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=imJZGDTe4z2HyReITMT/qm95brjONudPgjanrffDhRk=;
        b=YgN8roGbd32+2WArTKHwn54J3o4UirU6l/9Nl50rB1/TRbe+tGitezkMFjciCSBVGEjj+T
        h8WFulrnQ4WIOtZbqotrM03PETMZ9fBZQ2r3OgoPdzzfGL6ASsDFiarBgrxN6DXjRGvc89
        MeOMwJb8nVE5PKoJHJk+SvdRUttpQXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-tmKvoX4VP4q8FqfcJEjdtA-1; Thu, 07 May 2020 08:57:11 -0400
X-MC-Unique: tmKvoX4VP4q8FqfcJEjdtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F5078015CE;
        Thu,  7 May 2020 12:57:10 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 309276ACE7;
        Thu,  7 May 2020 12:57:10 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 047Cv9Hn029052;
        Thu, 7 May 2020 08:57:09 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 047Cv9TZ029049;
        Thu, 7 May 2020 08:57:09 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 7 May 2020 08:57:09 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 2/2 v5] alpha: add a delay before serial port read
In-Reply-To: <20200507111037.GB1490467@kroah.com>
Message-ID: <alpine.LRH.2.02.2005070853110.27409@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com> <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506160823.GA3559699@kroah.com> <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com> <20200506174528.GB3711921@kroah.com> <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com> <20200507085201.GA1097552@kroah.com>
 <alpine.LRH.2.02.2005070645330.18423@file01.intranet.prod.int.rdu2.redhat.com> <20200507111037.GB1490467@kroah.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
the Alpha Avanti platform.

The patch changes timing between accesses to the ISA bus, in particular,
it reduces the time between "write" access and a subsequent "read" access.

This causes lock-up when accessing the real time clock and serial ports.

This patch fixes the serial ports by adding a small delay before the "inb"
instruction.

We introduce a global variable
alpha_has_broken_serial_ports_and_needs_delay - it is defined on Alpha and
it is set to 1 if we have the specific PCI-ISA bridge where this bug
occurs. We also introduce a new per-port flag UPQ_DELAY_BEFORE_READ, the
flag is set if alpha_has_broken_serial_ports_and_needs_delay is set and if
the serial port is an ISA port.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/serial.h     |    5 +++++
 arch/alpha/kernel/pci.c             |    5 +++++
 drivers/tty/serial/8250/8250_core.c |   17 +++++++++++------
 drivers/tty/serial/8250/8250_port.c |    3 +++
 include/linux/serial_core.h         |    1 +
 5 files changed, 25 insertions(+), 6 deletions(-)

Index: linux-stable/arch/alpha/kernel/pci.c
===================================================================
--- linux-stable.orig/arch/alpha/kernel/pci.c	2020-05-07 09:57:02.000000000 +0200
+++ linux-stable/arch/alpha/kernel/pci.c	2020-05-07 14:30:07.000000000 +0200
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/syscalls.h>
 #include <asm/machvec.h>
+#include <asm/serial.h>
 
 #include "proto.h"
 #include "pci_impl.h"
@@ -61,9 +62,13 @@ struct pci_controller *pci_isa_hose;
  * Quirks.
  */
 
+int alpha_has_broken_serial_ports_and_needs_delay = 0;
+EXPORT_SYMBOL(alpha_has_broken_serial_ports_and_needs_delay);
+
 static void quirk_isa_bridge(struct pci_dev *dev)
 {
 	dev->class = PCI_CLASS_BRIDGE_ISA << 8;
+	alpha_has_broken_serial_ports_and_needs_delay = 1;
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82378, quirk_isa_bridge);
 
Index: linux-stable/drivers/tty/serial/8250/8250_port.c
===================================================================
--- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-07 09:57:02.000000000 +0200
+++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-07 09:57:02.000000000 +0200
@@ -442,6 +442,9 @@ static unsigned int mem32be_serial_in(st
 
 static unsigned int io_serial_in(struct uart_port *p, int offset)
 {
+	if (unlikely(p->quirks & UPQ_DELAY_BEFORE_READ))
+		ndelay(300);
+
 	offset = offset << p->regshift;
 	return inb(p->iobase + offset);
 }
Index: linux-stable/drivers/tty/serial/8250/8250_core.c
===================================================================
--- linux-stable.orig/drivers/tty/serial/8250/8250_core.c	2020-05-07 09:57:02.000000000 +0200
+++ linux-stable/drivers/tty/serial/8250/8250_core.c	2020-05-07 14:34:16.000000000 +0200
@@ -487,9 +487,20 @@ static void univ8250_rsa_support(struct
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
+#ifdef alpha_has_broken_serial_ports_and_needs_delay
+	if (alpha_has_broken_serial_ports_and_needs_delay &&
+	    serial8250_isa_devs && up->port.dev == &serial8250_isa_devs->dev)
+		up->port.quirks |= UPQ_DELAY_BEFORE_READ;
+#endif
 }
 
 static void __init serial8250_isa_init_ports(void)
@@ -903,12 +914,6 @@ static struct platform_driver serial8250
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
--- linux-stable.orig/include/linux/serial_core.h	2020-05-07 09:57:02.000000000 +0200
+++ linux-stable/include/linux/serial_core.h	2020-05-07 09:57:02.000000000 +0200
@@ -154,6 +154,7 @@ struct uart_port {
 
 	/* quirks must be updated while holding port mutex */
 #define UPQ_NO_TXEN_TEST	BIT(0)
+#define UPQ_DELAY_BEFORE_READ	BIT(1)
 
 	unsigned int		read_status_mask;	/* driver specific */
 	unsigned int		ignore_status_mask;	/* driver specific */
Index: linux-stable/arch/alpha/include/asm/serial.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/serial.h	2020-02-07 11:52:16.000000000 +0100
+++ linux-stable/arch/alpha/include/asm/serial.h	2020-05-07 14:48:21.000000000 +0200
@@ -28,3 +28,8 @@
 	{ 0, BASE_BAUD, 0x2F8, 3, STD_COM_FLAGS },	/* ttyS1 */	\
 	{ 0, BASE_BAUD, 0x3E8, 4, STD_COM_FLAGS },	/* ttyS2 */	\
 	{ 0, BASE_BAUD, 0x2E8, 3, STD_COM4_FLAGS },	/* ttyS3 */
+
+#ifdef CONFIG_PCI
+extern int alpha_has_broken_serial_ports_and_needs_delay;
+#define alpha_has_broken_serial_ports_and_needs_delay	alpha_has_broken_serial_ports_and_needs_delay
+#endif


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988AF1DF69A
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2020 12:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387712AbgEWK1D (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 May 2020 06:27:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50322 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725270AbgEWK1C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 May 2020 06:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590229620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2UH4RDo7XeZsk4P3MHp40lzVsGo3KJs+2KH6bAeqpWk=;
        b=HDf47q0z2WIXSw+LT0yRYFyt5ikiKZG1yiMKJWoziMsMkt0Cng8YEpNzdltvXWnvkrXA2j
        UDOVE2LZDnrDqp+6FqHTAYfJB2jhfweG+Gb9bJLj43HYarSgYq79T96VovsO+SFgDUbyV0
        9ft2Vae+h+cOerq2EbesGsna3MfpjaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-qIDrYcP8NYiaZCYpHcV1oA-1; Sat, 23 May 2020 06:26:58 -0400
X-MC-Unique: qIDrYcP8NYiaZCYpHcV1oA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5303B107ACCA;
        Sat, 23 May 2020 10:26:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B8DE260BE2;
        Sat, 23 May 2020 10:26:55 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 04NAQtC2022816;
        Sat, 23 May 2020 06:26:55 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 04NAQsQn022807;
        Sat, 23 May 2020 06:26:54 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sat, 23 May 2020 06:26:54 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>
cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v4] alpha: fix memory barriers so that they conform to the
 specification
In-Reply-To: <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The commits cd0e00c10672 and 92d7223a7423 broke boot on the Alpha Avanti
platform. The patches move memory barriers after a write before the write.
The result is that if there's iowrite followed by ioread, there is no
barrier between them.

The Alpha architecture allows reordering of the accesses to the I/O space,
and the missing barrier between write and read causes hang with serial
port and real time clock.

This patch makes barriers confiorm to the specification.

1. We add mb() before readX_relaxed and writeX_relaxed -
   memory-barriers.txt claims that these functions must be ordered w.r.t.
   each other. Alpha doesn't order them, so we need an explicit barrier.
2. We add mb() before reads from the I/O space - so that if there's a
   write followed by a read, there should be a barrier between them.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: cd0e00c10672 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering")
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org      # v4.17+

---
 arch/alpha/include/asm/io.h |   43 ++++++++++++++++++++++++++++---------------
 arch/alpha/kernel/io.c      |   28 +++++++++++++++++++++-------
 2 files changed, 49 insertions(+), 22 deletions(-)

Index: linux-stable/arch/alpha/include/asm/io.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-23 10:01:22.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/io.h	2020-05-23 10:01:22.000000000 +0200
@@ -310,14 +310,18 @@ static inline int __is_mmio(const volati
 #if IO_CONCAT(__IO_PREFIX,trivial_io_bw)
 extern inline unsigned int ioread8(void __iomem *addr)
 {
-	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread8)(addr);
+	unsigned int ret;
+	mb();
+	ret = IO_CONCAT(__IO_PREFIX,ioread8)(addr);
 	mb();
 	return ret;
 }
 
 extern inline unsigned int ioread16(void __iomem *addr)
 {
-	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread16)(addr);
+	unsigned int ret;
+	mb();
+	ret = IO_CONCAT(__IO_PREFIX,ioread16)(addr);
 	mb();
 	return ret;
 }
@@ -358,7 +362,9 @@ extern inline void outw(u16 b, unsigned
 #if IO_CONCAT(__IO_PREFIX,trivial_io_lq)
 extern inline unsigned int ioread32(void __iomem *addr)
 {
-	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread32)(addr);
+	unsigned int ret;
+	mb();
+	ret = IO_CONCAT(__IO_PREFIX,ioread32)(addr);
 	mb();
 	return ret;
 }
@@ -403,15 +409,18 @@ extern inline void __raw_writew(u16 b, v
 
 extern inline u8 readb(const volatile void __iomem *addr)
 {
-	u8 ret = __raw_readb(addr);
+	u8 ret;
+	mb();
+	ret = __raw_readb(addr);
 	mb();
 	return ret;
 }
 
 extern inline u16 readw(const volatile void __iomem *addr)
 {
-	u16 ret = __raw_readw(addr);
+	u16 ret;
 	mb();
+	ret = __raw_readw(addr);
 	return ret;
 }
 
@@ -451,14 +460,18 @@ extern inline void __raw_writeq(u64 b, v
 
 extern inline u32 readl(const volatile void __iomem *addr)
 {
-	u32 ret = __raw_readl(addr);
+	u32 ret;
+	mb();
+	ret = __raw_readl(addr);
 	mb();
 	return ret;
 }
 
 extern inline u64 readq(const volatile void __iomem *addr)
 {
-	u64 ret = __raw_readq(addr);
+	u64 ret;
+	mb();
+	ret = __raw_readq(addr);
 	mb();
 	return ret;
 }
@@ -487,14 +500,14 @@ extern inline void writeq(u64 b, volatil
 #define outb_p		outb
 #define outw_p		outw
 #define outl_p		outl
-#define readb_relaxed(addr)	__raw_readb(addr)
-#define readw_relaxed(addr)	__raw_readw(addr)
-#define readl_relaxed(addr)	__raw_readl(addr)
-#define readq_relaxed(addr)	__raw_readq(addr)
-#define writeb_relaxed(b, addr)	__raw_writeb(b, addr)
-#define writew_relaxed(b, addr)	__raw_writew(b, addr)
-#define writel_relaxed(b, addr)	__raw_writel(b, addr)
-#define writeq_relaxed(b, addr)	__raw_writeq(b, addr)
+#define readb_relaxed(addr)	(mb(), __raw_readb(addr))
+#define readw_relaxed(addr)	(mb(), __raw_readw(addr))
+#define readl_relaxed(addr)	(mb(), __raw_readl(addr))
+#define readq_relaxed(addr)	(mb(), __raw_readq(addr))
+#define writeb_relaxed(b, addr)	(mb(), __raw_writeb(b, addr))
+#define writew_relaxed(b, addr)	(mb(), __raw_writew(b, addr))
+#define writel_relaxed(b, addr)	(mb(), __raw_writel(b, addr))
+#define writeq_relaxed(b, addr)	(mb(), __raw_writeq(b, addr))
 
 /*
  * String version of IO memory access ops:
Index: linux-stable/arch/alpha/kernel/io.c
===================================================================
--- linux-stable.orig/arch/alpha/kernel/io.c	2020-05-23 10:01:22.000000000 +0200
+++ linux-stable/arch/alpha/kernel/io.c	2020-05-23 10:01:22.000000000 +0200
@@ -16,21 +16,27 @@
 unsigned int
 ioread8(void __iomem *addr)
 {
-	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread8)(addr);
+	unsigned int ret;
+	mb();
+	ret = IO_CONCAT(__IO_PREFIX,ioread8)(addr);
 	mb();
 	return ret;
 }
 
 unsigned int ioread16(void __iomem *addr)
 {
-	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread16)(addr);
+	unsigned int ret;
+	mb();
+	ret = IO_CONCAT(__IO_PREFIX,ioread16)(addr);
 	mb();
 	return ret;
 }
 
 unsigned int ioread32(void __iomem *addr)
 {
-	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread32)(addr);
+	unsigned int ret;
+	mb();
+	ret = IO_CONCAT(__IO_PREFIX,ioread32)(addr);
 	mb();
 	return ret;
 }
@@ -148,28 +154,36 @@ EXPORT_SYMBOL(__raw_writeq);
 
 u8 readb(const volatile void __iomem *addr)
 {
-	u8 ret = __raw_readb(addr);
+	u8 ret;
+	mb();
+	ret = __raw_readb(addr);
 	mb();
 	return ret;
 }
 
 u16 readw(const volatile void __iomem *addr)
 {
-	u16 ret = __raw_readw(addr);
+	u16 ret;
+	mb();
+	ret = __raw_readw(addr);
 	mb();
 	return ret;
 }
 
 u32 readl(const volatile void __iomem *addr)
 {
-	u32 ret = __raw_readl(addr);
+	u32 ret;
+	mb();
+	ret = __raw_readl(addr);
 	mb();
 	return ret;
 }
 
 u64 readq(const volatile void __iomem *addr)
 {
-	u64 ret = __raw_readq(addr);
+	u64 ret;
+	mb();
+	ret = __raw_readq(addr);
 	mb();
 	return ret;
 }


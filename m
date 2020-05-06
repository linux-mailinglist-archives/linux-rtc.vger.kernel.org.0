Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6ABF1C777E
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 19:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730323AbgEFRM2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 13:12:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35001 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725799AbgEFRM2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 May 2020 13:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588785146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4NmFIV7QvCRRvqv1Eoet8VLqmfYT92cvTdnbMe/vaPw=;
        b=ZMdp+rRDdUC73iLd0eZykNerlKDlzAbMF7a5QqkAplYbz7/9B3SRMA2sYbTgNay2ZEYPhh
        L/lNUpgxEuU+rNSDDNZzmLz73NEq482w8M63ityaDNCIJ5pmDPZil+gaHrkgB4E4iL4CTY
        U0+sp3rwCiSCx1dv1ax1IZgTOyIZ/HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-VXfywLbPN1qcrLzMeGpspA-1; Wed, 06 May 2020 13:12:22 -0400
X-MC-Unique: VXfywLbPN1qcrLzMeGpspA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18AF91005510;
        Wed,  6 May 2020 17:12:21 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D6393605F7;
        Wed,  6 May 2020 17:12:20 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 046HCKoL024608;
        Wed, 6 May 2020 13:12:20 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 046HCKiE024604;
        Wed, 6 May 2020 13:12:20 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 6 May 2020 13:12:20 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Sinan Kaya <okaya@codeaurora.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH 1/2 v2] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Wed, 6 May 2020, Arnd Bergmann wrote:

> On Wed, May 6, 2020 at 1:21 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> >  /*
> >   * The yet supported machines all access the RTC index register via
> >   * an ISA port access but the way to access the date register differs ...
> > + *
> > + * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
> > + * we need to add a small delay.
> >   */
> >  #define CMOS_READ(addr) ({ \
> >  outb_p((addr),RTC_PORT(0)); \
> > +udelay(2); \
> >  inb_p(RTC_PORT(1)); \
> 
> 
> The inb_p() / outb_p() functions are meant to already have a delay in them,
> maybe we should just add it there for alpha?
> 
>      Arnd

Yes, that is possible too - it fixes the real time clock hang for me.



From: Mikulas Patocka <mpatocka@redhat.com>

The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
the Alpha Avanti platform.

The patch changes timing between accesses to the ISA bus, in particular,
it reduces the time between "write" access and a subsequent "read" access.

This causes lock-up when accessing the real time clock and serial ports.

This patch fixes the real time clock by adding a small delay to the inb_p,
inw_p and inl_p macros.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/io.h |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: linux-stable/arch/alpha/include/asm/io.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-06 08:23:47.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/io.h	2020-05-06 18:33:47.000000000 +0200
@@ -6,6 +6,7 @@
 
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/delay.h>
 #include <asm/compiler.h>
 #include <asm/pgtable.h>
 #include <asm/machvec.h>
@@ -481,9 +482,9 @@ extern inline void writeq(u64 b, volatil
 #define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
 #define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
 
-#define inb_p		inb
-#define inw_p		inw
-#define inl_p		inl
+#define inb_p(x)	(ndelay(300), inb(x))
+#define inw_p(x)	(ndelay(300), inw(x))
+#define inl_p(x)	(ndelay(300), inl(x))
 #define outb_p		outb
 #define outw_p		outw
 #define outl_p		outl


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF251C955E
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 17:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgEGPqu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 11:46:50 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46742 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725914AbgEGPqt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 May 2020 11:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588866408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ovG7LSbK857eMfLA1eEikSEQHDDBc5uzP/qhys5SXfw=;
        b=SDdUyUzNEOwggpSJeEe3+qNoTIqjzXYkfwRTFambQyjRj+KIClYJgfObanxEHjK2DvP2gC
        js0xea7MrGDwNCxdF5zeCCUU2dZWYvLfbmjvSU3wwfMKvKPigIyT1qX3sEju6m/xt5xwVu
        S94jMThkkfqbV9ZJvnBp4iZ5dYcTG7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-AY_bz46XOX-9_l9mIb0VeQ-1; Thu, 07 May 2020 11:46:46 -0400
X-MC-Unique: AY_bz46XOX-9_l9mIb0VeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED888018A7;
        Thu,  7 May 2020 15:46:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id AAD7F9323;
        Thu,  7 May 2020 15:46:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 047FkiZJ015714;
        Thu, 7 May 2020 11:46:44 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 047FkiMA015711;
        Thu, 7 May 2020 11:46:44 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 7 May 2020 11:46:44 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v4] alpha: add a barrier after outb, outw and outl
In-Reply-To: <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2005071145250.15191@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

This patch fixes the bug by adding a memory barrier after the functions
that access the ISA ports - outb, outw, outl. The barrier causes that
there is some delay between the write to an IO port and a subsequent read.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/io.h |    3 +++
 arch/alpha/kernel/io.c      |    3 +++
 2 files changed, 6 insertions(+)

Index: linux-stable/arch/alpha/include/asm/io.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-07 17:36:58.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/io.h	2020-05-07 17:36:58.000000000 +0200
@@ -347,11 +347,13 @@ extern inline u16 inw(unsigned long port
 extern inline void outb(u8 b, unsigned long port)
 {
 	iowrite8(b, ioport_map(port, 1));
+	mb();
 }
 
 extern inline void outw(u16 b, unsigned long port)
 {
 	iowrite16(b, ioport_map(port, 2));
+	mb();
 }
 #endif
 
@@ -377,6 +379,7 @@ extern inline u32 inl(unsigned long port
 extern inline void outl(u32 b, unsigned long port)
 {
 	iowrite32(b, ioport_map(port, 4));
+	mb();
 }
 #endif
 
Index: linux-stable/arch/alpha/kernel/io.c
===================================================================
--- linux-stable.orig/arch/alpha/kernel/io.c	2020-05-07 17:36:58.000000000 +0200
+++ linux-stable/arch/alpha/kernel/io.c	2020-05-07 17:36:58.000000000 +0200
@@ -78,16 +78,19 @@ u32 inl(unsigned long port)
 void outb(u8 b, unsigned long port)
 {
 	iowrite8(b, ioport_map(port, 1));
+	mb();
 }
 
 void outw(u16 b, unsigned long port)
 {
 	iowrite16(b, ioport_map(port, 2));
+	mb();
 }
 
 void outl(u32 b, unsigned long port)
 {
 	iowrite32(b, ioport_map(port, 4));
+	mb();
 }
 
 EXPORT_SYMBOL(inb);


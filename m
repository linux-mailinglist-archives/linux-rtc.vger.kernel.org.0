Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53491C6F27
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 13:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgEFLVv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 07:21:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43570 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725824AbgEFLVu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 May 2020 07:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588764110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=dyBeBM3FMukKdQkbDKzhstncX2ZdEJKF6/LgPra/QJA=;
        b=OBgydTkJ2cJ7wl0WmLmKRnllYKRyeYkmCepyU530nG47hpoudKSLoHxCylscKmBPSeoVSd
        KwkM2jkQTA9R4PVmC07sZryXXKMlT1WmnjdJNlOE+cxCKamnaQcXPBtzMeou01n0T/Zemb
        Qq+/pFaip+S5JK1KHYjIFfI4oIXgmmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-LzFkceDOOGinn2O2eXavkw-1; Wed, 06 May 2020 07:21:48 -0400
X-MC-Unique: LzFkceDOOGinn2O2eXavkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E749107ACCD;
        Wed,  6 May 2020 11:21:46 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 46C6B70549;
        Wed,  6 May 2020 11:21:45 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 046BLiJL027344;
        Wed, 6 May 2020 07:21:44 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 046BLhim027340;
        Wed, 6 May 2020 07:21:43 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 6 May 2020 07:21:43 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     linux-alpha@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 1/2] alpha: add a delay between RTC port write and read
Message-ID: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

This patch fixes the real time clock by adding a small delay between
outb_p and inb_p.

Note that we don't have to add the delay to CMOS_WRITE, because it
consists of two write accesses and they already have mb() between them.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/mc146818rtc.h |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-stable/arch/alpha/include/asm/mc146818rtc.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/mc146818rtc.h	2020-05-05 20:48:30.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/mc146818rtc.h	2020-05-05 21:05:53.000000000 +0200
@@ -15,9 +15,13 @@
 /*
  * The yet supported machines all access the RTC index register via
  * an ISA port access but the way to access the date register differs ...
+ *
+ * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
+ * we need to add a small delay.
  */
 #define CMOS_READ(addr) ({ \
 outb_p((addr),RTC_PORT(0)); \
+udelay(2); \
 inb_p(RTC_PORT(1)); \
 })
 #define CMOS_WRITE(val, addr) ({ \


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24111CFE66
	for <lists+linux-rtc@lfdr.de>; Tue, 12 May 2020 21:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731004AbgELTf3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 May 2020 15:35:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43532 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730950AbgELTf2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 May 2020 15:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589312127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H5pxUSbLWxNQVZt3chJU6aQ+MxFijTrdJFOgatW5PJM=;
        b=FCRJx0YGfOyJFnV8FqbaYpk2jVd6iwrDVN3dyPl3LIPwYfOWZ7b4Ml9Ai/Oc1OThRoEzKC
        51GeuI7p1PJNI4U3tvz5F2Ylhm89ybQvDxEbGhxgcjgzDcwNveUxGSwqaCQOk/4tRhWtw7
        mMDKEdiX5wd8g4zEHoVma0cVms5nFnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-Cs80k05zNKOHzuw-ckzSlg-1; Tue, 12 May 2020 15:35:25 -0400
X-MC-Unique: Cs80k05zNKOHzuw-ckzSlg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C474F100A623;
        Tue, 12 May 2020 19:35:23 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3394839D;
        Tue, 12 May 2020 19:35:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 04CJZMnE032376;
        Tue, 12 May 2020 15:35:22 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 04CJZLMo032373;
        Tue, 12 May 2020 15:35:21 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Tue, 12 May 2020 15:35:21 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
cc:     Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
Message-ID: <alpine.LRH.2.02.2005121525500.31782@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Mon, 11 May 2020, Maciej W. Rozycki wrote:

>  And if timing is indeed the culprit, then I think it will be best fixed 
> in the 82378IB southbridge, i.e.[1]:
> 
> "The I/O recovery mechanism in the SIO is used to add additional recovery 
> delay between PCI originated 8-bit and 16-bit I/O cycles to the ISA Bus.  
> The SIO automatically forces a minimum delay of four SYSCLKs between 
> back-to-back 8 and 16 bit I/O cycles to the ISA Bus.  The delay is 
> measured from the rising edge of the I/O command (IOR# or IOW#) to the 
> falling edge of the next BALE.  If a delay of greater than four SYSCLKs is 
> required, the ISA I/O Recovery Time Register can be programmed to increase 
> the delay in increments of SYSCLKs.  Note that no additional delay is 
> inserted for back-to-back I/O "sub cycles" generated as a result of byte 
> assembly or disassembly.  This register defaults to 8 and 16-bit recovery 
> enabled with two clocks added to the standard I/O recovery."
> 
> where it won't be causing unnecessary overhead for native PCI devices or 
> indeed excessive one for ISA devices.  It might be interesting to note 
> that later SIO versions like the 82378ZB increased the minimum to five 
> SYSCLKs, so maybe a missing SYSCLK (that can still be inserted by suitably
> programming the ICRT) is the source of the problem?
> 
> References:
> 
> [1] "82378IB System I/O (SIO)", April 1993, Intel Corporation, Order 
>     Number: 290473-002, Section 4.1.17 "ICRT -- ISA Controller Recovery 
>     Timer Register"
> 
>   Maciej

I tried to modify this register (I wrote 0x44 to it - it should correspond 
to the maximum delay) and it had no effect on the serial port and rtc 
lock-ups.

Mikulas


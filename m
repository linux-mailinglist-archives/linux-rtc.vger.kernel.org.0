Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA911DF04B
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2020 22:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730981AbgEVUAv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 May 2020 16:00:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60635 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730931AbgEVUAu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 May 2020 16:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590177648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QfXNDazW9f4SQuiLl+qVepnHkZ+8ian89K41uq3i3Jc=;
        b=WI74fZB9VHpvYM2j7WwBXprPPRG6sNuzcuMAvfsfU4ez9S6q3c40N2NuLkgHniFvU0qNdF
        RqG3R760VPLWo5+pDn0hdVyF24Fh/ifsP7UiqSzMCT2iB+VucCfXin/7uJiL0FNKM5lrO4
        /8S9EwdTazrHjmFegcqUm3+FV63puls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-isiSZG0RPvqL2lyt61tGiA-1; Fri, 22 May 2020 16:00:46 -0400
X-MC-Unique: isiSZG0RPvqL2lyt61tGiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2145107ACCD;
        Fri, 22 May 2020 20:00:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3CD1053B34;
        Fri, 22 May 2020 20:00:43 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 04MK0hbS022557;
        Fri, 22 May 2020 16:00:43 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 04MK0f6a022553;
        Fri, 22 May 2020 16:00:41 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Fri, 22 May 2020 16:00:41 -0400 (EDT)
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
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Fri, 22 May 2020, Mikulas Patocka wrote:

> On Wed, 13 May 2020, Ivan Kokshaysky wrote:
> 
> > On Mon, May 11, 2020 at 03:58:24PM +0100, Maciej W. Rozycki wrote:
> > >  Individual PCI port locations correspond to different MMIO locations, so 
> > > yes, accesses to these can be reordered (merging won't happen due to the 
> > > use of the sparse address space).
> > 
> > Correct, it's how Alpha write buffers work. According to 21064 hardware
> > reference manual, these buffers are flushed when one of the following
> > conditions is met:
> > 
> > 1) The write buffer contains at least two valid entries.
> > 2) The write buffer contains one valid entry and at least 256 CPU cycles
> >    have elapsed since the execution of the last write buffer-directed
> >    instruction.
> > 3) The write buffer contains an MB, STQ_C or STL_C instruction.
> > 4) A load miss is pending to an address currently valid in the write
> >    buffer that requires the write buffer to be flushed.
> > 
> > I'm certain that in these rtc/serial cases we've got readX arriving
> > to device *before* preceeding writeX because of 2). That's why small
> > delay (300-1400 ns, apparently depends on CPU frequency) seemingly
> > "fixes" the problem. The 4) is not met because loads and stores are
> > to different ports, and 3) has been broken by commit 92d7223a74.
> > 
> > So I believe that correct fix would be to revert 92d7223a74 and
> > add wmb() before [io]writeX macros to meet memory-barriers.txt
> > requirement. The "wmb" instruction is cheap enough and won't hurt
> > IO performance too much.
> > 
> > Ivan.
> 
> I agree ... and what about readX_relaxed and writeX_relaxed? According to 
> the memory-barriers specification, the _relaxed functions must be ordered 
> w.r.t. each other. If Alpha can't keep them ordered, they should have 
> barriers between them too.
> 
> Mikulas

I have found the chapter about I/O in the Alpha reference manual, in the 
section "5.6.4.7 Implications for Memory Mapped I/O", it says:

To reliably communicate shared data from a processor to an I/O device:
1. Write the shared data to a memory-like physical memory region on the 
processor.
2. Execute an MB instruction.
3. Write a flag (equivalently, send an interrupt or write a register 
location implemented in the I/O device).

The receiving I/O device must:
1. Read the flag (equivalently, detect the interrupt or detect the write 
to the register location implemented in the I/O device).
2. Execute the equivalent of an MB.
3. Read the shared data.

So, we must use MB, not WMB when ordering I/O accesses.

The WMB instruction specification says that it orders writes to 
memory-like locations with other writes to memory-like locations. And 
writes to non-memory-like locations with other writes to non-memory-like 
locations. But it doesn't order memory-like writes with I/O-like writes.

The section 5.6.3 claims that there are no implied barriers.



So, if we want to support the specifications:

read*_relaxed and write*_relaxed need at least one barrier before or after 
(memory-barriers.txt says that they must be ordered with each other, the 
alpha specification doesn't specify ordering).

read and write - read must have a barrier after it, write before it. There 
must be one more barrier before a read or after a write, to make sure that 
there is barrier between write+read.

Mikulas


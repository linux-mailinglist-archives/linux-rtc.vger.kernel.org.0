Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2541DE799
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2020 15:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729841AbgEVNDk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 May 2020 09:03:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52029 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729367AbgEVNDg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 May 2020 09:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590152614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eLcEITseBFkwtyrC5DNJAB2zEgXQyfg2QvmBccxP5Vg=;
        b=SjjeP26qbh6LaSuUUX+NTxFRRnzutnA51U5tEGqwVrR0pzqYTJLbrpVS7IwnIvSHPxxwZL
        BwZHlyA2d4ZRQ0mbBaJO1zYoOKM3kTYa+B/a4C6oAjSJLQ05BHHvqyFevN18DcyfY11eSD
        6ejIP/o/M1TIIaw65SD5r4iTOIwERF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-SB9_dXjLPvm9RseHJhKLTg-1; Fri, 22 May 2020 09:03:31 -0400
X-MC-Unique: SB9_dXjLPvm9RseHJhKLTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DED2107ACF2;
        Fri, 22 May 2020 13:03:29 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9326960E1C;
        Fri, 22 May 2020 13:03:28 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 04MD3St7020168;
        Fri, 22 May 2020 09:03:28 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 04MD3QWE020164;
        Fri, 22 May 2020 09:03:26 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Fri, 22 May 2020 09:03:26 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     "Maciej W. Rozycki" <macro@wdc.com>
cc:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <alpine.LFD.2.21.2005131802160.6492@redsun52.ssa.fujisawa.hgst.com>
Message-ID: <alpine.LRH.2.02.2005201403480.24885@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LFD.2.21.2005131802160.6492@redsun52.ssa.fujisawa.hgst.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Wed, 13 May 2020, Maciej W. Rozycki wrote:

> On Wed, 13 May 2020, Ivan Kokshaysky wrote:
> 
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
> 
>  Hmm, having barriers *afterwards* across all the MMIO accessors, even 
> ones that do not have such a requirement according to memory-barriers.txt, 
> does hurt performance unnecessarily however.  What I think has to be done 
> is adding barriers beforehand, and then only add barriers afterwards where 
> necessary.  Commit 92d7223a74 did a part of that, but did not consistently 
> update all the remaining accessors.
> 
>  So I don't think reverting 92d7223a74 permanently is the right way to go, 
> however it certainly makes sense to do that temporarily to get rid of the 
> fatal regression, sort all the corner cases and then apply the resulting 
> replacement fix.

See Documentation/memory-barriers.txt, the section "KERNEL I/O BARRIER 
EFFECTS"

According to the specification, there must be a barrier before a write to 
the MMIO space (paragraph 3) and after a read from MMIO space (parahraph 
4) - if this causes unnecessary slowdown, the driver should use 
readX_relaxed or writeX_relaxed functions - the *_relaxed functions are 
ordered with each other (see the paragraph "(*) readX_relaxed(), 
writeX_relaxed()"), but they are not ordered with respect to memory 
access.

The commit 92d7223a74 fixes that requirement (although there is no real 
driver that was fixed by this), so I don't think it should be reverted. 
The proper fix should be to add delays to the serial port and readltime 
clock (or perhaps to all IO-port accesses).

> I think ultimately we do want the barriers beforehand, just like the 
> MIPS port has (and survives) in arch/mips/include/asm/io.h.  Observe 

If the MIPS port doesn't have MMIO barrier after read[bwl], then it is 
violating the specification. Perhaps there is no existing driver that is 
hurt by this violation, so this violation survived.

> that unlike the Alpha ISA the MIPS ISA does have nontrivial `rmb' aka 
> the SYNC_RMB hardware instruction.
> 
>   Maciej

Mikulas


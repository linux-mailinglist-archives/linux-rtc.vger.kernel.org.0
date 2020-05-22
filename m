Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06FC1DE828
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2020 15:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729888AbgEVNhM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 May 2020 09:37:12 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:41473 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729406AbgEVNhM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 May 2020 09:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590154631; x=1621690631;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EUWLCQ4b0qv6go+blgdo6JASANFDeUBjtKBjnvhD0WQ=;
  b=iS7m+eXd5st+hAlYEE7kUdTVnsmPtBDP4wB1XSlNhiw8me8bUFCixgJh
   x74A/eQvAQAzG1SnskWNV4ZjE2dl1wjvt5hTh8MylFEJwO7Zm+U+F9H+M
   CkfFlbPxFunoJk8TgG7jqZ4wyI0MFJ86Gqu3wYOWG1p5TMO3B1HTup1lw
   11JyexZPnSkqt/Cs7sD2Gjl/MV9D1jPYip2NMkmYAP62pssJPBpU6Zecs
   qo9OeWjJnz3ovjaC2zlrKtT/CMrNsqmsUgD2WBtQ9D+odFOj+z/pVlD7r
   XZp7NlMdAmp+NVU6wVeoPpj6lpqHZeUhXBu3NyKOcYMQE1s0ESrsRvKga
   A==;
IronPort-SDR: kd19uII32utgrXCJAuca0wveu56oQGsufOUMmtJfG9qflCrfqOPk6m9ayY/wrYlq/ZjY5DkosX
 izEAxqwCt7OT3/Nm5pYUVQf0VaMuDYJn1I8DUCSMjosBe3qpS5bCrjq0hXHgdh4mKOvraXOIqB
 082Afx3ZUb8/Vg2TnEyRkwCZzwUfBB3KdDQzhBFizCRuLT/C/Id3tHvJJ6DjYZCTxG54jZLDMM
 Gdr21OKFYKWrXSPhiTrAZVSvwaoJkmVkMLQ91fhQey35JqYIT3bOddgzLaIce7Fk/oe5d8zhtP
 m/8=
X-IronPort-AV: E=Sophos;i="5.73,421,1583164800"; 
   d="scan'208";a="138318795"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 22 May 2020 21:37:11 +0800
IronPort-SDR: X3wqQbbFfA6vc6izKvMsy6zaniRREVJkLDVBDbVC1ac3HFr7P7vAEHcsVTZMN7PyUgnhbx53kZ
 CQTb+c8ldPjuvykXY+LhduN4y5FxSphj4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 06:27:10 -0700
IronPort-SDR: 3BRm09RueVGL3LdWvuqgVbaRy3Bq4w4AF1j8jHdre2miVFDQ2hnA5GnX9SMWJyCqmuG7dZ4Dct
 ZCCYFXIASFEg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 06:37:09 -0700
Date:   Fri, 22 May 2020 14:37:05 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Mikulas Patocka <mpatocka@redhat.com>
cc:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <alpine.LRH.2.02.2005201403480.24885@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LFD.2.21.2005221414510.21168@redsun52.ssa.fujisawa.hgst.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LFD.2.21.2005131802160.6492@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005201403480.24885@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 22 May 2020, Mikulas Patocka wrote:

> >  Hmm, having barriers *afterwards* across all the MMIO accessors, even 
> > ones that do not have such a requirement according to memory-barriers.txt, 
> > does hurt performance unnecessarily however.  What I think has to be done 
> > is adding barriers beforehand, and then only add barriers afterwards where 
> > necessary.  Commit 92d7223a74 did a part of that, but did not consistently 
> > update all the remaining accessors.
> > 
> >  So I don't think reverting 92d7223a74 permanently is the right way to go, 
> > however it certainly makes sense to do that temporarily to get rid of the 
> > fatal regression, sort all the corner cases and then apply the resulting 
> > replacement fix.
> 
> See Documentation/memory-barriers.txt, the section "KERNEL I/O BARRIER 
> EFFECTS"
> 
> According to the specification, there must be a barrier before a write to 
> the MMIO space (paragraph 3) and after a read from MMIO space (parahraph 
> 4) - if this causes unnecessary slowdown, the driver should use 
> readX_relaxed or writeX_relaxed functions - the *_relaxed functions are 
> ordered with each other (see the paragraph "(*) readX_relaxed(), 
> writeX_relaxed()"), but they are not ordered with respect to memory 
> access.

 The specification doesn't require a barrier *after* a write however, 
which is what I have been concerned about as it may cost hundreds of 
cycles wasted.  I'm not concerned about a barrier after a read (and one 
beforehand is of course also required).

> The commit 92d7223a74 fixes that requirement (although there is no real 
> driver that was fixed by this), so I don't think it should be reverted. 
> The proper fix should be to add delays to the serial port and readltime 
> clock (or perhaps to all IO-port accesses).

 Adding artificial delays will only paper over the real problem I'm 
afraid.

> > I think ultimately we do want the barriers beforehand, just like the 
> > MIPS port has (and survives) in arch/mips/include/asm/io.h.  Observe 
> 
> If the MIPS port doesn't have MMIO barrier after read[bwl], then it is 
> violating the specification. Perhaps there is no existing driver that is 
> hurt by this violation, so this violation survived.

 It does have a barrier, see:

	/* prevent prefetching of coherent DMA data prematurely */	\
	if (!relax)							\
		rmb();							\

In the light of #5 however:

        5. A readX() by a CPU thread from the peripheral will complete before
           any subsequent delay() loop can begin execution on the same thread.

I think it may have to be replaced with a completion barrier however, and 
that will be tricky because you cannot just issue a second read to the 
resource accessed after the `rmb' to make the first read complete, as a 
MMIO read may have side effects (e.g. clearing an interrupt request).  So 
the read would have to happen to a different location.

 Some architectures have a hardware completion barrier instruction, such 
as the modern MIPS ISA, which makes life sweet and easy (as much as life 
can be sweet and easy with a weakly ordered bus model) as no dummy read is 
then required, but surely not all do (including older MIPS ISA revisions).

  Maciej

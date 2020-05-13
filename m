Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1020C1D1C04
	for <lists+linux-rtc@lfdr.de>; Wed, 13 May 2020 19:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732781AbgEMRRX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 May 2020 13:17:23 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:44255 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732731AbgEMRRX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 May 2020 13:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589390243; x=1620926243;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3pXXOqOSbcLfaRVSy+7Wen4SaQPmjbe4Qje5MYZ5YF8=;
  b=Kq3KtnmqtFAD2NpBdSmz8AtMhayTBVD5SF4B5QA/u+o2c5WiDoxa8b5e
   EpxQqUf559dHtP1jgr+O1iziXj/jVSWIj28I/91Ak/5skHYm+jCAqYtnm
   03xizLGAyuLbas+p1FA366rPinvQZ4r0mgGzH93MCHFk+YkRt/rIa2SN5
   OuVr69A3I4CzMJeS3xDhe7JPgTTSjGuGa5Qfzmo6JK/z/veS1UR5U4Thu
   sgqTmjaTdBdfohDwrBhD1VbUyWbz5XW6bZ9XGQu5W87HL/+JEf9gPgPEq
   wT0DupqY8rKPQ8H3gw3ycG3d/Jr6jmUI+PRzNRpOqtIEFLbmS1NDAyZ9Z
   Q==;
IronPort-SDR: xuMV1qVM4PzhaGGcXlsnt1HpkErMD830RBMkYCFyoRXRMswm1G/m8oZIP4eyvGkVBxOASV1+gx
 di92u9eJY07PqytwEu2AX1V/MGJEGsaKO1/fBPiy0k5niXML15AZxQyHZzcrILzmRJxf/wUuw9
 5aMIRzh38HTEYFQIQ9Q/nROWFB9bbvKNk6uSHxg3/O1kOFp9dLCSYTeKwImedM/tw5J6p+k0PJ
 BuvDwrUtYVGtJwP3UNQ+uwyH3iXBB620FBHT7D1nKuJY+KreX5X7+DE31GYLQuDqbaTtsDxftu
 soI=
X-IronPort-AV: E=Sophos;i="5.73,388,1583164800"; 
   d="scan'208";a="137939223"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 01:17:23 +0800
IronPort-SDR: 8nyYUu1J/7AhS7ZEM5BUPDh1B3J94No8mcw1IBeb+bBKHaDxrY0LmVBduIK2Gzopbj2KfhFSIo
 fUdbijzdCqMpISvXTPQr8iNHJ8m93z9fA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 10:07:03 -0700
IronPort-SDR: Dlz3R5KbpPVfgkcPbqM+G72PoHfBJCeMySTFiY0ggL6/fOQRos63gO9aZSZRjge1OwbLQBh1Rd
 ZAph8SOlHF6Q==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 10:17:20 -0700
Date:   Wed, 13 May 2020 18:17:16 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>
cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <20200513144128.GA16995@mail.rc.ru>
Message-ID: <alpine.LFD.2.21.2005131802160.6492@redsun52.ssa.fujisawa.hgst.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 13 May 2020, Ivan Kokshaysky wrote:

> >  Individual PCI port locations correspond to different MMIO locations, so 
> > yes, accesses to these can be reordered (merging won't happen due to the 
> > use of the sparse address space).
> 
> Correct, it's how Alpha write buffers work. According to 21064 hardware
> reference manual, these buffers are flushed when one of the following
> conditions is met:
> 
> 1) The write buffer contains at least two valid entries.
> 2) The write buffer contains one valid entry and at least 256 CPU cycles
>    have elapsed since the execution of the last write buffer-directed
>    instruction.
> 3) The write buffer contains an MB, STQ_C or STL_C instruction.
> 4) A load miss is pending to an address currently valid in the write
>    buffer that requires the write buffer to be flushed.
> 
> I'm certain that in these rtc/serial cases we've got readX arriving
> to device *before* preceeding writeX because of 2). That's why small
> delay (300-1400 ns, apparently depends on CPU frequency) seemingly
> "fixes" the problem. The 4) is not met because loads and stores are
> to different ports, and 3) has been broken by commit 92d7223a74.
> 
> So I believe that correct fix would be to revert 92d7223a74 and
> add wmb() before [io]writeX macros to meet memory-barriers.txt
> requirement. The "wmb" instruction is cheap enough and won't hurt
> IO performance too much.

 Hmm, having barriers *afterwards* across all the MMIO accessors, even 
ones that do not have such a requirement according to memory-barriers.txt, 
does hurt performance unnecessarily however.  What I think has to be done 
is adding barriers beforehand, and then only add barriers afterwards where 
necessary.  Commit 92d7223a74 did a part of that, but did not consistently 
update all the remaining accessors.

 So I don't think reverting 92d7223a74 permanently is the right way to go, 
however it certainly makes sense to do that temporarily to get rid of the 
fatal regression, sort all the corner cases and then apply the resulting 
replacement fix.  I think ultimately we do want the barriers beforehand, 
just like the MIPS port has (and survives) in arch/mips/include/asm/io.h.  
Observe that unlike the Alpha ISA the MIPS ISA does have nontrivial `rmb' 
aka the SYNC_RMB hardware instruction.

  Maciej

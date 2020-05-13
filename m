Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76891D1AC0
	for <lists+linux-rtc@lfdr.de>; Wed, 13 May 2020 18:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389220AbgEMQNz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 May 2020 12:13:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:32806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730831AbgEMQNy (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 13 May 2020 12:13:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63B20205CB;
        Wed, 13 May 2020 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589386434;
        bh=scDmKpReNvSDyaXOgfs0CFFWdytS3oT1ya21NeyynX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kByrWg397T/zsRO+6EgO9D1dBbCdqM6U/M9H/QGH3Wvyrf1BymHHRcI59qN6rAdVt
         4ZvrNgBtXez6a33z7K/OmqEkmTQp+YWR3rl07ErtPVzsGn51l6BSszcG6VgYpqJZ6J
         NVvtSjzx0PmucGC9LsjIGruPj1TBlQM8bBZ6XSiA=
Date:   Wed, 13 May 2020 18:13:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Message-ID: <20200513161352.GD1362525@kroah.com>
References: <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
 <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org>
 <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513144128.GA16995@mail.rc.ru>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, May 13, 2020 at 03:41:28PM +0100, Ivan Kokshaysky wrote:
> On Mon, May 11, 2020 at 03:58:24PM +0100, Maciej W. Rozycki wrote:
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

I agree, that sounds easier, and work with the authors of
memory-barriers.txt in order to straighten things out.

greg k-h

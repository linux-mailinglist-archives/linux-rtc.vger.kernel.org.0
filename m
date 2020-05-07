Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8D31C84A6
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 10:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgEGIUL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 04:20:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgEGIUL (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 7 May 2020 04:20:11 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFF8F2078C;
        Thu,  7 May 2020 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588839610;
        bh=nGLRTK4hez5Fyysz7zTFJZsP23ORvEQ/cxKPGQGhVgk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k0s1gzdp1cf51NCY3wHwAZ+EHE7TuG+gHnOVSR3sjOgeie8GpAm0GtDH8RGx4jxLe
         ZwUA5PdRVH/rr4gMPVXfMFJv8zfquP+mwqKmE0VydkAgeiiy1R3a8fo8dDL1bD4N3b
         53OGW1PbGoiaQMrJfa09NPPOhT9j4RPoSvhEWlzc=
Date:   Thu, 7 May 2020 10:20:07 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Sinan Kaya <okaya@codeaurora.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Message-ID: <20200507082007.GD1024567@kroah.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
 <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 07, 2020 at 04:06:31AM -0400, Mikulas Patocka wrote:
> 
> 
> On Wed, 6 May 2020, Mikulas Patocka wrote:
> 
> > 
> > 
> > On Wed, 6 May 2020, Arnd Bergmann wrote:
> > 
> > > On Wed, May 6, 2020 at 1:21 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > > 
> > > >  /*
> > > >   * The yet supported machines all access the RTC index register via
> > > >   * an ISA port access but the way to access the date register differs ...
> > > > + *
> > > > + * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
> > > > + * we need to add a small delay.
> > > >   */
> > > >  #define CMOS_READ(addr) ({ \
> > > >  outb_p((addr),RTC_PORT(0)); \
> > > > +udelay(2); \
> > > >  inb_p(RTC_PORT(1)); \
> > > 
> > > 
> > > The inb_p() / outb_p() functions are meant to already have a delay in them,
> > > maybe we should just add it there for alpha?
> > > 
> > >      Arnd
> > 
> > Yes, that is possible too - it fixes the real time clock hang for me.
> > 
> > 
> > -#define inb_p		inb
> > -#define inw_p		inw
> > -#define inl_p		inl
> > +#define inb_p(x)	(ndelay(300), inb(x))
> > +#define inw_p(x)	(ndelay(300), inw(x))
> > +#define inl_p(x)	(ndelay(300), inl(x))
> >  #define outb_p		outb
> >  #define outw_p		outw
> >  #define outl_p		outl
> 
> 300ns was too low. We need at least 1400ns to fix the hang reliably.
> 
> Mikulas
> 
> 
> From: Mikulas Patocka <mpatocka@redhat.com>
> 
> The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
> barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
> the Alpha Avanti platform.
> 
> The patch changes timing between accesses to the ISA bus, in particular,
> it reduces the time between "write" access and a subsequent "read" access.
> 
> This causes lock-up when accessing the real time clock and serial ports.
> 
> This patch fixes the real time clock by adding a small delay to the inb_p,
> inw_p and inl_p macros.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> Cc: stable@vger.kernel.org	# v4.17+
> 
> ---
>  arch/alpha/include/asm/io.h |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

<snip>

This is not in a format that anyone can apply it in, please resend in a
proper way if you wish for it to be accepted.

thanks,

greg k-h

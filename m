Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942771C851F
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 10:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgEGIwF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 04:52:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:51906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgEGIwE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 7 May 2020 04:52:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F59F2073A;
        Thu,  7 May 2020 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588841523;
        bh=5hAkM6lcDiWiYAX0JYFT1ZvhiB6Q7ZILZYrICV3hyO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nFelzp4BBbqSIoPSjX0FfSvPb0NM2nuSDtG6Jx46W7ihh6ifBJvY1IBbOFoxaAE/r
         J6vuz201vOW99hGdcvt3oeCZSiskcVJPHD62BkkMpbj4oEyKj/T/VSO0p4TqwBJuuA
         DbgUJm4Uo+pddDqcOv9X7cnpR3cuuZxAeyoMEiWs=
Date:   Thu, 7 May 2020 10:52:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2 v4] alpha: add a delay before serial port read
Message-ID: <20200507085201.GA1097552@kroah.com>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506114711.GB3024358@kroah.com>
 <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506160823.GA3559699@kroah.com>
 <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506174528.GB3711921@kroah.com>
 <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 07, 2020 at 04:18:49AM -0400, Mikulas Patocka wrote:
> 
> 
> On Wed, 6 May 2020, Greg Kroah-Hartman wrote:
> 
> > On Wed, May 06, 2020 at 01:04:38PM -0400, Mikulas Patocka wrote:
> > > 
> > > I've created this patch that adds a global macro/variable 
> > > serial_port_needs_delay. I've also deleted UPQ_DELAY_BEFORE_READ and test 
> > > serial_port_needs_delay directly in io_serial_in, so that the compiler 
> > > will optimize it out on non-alpha architectures.
> > 
> > That's not good, what about systems with hundreds of serial ports?
> 
> I doubt that someone will conect hundreds of serial ports to such an old 
> alpha machine :)



> 
> > > > But, there is no other way to detect this based on hardware
> > > > signatures/types instead?  That is usually the best way to do it, right?
> > > 
> > > It's hard to detect Alpha without using '#ifdef CONFIG_ALPHA' :) The ISA 
> > > serial port hardware is simple, so I think that you can't distinguish it 
> > > just based on its behavior.
> > 
> > The ISA serial port hardware does not have a unique vendor/product id
> > somewhere?  Some other sort of definition that we can use to determine
> > exactly what type of system we are running on?
> 
> AFAIK it doesn't. You can only distinguish 8250, 16550 and 16550A - but 
> not the vendor.
> 
> > > Index: linux-stable/drivers/tty/serial/8250/8250_port.c
> > > ===================================================================
> > > --- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-06 18:54:24.000000000 +0200
> > > +++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-06 18:54:24.000000000 +0200
> > > @@ -30,6 +30,7 @@
> > >  #include <linux/uaccess.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/ktime.h>
> > > +#include <linux/pci.h>
> > >  
> > >  #include <asm/io.h>
> > >  #include <asm/irq.h>
> > > @@ -442,6 +443,9 @@ static unsigned int mem32be_serial_in(st
> > >  
> > >  static unsigned int io_serial_in(struct uart_port *p, int offset)
> > >  {
> > > +	if (serial_port_needs_delay)
> > > +		ndelay(300);
> > 
> > Again, this should be a per-port thing, not all ports in the system are
> > this broken, right?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Here is the patch that uses per-port flag UPQ_DELAY_BEFORE_READ. The flag 
> is activated if we have the specific PCI-ISA bridge and if the serial port 
> is an ISA port.


Better, care to submit this in a format that it can be applied in?

thanks,

greg k-h

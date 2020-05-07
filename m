Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC411C8B62
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 14:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgEGMxK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 08:53:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57530 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725947AbgEGMxJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 May 2020 08:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588855988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Hvqm5iDK+KZF8xmh4JNvSsVzvvifeygBB2w/QK0T3GY=;
        b=cLbNb6dudFgAztPNO8ufkYhABOViFCsfK4GRig1FmN5adTl9zXy7LjR9hq8jPGTlbpWiHS
        MclGgTcTq54WT+ss1yPFwXF32p73+d2F96zxvcnoGVstrp751gn555HcvOT7wwxFysp7VU
        FttHaLyERkRmtVBXVI1VBfdWtU4a4cE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-6-rDRNIkP9y90oprq60W5Q-1; Thu, 07 May 2020 08:53:07 -0400
X-MC-Unique: 6-rDRNIkP9y90oprq60W5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EB2280183C;
        Thu,  7 May 2020 12:53:05 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E1F525C1BE;
        Thu,  7 May 2020 12:53:04 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 047Cr4Ef028866;
        Thu, 7 May 2020 08:53:04 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 047Cr3Ga028857;
        Thu, 7 May 2020 08:53:03 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 7 May 2020 08:53:03 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2 v4] alpha: add a delay before serial port read
In-Reply-To: <20200507111037.GB1490467@kroah.com>
Message-ID: <alpine.LRH.2.02.2005070836190.27409@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com> <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506160823.GA3559699@kroah.com> <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com> <20200506174528.GB3711921@kroah.com> <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com> <20200507085201.GA1097552@kroah.com>
 <alpine.LRH.2.02.2005070645330.18423@file01.intranet.prod.int.rdu2.redhat.com> <20200507111037.GB1490467@kroah.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Thu, 7 May 2020, Greg Kroah-Hartman wrote:

> On Thu, May 07, 2020 at 06:53:55AM -0400, Mikulas Patocka wrote:
> > Index: linux-stable/include/linux/pci.h
> > ===================================================================
> 
> Is this coming from git?

No - I use quilt.

> > --- linux-stable.orig/include/linux/pci.h	2020-05-07 09:57:02.000000000 +0200
> > +++ linux-stable/include/linux/pci.h	2020-05-07 09:57:02.000000000 +0200
> > @@ -2384,6 +2384,10 @@ static inline bool pci_is_thunderbolt_at
> >  	return false;
> >  }
> >  
> > +#ifndef serial_port_needs_delay
> > +#define serial_port_needs_delay	0
> > +#endif
> 
> Anyway, why is this in pci.h?  It has nothing to do with the PCI core.
> 
> And the name needs a lot better description, something like:
> 	alpha_has_b0rken_serial_ports_and_needs_delay
> or something to prevent anyone else from ever using this, right?
> 
> greg k-h

OK - I moved it to asm/serial.h

Mikulas


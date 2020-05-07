Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4921C87B3
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 13:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgEGLKl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 07:10:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:43692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgEGLKl (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 7 May 2020 07:10:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B587208E4;
        Thu,  7 May 2020 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588849839;
        bh=u/Gb1qraksWXYOtNSfEee5KBsc1y7iph76ILmgPOdC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=THLP32OlyCVXvJNfmMv5jKk2gzyUnXI6oyICYTZw9DveNJ1rllUArupv2vH6Yehip
         YZmdMQPElb3AbxHOXH3TSnq6cUQmp+rgzBVjiMaDCrJKOGscfAvvx8EnlTT/mJXKbV
         LRJUO7BSRhfCJNyACN36MznkSBxdjViRong1n2LM=
Date:   Thu, 7 May 2020 13:10:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2 v4] alpha: add a delay before serial port read
Message-ID: <20200507111037.GB1490467@kroah.com>
References: <20200506114711.GB3024358@kroah.com>
 <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506160823.GA3559699@kroah.com>
 <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506174528.GB3711921@kroah.com>
 <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
 <20200507085201.GA1097552@kroah.com>
 <alpine.LRH.2.02.2005070645330.18423@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2005070645330.18423@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 07, 2020 at 06:53:55AM -0400, Mikulas Patocka wrote:
> Index: linux-stable/include/linux/pci.h
> ===================================================================

Is this coming from git?

> --- linux-stable.orig/include/linux/pci.h	2020-05-07 09:57:02.000000000 +0200
> +++ linux-stable/include/linux/pci.h	2020-05-07 09:57:02.000000000 +0200
> @@ -2384,6 +2384,10 @@ static inline bool pci_is_thunderbolt_at
>  	return false;
>  }
>  
> +#ifndef serial_port_needs_delay
> +#define serial_port_needs_delay	0
> +#endif

Anyway, why is this in pci.h?  It has nothing to do with the PCI core.

And the name needs a lot better description, something like:
	alpha_has_b0rken_serial_ports_and_needs_delay
or something to prevent anyone else from ever using this, right?

greg k-h

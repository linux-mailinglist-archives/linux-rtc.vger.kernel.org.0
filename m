Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002981DF876
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2020 19:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388022AbgEWRJY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 May 2020 13:09:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53649 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388050AbgEWRJX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 May 2020 13:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590253760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pt1Iu4wzJS7HbC6OHxqO6Iyg6x2zTpH3ashaPREeSXw=;
        b=aUBXILtJSc1qI15zr4uuNi6PnS/2C+m7jwb48qKII7NlBDXej8ZdRy5UTC4/IXtuzL751Q
        QweRIg87I7uifJ0AIml/2mLasqPzwPTr8Ispijic3iJDGUVLtn/PC5WdHJ06PdIp7uzoD3
        SXVhlgUwGMscRwmsujfWWHQEZJsTvaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-yo8jGxvDO4ayp8WASBaLDg-1; Sat, 23 May 2020 13:09:15 -0400
X-MC-Unique: yo8jGxvDO4ayp8WASBaLDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0AD6835B8B;
        Sat, 23 May 2020 17:09:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 57DA25EE0C;
        Sat, 23 May 2020 17:09:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 04NH9C9m018382;
        Sat, 23 May 2020 13:09:12 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 04NH9BXu018374;
        Sat, 23 May 2020 13:09:11 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sat, 23 May 2020 13:09:11 -0400 (EDT)
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
Subject: Re: [PATCH v4] alpha: fix memory barriers so that they conform to
 the specification
In-Reply-To: <alpine.LFD.2.21.2005231739440.21168@redsun52.ssa.fujisawa.hgst.com>
Message-ID: <alpine.LRH.2.02.2005231307470.18038@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005231739440.21168@redsun52.ssa.fujisawa.hgst.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Sat, 23 May 2020, Maciej W. Rozycki wrote:

> On Sat, 23 May 2020, Mikulas Patocka wrote:
> 
> > ... and I also broke the *_relaxed macros and didn't notice it, because 
> > they are unused in my config. This won't compile, because mb() is a 
> > statement, not a function.
> > 
> > > > +#define readb_relaxed(addr)        (mb(), __raw_readb(addr))
> 
>  A statement expression would do though, e.g.:
> 
> #define readb_relaxed(addr)	({ mb(); __raw_readb(addr); })
> 
> and might be preferable for code brevity to adding a zillion of inline 
> functions.
> 
>   Maciej

I know, but that file uses inline functions everywhere else, so I wanted 
to make it consistent.

Mikulas


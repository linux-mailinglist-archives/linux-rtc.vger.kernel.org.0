Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD231F1320
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jun 2020 08:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgFHG6s (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jun 2020 02:58:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30422 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728334AbgFHG6r (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Jun 2020 02:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591599526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=90pUbKcDx3Wj1mJ+iFwQzzOYVJXR5MBr1hnJ0abQMTk=;
        b=A+rZtV/mTL9x0NHnzngCG2RGT76ZccOe+Gb2NFH/h8koMnbx5AZr8mwwErGBZvRGNXKOA/
        iY1nSeV6OX1aDHlW2Iv0oVnM2/qmmXcbX14PlcrJI2DmH8d1GaXNYUOJ7Qlpsi2FMFwzl6
        JpiyOiTWOliJkudGgw350OMfuDSGb+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-5stnW2U5NZa0lv_6z-rEew-1; Mon, 08 Jun 2020 02:58:44 -0400
X-MC-Unique: 5stnW2U5NZa0lv_6z-rEew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10110107ACCA;
        Mon,  8 Jun 2020 06:58:42 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B2E710013D0;
        Mon,  8 Jun 2020 06:58:41 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 0586weMq015554;
        Mon, 8 Jun 2020 02:58:40 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 0586wdUe015550;
        Mon, 8 Jun 2020 02:58:39 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Mon, 8 Jun 2020 02:58:39 -0400 (EDT)
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
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v7] alpha: fix memory barriers so that they conform to
 the specification
In-Reply-To: <alpine.DEB.2.20.2005270114380.1027@tpp.orcam.me.uk>
Message-ID: <alpine.LRH.2.02.2006080256360.15393@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005251151550.4135@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005261046340.29117@file01.intranet.prod.int.rdu2.redhat.com> <alpine.DEB.2.20.2005270114380.1027@tpp.orcam.me.uk>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Wed, 27 May 2020, Maciej W. Rozycki wrote:

> On Tue, 26 May 2020, Mikulas Patocka wrote:
> 
> > This patch makes barriers confiorm to the specification.
> > 
> > 1. We add mb() before readX_relaxed and writeX_relaxed -
> >    memory-barriers.txt claims that these functions must be ordered w.r.t.
> >    each other. Alpha doesn't order them, so we need an explicit barrier.
> > 2. We add mb() before reads from the I/O space - so that if there's a
> >    write followed by a read, there should be a barrier between them.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Fixes: cd0e00c10672 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering")
> > Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> > Cc: stable@vger.kernel.org      # v4.17+
> > Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> 
>  LGTM, thanks for persistence!
> 
> Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>
> 
>   Maciej

Hi

Will you submit the patch to Linus' tree in this merge window?

Mikulas


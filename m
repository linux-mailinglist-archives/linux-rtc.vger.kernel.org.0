Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783941E1222
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2020 17:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391101AbgEYPyg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 May 2020 11:54:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28442 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391055AbgEYPyg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 May 2020 11:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590422075;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=G5HlSdeXArcl1605FHe8FaMeiLyTdkgKVGZzS1ZjLN4=;
        b=eDfxjlZZYH4WE81OhZwHqVH8g5m6oIQsifHDQC/iLGA77/CRg7/QBZF9/FEl0XwfG9e4Fk
        XghJZxaJ8aAHq+nBDPfEAirr8WIAgTLB/tMtzSVmg0EoV3kyK3rbS0B36tRZzVs/RwRSC8
        /VL9VSZetPNnVw/AmneiQUfwT8iTzv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-3grEl76VPr20ohY9Z3MxjA-1; Mon, 25 May 2020 11:54:33 -0400
X-MC-Unique: 3grEl76VPr20ohY9Z3MxjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4595802EAC;
        Mon, 25 May 2020 15:54:31 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B306360C47;
        Mon, 25 May 2020 15:54:31 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 04PFsVKW004355;
        Mon, 25 May 2020 11:54:31 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 04PFsVMt004352;
        Mon, 25 May 2020 11:54:31 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Mon, 25 May 2020 11:54:31 -0400 (EDT)
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
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to
 the specification
In-Reply-To: <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
Message-ID: <alpine.LRH.2.02.2005251149540.4135@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Mon, 25 May 2020, Maciej W. Rozycki wrote:

> On Mon, 25 May 2020, Mikulas Patocka wrote:
> 
> > The functions __raw_read* are already extern inline, so the compiler will 
> > inline/noinline them depending on the macros trivial_io_bw and 
> > trivial_io_lq - so we can just call them from read*_relaxed without 
> > repeating the extern inline pattern.
> 
>  The whole point of this peculiar arrangement for cooked accessors is to 
> avoid having barriers inserted inline around out-of-line calls to raw 
> accessors,

I see, but why do we want to avoid that? Linux kernel has no binary 
compatibility, so it doesn't matter if the barriers are inlined in the 
drivers or not.

Anyway, I've sent a next version of the patch that makes read*_relaxed 
extern inline.

Mikulas


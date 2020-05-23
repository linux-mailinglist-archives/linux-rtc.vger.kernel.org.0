Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94221DF84A
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2020 18:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgEWQo1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 May 2020 12:44:27 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:39176 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727901AbgEWQoZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 May 2020 12:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590252264; x=1621788264;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=y3/c05P0+8tMbwfUtm2kD68ZlvFGrOuCSHYxFth7mvg=;
  b=WbCBQ8LYubzteCUmIFKZoHv9FEcA65ec7xLHqATlt9mG1mkmF7y032MY
   Ji1B6oDentFARI+YzchDCdprhr/l60Za/vIh+aXqwd0LsnrgHqQXL7aq3
   GMB6S4S+51rlwrn17MGM8uTlxP7ve6FFzhR1PkC3Einyb4agJQH3o6BYO
   ZgVu/PpnHFfoEqNOe0PywqJkHUdS/nKyVwUNRm5nsSISXnQa4JJ8GCGqW
   gRVZGbQCckB/DzMLlrk1w0aPkJvV0XNpjzqP3YUAT8mtK4icQRh2w44D9
   C2jsWcYCjkAap/kgxkEwJebpj4bou1w+mME8Lge9Z3ef0mcbBPTUeFYGL
   Q==;
IronPort-SDR: yyHP/sDdodQswDOSlhgqvHqJJbL8LzKUb6UUuNHoRE/lT/u966BQFhfCc/u5NkiAKOhVxhjBgN
 BdVP0vCE64k4/ocdTc2o6BTKPyi9MYdTJ4HTUOBy/X1K6ncTGY4lZ3nBtJpLh6btW45afs44z5
 KP15I2XS8af/nKl1tPrDXkyyKXAstGKx9uIJIj+UugAojY+f0daVr6S7hb4A0r6oGve0KcEfgs
 tA0HFne5NYY55C+8F6bcTgmYmlhBFR7ShffvZzseWk/+OkLzi1wMr5j+B1znlinN7bo5zuod05
 u4A=
X-IronPort-AV: E=Sophos;i="5.73,426,1583164800"; 
   d="scan'208";a="138377495"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 24 May 2020 00:44:24 +0800
IronPort-SDR: FrHEdNjT0C9kvXoE5PLYLNjwDcK8fP02VtnepL3WDfVdL+TFdeMjRZWTmoIhukfc4RWtBziPaS
 +JYuCYC8PZQmdQEjiWPOpxPTIVhHZnZxs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2020 09:33:48 -0700
IronPort-SDR: sui4u7uIFDpE0LezHqqGhDjthmINs53+uqtdbQhiNCbNODjhzNfCUMy4ThC0+axn49Gye6UwIl
 mrQWppkTSs+Q==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2020 09:44:22 -0700
Date:   Sat, 23 May 2020 17:44:18 +0100 (BST)
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
Subject: Re: [PATCH v4] alpha: fix memory barriers so that they conform to
 the specification
In-Reply-To: <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LFD.2.21.2005231739440.21168@redsun52.ssa.fujisawa.hgst.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 23 May 2020, Mikulas Patocka wrote:

> ... and I also broke the *_relaxed macros and didn't notice it, because 
> they are unused in my config. This won't compile, because mb() is a 
> statement, not a function.
> 
> > > +#define readb_relaxed(addr)        (mb(), __raw_readb(addr))

 A statement expression would do though, e.g.:

#define readb_relaxed(addr)	({ mb(); __raw_readb(addr); })

and might be preferable for code brevity to adding a zillion of inline 
functions.

  Maciej

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9CF1DFAAC
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2020 21:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgEWT1W (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 May 2020 15:27:22 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16153 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgEWT1W (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 May 2020 15:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590262041; x=1621798041;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3a3TsFVAhNs1kKCcF0A2hYXSG8gQ1nGLK2HbNNP92vk=;
  b=DFJhvF7TFNnhdie1t3QEjtu3d0PL+sAFxEhDbU8OKJCD/qfTHLhEfchf
   tyOly32FXudBBlfLEqp2rNbmBzn4EWWB/QR/G3lNVQG9iwwN2/V2oXQW1
   h54+a0S6Wh4RpKF5CF0F21rDl+0F22c5C5SR3eSPc4GLpN55qnesSIk4n
   t9oucyyja2AZxjNH0O5tR+6VvwFW+lGU1FyHiqaFlqYki/HRNsRL6CMHo
   bj+R6iH9wJpD/T8rjYA+SdLiR0PimbCfHBuu7lidSzayOsdKi/BCjYrMJ
   1cY4B+5hKxzQkNZsO0kKVwWXYmtUdwCxtSnBvi7PpXjd2F7jMOQtFJro7
   g==;
IronPort-SDR: HhGWqqw7tJz73mDeqeo+nH5meigQl4f3tc31GcWVbq6ztBonSDQJw972ngEgMK3DXZcc9OsMKK
 jDt/i63Hcve9RS6gtL8zFVw4V00cMWryc0z/pkNYmAzLoJrEeRUgPwLPZ2Iu2zv+3ImVkH/dDi
 kYGEVbnlBqhqXm4+zT7coYtfatt5F2qB9hK1vsOxevwYPIJavRBoS4DhI/84Rclj1NdHovzsbv
 /5uBUROtSLTZx0vesqrnWNtNJi8FKEHYGBTrrhqDzXcsqtYtklJnTPrQFHnHuT7WBA2mm8G4IM
 FK8=
X-IronPort-AV: E=Sophos;i="5.73,426,1583164800"; 
   d="scan'208";a="139818087"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 24 May 2020 03:27:21 +0800
IronPort-SDR: Ns6Q4auNdNqIWLVh879UDx0I3aa1n51ZskgmdALwretwRYq4FTDOhDHcE7d420tlQCgP5LtVGy
 /2amQtp3UVUSXr4DzhbSVtapnAe2XGrik=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2020 12:16:44 -0700
IronPort-SDR: vUOSIVl+SnmLpxV+9oUFEkTymYHmHkoZ0LYV0cQ6SJqoC7ThFa3/Z8ttt9JWOriv70acYlrzet
 1NH2pe2djqrw==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2020 12:27:19 -0700
Date:   Sat, 23 May 2020 20:27:15 +0100 (BST)
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
In-Reply-To: <alpine.LRH.2.02.2005231307470.18038@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LFD.2.21.2005232024500.21168@redsun52.ssa.fujisawa.hgst.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005231739440.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005231307470.18038@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 23 May 2020, Mikulas Patocka wrote:

> >  A statement expression would do though, e.g.:
> > 
> > #define readb_relaxed(addr)	({ mb(); __raw_readb(addr); })
> > 
> > and might be preferable for code brevity to adding a zillion of inline 
> > functions.
> > 
> >   Maciej
> 
> I know, but that file uses inline functions everywhere else, so I wanted 
> to make it consistent.

 Fair enough, fine with me.  I still can't access my Alpha system, have 
you verified your latest version at run time?

  Maciej

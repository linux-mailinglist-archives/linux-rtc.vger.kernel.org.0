Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 463223C028
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2019 01:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390561AbfFJXuC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 10 Jun 2019 19:50:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:51832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390570AbfFJXuC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 10 Jun 2019 19:50:02 -0400
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61738206C3;
        Mon, 10 Jun 2019 23:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560210601;
        bh=4Nz0ZunImL8dBRzdfxHCUv27SCmMJ3PFmP9iuPIVwkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AhdwmqtEpo5q07BJYL9MWvgj0uN6G24vgul44K0FRdH4A3ENzeM12idqpB0F2844N
         Ku1VagKp2qHHhKSzj/wxTsDZZfWx51ykw0W15EvOlZVxJ/18U29EHtRmyWc9JjJJsZ
         DtnJU99ubBhXuBAwhFaZB7jM96h1adlZ3rUezWbw=
Date:   Mon, 10 Jun 2019 16:49:59 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jiwei Sun <jiwei.sun@windriver.com>, linux-rtc@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+08116743f8ad6f9a6de7@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: [rtc] Re: BUG: workqueue lockup (4)
Message-ID: <20190610234959.GB220379@gmail.com>
References: <0000000000005764090577a27486@google.com>
 <CACT4Y+ZAoLro6LHhaA2EuWF1nAWAA=NAVtpMammhspL4V2aMgw@mail.gmail.com>
 <20181007193918.GC32272@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181007193918.GC32272@piout.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Oct 07, 2018 at 09:39:18PM +0200, Alexandre Belloni wrote:
> Hi,
> 
> On 07/10/2018 14:18:31+0200, Dmitry Vyukov wrote:
> > On Sun, Oct 7, 2018 at 2:15 PM, syzbot
> > <syzbot+08116743f8ad6f9a6de7@syzkaller.appspotmail.com> wrote:
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    c1d84a1b42ef Merge git://git.kernel.org/pub/scm/linux/kern..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=14c5f491400000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=c0af03fe452b65fb
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=08116743f8ad6f9a6de7
> > > compiler:       gcc (GCC) 8.0.1 20180413 (experimental)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14514a6e400000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1025ebb9400000
> > 
> > The reproducer seems to be all about rtc. So +rtc maintainers.
> > 
> 
> It seems to be that bug:
> http://patchwork.ozlabs.org/patch/898552/
> 
> I'm pretty sure the fix is not correct though and didn't have the time
> to work on a proper fix.
> 

Is there any plan to actually fix this?  Because this bug is still open, syzbot
isn't able to report "workqueue lockup" bugs elsewhere in the kernel.

- Eric

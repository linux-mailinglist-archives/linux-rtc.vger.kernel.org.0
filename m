Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11623C49C
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2019 09:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404057AbfFKG7w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jun 2019 02:59:52 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34685 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403874AbfFKG7w (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 11 Jun 2019 02:59:52 -0400
Received: from localhost (unknown [37.205.120.66])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5B691240003;
        Tue, 11 Jun 2019 06:59:44 +0000 (UTC)
Date:   Tue, 11 Jun 2019 08:59:40 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Jiwei Sun <jiwei.sun@windriver.com>, linux-rtc@vger.kernel.org,
        Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+08116743f8ad6f9a6de7@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [rtc] Re: BUG: workqueue lockup (4)
Message-ID: <20190611065940.GI25472@piout.net>
References: <0000000000005764090577a27486@google.com>
 <CACT4Y+ZAoLro6LHhaA2EuWF1nAWAA=NAVtpMammhspL4V2aMgw@mail.gmail.com>
 <20181007193918.GC32272@piout.net>
 <20190610234959.GB220379@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610234959.GB220379@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/06/2019 16:49:59-0700, Eric Biggers wrote:
> On Sun, Oct 07, 2018 at 09:39:18PM +0200, Alexandre Belloni wrote:
> > Hi,
> > 
> > On 07/10/2018 14:18:31+0200, Dmitry Vyukov wrote:
> > > On Sun, Oct 7, 2018 at 2:15 PM, syzbot
> > > <syzbot+08116743f8ad6f9a6de7@syzkaller.appspotmail.com> wrote:
> > > > Hello,
> > > >
> > > > syzbot found the following crash on:
> > > >
> > > > HEAD commit:    c1d84a1b42ef Merge git://git.kernel.org/pub/scm/linux/kern..
> > > > git tree:       upstream
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=14c5f491400000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=c0af03fe452b65fb
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=08116743f8ad6f9a6de7
> > > > compiler:       gcc (GCC) 8.0.1 20180413 (experimental)
> > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14514a6e400000
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1025ebb9400000
> > > 
> > > The reproducer seems to be all about rtc. So +rtc maintainers.
> > > 
> > 
> > It seems to be that bug:
> > http://patchwork.ozlabs.org/patch/898552/
> > 
> > I'm pretty sure the fix is not correct though and didn't have the time
> > to work on a proper fix.
> > 
> 
> Is there any plan to actually fix this?  Because this bug is still open, syzbot
> isn't able to report "workqueue lockup" bugs elsewhere in the kernel.
> 

This is still on my radar.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

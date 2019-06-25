Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9BA1557B2
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jun 2019 21:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfFYTTx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Jun 2019 15:19:53 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58627 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfFYTTw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Jun 2019 15:19:52 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 18B5DC000B;
        Tue, 25 Jun 2019 19:19:46 +0000 (UTC)
Date:   Tue, 25 Jun 2019 21:19:45 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Trent Piepho <tpiepho@impinj.com>
Cc:     "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "userm57@yahoo.com" <userm57@yahoo.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
Message-ID: <20190625191945.GH5690@piout.net>
References: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au>
 <20190624195705.GD5690@piout.net>
 <alpine.LNX.2.21.1906251043050.8@nippy.intranet>
 <20190625092926.GE5690@piout.net>
 <1561483011.2343.6.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561483011.2343.6.camel@impinj.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/06/2019 17:16:52+0000, Trent Piepho wrote:
> On Tue, 2019-06-25 at 11:29 +0200, Alexandre Belloni wrote:
> > Userspace is certainly adjusting the timezone after the kernel did. Can
> > you run the same commands without running your init? 
> > 
> > On stable, you have /etc/init.d/hwclock.sh that still runs and does the
> > correct thing. My understanding is that systemd also handles the TZ
> > properly after hctosys (see clock_is_localtime()).
> > 
> > Seriously, hctosys does a really bad job at setting the system time, it
> > is guaranteed to be always wrong on most platforms. My plan is still to
> > try to get distros to stop enabling it and do that properly in
> > userspace. This is already ok when using sysV but systemd would need a
> > few changes to stop relying on it when then is no hwclock initscript.
> > Unfortunately, I didn't have time to work on that yet.
> 
> hctosys is very handy in that it sets the system time before any log
> messages are generated.  Either in a main boot or in an initramfs. 
> Having property time-stamped log messages is very important for
> managing a large deployment.
> 
> If the system time is set by some script or systemd unit, then there
> will always be all the things that need to run before that script or
> unit can work.  E.g., udev creating rtc device nodes, mounting /sys and
> /proc, systemd generator for local file system unis, the other parts of
> systemd to do that, etc. All this won't be able to log with correct
> system time.
> 

I'd argue that this system time is not correct anyway and hence is not
that useful. Especially since the boot time to anything reading the RTC
will still be smaller than the maximum error hctosys can have (that is
up to two seconds). This is even worse if the RTC sotres local time.

Instead of using a systemd unit, we could make systemd read the RTC as
soon as possible and set the system time correctly (at least, that is my
plan). This would be especially useful when using NTP because as already
reported, it may take a few hours to actually synchronize because
hctosys didn't set the correct time.

I would agree that there are remaining use cases for hctosys, e.g. when
wanting to boot a rootfs over a network filesystem and without an
initramfs.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

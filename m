Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B3B56186
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2019 06:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZEmh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Jun 2019 00:42:37 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:52468 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfFZEmh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 Jun 2019 00:42:37 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 3CDE329B38;
        Wed, 26 Jun 2019 00:42:33 -0400 (EDT)
Date:   Wed, 26 Jun 2019 14:42:31 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
cc:     Alessandro Zummo <a.zummo@towertech.it>, userm57@yahoo.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
In-Reply-To: <20190625092926.GE5690@piout.net>
Message-ID: <alpine.LNX.2.21.1906261428060.8@nippy.intranet>
References: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au> <20190624195705.GD5690@piout.net> <alpine.LNX.2.21.1906251043050.8@nippy.intranet> <20190625092926.GE5690@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 25 Jun 2019, Alexandre Belloni wrote:

> On 25/06/2019 11:53:49+1000, Finn Thain wrote:
> > On Mon, 24 Jun 2019, Alexandre Belloni wrote:
> > 
> > > On 21/06/2019 11:51:26+1000, Finn Thain wrote:
> > > > Some machines store local time in the Real Time Clock. The 
> > > > hard-coded "UTC" string is wrong on those machines so just omit 
> > > > that string. Update the log parser so it doesn't require the 
> > > > string "UTC".
> > > > 
> > > 
> > > I don't agree, hctossys will always think the RTC is in UTC.
> > 
> > Well, I wasn't speculating about a theoretical problem. This is a bug 
> > that was reported to me by a user of Debian/powerpc system.
> > 
> > I was able to confirm that the bug also affects dual-boot 
> > Windows/Linux on x86 with CONFIG_RTC_HCTOSYS=y.
> > 
> > > If you store local time in the RTC, then you are probably not using 
> > > hctosys because it definitively doesn't know about the timezone and 
> > > will incorrectly set the system time. That information is usually 
> > > kept in /etc/adjtime.
> > > 
> > 
> > In the Debian/powerpc bug report, the timezone is obtained from the NVRAM:
> > 
> > [    0.000000] PowerMac motherboard: PowerBook Wallstreet
> > ...
> > [    0.000000] GMT Delta read from XPRAM: -360 minutes, DST: on
> > ...
> > [   37.605859] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
> > ...
> > [   40.346255] rtc-generic rtc-generic: setting system clock to 2019-06-19 15:17:35 UTC (1560957455)
> > ...
> > 
> > Though I don't know whether the sys_tz value is relevant here.
> > 
> > Anyway, here's the bug reproduced on x86 --
> > 
> > # dmesg | grep rtc_cmos
> > [    0.543878] rtc_cmos 00:02: RTC can wake from S4
> > [    0.544090] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
> > [    0.544090] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
> > [    0.545807] rtc_cmos 00:02: setting system clock to 2019-06-25 11:24:14 UTC (1561461854)
> > # grep . /etc/adjtime /etc/timezone
> > /etc/adjtime:0.000120 1550184138 0.000000
> > /etc/adjtime:1550184138
> > /etc/adjtime:LOCAL
> > /etc/timezone:Australia/Melbourne
> > # hwclock --show
> > 2019-06-25 11:47:49.702660+10:00
> > # date --iso-8601=s
> > 2019-06-25T11:48:01+10:00
> > # 
> > 
> > Looks wrong to me. What am I missing?
> > 
> 
> Userspace is certainly adjusting the timezone after the kernel did. Can 
> you run the same commands without running your init?
> 

Sure. I booted into /bin/sh instead of /sbin/init then mounted /proc and 
/dev, and got this:

# dmesg | grep rtc_cmos
[    0.544046] rtc_cmos 00:02: RTC can wake from S4
[    0.544246] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    0.544246] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    0.545514] rtc_cmos 00:02: setting system clock to 2019-06-26 14:19:40 UTC (1561558780)
# grep . /etc/adjtime /etc/timezone
/etc/adjtime:0.000120 1550184138 0.000000
/etc/adjtime:1550184138
/etc/adjtime:LOCAL
/etc/timezone:Australia/Melbourne
# hwclock --show
2019-06-26 14:22:25.437089+10:00
# date --iso-8601=s
2019-06-27T00:22:45+10:00

As expected, the kernel message still agrees with the output from hwclock.

> On stable, you have /etc/init.d/hwclock.sh that still runs and does the 
> correct thing. My understanding is that systemd also handles the TZ 
> properly after hctosys (see clock_is_localtime()).
> 

This was Gentoo/x86 with openrc. The Debian/powerpc problem is exactly the 
same: the kernel messages report local time whilst claiming that it's UTC.

> Seriously, hctosys does a really bad job at setting the system time, it 
> is guaranteed to be always wrong on most platforms. My plan is still to 
> try to get distros to stop enabling it and do that properly in 
> userspace. This is already ok when using sysV but systemd would need a 
> few changes to stop relying on it when then is no hwclock initscript. 
> Unfortunately, I didn't have time to work on that yet.
> 

It doesn't help if you are able to change all of the future distros. If 
you remove hctosys you will break some distros which have already shipped.

For example, I've seen a Debian release that will force a fsck of the root 
filesystem without CONFIG_RTC_HCTOSYS. This is a temporary denial of 
service not a failure, but in general a backward jump by a few hours can 
have bad consequences, such as services that refuse to start.

Anyway, this bug is about a misleading printk, it isn't about removing 
functionality. Why conflate these two issues?

-- 

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9067C67BF7
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jul 2019 22:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbfGMUuS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 13 Jul 2019 16:50:18 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:37739 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbfGMUuS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 13 Jul 2019 16:50:18 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 054D1C0006;
        Sat, 13 Jul 2019 20:50:14 +0000 (UTC)
Date:   Sat, 13 Jul 2019 22:50:14 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, userm57@yahoo.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
Message-ID: <20190713205014.GC4732@piout.net>
References: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au>
 <20190624195705.GD5690@piout.net>
 <alpine.LNX.2.21.1906251043050.8@nippy.intranet>
 <20190625092926.GE5690@piout.net>
 <alpine.LNX.2.21.1906261428060.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.21.1906261428060.8@nippy.intranet>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/06/2019 14:42:31+1000, Finn Thain wrote:
> > Userspace is certainly adjusting the timezone after the kernel did. Can 
> > you run the same commands without running your init?
> > 
> 
> Sure. I booted into /bin/sh instead of /sbin/init then mounted /proc and 
> /dev, and got this:
> 
> # dmesg | grep rtc_cmos
> [    0.544046] rtc_cmos 00:02: RTC can wake from S4
> [    0.544246] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
> [    0.544246] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
> [    0.545514] rtc_cmos 00:02: setting system clock to 2019-06-26 14:19:40 UTC (1561558780)
> # grep . /etc/adjtime /etc/timezone
> /etc/adjtime:0.000120 1550184138 0.000000
> /etc/adjtime:1550184138
> /etc/adjtime:LOCAL
> /etc/timezone:Australia/Melbourne
> # hwclock --show
> 2019-06-26 14:22:25.437089+10:00
> # date --iso-8601=s
> 2019-06-27T00:22:45+10:00
> 
> As expected, the kernel message still agrees with the output from hwclock.
> 

hwclock has the information that the RTC is in localtime but hctosys
correctly set the system time to 2019-06-26T14:19:40+00:00, that is
2019-06-27T00:19:40+10:00 so the kernel message is right and the system
time is wrong, unless you invoke hwclock -s

> > On stable, you have /etc/init.d/hwclock.sh that still runs and does the 
> > correct thing. My understanding is that systemd also handles the TZ 
> > properly after hctosys (see clock_is_localtime()).
> > 
> 
> This was Gentoo/x86 with openrc. The Debian/powerpc problem is exactly the 
> same: the kernel messages report local time whilst claiming that it's UTC.
> 

That is not what it is reporting, it is reporting that it is setting the
system time, thinking that the RTC is in UTC time. Your test shows that
this is what happens on x86.

> > Seriously, hctosys does a really bad job at setting the system time, it 
> > is guaranteed to be always wrong on most platforms. My plan is still to 
> > try to get distros to stop enabling it and do that properly in 
> > userspace. This is already ok when using sysV but systemd would need a 
> > few changes to stop relying on it when then is no hwclock initscript. 
> > Unfortunately, I didn't have time to work on that yet.
> > 
> 
> It doesn't help if you are able to change all of the future distros. If 
> you remove hctosys you will break some distros which have already shipped.
> 
> For example, I've seen a Debian release that will force a fsck of the root 
> filesystem without CONFIG_RTC_HCTOSYS. This is a temporary denial of 
> service not a failure, but in general a backward jump by a few hours can 
> have bad consequences, such as services that refuse to start.
> 
> Anyway, this bug is about a misleading printk, it isn't about removing 
> functionality. Why conflate these two issues?

Again, your test shows that I'm correct and hctosys is setting the
system time using the RTC time as UTC time. This gets fixed later by
userspace.

PowerPC is the only different platform because it is able to set sys_tz.
It is the only platform doing so. What you can do is check
sys_tz.tz_minuteswest, keep UTC if it is 0 and print the timezone if it
is not.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

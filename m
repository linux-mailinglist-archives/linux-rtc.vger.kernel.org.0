Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B3B52814
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jun 2019 11:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbfFYJ33 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Jun 2019 05:29:29 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:37927 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbfFYJ33 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Jun 2019 05:29:29 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9B34A240003;
        Tue, 25 Jun 2019 09:29:26 +0000 (UTC)
Date:   Tue, 25 Jun 2019 11:29:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, userm57@yahoo.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
Message-ID: <20190625092926.GE5690@piout.net>
References: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au>
 <20190624195705.GD5690@piout.net>
 <alpine.LNX.2.21.1906251043050.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.21.1906251043050.8@nippy.intranet>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/06/2019 11:53:49+1000, Finn Thain wrote:
> On Mon, 24 Jun 2019, Alexandre Belloni wrote:
> 
> > On 21/06/2019 11:51:26+1000, Finn Thain wrote:
> > > Some machines store local time in the Real Time Clock. The hard-coded 
> > > "UTC" string is wrong on those machines so just omit that string. 
> > > Update the log parser so it doesn't require the string "UTC".
> > > 
> > 
> > I don't agree, hctossys will always think the RTC is in UTC.
> 
> Well, I wasn't speculating about a theoretical problem. This is a bug that 
> was reported to me by a user of Debian/powerpc system.
> 
> I was able to confirm that the bug also affects dual-boot Windows/Linux on 
> x86 with CONFIG_RTC_HCTOSYS=y.
> 
> > If you store local time in the RTC, then you are probably not using 
> > hctosys because it definitively doesn't know about the timezone and will 
> > incorrectly set the system time. That information is usually kept in 
> > /etc/adjtime.
> > 
> 
> In the Debian/powerpc bug report, the timezone is obtained from the NVRAM:
> 
> [    0.000000] PowerMac motherboard: PowerBook Wallstreet
> ...
> [    0.000000] GMT Delta read from XPRAM: -360 minutes, DST: on
> ...
> [   37.605859] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
> ...
> [   40.346255] rtc-generic rtc-generic: setting system clock to 2019-06-19 15:17:35 UTC (1560957455)
> ...
> 
> Though I don't know whether the sys_tz value is relevant here.
> 
> Anyway, here's the bug reproduced on x86 --
> 
> # dmesg | grep rtc_cmos
> [    0.543878] rtc_cmos 00:02: RTC can wake from S4
> [    0.544090] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
> [    0.544090] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
> [    0.545807] rtc_cmos 00:02: setting system clock to 2019-06-25 11:24:14 UTC (1561461854)
> # grep . /etc/adjtime /etc/timezone
> /etc/adjtime:0.000120 1550184138 0.000000
> /etc/adjtime:1550184138
> /etc/adjtime:LOCAL
> /etc/timezone:Australia/Melbourne
> # hwclock --show
> 2019-06-25 11:47:49.702660+10:00
> # date --iso-8601=s
> 2019-06-25T11:48:01+10:00
> # 
> 
> Looks wrong to me. What am I missing?
> 

Userspace is certainly adjusting the timezone after the kernel did. Can
you run the same commands without running your init? 

On stable, you have /etc/init.d/hwclock.sh that still runs and does the
correct thing. My understanding is that systemd also handles the TZ
properly after hctosys (see clock_is_localtime()).

Seriously, hctosys does a really bad job at setting the system time, it
is guaranteed to be always wrong on most platforms. My plan is still to
try to get distros to stop enabling it and do that properly in
userspace. This is already ok when using sysV but systemd would need a
few changes to stop relying on it when then is no hwclock initscript.
Unfortunately, I didn't have time to work on that yet.



-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

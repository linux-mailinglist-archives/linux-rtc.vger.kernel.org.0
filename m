Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8115B52079
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jun 2019 03:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbfFYBx6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 Jun 2019 21:53:58 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:59876 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729450AbfFYBx6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 Jun 2019 21:53:58 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 7913729AF7;
        Mon, 24 Jun 2019 21:53:52 -0400 (EDT)
Date:   Tue, 25 Jun 2019 11:53:49 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
cc:     Alessandro Zummo <a.zummo@towertech.it>, userm57@yahoo.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
In-Reply-To: <20190624195705.GD5690@piout.net>
Message-ID: <alpine.LNX.2.21.1906251043050.8@nippy.intranet>
References: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au> <20190624195705.GD5690@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 24 Jun 2019, Alexandre Belloni wrote:

> On 21/06/2019 11:51:26+1000, Finn Thain wrote:
> > Some machines store local time in the Real Time Clock. The hard-coded 
> > "UTC" string is wrong on those machines so just omit that string. 
> > Update the log parser so it doesn't require the string "UTC".
> > 
> 
> I don't agree, hctossys will always think the RTC is in UTC.

Well, I wasn't speculating about a theoretical problem. This is a bug that 
was reported to me by a user of Debian/powerpc system.

I was able to confirm that the bug also affects dual-boot Windows/Linux on 
x86 with CONFIG_RTC_HCTOSYS=y.

> If you store local time in the RTC, then you are probably not using 
> hctosys because it definitively doesn't know about the timezone and will 
> incorrectly set the system time. That information is usually kept in 
> /etc/adjtime.
> 

In the Debian/powerpc bug report, the timezone is obtained from the NVRAM:

[    0.000000] PowerMac motherboard: PowerBook Wallstreet
...
[    0.000000] GMT Delta read from XPRAM: -360 minutes, DST: on
...
[   37.605859] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
...
[   40.346255] rtc-generic rtc-generic: setting system clock to 2019-06-19 15:17:35 UTC (1560957455)
...

Though I don't know whether the sys_tz value is relevant here.

Anyway, here's the bug reproduced on x86 --

# dmesg | grep rtc_cmos
[    0.543878] rtc_cmos 00:02: RTC can wake from S4
[    0.544090] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    0.544090] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    0.545807] rtc_cmos 00:02: setting system clock to 2019-06-25 11:24:14 UTC (1561461854)
# grep . /etc/adjtime /etc/timezone
/etc/adjtime:0.000120 1550184138 0.000000
/etc/adjtime:1550184138
/etc/adjtime:LOCAL
/etc/timezone:Australia/Melbourne
# hwclock --show
2019-06-25 11:47:49.702660+10:00
# date --iso-8601=s
2019-06-25T11:48:01+10:00
# 

Looks wrong to me. What am I missing?

-- 

> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> > ---
> >  drivers/rtc/hctosys.c             | 2 +-
> >  tools/power/pm-graph/bootgraph.py | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/rtc/hctosys.c b/drivers/rtc/hctosys.c
> > index ff2092a0d38c..2270eca23203 100644
> > --- a/drivers/rtc/hctosys.c
> > +++ b/drivers/rtc/hctosys.c
> > @@ -58,7 +58,7 @@ static int __init rtc_hctosys(void)
> >  
> >  	err = do_settimeofday64(&tv64);
> >  
> > -	dev_info(rtc->dev.parent, "setting system clock to %ptR UTC (%lld)\n",
> > +	dev_info(rtc->dev.parent, "setting system clock to %ptR (%lld)\n",
> >  		 &tm, (long long)tv64.tv_sec);
> >  
> >  err_read:
> > diff --git a/tools/power/pm-graph/bootgraph.py b/tools/power/pm-graph/bootgraph.py
> > index 6dae57041537..5a045d1cb879 100755
> > --- a/tools/power/pm-graph/bootgraph.py
> > +++ b/tools/power/pm-graph/bootgraph.py
> > @@ -333,7 +333,7 @@ def parseKernelLog():
> >  			if(not sysvals.stamp['kernel']):
> >  				sysvals.stamp['kernel'] = sysvals.kernelVersion(msg)
> >  			continue
> > -		m = re.match('.* setting system clock to (?P<t>.*) UTC.*', msg)
> > +		m = re.match('.* setting system clock to (?P<t>.*) (?:UTC )?\(.*', msg)
> >  		if(m):
> >  			bt = datetime.strptime(m.group('t'), '%Y-%m-%d %H:%M:%S')
> >  			bt = bt - timedelta(seconds=int(ktime))
> > -- 
> > 2.21.0
> > 
> 
> -- 
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A84E3EC5
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2019 00:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbfJXWHD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Oct 2019 18:07:03 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41073 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfJXWHD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Oct 2019 18:07:03 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 824E9240007;
        Thu, 24 Oct 2019 22:06:59 +0000 (UTC)
Date:   Fri, 25 Oct 2019 00:06:58 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver
Message-ID: <20191024220658.GZ3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
 <20191021054104.26155-6-andreas@kemnade.info>
 <20191021101528.GU3125@piout.net>
 <20191021231359.1cada218@kemnade.info>
 <20191023231717.GU3125@piout.net>
 <20191024222524.5c0ac910@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024222524.5c0ac910@kemnade.info>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/10/2019 22:25:24+0200, Andreas Kemnade wrote:
> > It is actually kind of an issue to clear it because it may have been set
> > to a useful value. Anyway, I understand you don't know much about the
> > register...
> > 
> Or to some nonsense. The reason I am clearing it is that the original driver
> is doing that and is also exporting it via sysfs. But I could reduce it to 
> clearing it at PON condition, then chances are low that there is something
> important in there.
> 

That would be preferable to do it only at PON.

> > It would be very useful to be able to detect voltage drop. Also PON is a
> > useful information that is lost when probing the driver. You
> > definitively know the time is incorrect after power on and this should
> > be reset only after setting the time at least once (the same for voltage
> > drop).
> > 
> So returing -EIO in read_time and clearing things only after set_time?
> 

That would be EINVAL but yes, this would be the best.

> Do you see tha VDET issue as a blocker for accepting this driver?
> I agree it might be useful. But IMHO it is too much guesswork and hard to test.
> But contrary to the other bits used with a clear name it would be pure guesswork
> and hard to test.  
> 

I understand this would be too much guessing so you can leave it out.

> > There is no specific test because reading any time in the afternoon
> > would fail if there is a mismatch. The correct way to handle this would
> > be to support both 12h and 24h mode in read_time and always set 24h mode
> > in set_time instead of setting it at probe time.
> > 
> I would expect undefined behavior, not necessarily a fail. Interesting
> things will happen the next time the hour register is touched.
> If you assume that the scenario with other users in 12h mode is important
> enough to consider, then you are right, supporting both 12h and 24h in read_time
> is better. About always set 24h: If there is some other user only prepared for
> 12h mode, there will be trouble. Also we might need to reconfigure an alarm
> to the selected mode.
> 
> I guess setting 24h mode at PON and checking at every time and alarm read/write
> what mode we are in. Then we do not need to reprogram alarm.
> 
> What driver is doing 24h/12h in a good way, just as a good example?
> 

Very few drivers are caring and most are assuming 24h mode. The best
ones are handling 12h in read. Very few are are keeping 12h mode when
setting the time and I don't think it is worth it.

My point was that it isn't really useful to set the 24h mode in probe
because if it is in 12h mode, then the time will be invalid until the
next set_time.

> > > > If the PMIC can be used to start the platform, you probably don't want
> > > > to disable the alarm here. Even if it doesn't, is it actually useful to
> > > > disable the alarm?
> > > >   
> > > 
> > > well, I think this is not executed if you do
> > > rtcwake -m off -s something
> > > At least my device powers on after that.
> > >   
> > 
> > This is waking from suspend, I was thinking powering up the platform.
> > 
> well, -m mem is waking from suspend
> -m off is halt
> 
> man rtcwake says:
> 
>               off    ACPI state S5 (Poweroff).  This is done by calling
>               '/sbin/shutdown'.  Not officially supported by ACPI, but
>               it usually works.
> 
> 
> testing
> rtcwake -s 60 -m no
> halt
> 
> it powers on successfully.
> 
> but
> rtcwake -s 60 -m no
> cd /sys/bus/platform/drivers/rc5t619-rtc
> echo rc5t619-rtc >unbind
> halt
> 
> does *not* power on. So only here .remove is called.
> 
> But that is just for understanding what we are doing here.
> It is more important to have a common behavior across drivers.
> 

You are right and I'm wrong

> > > Somehow I expect the driver to clean up there. e.g. rc5t583 does that, too.
> > > But no strong opinion here.
> > >   
> > 
> So it seems that I have found a driver doing something uncommon here an
> an example.
> 
> > Again, the RTC is still running after a shutdown (which will run the
> > .remove callback). Disabling the alarm means that it will not fire while
> > linux is not running I'm not sure what the upside is. But this prevents
> > the RTC from starting the system if someone uses the alarm pin to do
> > that.
> > 
> As said disabling alarm at this place means not disabling alarm at shutdown
> but think it is simply not necessary.
> 

That would still be my opinion.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

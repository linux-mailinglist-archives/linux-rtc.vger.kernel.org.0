Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8F671FE5
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 21:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfGWTGn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 15:06:43 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33131 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfGWTGn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jul 2019 15:06:43 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hq07S-0000iK-6H; Tue, 23 Jul 2019 21:06:38 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hq07R-0004b3-0N; Tue, 23 Jul 2019 21:06:37 +0200
Date:   Tue, 23 Jul 2019 21:06:36 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oliver Hartkopp <socketcan@hartkopp.net>
Cc:     linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
        tbm@cyrius.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: TS-219 RTC issue with Debian Buster
Message-ID: <20190723190636.tuzob2w2fznmtsmb@pengutronix.de>
References: <99a8e2cc-61a2-3b43-0d72-6f001cffe572@hartkopp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99a8e2cc-61a2-3b43-0d72-6f001cffe572@hartkopp.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Oliver,

I added the RTC maintainers and list to Cc.

On Tue, Jul 23, 2019 at 05:30:48PM +0200, Oliver Hartkopp wrote:
> I upgraded my TS-219 to Debian Buster with Kernel 4.19.0-5-marvell.
> 
> They use dtbs/4.19.0-5-marvell/./kirkwood-ts219-6282.dtb
> 
> Unfortunately the RTC doesn't seem to work.
> 
> root@xxxxx:~# hwclock -v --test
> hwclock from util-linux 2.33.1
> System Time: 1563296223.425648
> Trying to open: /dev/rtc0
> Using the rtc interface to the clock.
> Last drift adjustment done at 1563291472 seconds after 1969
> Last calibration done at 1563291472 seconds after 1969
> Hardware clock is on UTC time
> Assuming hardware clock is kept in UTC time.
> Waiting for clock tick...
> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> ...synchronization failed
> Test mode: nothing was changed.
> With strace the clock tick problem looks like this:
> 
> write(1, "Waiting for clock tick...\n", 26Waiting for clock tick...
> ) = 26
> ioctl(4, RTC_UIE_ON)                    = 0
> _newselect(5, [4], NULL, NULL, {tv_sec=10, tv_usec=0}) = 0 (Timeout)
> write(2, "hwclock: ", 9hwclock: )                = 9
> write(2, "select() to /dev/rtc0 to wait fo"..., 54select() to /dev/rtc0 to
> wait for clock tick timed out) = 54
> write(2, "\n", 1)                       = 1
> ioctl(4, PHN_NOT_OH or RTC_UIE_OFF)     = 0

Maybe rtc-mv should set uie_unsupported if no irq is aquired? 

> It looks the same with
> 
> # hwclock --hctosys
> hwclock: select() to /dev/rtc0 to wait for clock tick timed out

hwclock (from util-linux) is being stupid here. The tradtional RTC on
the x86 platform has a resolution of 1s only and if you set it the next
increment is 1 second after the last increment instead of 1 second after
the new time was set. So hwclock waits for an update event and then sets
the new time (in some cases to a tad later than requested) to ensure the
PC clock is off by less than half a second. For most (if not all) other
RTCs this is wrong and still worse if the RTC in question doesn't
support UIE.

> I wonder whether the problem comes from a missing interrupt assignment
> 
> rtc: rtc@10300 {
>              compatible = "marvell,kirkwood-rtc", "marvell,orion-rtc";
>              reg = <0x10300 0x20>;
>              interrupts = <53>;            <- HERE!?!
>              clocks = <&gate_clk 7>;
>                };
> 
> ... I found in linux/arch/arm/boot/dts/kirkwood-6282.dtsi ?!?
> 
> In /proc/interrupts there's no rtc assigned to an interrupt 53.

What is the output of dmesg | grep 10300 ?
 
> Accessing the rtc values (time/date) via /sys/class/rtc/rtc0 entries works
> well and setting the date/time via "hwclock --systohc" does its job too. So
> I2C and the rtc_s35390a driver seem to work so far.

You're not using the s35390a driver, do you?
 
> Any ideas why hwclock fails to work properly?

Try if 

	busybox hwclock 

works better for you. At least this one doesn't have this strange PC
quirk.
 
Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

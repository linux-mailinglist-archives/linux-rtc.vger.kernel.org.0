Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0C375FCE
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2019 09:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfGZH2C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Jul 2019 03:28:02 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57063 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbfGZH2C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Jul 2019 03:28:02 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hque0-0005j2-Bz; Fri, 26 Jul 2019 09:28:00 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hqudz-0006pc-Lo; Fri, 26 Jul 2019 09:27:59 +0200
Date:   Fri, 26 Jul 2019 09:27:59 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Oliver Hartkopp <socketcan@hartkopp.net>, 932845@bugs.debian.org,
        linux-rtc@vger.kernel.org
Subject: Re: Bug#932845: TS-219 RTC issue with Debian Buster
Message-ID: <20190726072759.uxx7i2hrl5qr4oux@pengutronix.de>
References: <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <20190724070704.GA5983@taurus.defre.kleine-koenig.org>
 <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <806117df-54ac-88f2-06a0-20a7502202ff@hartkopp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <806117df-54ac-88f2-06a0-20a7502202ff@hartkopp.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alexandre,

On Thu, Jul 25, 2019 at 04:31:49PM +0200, Oliver Hartkopp wrote:
> On 24.07.19 09:07, Uwe Kleine-König wrote:
> > On Tue, Jul 23, 2019 at 10:28:18PM +0200, Oliver Hartkopp wrote:
> > > I'm running a TS-119P+ and a TS-219P II Qnap NAS with Debian Buster.
> > > Both are now running a linux-image-4.19.0-5-marvell kernel.
> > > 
> > > But since my update from Linux 4.9 (Stretch) to Linux 4.19 (Buster) the
> > > hardware clock of both boxes refuse to work.
> > > 
> > > After some digging in kernel sources and re-installing Linux 4.9 on my
> > > Buster setup it turns out, that a change in the kernel config causes the
> > > problem:
> > > 
> > > 4.19.0-5-marvell -> CONFIG_RTC_DRV_S35390A=m   (fails)
> > > 
> > > 4.9.0-4-marvell -> CONFIG_RTC_DRV_S35390A=y    (works)
> > > 
> > > See details and solving process at:
> > > 
> > > https://marc.info/?l=linux-arm-kernel&m=156390875629259&w=2
> > > 
> > > Can you please revert the Kernel config parts for the RTC in a way that the
> > > RTC drivers are built into the marvell-arch kernel again instead of building
> > > them as modules?
> > 
> > They were switched to modules because the kernel image got too big to
> > fit into the flash storage of some machines. I assume when we switch to
> > built-in again the resulting problem is the bigger one.
> 
> I don't know which is the bigger problem here.
> 
> When the rtc driver is built as module it can not be operated with the
> hwclock tool from the util-linux package due to the missing rtc UIE support.
> 
> You finally have no hardware clock on these machines and must wait for ntp
> to shift time and date (my system always starts in February until ntp fixes
> the time).

For me it's obvious what is the bigger problem. Either you don't have
the correct time until ntp fixes it up for you, or others cannot install
a kernel update and so run a vulnerable OS.

> Maybe this problem is only relevant for the S35390A and PCF8563 chip which
> both lack the UIE support needed by hwclock. Both have only alarm triggers
> in a minute accuracy according to the driver source code.

AFAIK the rtc framework should then emulate this event somehow.

> So CONFIG_RTC_DRV_S35390A=y and CONFIG_RTC_DRV_PCF8563=y should bring back
> the hw clocks on these machines.
> 
> I assume using hwclock without UIE trigger code will impact the accuracy.
> 
> > > As described in the referenced description the hwclock tool does not work on
> > > the machines.
> > 
> > I'm not sure yet if this is a problem in hwclock() or the s35390a
> > driver.
> 
> In detail it is hwclock together with rtc drivers not supporting UIE trigger
> with a 1 second resolution.

@abelloni: Do you can shed some light here, how it is supposed to work?
Is hwclock just doing it wrong with non-PC clocks, or is there a kernel
bug to fix?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

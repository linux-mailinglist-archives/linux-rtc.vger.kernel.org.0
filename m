Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A998762AC
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2019 11:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfGZJjx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Jul 2019 05:39:53 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50705 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfGZJjx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Jul 2019 05:39:53 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 876B9240013;
        Fri, 26 Jul 2019 09:39:50 +0000 (UTC)
Date:   Fri, 26 Jul 2019 11:39:49 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Oliver Hartkopp <socketcan@hartkopp.net>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, 932845@bugs.debian.org,
        linux-rtc@vger.kernel.org
Subject: Re: Bug#932845: TS-219 RTC issue with Debian Buster
Message-ID: <20190726093949.GA3962@piout.net>
References: <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <20190724070704.GA5983@taurus.defre.kleine-koenig.org>
 <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <806117df-54ac-88f2-06a0-20a7502202ff@hartkopp.net>
 <20190726072759.uxx7i2hrl5qr4oux@pengutronix.de>
 <ec38f0ea-2113-5054-b98a-a4798eb61c82@hartkopp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec38f0ea-2113-5054-b98a-a4798eb61c82@hartkopp.net>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/07/2019 11:27:11+0200, Oliver Hartkopp wrote:
> Hello Uwe,
> 
> On 26.07.19 09:27, Uwe Kleine-König wrote:
> > Hello Alexandre,
> > 
> > On Thu, Jul 25, 2019 at 04:31:49PM +0200, Oliver Hartkopp wrote:
> > > On 24.07.19 09:07, Uwe Kleine-König wrote:
> > > > On Tue, Jul 23, 2019 at 10:28:18PM +0200, Oliver Hartkopp wrote:
> > > > > I'm running a TS-119P+ and a TS-219P II Qnap NAS with Debian Buster.
> > > > > Both are now running a linux-image-4.19.0-5-marvell kernel.
> > > > > 
> > > > > But since my update from Linux 4.9 (Stretch) to Linux 4.19 (Buster) the
> > > > > hardware clock of both boxes refuse to work.
> > > > > 
> > > > > After some digging in kernel sources and re-installing Linux 4.9 on my
> > > > > Buster setup it turns out, that a change in the kernel config causes the
> > > > > problem:
> > > > > 
> > > > > 4.19.0-5-marvell -> CONFIG_RTC_DRV_S35390A=m   (fails)
> > > > > 
> > > > > 4.9.0-4-marvell -> CONFIG_RTC_DRV_S35390A=y    (works)
> > > > > 
> > > > > See details and solving process at:
> > > > > 
> > > > > https://marc.info/?l=linux-arm-kernel&m=156390875629259&w=2
> > > > > 
> > > > > Can you please revert the Kernel config parts for the RTC in a way that the
> > > > > RTC drivers are built into the marvell-arch kernel again instead of building
> > > > > them as modules?
> > > > 
> > > > They were switched to modules because the kernel image got too big to
> > > > fit into the flash storage of some machines. I assume when we switch to
> > > > built-in again the resulting problem is the bigger one.
> > > 
> > > I don't know which is the bigger problem here.
> > > 
> > > When the rtc driver is built as module it can not be operated with the
> > > hwclock tool from the util-linux package due to the missing rtc UIE support.
> > > 
> > > You finally have no hardware clock on these machines and must wait for ntp
> > > to shift time and date (my system always starts in February until ntp fixes
> > > the time).
> > 
> > For me it's obvious what is the bigger problem. Either you don't have
> > the correct time until ntp fixes it up for you, or others cannot install
> > a kernel update and so run a vulnerable OS.
> 
> That what I've written, NTP fixes the time for me. I have no problem with
> updating my kernels - in fact I was even able to flash an older kernel to
> figure out this rtc issue :-)
> 
> > > Maybe this problem is only relevant for the S35390A and PCF8563 chip which
> > > both lack the UIE support needed by hwclock. Both have only alarm triggers
> > > in a minute accuracy according to the driver source code.
> > 
> > AFAIK the rtc framework should then emulate this event somehow.
> 
> I don't think so. When the rtc chip is not able to trigger an event with a
> one second resolution - how can you emulate that?
> 

CONFIG_RTC_INTF_DEV_UIE_EMUL emulates it by polling the RTC.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

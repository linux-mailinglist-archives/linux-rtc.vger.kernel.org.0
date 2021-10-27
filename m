Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DA443D2DE
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Oct 2021 22:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240960AbhJ0UfV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Oct 2021 16:35:21 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58307 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240927AbhJ0UfV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Oct 2021 16:35:21 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 62697C0008;
        Wed, 27 Oct 2021 20:32:53 +0000 (UTC)
Date:   Wed, 27 Oct 2021 22:32:53 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: nintendo: Add a RTC driver for the GameCube, Wii
 and Wii U
Message-ID: <YXm3da9Mq8HR3Iin@piout.net>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <YXmCQnJTujtak+Qy@piout.net>
 <20211027170527.za6xlwvmzmulgqoa@luna>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211027170527.za6xlwvmzmulgqoa@luna>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/10/2021 19:05:27+0200, Emmanuel Gil Peyrot wrote:
> > On 15/10/2021 00:05:24+0200, Emmanuel Gil Peyrot wrote:
> > > These three consoles share a device, the MX23L4005, which contains a
> > > clock and 64 bytes of SRAM storage, and is exposed on the EXI bus
> > > (similar to SPI) on channel 0, device 1.  This driver allows it to be
> > > used as a Linux RTC device, where time can be read and set.
> > > 
> > > The hardware also exposes two timers, one which shuts down the console
> > > and one which powers it on, but these aren’t supported currently.
> > > 
> > > On the Wii U, the counter bias is stored in a XML file, /config/rtc.xml,
> > > encrypted in the SLC (eMMC storage), using a proprietary filesystem.  In
> > > order to avoid having to implement all that, this driver assumes a
> > > bootloader will parse this XML file and write the bias into the SRAM, at
> > > the same location the other two consoles have it.
> > > 
> > > Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> > > ---
> > >  drivers/rtc/Kconfig        |  10 ++
> > >  drivers/rtc/Makefile       |   1 +
> > >  drivers/rtc/rtc-nintendo.c | 305 +++++++++++++++++++++++++++++++++++++
> > 
> > I'm not convinced this is a good name, seeing that the switch will
> > certainly not use this driver (neither is the snes mini).
> 
> Other subsystem maintainers have requested this to be changed, so I
> reflected it here too.  For instance hid requested a Wii U-specific
> driver to be merged with the Switch one.
> 
> Would rtc-gamecube be fine then?  So far I have only tested on Wii U,
> but this driver is expected to support all three generations of
> GameCube, Wii and Wii U.
> 

I think this is appropriate, that would have been my suggestion.

> > > +static int nintendo_rtc_set_time(struct device *dev, struct rtc_time *t)
> > > +{
> > > +	time64_t timestamp;
> > > +	struct nintendo_rtc_drvdata *d = dev_get_drvdata(dev);
> > > +
> > > +	/* Subtract the timestamp and the bias to obtain the counter value */
> > > +	timestamp = rtc_tm_to_time64(t);
> > > +	exi_write(d->iob, RTC_COUNTER, timestamp - d->rtc_bias);
> > 
> > As you are able to update RTC_COUNTER, I'm not sure why you actually
> > need rtc_bias.
> 
> The proprietary firmware sets the counter based on the bias, so if we
> want to get the correct time out of the box we have to sum them.  It
> wouldn’t even be possible to set bias on all of the consoles from Linux,
> for instance on the Wii U it is stored in an XML file, in a proprietary
> filesystem, and encrypted (using keys for which the drivers are already
> in mainline at least).
> 

Ok, fine by me.

> > > +#ifdef DEBUG
> > > +static void nintendo_rtc_dumpregs(void __iomem *iob)
> > > +{
> > > +	int i;
> > > +	u32 sram_addr = RTC_SRAM;
> > > +
> > > +	printk("RTC_COUNTER:  %08X\n", exi_read(iob, RTC_COUNTER));
> > > +	printk("RTC_SNAPSHOT: %08X\n", exi_read(iob, RTC_SNAPSHOT));
> > > +	printk("RTC_ONTMR:    %08X\n", exi_read(iob, RTC_ONTMR));
> > > +	printk("RTC_OFFTMR:   %08X\n", exi_read(iob, RTC_OFFTMR));
> > > +	printk("RTC_TEST0:    %08X\n", exi_read(iob, RTC_TEST0));
> > > +	printk("RTC_TEST1:    %08X\n", exi_read(iob, RTC_TEST1));
> > > +	printk("RTC_TEST2:    %08X\n", exi_read(iob, RTC_TEST2));
> > > +	printk("RTC_TEST3:    %08X\n", exi_read(iob, RTC_TEST3));
> > > +	printk("RTC_CONTROL0: %08X\n", exi_read(iob, RTC_CONTROL0));
> > > +	printk("RTC_CONTROL1: %08X\n", exi_read(iob, RTC_CONTROL1));
> > > +	printk("RTC_SRAM:\n");
> > > +	for(i = 0; i < 4; i++) {
> > > +		printk("%08X %08X %08X %08X\n",
> > > +		       exi_read(iob, sram_addr + 0x100 * 0),
> > > +		       exi_read(iob, sram_addr + 0x100 * 1),
> > > +		       exi_read(iob, sram_addr + 0x100 * 2),
> > > +		       exi_read(iob, sram_addr + 0x100 * 3));
> > > +		sram_addr += 0x400;
> > 
> > Something great to do would be to convert the driver to regmap, provding
> > custom regmap_read and regmap_write functions to access the EXI bus.
> > Then you'd get this directly in debugfs. And this could be split ou once
> > other drivers need access to the bus (I guess power/reset at some
> > point).
> 
> Will do, I wasn’t aware of regmap, thanks!
> 

This is feature creep pushed to the max, I would take your driver even
if you don't do that.

> > 
> > Ideally, you should also expose LOW_BATT from RTC_CONTROL0 using the
> > VL_READ ioctl as I'm guessing many console will start to have a depleted
> > battery.
> 
> I won’t be able to test that yet, but I’ll try to implement it as it is
> documented.
> 

This can also come in a second patch. I'll try to boot up my own
(platinum edition) GC, I'm wondering what is the battery status :)


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

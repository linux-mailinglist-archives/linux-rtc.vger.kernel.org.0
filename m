Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A081C63A8
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 00:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgEEWJO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 18:09:14 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56265 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgEEWJO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 18:09:14 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2C875C0003;
        Tue,  5 May 2020 22:09:12 +0000 (UTC)
Date:   Wed, 6 May 2020 00:09:11 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     linux-rtc@vger.kernel.org,
        Per =?iso-8859-1?Q?N=F8rgaard?= Christensen 
        <per.christensen@prevas.dk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] rtc: pcf2127: report battery switch over
Message-ID: <20200505220911.GW34497@piout.net>
References: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
 <20200505201310.255145-5-alexandre.belloni@bootlin.com>
 <e4910679-4453-f753-2c3e-4c93fd755b39@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4910679-4453-f753-2c3e-4c93fd755b39@prevas.dk>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/05/2020 23:30:18+0200, Rasmus Villemoes wrote:
> On 05/05/2020 22.13, Alexandre Belloni wrote:
> > Add support for the RTC_VL_BACKUP_SWITCH flag to report battery switch over
> > events.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  drivers/rtc/rtc-pcf2127.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 039078029bd4..967de68e1b03 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -188,18 +188,27 @@ static int pcf2127_rtc_ioctl(struct device *dev,
> >  				unsigned int cmd, unsigned long arg)
> >  {
> >  	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> > -	int touser;
> > +	int val, touser = 0;
> >  	int ret;
> >  
> >  	switch (cmd) {
> >  	case RTC_VL_READ:
> > -		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &touser);
> > +		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &val);
> >  		if (ret)
> >  			return ret;
> >  
> > -		touser = touser & PCF2127_BIT_CTRL3_BLF ? RTC_VL_BACKUP_LOW : 0;
> > +		if (val & PCF2127_BIT_CTRL3_BLF)
> > +			touser = RTC_VL_BACKUP_LOW;
> > +
> > +		if (val & PCF2127_BIT_CTRL3_BF)
> > +			touser |= RTC_VL_BACKUP_SWITCH;
> 
> I think it's a bit easier to read if you use |= in both cases.
> 
> Re patch 3, one saves a little .text by eliding the ioctl function when,
> as you say, it cannot be called anyway. No strong opinion either way, I
> don't think anybody actually builds without CONFIG_RTC_INTF_DEV, but
> those that do are probably the ones that care about having a tiny vmlinux.
> 

Honestly, I don't think it is worth doing that. On armv7, this only
removes 248 bytes. Also, compiling without CONFIG_RTC_INTF_DEV simply
makes the RTC unusable. There are no tools actually using the sysfs
interface instead of the char device interface. I prefer keeping
CONFIG_RTC_INTF_DEV private to the core.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C032BE26ED
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2019 01:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436907AbfJWXRV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Oct 2019 19:17:21 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33097 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbfJWXRV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Oct 2019 19:17:21 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E3C5A60002;
        Wed, 23 Oct 2019 23:17:17 +0000 (UTC)
Date:   Thu, 24 Oct 2019 01:17:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver
Message-ID: <20191023231717.GU3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
 <20191021054104.26155-6-andreas@kemnade.info>
 <20191021101528.GU3125@piout.net>
 <20191021231359.1cada218@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021231359.1cada218@kemnade.info>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/10/2019 23:13:59+0200, Andreas Kemnade wrote:
> > > + * Based on code
> > > + *  Copyright (C) 2012-2014 RICOH COMPANY,LTD
> > > + *
> > > + * Based on code
> > > + *  Copyright (C) 2011 NVIDIA Corporation  
> > 
> > Based on is not useful.
> > 
> Well, ok, I guess 90 % of the lines are rewritten by me.
> So I could remove all that Based on copyright notices?
> 

Yes

> > Also what is that adjusting? If this is adding/removing clock cycles,
> > you need to use .set_offset and .read_offset.
> > 
> It the moment I am just clearing it at init. Since I do not know the
> exact meaning of the value, I am not offering it through set_offset/read_offset.
> 

It is actually kind of an issue to clear it because it may have been set
to a useful value. Anyway, I understand you don't know much about the
register...

> > > +}
> > > +
> > > +static int rc5t619_rtc_pon_get_clr(struct device *dev, uint8_t *pon_f)
> > > +{
> > > +	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
> > > +	int err;
> > > +	unsigned int reg_data;
> > > +
> > > +	err = regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2, &reg_data);
> > > +	if (err < 0)
> > > +		return err;
> > > +
> > > +	if (reg_data & CTRL2_PON) {
> > > +		*pon_f = 1;
> > > +		/* clear VDET PON */
> > > +		reg_data &= ~(CTRL2_PON | CTRL2_CTC | 0x4a);	/* 0101-1011 */
> > > +		reg_data |= 0x20;	/* 0010-0000 */  
> > 
> > Is it possible to have more defines for those magic values?
> > 
> Well, I only have some GPLed source code as documentation, no good documentation.
> So I only know that one bit must be VDET.
> rtc-rc5t583 seems not to be helpful to find these magic numbers.
> 0x40 might be VDET. At least that is conform with rtc-rs5c348.c.
> rc5t583 seems not to know a VDET.
> But there seems to be no clear duplicate anywhere of those two
> ctrl registers. It seems that the rc5t619 is a cross of everything, having
> 6 byte bcd time in common with everything. 
> So we have to keep a bit of magic here.
> 

It would be very useful to be able to detect voltage drop. Also PON is a
useful information that is lost when probing the driver. You
definitively know the time is incorrect after power on and this should
be reset only after setting the time at least once (the same for voltage
drop).

> > > +		cent_flag = 1;
> > > +	else
> > > +		cent_flag = 0;
> > > +
> > > +	buff[5] = buff[5] & 0x1f;		/* bit5 19_20 */  
> > 
> > This assignment is unnecessary, you can mask the value when using it.
> > 
> ok.
> 
> > Is the RTC 1900-2099 or 2000-2199? Please include the ouput of rtc-range
> > in the commit log:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tree/rtc-range.c
> > 
> # ./rtc-range 
> 
> Testing 2000-02-28 23:59:59.
> OK
> 
> Testing 2038-01-19 03:14:07.
> OK
> 
> Testing 2069-12-31 23:59:59.
> OK
> 
> Testing 2099-12-31 23:59:59.
> KO RTC_RD_TIME returned 22 (line 138)
> 
> Testing 2100-02-28 23:59:59.
> KO RTC_RD_TIME returned 22 (line 138)
> 
> Testing 2106-02-07 06:28:15.
> OK
> 
> Testing 2262-04-11 23:47:16.
> KO  Read back 2102-04-11 23:47:16.
> 
> I think it is 1900 to 2099.
> 

It is, I'm very curious to know why it doesn't roll over properly from
2099-12-31 23:59:59 to 1900-01-01 00:00:00.

You can set range_min and range_max accordingly.

> > > +	if (rtc->irq == -1)
> > > +		return -EIO;  
> > 
> > This has to be -EINVAL to get UIE emulation working.
> >
> so then ordinary hwclock still works without irq?
>  

Yes

> > > +	/* using 24h-mode */
> > > +	err = rc5t619_rtc_24hour_mode_set(&pdev->dev, 1);
> > > +  
> > 
> > Doesn't that corrupt the time if the RTC was previously set in 12h-mode?
> > 
> > 
> Probably it can. but probably that is only important in a multi-boot scenario but
> who knows... If that is important enough I can try to implement 12h mode.
> 
> Is there any testing tool for 12h vs. 24h? Or should I expand
> rtc-range.c? BTW: apparently rtc-rc5t583.c seems not to properly care
> about 24h mode too, so I took a bad example. Well, not tested that...
> 

There is no specific test because reading any time in the afternoon
would fail if there is a mismatch. The correct way to handle this would
be to support both 12h and 24h mode in read_time and always set 24h mode
in set_time instead of setting it at probe time.

People usually forget that the RTC is still running while Linux is not.
So for an RTC driver, it is a bad idea to do initialization at every
probe, unlike many other peripheral.

> > > +static int rc5t619_rtc_remove(struct platform_device *pdev)
> > > +{
> > > +	rc5t619_rtc_alarm_enable(&pdev->dev, 0);  
> > 
> > If the PMIC can be used to start the platform, you probably don't want
> > to disable the alarm here. Even if it doesn't, is it actually useful to
> > disable the alarm?
> > 
> 
> well, I think this is not executed if you do
> rtcwake -m off -s something
> At least my device powers on after that.
> 

This is waking from suspend, I was thinking powering up the platform.

> Somehow I expect the driver to clean up there. e.g. rc5t583 does that, too.
> But no strong opinion here.
> 

Again, the RTC is still running after a shutdown (which will run the
.remove callback). Disabling the alarm means that it will not fire while
linux is not running I'm not sure what the upside is. But this prevents
the RTC from starting the system if someone uses the alarm pin to do
that.

Also, having an alarm set means that userspace did it intentionally. The
driver removing the alarm is not something that is expected.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

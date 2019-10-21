Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B98DF0EF
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 17:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbfJUPKF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 11:10:05 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55925 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfJUPKF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 11:10:05 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 353C420009;
        Mon, 21 Oct 2019 15:10:00 +0000 (UTC)
Date:   Mon, 21 Oct 2019 17:09:59 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>, linux-rtc@vger.kernel.org,
        a.zummo@towertech.it,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        lee.jones@linaro.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [Letux-kernel] [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619
 RTC driver
Message-ID: <20191021150959.GX3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
 <20191021054104.26155-6-andreas@kemnade.info>
 <20191021101528.GU3125@piout.net>
 <F16BC3B8-5497-4A7D-AC88-4DB221038519@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F16BC3B8-5497-4A7D-AC88-4DB221038519@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/10/2019 12:31:30+0200, H. Nikolaus Schaller wrote:
> >> @@ -0,0 +1,476 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/*
> >> + * drivers/rtc/rtc-ricoh619.c
> >> + *
> >> + * Real time clock driver for RICOH R5T619 power management chip.
> >> + *
> >> + * Copyright (C) 2019 Andreas Kemnade
> >> + *
> >> + * Based on code
> >> + *  Copyright (C) 2012-2014 RICOH COMPANY,LTD
> >> + *
> >> + * Based on code
> >> + *  Copyright (C) 2011 NVIDIA Corporation
> > 
> > Based on is not useful.
> 
> Yes, it is difficult to track what the real contribution was
> and what is left over.
> 
> On the other hand it is IMHO fair to attribute those who have
> spent time to save ours.
> 
> What would be a better way for attribution?
> 

I don't think this require attribution

> >> +static int rc5t619_rtc_clk_adjust(struct device *dev, uint8_t clk)
> >> +{
> >> +	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
> >> +
> >> +	return regmap_write(rtc->rn5t618->regmap, RN5T618_RTC_ADJUST, clk);
> > 
> > Is it useful to have a function for a single regmap_write?
> 
> I'd say yes. It is wrapping all regmap accesses in getter/setter functions
> whose name describes what it is setting. And it may do type conversion.
> IMHO this makes code better readable and maintainable.
> And a good compiler may even decide to inline this.
> 

But this takes up a lot of space in the file which makes it harder to
read while adding no information, how is rc5t619_rtc_clk_adjust more
informative than regmap_write(rtc->rn5t618->regmap, RN5T618_RTC_ADJUST,
clk)?

in both cases, I can easily deduce that the RTC adjust register is
changed.


> >> +/* 0-12hour, 1-24hour */
> >> +static int rc5t619_rtc_24hour_mode_set(struct device *dev, int mode)
> >> +{
> >> +	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
> >> +
> >> +	return regmap_update_bits(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1,
> >> +			CTRL1_24HR, mode ? CTRL1_24HR : 0);
> > 
> > Is it useful to have a function for a single regmap_update_bits?
> 
> Same as above. I can immediately understand
> 
> 	r = rc5t619_rtc_24hour_mode_set(dev, MODE_SOMETHING);
> 
> somewhere else in code but deciphering 
> 
> 	r = regmap_update_bits(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1,
> 				CTRL1_24HR, mode ? CTRL1_24HR : 0);
> 
> spread over several places is probably difficult.
> 

I can immediately understand updating CTRL1_24HR in RN5T618_RTC_CTRL1
And it is used exactly once...

If this is all about naming and understanding, then why that driver
still had so many magic values?


> > 
> >> +}
> >> +
> >> +
> >> +static int rc5t619_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >> +{
> >> +	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
> >> +	u8 buff[7];
> >> +	int err;
> >> +	int cent_flag;
> >> +
> >> +	err = regmap_bulk_read(rtc->rn5t618->regmap, RN5T618_RTC_SECONDS,
> >> +				buff, sizeof(buff));
> >> +	if (err < 0) {
> >> +		dev_err(dev, "failed to read time: %d\n", err);
> > 
> > Please reconsider adding so many strings in the driver, they add almost
> > no value but will increase the kernel memory footprint.
> 
> You mean removing error messages is better than taking some footprint?
> 

Definitively yes, what is the value of the error message on the device?
What should the end user do about it? Is there even an end user reading
that message?

> >> +static int rc5t619_rtc_alarm_is_enabled(struct device *dev,  uint8_t *enabled)
> >> +{
> >> +	struct rc5t619_rtc *rtc = dev_get_drvdata(dev);
> >> +	int err;
> >> +	unsigned int reg_data;
> >> +
> >> +	err = regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1, &reg_data);
> >> +	if (err) {
> >> +		dev_err(dev, "read RTC_CTRL1 error %d\n", err);
> >> +		*enabled = 0;
> > 
> > Is it necessary to set enabled here?
> 
> Well, in case of error it is probably more safe to assume it is *not* enabled
> that keeping the random value passed by the caller of this function.
> 

I would certainly hope that the caller is smart enough to not use a
value when the function calling it returns an error. This has to be
removed, it is useless.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

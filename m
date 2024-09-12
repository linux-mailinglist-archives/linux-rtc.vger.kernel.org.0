Return-Path: <linux-rtc+bounces-1954-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99C97645D
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 10:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ED701C238E2
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 08:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BE7191F7C;
	Thu, 12 Sep 2024 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IDwF6+Ex"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186D1917E8;
	Thu, 12 Sep 2024 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129288; cv=none; b=oYDm8l1WbfEoASrUOOtmEzAWTWv8pyNFWK2x05lDfo2mZIciyrircoCUqReyJzjxew1dipZumFdapGF5+9zHgpzCY6SFINRaD8S4K71wwSKmaBDq69TBdQvrqFwQVVGEbvgwJFOJfhhF4xSjTSHDkHgNTyomke7VLmYOPUUHZPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129288; c=relaxed/simple;
	bh=7R4e3nnIXpLRZ8k/IYYqykk4SdReC+fkYDBpv+JBQVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBa5WAamtC5g68ovRqF0qfMzWscwXQHJRYa6CHUq4eDlSgQNYIcmB15RDh+iAekWn6Pr8VyfMrcWXQxq5nYwIoAVSqF72OT5JwcdsN9cDTX83GOx8zD1SKq+SgkD4hU5PJhe8/pPtNsyFovhkwg5rDvnoayO06LZP46+5J2SedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IDwF6+Ex; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11D9BE0002;
	Thu, 12 Sep 2024 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726129284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSphxjECBCoInb+jgBYfvCmHBRhwkizrGcHNSqeJrKA=;
	b=IDwF6+ExsFRWJL10EYmhOfEi9p1j0hRMB7Q4+ybs5nw3aErdsqYS9MK/S6htW5I5m14b+w
	pcvgGKRWwyatC7qcZatZSHJcVHar6hiwpg/XUDOiVnZdYm9DUGx1b9bnCLMFH2g5e8QyOZ
	tJaTSfUlntX+g5rC9UdrKhgn3uhZf7jc8PcvST9X+wW5NKLCGCRZX9VXq+edTnrmS+oji1
	eqXWdtyd7AE0luf/XI33dt5rDO7KjWUcy1h5qj36rsP92QuugKDw4Ht97wJ74KZEquBYyT
	0qg8YVpDghwvdbxik4YhW//hUtpABXrADV2o/TQfdiGZgEW0LcrRu4nUXtAwDw==
Date: Thu, 12 Sep 2024 10:21:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: isl12022: Add alarm support
Message-ID: <20240912082123f10c07cf@mail.local>
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
 <20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
 <202409101939448128973d@mail.local>
 <87mske7gaw.fsf@geanix.com>
 <20240911122417388bd35c@mail.local>
 <87h6almjpn.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6almjpn.fsf@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/09/2024 09:09:40+0200, Esben Haabendal wrote:
> Alexandre Belloni <alexandre.belloni@bootlin.com> writes:
> 
> > On 11/09/2024 10:20:07+0200, Esben Haabendal wrote:
> >> Alexandre Belloni <alexandre.belloni@bootlin.com> writes:
> >> > On 10/09/2024 12:27:11+0200, Esben Haabendal wrote:
> >> 
> >> >> +static int isl12022_rtc_read_alarm(struct device *dev,
> >> >> +				   struct rtc_wkalrm *alarm)
> >> >> +{
> >> >> +	struct rtc_time *const tm = &alarm->time;
> >> >> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
> >> >> +	struct regmap *regmap = isl12022->regmap;
> >> >> +	uint8_t buf[ISL12022_ALARM_SECTION_LEN];
> >> >> +	int ret, yr, i;
> >> >> +
> >> >> +	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
> >> >> +			       buf, sizeof(buf));
> >> >> +	if (ret) {
> >> >> +		dev_err(dev, "%s: reading ALARM registers failed\n",
> >> >> +			__func__);
> >> >
> >> > I don't really like those error messages because there is nothing the
> >> > user can actually do apart from trying again and this bloats the
> >> > kernel.
> >> 
> >> Ok. Maybe keep it as dev_dbg() then?
> >
> > This is fine, there are other I didn't point out.
> 
> Ok. I will change all of these type of error messages to dev_dbg. No problem.
> 
> >> >> +	isl12022->rtc = rtc;
> >> >>  
> >> >>  	rtc->ops = &isl12022_rtc_ops;
> >> >>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> >> >>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
> >> >>  
> >> >> +	if (client->irq > 0) {
> >> >> +		ret = isl12022_setup_irq(isl12022, client->irq);
> >> >
> >> > You can't do this in probe, the RTC lifecycle is longer than the linux
> >> > system. Or said differently: "oh no, my linux has rebooted and now I
> >> > lost my future alarm" ;)
> >> 
> >> Oh.
> >> 
> >> We do need to setup the irq here, so I assume you mean I need to drop
> >> the part of _setup_irq() that clears alarm registers.
> >
> > Yes, this is the main problematic part. The other one being disabling
> > the IRQ output when in battery backup mode as this will surely prevent
> > wakeup of some devices.
> 
> I know. I did this on purpose, as I don't have a setup where I can test
> wakeup, so I thought it was better to start out without this instead of
> shipping something that is most likely broken.
> 
> If I leave IRQ output from RTC chip enabled during battery backup mode,
> I assume I have to add working suspend/resume also. Or do you just want
> me to flip the bit?

The issue is still about the lifecycle. The RTC will remember the
setting so if you change it from the default value without providing a
control, there is no way to change back the driver behavior in the
future because this is going to break a use case and there is no way to
win. So my preference is that you leave the bit to its default value.
You don't necessarily need the suspend/resume callbacks.

> 
> >> And I guess we need to enable irq in probe as well. At least if/when an
> >> alarm is set. I think it should be safe to enable irq unconditionally in
> >> _probe()...
> >
> > I guess you mean requesting the interrupt on the SoC side.
> 
> Yes.
> 
> > Enabling the RTC interrupt should be left untouched in the probe.
> 
> Ok, so if/when an alarm is already set before probe, do application need
> to enable it using RTC_AIE_ON?

If the alarm is on on boot, it must be kept on without any user
intervention.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


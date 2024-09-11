Return-Path: <linux-rtc+bounces-1937-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 974419751F6
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 14:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56DB4286238
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 12:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B565187FE3;
	Wed, 11 Sep 2024 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J9ydOwuf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE6E176ADE;
	Wed, 11 Sep 2024 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057462; cv=none; b=DtUKJa+p1+1BkRAegGPLqedXbCGJrkZ4oGDDrR24vgMUI3HoWK2TsrusSU0Pjp8yT/2hLk73e3t+bWTREnwYbaj9STdyn5owGPxyWhTF1/gOhqCK2hqnG89E6nkvglbTBFRlP1fV8krKFi3emdAO6vdL5uIcD+uDitUFlgjY11Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057462; c=relaxed/simple;
	bh=vykp/COQSuC0iRIyod7tMW/tf1kgydXeoxCSGp8qusg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb+Jdx+J5MwHNM3QwUzxGXmZGue0l5gT9VCBklJXIZghl2iEr6UQW4RWZxdAM8xx/DbJ6gpDusn6m1iXlBg01AU5WeNUbnh4ezqid1GFevIg6RgsPieS09QYu3NaOMSiF0YlPIaln2BwFu+mejaoNYlFPF0VriUY7gi92YtR8Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J9ydOwuf; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 261BE20008;
	Wed, 11 Sep 2024 12:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726057458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hToyTi8tUgnygES2FIa6FjNWyHF6eOXU9sPatFP3iwI=;
	b=J9ydOwufTsH1adx9Ap49i5Fk3qfM/2wtdaqUMMupoYiEu4ah7MkyLDR3yMC9Mhe09K5kCa
	PMYOOoljX35onCXuu0n/NYkTcGjrbJ7aCQ+TQIpfCK0KXujWVEbUvMfI2kiA+g+TMiOrho
	IzEd6RGY348ZcnWb0qliSXt1yJk8CQwwgba/C6vsn7sGGIEuOkv4WaHaHCzZNBRjSYVcOU
	gZeBHi7M5TG5gW+jz8moGR9VZxh+wy66V2WkwQz3HYkiE1u12lQucnTUnYiqbhFdXWL+HV
	40GVF6xRhgAI/aZ1ccEUOhy7uZu3m55fniOUMhj4elZdfs9g+oRq1tZ0q49MdQ==
Date: Wed, 11 Sep 2024 14:24:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: isl12022: Add alarm support
Message-ID: <20240911122417388bd35c@mail.local>
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
 <20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
 <202409101939448128973d@mail.local>
 <87mske7gaw.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mske7gaw.fsf@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/09/2024 10:20:07+0200, Esben Haabendal wrote:
> Alexandre Belloni <alexandre.belloni@bootlin.com> writes:
> 
> > Hello Esben,
> >
> > On 10/09/2024 12:27:11+0200, Esben Haabendal wrote:
> >> The ISL12022 RTC has a combined INT/fOUT pin, which can be used for alarm
> >> interrupt when frequency output is not enabled.
> >> 
> >> The device-tree bindings should ensure that interrupt and clock output is
> >> not enabled at the same time.
> >
> > Ideally, we would get a pinmuxing part in the driver to ensure this ;)
> 
> I hope we can leave this as future work :)

Sure.

> 
> >> +static int isl12022_rtc_read_alarm(struct device *dev,
> >> +				   struct rtc_wkalrm *alarm)
> >> +{
> >> +	struct rtc_time *const tm = &alarm->time;
> >> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
> >> +	struct regmap *regmap = isl12022->regmap;
> >> +	uint8_t buf[ISL12022_ALARM_SECTION_LEN];
> >> +	int ret, yr, i;
> >> +
> >> +	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
> >> +			       buf, sizeof(buf));
> >> +	if (ret) {
> >> +		dev_err(dev, "%s: reading ALARM registers failed\n",
> >> +			__func__);
> >
> > I don't really like those error messages because there is nothing the
> > user can actually do apart from trying again and this bloats the
> > kernel.
> 
> Ok. Maybe keep it as dev_dbg() then?

This is fine, there are other I didn't point out.

> >
> >> +	/* The alarm doesn't store the year so get it from the rtc section */
> >> +	ret = regmap_read(regmap, ISL12022_REG_YR, &yr);
> >> +	if (ret) {
> >> +		dev_err(dev, "%s: reading YR register failed\n", __func__);
> >
> > Ditto
> 
> Ditto.
> 
> >> +	isl12022->rtc = rtc;
> >>  
> >>  	rtc->ops = &isl12022_rtc_ops;
> >>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> >>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
> >>  
> >> +	if (client->irq > 0) {
> >> +		ret = isl12022_setup_irq(isl12022, client->irq);
> >
> > You can't do this in probe, the RTC lifecycle is longer than the linux
> > system. Or said differently: "oh no, my linux has rebooted and now I
> > lost my future alarm" ;)
> 
> Oh.
> 
> We do need to setup the irq here, so I assume you mean I need to drop
> the part of _setup_irq() that clears alarm registers.

Yes, this is the main problematic part. The other one being disabling
the IRQ output when in battery backup mode as this will surely prevent
wakeup of some devices.

> 
> And I guess we need to enable irq in probe as well. At least if/when an
> alarm is set. I think it should be safe to enable irq unconditionally in
> _probe()...

I guess you mean requesting the interrupt on the SoC side. Enabling the
RTC interrupt should be left untouched in the probe.


> 
> >> +		if (ret)
> >> +			return ret;
> >> +	} else {
> >> +		clear_bit(RTC_FEATURE_ALARM, rtc->features);
> >> +	}
> >> +
> >>  	return devm_rtc_register_device(rtc);
> >>  }
> 
> /Esben

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


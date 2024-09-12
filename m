Return-Path: <linux-rtc+bounces-1955-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB1976517
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 10:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6B351C22F67
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 08:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8608C192597;
	Thu, 12 Sep 2024 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="kaG2bL3N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF31018C929;
	Thu, 12 Sep 2024 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726131593; cv=none; b=tuJN7d3O/cE5Bq3h1lwA1VfKXuBeNAz06ziyzBqkyISHS8DfsuLquYBC12blJgAxqBtcK6bt+oIJwJrhatYJn7Vu1VMz9Zk7TnXNjEShzWFpnB/x42XDX/8bI7ovYuR7p6KIAi3lmh3cazOKnUjfxX8xBwfvGmYV5F+MAeJo060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726131593; c=relaxed/simple;
	bh=fl97/sOEUsJQ8VZACP02Z/hvc/HcTprmyXWjBuIpABg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BWN+Gw8RUHWeBvkVFKGEvWQh7BWv1YC0RpEONu+F2/lQfcH54FajuLwAQcmk6HAaVNzMLDKyo2ISV/9LDabTpmBJmbj4TYiEbwBX4rMu0V/9+pbBpv5+Bx/KVh3Elb7UO7tOiFPIv6yBaBpajR3VLXWK29esreW8V4RJkm5gmdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=kaG2bL3N; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0LohmCEwjhv/ynQc5/yZjldMZKR+MEom6qwc4qG3GZE=; b=kaG2bL3NXdQmJ+T81qt9zMcG7v
	bEtj2rhuxVZVR6j/sgPeyhkgxZ0VOu+G7LaO40Wlh+97VCS0mC0pJAKG67BvcaowJo+F64IgkAOfO
	RDCK3qxjeV/cv8pduxnOAwAcMBbyiiEEco5+D7ItVSBrZersIje+80Dbd8LfeTsfVVMhOmbfHx5Vu
	dK23tDMt81OPH4hfLka4iPKcHfjHTH85bfIDkEHU2hPn2B1p/1nGIaZCmglVMbqLB20KOM3NIc8GZ
	iVLbkk0833ETtus0y1TwTP4Vi5jVc4JARiIH/luWlpIJQ4Tbz4xeOgSRTx7dCgM8RDCnSusqVpVOj
	263LPYrw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1soffy-000EaL-0b; Thu, 12 Sep 2024 10:59:42 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1soffy-0004eF-1A;
	Thu, 12 Sep 2024 10:59:41 +0200
From: Esben Haabendal <esben@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,  linux-rtc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: isl12022: Add alarm support
In-Reply-To: <20240912082123f10c07cf@mail.local> (Alexandre Belloni's message
	of "Thu, 12 Sep 2024 10:21:23 +0200")
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
	<20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
	<202409101939448128973d@mail.local> <87mske7gaw.fsf@geanix.com>
	<20240911122417388bd35c@mail.local> <87h6almjpn.fsf@geanix.com>
	<20240912082123f10c07cf@mail.local>
Date: Thu, 12 Sep 2024 10:59:41 +0200
Message-ID: <878qvxmema.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27395/Wed Sep 11 10:32:20 2024)

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> On 12/09/2024 09:09:40+0200, Esben Haabendal wrote:
>> Alexandre Belloni <alexandre.belloni@bootlin.com> writes:
>> 
>> > On 11/09/2024 10:20:07+0200, Esben Haabendal wrote:
>> >> Alexandre Belloni <alexandre.belloni@bootlin.com> writes:
>> >> > On 10/09/2024 12:27:11+0200, Esben Haabendal wrote:
>> >> 
>> >> >> +static int isl12022_rtc_read_alarm(struct device *dev,
>> >> >> +				   struct rtc_wkalrm *alarm)
>> >> >> +{
>> >> >> +	struct rtc_time *const tm = &alarm->time;
>> >> >> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
>> >> >> +	struct regmap *regmap = isl12022->regmap;
>> >> >> +	uint8_t buf[ISL12022_ALARM_SECTION_LEN];
>> >> >> +	int ret, yr, i;
>> >> >> +
>> >> >> +	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
>> >> >> +			       buf, sizeof(buf));
>> >> >> +	if (ret) {
>> >> >> +		dev_err(dev, "%s: reading ALARM registers failed\n",
>> >> >> +			__func__);
>> >> >
>> >> > I don't really like those error messages because there is nothing the
>> >> > user can actually do apart from trying again and this bloats the
>> >> > kernel.
>> >> 
>> >> Ok. Maybe keep it as dev_dbg() then?
>> >
>> > This is fine, there are other I didn't point out.
>> 
>> Ok. I will change all of these type of error messages to dev_dbg. No problem.
>> 
>> >> >> +	isl12022->rtc = rtc;
>> >> >>  
>> >> >>  	rtc->ops = &isl12022_rtc_ops;
>> >> >>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>> >> >>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
>> >> >>  
>> >> >> +	if (client->irq > 0) {
>> >> >> +		ret = isl12022_setup_irq(isl12022, client->irq);
>> >> >
>> >> > You can't do this in probe, the RTC lifecycle is longer than the linux
>> >> > system. Or said differently: "oh no, my linux has rebooted and now I
>> >> > lost my future alarm" ;)
>> >> 
>> >> Oh.
>> >> 
>> >> We do need to setup the irq here, so I assume you mean I need to drop
>> >> the part of _setup_irq() that clears alarm registers.
>> >
>> > Yes, this is the main problematic part. The other one being disabling
>> > the IRQ output when in battery backup mode as this will surely prevent
>> > wakeup of some devices.
>> 
>> I know. I did this on purpose, as I don't have a setup where I can test
>> wakeup, so I thought it was better to start out without this instead of
>> shipping something that is most likely broken.
>> 
>> If I leave IRQ output from RTC chip enabled during battery backup mode,
>> I assume I have to add working suspend/resume also. Or do you just want
>> me to flip the bit?
>
> The issue is still about the lifecycle. The RTC will remember the
> setting so if you change it from the default value without providing a
> control, there is no way to change back the driver behavior in the
> future because this is going to break a use case and there is no way to
> win. So my preference is that you leave the bit to its default value.

Yes, sounds like the right approach.

But should I actively set FOBATB bit to the default value, or leave it
at its current value (which potentially could be non-default)?

> You don't necessarily need the suspend/resume callbacks.
>
>> >> And I guess we need to enable irq in probe as well. At least if/when an
>> >> alarm is set. I think it should be safe to enable irq unconditionally in
>> >> _probe()...
>> >
>> > I guess you mean requesting the interrupt on the SoC side.
>> 
>> Yes.
>> 
>> > Enabling the RTC interrupt should be left untouched in the probe.
>> 
>> Ok, so if/when an alarm is already set before probe, do application need
>> to enable it using RTC_AIE_ON?
>
> If the alarm is on on boot, it must be kept on without any user
> intervention.

Sure. But do we want to check for an active alarm, and then call
enable_irq() if there is one? If not, the alarm would assert the
interrupt line, but the irq might not be raised as the handler is
disabled.

/Esben


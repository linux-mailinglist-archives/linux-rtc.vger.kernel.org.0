Return-Path: <linux-rtc+bounces-1331-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52C90A701
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 09:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D01591C2179D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 07:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF6118FDAD;
	Mon, 17 Jun 2024 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H7CheRsI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7724E18FC87;
	Mon, 17 Jun 2024 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609164; cv=none; b=Fea8i5cOBLuI/v6fB9zHcuHtlOLXYpHonWewbHK9y9/G0tEOxNtU4jQD3j9MQ7BzJZMPd0FXJFg9wJgxZL+Ce8+yJotn2JMMYYXxJdHcG6oXlYj+UxXcEsS1ORjj//A2o21/jWAMoc+cKu7+r2+qFB5Q3RzLcu3ifbklIdDdhkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609164; c=relaxed/simple;
	bh=i6NAFodh155HxgDBdsWn0alGhHpUg5koWMcFe9WmJO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDYzmeBwlN5srmad3wuMK2+D25WbJVVH21lZUsl1gNNQlFVHr18vIamDrADiSphq8q7wcLM873mg7cMn6UBsjoYFy0lCgikGryBSgFld0kWGsTg0CAx3L9ffnMUeK3qpUlkX4SoUwZnj635RBfJpcWkRds4TtzNJdQhInke/Ewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H7CheRsI; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 196A51C0005;
	Mon, 17 Jun 2024 07:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718609153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSd7U9I5o9yX7iVBpTAQ36n54Po1dEsuSVr47xJjN/8=;
	b=H7CheRsIqsyTag/HRZuce2JzgPV1thWsTJW24N0t5hr/38A36dolPIH+50mWsWBU5FP4A0
	MqrRONanAeQsH4XxplHVid6JXPRYTVhjUF2tHfWE97A/80aje5QYmXKytuEnlFzhzQFhv4
	HrVhdWYuL/H/qNwpG1CLoBFgTdQXq1blmbNZEvrFNnkF7mr6om3EP9onII3yg1vVHdVKwn
	4xlj4EUQL1YpT//oCGsADw3JBj1mY224nfz3MqVIbV4IfY8sLV+Z3vVTRai61ntJ8ud14R
	lQKRFBUsRwCLv7qf20Y3E2E6SbF14QsmOFw7x9ITHjBtlJDxW61kWIneKwKA+w==
Date: Mon, 17 Jun 2024 09:25:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Message-ID: <20240617072551acf731aa@mail.local>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-7-claudiu.beznea.uj@bp.renesas.com>
 <2024061409215756e6a10c@mail.local>
 <4a477079-b4a6-4861-ae24-b3b87adb8ecd@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a477079-b4a6-4861-ae24-b3b87adb8ecd@tuxon.dev>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 14/06/2024 14:06:38+0300, claudiu beznea wrote:
> >> +	/*
> >> +	 * Stop the RTC and set to 12 hours mode and calendar count mode.
> >> +	 * RCR2.START initial value is undefined so we need to stop here
> >> +	 * all the time.
> >> +	 */
> > 
> > Certainly not, if you stop the RTC on probe, you lose the time
> > information, this must only be done when the RTC has never been
> > initialised. The whole goal of the RTC is the keep time across reboots,
> > its lifecycle is longer than the system.
> 
> This was also my first thought when I read the HW manual.
> 
> It has been done like this to follow the HW manual. According to HW manual
> [1], chapter 22.3.19 RTC Control Register 2 (RCR2), initial value of START
> bit is undefined.
> 
> If it's 1 while probing but it has never been initialized, we can falsely
> detect that RTC is started and skip the rest of the initialization steps.
> W/o initialization configuration, the RTC will not be able to work.
> 
> Even with this implementation we don't loose the time b/w reboots. Here is
> the output on my board [2]. The steps I did were the following:
> 1/ remove the power to the board (I don't have a battery for RTC installed
>    at the moment)
> 2/ boot the board and issue hwclock -w
> 3/ reboot
> 4/ check the systime and rtc time
> 5/ poweroff
> 6/ poweron
> 7/ boot and check systime and RTC time
> 
> As you can see the time is not lost but continue to increment. I presume
> the hardware takes into account that time needs to increment when initial
> configuration is executed.

I don't think so, I guess it stops ticking but the registers are not
reset so when ts starts ticking again, you are not too far from the time
that it should report.

> 
> [1]
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11-ghz-cpu-and-dual-core-cortex-m33-250
> [2] https://p.fr33tux.org/585cd6
> 
> > 
> > Also, why do you insist on 12H-mode? The proper thing to do is to support
> > 12H-mode on read but always use 24H-mode when setting the time.
> 
> OK, I wasn't aware of this. I think I followed this approach as it looked
> to me the number of operation to update the hardware registers was lower
> for 12h mode.

How come, using 12H-mode implies testing for the AM/PM bit and doing and
addition while 24H-mode would simply be a read?

> >> +	priv->rtc_dev->ops = &rtca3_ops;
> >> +	priv->rtc_dev->max_user_freq = 256;
> >> +	priv->rtc_dev->range_min = mktime64(1999, 1, 1, 0, 0, 0);
> >> +	priv->rtc_dev->range_max = mktime64(2098, 12, 31, 23, 59, 59);
> > 
> > This very much looks like the range should be 2000 to 2099, why do you
> > want to shift it?
> 
> 2000-2099 was my first option for this but then I saw one of your old
> commits on this topic and, since I'm not very familiar with RTC,
> I took it as example. I'll adjust as you proposed.
> 
> commit beee05dfbead
> Author: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Date:   Wed Mar 20 12:30:10 2019 +0100
> 
>     rtc: sh: set range
> 
>     The SH RTC is a BCD RTC with some version having 4 digits for the year.
> 
>     The range for the RTCs with only 2 digits for the year was unfortunately
>     shifted to handle 1999 to 2098.
> 
>     Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>     Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

This is because the sh driver predated the introduction of the range and
was already shifting it.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


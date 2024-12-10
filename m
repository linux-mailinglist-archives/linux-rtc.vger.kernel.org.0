Return-Path: <linux-rtc+bounces-2701-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 792169EBF06
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 00:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7BBC284733
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2024 23:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2742080F6;
	Tue, 10 Dec 2024 23:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gyKWVwnq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A7E1F1909;
	Tue, 10 Dec 2024 23:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733872083; cv=none; b=e6O3+dKxAiB7lpZY9jLRf2ZhNIaExIdM5nMiVjwbqU8xR432hWZfr46tjNuKr/gzmYEsZEz3dcUbYKA2MzVJ/slmgnITkcUcjnK7eYHMhgrxa7y3fhj++KWyORVQ2M/5k43gz8n5jTPzi6Pv3tpyALpspbOWHTHa0MC2j7Jx6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733872083; c=relaxed/simple;
	bh=alkkR0hKyGpZ292w4fouPR0zMRMMbb/BnQ+Q8kczXWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODKgkitanC4Hp5MLHYlcsriXsKkiY6cQ7Y6BNCr3s6OvoCgdRUcs2WZqaLmm/oZyZxy96DybaI+79w8Orb53uSpvhB+j67oWdtdzAPReBLR1b7TKJI+ANroJjnUS3NZFb+0HMo3631hOx2Q0wVB5MhGaI+hwSLE161Phcz7qKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gyKWVwnq; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB0BBFF803;
	Tue, 10 Dec 2024 23:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733872071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HGTyWKeaqpgaFreUyKa0aH25Hi/v3Cj4vXEIXprtCFM=;
	b=gyKWVwnqKbRaoX0upPim472Cpbmf2O0rHbDzM6EEVlW6qRq09fDeahyI2JK9aEVEemo4qI
	YpXLLX8VNmRi2FuNePdwVEh20d0ny8Qq5a4FbwoYbvsTTHnQBfNtJU6JKkw+htK5WKnwGy
	aAUhxtvhr+jiEy4ureB4zI0q22gO3+JNOYwBpr1terhGligsQsOf6fux/uXpdmjz0eUB3t
	2txE31+sOI88Lf+CdpOHlg090HvBw6WMZ0c3khuwU/YwkPkg6dkk9ryKb+GYGHyg8sNnvC
	glbT104wfrUFsSiqBj4Nu6bOiXHncN9+6YA7xeIQR+xPN4wDo/hNFaam3QbhQg==
Date: Wed, 11 Dec 2024 00:07:50 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <20241210230750dc03a1d5@mail.local>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
 <2005af5d-bdb7-4675-8f0e-82cb817801af@app.fastmail.com>
 <6f4a0be8-4def-4066-9b44-d43059b7a90d@oss.nxp.com>
 <94cba886-86cb-41f1-96ee-501623add7db@app.fastmail.com>
 <42d39f8e-0b59-4185-af1f-f778522608d2@oss.nxp.com>
 <fc50d8a7-cc59-42dd-aafd-7da49fadee45@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc50d8a7-cc59-42dd-aafd-7da49fadee45@app.fastmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 10/12/2024 09:22:51+0100, Arnd Bergmann wrote:
> On Mon, Dec 9, 2024, at 18:17, Ciprian Marian Costea wrote:
> > On 12/6/2024 2:41 PM, Arnd Bergmann wrote:
> 
> >> I think storing 'rtc_hz' as a u32 variable and adding a range
> >> check when filling it would help, mainly to save the next reader
> >> from having to understand what is going on.
> >> 
> >
> > The confusion on my end is that I cannot see where 'div_u64() implicitly 
> > casts the dividend 'hz' from 64-bit to 32-bit' by following the method's 
> > implementation [1]
> 
> I mean passing a 64-bit variable into a function that takes a
> 32-bit argument truncates the range.
> 
> > But I agree that 'rtc_hz' can be stored into a 32-bit variable with a 
> > range check added when it is taken from the Linux clock API to avoid any
> > unneeded abstractions.
> 
> ok
> 
> >> 
> >> This is the same as just removing the error handling and
> >> relying on unsigned integer overflow semantics.
> >> 
> >> The usual check we do in time_before()/time_after instead
> >> checks if the elapsed time is less than half the available
> >> range:
> >> 
> >> #define time_after(a,b)         \
> >>          (typecheck(unsigned long, a) && \
> >>           typecheck(unsigned long, b) && \
> >>           ((long)((b) - (a)) < 0))
> >> 
> >
> > Ok. Thanks for the suggestion. I will look into using 
> > 'time_before()/time_after()' API instead of directly checking via 
> > comparison operators.
> 
> To be clear: you can't directly use time_before() here because
> that takes an 'unsigned long' argument, so you want the
> same logic, but for u32 values. I have not found an existing
> helper for that, but it's possible I missed it.
> 
> >> Who sets that alarm though? Are you relying on custom userspace
> >> for this, or is that something that the kernel already does
> >> that I'm missing?
> >
> > The test usage is via 'rtcwake' [2] userspace tool.
> > I've detailed a bit the testing scenario in the cover letter for this 
> > patchset [3]:
> >
> > "
> > Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
> > using userspace tools such as rtcwake:
> > # rtcwake -s 2 -m mem
> > # rtcwake: assuming RTC uses UTC ...
> > # rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
> 
> Got it. I feel this also needs either some documentation in
> the source code, or some infrastructure in the rtc layer if
> this is a common problem in other drivers as well. If there
> is a maximum time that the system can be suspended for without
> a wakeup, why not just set an earlier wakeup in the kernel
> when you have all the information for it?
> 
> Or maybe this should not actually be an 'rtc' driver at all?
> In the old days, we used drivers like
> arch/arm/mach-omap1/timer32k.c to register a handler
> for read_persistent_clock64(), which completely bypasses
> the RTC layer and provides both automatic wakeup and more
> accurate accounting of sleep time. 
> 
> Another example was the tegra clocksource driver, which used
> to use read_persistent_clock64() but changed to being
> a CLOCK_SOURCE_SUSPEND_NONSTOP source in 95170f0708f2
> ("clocksource/drivers/tegra: Rework for compensation of
> suspend time"). The same seems true for timer-ti-32k.c and
> timer-sprd.c.
> 
> Alexandre, Daniel, any recommendations here?
>

We have a few driver for timers that are not actual RTCs but need the
common alarm and wakeup API so they can use alarmtimers for example.
The limitation is not super common as RTCs will generally have the same
range support for alarm as what they have for time and date.

However, I'm still super confused by how complex this driver is. There
are only 3 interesting registers in this IP, one of those being read
only...

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


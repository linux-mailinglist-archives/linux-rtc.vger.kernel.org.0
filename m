Return-Path: <linux-rtc+bounces-4645-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AEAB1BC7E
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Aug 2025 00:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE856188539F
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Aug 2025 22:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1196725A343;
	Tue,  5 Aug 2025 22:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S4TKYGXU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A1035959;
	Tue,  5 Aug 2025 22:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754432684; cv=none; b=n5CxTDn73iRXZh0kplNyKLVcihItZ3QQNDdfsBLyoDzIC0mX7SRr+QNkkGXMyz0EhK1oDWQ5PWNa9svph0OHQ13hPNrxFSXYwFobZ9kxy7iNKczVkqIdzbGlAC9yHdiZUkG4bP7EjPnLE8YN6kVdx2LTHl9Nnus2EYCEUDKrr74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754432684; c=relaxed/simple;
	bh=QfnuAfSIncG5cDGs2WQXDDBy6I3DO7Z42sfD8D0DoVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD3emyAZHSzTkLywc7/7eP1RIol5BtiV0kRWclcs+FsTh+1zGQpf0yqK87ZhwHpZLyuUk3j5PZ3V/CF6efTPCnxy6m0J3bTWT4Pu1YlTQsfCYISgdcoNX8956Z5q3bLRNVG0H/cf+y8g7nrcIVyRH2h/e9OGzawFLYIIipcmSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S4TKYGXU; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9955942E80;
	Tue,  5 Aug 2025 22:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754432679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odN3U5wUIKDj5D9hqrCcLp+EmyeB4OlgDk3ZQxZOpZg=;
	b=S4TKYGXUfH31hW2weWUZO71JDvk6rqhsZQxcPW8T5sNn+sod7h7caFPj0PJ2+yKvfOsCWK
	WVefcWIJG8YSSUhhFPPRY5Em6TeJl2qSc8t/CNjCoPksDBxlSDd2sBM3KjeveNTUiKxpZb
	M/rnmaMWe730LXhWhTOAYb9avHWHAVN5YotelgrhriW5aZe8O4Wab0Cf+1k/WDAHFPL+v9
	+7Q0EHtJrzIUsCxkjb48Bx23sE0sFj1LzN9mNq6FlhBqqeAl12Z+XVvb0e30wShpF6OdXt
	8icQt4CTOKKhp2Xx1EP7zbQLO0lpeots2Oq2s1TNQDNmeeOBI+u82XrkwAGCrQ==
Date: Wed, 6 Aug 2025 00:24:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: michal.simek@amd.com, srinivas.neeli@xilinx.com,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ivan Vera <ivan.vera@enclustra.com>
Subject: Re: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
Message-ID: <202508052224366c9bb920@mail.local>
References: <20250804154750.28249-1-l.rubusch@gmail.com>
 <20250804154750.28249-2-l.rubusch@gmail.com>
 <20250804213213d4844d4e@mail.local>
 <CAFXKEHZn0XQMe6RBHDJzcGZy+JPpNpfidD1mT2MBmZ_WamFQKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFXKEHZn0XQMe6RBHDJzcGZy+JPpNpfidD1mT2MBmZ_WamFQKQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudeifeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgheeuieeikefhgfdvhfehiedvhffgjeetfffgtefhudfgtefffeevledtleejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepgeehrdduuddrieekrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeehrdduuddrieekrdduudegpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheplhdrrhhusghushgthhesghhmrghilhdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehsrhhinhhivhgrshdrnhgvvghlihesgihilhhinhigrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehivhgrnhdrvhgvrhgrsegvnhgtlhhushhtrhgrrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On 05/08/2025 23:56:46+0200, Lothar Rubusch wrote:
> On Mon, Aug 4, 2025 at 11:32 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 04/08/2025 15:47:50+0000, Lothar Rubusch wrote:
> > > From: Ivan Vera <ivan.vera@enclustra.com>
> (...)
> > > diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > > index f39102b66eac..0c063c3fae52 100644
> > > --- a/drivers/rtc/rtc-zynqmp.c
> > > +++ b/drivers/rtc/rtc-zynqmp.c
> > > @@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
> > >               if (ret)
> > >                       xrtcdev->freq = RTC_CALIB_DEF;
> > >       }
> > > -     ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
> > > -     if (!ret)
> > > -             writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
> > > +
> > > +     /* Enable unconditional re-calibration to RTC_CALIB_DEF or DTB entry. */
> > > +     writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);
> >
> > Doesn't this forcefully overwrite the proper value that has been set
> > from userspace and so trashes the time at each reboot?
> >
> Yes, it overwrites the calibration, i.e. counting 1sec in about 1sec.
> No, the time/date is not actually "trashed" (I double-checked that
> with timesyncd disabled, having and not having register content and
> over several reboots keeping a bogus date/time - it psersistet in the
> same time space. The current patch always overwrites the calib
> register content. So, a manual userspace setting will be lost after
> reboot. That's true.

It is about 1sec on your platform because it didn't deviate too much
from the expected value but what if another platform needs a way
different value? Then you are introducing the same issue as the one you
are trying to fix but it will have it at each reboot.

> 
> Would it rather make sense to extend it, say, instead of merely
> checking whether the calibration register contains any data - which
> could potentially be incorrect - also check for the presence of a
> calibration property in the devicetree (or a similar property, since
> 'calibration' may be deprecated)? If such a property exists, perform a
> re-calibration based on the devicetree at every reboot. Otherwise,
> retain the current behavior of checking whether the register is empty?
> 
> > Isn't the proper way to reset it to simply set the offset from userspace
> > again?
> >
> Hm.. I'm unsure if I understood you correctly. You mean the way as
> described in AMD's link to perform the reset by executing the devmem
> from Linux manually? If so, why is it preferable to adjust the RTC
> calibration manually every time this happens, rather than to simply
> put a correction value into the devicetree properties for problematic
> setups? Or do I miss something, is there a config file for RTC
> calibration for doing this persistently from Linux, that I'm not aware
> of?
> 
> Before, the devicetree properties seemed to have generally priority
> over userspace settings. Now, after the calibration rework, this
> priorization seems to have changed and a devicetree calib correction
> for such problematic cases will generally be ignored, with a
> recommendation by Xilinx/AMD (see link in cover letter) to execute a
> devmem command from off Linux (...). I mean, can't this be elaborated
> a bit more to allow for a persistent correction method?

The value depends on each manufactured machine/board as it is supposed
to correct for imprecision on the input clock which is either a crystal
or derived from a crystal. This crystal may be more or less accurate and
its accuracy will change over time notably because of temperature
changes or simply because it is aging. Having the value in the device
tree is as good as having it hardcoded in the driver which is not far
from what your are doing here. It makes the feature useless.

What I was suggesting is simply to do the right thing, compute the
inaccuracy and correct it from userspace, using the proper interface
that is sysfs or the RTC_PARAM_SET ioctl for RTC_PARAM_CORRECTION
This has to be done regularly anyway so I guess it would catch and
correct any corrupted value in the register.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


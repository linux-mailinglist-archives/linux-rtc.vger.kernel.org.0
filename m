Return-Path: <linux-rtc+bounces-1975-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7224977B73
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 10:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E6DF1C20506
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 08:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A5A1D79AC;
	Fri, 13 Sep 2024 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="FNyESimX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A71D798C
	for <linux-rtc@vger.kernel.org>; Fri, 13 Sep 2024 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726217062; cv=none; b=l14OtwMGBxhzZ3iuUbMAajeV+/PyzL9EzH4w97ck4Y7bdYVEnsIuiQiroT3nSy2jB3U6+sEVKW4EffPNzC170NBVqlKcxjZSO2PPSzETNOmhs7MSAyPFuqCvlx9wLCgvffeTHa0GOnWBzamkJaPcx7iZo3mtoVrpFb0H4kV7rEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726217062; c=relaxed/simple;
	bh=6vMCX5k9pSsamUa+/oY5ZaYbyABcfxX/lxd2BCFZkvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHeT0mZcE8bs49rb3mWJ1J2SNR0SYdd0I62jv5EHvKzsKnREt/xMbCS1G4QFLZGdPEMFkGiTCxvzENOHHqnSaxKFYV3Vr0wwQDKr1RHGXH0MtnzESfru+nkS3n6BDmXlon6DhkWg04MF+XKiaxrDK9wRP3OrsdoA5NSkzMdhK2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=FNyESimX; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC1421489724;
	Fri, 13 Sep 2024 10:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1726216740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M5b1ZAJBd/aY3vpwVFGYFfKOHZAXO4sccIKAD1+0BtM=;
	b=FNyESimXmVPUNl0W9nUoajxP2IWyKq2ivfeF1ySXFWhkUHRRoVRiQRI0bKx+1oPIriJKwM
	YunI90o4xWRcPzXTH1aPf6g8WZ8It1vxYvXyuHfMaiTOGdarwz1hd/xl0ijXAs3kbfIDgZ
	PD7J6TIsLsf/wmcaIEqa/w5qNNTCVr/x4b5pHlM0zHFbtYJNWpCGBDPsn3FVKTvhO/UDsc
	MWfMliKzlwMbfXi20cYagOhkXKd51IrV3kBdDjt88JZMDh+WsYgmLmWDovqrvRxK9wzuif
	+fy3/RUJKF7v2XjOL2WSBw1XqNDQVokJSPz2gEzXS5AOBTSHQISTIF6cZMw39w==
Date: Fri, 13 Sep 2024 10:38:54 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexander Dahl <ada@thorsis.com>, linux-rtc@vger.kernel.org
Subject: Re: clkout vs. !int1 on nxp pcf8523
Message-ID: <20240913-percolate-deputy-1475e7f4977b@thorsis.com>
Mail-Followup-To: Alexander Dahl <ada@thorsis.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20240530-tapioca-prominent-0a669c51c37c@thorsis.com>
 <20240911121849310e1b75@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911121849310e1b75@mail.local>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Alexandre,

Am Wed, Sep 11, 2024 at 02:18:49PM +0200 schrieb Alexandre Belloni:
> On 30/05/2024 15:33:11+0200, Alexander Dahl wrote:
> > Hei hei,
> > 
> > my current task is to bring up a new board featuring an at91 sam9x60
> > SoC and a nxp pcf8523 RTC.  The intention is to get a longer time the
> > RTC can run on a capacitor because the external RTC draws less current
> > than the internal RTC of the SoC.
> > 
> > To save boards space and parts the 32768 Hz crystal of the SoC should
> > be removed and the clkout of the external RTC should be used as a slow
> > clock input instead.
> > 
> > This is a somewhat known setup, at least I found other drivers
> > implementing it for certain boards, see commits
> > v5.15-rc1-16-g4c8a7b80d5f3 ("rtc: pcf85063: add support for fixed
> > clock") or v5.13-rc1-2-gf765e349c3e1 ("rtc: m41t80: add support for
> > fixed clock") for reference.
> > 
> > Problem with the pcf8523: it has a shared !INT1 / CLKOUT pin, and you
> > probably can use only either one or the other function.  Default after
> > reset is to have CLKOUT providing 32768 Hz, proved that with an
> > oscilloscope.
> > 
> > The naive way to add support is to just add a node to the dts and
> > cross fingers like this:
> > 
> >     &flx5 {
> >             atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> >             status = "okay";
> >     
> >             i2c5: i2c@600 {
> >                     pinctrl-0 = <&pinctrl_flx5_default>;
> >                     status = "okay";
> >     
> >                     pcf8523: rtc@68 {
> >                             compatible = "nxp,pcf8523";
> >                             reg = <0x68>;
> >                     };
> >             };
> >     };
> > 
> > This actually works, but I suspect this is fragile, because it does
> > not describe the clock I want to use, nor how to handle the irq.
> > 
> > I noticed commit v5.12-rc2-22-g13e37b7fb75d ("rtc: pcf8523: add alarm
> > support") and the commit message somehow suggests clkout is always
> > disabled now?  Well not always, only if some irq was defined in … but
> > where exactly?  In my setup the clkout is not disabled, I confirmed
> > that with a scope.
> > 
> > This is where all kinds of questions rise.  The documentation on rtc
> > and i2c device tree bindings is somewhat sparse.  :-/
> > 
> > From my understanding if I wanted to use the !INT1 pin as an actual
> > interrupt line, I would probably hook it up to either a GPIO of the
> > SoC or some wakeup input of the PMIC.  What else is possible and how
> > would the different ways be expressed in .dts?  I found some .dts and
> > .dtsi files having an 'interrupts' property in the rtc node, but I did
> > not find the place in the code where this gets evaluated.
> > 
> > For clkout it is probably like in
> > arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi and the driver
> > changes would be maybe somewhat similar to the changes done in
> > drivers/rtc/rtc-pcf85063.c right?
> > 
> > Any hints on how to express in dts to _explicitly_ disable use as an
> > interrupt pin and explicitly as fixed clkout?  And what changes to the
> > pcf8523 driver would have to be done, if any?
> 
> I see this email just now. Ideally, we would get a pinmuxing part in the
> RTC driver so the device tree can explicitly describe which function is
> used. Also, as you point out, this also needs a clock driver part so we
> benefit from the CCF for clock enabling and recounting.

Thanks for taking the time to respond.  Meanwhile we conducted some
measurements of the time the RTC can keep its value, aka how long the
capacitor can supply it.  Compared internal RTC to external, and came
to the conclusion the longer support time of the external RTC is still
not long enough for a meaningful usecase.  So we dropped that approach
and use the internal RTC of the microcontroller now.

But as said, thanks for responding, if someone else needs to go that
way, the direction from driver pov is clearer now. :-)

Greets
Alex



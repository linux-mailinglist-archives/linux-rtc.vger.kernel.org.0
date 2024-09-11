Return-Path: <linux-rtc+bounces-1936-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A86D9751D0
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 14:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 227C61F266BC
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1668B192D70;
	Wed, 11 Sep 2024 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eHMcyoB0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C12188A06
	for <linux-rtc@vger.kernel.org>; Wed, 11 Sep 2024 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057134; cv=none; b=mlqQalFAaTD2luB6adHq7NC3Nn19ulhXiKqfp3VjpfoP+CTbVZBfn3yZ51o6ANX1zd2TJylI2EDakmZhbgKslIKfpsS4ZIQeTZLGd5wbJgn76GxmxYYA9W4OEjcMMzoIxVlqvN22siPjXzgN6RHgdNmi3GWmAPKSX4cGNT+p4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057134; c=relaxed/simple;
	bh=dew01WNTtcw8JB3ZhpSvGPNMzQre78QNKiCS7luAPUw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6fGzkm/gfxt2a09VvH9IFvumJLqRAFVmCtvXEelAtIONrylCz9hWvzsyG1XPWl2aGFjhlj/r17GbovU5dZ2GirvD7O8FCS/hUfF/qEgIe0++piP+sc9PmCXbSq8NfM7PRCVt5rkxzu+ttYm/W2p3gEq5653clwfmbg/SaAGlP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eHMcyoB0; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E966120009;
	Wed, 11 Sep 2024 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726057130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Eub1cKZQvHY4DoY8CSC9VN1CNgfqmS54EjZQzTTJ60=;
	b=eHMcyoB0w3O4fyPB5Ge68WXOh9Ciz0PHEugxX33dQWHy3+JR2+cvTKTB9J+poAlcupDgnJ
	CJWcnm7alIoytcjmn+R4lxJEWMITdo1+jwtbTGqo9ms0Q5kG4JsSmsYFbKRXIsS/jrUMZq
	iguhIm7ES0oG31PYa0orLF4fAS0Ze/LCSwDlpB1fIY9mVoEWC3W7A8pyBzj1sJgQrBGPLz
	SE7sZ9Y40bPfUbf0YC7aKRX+WfUcF/fZO2U6XHE2HaCCPtj5ZmKqXENnBskvUdHIct+Exb
	lOw9pT20DgXgDLGUpSEN9LlPNRp5zyymEw9LETyYnCMszmQ/tcEG9sdro17g3g==
Date: Wed, 11 Sep 2024 14:18:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>, linux-rtc@vger.kernel.org
Subject: Re: clkout vs. !int1 on nxp pcf8523
Message-ID: <20240911121849310e1b75@mail.local>
References: <20240530-tapioca-prominent-0a669c51c37c@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530-tapioca-prominent-0a669c51c37c@thorsis.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 30/05/2024 15:33:11+0200, Alexander Dahl wrote:
> Hei hei,
> 
> my current task is to bring up a new board featuring an at91 sam9x60
> SoC and a nxp pcf8523 RTC.  The intention is to get a longer time the
> RTC can run on a capacitor because the external RTC draws less current
> than the internal RTC of the SoC.
> 
> To save boards space and parts the 32768 Hz crystal of the SoC should
> be removed and the clkout of the external RTC should be used as a slow
> clock input instead.
> 
> This is a somewhat known setup, at least I found other drivers
> implementing it for certain boards, see commits
> v5.15-rc1-16-g4c8a7b80d5f3 ("rtc: pcf85063: add support for fixed
> clock") or v5.13-rc1-2-gf765e349c3e1 ("rtc: m41t80: add support for
> fixed clock") for reference.
> 
> Problem with the pcf8523: it has a shared !INT1 / CLKOUT pin, and you
> probably can use only either one or the other function.  Default after
> reset is to have CLKOUT providing 32768 Hz, proved that with an
> oscilloscope.
> 
> The naive way to add support is to just add a node to the dts and
> cross fingers like this:
> 
>     &flx5 {
>             atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
>             status = "okay";
>     
>             i2c5: i2c@600 {
>                     pinctrl-0 = <&pinctrl_flx5_default>;
>                     status = "okay";
>     
>                     pcf8523: rtc@68 {
>                             compatible = "nxp,pcf8523";
>                             reg = <0x68>;
>                     };
>             };
>     };
> 
> This actually works, but I suspect this is fragile, because it does
> not describe the clock I want to use, nor how to handle the irq.
> 
> I noticed commit v5.12-rc2-22-g13e37b7fb75d ("rtc: pcf8523: add alarm
> support") and the commit message somehow suggests clkout is always
> disabled now?  Well not always, only if some irq was defined in … but
> where exactly?  In my setup the clkout is not disabled, I confirmed
> that with a scope.
> 
> This is where all kinds of questions rise.  The documentation on rtc
> and i2c device tree bindings is somewhat sparse.  :-/
> 
> From my understanding if I wanted to use the !INT1 pin as an actual
> interrupt line, I would probably hook it up to either a GPIO of the
> SoC or some wakeup input of the PMIC.  What else is possible and how
> would the different ways be expressed in .dts?  I found some .dts and
> .dtsi files having an 'interrupts' property in the rtc node, but I did
> not find the place in the code where this gets evaluated.
> 
> For clkout it is probably like in
> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi and the driver
> changes would be maybe somewhat similar to the changes done in
> drivers/rtc/rtc-pcf85063.c right?
> 
> Any hints on how to express in dts to _explicitly_ disable use as an
> interrupt pin and explicitly as fixed clkout?  And what changes to the
> pcf8523 driver would have to be done, if any?

I see this email just now. Ideally, we would get a pinmuxing part in the
RTC driver so the device tree can explicitly describe which function is
used. Also, as you point out, this also needs a clock driver part so we
benefit from the CCF for clock enabling and recounting.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


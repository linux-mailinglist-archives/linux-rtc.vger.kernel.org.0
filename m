Return-Path: <linux-rtc+bounces-2222-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F79A1583
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 00:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 750EA282108
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 22:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD5A1D270B;
	Wed, 16 Oct 2024 22:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Tz7CXQc7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4581C1917C4;
	Wed, 16 Oct 2024 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729116233; cv=none; b=Ug1BGp9yrnltN2I4FMQbOfB7ZFRktC8kQkUwW5vqY/KobHQnHo0MWAod2ZKHtE4aN6XQZTiq1zgQg4veGE1OglUTf68yhKMx++tJowoX8k5y7ZQY1IY0EesiUTBsEI24jYy66H+CUMeQCOHcSFF6xNuy6UnudKBANUUe9FGbQYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729116233; c=relaxed/simple;
	bh=LphcLYpO7HdQpqaxPOCL6zrIGYzvBc5sdPj8LnbOWes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9iKoNJLZpjnG6GF489uAdIGaP5J6SagirnnFulIw25mWWhIvXoTmNBESOP34PCVRFns+jVxtfTVErEuk0WqcU0USq9BCYaypvDJMSlAC0ndN3McQeObdvH65b/HEW0fRKOr2FNMYJWwYb6t1GzjBWcoE6kqvkB8YTfG217aPH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Tz7CXQc7; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 415081C0003;
	Wed, 16 Oct 2024 22:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729116228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W649ciFRM8rbVAGw5XNBosXQcXGpXdRG+9QrhIYNObU=;
	b=Tz7CXQc7iVINk4/iYg6zXg1Xx669sH2r9t5RJWIqVYo3Nnr9W19lh7b0enuDCtajEtTlFv
	dh0hibF53mm97MDz+dOFX9tLpWvQhXkITOGMx9BEZy2m11kaIEa/g5VLX17IFDG2dpqI8n
	jx3pD3T2eeP6WswiQAFLX61WQSa7uge9iQ2AtrAUosvZVbVZ6jH/zjNupWlLgH42HZZV7C
	4MJLIDN3s0O8z6+oowJPgcaJLCGkmSXSh8UlzaBjXwDlp3/FySheLG81bCM8+H+RlwNMlO
	jsC50H95GM33spkAhj1ps6f1tbxQGMIlD4tvH2OhrYi507O62AXpOprCrD/mpQ==
Date: Thu, 17 Oct 2024 00:03:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: renesas: r9a08g045: Add RTC node
Message-ID: <2024101622034648032b39@mail.local>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVqno3vO9T0FtHnNL2afWP4abSE4vmf8vkLRRndg=ws7A@mail.gmail.com>
 <4ff318b0-cd7c-4857-888c-a07c8985fce9@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ff318b0-cd7c-4857-888c-a07c8985fce9@tuxon.dev>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/10/2024 13:28:55+0300, claudiu beznea wrote:
> >> +                       compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
> >> +                       reg = <0 0x1004ec00 0 0x400>;
> >> +                       interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> >> +                                    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> >> +                                    <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       interrupt-names = "alarm", "period", "carry";
> >> +                       clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb VBATTB_VBATTCLK>;
> >> +                       clock-names = "bus", "counter";
> >> +                       assigned-clocks = <&vbattb VBATTB_MUX>;
> >> +                       assigned-clock-parents = <&vbattb VBATTB_XC>;
> > 
> > Don't the assigned-clock* properties belong in the board DTS?
> 
> It makes sense to be in the board DTS, indeed.
> 
> > In addition, I think they should be documented in the DT bindings,
> > and be made required, so board developers don't forget about them.
> 
> It would be better, indeed.

There were multiple recent emails from Rob saying that assigned-clocks
should not be part of the bindings.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


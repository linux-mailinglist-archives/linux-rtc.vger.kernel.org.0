Return-Path: <linux-rtc+bounces-1816-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF213966853
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 19:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29331C21437
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 17:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E421BB6A3;
	Fri, 30 Aug 2024 17:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g06uiySL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3191F1B81B1;
	Fri, 30 Aug 2024 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725040035; cv=none; b=EOHP+LG7HntgE/bLx+gDfD8TBqDCPa1+WqNrd5qbuuuoHtRPDGWJHP2cm6UUSp5VMmOg3ct8njQGxNoofvegDutSaAojmXzEA/9LR3kRolkPZmbDH3I6M1Qol4lZ1V/le5aJrTPxpG+L/1EnhKRkSzLUj1M4g0nHbeL+M59x0xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725040035; c=relaxed/simple;
	bh=sji6oTP4f/mPIHe8nZSA3wlyfuFy6QfVG32oiPNCwMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sk1aW/w+CdPtYU1pLfg5NV/UQzD5eKnbraj4xxTyh/2wGY13GbVogq90xdUnxiW66feoJbcHQP8W2xyDjJVZRBSMWzdKpFzaOBdPuIyz52/+i/WOYhicwtLMOE/HUniFN0z753q/lxIZHc17xCxS9fX51byfKep9jHFwZ+PCp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g06uiySL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751B1C4CEC2;
	Fri, 30 Aug 2024 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725040034;
	bh=sji6oTP4f/mPIHe8nZSA3wlyfuFy6QfVG32oiPNCwMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g06uiySLv6zORPuie25LzAMuU+uI+WM1zkimEw1iF2+0QfmGkQfXXRCfpbJZBOI90
	 oN+RYrIUc/bcGh9dQziuLS2OmZON6MCj5ALs5pO5wzmmd7Yo8BCo8XNfR4BYL5w+3u
	 tOAx1Wr7LV6gltNP3tZukeZs1xb459pG6SxoBEUwzwxGCu+M8W2VvlmdXyl4940XmX
	 qW6KywuVf1/u69j87cvxgdY60/W+4GMljWI4yzs9UG77AdRNO4nTygi4ecmlQ5I4OF
	 GQoVgxs0yD0Ki981CYBoX7w1hEzBlWNpFxUC1x7G9GTjjECjjvj3qdaxh23EeHxtQ4
	 iqEPLyS5VpYjw==
Date: Fri, 30 Aug 2024 12:47:12 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: clock: r9a08g045-vbattb: Add clock
 IDs for the VBATTB controller
Message-ID: <20240830174712.GA562851-robh@kernel.org>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830130218.3377060-3-claudiu.beznea.uj@bp.renesas.com>

On Fri, Aug 30, 2024 at 04:02:08PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The VBATTB controllers controls the clock for the RTC on the Renesas
> RZ/G3S. The HW block diagram for the clock logic is as follows:
> 
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
> 	   | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,/
> 
> One could connect as input to this HW block either a crystal oscillator or
> an external clock device.
> 
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
> 
> input-xtal
>   xbyp
>   xc
>      mux
>         vbattclk
> 
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
> 
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties.
> 
> This allows select the input of the mux based on the type of the
> connected input clock:
> - if the 32768 crystal oscillator is connected as input for the VBATTB,
>   the input of the mux should be xc
> - if an external clock device is connected as input for the VBATTB the
>   input of the mux should be xbyp
> 
> Add clock IDs for the VBATTB controller.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v3:
> - none; this patch is new
> 
>  include/dt-bindings/clock/r9a08g045-vbattb.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r9a08g045-vbattb.h

Squash this into the previous patch. It is part of the binding.

Rob


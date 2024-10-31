Return-Path: <linux-rtc+bounces-2385-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C59B75A4
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 08:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDF428234E
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 07:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA0715E5D3;
	Thu, 31 Oct 2024 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HET2Wo/Y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D21411C8;
	Thu, 31 Oct 2024 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360795; cv=none; b=LTzYkXkxiWx+Vwcua0DBwROErW6RJmphgQRk69pgV2AKR1Tx549X6wIgOrLcSV2k5uJ1wGnoi0XFJgULn00pGJ6WJ4RD/0ZXecfbf5IZTg1Y8PFIJ89BSK4GJ2qa5K62Fe5tnw0faL5K+OonJWQ7Rkzop9csifLcW8hNMpdesUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360795; c=relaxed/simple;
	bh=5AqQVqv7cgLso2HdKLdGQKCHtmDv0AGSPgURJ2Jfg1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHPYmAQXjhoyi65CEczFYkd7AutMr1jvCHdxru7zUH4bwVtWFa5aS9Xbz3VTh8vbRFAWD/rFjBBRGF3ZMTqOizGMuD/l8x6fBKWY+Cc6mopcBX9oc4db+h189vMKie8MUAp1jBhhmQ635b5WyJSu2P+kZxWHSPVVFmrACVOMaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HET2Wo/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D52BC4CED3;
	Thu, 31 Oct 2024 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360794;
	bh=5AqQVqv7cgLso2HdKLdGQKCHtmDv0AGSPgURJ2Jfg1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HET2Wo/YxxVBW6EePmT6fedO9UFXcAxmiSSpwHlxZymOhlqDpCE1L2GjyDiDxbPzN
	 R73fq9sjS7xM5ReBmdnyUVZGxEe3xSOCMERv4kmXvD6Nr6XUMKr7LeWT4ZZSVgamvg
	 /ZvdCKsYljXR7htrFv7vpdA+lcDJTikN9Gsb2liYGF/m9/ypln7425q8GD2armUQD9
	 QrvwXahuLe12l2H92j9c8CXsxJUBlQS7JRia8wY3UmxQvQev7LV5Z0gXuJbkyls9M+
	 8ZbT6Wb1g6RQ6Eo1bWzrr0g0a8zPF2ULPWMrCkJWHUkcXUF0u7w2KpXxhc8M5ShJVn
	 W5FJMcMEmgx4w==
Date: Thu, 31 Oct 2024 08:46:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Message-ID: <bt7kgzreebwyeyfsii2q6fci34vfqst6hrxk6anp6tzthlmc5o@t2ifzexazta7>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030110120.332802-2-claudiu.beznea.uj@bp.renesas.com>

On Wed, Oct 30, 2024 at 01:01:11PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B.
> 
> The VBATTB controller controls the clock for the RTC on the Renesas
> RZ/G3S. The HW block diagram for the clock logic is as follows:
> 
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,/
> 
> One could connect as input to this HW block either a crystal or
> an external clock device. This is board specific.
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
> - if the 32768 crystal is connected as input for the VBATTB,
>   the input of the mux should be xc
> - if an external clock device is connected as input for the VBATTB the
>   input of the mux should be xbyp
> 
> Add bindings for the VBATTB controller.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - used spaces in the diagram from the patch description
> - added "This is board specific" in the board description to emphasize
>   the usage of the assigned-clocks in the example
> - added default for quartz-load-femtofarads
> - collected tags

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



Return-Path: <linux-rtc+bounces-2387-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0C9B75AF
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 08:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28E0528216E
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 07:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5091515382E;
	Thu, 31 Oct 2024 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+MBvecD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920A1494D9;
	Thu, 31 Oct 2024 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360885; cv=none; b=O8MCLx4ekLCYT+XTsRD880DsQfqZm0Tv817VtfaUhb55nqWZJWq1kX8/81y28U58hSNDhipgU+GReXX95919NhmKFGwNvbHiSPlbFR0mMbBOpY3KrrTp48r993+2Z4YmE3bW7gF0Ovtz20qe6VOs7jAzX4I4tzVDj8YYlbwgH2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360885; c=relaxed/simple;
	bh=xVfQPG7c9kz2nTYeQBPjigzco5tjWo7NDZm98MMLSNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2yY6XoWnw085fb6EegV8AU6TKhrDzh2+Irk2KSgwE/YdZL/FfQfYALXLWp/u6lhBu1xnjYI3eukyMcxHHuf9nBE704ozUqeTVoh3Ovy+Ma7Qc3EWgb1FUw3cpRbpjG29lluizTb/IpavWUQSRp7U+b9aFdQktu74A9dvvDvnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+MBvecD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2353C4CEC3;
	Thu, 31 Oct 2024 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360884;
	bh=xVfQPG7c9kz2nTYeQBPjigzco5tjWo7NDZm98MMLSNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+MBvecD+FNfmK+aw5GkA3e30OejL8ZM3OYiPmWZ3pF4mJM2HJLFHXDYDY4iBnYkg
	 LAH/qR22Ld4W1tqLKcw2/YPC2s1AVhElL4CjIyWaR1+52Fy/1zSoGGKs0ZxkyL8AAS
	 Uh7jWbyN0uy8BHEK7l1vFZNtw6Y2i0A5xj3qU6K0tuBuGHFpMv9NhsQelcsGmTv0ps
	 YdnI5t9aWT8NBrDs2FpVCVYUNcWGVPwhL8EMldtY9V8CcIK9w359aeL/nrQdh8GiRL
	 VepR8v0WqozJaxqKJTgG8gKW8MC1Pw3kF1tibaQoIx2MPGudNRRW/2Rk8IsfL/oIbN
	 jVtSa8QKKXY5g==
Date: Thu, 31 Oct 2024 08:48:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
Message-ID: <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>

On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
> by the RTC. The input to the VBATTB could be a 32KHz crystal
> or an external clock device.
> 
> The HW block diagram for the clock generator is as follows:
> 
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,
> 
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
> 
> vbattb-xtal
>    xbyp
>    xc
>       mux
>          vbattbclk
> 
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
> 
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties. If the crystal is connected on RTXIN,
> RTXOUT pins the XC will be selected as mux input. If an external clock
> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
> mux input.
> 
> The load capacitance of the internal crystal can be configured
> with renesas,vbattb-load-nanofarads DT property.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - collected tags
> 
> Changes in v4:
> - dropped oscillator from patch description
> - s/on-board/internal in patch description
> - updated dt-binding included file name in the driver as it has been
>   renamed to include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
> - dropped the "_BIT" from driver macros
> - used "quartz-load-femtofarads" dt property instead of adding a new one
> - register the "vbattclk" as critical clock as this feeds the RTC counter
>   logic and it needs to stay on from the moment the RTC is configured;
>   along with it, added a comment to express this.
> 
> Changes in v3:
> - updated patch description
> - dropped dependency on MFD_RENESAS_VBATTB as now there is no
>   driver built under this flag
> - dropped include/clk.h
> - added pm_runtime and reset control support
> - updated register offsets
> - registered 4 clocks: xc, xbyp, mux, vbattclk using generic
>   clock drivers
> - added MODULE_DEVICE_TABLE()
> 
> Changes in v2:
> - updated patch description
> - added vendor name in Kconfig flag
> - used cleanup.h lock helpers
> - dropped the MFD code
> - updated registers offsets
> - added vbattb_clk_update_bits() and used it where possible
> - added vbattb_clk_need_bypass() to detect the bypass setup necessity
> - changed the compatible and driver names
> 
> 
>  drivers/clk/renesas/Kconfig      |   4 +
>  drivers/clk/renesas/Makefile     |   1 +
>  drivers/clk/renesas/clk-vbattb.c | 205 +++++++++++++++++++++++++++++++
>  3 files changed, 210 insertions(+)
>  create mode 100644 drivers/clk/renesas/clk-vbattb.c
> 
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index 76791a1c50ac..4e835a3f1ab4 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -237,6 +237,10 @@ config CLK_RZV2H
>  	bool "RZ/V2H(P) family clock support" if COMPILE_TEST
>  	select RESET_CONTROLLER
>  
> +config CLK_RENESAS_VBATTB
> +	bool "Renesas VBATTB clock controller"

tristate

> +	select RESET_CONTROLLER
> +

...

> +
> +static const struct of_device_id vbattb_clk_match[] = {
> +	{ .compatible = "renesas,r9a08g045-vbattb" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, vbattb_clk_match);
> +
> +static struct platform_driver vbattb_clk_driver = {
> +	.driver		= {
> +		.name	= "renesas-vbattb-clk",
> +		.of_match_table = vbattb_clk_match,
> +	},
> +	.probe = vbattb_clk_probe,
> +};
> +module_platform_driver(vbattb_clk_driver);

That's a module, isn't it?

> +
> +MODULE_DESCRIPTION("Renesas VBATTB Clock Driver");
> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.2
> 


Return-Path: <linux-rtc+bounces-782-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC3872158
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 15:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505721C215A5
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 14:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0033986620;
	Tue,  5 Mar 2024 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MaV2jXya"
X-Original-To: linux-rtc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262185915D;
	Tue,  5 Mar 2024 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709648345; cv=none; b=clX/ZgA3BvSyGOH4lNYQhvPH7j+TDRa/kdAQ4mwQLZwp51AtHpe3nd9H553rwum5lvWryU9K0t5i/DEQqTXn+ErmPUJE8htrO4liy5k50tnsuN5oDb6q9XdP86zEn0BUpscvzzDuvh0JJwxAzG8AnR+CzUEiy/hccBZZoFwxD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709648345; c=relaxed/simple;
	bh=hkLU/18Cgjxnj864xqTHUx7XR5iiSbQ0FdD/WYjDWdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A52yfs3/XNe6m+GJmHjMMpnXVH5X3ycThzNwUKPARHPWDwp/ib3GhqPYS52AM5ujvWZdgSAasV7bJqmVympJX7f3hhzn6C4jr2adSb0Kwv4ibFYhsVKL9Y0maWDM+eIt1EWzeGhu3q7sU0T0nowgkrM+HI5ZhjP2MwlmMJudhG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MaV2jXya; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC152A27;
	Tue,  5 Mar 2024 15:18:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709648323;
	bh=hkLU/18Cgjxnj864xqTHUx7XR5iiSbQ0FdD/WYjDWdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MaV2jXyaB2KFUGcG+eyfmDRB6RKjwb6u8Gdsp79fIFzH7l4PoRgd9puWs1M5jkn72
	 ZaJtzVM6Z7y4HB2Sq7q2LAe8F5hwUwDxWjL6nAsfaymb/tXx4fA7WZSoKAPVzZ4cBD
	 4bzOSWfEJvMlcE3Xdua4sRTI9WYovXfYu4aJV7NQ=
Date: Tue, 5 Mar 2024 16:19:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	NXP Linux Team <linux-imx@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Valentin Raevsky <valentin@compulab.co.il>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Baruch Siach <baruch@tkos.co.il>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-rtc@vger.kernel.org,
	Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 0/4] Add DT bindings and device tree for Compulab
 SB-UCM-iMX8MPLUS
Message-ID: <20240305141900.GD12482@pendragon.ideasonboard.com>
References: <20240305004222.622-1-laurent.pinchart@ideasonboard.com>
 <170964448684.3160987.11938853123583954222.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170964448684.3160987.11938853123583954222.robh@kernel.org>

Hi Rob,

On Tue, Mar 05, 2024 at 07:20:21AM -0600, Rob Herring wrote:
> On Tue, 05 Mar 2024 02:42:17 +0200, Laurent Pinchart wrote:
> > Hello,
> > 
> > This small patch series is a drive-by addition of the Compulab
> > SB-UCM-iMX8MPLUS to the Linux kernel device tree sources. While porting
> > the device tree from the Compulab BSP kernel to mainline, I thought I
> > could as well mainline it, along with related conversion of text DT
> > bindings to YAML.
> > 
> > The SB-UCM-iMX8MPLUS is a carrier board designed as a reference to
> > evaluate the Compulab UCM-iMX8MPLUS SoM. The SoM integrates the bare
> > minimal peripherals (DRAM, eMMC, ethernet PHY, EEPROM and RTC), while
> > the carrier board includes a much wider range of peripherals. I have
> > only enabled support for the ones I am interested in, or, as a strech
> > goal, the ones I could easily test.
> > 
> > The first patch in the series adds compatible strings for the SoM and
> > the board to the ARM FSL bindings. The next patch then converts text DT
> > bindings to a YAML schema for the RTC present on the SoM. Finally, the
> > last two patches add DT sources for the SoM and the carrier board.
> > 
> > Please see individual patches for details.
> > 
> > I have checked the validity of the bindings and the device tree sources.
> > The only warnings in the DT sources are due to issues in imx8mp.dtsi.
> > 
> > Laurent Pinchart (4):
> >   dt-bindings: arm: fsl: Add Compulab SB-UCM-iMX8MPLUS carrier board
> >   dt-bindings: rtc: abx80x: Convert text bindings to YAML
> >   arm64: dts: freescale: Add device tree for Compulab UCM-iMX8M-Plus
> >   arm64: dts: freescale: Add device tree for Compulab SB-UCM-iMX8MPLUS
> > 
> >  .../devicetree/bindings/arm/fsl.yaml          |   6 +
> >  .../bindings/rtc/abracon,abx80x.txt           |  31 --
> >  .../bindings/rtc/abracon,abx80x.yaml          |  89 +++++
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../boot/dts/freescale/imx8mp-sb-ucm.dts      | 284 ++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8mp-ucm.dtsi | 309 ++++++++++++++++++
> >  6 files changed, 689 insertions(+), 31 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> >  create mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ucm.dtsi
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y freescale/imx8mp-sb-ucm.dtb' for 20240305004222.622-1-laurent.pinchart@ideasonboard.com:
> 
> Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:68.1-10 Label or path hdmi_pvi not found
> Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:72.1-9 Label or path hdmi_tx not found
> Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:86.1-13 Label or path hdmi_tx_phy not found
> Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:208.1-8 Label or path lcdif3 not found

I forgot to mention in the cover letter that this depends on i.MX8MP
HDMI integration in DT that is currently pending. As it's not in
linux-next yet, I'll send a v2 that splits HDMI support in a separate
patch. Depending on when the HDMI integration gets merged, the base
SB-UCM support can go in by itself or with HDMI support in v6.10.

> FATAL ERROR: Syntax error parsing input tree
> make[3]: *** [scripts/Makefile.lib:419: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:481: arch/arm64/boot/dts/freescale] Error 2
> make[2]: Target 'arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1385: freescale/imx8mp-sb-ucm.dtb] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
> make: Target 'freescale/imx8mp-sb-ucm.dtb' not remade because of errors.

-- 
Regards,

Laurent Pinchart


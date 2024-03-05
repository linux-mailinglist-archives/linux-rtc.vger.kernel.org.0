Return-Path: <linux-rtc+bounces-781-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA989871FF0
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 14:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE7641C22EA8
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 13:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4429D5A7A4;
	Tue,  5 Mar 2024 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R09Gtcjs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0725381E;
	Tue,  5 Mar 2024 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709644823; cv=none; b=PuA/Gr9UNA4bHeDgxF6ZxHwGzh2DZU7DcD4CzQrJcY/NpBREcBIcAiNRsIxDpY6vx+L+FGz0ktWFWGY2C6Vw7GA4xL+UAdfRG9GA8sRlxkznDptx4kiLLYH0dcLbJT+4bcm5FkdVwcWTkyC2LpIVirmONkLCzK+6PoU4Kekjkj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709644823; c=relaxed/simple;
	bh=amw3prsqTdCeH8P7lM4vosZ+IdeeJ/3XC5LBt1LUDHk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=YPYg4xXYZnxiwzL3JLEr41SgblWR52eYce5SdcfmisvZfEqkI2gf4pAqUlQEC9TFbvv8AZv+fF2OvlVT1spL2lbLUo56Y0878t6IcQ796NNuSAeMYxZUWEOKrTY7BiFEiwTxXSc1CxOaBe2P6Pj2ch9Fy4gT0ZdjaONxQ7ff0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R09Gtcjs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D856C433F1;
	Tue,  5 Mar 2024 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709644822;
	bh=amw3prsqTdCeH8P7lM4vosZ+IdeeJ/3XC5LBt1LUDHk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=R09GtcjsDif6o5k5W+PVv7pX38m1TpeunrxHT+aB8B5RKmyrIfolRo2YFtu2lUrGC
	 velJcTSCNekxHqhoek9EdH4ZGBU/zzIu/CXAwMKb0UUgUWeKSPKcTslw8ZbcrbmCK/
	 0Ct+If5H+Bm91RCRUrt6n1BmcLrwrtQnw95X7LzBtqqAdbebB/S5CT5Rx17jnLWB3o
	 ysc73dBRIQDYyea873StZZkPQzdTpQpHBndbKnuasEVl/WD30o6km8Nvwvz6pDkvQd
	 +0N9lfOFaKs5vfO38Do9rFxaaqhjfsWgJod8BW6PETtLRji4xn5xr5hgVfJqG4bytJ
	 Jz1ipcJH11Vog==
Date: Tue, 05 Mar 2024 07:20:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 NXP Linux Team <linux-imx@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Valentin Raevsky <valentin@compulab.co.il>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Baruch Siach <baruch@tkos.co.il>, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-rtc@vger.kernel.org, Marek Vasut <marex@denx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
In-Reply-To: <20240305004222.622-1-laurent.pinchart@ideasonboard.com>
References: <20240305004222.622-1-laurent.pinchart@ideasonboard.com>
Message-Id: <170964448684.3160987.11938853123583954222.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add DT bindings and device tree for Compulab
 SB-UCM-iMX8MPLUS


On Tue, 05 Mar 2024 02:42:17 +0200, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series is a drive-by addition of the Compulab
> SB-UCM-iMX8MPLUS to the Linux kernel device tree sources. While porting
> the device tree from the Compulab BSP kernel to mainline, I thought I
> could as well mainline it, along with related conversion of text DT
> bindings to YAML.
> 
> The SB-UCM-iMX8MPLUS is a carrier board designed as a reference to
> evaluate the Compulab UCM-iMX8MPLUS SoM. The SoM integrates the bare
> minimal peripherals (DRAM, eMMC, ethernet PHY, EEPROM and RTC), while
> the carrier board includes a much wider range of peripherals. I have
> only enabled support for the ones I am interested in, or, as a strech
> goal, the ones I could easily test.
> 
> The first patch in the series adds compatible strings for the SoM and
> the board to the ARM FSL bindings. The next patch then converts text DT
> bindings to a YAML schema for the RTC present on the SoM. Finally, the
> last two patches add DT sources for the SoM and the carrier board.
> 
> Please see individual patches for details.
> 
> I have checked the validity of the bindings and the device tree sources.
> The only warnings in the DT sources are due to issues in imx8mp.dtsi.
> 
> Laurent Pinchart (4):
>   dt-bindings: arm: fsl: Add Compulab SB-UCM-iMX8MPLUS carrier board
>   dt-bindings: rtc: abx80x: Convert text bindings to YAML
>   arm64: dts: freescale: Add device tree for Compulab UCM-iMX8M-Plus
>   arm64: dts: freescale: Add device tree for Compulab SB-UCM-iMX8MPLUS
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  .../bindings/rtc/abracon,abx80x.txt           |  31 --
>  .../bindings/rtc/abracon,abx80x.yaml          |  89 +++++
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../boot/dts/freescale/imx8mp-sb-ucm.dts      | 284 ++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-ucm.dtsi | 309 ++++++++++++++++++
>  6 files changed, 689 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ucm.dtsi
> 
> --
> Regards,
> 
> Laurent Pinchart
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-sb-ucm.dtb' for 20240305004222.622-1-laurent.pinchart@ideasonboard.com:

Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:68.1-10 Label or path hdmi_pvi not found
Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:72.1-9 Label or path hdmi_tx not found
Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:86.1-13 Label or path hdmi_tx_phy not found
Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:208.1-8 Label or path lcdif3 not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.lib:419: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dtb] Error 1
make[2]: *** [scripts/Makefile.build:481: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1385: freescale/imx8mp-sb-ucm.dtb] Error 2
make: *** [Makefile:240: __sub-make] Error 2
make: Target 'freescale/imx8mp-sb-ucm.dtb' not remade because of errors.







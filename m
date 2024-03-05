Return-Path: <linux-rtc+bounces-775-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD66A8711E0
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 01:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57849B21C7B
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 00:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6413D46B5;
	Tue,  5 Mar 2024 00:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o2lVXGyE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02F2F5A;
	Tue,  5 Mar 2024 00:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709599346; cv=none; b=XFaeSZRWGss5kZMAl75vFmGcXA3mMvNkVaMyIByBnNLlr/qvhyBFhOYY0m0bD6dFWAnb1i7z309tKzIZYbwOgNK3TT8PZu6YB42UADP8mM5oBTA34Hn9WGWVWJ2oiDQWCWKDA9nHeL/BOuFtI8oAHIqAYpGOxuwdWx/MQMJzB74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709599346; c=relaxed/simple;
	bh=QzplkygtBQlwW78p7VOmiQidZhclEvehironPcZeDms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqpG0FbCD9t3sXEFPystdaiShcJRNOoN/D+pn/7Nqs6zPpBp1dcSmxaxMd5uue67QOw2Gu5Sic7YcFR1/KJ7dD/aZYXczG7/3tEPUZCqNoAjdXPqfFKCg1RtWNcZ3f7hGz8Nqrt1BMeuawM5I5HhIObN+/5w6pbP7/0jvE/QGrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o2lVXGyE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 250081225;
	Tue,  5 Mar 2024 01:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709599325;
	bh=QzplkygtBQlwW78p7VOmiQidZhclEvehironPcZeDms=;
	h=From:To:Cc:Subject:Date:From;
	b=o2lVXGyEl916zjBOsshPAL4l3fwzy1LJmNx0kveaRJ1jcsfr/InI3QuCw7DaMhoqa
	 GkBQNoUE1OZNxLt2SLpQderNJY5BSeeCRG++wEt1uOdqEGFAjHiU4ReKZXFoJtUlt5
	 tuHgL7WZp3Gn/Nj3IctJfmBf+PP+dsi0oZXJpcvg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Valentin Raevsky <valentin@compulab.co.il>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Marek Vasut <marex@denx.de>,
	Baruch Siach <baruch@tkos.co.il>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 0/4] Add DT bindings and device tree for Compulab SB-UCM-iMX8MPLUS
Date: Tue,  5 Mar 2024 02:42:17 +0200
Message-ID: <20240305004222.622-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series is a drive-by addition of the Compulab
SB-UCM-iMX8MPLUS to the Linux kernel device tree sources. While porting
the device tree from the Compulab BSP kernel to mainline, I thought I
could as well mainline it, along with related conversion of text DT
bindings to YAML.

The SB-UCM-iMX8MPLUS is a carrier board designed as a reference to
evaluate the Compulab UCM-iMX8MPLUS SoM. The SoM integrates the bare
minimal peripherals (DRAM, eMMC, ethernet PHY, EEPROM and RTC), while
the carrier board includes a much wider range of peripherals. I have
only enabled support for the ones I am interested in, or, as a strech
goal, the ones I could easily test.

The first patch in the series adds compatible strings for the SoM and
the board to the ARM FSL bindings. The next patch then converts text DT
bindings to a YAML schema for the RTC present on the SoM. Finally, the
last two patches add DT sources for the SoM and the carrier board.

Please see individual patches for details.

I have checked the validity of the bindings and the device tree sources.
The only warnings in the DT sources are due to issues in imx8mp.dtsi.

Laurent Pinchart (4):
  dt-bindings: arm: fsl: Add Compulab SB-UCM-iMX8MPLUS carrier board
  dt-bindings: rtc: abx80x: Convert text bindings to YAML
  arm64: dts: freescale: Add device tree for Compulab UCM-iMX8M-Plus
  arm64: dts: freescale: Add device tree for Compulab SB-UCM-iMX8MPLUS

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../bindings/rtc/abracon,abx80x.txt           |  31 --
 .../bindings/rtc/abracon,abx80x.yaml          |  89 +++++
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mp-sb-ucm.dts      | 284 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-ucm.dtsi | 309 ++++++++++++++++++
 6 files changed, 689 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ucm.dtsi

-- 
Regards,

Laurent Pinchart



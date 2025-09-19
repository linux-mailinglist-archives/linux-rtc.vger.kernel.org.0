Return-Path: <linux-rtc+bounces-4990-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB4B8AADF
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 19:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A41416EC49
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 17:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6311131DDA4;
	Fri, 19 Sep 2025 17:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZ0mR3po"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352D123BCF3;
	Fri, 19 Sep 2025 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301407; cv=none; b=d4c/HBpkbXHu6jfwf04v1+SXMoY5mRg/1G9F0lJ46lo+xX9j/VtFX/ysEzf0a/rPdvypoObVKTSULbANYa/lSI5BHmmER2GgdE0WDsrkIAnYdJMETyOdO8fZsljCIPDKYkNd069ssxwqIFDGuqCMOzsAjoPGTcw2jMp9dFEnjy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301407; c=relaxed/simple;
	bh=XonsKYVNSdFYHakbEe/LhsEfPPCqo2ymfS/gOBOQ3ZY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=LpuRdjiK4hoD7wVQ5H5rZata+idSEKD28EcuCcT9lTgJaR41QSVj2qQRRqg0Nt7ngo7tsaPNy/5oU6gmRWPJ5g28FpAB4AP08mtutW7gQr8IZ0hnCt1gdHWbmc9Wo/DIEiGy8TzMHc0rZO1j9yN/jaLfUybpo8tTJaHB91wmIxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZ0mR3po; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66448C4CEF0;
	Fri, 19 Sep 2025 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758301406;
	bh=XonsKYVNSdFYHakbEe/LhsEfPPCqo2ymfS/gOBOQ3ZY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rZ0mR3poa4/HeyiSP/hLHouk1dz6EpDPOIy6nd/gEzyYNrB+ZOjkF8I5BTJk9vFVO
	 foZQsgKvISkJsbzGxpk2PtYlIlo1fmGUj0shQC5+f1YAXEXw+mvaA1NglDfxUEFIja
	 12stfNaqaNwK9+qmQYez2CE8Dii1HTyQET3psYoOuj1GPNgCt1VJFg3dsPhimxpNPS
	 3rdr3xBTH1FQtxZsF7KrwN7ll+5MUBgEK3V+yvZY1GhRbvNJUmfWkCWGA3ee07WCWv
	 eN32ORC9qaxBSfuZxnp0pV39m3qYXvxLlVpDW+WdNY3cOh/MS1O/Z0kE79xxjp81j+
	 PWbxOhRhcMW5A==
Date: Fri, 19 Sep 2025 12:03:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Will Deacon <will@kernel.org>, 
 linux-tegra@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Lee Jones <lee@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
In-Reply-To: <20250919140217.10531-1-shgarg@nvidia.com>
References: <20250919140217.10531-1-shgarg@nvidia.com>
Message-Id: <175830104426.1375460.11123738770317069175.robh@kernel.org>
Subject: Re: [PATCH v6 2/4] arm64: tegra: Add device-tree node for NVVRS
 RTC


On Fri, 19 Sep 2025 14:02:17 +0000, Shubhi Garg wrote:
> Add NVIDIA VRS (Voltage Regulator Specification) RTC device tree node for
> Tegra234 P3701 and P3767 platforms. Assign VRS RTC as primary RTC (rtc0).
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v6:
> - compatible name fixes to "nvidia,vrs-10"
> - changed dtb node name to pmic@3c
> 
> v5:
> - changed dtb node name to rtc@3c
> 
> v4:
> - fixed device tree node name to "pmic@3c" in aliases
> 
> v3:
> - fixed device tree node name to generic "pmic@3c"
> 
> v2:
> - added alias to assign VRS RTC to rtc0
> - removed status node from VRS DTB node
> 
>  arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 11 +++++++++++
>  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 15 +++++++++++++++
>  2 files changed, 26 insertions(+)
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250919 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250919140217.10531-1-shgarg@nvidia.com:

arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']







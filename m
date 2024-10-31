Return-Path: <linux-rtc+bounces-2386-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC3A9B75AB
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 08:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10A322827BC
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 07:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A86414D2BD;
	Thu, 31 Oct 2024 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQL2gxTo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1725084D0D;
	Thu, 31 Oct 2024 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360836; cv=none; b=AqljB2IyyvELdpb7ITrsXwaMyO/5rTnRLQdtAdfFRdhpvsRnsSUiCEk60h/Lm5zvrVmY6+OVqSEmfaTzMue4bjUaNhnGZaVjdVsSxnBAX4CFVZfz1McX+5XeRVE09kbCtziYzwnUnJ/X5S000Pjz4ndmZ/iOHUQ1IDmWvyf8wm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360836; c=relaxed/simple;
	bh=+/mNFZoyqAhBMU/EtC0vUn4wU+EAjbWZapa9iLdQ8T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgeVT9YZ4lWDFUcBU2hpYhQY29NNJXLFoqQaNWCzysSYK1f7d6JCGwtPeG7ZyRCzMZdTsLfm1pOFC3c46tfAs91jjQzS7zatSbx7taTqrMGsgJE6ILAEI/sSvGZGINIj2EayGLi37J6k6yzBafbz/ITvTjVmxiurcBI0GKA1osY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQL2gxTo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6387C4CEC3;
	Thu, 31 Oct 2024 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360835;
	bh=+/mNFZoyqAhBMU/EtC0vUn4wU+EAjbWZapa9iLdQ8T8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQL2gxToMy+8NOIC7Gmp4FSHqzDYm0232ya07iuTjCBh1gDrN6cmaa4vf7JNs6OrD
	 t81UJuDLafZDl3lqjPIrAUtaT6UgYG0IjYp2d5ZL8LJz9z8x8dxgvZece4qLy88xG/
	 hhY4ey7Vcxxj2+pwoZktd1tzXW0cpT/MlbPZoydzrYTRdnPY2eEchErpSD/eZImKrV
	 XPIKsC8vhFo7Me+fD5li8UD8EU5lTp+ZEcCcjStqvbQj9BLfgH1hizXVfjH0ay6DHa
	 4z7cVOoztW+dFRSbPTWMARf8F5rZkEb2VdVe+e9PVvlrLz30vnUe3BM7B2FMBGjkTS
	 hTk1xqst4Uahg==
Date: Thu, 31 Oct 2024 08:47:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 10/10] arm64: defconfig: Enable VBATTB clock and
 Renesas RTCA-3 flags
Message-ID: <6eekxqtmsyaiafhyvos22eyo2mmp747uj3dkuivtou3jjees3y@hj5mp4pahngr>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-11-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030110120.332802-11-claudiu.beznea.uj@bp.renesas.com>

On Wed, Oct 30, 2024 at 01:01:20PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Enable the Renesas VBATTB clock and RTCA-3 RTC drivers. These are
> available on the Renesas RZ/G3S SoC. VBATTB is the clock provider for
> the RTC counter.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - none
> 
> Changes in v4:
> - squashed w/ patch "arm64: defconfig: Enable Renesas RTCA-3 flag" from v3
> - updated patch description
> - collected tags
> 
> Changes in v3:
> - update patch title and description
> - dropped CONFIG_MFD_RENESAS_VBATTB
> 
> Changes in v2:
> - added CONFIG_MFD_RENESAS_VBATTB
> - added vendor name in the VBATTB clock flag
> 
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 0fad83642034..4f4fe8d9125c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1222,6 +1222,7 @@ CONFIG_RTC_DRV_IMX_SC=m
>  CONFIG_RTC_DRV_MT6397=m
>  CONFIG_RTC_DRV_XGENE=y
>  CONFIG_RTC_DRV_TI_K3=m
> +CONFIG_RTC_DRV_RENESAS_RTCA3=y

This should be module.

>  CONFIG_DMADEVICES=y
>  CONFIG_DMA_BCM2835=y
>  CONFIG_DMA_SUN6I=m
> @@ -1371,6 +1372,7 @@ CONFIG_SM_VIDEOCC_8250=y
>  CONFIG_QCOM_HFPLL=y
>  CONFIG_CLK_GFM_LPASS_SM8250=m
>  CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
> +CONFIG_CLK_RENESAS_VBATTB=y

This as well.

Best regards,
Krzysztof



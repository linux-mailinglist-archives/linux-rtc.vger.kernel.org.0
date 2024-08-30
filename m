Return-Path: <linux-rtc+bounces-1814-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 280C89665EE
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 17:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C667C1F22F06
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E201B6532;
	Fri, 30 Aug 2024 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVAtELA0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFF0EEC9;
	Fri, 30 Aug 2024 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032647; cv=none; b=iHqLgOmPqHeF/Jw2+Y8oTc//69UigQlwwJJCWl//RHKUmD53aPqPUMW53lcG/67sYecFFustIsYkfDjtj4ktNypWjI6AiFMvixuAIiVjIufd467iBcI+hBHrcx+CosygfVwQne7iGEjcmTy/VsDLEulmlSQdbpftzg3A8wqY4vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032647; c=relaxed/simple;
	bh=VkZDandq3JSMzzDGwRJwhrbaal1xkOQ+HGnJE8SjBsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGthhWUH0Mq/XQ0w6r9Y+d2AjwBGXdGOgtNeiblUuszVW+FlnCsuib9AqkQUZKArW0i+Cn9qmldrM1UY7FBIRzcVcNKMLgJQEC7K2icCm6L9iLe7yHdGzrQdqhGyUhfD0xOCIkG4BrxEH6FFs3LUQquLrCE6sDb/Go8HXoGt/oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVAtELA0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5152AC4CEC2;
	Fri, 30 Aug 2024 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725032646;
	bh=VkZDandq3JSMzzDGwRJwhrbaal1xkOQ+HGnJE8SjBsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVAtELA0KeGQegt8ntHg1wiWQe7Yv26xq5TPF9n0MGbMbz0OjOvp/IEvp42gC7FMt
	 M2w1ikHzeSKcH4HY4PGnn3ITcMVi1HSNOVeWBTdj0OwFgwapDVRBt07X4HZrrobXsM
	 X6YkkTfa8VFe0f4EBgqnSC59+9AVv9wNWLDzIJ2Fpm9LsjnJ0YZZPnYZmEHGnOCQzI
	 o1RUx06J0fkqlIpIrw/uKoZ0x/HAlviXUlVCYOVZVqYpaEtDiq5P283J0LHCnEjGU6
	 cj18RjP/lmR2MuIcNX7Tl6OPQRuBPgHdbZukp94IyESyQ3vydIFWnLCtIN00gSyAet
	 Poy6op0SOty0w==
Date: Fri, 30 Aug 2024 10:44:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-rtc@vger.kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	mturquette@baylibre.com, magnus.damm@gmail.com, conor+dt@kernel.org,
	sboyd@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, alexandre.belloni@bootlin.com
Subject: Re: [PATCH v3 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document
 the Renesas RTCA-3 IP
Message-ID: <172503263744.44904.9725810011067270873.robh@kernel.org>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-6-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830130218.3377060-6-claudiu.beznea.uj@bp.renesas.com>


On Fri, 30 Aug 2024 16:02:11 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> The RTC IP available on Renesas RZ/V2H is almost identical with the
> one found on Renesas RZ/G3S (it misses the time capture functionality
> which is not yet implemented on proposed driver). For this, added also a
> generic compatible that will be used at the moment as fallback for both
> RZ/G3S and RZ/V2H.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v3:
> - added RTC bus clock, reset and power-domain; it has been detected
>   by reverse engineering that RTC and VBATTB clock, reset and power
>   domain are shared; HW manual doesn't mention it
> - updated example with these and with assigned-clock properties
>   needed to configure the VBATTCLK MUX with proper parent
> - updated example section with dt-bindings/clock/r9a08g045-cpg.h
>   and dt-bindings/clock/r9a08g045-vbattb.h includes
> - for all these, dropped Conor's Rb tag
> 
> Changes in v2:
> - updated patch description and title
> - included reference to rtc.yaml
> - updated compatible list with a generic compatible as explained in
>   patch description; with this the node in examples section has also been
>   updated
> - used items to describe interrupts, interrupt-names, clock, clock-names
> - updated title section
> 
>  .../bindings/rtc/renesas,rz-rtca3.yaml        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



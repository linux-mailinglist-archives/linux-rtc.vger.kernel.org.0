Return-Path: <linux-rtc+bounces-2849-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F0A07162
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 10:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33C0D18854EB
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 09:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3406A2153C5;
	Thu,  9 Jan 2025 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uoXyB59c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE320409B;
	Thu,  9 Jan 2025 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414676; cv=none; b=LhtLQ5IAEl2/hYsTtQLsnRIV+20p9hRt66ehBY+S7Q1U7jIR+SGPMQ7DcJlylXVq41H42O+5GO8g+ctWYZ4d8frRP/V7bNSnIUUBiX1mKOs6iV7Htq2eVbxfyYf4xEwXJIUGw45XEGviN/hVrsL+PRGCxpamVgbYWiStmxHL2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414676; c=relaxed/simple;
	bh=zYI5/a4+nQDm4Qrb21GJl+lHZp/djig8Ib4inXwAMOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEHZRW30QDbFkzkc5YvjkgnaEyVXSaigeWqSCNezLwxa9DQ1GY+lqGjgyVnDlTUVWIRBAnKwW0nv28F2oWsiYNOB0/iwLtFJO2ThQz0v5ExbX3g5kHANhUzoIYyOOqw2tm2UrdvDz+Jd6pn4bMh+TGmbkgEN5wqdSoBcnksdC1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uoXyB59c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887A8C4CED2;
	Thu,  9 Jan 2025 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736414675;
	bh=zYI5/a4+nQDm4Qrb21GJl+lHZp/djig8Ib4inXwAMOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoXyB59clN1btqwzo6+Y9QiuFzUI+eig6LNvziN4YaR2SldPrmJityt8X5f0jqZuL
	 ib6EtzfQPsgv8Dq+vpekJjJd8BooFL1NqwI5td5TxD1buKRSLmebrlTaipFxmn5NXj
	 2NSWdic3zThWezhOMoK41ORMFeTiMgiOATeLsHrffXxIveekKaH/zUtF3+9rUSffur
	 CBOVPvlaUxHjheJTOL0BMsAAKnmKE8YvlMTX3BQMe/e/9guHOWQGEARhPbot5C28JO
	 cKBsAWEBUy9Hfawp3c/IavJddZmb72sHXuK6M5c4NnSIMdyex8DtI8kU8xKo3FXoDG
	 BG5qfDcKslkLw==
Date: Thu, 9 Jan 2025 09:24:29 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
	linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Correct indentation and style in DTS example
Message-ID: <20250109092429.GC6763@google.com>
References: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>

On Tue, 07 Jan 2025, Krzysztof Kozlowski wrote:

> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This applies cleanly on v6.13-rc6 and on next-20250107, so I expect no
> conflicts between Rob's tree and other maintainers' trees.
> 
> Rob,
> Can you apply it to DT tree?
> ---
>  .../arm/arm,trace-buffer-extension.yaml       |  10 +-
>  .../bindings/arm/stm32/st,mlahb.yaml          |  20 +-
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  42 ++--
>  ...ntel,ixp4xx-network-processing-engine.yaml |  52 ++---
>  .../bindings/fpga/xlnx,versal-fpga.yaml       |   2 +-
>  .../bindings/interconnect/qcom,rpmh.yaml      |  28 +--
>  .../bindings/iommu/riscv,iommu.yaml           |   6 +-

>  .../devicetree/bindings/leds/leds-mt6360.yaml | 195 +++++++++---------

Acked-by: Lee Jones <lee@kernel.org>

>  .../devicetree/bindings/mips/brcm/soc.yaml    |  42 ++--
>  .../misc/intel,ixp4xx-ahb-queue-manager.yaml  |   6 +-
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |  78 +++----
>  .../bindings/mtd/technologic,nand.yaml        |   2 +-
>  .../bindings/nvmem/amlogic,meson6-efuse.yaml  |   2 +-
>  .../bindings/pci/ti,j721e-pci-ep.yaml         |  34 +--
>  .../bindings/power/reset/qcom,pon.yaml        |  62 +++---
>  .../nvidia,tegra264-bpmp-shmem.yaml           |  15 +-
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        |  22 +-
>  .../amlogic/amlogic,meson-gx-hhi-sysctrl.yaml |  26 +--
>  .../bindings/soc/qcom/qcom,eud.yaml           |  38 ++--
>  .../bindings/soc/ti/wkup-m3-ipc.yaml          |  32 +--
>  20 files changed, 357 insertions(+), 357 deletions(-)

-- 
Lee Jones [李琼斯]


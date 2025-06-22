Return-Path: <linux-rtc+bounces-4334-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D07DAE2F91
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 13:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD09B1622E5
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 11:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80AE1DB366;
	Sun, 22 Jun 2025 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="becY3tL9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B083A8F6C;
	Sun, 22 Jun 2025 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750592182; cv=none; b=EujRdSgsZQQPJE8B05xgjCWsR+aCVy+2daLLR/pTHulBBRSki96klr0iim5vNeEt9g5lrJ3+dOn7rAPkEWF/UKlqAeA36Il2o6+HiYAAOumpS1L5dMktbS//xmx9HIe/DF6Lsw2bUYBVqNppU3bGSJTKhcHTWDxJ6CqaqiSA2Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750592182; c=relaxed/simple;
	bh=6EBc43I0hRetS6oG4fS9WzjeCLsol5+NvkR7edl/i6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PW0+5Tfs3BOVvVGt3wT59wlz3X6HPiaPICm9HLxJHXu93+LAlq1r5xt2+s9GbHTai+U8EEZeEN4pMRMj68KgCXyoPvrHUnKcFzbIkA38N1MqqIfL+4kjMdd7Y2UmpZx+H0evaOZq8pg0Ir/txMTgnUWEN++iGbJWqKtz5C53ohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=becY3tL9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D371C4CEE3;
	Sun, 22 Jun 2025 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750592182;
	bh=6EBc43I0hRetS6oG4fS9WzjeCLsol5+NvkR7edl/i6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=becY3tL9N6PqEruLxFbcmySSiLdV9J7nYdd79GVeM0qf3neU8OvEIkDSYQpmmL424
	 voDH4OKqkMpRFZK7XznSONMPSuSJEl39rst9RufOf9MnVdA8T3E3u+7o79pc+8ts7Z
	 5UuPjFOzzIVQSU7HUD923hyVnEFBW/XPBlmZNImlXNbpcQ15Rqbgglvp1HPaGGusNO
	 c9x9bCFxKFUXv5TvSpm9fLl1/yVKi/R3jMDXSqpU2xEBlYXcjRV8GGL5dst3tfRMM9
	 OhdG12UGrBRnoRb7AlixQPmPavJJiwV7ML+2N5Qudlcfw8+VOx0lv2peTxVTqQQa8e
	 8c6bdPLi1zUGQ==
Date: Sun, 22 Jun 2025 13:36:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: mfd: add NVIDIA VRS PSEQ
Message-ID: <ug3zbannk22ziy7g25rhe4v2vv2vlxg3ylwvksy2mbzkf3lb2f@uib4qcvxjig6>
References: <20250619084427.3559207-1-shgarg@nvidia.com>
 <20250619084427.3559207-2-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619084427.3559207-2-shgarg@nvidia.com>

On Thu, Jun 19, 2025 at 08:44:22AM +0000, Shubhi Garg wrote:
> Add support for NVIDIA VRS (Voltage Regulator Specification) power
> sequencer device. NVIDIA VRS PSEQ provides 32kHz RTC support with backup
> battery for system timing. It controls ON/OFF and suspend/resume power
> sequencing of system power rails on below NVIDIA platforms:
> 
> - NVIDIA Jetson AGX Orin Developer Kit
> - NVIDIA IGX Orin Development Kit
> - NVIDIA Jetson Orin NX Developer Kit
> - NVIDIA Jetson Orin Nano Developer Kit
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v4:
> - no changes
> 
> v3:
> - fixed device tree node name to generic "pmic@3c"
> - fixed indentation
> 
> v2:
> - fixed copyrights
> - updated description with RTC information
> - added status node in dtb node example
> 
>  .../bindings/mfd/nvidia,vrs-pseq.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml

Does not look like mfd device. Isn't there appropriate directory for this?

> 
> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> new file mode 100644
> index 000000000000..65bf77f70c44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nvidia,vrs-pseq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Voltage Regulator Specification Power Sequencer
> +
> +maintainers:
> +  - Shubhi Garg <shgarg@nvidia.com>
> +
> +description:
> +  NVIDIA Voltage Regulator Specification Power Sequencer device controls
> +  ON/OFF and suspend/resume power sequencing of system power rails for NVIDIA
> +  SoCs. It provides 32kHz RTC clock support with backup battery for system
> +  timing. The device also acts as an interrupt controller for managing
> +  interrupts from the VRS power sequencer.
> +
> +properties:
> +  compatible:
> +    const: nvidia,vrs-pseq

I2C devices, even internal to vendors like Qcom, Samsung, Renesas,
usually have models and version numbers. This looks really incomplete. I
don't think generic compatible would be acceptable for I2C.

Plus, pseq is redundant. Can it be anything else?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description:
> +      The first cell is the IRQ number, the second cell is the trigger type.

That's the default/standard, drop description.

Best regards,
Krzysztof



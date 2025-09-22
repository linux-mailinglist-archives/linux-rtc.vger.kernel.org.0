Return-Path: <linux-rtc+bounces-5010-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A911EB93264
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 21:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B667019080CD
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 19:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFD42F5302;
	Mon, 22 Sep 2025 19:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfSJnZgM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6201D2DEA9D;
	Mon, 22 Sep 2025 19:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758570836; cv=none; b=pom09LmWH7IBQNaHRK5TxN85I8vMGdhPH15gA25kIu5Hm+LSL/afnxpsThxtUYpjO/OcFJzFUBdWcw2i/Ip0Xq91/VEmGkxuhcNnFZ6qv5UmnwWlZVzPHAWaluJM2vY4s8CJjVHL5UkThDoRcYAi4PDZD4i1V5xqOMZ7h6vFyF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758570836; c=relaxed/simple;
	bh=JaOkQ3CL5j84b3sEHTMILLeyb7louIBqflmOtWnUrYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN2vefOrKp8fixxxksNuh4t2z6DhVq9yJ/wf1GH/P8nwgispThoMQyO74MdjR34x6EnY60AkYleLA0FP7gHWMsdmMtkPn0LLyA35rkqxSPjQ/KgMrF43Yb5kvymXPt85RhWr5/Q04zIiyBrMC6nq+6lReEcxPQ+/BSqthJk6Ovc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfSJnZgM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C45C4CEF5;
	Mon, 22 Sep 2025 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758570835;
	bh=JaOkQ3CL5j84b3sEHTMILLeyb7louIBqflmOtWnUrYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfSJnZgMo9fg9QT8eg+mKuHHHbEKj6Z8TLHSLxLGYzdupZyObeF4tQPB0Ec9cJzpE
	 sv6hAia69N2imXYz7yyk5QCiJ5T9zq6+3AqgvQIhw04YAlg6pj30r96ol3XjV/JLKT
	 83jEDrMDM/Kz6OOLmyzOjaL051Y8FjhydkjkKm/QuPfoOLpaLpH97su+CSyEV/8ONx
	 vfh+K15q7OM4Ksx7IGFrLaCQgmM3Vi6+OM7R47zAsug2v/5jY/plVCXmYkJEpwssY3
	 x1uTpESIY2K7QrgGRH8ZX/AASjScxuwcqSZFxt7fh8cPrLzv/iOXW1PyyfbDDVq0bi
	 XvaxzrvEF4zUQ==
Date: Mon, 22 Sep 2025 14:53:54 -0500
From: Rob Herring <robh@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Message-ID: <20250922195354.GA1065946-robh@kernel.org>
References: <20250919135950.10403-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919135950.10403-1-shgarg@nvidia.com>

On Fri, Sep 19, 2025 at 01:59:50PM +0000, Shubhi Garg wrote:
> Add device tree bindings for NVIDIA VRS (Voltage Regulator Specification)
> RTC device. NVIDIA VRS is a Power Management IC (PMIC) that implements a
> power sequencing solution with I2C interface. The device includes RTC
> which provides functionality to get/set system time, retain system
> time across boot, wake system from suspend and shutdown state.

I only see this patch. The threading of this is broken.

> 
> Supported platforms:
> - NVIDIA Jetson AGX Orin Developer Kit
> - NVIDIA IGX Orin Development Kit
> - NVIDIA Jetson Orin NX Developer Kit
> - NVIDIA Jetson Orin Nano Developer Kit
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v6:
> - compatible name fixes to "nvidia,vrs-10"
> - changed dtb node name to pmic@3c
> 
> v5:
> - moved device tree bindings from mfd to rtc
> - changed dtb node name to rtc@3c
> - changed compatible string to "nvidia,vrs10-rtc"
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
>  .../bindings/rtc/nvidia,vrs10-rtc.yaml        | 59 +++++++++++++++++++

Filename should match compatible string.

>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
> new file mode 100644
> index 000000000000..e8f3c25607e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nvidia,vrs10-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Voltage Regulator Specification Real Time Clock
> +
> +maintainers:
> +  - Shubhi Garg <shgarg@nvidia.com>
> +
> +description:
> +  NVIDIA VRS-10 (Voltage Regulator Specification) is a Power Management IC
> +  (PMIC) that implements a power sequencing solution with I2C interface.
> +  The device includes a real-time clock (RTC) with 32kHz clock output and
> +  backup battery support, alarm functionality for system wake-up from
> +  suspend and shutdown states, OTP memory for power sequencing configuration,
> +  and an interrupt controller for managing VRS events.
> +
> +properties:
> +  compatible:
> +    const: nvidia,vrs-10
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
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@3c {
> +            compatible = "nvidia,vrs-10";
> +            reg = <0x3c>;
> +            interrupt-parent = <&pmc>;
> +            interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +        };
> +    };
> -- 
> 2.43.0
> 


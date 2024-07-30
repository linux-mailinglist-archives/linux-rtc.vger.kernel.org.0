Return-Path: <linux-rtc+bounces-1636-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5EC9420E3
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jul 2024 21:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 422FF1C2361C
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jul 2024 19:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEE818CBE4;
	Tue, 30 Jul 2024 19:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h16IfaV0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2029118C938;
	Tue, 30 Jul 2024 19:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722368614; cv=none; b=QNGINuuJL7OWe9Eh2K16+gvWGfbWpj0QNCJvjp+A4J9HiNwvQ/GYP7rIqBhWB2kYbj3huvYdLu0o0/qkDQa4bTTz9e9lF/VHmFLMomgIVIFr4q2DeJ4HSmTFOFsXIWLclxxr9hDuEQd2OuUpPTq9ATgeuwzCD1x4Qn5RKS9Zuhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722368614; c=relaxed/simple;
	bh=7ZWS8u9aPiBFISBPRpifvY/WoT4OE1+Bi2YojbT+WFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuqWHs+m38mYa5SKnIoOweiimzUaJapsJZD/qMnqkZwODtCwJIGeBI2XHlhR9IVGbwYmX5aeieCKdZmtuWUMpKhEkjtUG87gvj04miwVdJI2h3xCUc9vQohpgyGUc7LDFOs9wnGhfeNbf/uk3AX+Y+1f5iWGy1G3FmLSsYNSlkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h16IfaV0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED71C32782;
	Tue, 30 Jul 2024 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722368613;
	bh=7ZWS8u9aPiBFISBPRpifvY/WoT4OE1+Bi2YojbT+WFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h16IfaV09C1EP1HeYxv9Lfjjb2QZyn6y/AGl00vvL51gux3ZdTtCtkgu1PIeevz3U
	 YrtJ9cB2kTu+C92kK9ODdHm62FWdQ9kRPww0iYG2WF2JZNknNKf7OJ4pBS+3Ra3ZUm
	 TLrcthVrzu2tpe2tHmCZayfZLHjFltdbNsnyxOaO4LmqVyj1w+bYWGy8ONNaxa3MT3
	 BqEVfWi00ONraIbPRf+advZiGJIkjyui2jnFDq/0hSCCWxMoRgmjqyHGJfDjvgL0dF
	 78gLkeyOjG83pes5QNqVGE+uugTbXEdwA/Ewsoz0mC6xJ4W6104pzswLOYoh/YY9Q2
	 rBxV0kM3qlooA==
Date: Tue, 30 Jul 2024 13:43:32 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Message-ID: <20240730194332.GA2029820-robh@kernel.org>
References: <20240729191143.1826125-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729191143.1826125-1-Frank.Li@nxp.com>

On Mon, Jul 29, 2024 at 03:11:42PM -0400, Frank Li wrote:
> Convert dt-binding rcpm from txt to yaml format.
> Add fsl,ls1028a-rcpm compatible string.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |  2 +-
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 91 +++++++++++++++++++
>  .../devicetree/bindings/soc/fsl/rcpm.txt      | 69 --------------
>  3 files changed, 92 insertions(+), 70 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> index 388102ae30cd8..3ec111f2fdc40 100644
> --- a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> +++ b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> @@ -42,7 +42,7 @@ properties:
>          minItems: 1
>      description:
>        phandle to rcpm node, Please refer
> -      Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +      Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  
>    big-endian:
>      $ref: /schemas/types.yaml#/definitions/flag
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> new file mode 100644
> index 0000000000000..6c6cda7f2b220
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Run Control and Power Management
> +
> +description:
> +  The RCPM performs all device-level tasks associated with device run control
> +  and power management.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,ls1012a-rcpm
> +          - fsl,ls1021a-rcpm
> +          - fsl,ls1028a-rcpm
> +          - fsl,ls1043a-rcpm
> +          - fsl,ls1045a-rcpm
> +          - fsl,p2041-rcpm
> +          - fsl,p5020-rcpm
> +          - fsl,t4240-rcpm
> +      - enum:
> +          - fsl,qoriq-rcpm-1.0
> +          - fsl,qoriq-rcpm-2.0
> +          - fsl,qoriq-rcpm-2.1
> +          - fsl,qoriq-rcpm-2.1+

You can't just allow any combination.

> +    minItems: 1
> +    description: |
> +      All references to "1.0" and "2.0" refer to the QorIQ chassis version to
> +      which the chip complies.
> +      Chassis Version         Example Chips
> +      ---------------         -------------------------------
> +      1.0                     p4080, p5020, p5040, p2041, p3041
> +      2.0                     t4240, b4860, b4420
> +      2.1                     t1040,
> +      2.1+                    ls1021a, ls1012a, ls1043a, ls1046a

The compatible lists above needs to match this.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#fsl,rcpm-wakeup-cells":
> +    description: |
> +      The number of IPPDEXPCR register cells in the
> +      fsl,rcpm-wakeup property.
> +
> +      Freescale RCPM Wakeup Source Device Tree Bindings
> +
> +      Required fsl,rcpm-wakeup property should be added to a device node if
> +      the device can be used as a wakeup source.
> +
> +      fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
> +      register cells. The number of IPPDEXPCR register cells is defined in
> +      "#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
> +      the bit mask that should be set in IPPDEXPCR0, and the second register
> +      cell is for IPPDEXPCR1, and so on.
> +
> +      Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
> +      mechanism for keeping certain blocks awake during STANDBY and MEM, in
> +      order to use them as wake-up sources.
> +
> +  little-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      RCPM register block is Little Endian. Without it RCPM
> +      will be Big Endian (default case).
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    rcpm: global-utilities@e2000 {
> +          compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
> +          reg = <0xe2000 0x1000>;
> +          #fsl,rcpm-wakeup-cells = <2>;
> +    };
> +
> +    serial@2950000 {
> +         compatible = "fsl,ls1021a-lpuart";
> +         reg = <0x2950000 0x1000>;
> +         interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +         clocks = <&sysclk>;
> +         clock-names = "ipg";
> +         fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
> +    };


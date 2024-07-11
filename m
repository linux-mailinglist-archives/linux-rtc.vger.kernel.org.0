Return-Path: <linux-rtc+bounces-1473-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E992E8E0
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 15:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2071F22FCB
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 13:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481FE15F402;
	Thu, 11 Jul 2024 13:05:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD7215EFA5;
	Thu, 11 Jul 2024 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703114; cv=none; b=snJui1ZSB08k0vIhDWIMJI9MnAelQbvltRGs2rIt0BYJdUisByr9JiiWQNogVsQyEmnJaPFjKzBkn2weTzzwe6beamYXW8Tn3H4OZFcalGmgZS0G1nHV1Njfi3zuEcUEYJO+oekPdz/rZOg1M2vgRUkSVSBhEtEjcXXhRq9MwM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703114; c=relaxed/simple;
	bh=eMvRGonZwmikOscaqZfGaScC+ufpuldxLid5Fo5rzTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAmwOUFAIQFZIR4uYFCLjP3GY3S7D9yKrtxcN1X+2hlBYZUaRVC2b2uXhhkszb+2eBybXHXpdfim3XmaZQJnZ3gdRqVCgx/uh3Y1s4YGBjFdC6yik3R9P/MTxgsiQ9ZkcSHvqnpAz47h8h8RZN90jbai/XKik+FLEoQakBmEY+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A97C1007;
	Thu, 11 Jul 2024 06:05:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D3C33F766;
	Thu, 11 Jul 2024 06:05:06 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:04:58 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 2/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Message-ID: <Zo_Yen-dsozJtugS@pluto>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-2-b85a6bf778cb@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-2-b85a6bf778cb@nxp.com>

On Fri, Jun 21, 2024 at 03:04:37PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

> Add i.MX SCMI Extension protocols bindings for:
> - Battery Backed Module(BBM) Protocol
>   This contains persistent storage (GPR), an RTC, and the ON/OFF button.
>   The protocol can also provide access to similar functions implemented via
>   external board components.
> - MISC Protocol.
>   This includes controls that are misc settings/actions that must be exposed
>   from the SM to agents. They are device specific and are usually define to
>   access bit fields in various mix block control modules, IOMUX_GPR, and
>   other GPR/CSR owned by the SM.
> 
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml     |  5 ++-
>  .../bindings/firmware/nxp,imx95-scmi.yaml          | 43 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 4d823f3b1f0e..47f0487e35de 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -22,6 +22,9 @@ description: |
>  
>    [0] https://developer.arm.com/documentation/den0056/latest
>  
> +anyOf:
> +  - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
> +
>  properties:
>    $nodename:
>      const: scmi
> @@ -284,7 +287,7 @@ properties:
>      required:
>        - reg
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  $defs:
>    protocol-node:
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> new file mode 100644
> index 000000000000..1a95010a546b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/nxp,imx95-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX95 System Control and Management Interface(SCMI) Vendor Protocols Extension
> +
> +maintainers:
> +  - Peng Fan <peng.fan@nxp.com>
> +
> +properties:
> +  protocol@81:
> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x81
> +
> +  protocol@84:
> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x84
> +
> +      nxp,ctrl-ids:
> +        description:
> +          Each entry consists of 2 integers, represents the ctrl id and the value
> +        items:
> +          items:
> +            - description: the ctrl id index
> +              enum: [0, 1, 2, 3, 4, 5, 6, 7, 0x8000, 0x8001, 0x8002, 0x8003,
> +                     0x8004, 0x8005, 0x8006, 0x8007]
> +            - description: the value assigned to the ctrl id
> +        minItems: 1
> +        maxItems: 16
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +
> +additionalProperties: true
> 
> -- 
> 2.37.1
> 


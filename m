Return-Path: <linux-rtc+bounces-1815-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2696684C
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 19:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDFA81F239AD
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 17:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FF71BAEF6;
	Fri, 30 Aug 2024 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMC4O0QH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F0A1B2516;
	Fri, 30 Aug 2024 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725039996; cv=none; b=ourg/o6OWqVypGH6O3k9cl9M5dCsLtGME8NfPDgTDGcTKgYqYIdzqTbYacc5/AMbTAon85NcynaaZfPfm8KZO1Yhyu/HQofoa/NDAYleZRBPY3jg3Yffo4Yjkc5u2I0mIYYB/ga5zSDtbA9/lfmViGKBr43CTMTszKMAxVN8YuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725039996; c=relaxed/simple;
	bh=aPZD1XgQShLnoHZyj31EvMq28IpHZmfxKQCW6h9WZKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9vGtxdQFqL5NqoQ4xxFHLYq/SeJFrTy2wrrApplY2ozmXmo7hJrLacwLfzLNsa0k+rTxVJE8w21OY5vmqKAF0B4gWOi2/nFINbgyipJqLXlUeTTizwlG/VLkmUnrIxA5oRN396cPSG6L9BlJdiJBbC2lCOs/swgGenooqCS1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMC4O0QH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3E3C4CEC2;
	Fri, 30 Aug 2024 17:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725039995;
	bh=aPZD1XgQShLnoHZyj31EvMq28IpHZmfxKQCW6h9WZKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMC4O0QHCt5WGcmOshgTKPmnkbkBb7GaV0+uiisqi/0Co6cRRWy7tT2fW/kyMbhMx
	 Rl8Zr+OsZceeHurDfdLNvA+bKEbAP47B5XAQBLhS8uZJ5SLimAAY8CWgXptxSq+9za
	 AIr4jNcgD2vcC58pRUccGnOWDZanXmCLy6lB1J7cFBoI5Oh929Lt2i790aq1ATY4Zc
	 jsLXqEum+cvWr55w0+HXHsug6VIEPRUo7k9VwBLLTg8UENAhgvX53xDUXhbfTfvY0W
	 V4DyTxr6DSbn4h4NUXsMYPBKRNZIRxIOyyhpLSgnR6SP1zJ3VuUHOya5wAMQxhVPG7
	 ZwgiEgI3ishvQ==
Date: Fri, 30 Aug 2024 12:46:33 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Message-ID: <20240830174633.GA559043-robh@kernel.org>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>

On Fri, Aug 30, 2024 at 04:02:07PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B. Add
> documentation for it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v3:
> - moved the file to clock dt bindings directory as it is the
>   only functionality supported at the moment; the other functionalities
>   (tamper detector, SRAM) are offered though register spreaded
>   though the address space of the VBATTB IP and not actually
>   individual devices; the other functionalities are not
>   planned to be supported soon and if they will be I think they
>   fit better on auxiliary bus than MFD
> - dropped interrupt names as requested in the review process
> - dropped the inner node for clock controller
> - added #clock-cells
> - added rtx clock
> - updated description for renesas,vbattb-load-nanofarads
> - included dt-bindings/interrupt-controller/irq.h in examples section
> 
> Changes in v2:
> - changed file name and compatible
> - updated title, description sections
> - added clock controller part documentation and drop dedicated file
>   for it included in v1
> - used items to describe interrupts, interrupt-names, clocks, clock-names,
>   resets
> - dropped node labels and status
> - updated clock-names for clock controller to cope with the new
>   logic on detecting the necessity to setup bypass
> 
>  .../clock/renesas,r9a08g045-vbattb.yaml       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
> new file mode 100644
> index 000000000000..29df0e01fae5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,r9a08g045-vbattb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Battery Backup Function (VBATTB)
> +
> +description:
> +  Renesas VBATTB is an always on powered module (backed by battery) which
> +  controls the RTC clock (VBATTCLK), tamper detection logic and a small
> +  general usage memory (128B).
> +
> +maintainers:
> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a08g045-vbattb
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: tamper detector interrupt
> +
> +  clocks:
> +    items:
> +      - description: VBATTB module clock
> +      - description: RTC input clock (crystal oscillator or external clock device)
> +
> +  clock-names:
> +    items:
> +      - const: bclk
> +      - const: rtx
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: VBATTB module reset
> +
> +  renesas,vbattb-load-nanofarads:

Use defined units, don't add your own. So -picofarads should work for 
you.

> +    description: load capacitance of the on board crystal oscillator
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 4000, 7000, 9000, 12500 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    vbattb@1005c000 {

clock-controller@...

> +        compatible = "renesas,r9a08g045-vbattb";
> +        reg = <0x1005c000 0x1000>;
> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
> +        clock-names = "bclk", "rtx";
> +        #clock-cells = <1>;
> +        power-domains = <&cpg>;
> +        resets = <&cpg R9A08G045_VBAT_BRESETN>;
> +        renesas,vbattb-load-nanofarads = <12500>;
> +    };
> -- 
> 2.39.2
> 


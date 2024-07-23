Return-Path: <linux-rtc+bounces-1569-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED20939830
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2024 04:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7F591C2196F
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2024 02:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4AC137C2A;
	Tue, 23 Jul 2024 02:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxOuDL3m"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB214287;
	Tue, 23 Jul 2024 02:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721701036; cv=none; b=H+opDT/Gg5HySoRyM5FBsdv/vQqhEITPFZYWqkGFx4hwA8+Yyw6VZz8EmAn2uyVp7wGjJoP0VmCQnE0hsqqwIMnZs6TeiVYA6SpoTbRzX036n8HecPe1n5YAfe6LggJeFkAL1cS7/ThPzR4fkm4VKYYVJgZmaUkufRtM29L8YrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721701036; c=relaxed/simple;
	bh=gnkOYbEfx9zPzHePEL/WxD5v0iNAO66aAz2aJlnJpSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XORJ/B1ApskxL9ZQ2+ZgoyOT0pjZ3N6+fznxRg/tvAI61O8j4GvtvuQpUXzLwatpWOm55yQkKKRyEvN96evFwaGluZg4n8/tTF8slPJQwRrQgoqaVCcn+EoTVCGOX3jF3fPfTZUGvxts1bbvQXT6j5N8Sj7a42/yQHYXxkNCswg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxOuDL3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68D9C116B1;
	Tue, 23 Jul 2024 02:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721701036;
	bh=gnkOYbEfx9zPzHePEL/WxD5v0iNAO66aAz2aJlnJpSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RxOuDL3mrORghbGY9jTuWQjgd2SP7GcjAZPVyjp3hU2M1TmgBi6NwPp8D9X5eUY/s
	 FaQ0XUpyCBoHtPyz3lY2HoOUMew0FAxFxtLotpL5EqZXj+D+Fx/HQ4YQQd+FejrfEI
	 Q9QT3y/Rdoy31gJeM1kqGRz1biqv/Lxy7q8mNEGCSlS9sivsTwN7lOpkoywP1llddd
	 jtiuFux3oh+090v6KBkgxvS0y1ou+qfNYv8hED6vpiWHbs4/qb2qD2g0XdbkiQZIDY
	 tKBvRxCBrN9e+2vQJ540AT1JpCsHiO6dQfhmuFnYxhSRyTj+ouGuc9cVSOIatcKgwi
	 UxvT5COn+7daQ==
Date: Mon, 22 Jul 2024 20:17:13 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: mfd: renesas,r9a08g045-vbattb:
 Document VBATTB
Message-ID: <20240723021713.GA40385-robh@kernel.org>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716103025.1198495-2-claudiu.beznea.uj@bp.renesas.com>

On Tue, Jul 16, 2024 at 01:30:15PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B. Add
> documentation for it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
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
>  .../mfd/renesas,r9a08g045-vbattb.yaml         | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml b/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
> new file mode 100644
> index 000000000000..30e4da65e2f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/renesas,r9a08g045-vbattb.yaml#
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
> +  ranges: true
> +
> +  interrupts:
> +    items:
> +      - description: tamper detector interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: tampdi

Don't really need -names with only 1 entry.

> +
> +  clocks:
> +    items:
> +      - description: VBATTB module clock
> +
> +  clock-names:
> +    items:
> +      - const: bclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: VBATTB module reset
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +patternProperties:
> +  "^clock-controller@1c+$":
> +    type: object
> +    description: VBATTCLK clock
> +
> +    properties:
> +      compatible:
> +        const: renesas,r9a08g045-vbattb-clk
> +
> +      reg:
> +        maxItems: 1
> +
> +      clocks:
> +        items:
> +          - description: input clock for VBATTCLK
> +
> +      clock-names:
> +        description: |
> +          Use xin if connected to an external crystal oscillator.
> +          Use clkin if connected to an external hardware device generating the
> +          clock.
> +        enum:
> +          - xin
> +          - clkin
> +
> +      '#clock-cells':
> +        const: 0
> +
> +      renesas,vbattb-load-nanofarads:
> +        description: load capacitance of the on board xtal
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 4000, 7000, 9000, 12500 ]
> +
> +    required:
> +      - compatible
> +      - reg
> +      - clocks
> +      - clock-names
> +      - '#clock-cells'
> +      - renesas,vbattb-load-nanofarads
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vbattb@1005c000 {
> +        compatible = "renesas,r9a08g045-vbattb";
> +        reg = <0x1005c000 0x1000>;
> +        ranges = <0 0 0x1005c000 0 0x1000>;
> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "tampdi";
> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
> +        clock-names = "bclk";
> +        power-domains = <&cpg>;
> +        resets = <&cpg R9A08G045_VBAT_BRESETN>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@1c {
> +            compatible = "renesas,r9a08g045-vbattb-clk";
> +            reg = <0 0x1c 0 0x10>;
> +            clocks = <&vbattb_xtal>;
> +            clock-names = "xin";
> +            #clock-cells = <0>;
> +            renesas,vbattb-load-nanofarads = <12500>;
> +        };

Is this really a separate device? Doesn't really look like it. This can 
all be moved to the parent node.

Rob


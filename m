Return-Path: <linux-rtc+bounces-3899-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C1EA83B06
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 09:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B4537B2803
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 07:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF28621B196;
	Thu, 10 Apr 2025 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHLwIe/8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B203220B819;
	Thu, 10 Apr 2025 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269801; cv=none; b=f6p4GB3b0fwYIFXGhQJYufMccdyLPcOcnmJzeDuiy9/Mq5lBLrDpVcFkp1WrU/901GjCefAGxsXme5qK5+AqIW0+GQ5/OrdLojF8nwjO8/Wi6Q/D6TsP3TToaodr0zQXwFpscY5iQljizuDsQCWBv8w3eHuEk+/LpMztSJGp59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269801; c=relaxed/simple;
	bh=pgPaGfdMAcLGht6GtgzTu7mpWhBpyFIPuLeMl1fltug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl+5LRamAqRUZrfET9GXi3mxZWD+6bOHoBeGnwCcMVc6wjwRHk10dG+MCmxeQ86GlW+BH+/umzodwTCnW5xYCoU/CSn1IKa7UskWGXz+QskmbmkxxWSUocypvGBlBiYHCC419/g8F3WulmYQ80FgCKrs3Cg2zxczKZcXlgU1sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHLwIe/8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF78C4CEDD;
	Thu, 10 Apr 2025 07:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744269801;
	bh=pgPaGfdMAcLGht6GtgzTu7mpWhBpyFIPuLeMl1fltug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHLwIe/8o7C43t3oFomCRXYTP5PnnDIjMva4j6gHEd4HpvZKZJXBczjkv3nuHmpYS
	 V5leEjkS7hTyA1/jeRaVpj+oGT/OerV0Z4oZyzz19Bk051vdCDjFX2wcMvCryyg8Df
	 3M0FHHZbyQCE9nFkbgKwh5cJ9TyHX0me19edDZyM1gduL134vIGesliZoeOSLOHNpX
	 se2xwQtnhicpnAEsFJ19PCiZ0/nuQRQOLktdxf/kS36rR//1E0Tm1wQP8hI5URclmR
	 Qm7HyLBNuiWP8GZ6/3/Y57jKoqnmI8tfRYAFe1LlRl4mkP4gVh0yj+fAdvCjQEo85/
	 89o2nINIlqH8g==
Date: Thu, 10 Apr 2025 09:23:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robh@kernel.org, alexander.stein@ew.tq-group.com, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: rtc: pcf85063: add binding for RV8063
Message-ID: <20250410-enchanted-uber-finch-c60afb@shite>
References: <20250409170916.47224-1-apokusinski01@gmail.com>
 <20250409170916.47224-4-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409170916.47224-4-apokusinski01@gmail.com>

On Wed, Apr 09, 2025 at 07:09:16PM GMT, Antoni Pokusinski wrote:
> Microcrystal RV8063 is a real-time clock module with SPI interface.
> 
> Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> index 2f892f8640d1..cb31c7619d66 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - microcrystal,rv8063

Bindings are before the users, so this cannot be patch 3/3.

>        - microcrystal,rv8263
>        - nxp,pcf85063
>        - nxp,pcf85063a
> @@ -44,7 +45,12 @@ properties:
>  
>    wakeup-source: true
>  
> +  spi-cs-high: true
> +
> +  spi-3wire: true
> +
>  allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>    - $ref: rtc.yaml#
>    - if:
>        properties:
> @@ -52,6 +58,7 @@ allOf:
>            contains:
>              enum:
>                - microcrystal,rv8263
> +              - microcrystal,rv8063

Keep the order.

>      then:
>        properties:
>          quartz-load-femtofarads: false
> @@ -65,12 +72,23 @@ allOf:
>        properties:
>          quartz-load-femtofarads:
>            const: 7000
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - microcrystal,rv8063
> +    then:
> +      properties:
> +        spi-cs-high: false
> +        spi-3wire: false
>  
>  required:
>    - compatible
>    - reg
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -90,3 +108,16 @@ examples:
>            };
>          };
>        };
> +
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@0 {
> +          compatible = "microcrystal,rv8063";

Messed indentation. Look at rest of the examples here and use the same
indentation.

Best regards,
Krzysztof



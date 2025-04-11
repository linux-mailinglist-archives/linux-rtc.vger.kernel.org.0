Return-Path: <linux-rtc+bounces-3939-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A2CA86656
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 21:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F09BC4A57EA
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 19:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A55280CF7;
	Fri, 11 Apr 2025 19:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7ydJPsP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535F4280A4F;
	Fri, 11 Apr 2025 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399654; cv=none; b=iZP+bXNOsdSLXsTlhWOLp1nPqG5uggbufOTDDpS0bC7gEQEZNjOmPHmufZ4s6jY58YdNLk65VHJjxpfVqteRrXHBMiEMHH55hWCbYAjz5p219oqSY62eGRe8TTq3g34Dw1SuiYbMZNlJWAY3R/VTfNMxJZN00p8FdEjMMs4l9dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399654; c=relaxed/simple;
	bh=kRwd5gJtNRsCotdgDRFs4LHQa9rK8LBgRlZhOw01IhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtIk4wIFLWzrl6KPtX3d04qFWQYa9S7KkcMqKKkN91Lk0ktw7JjHp2OK6OuNH1KA3BPaCifqhC3V2K+i2re9XUCFeItWbpLTOv648h8w3VMvq15fDHchikV8ZZjhsJOmWieXqo7maRnr7Ckrkx4/EmrcDIqfSqmoRah0Z4+svAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7ydJPsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917FDC4CEE2;
	Fri, 11 Apr 2025 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744399653;
	bh=kRwd5gJtNRsCotdgDRFs4LHQa9rK8LBgRlZhOw01IhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7ydJPsPEeV3TSuvLSlhE86aAHMSkckFhl6H51WeGqO2TbwoLWHDvUthQW0s2DBnF
	 3RTvz59cY7/xdGZaui9dFJUU7G51hZ1tBp76EFoe7oKCJOodGVVQ5WnyiiInT0ZUE8
	 iTKXv7o+axoVDIrri9lyrOMukH1OXnB/o9fpDrty5SEBdZ1Wq44SVYWjVH63F1SVTT
	 92uOWcnm+6K0c7C7r8tNIG0/m6r6ARjg1Ycg5p7Es41gQQtF/Vx3N5sbD2tyDar3p4
	 2z60AbWrnr+g+FAhlkrQ+J0FoxrkS1bPxX/pvAp4/XuHs5l9fWcChUGBzKWtwzAfsu
	 WNzDhDJU22EiQ==
Date: Fri, 11 Apr 2025 14:27:32 -0500
From: Rob Herring <robh@kernel.org>
To: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: pcf85063: add binding for RV8063
Message-ID: <20250411192732.GB3750226-robh@kernel.org>
References: <20250410202317.25873-1-apokusinski01@gmail.com>
 <20250410202317.25873-2-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410202317.25873-2-apokusinski01@gmail.com>

On Thu, Apr 10, 2025 at 10:23:15PM +0200, Antoni Pokusinski wrote:
> Microcrystal RV8063 is a real-time clock module with SPI interface.
> 
> Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> index 2f892f8640d1..86ac9c626144 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - microcrystal,rv8063
>        - microcrystal,rv8263
>        - nxp,pcf85063
>        - nxp,pcf85063a
> @@ -44,13 +45,19 @@ properties:
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
>          compatible:
>            contains:
>              enum:
> +              - microcrystal,rv8063
>                - microcrystal,rv8263
>      then:
>        properties:
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

Use consistent indentation. 4, not 2 here.

> +          reg = <0>;
> +          spi-cs-high;
> +          spi-3wire;
> +        };
> +      };

2 too many here.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


Return-Path: <linux-rtc+bounces-3920-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A346A84F17
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 23:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A9924C2001
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 21:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25612293440;
	Thu, 10 Apr 2025 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W845Ln1b"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2C1EDA39;
	Thu, 10 Apr 2025 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319633; cv=none; b=muZ6hmecrqoPvRtLGk4VXFeYlSYl8KRVUeSVMQ86f4IzXye27ebplrP4Cs9SFMwH/bioruzYwFOyteZNdqR++3De4MZHyUIM0eIma/dJkunHm10hearw2DJWp2fYWk7vG0hPfqvv2b9XjPAkJCLoQKGS9lO5uuVr2NC2lH50dvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319633; c=relaxed/simple;
	bh=PyZ19Zto2g311Bz6AKEgiRK+kx0zxDHd+b7mqXnsYqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkMy6iU6dab5uZgD+2A7YDLpLS0yorqDBGKrnx2OsA6j9ZoAocSsojn4cbziCctuJwFp3WrXJarLuvVGUk2cs7kBlYEEuIuc1WkesKKVj720pzU/yaY2MXZrIHLR+GdLWvqUJ2NYMmS0zBx3Gx/8X4YyvHwwF5kFTp+tKVKyONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W845Ln1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35013C4CEDD;
	Thu, 10 Apr 2025 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319632;
	bh=PyZ19Zto2g311Bz6AKEgiRK+kx0zxDHd+b7mqXnsYqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W845Ln1biz28JtaulDGfkCGt7swIlHSKQhOAAHE6f6JrPj8wMXN8+LsQe0gZDZ/sk
	 e0n2Y+fVhkzOvc8XEwW7tP95tOsuE9RUchu0w2Am51DAkajHhSIhC5j+wBO8rXRlVp
	 9WZ1CoYaAi/SnPuRYY9shpT4tyKhU/nzV2CVXbTtK9zcsKWXfLPyXo+DuTfxMbLCuC
	 eayxwJAbFFb0Y8rgmb9rBpVTH7I2QtbF7ebX8ykMY5zH/E4ma4+8NUewD8MYHHI6mQ
	 nbF1s2V0DIR2E4UtXnzDJrg5Gi5t2KPRpRX3A56TdQAHoshTeH8V2Ow5zQj6SHIbAE
	 oaft5tQdtfM0A==
Date: Thu, 10 Apr 2025 16:13:51 -0500
From: Rob Herring <robh@kernel.org>
To: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: rtc: add binding for RV8063
Message-ID: <20250410211351.GA1076944-robh@kernel.org>
References: <20250407193521.634807-1-apokusinski01@gmail.com>
 <20250407193521.634807-4-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407193521.634807-4-apokusinski01@gmail.com>

On Mon, Apr 07, 2025 at 09:35:21PM +0200, Antoni Pokusinski wrote:
> Microcrystal RV8063 is a real-time clock module with SPI interface.
> 
> Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)

Bindings come before users (driver).

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
> +          reg = <0>;
> +          spi-cs-high;
> +          spi-3wire;
> +        };
> +    };
> -- 
> 2.25.1
> 


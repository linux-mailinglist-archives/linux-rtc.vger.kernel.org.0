Return-Path: <linux-rtc+bounces-2869-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D5A08A53
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 09:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A12816819C
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 08:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19CF2080CB;
	Fri, 10 Jan 2025 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6f1If63"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F111207A33;
	Fri, 10 Jan 2025 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736498119; cv=none; b=u4uVDktFWBHBwJGj5rYe1DFvZoRAsXdha3B8zW+lLhJYWt6aoWDivMLyBgm8pg76qrAytKWeeCb2rqOqBnknHC6OeWpaTC/+iKSyvK+m1DhzMNug8UWhYalrvFJnYAvYet/0SCxvJ3EWBmHMzhr6LLldTC5YUcER9TBB/q0xukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736498119; c=relaxed/simple;
	bh=MzBvMN9HkHzray3OeY4EaDX+Ap9aBvW68LnofZBxd64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PS/LAt6dhhOptNoJASAq6gnXdvuoZ3LcyoexCqvbBOfel7Xe+UVaQTzPzvuAwyv1ELXjKwgIVtsNEZn44XL2wqNwuOw5hgwdsFrwfB2kkGf8j+y57Zrpq9kd8D1n7+3ZkOKK1Kddy5huuaJpexpWaeFDSEDNumyac+snQGNQ7UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6f1If63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B18C4CEDF;
	Fri, 10 Jan 2025 08:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736498116;
	bh=MzBvMN9HkHzray3OeY4EaDX+Ap9aBvW68LnofZBxd64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6f1If63+ZLLMAX9UCqnLdo8cf1JCrqgZJhMX6ZRWz3qP7z0DbUHL3ILf5pu5nKTk
	 9LxrnePdYZMY2wOJtxRXXArkSGVZEMjaW2Va5tuIoX7A2x1MdotPO5cavfkvk+uXG9
	 vzh1M41FmOgqlKTuNnhxUOZy+q4d2DNCGNJ7LeUVDOH//pDdUx73WCatfPiVSBUuLx
	 TlU+6SSYkj03vUDM7I2QzkEwyo6iMTd4vroL4F9GEdog0I+Ab+6/26Z2HoSIyKnUVp
	 aAlJlviIZTSMme43GSFHOTd9ZTuKR5jOkFxFcjYsZ1FO6F4AmVO6TJ4DBKRNyX7mPH
	 9yYkY77v2BMMQ==
Date: Fri, 10 Jan 2025 09:35:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: PavithraUdayakumar-adi <pavithra.u@analog.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: max31335: Add max31331 support
Message-ID: <5a5fttl5su6nqfnq7rs275tp3gpxauqacebacehxm7jj32dga4@tucnr4wkqnd5>
References: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
 <20250109-add_support_max31331_fix_3-v1-1-a74fac29bf49@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109-add_support_max31331_fix_3-v1-1-a74fac29bf49@analog.com>

On Thu, Jan 09, 2025 at 03:59:57PM +0530, PavithraUdayakumar-adi wrote:
> MAX31331 is an ultra-low-power, I2C Real-Time Clock RTC with flexible
> crystal support. While, MAX31335 offers higher precision, MEMS resonator,
> and integrated temperature sensor. MAX31331 uses I2C address as 0x68
> where as max31335 uses 0x69.
> 
> Changes: Added example for max31331 and modified the register address
> for max31335.

1. Why?
2. What does it mean "changes"? You did much more so I really do not
understand this paragraph.

> 
> Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
> ---
>  .../devicetree/bindings/rtc/adi,max31335.yaml      | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 

What changed here exactly?

> diff --git a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
> index 0125cf6727cc3d9eb3e0253299904ee363ec40ca..f249313bc485d7a6154ce684726d6a950405ef0e 100644
> --- a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
> +++ b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
> @@ -18,10 +18,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: adi,max31335
> +    enum:
> +      - adi,max31331
> +      - adi,max31335
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - enum: [0x68, 0x69]
>  
>    interrupts:
>      maxItems: 1
> @@ -57,9 +60,9 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>  
> -        rtc@68 {
> +        rtc@69 {
>              compatible = "adi,max31335";
> -            reg = <0x68>;
> +            reg = <0x69>;

Why? I already asked about this - the same question "Why"


>              pinctrl-0 = <&rtc_nint_pins>;
>              interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;
>              aux-voltage-chargeable = <1>;
> @@ -67,4 +70,15 @@ examples:
>              adi,tc-diode = "schottky";
>          };
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@68 {
> +            reg = <0x68>;
> +            compatible = "adi,max31331";

Drop this example, not necessary.

> +        };
> +    };
>  ...
> 
> -- 
> 2.25.1
> 


Return-Path: <linux-rtc+bounces-3604-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1332CA6E047
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Mar 2025 17:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C46E41887D10
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Mar 2025 16:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C02263F32;
	Mon, 24 Mar 2025 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYSAXdYo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ECA33C5;
	Mon, 24 Mar 2025 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742835335; cv=none; b=qkgjxLWGW9GOPymqt1YpG8ISaecs1QQkgnz2WqWjFnhX2MStwupu7DJOgxzBU0IqTNJ8BNxlUo3fpUVQFbcGpHsxPLCqlvvV0xOVoYGZIVvRQAFeoxoBaem10IYNS9POEMXVxNwUMvC5GphEVa5fVbQQxqTgjazp9arTemmeShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742835335; c=relaxed/simple;
	bh=leI/26fAMdgexlql7vDFs6dgMQzJt9QqAf7u9gfEMO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiy+sQV3XNqBxV3Yt5CTbuH1xeWzl+vcRl09a53jwRbfbmnSfRU0yxYOXLmY+MGfTEKm2eueamdWIzOJ+zZwH0gx2UcVqxGbyei7EVHH4ah/qYHtAE3AJNMVzqUfVLxOOF1SJXXMDr4xdtZEBNFbk1yL6SzBeq+844rKsSKbDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYSAXdYo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3487C4CEE9;
	Mon, 24 Mar 2025 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742835334;
	bh=leI/26fAMdgexlql7vDFs6dgMQzJt9QqAf7u9gfEMO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYSAXdYoQskTzAicwQysyjewZ7NgWvm2mB+vWKjVTyvbGNjJC6Mab0i8SvwvUHRe9
	 MKJcJgxQ5E2WckMD4Sm54HxuHHBk+u+IFwN0Iq83FhptK9Sa3Kxa6dStg4XQibQRzT
	 rGPzsm1oSPNaeDBF/tjXjbbvpttx6xLEfAtAhkQ58ljQn4nmasDhHb641OnLmKFla0
	 YB1YcJ+r3nxZGoZH6Dqiu8i1lofuhvZViOqh4B0JEY5pTMwyYxZ6+bEx1166zmm9Uf
	 P3ejB1+JDH+XGkSpJtIvSJ4lGMXl3ycbwTrjzP1drYVbfctBYrDnIgQyrYLxSA1g0j
	 rp4SKjETLLi8g==
Date: Mon, 24 Mar 2025 11:55:33 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 01/34] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Message-ID: <20250324165533.GA521455-robh@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
 <20250323-s2mpg10-v1-1-d08943702707@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-s2mpg10-v1-1-d08943702707@linaro.org>

On Sun, Mar 23, 2025 at 10:39:17PM +0000, André Draszik wrote:
> The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
> this binding.
> 
> It is a Power Management IC for mobile applications with buck
> converters, various LDOs, power meters, RTC, clock outputs, and
> additional GPIOs interfaces.
> 
> Unlike other Samsung PMICs, communication is not via I2C, but via the
> Samsung ACPM firmware, it therefore doesn't need a 'reg' property but a
> handle to the ACPM firmware node instead.

Can it be a child node of the ACPM node instead?

> 
> S2MPG10 can also act as a system power controller allowing
> implementation of a true cold-reset of the system.
> 
> Support for the other components will be added in subsequent future
> patches.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 34 ++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..ae8adb80b3af7ec3722c2a5718ad8fddf0a5df34 100644
> --- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> @@ -20,6 +20,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - samsung,s2mpg10-pmic
>        - samsung,s2mps11-pmic
>        - samsung,s2mps13-pmic
>        - samsung,s2mps14-pmic
> @@ -43,6 +44,12 @@ properties:
>      description:
>        List of child nodes that specify the regulators.
>  
> +  exynos,acpm-ipc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |

Don't need '|' if no formatting to preserve.

> +      Phandle to the ACPM node for when ACPM is used to communicate with the
> +      PMIC, rather than I2C.
> +
>    samsung,s2mps11-acokb-ground:
>      description: |
>        Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
> @@ -58,16 +65,39 @@ properties:
>        reset (setting buck voltages to default values).
>      type: boolean
>  
> +  system-power-controller: true
> +
>    wakeup-source: true
>  
>  required:
>    - compatible
> -  - reg
> -  - regulators
>  
>  additionalProperties: false
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s2mpg10-pmic
> +    then:
> +      properties:
> +        regulators: false
> +        samsung,s2mps11-acokb-ground: false
> +        samsung,s2mps11-wrstbi-ground: false
> +
> +      required:
> +        - exynos,acpm-ipc
> +
> +    else:
> +      properties:
> +        exynos,acpm-ipc: false
> +        system-power-controller: false
> +
> +      required:
> +        - reg
> +        - regulators
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.49.0.395.g12beb8f557-goog
> 


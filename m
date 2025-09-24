Return-Path: <linux-rtc+bounces-5017-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11508B9A879
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 17:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2EC5163A66
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 15:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4235D30F7FF;
	Wed, 24 Sep 2025 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNlsZ9wG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0963530DD04;
	Wed, 24 Sep 2025 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726721; cv=none; b=UrMp+o6bmJ+txq9Z3MasyOkQYHigory7ek2EbY9ESd4PBwH8Vi0Vj/2MU0ca76Dan9JggwWyRltbHMiwEY1BS1Y93vUeqeauYbN6R3bgkGb/85cF/gN/Z1tmetYErAVL16UWvpx8GeUH21Yjb3P4SXrkTIcns5UzfTrJ5IiMiZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726721; c=relaxed/simple;
	bh=SUYVX88sBXmaFKBWXfsMWhfFsGAcZ/n2RLIrnQxMb9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQ9SZIFVVjl5bO+pCVihRdOiPZyzgzAycwFigDTNb0xGj1xGEHv8dPRxxTpQQDmB1OeXItlh83w/QuYPsAe3uogMWmRAlsJpeNzvLuORT8pWX6908jZtr8YNQJo6REWMeieRJMy5qEaKmvCS31QjA6SU20SGlEVEbW7BkjDFHNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNlsZ9wG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C17AC4CEE7;
	Wed, 24 Sep 2025 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758726720;
	bh=SUYVX88sBXmaFKBWXfsMWhfFsGAcZ/n2RLIrnQxMb9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNlsZ9wGUh76ykwpAXfK/LBUst9rOpbPsD1A8s9sEgz0mDZQmSqrZy3nckKBbaBYs
	 pDf4N4AlbjyJeBRxbDtqgqNmnl4g54ZYmLSpbFFB8sj35FWx4914yk/Jm6jhmPriMx
	 Kcl89f8QWx4e6E3CtTib1rqjb9tk+wRFOKVYRObG0DeWGjpFtJj4/r4JouJxya0Gdy
	 IiOKxy57p2SBhNn1zms9Cd8kBAufC+MaOoLRAjBu9Yz4uI08e9lprR8HKcoHFJHM69
	 E3De3Q4lNdtNoUwZejNfIChfjIu3coHJwgPehev1a4O6DjBoKneyC7aBbU35NkZBXu
	 LztfJ/8NeOmig==
Date: Wed, 24 Sep 2025 10:11:59 -0500
From: Rob Herring <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/7] regulator: dt-bindings: add documentation for
 s2mps16-pmic regulators
Message-ID: <20250924151159.GA1725090-robh@kernel.org>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914124227.2619925-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914124227.2619925-2-ivo.ivanov.ivanov1@gmail.com>

On Sun, Sep 14, 2025 at 03:42:21PM +0300, Ivaylo Ivanov wrote:
> The S2MPS16 is a PMIC found in exynos8890 devices, which controls voltage
> regulators - 38 LDOs, of which 11 are used for CP, and 11 BUCKs, of which
> 1 is used for CP. Provide documentation for devicetree definitions,
> regulator naming patterns, etc.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/regulator/samsung,s2mps16.yaml   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps16.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps16.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps16.yaml
> new file mode 100644
> index 000000000..ede87d3b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps16.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/samsung,s2mps16.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S2MPS16 Power Management IC regulators
> +
> +maintainers:
> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +
> +description: |
> +  This is a part of device tree bindings for S2M and S5M family of Power
> +  Management IC (PMIC).
> +
> +  The S2MPS16 provides buck and LDO regulators.
> +
> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
> +  additional information and example.
> +
> +patternProperties:
> +  # 27 LDOs
> +  "^ldo([1-9]|1[0-3]|2[5-9]|3[0-8])$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:

You need '>' modifier to preserve paragraphs.

> +      Properties for single LDO regulator.
> +
> +      LDOs 14-24 are used for CP, and they're left unimplemented due to lack
> +      of documentation on them.

What does unimplemented mean? In some driver? If so, that's specific to 
a driver and not relevant to the binding.

> +
> +    required:
> +      - regulator-name
> +
> +  # 10 bucks
> +  "^buck([1-9]|1[0-1])$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Properties for single BUCK regulator.
> +
> +      BUCK 10 is used for CP, and it's left unimplemented due to lack of
> +      documentation on it.
> +
> +    required:
> +      - regulator-name
> +
> +additionalProperties: false
> -- 
> 2.43.0
> 


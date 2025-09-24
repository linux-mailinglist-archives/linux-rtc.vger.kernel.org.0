Return-Path: <linux-rtc+bounces-5018-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE9B9A85B
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 17:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF4767A3A59
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 15:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8B430DD37;
	Wed, 24 Sep 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efL/wNny"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807F30C629;
	Wed, 24 Sep 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726753; cv=none; b=kn/bBLmQXSo2vRX2Gi7iFojfW739qwsC0nkl5zf7yfw/ay0ZeCQ+bd0Xw7zfOd3KXUAZlYnf6sa04y3eiApZfZu+Wcl9NBr2z3FNnRl+2DW6Bo1cCUUVokMKXkJOyvUT6IzjCt2kG87CuDnx0CmXiE67RSfYgi1wGgmXHByfnD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726753; c=relaxed/simple;
	bh=hwtnYuX4uMKYRP133yb5efSBvaUxFXIPITUkKamP59I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFcwnfRPDmT97LZNmPM0UpcL64kiNDCyrnWRXgHgXBJpx+lnatODs9IIkKmSiv+aUvCNResBOm3kYF0/n2ZJAt7ImWk92KELTXXxXv0CLl60zL0gcUAiryiryzK7kISA2lec2SrdFrM9a2K+GMBn09XMzv5QHaKe7OcDzjCJIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efL/wNny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA7DC4CEE7;
	Wed, 24 Sep 2025 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758726753;
	bh=hwtnYuX4uMKYRP133yb5efSBvaUxFXIPITUkKamP59I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efL/wNnyu33yMVfSHyMy6eJ+2dtV6thjYoCU3y5LVqBQHgJuytf6RT58cPsNLO/85
	 0Qc6lRT660ISFlFNK5LFoOPiDGgvBkrJS2I1fQALgffezLMPUFDTu+WXjdHzEw7Vu9
	 LVOmsPrkMIN6ZWcjbT1tl+nS4WD5RohzTlCpc2M6/JwTsURUUKPPY7NTagtahQ6XnU
	 r1tZA9g9tm6/r17Tf0HuLdP+W/O1liMwFmoTsdcTnEbIG2nln3yun2XypNMoQD6Nx6
	 qqwQoW4jEySbKFDmFyfUlbVRPZ/721aBo9eq+APiZHqj4L+BHwlALI5avvUy6H0RaG
	 f/xybUSP5eUjA==
Date: Wed, 24 Sep 2025 10:12:32 -0500
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
Message-ID: <20250924151232.GB1725090-robh@kernel.org>
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

Also, drop 'documentation for' in the subject.

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
> +      Properties for single LDO regulator.
> +
> +      LDOs 14-24 are used for CP, and they're left unimplemented due to lack
> +      of documentation on them.
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


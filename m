Return-Path: <linux-rtc+bounces-3449-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEDDA5957A
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 14:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C1231640DC
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 13:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A961ADC97;
	Mon, 10 Mar 2025 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5OxAsUY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089B0A930;
	Mon, 10 Mar 2025 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611647; cv=none; b=gyyL2sWyv+sS/cZ2o9jC7deHBMWyvruq5yDM4FYZqHDABtNFZPr9DYX+p9uaf9tOcOSv+HSeqJEyWqFnQxfpCOK4xrWSJnJIX49qTVziqN7zyI7sCTzyGV5Po5Nm2l+J8yb3n0hk91m8SapcnRnovXATXg+qQP6eRsXB/2SJMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611647; c=relaxed/simple;
	bh=FXzUtZP8ZQXoyF6RHeI880XT9Xs/DQQHKgBSxBxYIzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs08qLTpwvBJeGCgKPKMxiShGIcBJxeMbrUhb9qi1kryPDtFjoO6XMg4K/A74/JsPXOp68Xrxo7gnT1hDCMrzEnB3Cn+pefr+H0iK14/1n2U+ObdWhebvrKpa904yiNrco4mya6lUurZxriYHarhJjYKWU06TJoCjUMi3aHOqPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5OxAsUY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC9AC4CEE5;
	Mon, 10 Mar 2025 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741611646;
	bh=FXzUtZP8ZQXoyF6RHeI880XT9Xs/DQQHKgBSxBxYIzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5OxAsUYsdP/SLsR4te8/+ml8BHJr5GALb0jiL4pLiZO0TniQQ1wdr+ozPSDh57XI
	 dcn4LYeGGlTZIs6FxI6612deLfjxeT1mwon5iIqwG2+QsFAdhvz4NuTU/DUrC8PtGF
	 E52sQ2ECnmmB4TBx3ciuPYMfItZsobbYKvGYYWMQoZoY7DMIvMFXgakikMUD2juXAd
	 JcDcbhLuyDxWgASSs+YTI29/87skfjGYYTxmQzMRTUyjWto1lmvOwdNBvAOCIAz5uR
	 OJ/V01TA43vyQLWdvWYzfhMtBcgDj53eLmYqUHsHCYES1DvT7Y3qKJnr3pwrEcwHXX
	 0CMyXMGp9rDGg==
Date: Mon, 10 Mar 2025 08:00:44 -0500
From: Rob Herring <robh@kernel.org>
To: Pankit Garg <pankit.garg@nxp.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, daniel.aguirre@nxp.com,
	shashank.rebbapragada@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: rtc: Add pcf85053a support
Message-ID: <20250310130044.GA3891357-robh@kernel.org>
References: <20250310063846.1867615-1-pankit.garg@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310063846.1867615-1-pankit.garg@nxp.com>

On Mon, Mar 10, 2025 at 12:08:45PM +0530, Pankit Garg wrote:
> Add device tree bindings for NXP PCF85053a RTC chip.

Looks fine, but this can be handled by trivial-rtc.yaml.

> 
> Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> ---
>  .../bindings/rtc/nxp,pcf85053a.yaml           | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> new file mode 100644
> index 000000000000..177afbe128d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,pcf85053a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PCF85053A Real Time Clock
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - Pankit Garg <pankit.garg@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pcf85053a
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@6f {
> +          compatible = "nxp,pcf85053a";
> +          reg = <0x6f>;
> +        };
> +      };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736dc2ee0..21a05e169564 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17158,6 +17158,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
>  F:	sound/soc/codecs/tfa989x.c
>  
> +NXP RTC PCF85053A DRIVER
> +M:	Pankit Garg<pankit.garg@nxp.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> +
>  NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
>  M:	Jonas Malaco <jonas@protocubo.io>
>  L:	linux-hwmon@vger.kernel.org
> -- 
> 2.25.1
> 


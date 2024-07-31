Return-Path: <linux-rtc+bounces-1658-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB89437B7
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 23:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D97DB1F228BC
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 21:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A5516C684;
	Wed, 31 Jul 2024 21:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9yVd2lX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB29516087B;
	Wed, 31 Jul 2024 21:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722460812; cv=none; b=SpicDaHrsGjDb2tm+E2eY6awjkOeSljN11XDe3E8vxx3SB8ImSpPVDnObpm2zkapu8cK/H8BjwHKrdwrHOAqmoKJ/PBH13F3zt0Mje0+EhOLrvXQO10Nl57SbiZf0M5KU31HyC/EQvxOjEgt6CV7gqT/Cd3Xxdzm+PoY/vp/RBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722460812; c=relaxed/simple;
	bh=5Fj1Q/lUDhBXjkp75CAf4AT/JrWwYEZL9sY+S+Ln4H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDsV3LNo5s84ix252GYK7GCP4/1krMOU8mDkA7O8oNPPsGkXy/VLfy2foiVCc+ljOVz1XDOPkX4N12pd4YeHG7KukxhmpQItGoD4k2z7wKRX+YA/8uZGpCBFN9pn9qhEN//0u57O8VyvfJ4hZ70FQYwYWgvYdkSl27qRnIe6Oks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9yVd2lX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5F3C116B1;
	Wed, 31 Jul 2024 21:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722460812;
	bh=5Fj1Q/lUDhBXjkp75CAf4AT/JrWwYEZL9sY+S+Ln4H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9yVd2lXbkzILnqi9yLyP/0rumTwOpKdrwEGjipJji17psciiK7ak469kCJhYOZLR
	 uiYU3C9cIWIBq3JJwhN/OIQpBxAQ2ydaiSR78/XbcOt8wIDs3KkuPgtsVudU/EoAma
	 HV/BoMPKY8ERxWDf/lpAnXY6FPtHCUHSpO3dDnZXwYv0DEBdsdsh5fKwFJqtVGDSgD
	 DBRNerbRJYhwuHBRuyMham5jD8yvlTWMSJuB43wOvqGiTHlu67dW6ZyM9cE63pnzxH
	 wy/JruOuhf4wRaDHZ6MezB7ltIUbsbKLjLR6tlJhr5CzZy4S4CY1Fc4xqTS+2Me9m1
	 GoKow52eZrq5w==
Date: Wed, 31 Jul 2024 15:20:10 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, christophe.leroy@csgroup.eu,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Message-ID: <20240731212010.GA1918811-robh@kernel.org>
References: <20240731150420.2217925-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731150420.2217925-1-Frank.Li@nxp.com>

On Wed, Jul 31, 2024 at 11:04:20AM -0400, Frank Li wrote:
> Convert dt-binding rcpm from txt to yaml format.
> Add fsl,ls1028a-rcpm compatible string.
> 
> Additional changes:
> - Add missed compatible string fsl,<chip>-rcpm.
> - Remove map fsl,<chip>-rcpm to fsl,qoriq-rcpm-<version>.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - add missed compatible string
> - Remove compatible string map table
> - use oneof Item to align compatible string map table
> - Fix typo 1045a
> ---
>  .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |   2 +-
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 101 ++++++++++++++++++
>  .../devicetree/bindings/soc/fsl/rcpm.txt      |  69 ------------
>  3 files changed, 102 insertions(+), 70 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> index 388102ae30cd8..3ec111f2fdc40 100644
> --- a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> +++ b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> @@ -42,7 +42,7 @@ properties:
>          minItems: 1
>      description:
>        phandle to rcpm node, Please refer
> -      Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +      Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  
>    big-endian:
>      $ref: /schemas/types.yaml#/definitions/flag
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> new file mode 100644
> index 0000000000000..762316ef4d150
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Run Control and Power Management
> +
> +description:
> +  The RCPM performs all device-level tasks associated with device run control
> +  and power management.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,ls1012a-rcpm
> +              - fsl,ls1021a-rcpm
> +              - fsl,ls1028a-rcpm
> +              - fsl,ls1043a-rcpm
> +              - fsl,ls1045a-rcpm
> +          - enum:

"const" for the fallbacks.

> +              - fsl,qoriq-rcpm-2.1+


> +        minItems: 1

Why? I don't see any .dts files without the fallback.

> +      - items:
> +          - enum:
> +              - fsl,p2041-rcpm
> +              - fsl,p3041-rcpm
> +              - fsl,p4080-rcpm
> +              - fsl,p5020-rcpm
> +              - fsl,p5040-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-1.0
> +        minItems: 1
> +      - items:
> +          - enum:
> +              - fsl,b4420-rcpm
> +              - fsl,b4860-rcpm
> +              - fsl,t4240-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-2.0
> +        minItems: 1
> +      - items:
> +          - enum:
> +              - fsl,t1040-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-2.1
> +        minItems: 1


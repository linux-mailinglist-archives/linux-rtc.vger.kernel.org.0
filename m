Return-Path: <linux-rtc+bounces-4164-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A636AAC4892
	for <lists+linux-rtc@lfdr.de>; Tue, 27 May 2025 08:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76B31179968
	for <lists+linux-rtc@lfdr.de>; Tue, 27 May 2025 06:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6981FDA92;
	Tue, 27 May 2025 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvBrMiwc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD91F55FA;
	Tue, 27 May 2025 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328165; cv=none; b=bXfbXFAgcMVmEYx5DfJoQqF4IgUFl/hrcko0h8EOOqiCbrCFgPQZytAC0NXwaterHCg6Iuij42qiVUQSyaUopJvO+YHeuBrRaw9wH6dgYO/PQYL1pbd+ADKtpeY+dDlf220Xe3kpo4rW3lM0M+agCfSCaNrZ9hda9xn1twDXPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328165; c=relaxed/simple;
	bh=oGFTTXHeeRELd+EmqNl5xHfn9/xSWthUbVZeziASEGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sr34s+3IZE27yj0mzvao0YzPpEpiyFpRly4zNgLD3mkesbwfIzUQIa4mbBKPEi0Y1Q02Pp8NRd2mcSI0icz9PBgApW2Cijn7zFQhYdUMggGl/NWP2/s+U8nRKMAO+riQrHKDI+GcveM8gg9pCiekxMnssWc8vyHMTN0jpGzX+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvBrMiwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859AEC4CEEA;
	Tue, 27 May 2025 06:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328165;
	bh=oGFTTXHeeRELd+EmqNl5xHfn9/xSWthUbVZeziASEGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XvBrMiwcV7I11c0Vw55ytK7Aajy1E8jfptMtqniNLS3JhjwcUw5xdznTgNVs9cl1k
	 zX9p7lPt+r+dnYkAmsyXFK/xfwjAw/ohBjJR59I0EDcKTIbxFSTy7k7Kb6tBnd4ALu
	 4+XScAxj8MUmhCnGj1A+0RG6l7oWNDa8DenZVojE5HYp+kx88vCWDeeF1s/XjahaCc
	 gpc2qsgAMDCsTpSbPJh5hvLPLJzkLymLb23TN0Z/csund+Uk0QJDhnJzHQCnf2R/wx
	 tplaGxQf13YAxusFMXnAyJy2EatoF/EcThHpGsxxGfh2OaET9E2qKgRRnjKA0gl2jP
	 hFHZiEE0DVnAw==
Date: Tue, 27 May 2025 08:42:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manuel Traut <manuel.traut@mt.com>, Marek Vasut <marex@denx.de>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Subject: Re: [PATCH v4 6/7] dt-bindings: rtc-rv8803: add tamper detection
 property node
Message-ID: <20250527-loutish-powerful-tiger-45a296@kuoka>
References: <20250521090552.3173-1-markus.burri@mt.com>
 <20250521090552.3173-7-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521090552.3173-7-markus.burri@mt.com>

On Wed, May 21, 2025 at 11:05:51AM GMT, Markus Burri wrote:
> The RV8901 RTC chip provides a function to store timestamp events.
> There are three input pins (EVIN1-3) available for triggering.
> The input pins can be configured and adapted according to the connected
> hardware.
> Add document of tamper detection properties for epson,rx8901 rtc chip.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  .../devicetree/bindings/rtc/epson,rx8900.yaml | 37 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> index 03af81754482..2682cbb9097d 100644
> --- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> +++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> @@ -9,9 +9,6 @@ title: EPSON RX8900 / Microcrystal RV8803 Real-Time Clock
>  maintainers:
>    - Marek Vasut <marex@denx.de>
>  
> -allOf:
> -  - $ref: rtc.yaml#
> -
>  properties:
>    compatible:
>      enum:
> @@ -33,6 +30,40 @@ properties:
>  
>    wakeup-source: true
>  
> +  tamper:
> +    description: Subnode for tamper configuration.
> +      This subnode is only available for epson,rx8901.

Drop last sentence. Don't repeat constraints in free form text.

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      buffer-overwrite:

Missing vendor prefix or where is this property defined?

> +        type: boolean
> +        description: Set the buffer mode to overwrite. Default is inhibit.

Why woould this be a board configuration? You described the desired
Linux feature or behavior, not the actual hardware. The bindings are
about the latter, so instead you need to rephrase the property and its
description to match actual hardware capabilities/features/configuration
etc.

> +
> +    patternProperties:
> +      "^evin-[0-3]$":

Commit says three, schema says four.

Where is this property defined? Which common schema? Or is it vendor
property?

> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 3
> +        maxItems: 3
> +        description: External event input pin configuration.
> +          The configuration is an array of tree values and contains
> +          "pull-resistor", "trigger" and "filter".

What are the values here? Missing constraints, missing defaults.

Best regards,
Krzysztof



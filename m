Return-Path: <linux-rtc+bounces-2637-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625F9DAA05
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 15:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96940B20F8F
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 14:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8FA1FF7B0;
	Wed, 27 Nov 2024 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyYlY9tY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B881FECCB;
	Wed, 27 Nov 2024 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732718604; cv=none; b=lhof7qsazHgMEWzuRTfIWQGykNmrMWAL3whCSi250OELr8pdr131qm4MNYkLfx6OymsCXVuYYG+VM2hWBH/xB1nc4N/3ibcygBG8uV5Oprx9e+VNSWQPejhS1OiN0yGGaF5okzKYFC5whicfORpYyq6gHs+ZfYozWqKyL7dUqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732718604; c=relaxed/simple;
	bh=XHWAmWVGdvPSI+4U+sDv7f5UDi0JdephXUkR8n9wRiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtpF8OYMcHcqmIWxVyYTcvWZvaxFDUEY3TGj8zB8qGhj8uoigBNiX/K4MOcmDV8mwzNbzncQQP8OE4iczr8SyuKPGVImhDJc9IXcUWnPABkhckjuVS3Pq2NTEfp9/CA4Fe6s/4MwiP8Av2h5HWmO/9tEnR6AcUVjt7R9U8UscwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyYlY9tY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CC7C4CED2;
	Wed, 27 Nov 2024 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732718604;
	bh=XHWAmWVGdvPSI+4U+sDv7f5UDi0JdephXUkR8n9wRiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyYlY9tYSOHhCWuC5K4ImBvKCQ81XUWA2iczhn7TbOMzKZ8VvZJt7W5NYQ2+qa32E
	 pj+hJD6IdyxuXBr47GpxUMTGDgJgna60SaEe09D9qzOlkpYNr6t0e3IK7WmzItGU/Z
	 w3xrwq0m3SrxfWJ3uH9EWAgzxtuf3KmVxihQ3ZYSGIVASZ3/EZA0UNuwJ4hKDAsbrN
	 hQ/5hrNK7wzBJyatOtywdc9MplvI70zECRxGLb3GoOdRdYkBUBYVc3hqZzePCxXAbJ
	 dyGcCrcpjhSyesv/niPTiGXh7PcfmlOAtfVYUEgE3nZal+lt3KOkDwGNXJyi1/1wFa
	 tPa5UAWsObtGQ==
Date: Wed, 27 Nov 2024 08:43:22 -0600
From: Rob Herring <robh@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241127144322.GA3454134-robh@kernel.org>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-2-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126114940.421143-2-ciprianmarian.costea@oss.nxp.com>

On Tue, Nov 26, 2024 at 01:49:37PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> RTC tracks clock time during system suspend and it is used as a wakeup
> source on S32G2/S32G3 architecture.
> 
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
> 
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> new file mode 100644
> index 000000000000..89414a0d926c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> +
> +maintainers:
> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> +
> +description:
> +  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup source.
> +  It is not kept alive during system reset and it is not battery-powered.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-rtc
> +      - items:
> +          - const: nxp,s32g3-rtc
> +          - const: nxp,s32g2-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ipg clock drives the access to the RTC iomapped registers
> +      - description: Clock source for the RTC module. Can be selected between
> +          4 different clock sources using an integrated hardware mux.
> +          On S32G2/S32G3 SoCs, 'source0' is the SIRC clock (~32KHz) and it is
> +          available during standby and runtime. 'source1' is reserved and cannot
> +          be used. 'source2' is the FIRC clock and it is only available during
> +          runtime providing a better resolution (~48MHz). 'source3' is an external
> +          RTC clock source which can be additionally added in hardware.

Is switching the clock source at run-time possible? For example, use the 
48MHz at runtime and switch to 32kHz or external clock during suspend. 
If so, you need to list all possible clock sources. Really, you probably 
should no matter what as you need to describe what's in the h/w, not 
configuration (though configuration is okay when it's fixed for the 
device).

> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - enum: [ source0, source1, source2, source3 ]

You can do:

maxItems: 5
items:
  - const: ipg
additionalItems:
  pattern: '^source[0-4]$'

Though I will have to relax constraints on 'additionalItems' to avoid a 
warning.

Rob


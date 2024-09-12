Return-Path: <linux-rtc+bounces-1963-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E96976918
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F8F21F21803
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 12:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7761A42D8;
	Thu, 12 Sep 2024 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DAIo6FX4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A466C1A42BF;
	Thu, 12 Sep 2024 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143977; cv=none; b=tUVBWedX7GYrJxnS51Y+uOnkeOkKIBlxKeaddZmPoIy8uzo85lalvH+9Tgu7eA0xxAhAXGLiYz4KnySGgxI51tnihr45f6Pokz0kwcMNPn3GSSGuBROqaBD/CXW7RRzXgC/wjRCSgPqWAU+hAINoSl/O0n8N//khFa4r2qLy0m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143977; c=relaxed/simple;
	bh=ToH+zDipXfwGo55Mq7g/S+uks3jDKxJpxp5vDDOfpm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRLZzsBU40mvYjqyEXOV/DXRxt0ADchZ1Gzod2K1QlD4lBYRN1j3nzekUrlyXh4ZBDXlNvmDi2+cQXXu3+t/EpZbpnTa5cyd62b6C/YbCmQyxRXZL0qcTiePRoQoGa33JyUWbBPM6Tsr98jNA1qUC0gvzAgdUDa7JeqHttwBzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DAIo6FX4; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB2D1240008;
	Thu, 12 Sep 2024 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726143966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKfjkFcEX6DpYDNLmxhtvKu4kYY/HQvZ1XsMqtB65BM=;
	b=DAIo6FX4aSo9YeZTODrzC/lgN4cpQzn9Gjg6Za31O/AygEO41xqMN1oxy3LTcbMckcV+eU
	QVzB06T7VVQWkauGca+CZChhV3RqTNnNC5bCsx1oU76m8axl6HwaQRWjX1JM5p7MxnsFOl
	kEaeERK9AwTjgRGKI5gvsCdkcnK1qnuZwpQqfU68LN9ARCPGs5E6Vx7+6bvo2K1GhfhgAf
	51/u0mG3YmEGNPpbZbIFGEEQcbLaTU2nSZyuAP4ZRVOaH/Vbf95mTIQJWZcC9EzUP8aRDC
	f60CIuJdFNWz6UvZwVqYnC4BnkipfBfc54mnVNAXsdOD9J36I/9xqlHg55GGwA==
Date: Thu, 12 Sep 2024 14:26:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Message-ID: <2024091212260302903af7@mail.local>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
 <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/09/2024 13:50:25+0300, Ciprian Marian Costea wrote:
> On 9/11/2024 9:21 PM, Conor Dooley wrote:
> > On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > 
> > > This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
> > > 
> > > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > ---
> > >   .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 79 +++++++++++++++++++
> > >   1 file changed, 79 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > new file mode 100644
> > > index 000000000000..8f78bce6470a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > @@ -0,0 +1,79 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> > > +
> > > +maintainers:
> > > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: nxp,s32g-rtc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  nxp,clksel:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Input clock selector. Choose between 0-SIRC and 2-FIRC.
> > > +      The reason for these IDs not being consecutive is because
> > > +      they are hardware coupled.
> > > +    enum:
> > > +      - 0  # SIRC
> > > +      - 2  # FIRC
> > 
> > Could you please explain why, given both clocks must be provided by
> > the hardware for there to be a choice, why choosing between them is a
> > property of the hardware?
> > 
> 
> Hello Conor,
> 
> Thanks for your review.
> 
> According to RTC module's clocking scheme for S32G2/S32G3 SoCs, it has three
> potential clock sources to select between:
>   1. FIRC:
>     - fast clock - ~48 MHz output
>     - chosen by default because it is proven to be more reliable (e.g:
> temperature drift).
>   2. SIRC:
>     - slow clock - ~32 kHz output
>     - When in Standby mode, SIRC_CLK is the only available clock for RTC.
> This is important because RTC module is used as a wakeup source from Suspend
> to RAM on S32G2/S32G3 SoC. Therefore, a temporary switch to SIRC clock is
> performed when entering Suspend to RAM.
> 
>   3. EXT_CLK:
>     - has not been tested/validated for those SoCs within NXP's downstream
> Linux. Therefore, I did not treat it, nor mention it, for the moment.
> 
> Now to answer your question, all above clocks are entering a RTCC[CLKSEL]
> (RTCC - RTC Control Register) mux. Therefore, a selection can be made,
> according to one's needs.
> 

Then should this mux be registered in the CCF so you can use the usual
clock node properties?

> I will add a shorter version of above information in the bindings
> documentation in the V2 of this patchset.
> 
> > > +
> > > +  nxp,dividers:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    description:
> > > +      An array of two u32 elements, the former encoding DIV512,
> > > +      the latter encoding DIV32. These are dividers that can be enabled
> > > +      individually, or cascaded. Use 0 to disable the respective divider,
> > > +      and 1 to enable it.
> > 
> > Please explain to me what makes this a property of the hardware and how
> > someone would go about choosing the divider settings for their hardware.
> > 
> 
> As per hardware RTC module clocking scheme, the output of the clock mux can
> be optionally divided by a combination of 512 and 32 (via other two input
> cascaded muxes) to give various count periods for different clock sources.
> 
> With respect to choosing the divider settings for custom hardware, it
> depends on the clock source being selected and the desired rollover time.
> For example, on S32G2 or S32G3 SoC based boards, using FIRC (~48-51 MHz)
> with DIV512 enabled results in a rollover time of aprox. 13 hours.
> 
> > > +    items:
> > > +      - description: div512
> > > +      - description: div32
> > > +
> > > +  clocks:
> > > +    maxItems: 3
> > 
> > I'd rather you provided an explicit items list here, explaining what
> > each of the tree clocks do.
> > 
> > Cheers,
> > Conor.
> > 
> 
> I will add such information in the V2 of this patchset.
> 
> Regards,
> Ciprian
> 
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: ipg
> > > +      - const: sirc
> > > +      - const: firc
> > > +
> > > +required:
> > > +  - clock-names
> > > +  - clocks
> > > +  - compatible
> > > +  - interrupts
> > > +  - nxp,clksel
> > > +  - nxp,dividers
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    rtc0: rtc@40060000 {
> > > +        compatible = "nxp,s32g-rtc";
> > > +        reg = <0x40060000 0x1000>;
> > > +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> > > +        clocks = <&clks 54>,
> > > +                 <&clks 55>,
> > > +                 <&clks 56>;
> > > +        clock-names = "ipg", "sirc", "firc";
> > > +        nxp,clksel = <2>;
> > > +        nxp,dividers = <1 0>;
> > > +    };
> > > -- 
> > > 2.45.2
> > > 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


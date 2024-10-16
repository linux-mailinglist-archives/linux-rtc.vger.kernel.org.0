Return-Path: <linux-rtc+bounces-2221-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9D19A0F54
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 18:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DDA61C220B6
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 16:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A8520F5B1;
	Wed, 16 Oct 2024 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YiV7boco"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D920E026;
	Wed, 16 Oct 2024 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094915; cv=none; b=AQjIp8uY2GdG9i8+VBip/bMuIqpWolcSINchEzxu64XUl0AKI7ypse+FbMxMq6R3GR4Q/cqkZOmJ3caBYqx3oTAtix65hCiR5LX6P+pU+OCo+ZgpgkvHcN2NhD6sfIR+g1wPVxJfFOw/qA9DKbW8vIavUWyKxhmLYJ26G3W9d0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094915; c=relaxed/simple;
	bh=jBooSS2vXvH048MLHGPfi8vqD/KGcWJg1Ivuptbjel0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLr5ijpMR9vFJkp7udtU/8tI/ItUwIEbsF+SNKvGccfGIq5KCE4KV7vmEzg+vrBY1NCrDyhqCX5myFjGOUgMW4BHq87XwLBrUhM4p1bHwJHiZ7FCh6U11XPvme23SNheLvchtSk7SqLIqO+DFk9gdoEqQ7dDJrmWROcE6T7Rjuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YiV7boco; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 862AFC0007;
	Wed, 16 Oct 2024 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729094904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QoQSQVa/mheJjIZPZM0X9xv2P9atatHsLsTuLCYWfYw=;
	b=YiV7bocoGYQLRsGJ590j1uk+okOPrc4k+LKlBohj0I3IvKJLwoXI7UuCcCfr5emncFwalc
	fJS9Oc+rGFXmXCBWv41kzp/6ojER95OUlkDxehvoBY4S5fqdwvMxh/f5gEsJw3pvBH3yfh
	hwqdvW1k01uZfcrN4JNH+WHitMqBx4zZrb07IAM6pJAU8WjkoE81lFbNnEBiTZ/Oc/h2S2
	jqLYY/quEkyt3KGrBgS0V7dsNbX+qOfSYzsdfPIBXa5ZFKw2E1ydG4dHiAdyfRgoTCd69H
	VlRz153F8NelpMa3VJ4S2fdzkQ28/QEGxi/8QUoP9fOqh6TKqgYAviWW8Ge1eg==
Date: Wed, 16 Oct 2024 18:08:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241016160823c22ccb22@mail.local>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
 <20241015105133.656360-2-ciprianmarian.costea@oss.nxp.com>
 <20241015211540.GA1968867-robh@kernel.org>
 <20241015212717.GA1983714-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015212717.GA1983714-robh@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 15/10/2024 16:27:17-0500, Rob Herring wrote:
> On Tue, Oct 15, 2024 at 04:15:40PM -0500, Rob Herring wrote:
> > On Tue, Oct 15, 2024 at 01:51:30PM +0300, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > 
> > > This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
> > > 
> > > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > ---
> > >  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 102 ++++++++++++++++++
> > >  1 file changed, 102 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > new file mode 100644
> > > index 000000000000..3a77d4dd8f3d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > @@ -0,0 +1,102 @@
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
> > > +    oneOf:
> > > +      - enum:
> > > +          - nxp,s32g2-rtc
> > > +      - items:
> > > +          - const: nxp,s32g3-rtc
> > > +          - const: nxp,s32g2-rtc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  "#clock-cells":
> > > +    const: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: ipg clock drives the access to the
> > > +          RTC iomapped registers
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: ipg
> > > +
> > > +  assigned-clocks:
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Runtime clock source. It must be a clock
> > > +            source for the RTC module. It will be disabled by hardware
> > > +            during Standby/Suspend.
> > > +      - description: Standby/Suspend clock source. It is optional
> > > +            and can be used in case the RTC will continue ticking during
> > > +            platform/system suspend. RTC hardware module contains a
> > > +            hardware mux for clock source selection.
> > 
> > If the RTC h/w contains a mux, then your mux inputs should be listed in 
> > 'clocks', not here.
> > 
> > > +
> > > +  assigned-clock-parents:
> > > +    description: List of phandles to each parent clock.
> > > +
> > > +  assigned-clock-rates:
> > > +    description: List of frequencies for RTC clock sources.
> > > +            RTC module contains 2 hardware divisors which can be
> > > +            enabled or not. Hence, available frequencies are the following
> > > +            parent_freq, parent_freq / 512, parent_freq / 32 or
> > > +            parent_freq / (512 * 32)
> > 
> > In general, assigned-clocks* do not need to be documented and should 
> > never be required.
> > 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - "#clock-cells"
> > > +  - clocks
> > > +  - clock-names
> > > +  - assigned-clocks
> > > +  - assigned-clock-parents
> > > +  - assigned-clock-rates
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    rtc0: rtc@40060000 {
> > > +        compatible = "nxp,s32g3-rtc",
> > > +                   "nxp,s32g2-rtc";
> > > +        reg = <0x40060000 0x1000>;
> > > +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> > > +        #clock-cells = <1>;
> > > +        clocks = <&clks 54>;
> > > +        clock-names = "ipg";
> > > +        /*
> > > +         * Configuration of default parent clocks.
> > > +         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
> > > +         * 4-7 IDs are Suspend/Standby clock sources.
> > > +         */
> > > +        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
> > 
> > That's weird...
> > 
> > > +        assigned-clock-parents = <&clks 56>, <&clks 55>;
> > 
> > I'd expect these should be in 'clocks'. I don't think this node should 
> > be a clock provider unless it provides a clock to something outside the 
> > RTC.
> > 
> > Looks like you are just using assigned-clocks to configure the clock mux 
> > in the RTC. That's way over complicated. Just define a vendor specific 
> > property with the mux settings. 
> 
> I just read v1 and got told use the clock framework...
> 
> I disagree completely. Tons of h/w blocks have the ability to select 
> (internal to the block) from multiple clock sources. Making the block a 
> clock provider to itself is completely pointless and an overkill, and 
> we *never* do that. Any display controller or audio interface has 
> mutiple clock sources as just 2 examples.

And in 6 months, we are going to learn that the rtc is used to clock the
wifi chip or whatever and we are going to need to add everything in the
CCF and we will have an unused property that we are going to have to
support forever to avoid breaking the ABI. This already happened...

> 
> However, I don't see why you need the divider config in DT. Can't you 
> figure out what divider you need based on input frequency? The output 
> frequency should be fixed, right?
> 
> Rob

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


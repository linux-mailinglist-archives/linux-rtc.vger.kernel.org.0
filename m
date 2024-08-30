Return-Path: <linux-rtc+bounces-1817-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7E966C0D
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Aug 2024 00:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FF7BB2300F
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 22:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0991BB6BF;
	Fri, 30 Aug 2024 22:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YcyxeCeR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97C2AE84;
	Fri, 30 Aug 2024 22:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725055617; cv=none; b=lHAx+kq30OnA+XHx2/I+autDvdeTvzxRKhNV3i3W9YG+jH5FldU3FYBw0sFVYCkEhXJq3btFKlFSheAzjjOwNcNs2dwu0VIJlLTJY8nyspvJ4pWnD7zgWXoX7WskGaYYk7RGGkHGhLnABGmKVfH6tqd/6e41bs9bYJYFMLgfaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725055617; c=relaxed/simple;
	bh=7bN0sMienvBAeh25nZnD/ikZz9WMFpkRfUC/yMfuCjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJXnBze2JWNbMq3Ag5r6KXRvFFSIoMRf6l5ewkq0ljE1vP/sOAh/w8XOYJFrQf14eVSj2brNti/MChUbncnyy8//MaO/oIMkaTfCT5n3KfFni8+wcwSUDhMiW0zLKTsnbvudMc8vb+ZieWObqK6KAQ9Dae7gsc3SVCZkcacoJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YcyxeCeR; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 544CF20002;
	Fri, 30 Aug 2024 22:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725055606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l8qBh0nmHVI2zsvlOYgpiaVNXL8o7RxXMCFhilguwxA=;
	b=YcyxeCeRcaegOnBeFj8fQRR/WQZ7T8h4KoG4bBSLoWz1XL8WOZfZ0i1cBnOF5YiVgxaX1e
	UqzdotYf3mfzJhfN2yYUu/HlNvWeCTicnHf8A1BuiFY42Bp8yJrj0yeDQ4VdoYeKE9uZRL
	V8HvwOiyRkBsU1cA7cvS4PTHgpFK5x3lAD4pM0zLdAOQD1ftfpCIwYHUQHHvbEV0EQgzT8
	Z1WU8Vhk4aBohSSD9l2A8JTalLx3u2wR974JunW2jYixLyE/etNgodo/XlYNqzNEv/sRFd
	+p5eIODFyJ0tXSZoJbO4LukcHTmtOrIigzHFIYPoBMnKhUwpPbmMWMT0GCwc/g==
Date: Sat, 31 Aug 2024 00:06:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, geert+renesas@glider.be,
	mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Message-ID: <20240830220644b8b36293@mail.local>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
 <20240830174633.GA559043-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830174633.GA559043-robh@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 30/08/2024 12:46:33-0500, Rob Herring wrote:
> On Fri, Aug 30, 2024 at 04:02:07PM +0300, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > 
> > The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> > the tamper detector and a small general usage memory of 128B. Add
> > documentation for it.
> > 
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> > 
> > Changes in v3:
> > - moved the file to clock dt bindings directory as it is the
> >   only functionality supported at the moment; the other functionalities
> >   (tamper detector, SRAM) are offered though register spreaded
> >   though the address space of the VBATTB IP and not actually
> >   individual devices; the other functionalities are not
> >   planned to be supported soon and if they will be I think they
> >   fit better on auxiliary bus than MFD
> > - dropped interrupt names as requested in the review process
> > - dropped the inner node for clock controller
> > - added #clock-cells
> > - added rtx clock
> > - updated description for renesas,vbattb-load-nanofarads
> > - included dt-bindings/interrupt-controller/irq.h in examples section
> > 
> > Changes in v2:
> > - changed file name and compatible
> > - updated title, description sections
> > - added clock controller part documentation and drop dedicated file
> >   for it included in v1
> > - used items to describe interrupts, interrupt-names, clocks, clock-names,
> >   resets
> > - dropped node labels and status
> > - updated clock-names for clock controller to cope with the new
> >   logic on detecting the necessity to setup bypass
> > 
> >  .../clock/renesas,r9a08g045-vbattb.yaml       | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
> > new file mode 100644
> > index 000000000000..29df0e01fae5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/renesas,r9a08g045-vbattb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas Battery Backup Function (VBATTB)
> > +
> > +description:
> > +  Renesas VBATTB is an always on powered module (backed by battery) which
> > +  controls the RTC clock (VBATTCLK), tamper detection logic and a small
> > +  general usage memory (128B).
> > +
> > +maintainers:
> > +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a08g045-vbattb
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: tamper detector interrupt
> > +
> > +  clocks:
> > +    items:
> > +      - description: VBATTB module clock
> > +      - description: RTC input clock (crystal oscillator or external clock device)
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bclk
> > +      - const: rtx
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    items:
> > +      - description: VBATTB module reset
> > +
> > +  renesas,vbattb-load-nanofarads:
> 
> Use defined units, don't add your own. So -picofarads should work for 
> you.

We have a generic quartz-load-femtofarads property for RTCs which is
what you define because the driver has VBATTB_XOSCCR_XSEL_4_PF which I
guess is 4 pF which is 0.004 nF and 4000 fF.

> 
> > +    description: load capacitance of the on board crystal oscillator
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 4000, 7000, 9000, 12500 ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - '#clock-cells'
> > +  - power-domains
> > +  - resets
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    vbattb@1005c000 {
> 
> clock-controller@...
> 
> > +        compatible = "renesas,r9a08g045-vbattb";
> > +        reg = <0x1005c000 0x1000>;
> > +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
> > +        clock-names = "bclk", "rtx";
> > +        #clock-cells = <1>;
> > +        power-domains = <&cpg>;
> > +        resets = <&cpg R9A08G045_VBAT_BRESETN>;
> > +        renesas,vbattb-load-nanofarads = <12500>;
> > +    };
> > -- 
> > 2.39.2
> > 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


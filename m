Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581D43EFFDC
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Aug 2021 11:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhHRJEx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Aug 2021 05:04:53 -0400
Received: from foss.arm.com ([217.140.110.172]:38388 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229780AbhHRJEv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 18 Aug 2021 05:04:51 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EA6A101E;
        Wed, 18 Aug 2021 02:04:16 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F7D53F40C;
        Wed, 18 Aug 2021 02:04:14 -0700 (PDT)
Date:   Wed, 18 Aug 2021 10:04:07 +0100
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 02/11] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210818100407.7cf7cfb7@slackpad.fritz.box>
In-Reply-To: <20210817073810.7stuzrppyjf4spab@gilmour>
References: <20210723153838.6785-1-andre.przywara@arm.com>
        <20210723153838.6785-3-andre.przywara@arm.com>
        <20210726144137.6dauuxdssu7yszox@gilmour>
        <20210802013938.29fa18ed@slackpad.fritz.box>
        <20210817073810.7stuzrppyjf4spab@gilmour>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 17 Aug 2021 09:38:10 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

Hi Maxime,

> On Mon, Aug 02, 2021 at 01:39:38AM +0100, Andre Przywara wrote:
> > On Mon, 26 Jul 2021 16:41:37 +0200
> > Maxime Ripard <maxime@cerno.tech> wrote:
> >   
> > > Hi,
> > > 
> > > On Fri, Jul 23, 2021 at 04:38:29PM +0100, Andre Przywara wrote:  
> > > > Add the obvious compatible name to the existing RTC binding.
> > > > The actual RTC part of the device uses a different day/month/year
> > > > storage scheme, so it's not compatible with the previous devices.
> > > > Also the clock part is quite different, as there is no external 32K LOSC
> > > > oscillator input.
> > > > 
> > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > >
> > > > ---
> > > >  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > > > index beeb90e55727..d8a6500e5840 100644
> > > > --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > > > +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > > > @@ -26,6 +26,7 @@ properties:
> > > >            - const: allwinner,sun50i-a64-rtc
> > > >            - const: allwinner,sun8i-h3-rtc
> > > >        - const: allwinner,sun50i-h6-rtc
> > > > +      - const: allwinner,sun50i-h616-rtc
> > > >  
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -104,6 +105,19 @@ allOf:
> > > >            minItems: 3
> > > >            maxItems: 3
> > > >  
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: allwinner,sun50i-h616-rtc
> > > > +
> > > > +    then:
> > > > +      properties:
> > > > +        clock-output-names:
> > > > +          minItems: 3
> > > > +          maxItems: 3    
> > > 
> > > You don't need both of them when they are equal
> > >   
> > > > +        clocks: false
> > > > +    
> > > 
> > > It's not entirely clear to me what those clocks are about though. If we
> > > look at the clock output in the user manual, it looks like there's only
> > > two clocks that are actually being output: the 32k "fanout" clock and
> > > the losc. What are the 3 you're talking about?]  
> > 
> > I see three: the raw SYSTEM "CLK32K_LOSC", the RTC input + debounce
> > clock (/32), and the multiplexed PAD.  
> 
> But the input and debounce clock is only for the RTC itself right? So it
> should be local to the driver and doesn't need to be made available to
> the other drivers

I understood "debounce" as being the clock used for the pinctrl
debouncer. What would it debounce otherwise? Do you think that this
"debounce circuit" is something internal to the RTC and is totally
irrelevant for us?

But in general I looked at how many *different* clocks this diagram
describes, and I count: one unaltered ("SYSTEM"), one "div by
32" (RTC/debounce), and one multiplexed. My aim was to avoid
DT binding changes when we later discover we do need one of them for
something (as happened in the past). So three seemed to be the safe
choice here, to avoid surprises. In the worst case we just will never
reference one of them.

> Either way, what this list is must be documented.

You mean to overwrite the "description" stanza for clock-output-names?
And can this be done in the per-SoC parts in the later part of the
binding, keeping the existing description?

Cheers,
Andre

> 
> > > Also, it looks like the 32k fanout clock needs at least the hosc or
> > > pll-periph in input, so we probably don't want to ask for no parent
> > > clock?  
> > 
> > Well, we never seem to reference the HOSC this way, this was always
> > somewhat explicit. And yes, there is PLL-PERIPH as an input, but we
> > don't support this yet. So I went with 0 input clocks *for now*: the
> > driver can then ignore all clocks, so any clock referenced in the DT
> > later won't cause any harm. This will all be addressed by Samuel's RTC
> > clock patch, which will also touch the H6, IIRC. And it looks like we
> > will need to touch the binding anyway then, but can then just *extend*
> > this.  
> 
> You mentioned that series several times already and never provided an
> explanation for what it was supposed to be doing except fixing
> everything. What's the general plan for that series?
> 
> Maxime


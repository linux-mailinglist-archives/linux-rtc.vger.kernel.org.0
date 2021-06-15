Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA873A7E27
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jun 2021 14:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhFOM1R (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Jun 2021 08:27:17 -0400
Received: from foss.arm.com ([217.140.110.172]:34206 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229520AbhFOM1Q (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 15 Jun 2021 08:27:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40AF331B;
        Tue, 15 Jun 2021 05:25:11 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068833F719;
        Tue, 15 Jun 2021 05:25:08 -0700 (PDT)
Date:   Tue, 15 Jun 2021 13:24:40 +0100
From:   Andre Przywara <andre.przywara@arm.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Ondrej Jirman <megous@megous.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 03/17] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210615132440.55793ec5@slackpad.fritz.box>
In-Reply-To: <56ad752b-b1c2-cb05-be8b-71c29f271ec9@sholland.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-4-andre.przywara@arm.com>
 <99a2069b-99e9-9b47-12a6-aae01c7f59dc@sholland.org>
 <20210607135910.63560ffc@slackpad.fritz.box>
 <56ad752b-b1c2-cb05-be8b-71c29f271ec9@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 7 Jun 2021 23:23:04 -0500
Samuel Holland <samuel@sholland.org> wrote:

Hi Samuel,

> On 6/7/21 7:59 AM, Andre Przywara wrote:
> > On Thu, 20 May 2021 21:37:34 -0500
> > Samuel Holland <samuel@sholland.org> wrote:
> > 
> > Hi,
> >   
> >> On 5/19/21 5:41 AM, Andre Przywara wrote:  
> >>> Add the obvious compatible name to the existing RTC binding.
> >>> The actual RTC part of the device uses a different day/month/year
> >>> storage scheme, so it's not compatible with the previous devices.
> >>>
> >>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >>> ---
> >>>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 5 ++++-
> >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> >>> index b1b0ee769b71..178c955f88bf 100644
> >>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> >>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> >>> @@ -26,6 +26,7 @@ properties:
> >>>            - const: allwinner,sun50i-a64-rtc
> >>>            - const: allwinner,sun8i-h3-rtc
> >>>        - const: allwinner,sun50i-h6-rtc
> >>> +      - const: allwinner,sun50i-h616-rtc
> >>>  
> >>>    reg:
> >>>      maxItems: 1
> >>> @@ -97,7 +98,9 @@ allOf:
> >>>        properties:
> >>>          compatible:
> >>>            contains:
> >>> -            const: allwinner,sun50i-h6-rtc
> >>> +            enum:
> >>> +              - allwinner,sun50i-h6-rtc
> >>> +              - allwinner,sun50i-h616-rtc
> >>>  
> >>>      then:
> >>>        properties:
> >>>     
> >>
> >> This binding is missing a clock reference for the pll-periph0-2x input
> >> to the 32kHz clock fanout.  
> > 
> > Right. So do I get this correctly that we don't model the OSC24M input
> > explicitly so far in the DT? I only see one possible input clock, which
> > is for an optional 32K crystal oscillator.
> > And this means we need to change some code also? Because at the moment
> > a clock specified is assumed to be the 32K OSC, and having this clock
> > means we switch to the external 32K OSC.  
> 
> Right. The code would need updates to follow the binding.

I changed the binding for now to not allow any clock, and the code to
ignore any clocks when the H616 compatible is used. This way we can
extend this later without breaking anything.

> > And who would decide which clock source to use? What would be the
> > reason to use PLL_PERIPH(2x) over the RC16M based clock or the
> > divided down 24MHz?  
> 
> Because it would be more accurate. 24MHz/750 == 32000 Hz, while the RTC
> expects 32768 Hz.

I thought about this as well, but this means there is no reason to not
use the PLL? At least not for Linux (normal operation with PLLs
running anyway)? This situation is different for the other SoCs, because
boards *might* have a separate and more precise 32K crystal.
So we could code this similar to the other SoCs: If we have a clock
property defined, we assume it's pointing to the PLL and switch to use
it?

But, looking at the diagram in the manual (and assuming it's
correct), the PLL based clock can only be routed to the pad, but cannot
be used for the RTC. That seems to be also the case for the T5, which
has an external LOSC pin.
 
> > So shall we ignore the PLL based input clock for now, put "0 input
> > clocks" in the current binding, then later on extend this to allow
> > choosing the PLL? And have it that way that having the PLL reference
> > means we use it?  
> 
> No, the device tree represents the hardware, not whatever happens to be
> used by Linux drivers at the time. It should be in the binding
> regardless of what the driver does with it.

I understand that very well, but was just looking for a solution where
we can go ahead with an easier solution *now*. I am afraid implementing
this annoying RTC special snowflake properly will just delay the whole
series.
In the long run your "D1 & friends" extra RTC clock driver looks the
right way out, but it will probably take some more time to get this
merged.
 
> Though the circular dependency between the clock providers does cause
> problems. We cannot get a clk_hw for the PLL-based clock, so we would
> have to hardcode a global name for it, which means we aren't really
> using the device tree.

I start to wonder how much business Linux really has in controlling all
those RTC details. The current code happens to work, because everything
is setup correctly already, on reset.

> We already see this "not really using the binding" with the other CCUs:
> the H616 CCU hardcodes the name "osc24M", while the A100 CCU hardcodes
> "dcxo24M" for the same clock. So moving that clock into the RTC clock
> provider would require using both names in one clk_hw simultaneously (or
> rather fixing the CCU drivers to get a clk_hw from the DT instead of
> referencing by name).
> 
> And trying to deal with optional clocks by index is only going to get
> more painful over time. For example, with the R329 and D1, the RTC has
> the following inputs:
>  * DCXO24M (unless you model it inside the RTC)
>  * External OSC32k (optional!)
>  * The RTC bus gate/reset from the PRCM
>  * R-AHB from the PRCM for the RTC SPI clock domain
> 
> So it seems time to start using clock-names in the RTC binding.

Yes, that sounds reasonable. It's just a shame that we keep changing
the RTC bindings, and so creating a lot of incompatibility on the way.

> >> It is also missing a clock reference to the RTC register gate (and that
> >> clock is in turn missing from the r_ccu driver).  
> > 
> > Do you mean a gate bit somewhere in the PRCM? Do you have any
> > pointer/documentation for that?  
> 
> Yes, it's bit 0 of PRCM+0x20c, documented in the BSP[1], used in
> mainline[2], and verified by experiment.

I can confirm this, also by experimentation. And the H6 seems to have
the same bit.
But what purpose would this bit solve? I don't see a good reason to
describe this in the DT, it's more like a turn-off bit for firmware?

Cheers,
Andre

 
> [1]:
> https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-4.9-sun50iw9/drivers/clk/sunxi/clk-sun50iw9.h#L169
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c#n129
> 
> > Cheers,
> > Andre  
> 
> Regards,
> Samuel


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23AE39DD2C
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jun 2021 14:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhFGNBJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Jun 2021 09:01:09 -0400
Received: from foss.arm.com ([217.140.110.172]:60968 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230145AbhFGNBJ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 7 Jun 2021 09:01:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 904C712FC;
        Mon,  7 Jun 2021 05:59:17 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 690443F694;
        Mon,  7 Jun 2021 05:59:15 -0700 (PDT)
Date:   Mon, 7 Jun 2021 13:59:10 +0100
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
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 03/17] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210607135910.63560ffc@slackpad.fritz.box>
In-Reply-To: <99a2069b-99e9-9b47-12a6-aae01c7f59dc@sholland.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
        <20210519104152.21119-4-andre.przywara@arm.com>
        <99a2069b-99e9-9b47-12a6-aae01c7f59dc@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 20 May 2021 21:37:34 -0500
Samuel Holland <samuel@sholland.org> wrote:

Hi,

> On 5/19/21 5:41 AM, Andre Przywara wrote:
> > Add the obvious compatible name to the existing RTC binding.
> > The actual RTC part of the device uses a different day/month/year
> > storage scheme, so it's not compatible with the previous devices.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > index b1b0ee769b71..178c955f88bf 100644
> > --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > @@ -26,6 +26,7 @@ properties:
> >            - const: allwinner,sun50i-a64-rtc
> >            - const: allwinner,sun8i-h3-rtc
> >        - const: allwinner,sun50i-h6-rtc
> > +      - const: allwinner,sun50i-h616-rtc
> >  
> >    reg:
> >      maxItems: 1
> > @@ -97,7 +98,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: allwinner,sun50i-h6-rtc
> > +            enum:
> > +              - allwinner,sun50i-h6-rtc
> > +              - allwinner,sun50i-h616-rtc
> >  
> >      then:
> >        properties:
> >   
> 
> This binding is missing a clock reference for the pll-periph0-2x input
> to the 32kHz clock fanout.

Right. So do I get this correctly that we don't model the OSC24M input
explicitly so far in the DT? I only see one possible input clock, which
is for an optional 32K crystal oscillator.
And this means we need to change some code also? Because at the moment
a clock specified is assumed to be the 32K OSC, and having this clock
means we switch to the external 32K OSC.
And who would decide which clock source to use? What would be the
reason to use PLL_PERIPH(2x) over the RC16M based clock or the
divided down 24MHz?

So shall we ignore the PLL based input clock for now, put "0 input
clocks" in the current binding, then later on extend this to allow
choosing the PLL? And have it that way that having the PLL reference
means we use it?

> It is also missing a clock reference to the RTC register gate (and that
> clock is in turn missing from the r_ccu driver).

Do you mean a gate bit somewhere in the PRCM? Do you have any
pointer/documentation for that?

Cheers,
Andre

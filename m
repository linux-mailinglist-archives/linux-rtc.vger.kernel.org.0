Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABBF3A9E62
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 17:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234341AbhFPPCX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Jun 2021 11:02:23 -0400
Received: from foss.arm.com ([217.140.110.172]:39554 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234293AbhFPPCW (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 16 Jun 2021 11:02:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53CBA31B;
        Wed, 16 Jun 2021 08:00:16 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 514D93F694;
        Wed, 16 Jun 2021 08:00:14 -0700 (PDT)
Date:   Wed, 16 Jun 2021 15:59:58 +0100
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v7 03/19] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210616155958.7c7a6a33@slackpad.fritz.box>
In-Reply-To: <20210615233502.GA1630203@robh.at.kernel.org>
References: <20210615110636.23403-1-andre.przywara@arm.com>
        <20210615110636.23403-4-andre.przywara@arm.com>
        <20210615233502.GA1630203@robh.at.kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 15 Jun 2021 17:35:02 -0600
Rob Herring <robh@kernel.org> wrote:

Hi,

> On Tue, Jun 15, 2021 at 12:06:20PM +0100, Andre Przywara wrote:
> > Add the obvious compatible name to the existing RTC binding.
> > The actual RTC part of the device uses a different day/month/year
> > storage scheme, so it's not compatible with the previous devices.
> > Also the clock part is quite different, as there is no external 32K LOSC
> > oscillator input.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > index b1b0ee769b71..2c3fd72e17ee 100644
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
> > @@ -105,6 +106,20 @@ allOf:
> >            minItems: 3
> >            maxItems: 3
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-rtc
> > +
> > +    then:
> > +      properties:
> > +        clock-output-names:
> > +          minItems: 3
> > +          maxItems: 3
> > +        clocks:
> > +          maxItems: 0  
> 
> clocks: false
> 
> if forbidding clocks is what you want.

Yes, thanks for the hint!

Cheers,
Andre

> 
> > +
> >    - if:
> >        properties:
> >          compatible:
> > -- 
> > 2.17.5  
> 


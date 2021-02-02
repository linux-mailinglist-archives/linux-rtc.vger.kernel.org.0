Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878AD30B3DC
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 01:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhBBAHq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 1 Feb 2021 19:07:46 -0500
Received: from foss.arm.com ([217.140.110.172]:41282 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229556AbhBBAHp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 1 Feb 2021 19:07:45 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81173147A;
        Mon,  1 Feb 2021 16:06:58 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16D0F3F718;
        Mon,  1 Feb 2021 16:06:55 -0800 (PST)
Date:   Tue, 2 Feb 2021 00:05:57 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 12/20] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210202000557.4987de6b@slackpad.fritz.box>
In-Reply-To: <1675074.8rG671tKPg@kista>
References: <20210127172500.13356-1-andre.przywara@arm.com>
        <20210127172500.13356-13-andre.przywara@arm.com>
        <1675074.8rG671tKPg@kista>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 31 Jan 2021 14:44:40 +0100
Jernej Škrabec <jernej.skrabec@siol.net> wrote:

Hi Jernej,

> Dne sreda, 27. januar 2021 ob 18:24:52 CET je Andre Przywara napisal(a):
> > Add the obvious compatible name to the existing RTC binding, and pair
> > it with the existing H6 fallback compatible string, as the devices are
> > compatible.  
> 
> After close lookup I would disagree with this observation. Major difference is 
> that H616 doesn't support usage of external 32768 Hz oscillator. It uses 24 
> MHz oscillator with divider for that case. Due to that change, whole logic for 
> external oscillator should go out. Additionally, this logic overwrites default 
> value in LOSC_CTRL register, which is not nice (there is no documentation for 
> those bits).

Thanks for the heads up, and I wonder if there is more to that. From
comparing the RTC documentation, I wonder if we should actually have
incoming clocks in the bindings (the crystals / external clock sources
with 32KHz, 16MHz, 24MHz). Then we could actually model which crystals
the board provides. It seems like the H6 made the 32KHz OSC optional,
and the H616 simply doesn't support it anymore - at the very least I
don't see any X32K pins anymore.

But more importantly: looking more closely (I only skimmed over the
register summary back then) the actual RTC registers are different:
the H616 encodes a linear day number (vs. a broken-down D-M-Y), also the
time-of-day register is different.

So we definitely need a driver update, and hence need to drop this
patch.

Cheers,
Andre

> Best regards,
> Jernej
> 
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-  
> rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > index b1b0ee769b71..4193e5813344 100644
> > --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > @@ -26,6 +26,9 @@ properties:
> >            - const: allwinner,sun50i-a64-rtc
> >            - const: allwinner,sun8i-h3-rtc
> >        - const: allwinner,sun50i-h6-rtc
> > +      - items:
> > +          - const: allwinner,sun50i-h616-rtc
> > +          - const: allwinner,sun50i-h6-rtc
> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.17.5
> > 
> >   
> 
> 


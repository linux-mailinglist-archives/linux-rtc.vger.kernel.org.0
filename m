Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063D4304B64
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 22:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbhAZEqf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jan 2021 23:46:35 -0500
Received: from foss.arm.com ([217.140.110.172]:42486 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729825AbhAZBnu (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 25 Jan 2021 20:43:50 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3955F1FB;
        Mon, 25 Jan 2021 16:15:02 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3C843F68F;
        Mon, 25 Jan 2021 16:14:59 -0800 (PST)
Date:   Tue, 26 Jan 2021 00:14:08 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 12/21] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210126001408.58dda681@slackpad.fritz.box>
In-Reply-To: <20210125225101.GV1196852@piout.net>
References: <20210125151811.11871-1-andre.przywara@arm.com>
        <20210125151811.11871-13-andre.przywara@arm.com>
        <20210125225101.GV1196852@piout.net>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 25 Jan 2021 23:51:01 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

Hi Alexandre,

> On 25/01/2021 15:18:02+0000, Andre Przywara wrote:
> > Add the obvious compatible name to the existing RTC binding, and pair
> > it with the existing H6 fallback compatible string, as the devices are
> > compatible.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
> >  1 file changed, 3 insertions(+)
> >   
> 
> How do you expect that patch to be merged? I was thinking it would go
> through Rob's tree.

Yes, and that's why I originally combined all those trivial patches
into one, but broonie asked for a split up.

So I guess there is not much to do there, unless you want to object ;-)

Cheers,
Andre

> 
> > diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
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
> 


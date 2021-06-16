Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D113A958A
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 11:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhFPJJK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Jun 2021 05:09:10 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40821 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231336AbhFPJJK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Jun 2021 05:09:10 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2C46D580648;
        Wed, 16 Jun 2021 05:07:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 16 Jun 2021 05:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=e
        DFBGZug2v6ZPSF1KNS2GayoOW2LHFpoZkk85fdqgpI=; b=OyNkutplAl6yGWQze
        mjbEEZbGKE/oE1My+lAKp7wWCo27HCOgBx16p5x7GoteYk+oGWuHU/wGFv3HbqJY
        loBMrOGbEjhkswRamHcQEYl3l8yS/pRVZGuM0K5fVm/9RJwNmm+YmH8YVNxmPAXA
        I8xoZ7QOwequum/purWB/llTx50SNc06IViIZ6u8C80NfbP42jmEkUtkiEvm8XBZ
        iqKxP/Hq1R/uAmmrelGQT7migdWcVgU0Kg+wFP5nFgXWk6/XVkS0f+dgCCNaexok
        Mn3EAsNyabI/3soeievM+LShTZuRmMHf8PbN16c9D/zQcFpgm9PK7ZpZ6RCLj/xL
        eEFcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=eDFBGZug2v6ZPSF1KNS2GayoOW2LHFpoZkk85fdqg
        pI=; b=Jl21pywWeAEEa/L3P3YxORL3tS1h0Q4e6jOfe0vXmCGuuoFdrH4FwQ4aR
        MItBu2R20DCGs198ejWQy1oV2xPDQIJNc/UsIRgBrbAxUHp9nChjtEDJ66+IbX8r
        YgnF4b5L5q/wNmoPCDg9/lMMSev1q8ATMma+5mMVQfNzKdvu5aisn50L+6l1MUd0
        1vxMwj7xjzCVy35GREOMkFWEZA+fbrKmqD+kItGMrWez2rDDSuP2k+8vb2xzQsC8
        vfh3spnsdyBBR+221Am6W2kChqEGbdc6AfNRInvunzbX3gE9qIWDyj64RHMnyEEc
        nZg+1MB/8V0/cbG/fw1hML1dIkV0g==
X-ME-Sender: <xms:Nr_JYATzS3RPZG2h9aOP_jZNfHi3bWMTtntGSq17a0ze2kUMqLNW6g>
    <xme:Nr_JYNwsUoiGhDI0ebVFrgPCpM3ZdZ0Dsvma5vApmgrCZKQ3BX2n90sfM2j_4qxtk
    vhvUYD0-D_gWw4KJeo>
X-ME-Received: <xmr:Nr_JYN0Ze_lG7KSAGunQccB8y0Ie84qKMZuDUAvFyzBY4V1o3aNA-5LioCwUcyr6p-_Mpujcx-ZqTNEbtFISavYHJa4ELyaJdSds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
    gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Nr_JYED9RZWNrWq3twggvOaRAlAesKUF-dvZJAC8WRrLzL0sB7hzLw>
    <xmx:Nr_JYJgYmKNaoE9pClZVJfLn5y3DLdm3Zvgxmky71coeQKAZDvyu_g>
    <xmx:Nr_JYAql4UryPXFbEdz14jTb5fa67NRA109AhHN8fmtUocEADvXwsg>
    <xmx:OL_JYJ4MhnaBj3Qov3Edr_IzYZ1sJJrOg-QNxnP7etEYp8MH3Yv4Kw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 05:07:02 -0400 (EDT)
Date:   Wed, 16 Jun 2021 11:07:00 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
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
Message-ID: <20210616090700.hvwiaifo5luiwhnf@gilmour>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-4-andre.przywara@arm.com>
 <99a2069b-99e9-9b47-12a6-aae01c7f59dc@sholland.org>
 <20210607135910.63560ffc@slackpad.fritz.box>
 <56ad752b-b1c2-cb05-be8b-71c29f271ec9@sholland.org>
 <20210615132440.55793ec5@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210615132440.55793ec5@slackpad.fritz.box>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Tue, Jun 15, 2021 at 01:24:40PM +0100, Andre Przywara wrote:
> > On 6/7/21 7:59 AM, Andre Przywara wrote:
> > > On Thu, 20 May 2021 21:37:34 -0500
> > > Samuel Holland <samuel@sholland.org> wrote:
> > >=20
> > > Hi,
> > >  =20
> > >> On 5/19/21 5:41 AM, Andre Przywara wrote: =20
> > >>> Add the obvious compatible name to the existing RTC binding.
> > >>> The actual RTC part of the device uses a different day/month/year
> > >>> storage scheme, so it's not compatible with the previous devices.
> > >>>
> > >>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > >>> ---
> > >>>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 5 +=
+++-
> > >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-=
a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml
> > >>> index b1b0ee769b71..178c955f88bf 100644
> > >>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc=
=2Eyaml
> > >>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc=
=2Eyaml
> > >>> @@ -26,6 +26,7 @@ properties:
> > >>>            - const: allwinner,sun50i-a64-rtc
> > >>>            - const: allwinner,sun8i-h3-rtc
> > >>>        - const: allwinner,sun50i-h6-rtc
> > >>> +      - const: allwinner,sun50i-h616-rtc
> > >>> =20
> > >>>    reg:
> > >>>      maxItems: 1
> > >>> @@ -97,7 +98,9 @@ allOf:
> > >>>        properties:
> > >>>          compatible:
> > >>>            contains:
> > >>> -            const: allwinner,sun50i-h6-rtc
> > >>> +            enum:
> > >>> +              - allwinner,sun50i-h6-rtc
> > >>> +              - allwinner,sun50i-h616-rtc
> > >>> =20
> > >>>      then:
> > >>>        properties:
> > >>>    =20
> > >>
> > >> This binding is missing a clock reference for the pll-periph0-2x inp=
ut
> > >> to the 32kHz clock fanout. =20
> > >=20
> > > Right. So do I get this correctly that we don't model the OSC24M input
> > > explicitly so far in the DT? I only see one possible input clock, whi=
ch
> > > is for an optional 32K crystal oscillator.
> > > And this means we need to change some code also? Because at the moment
> > > a clock specified is assumed to be the 32K OSC, and having this clock
> > > means we switch to the external 32K OSC. =20
> >=20
> > Right. The code would need updates to follow the binding.
>=20
> I changed the binding for now to not allow any clock, and the code to
> ignore any clocks when the H616 compatible is used. This way we can
> extend this later without breaking anything.

I'm not really a fan of this: it just creates one more special case that
we'll have to take into account later on, complicating further the logic
that is already way too complicated.

> > > And who would decide which clock source to use? What would be the
> > > reason to use PLL_PERIPH(2x) over the RC16M based clock or the
> > > divided down 24MHz? =20
> >=20
> > Because it would be more accurate. 24MHz/750 =3D=3D 32000 Hz, while the=
 RTC
> > expects 32768 Hz.
>=20
> I thought about this as well, but this means there is no reason to not
> use the PLL? At least not for Linux (normal operation with PLLs
> running anyway)? This situation is different for the other SoCs, because
> boards *might* have a separate and more precise 32K crystal.
> So we could code this similar to the other SoCs: If we have a clock
> property defined, we assume it's pointing to the PLL and switch to use
> it?

We have another option though: list all the clocks that could be
available for a 32khz source, call clk_get_accuracy on them, and then
use the clock with the best accuracy. We already have the accuracy
requirements in the datasheet for each crystal, so it shouldn't be too
hard to support.

> But, looking at the diagram in the manual (and assuming it's
> correct), the PLL based clock can only be routed to the pad, but cannot
> be used for the RTC. That seems to be also the case for the T5, which
> has an external LOSC pin.
> =20
> > > So shall we ignore the PLL based input clock for now, put "0 input
> > > clocks" in the current binding, then later on extend this to allow
> > > choosing the PLL? And have it that way that having the PLL reference
> > > means we use it? =20
> >=20
> > No, the device tree represents the hardware, not whatever happens to be
> > used by Linux drivers at the time. It should be in the binding
> > regardless of what the driver does with it.
>=20
> I understand that very well, but was just looking for a solution where
> we can go ahead with an easier solution *now*. I am afraid implementing
> this annoying RTC special snowflake properly will just delay the whole
> series.
> In the long run your "D1 & friends" extra RTC clock driver looks the
> right way out, but it will probably take some more time to get this
> merged.

To be honest, I'm not entirely sure why we need the rtc in the first
place. If your plan is to figure it out later anyway, why not just model
the 32kHz clock as a fixed clock, and change it later once it's been
entirely figured out?

> > Though the circular dependency between the clock providers does cause
> > problems. We cannot get a clk_hw for the PLL-based clock, so we would
> > have to hardcode a global name for it, which means we aren't really
> > using the device tree.
>=20
> I start to wonder how much business Linux really has in controlling all
> those RTC details. The current code happens to work, because everything
> is setup correctly already, on reset.

That's not true for all the SoCs.

> > We already see this "not really using the binding" with the other CCUs:
> > the H616 CCU hardcodes the name "osc24M", while the A100 CCU hardcodes
> > "dcxo24M" for the same clock. So moving that clock into the RTC clock
> > provider would require using both names in one clk_hw simultaneously (or
> > rather fixing the CCU drivers to get a clk_hw from the DT instead of
> > referencing by name).
> >=20
> > And trying to deal with optional clocks by index is only going to get
> > more painful over time. For example, with the R329 and D1, the RTC has
> > the following inputs:
> >  * DCXO24M (unless you model it inside the RTC)
> >  * External OSC32k (optional!)
> >  * The RTC bus gate/reset from the PRCM
> >  * R-AHB from the PRCM for the RTC SPI clock domain
> >=20
> > So it seems time to start using clock-names in the RTC binding.
>=20
> Yes, that sounds reasonable. It's just a shame that we keep changing
> the RTC bindings, and so creating a lot of incompatibility on the way.

I mean, we keep changing it because the hardware keeps changing. The RTC
on the A20 had no clock at all. The A31 later on got only a single clock
input, and a single output. If your point is that we should have known
better 9 years ago what the current SoCs would look like, that's a bit
absurd, don't you think?

Maxime

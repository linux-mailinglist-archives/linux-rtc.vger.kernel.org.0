Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB373FD45D
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Sep 2021 09:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242576AbhIAHWa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 Sep 2021 03:22:30 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40623 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242572AbhIAHW1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 1 Sep 2021 03:22:27 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 48546580727;
        Wed,  1 Sep 2021 03:21:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 01 Sep 2021 03:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=zMYrNt50zg0sXSYvGdt7SlhrCQS
        UOKJddsQ6H2t32ts=; b=HKf3lzcL8BB1ZnQtI4KTLccSAjmG/eQAY1XTz/7UNWn
        3Z+FaYF2i+b4z27XNvOSmFRotl2X5AyFkLVDCFDkhUR5Uzg0ZLXP658dsBNSoAz8
        xWon6W4Z7W7mYFFJxs9WH2fY9sTutEhpWlrJWX6NXIY2GyOfmu0d0q3C/J0RKseS
        tVrto/uwOZ6KDID1Steb6b29glTIfzvJ3JnVYJGCvpPIUP6jaBC4XBcl24gN6LMR
        YIc66vkB0IRpvwOMPSyGc3zo2CspROJZtQNFZJizSEtomF3Vf37nBhiHa72E99Qp
        ym9zznrR/xDyLs7Hrz4vIx7fu7YQ5hfByFOX3QqLuFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zMYrNt
        50zg0sXSYvGdt7SlhrCQSUOKJddsQ6H2t32ts=; b=XZg4vAau/WT2bEN6ypK9Af
        gzL2VDRuImjgOTq1ERgD2I5E8DAESqlgYoNYH1dUPCOb/isTM5MVrMS95pkbl9qu
        uadYEuYAl0tMREQmM4AjTR/xjhhkjMVg20li6AvANgMPPvD9rYKvOwvpc6qT5jAE
        HiLQzqllRaOeZP2tLT1x+amjwVDVIoc8qsoUqFm5w3sWYIZhA3fouzFMGO//aGLG
        DtYugwcveznEUqChZM4bNfrW+5EMxbI99BtWrtsere5H9reTVq7noaf8q+gPaH/T
        3FYwA9rb5FKE6omoZYq6UUDrxVqAS/Q5t87j2/SAoySCwN9/twfFpbrNLdfgwMag
        ==
X-ME-Sender: <xms:9ikvYYfzxvLSQ30b8gD94QZ7MqdeTfESMfmbGdk2CQPUDUM_JlWZ6Q>
    <xme:9ikvYaMW6_cdlWYxCy0IZUhRcaGASOiktzMbFmGCOYpUJciEy-LJA9XygMP73D0YX
    RCNv_vRGRBidtQ01OY>
X-ME-Received: <xmr:9ikvYZhtE_XAP2dRpf76wFVZzdIyGif9znVCIDKBc1QpUmuenvodd89M-cFc05Y2TxzaqRiR1Nl_5b_Jml4rNrW9VqcLrPikM2G2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9ikvYd-lv-o57J9pidUNBz-vpwE8uQOaevJX9h8utaOAK6mO3NsQXw>
    <xmx:9ikvYUu-d6oq6GcXaIc9MzC_IcAZXZTYGzVaxaPC2rYNpeiLuEMchw>
    <xmx:9ikvYUEE_iGXiilRPUj7OJrFwFiz7CJ2gHeesIciqiFYSML7tYqEWg>
    <xmx:-CkvYRPWy_cTQp3I98g1djSMZO_OLXFkqSFlOdGNvaFk2Giv59By3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 03:21:26 -0400 (EDT)
Date:   Wed, 1 Sep 2021 09:21:23 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
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
Message-ID: <20210901072123.gqfua52rupsrmtks@gilmour>
References: <20210723153838.6785-1-andre.przywara@arm.com>
 <20210723153838.6785-3-andre.przywara@arm.com>
 <20210726144137.6dauuxdssu7yszox@gilmour>
 <20210802013938.29fa18ed@slackpad.fritz.box>
 <20210817073810.7stuzrppyjf4spab@gilmour>
 <20210818100407.7cf7cfb7@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rjkq6bidgpvhb43g"
Content-Disposition: inline
In-Reply-To: <20210818100407.7cf7cfb7@slackpad.fritz.box>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--rjkq6bidgpvhb43g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 10:04:07AM +0100, Andre Przywara wrote:
> On Tue, 17 Aug 2021 09:38:10 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> Hi Maxime,
>=20
> > On Mon, Aug 02, 2021 at 01:39:38AM +0100, Andre Przywara wrote:
> > > On Mon, 26 Jul 2021 16:41:37 +0200
> > > Maxime Ripard <maxime@cerno.tech> wrote:
> > >  =20
> > > > Hi,
> > > >=20
> > > > On Fri, Jul 23, 2021 at 04:38:29PM +0100, Andre Przywara wrote: =20
> > > > > Add the obvious compatible name to the existing RTC binding.
> > > > > The actual RTC part of the device uses a different day/month/year
> > > > > storage scheme, so it's not compatible with the previous devices.
> > > > > Also the clock part is quite different, as there is no external 3=
2K LOSC
> > > > > oscillator input.
> > > > >=20
> > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > >
> > > > > ---
> > > > >  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 14 ++++++++=
++++++
> > > > >  1 file changed, 14 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6=
i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-=
rtc.yaml
> > > > > index beeb90e55727..d8a6500e5840 100644
> > > > > --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-r=
tc.yaml
> > > > > +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-r=
tc.yaml
> > > > > @@ -26,6 +26,7 @@ properties:
> > > > >            - const: allwinner,sun50i-a64-rtc
> > > > >            - const: allwinner,sun8i-h3-rtc
> > > > >        - const: allwinner,sun50i-h6-rtc
> > > > > +      - const: allwinner,sun50i-h616-rtc
> > > > > =20
> > > > >    reg:
> > > > >      maxItems: 1
> > > > > @@ -104,6 +105,19 @@ allOf:
> > > > >            minItems: 3
> > > > >            maxItems: 3
> > > > > =20
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            const: allwinner,sun50i-h616-rtc
> > > > > +
> > > > > +    then:
> > > > > +      properties:
> > > > > +        clock-output-names:
> > > > > +          minItems: 3
> > > > > +          maxItems: 3   =20
> > > >=20
> > > > You don't need both of them when they are equal
> > > >  =20
> > > > > +        clocks: false
> > > > > +   =20
> > > >=20
> > > > It's not entirely clear to me what those clocks are about though. I=
f we
> > > > look at the clock output in the user manual, it looks like there's =
only
> > > > two clocks that are actually being output: the 32k "fanout" clock a=
nd
> > > > the losc. What are the 3 you're talking about?] =20
> > >=20
> > > I see three: the raw SYSTEM "CLK32K_LOSC", the RTC input + debounce
> > > clock (/32), and the multiplexed PAD. =20
> >=20
> > But the input and debounce clock is only for the RTC itself right? So it
> > should be local to the driver and doesn't need to be made available to
> > the other drivers
>=20
> I understood "debounce" as being the clock used for the pinctrl
> debouncer. What would it debounce otherwise? Do you think that this
> "debounce circuit" is something internal to the RTC and is totally
> irrelevant for us?

I don't think that's it.

The Debounce circuit is after the 32 divider, so we have a clock rate of
1kHz (Figure 3-35, page 275)

The PIO Interrupt debouncing can use either a 32kHz or 24MHz clock, so
the rates don't match, and given the naming would rather be clocked from
CLK32K_LOSC.

The DCXO_CTRL_REG (Section 3.13.6.13) hints at something different
though, it says:

"
CLK16M_RC_EN
1: Enable
0: Disable
The related register configuration is necessary to ensure the reset debounce
circuit has a stable clock source.
The first time SoC starts up, by default, the reset debounce circuit of SoC
uses 32K divided by RC16M. In power-off, software reads the related bit to
ensure whether EXT32K is working normally, if it is normal, first switch the
clock source of debounce circuit to EXT32K, then close RC16M.
Without EXT32K scenario or external RTC scenario, software confirms firstly
whether EXT32K is working normally before switching, or software does not
close RC16M.
"

I'm not sure why it would be useful for though

> But in general I looked at how many *different* clocks this diagram
> describes, and I count: one unaltered ("SYSTEM"), one "div by
> 32" (RTC/debounce), and one multiplexed. My aim was to avoid
> DT binding changes when we later discover we do need one of them for
> something (as happened in the past). So three seemed to be the safe
> choice here, to avoid surprises. In the worst case we just will never
> reference one of them.

My concern is the pretty much the opposite: if we ever need to remove it
for whatever reason, if it's in the DT, we can't. While we can totally
add it if we need it.

> > Either way, what this list is must be documented.
>=20
> You mean to overwrite the "description" stanza for clock-output-names?

Yes

> And can this be done in the per-SoC parts in the later part of the
> binding, keeping the existing description?

Sure

Maxime

--rjkq6bidgpvhb43g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYS8p8wAKCRDj7w1vZxhR
xRE2AQDYlqDEaHf5/1IED5BleAAc0RHp5WOyINtMRFzdAjEIzAEApmTJW3tJsci4
DiJ796ury4C9KXYVjkGtfFmLnozADQ0=
=3GAS
-----END PGP SIGNATURE-----

--rjkq6bidgpvhb43g--

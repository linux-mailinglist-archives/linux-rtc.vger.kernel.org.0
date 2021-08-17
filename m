Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEE03EE758
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Aug 2021 09:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbhHQHis (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Aug 2021 03:38:48 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40349 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234402AbhHQHis (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Aug 2021 03:38:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 24740580ACF;
        Tue, 17 Aug 2021 03:38:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 17 Aug 2021 03:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=+bMu1Ljjo2MZK0+5p6uccJMVSlW
        iMcV687SCKmX/GLE=; b=kV5vwKjn6g+KeJYoI57epVjPe13hYg+w8CWomo+8A8q
        cXCS3mO4Xi27cHrGwpGnFxk7D7tRRbzkMaW9x56X8lowgHLvOOa9lL8tXWjoplTL
        Pj3HwH0PFXD4pKMjvAmsy6354tS0IfZ12qur05BbTOPAYgF3oKnBuaHhXKSYTP+B
        n1sxSFvqyxcHPjLWOQ/hW/796vc0KD86gMO4vz7XaCtt76zfbTA6r3V+QaZBIEoe
        rAZwnH2aRvRpqCiRjup9gG0lzfqwYrLnWeZraU7Slv9gG5tOv4mg/d5BC1JYt76H
        fvpucFXs/k3rAJJBO9QT4JwK+IDFgtEBuYQTVJBuLtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+bMu1L
        jjo2MZK0+5p6uccJMVSlWiMcV687SCKmX/GLE=; b=ALlhFNv0fEY/sYD+d1JLtz
        f4gvXXBcIp3M2SmqW6PeJ7fcwKWC96ME7+J9z055sEfPh6/PikvBo5yFQhx4T7MU
        AJ90l9QYUnD0iT/RAjHlJxBV48PeqF/3pb8O2W7FRzljGToFZR0Tn9T2XHt+gIz8
        louw0ee2Grur0Zjg/QEUzD3Apby+KlezZrcVVdYZ2sznGBjcgWSyVc2ygKn1pMyf
        F17AJHEOMBtnwFCiDFHA5QJVx1/aa/bse5dBrs4rprNZWS6xCqE+uSOTotJ+5gQe
        0ATFip6Gw5KQo5FIW26HdbS4zauIdiyl1Y5yDg+DXwi04Df5kxrxCDTfkLh7o/eg
        ==
X-ME-Sender: <xms:Y2cbYcrJtXWTtqoC5SE_qBXvT7Ag0avqjOseiLb4GYQyf0w5iCGVcw>
    <xme:Y2cbYSqD4OtB4owkvfSx9CA0GsmYPeNXXBtm8RgnjiQyr6p8WWscPUnBT7YcvG7jy
    PFC_OzcbbONmA41H-A>
X-ME-Received: <xmr:Y2cbYRPth3K9y6DbfNxNMS9jnd_O8_9fywPw28K5tfdAPf60VtaCUor41Dw6m7z9-JZAD2oUdSPA4fVgCPi6BJPnb8CFAKkWQWlp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledvgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZGcbYT5vRi_b8JspRjKCVK5o8tYG7aNvmoHJsRj3f-Up38pSdKH5wQ>
    <xmx:ZGcbYb7VWvZf5xQelL7ykDfoqreziftoaDtEOiKCWyIyJw-ywrHWJw>
    <xmx:ZGcbYThSxND8U1h2GtKkWEv_AIEMX4Buhhr5Vgkt0Jg-iksrSzgWsg>
    <xmx:Z2cbYSIoQlbgh_UocOKSBLouKr_A3uNlHXDXhOKqAVF3w8nEFgwKaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Aug 2021 03:38:11 -0400 (EDT)
Date:   Tue, 17 Aug 2021 09:38:10 +0200
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
Message-ID: <20210817073810.7stuzrppyjf4spab@gilmour>
References: <20210723153838.6785-1-andre.przywara@arm.com>
 <20210723153838.6785-3-andre.przywara@arm.com>
 <20210726144137.6dauuxdssu7yszox@gilmour>
 <20210802013938.29fa18ed@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ggkfv7hwuuflnmjz"
Content-Disposition: inline
In-Reply-To: <20210802013938.29fa18ed@slackpad.fritz.box>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--ggkfv7hwuuflnmjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 02, 2021 at 01:39:38AM +0100, Andre Przywara wrote:
> On Mon, 26 Jul 2021 16:41:37 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > Hi,
> >=20
> > On Fri, Jul 23, 2021 at 04:38:29PM +0100, Andre Przywara wrote:
> > > Add the obvious compatible name to the existing RTC binding.
> > > The actual RTC part of the device uses a different day/month/year
> > > storage scheme, so it's not compatible with the previous devices.
> > > Also the clock part is quite different, as there is no external 32K L=
OSC
> > > oscillator input.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > >
> > > ---
> > >  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 14 ++++++++++++=
++
> > >  1 file changed, 14 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a3=
1-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.=
yaml
> > > index beeb90e55727..d8a6500e5840 100644
> > > --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.y=
aml
> > > +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.y=
aml
> > > @@ -26,6 +26,7 @@ properties:
> > >            - const: allwinner,sun50i-a64-rtc
> > >            - const: allwinner,sun8i-h3-rtc
> > >        - const: allwinner,sun50i-h6-rtc
> > > +      - const: allwinner,sun50i-h616-rtc
> > > =20
> > >    reg:
> > >      maxItems: 1
> > > @@ -104,6 +105,19 @@ allOf:
> > >            minItems: 3
> > >            maxItems: 3
> > > =20
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: allwinner,sun50i-h616-rtc
> > > +
> > > +    then:
> > > +      properties:
> > > +        clock-output-names:
> > > +          minItems: 3
> > > +          maxItems: 3 =20
> >=20
> > You don't need both of them when they are equal
> >=20
> > > +        clocks: false
> > > + =20
> >=20
> > It's not entirely clear to me what those clocks are about though. If we
> > look at the clock output in the user manual, it looks like there's only
> > two clocks that are actually being output: the 32k "fanout" clock and
> > the losc. What are the 3 you're talking about?]
>=20
> I see three: the raw SYSTEM "CLK32K_LOSC", the RTC input + debounce
> clock (/32), and the multiplexed PAD.

But the input and debounce clock is only for the RTC itself right? So it
should be local to the driver and doesn't need to be made available to
the other drivers

Either way, what this list is must be documented.

> > Also, it looks like the 32k fanout clock needs at least the hosc or
> > pll-periph in input, so we probably don't want to ask for no parent
> > clock?
>=20
> Well, we never seem to reference the HOSC this way, this was always
> somewhat explicit. And yes, there is PLL-PERIPH as an input, but we
> don't support this yet. So I went with 0 input clocks *for now*: the
> driver can then ignore all clocks, so any clock referenced in the DT
> later won't cause any harm. This will all be addressed by Samuel's RTC
> clock patch, which will also touch the H6, IIRC. And it looks like we
> will need to touch the binding anyway then, but can then just *extend*
> this.

You mentioned that series several times already and never provided an
explanation for what it was supposed to be doing except fixing
everything. What's the general plan for that series?

Maxime

--ggkfv7hwuuflnmjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRtnYgAKCRDj7w1vZxhR
xa/CAP9hbwXj022ukapaHrTpQ2r92mfnkV387OMFnrGF9gS4IgD/YU6D6Z6bzoG4
DqHj9PzBXYYPYXEmg4uN6r7bDdNT+QU=
=0frR
-----END PGP SIGNATURE-----

--ggkfv7hwuuflnmjz--

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB311439ACC
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Oct 2021 17:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhJYPwM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Oct 2021 11:52:12 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:51853 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230070AbhJYPwM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Oct 2021 11:52:12 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7D7305806E4;
        Mon, 25 Oct 2021 11:49:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 25 Oct 2021 11:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=0aER1SAbuXA9nYwjSnrNi66UhKk
        Mzhn0/WJpn0hsF2I=; b=a3HDdU3oG6CY8b3GHjdKaB5w08HQNnLO0b7ow8rgCHn
        QLSDmr7wbfQ4qqchyk1XklS7i7CHr7a+TPUc78e/ENH92Vpf/hxKiupMcz/IMoEa
        10niQvw+bRbEV3/D0U3WZtfh+8vDRQP2LZildMs6pCLPLVq67cbRlsvN8GdFA7CW
        lRSf0n3F6ve4HfrTO9phOjTY0T5zCb/Freyemcoi0FJwqtUuYWjgbMc5cZvE1xOa
        STI1g2ghRVSkgH0B+NxlbzXbnczza5lC36zWLOSDW53IgRwwpwf9oBUqJoC4+Fgq
        yQQm3NMTnid30Vdu7kGgX9Qpd7j2cgIKPZJfFrM4UFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0aER1S
        AbuXA9nYwjSnrNi66UhKkMzhn0/WJpn0hsF2I=; b=TXvfYLmNlJzAj25uXHxj4U
        LuabYELPTeKHnKUUiEpQO7IjyTsogqzj5tRA1x7tQ4qOKhbiKtvXx3+sGrBnqsbP
        0qqP68eYmhjTSpAla1lnYqmQy74jbT37FbI3qv/3wigC5HTak9Osj2vwAjGxw5S+
        BkRAfVMdDKO7Sj9jkhSc+J3uyOzsUnM3PongiXKJdU/QkKoRotVf7/kPB3NXoziI
        AMVTg137o+CLTocZF63d6R6/kyPGYXdf6qDpWpJBu7ozrr/VZvA8lsOjap+RhICn
        uA22i7sUe1Gm4aIFAc186HH2krU+sMxMyWXl6Isy+svRkSWaIEoX3AQT7+0TkEoQ
        ==
X-ME-Sender: <xms:G9J2YbRC7-45o-m3FHYhpcL2lOnWgy5K5VRkr_EfqEpSulCjSuuliA>
    <xme:G9J2Ycw6s4-L6skN-EpVViAD832PVYxXCKe8Mq7PkLj4geky9aIue271XLN-hWFFS
    W1JBAZR60h8uaXDSwY>
X-ME-Received: <xmr:G9J2YQ2pk0m8Xv5M6GNjxLns07AJ7mSLjCrYjRUEKlG-3PQ0M7p0YRZyhCks44_xNpMrWCSNLMK3QZ66AfMCculhMFdqIOorgoJEUvtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:G9J2YbAUoGC6Lnl7bYGuDw-PZul04KodCu1RQJQeVD76R4yllfo8cg>
    <xmx:G9J2YUizQuWwZW6VVZ6sSqA6UCnBb_DUthdj0utT_suUCEEvqsZCkA>
    <xmx:G9J2Yfqhv8Gc4XofYEgGk2N7O3cEAVKLrY8P2I7x7rGLbFE2Cqqosw>
    <xmx:HdJ2YVZTk9djiSN8X49jHj9yP-qB9C--K9FHyMX5F3e8ZzExgMmxNw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:49:47 -0400 (EDT)
Date:   Mon, 25 Oct 2021 17:49:45 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: rtc: sun6i: Add H616, R329, and D1
 support
Message-ID: <20211025154945.6vbp7ru5qvvpe34r@gilmour>
References: <20210928080335.36706-1-samuel@sholland.org>
 <20210928080335.36706-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ihzrd562brfvvncn"
Content-Disposition: inline
In-Reply-To: <20210928080335.36706-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--ihzrd562brfvvncn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 28, 2021 at 03:03:28AM -0500, Samuel Holland wrote:
> These new RTC variants all have a single alarm, like the R40 variant.
>=20
> For the new SoCs, start requiring a complete list of input clocks. The
> H616 has three required clocks. The R329 also has three required clocks
> (but one is different), plus an optional crystal oscillator input. The
> D1 RTC is identical to the one in the R329.
>=20
> And since these new SoCs will have a well-defined output clock order as
> well, they do not need the clock-output-names property.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes since v1:
>   - Properly update the DT binding clocks and clock-names properties.
>=20
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 72 ++++++++++++++++++-
>  include/dt-bindings/clock/sun6i-rtc.h         | 10 +++
>  2 files changed, 79 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/clock/sun6i-rtc.h
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index a88d46ffb457..b971510a5ae7 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -24,9 +24,14 @@ properties:
>            - allwinner,sun8i-v3-rtc
>            - allwinner,sun50i-h5-rtc
>            - allwinner,sun50i-h6-rtc
> +          - allwinner,sun50i-h616-rtc
> +          - allwinner,sun50i-r329-rtc
>        - items:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
> +      - items:
> +          - const: allwinner,sun20i-d1-rtc
> +          - const: allwinner,sun50i-r329-rtc
> =20
>    reg:
>      maxItems: 1
> @@ -38,7 +43,10 @@ properties:
>        - description: RTC Alarm 1
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +
> +  clock-names:
> +    minItems: 1
> =20
>    clock-output-names:
>      minItems: 1
> @@ -98,7 +106,66 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: allwinner,sun8i-r40-rtc
> +            const: allwinner,sun50i-h616-rtc
> +
> +    then:
> +      clocks:
> +        minItems: 3
> +        maxItems: 3

If clocks is set to minItems: 1, you'll still get a failure.

The way the schemas are checked is a bit weird, but it's not checked
once with the sum of all the schemas, they are all checked separately.

So the schema under the then here will be valid, but the global check
property will fail because it expects 1 item.

You'll need minItems: 1, maxItems: 4 for the global clocks and
clock-names.

Maxime

--ihzrd562brfvvncn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXbSGQAKCRDj7w1vZxhR
xUS7AP9dNLk6cWYN+vxStPWF4+biVpg60Zru5IdULikRqQBmlQD/dCBOoGYPDuE0
TtN7hEAVpGbjJcDGTznhWfsYr5rTJQM=
=b+4w
-----END PGP SIGNATURE-----

--ihzrd562brfvvncn--

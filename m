Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A9A3EFEEE
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Aug 2021 10:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbhHRIQG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Aug 2021 04:16:06 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:59685 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239424AbhHRIQG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Aug 2021 04:16:06 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id A7B09580AE8;
        Wed, 18 Aug 2021 04:15:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 18 Aug 2021 04:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=yYt+4EJ3cWamqkGEsAvOSuOlm+F
        MX0V4UjsXtAe6pK8=; b=ml3gnKHE4PYqlaOtY/4d/1MAfJkN6cf+Yn2CTAqz8bq
        T5IbbMJyI8smWzB4TGQ2Tvko0wp7cdDxP1Pyfcc5FCpeNDgsu4QHJhOvMhJbYw3Y
        Zu6vMKs76Un2vGA8UMm8nzp3vOZwIrIb6B7MtQVoPQqp84WaOilmAS+AwFHUuBi7
        OQcV8ulV1C2DkJHcR599F0jfwb5QO67j7zVqS1D1t0wYLDb6cGZ+S3BWs6xioIek
        moCtHMZJEN0vp095N8WJbBnHuEMxQWc2eImW6Te8zRpSwQfRfv9NxB3ey4sxFild
        u/gDY7gR0e7IkTCUD/ACU4HnIdji3Ya/ZDfXzTgGIYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yYt+4E
        J3cWamqkGEsAvOSuOlm+FMX0V4UjsXtAe6pK8=; b=iE6TghD30HnYXnkPqyg9Gz
        Lyjw1Rmts6xoSN8/UyVdGi7dgMl8d3wIR3u6e/LBFv7XEYO9Wc3+YVvn4uI3OyUu
        7TJqR5bri2SDJAOJSVnM5Z1fbpNjOGG6AP5M+oxMGNZEWkGwI7Hsb4sKNGxGmvhI
        AUKPtfP6VSq9jUoZFyBPfnw3u8+U6+bNl/A5vG7WvW1LyTUBfBRD7r7oCXSBpQCx
        TOphU837MkLxS8j1OsFEDtPYldlGdiZl1vvRHOTQmZ/70Hef+F0K6TjEVnLeQO/3
        rwcWkMBzetthgrrKPFwJR31E5RkafFKLiixh1XU9lU8ft0Nm0Pp9DLLsGCRNd9bg
        ==
X-ME-Sender: <xms:oMEcYel3r6tW14ohxboieOvua6Q5_ag6QSdyjwU5rW7Rg8t1RgKKXw>
    <xme:oMEcYV2AM6C5yNHUBzSX6suoda96Kx5pKinKTOcbxkcjnYYMvPRSHAJS3iuyfzf4y
    9pmbXxd-mayDVkVLlo>
X-ME-Received: <xmr:oMEcYcqNXW4cg_-7g3txMxRiiZ-q4_8ZTLXjrOeRrYyQ74NVbXE-zBPxqlBbbD-K7i0P-kvgNgfrR1CeHuMlSIGLpxxENkf9APpq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oMEcYSlHVDKX5Xk1YEpyJOTIb9SfsDtZv1bZgw5e9pLBAVYpu9KK8A>
    <xmx:oMEcYc3m4IlzrOwBIwSox9d8dCS_1lGCI278o_w_3Z5d5ChxVqL6hQ>
    <xmx:oMEcYZsPAdDvsd5td1UVPfbWEZLBCTifd6eCiq_k-JwCt-IOl_XjnA>
    <xmx:o8EcYX3Q52OikCWntV5thyGm7TtP1McnSk0X6b8iba9pipF5ZrKsfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 04:15:28 -0400 (EDT)
Date:   Wed, 18 Aug 2021 10:15:26 +0200
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
Subject: Re: [PATCH v9 02/11] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210818081526.ejzqyz4tqvf2mmdj@gilmour>
References: <20210802003952.19942-1-andre.przywara@arm.com>
 <20210802003952.19942-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jw4w7fdrdj57gaky"
Content-Disposition: inline
In-Reply-To: <20210802003952.19942-3-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--jw4w7fdrdj57gaky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 02, 2021 at 01:39:43AM +0100, Andre Przywara wrote:
> Add the obvious compatible name to the existing RTC binding.
> The actual RTC part of the device uses a different day/month/year
> storage scheme, so it's not compatible with the previous devices.
> Also the clock part is quite different, as there is no external 32K LOSC
> oscillator input.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index beeb90e55727..d8a6500e5840 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
>        - const: allwinner,sun50i-h6-rtc
> +      - const: allwinner,sun50i-h616-rtc
> =20
>    reg:
>      maxItems: 1
> @@ -104,6 +105,19 @@ allOf:
>            minItems: 3
>            maxItems: 3
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun50i-h616-rtc
> +
> +    then:
> +      properties:
> +        clock-output-names:
> +          minItems: 3
> +          maxItems: 3

The comments I made here on the v7 are still relevant: you only need one
of these two, and the list of clocks should be documented.

Maxime

--jw4w7fdrdj57gaky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRzBngAKCRDj7w1vZxhR
xdHnAQCthhOj0Myap+OgRtaGj1JPwv/wVtAEsOsf0ajXVyutfwD9FIh6MpNJ/GC7
POzUJR3WJY93IHn9sXevpJMSQ3XLxAQ=
=HwrA
-----END PGP SIGNATURE-----

--jw4w7fdrdj57gaky--

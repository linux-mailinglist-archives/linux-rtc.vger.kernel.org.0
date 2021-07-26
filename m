Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6CE3D5BEF
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jul 2021 16:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbhGZOBP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Jul 2021 10:01:15 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:57863 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233206AbhGZOBO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Jul 2021 10:01:14 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id CAB13580422;
        Mon, 26 Jul 2021 10:41:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 26 Jul 2021 10:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=iVDLFnFaqPyU6ygsCm/rZzf8cgw
        XDYGnNuYlC3C9qO0=; b=sOoPnrKgIZqPxVRFVnrEQkdMvp9sIF7l9+Gh3ImJ+oL
        HnxOZ8U7AELAZr7TMzUKgZUQlx/8s620xdLtKMmbzwmcolHoSbN5i9O2ORmxF71n
        qpacyTLPe+y1cCVkupKXM5+hSE2SVhQNvwEZ82kLjCY5hDP9XmngRW7E6GoAGkRS
        0ahanFceojZL0F7yCuc5aEzXBYLMdyr9yU1tcyXs9H9t5/YZSGMnYW44Mq14LZJz
        TNr3m13GISNpu6ER12aJ3+vRU4C1eeZ9poji0w2z7YZ3l3Ov1JIvsjU8V/1HBuPu
        3ixEHshTRZ2KuHGDTx1ajqzZHWsnY/5GXfMklQcFllg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iVDLFn
        FaqPyU6ygsCm/rZzf8cgwXDYGnNuYlC3C9qO0=; b=tUljJ4ohL5+EutNVYmCfXP
        3iC/W2KNVYjxtnU1dZJ1EWAkPJhHhabD1ksogY75/6HbOit7FmbczxjMNE7uc7pu
        ycJWCqhvaBJuXlts2CiIi682qb7zefK8lInpdnuW4LykCQX2BGB1YdfeUxVKADpZ
        JQayHsAHGdJ7dX68NGeXFf7EZEbouQmCD4R86l0U8I8xmcyp+Jm2kTqJZPsVzGV+
        iJ70x6M/tZhAy7jZHbdl6LL6SgQIAo59p+5FJ4ylJW4eXe6jL8UbtCdXSnIt9ZzM
        o073eSY1iEPh7X6tKs2v/JjnDfDJ1S3FkMsv7lbnh7BceCXLwFFkT3eLrLcuhoJA
        ==
X-ME-Sender: <xms:pMn-YA-NZt5-eeap61mn_0PK3cDa_klkIkhU6hjahPHy0VOJU7xoFg>
    <xme:pMn-YIulLygpQ6-nsXr0DTqbvD-mtIL9_ZA18EvMQrAqxUgd3CKtNmm7KqaET12ew
    pPQF_HC6GnOhNuSxtI>
X-ME-Received: <xmr:pMn-YGC2iAiulA4cf2WHrjHoYIiYDGz1sIJJVrQ0fc1YJ0oL35LpG_wXBrMQX2dSxqOhd4u9m7vQNizv7GsazIb7_pLhLY1ZxwGl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pMn-YAdTcxvCBHEG_jWfMHUiTINCAewm0RouEQN5yQDeGUkQ0UWIIA>
    <xmx:pMn-YFNoaiVfVpOjDnzYpdAPGuKkkcoQyiK9HbJTx7Q9M2oTSFLjAg>
    <xmx:pMn-YKmZcy8IE4CuESC_7W34T5W6ipjgQGPDZPBxdsaoiThWjB9fAA>
    <xmx:psn-YLtnwRgTvnT3gOnyCT2tDy4TeZ5kFwzjlud_fSReho2I0XbDIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 10:41:39 -0400 (EDT)
Date:   Mon, 26 Jul 2021 16:41:37 +0200
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
Message-ID: <20210726144137.6dauuxdssu7yszox@gilmour>
References: <20210723153838.6785-1-andre.przywara@arm.com>
 <20210723153838.6785-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aiq5ywgupr4t6rom"
Content-Disposition: inline
In-Reply-To: <20210723153838.6785-3-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--aiq5ywgupr4t6rom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 23, 2021 at 04:38:29PM +0100, Andre Przywara wrote:
> Add the obvious compatible name to the existing RTC binding.
> The actual RTC part of the device uses a different day/month/year
> storage scheme, so it's not compatible with the previous devices.
> Also the clock part is quite different, as there is no external 32K LOSC
> oscillator input.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>
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

You don't need both of them when they are equal

> +        clocks: false
> +

It's not entirely clear to me what those clocks are about though. If we
look at the clock output in the user manual, it looks like there's only
two clocks that are actually being output: the 32k "fanout" clock and
the losc. What are the 3 you're talking about?

Also, it looks like the 32k fanout clock needs at least the hosc or
pll-periph in input, so we probably don't want to ask for no parent
clock?

Maxime

--aiq5ywgupr4t6rom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYP7JoQAKCRDj7w1vZxhR
xQRLAQDVnReS1EyY1LoZj+IrPcI0+iNFJA6ywfgcCyvxILsY1wEAwKCt/M3I7GRN
ZcZzGWYP2AxXqE9As3rd3HZaWUE/3Qw=
=irLn
-----END PGP SIGNATURE-----

--aiq5ywgupr4t6rom--

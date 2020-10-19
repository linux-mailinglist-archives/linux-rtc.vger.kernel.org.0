Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAB529234C
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Oct 2020 10:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgJSICK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Oct 2020 04:02:10 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60361 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727349AbgJSICK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Oct 2020 04:02:10 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id C04B65C0095;
        Mon, 19 Oct 2020 04:02:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 19 Oct 2020 04:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=diNf4gTcrGJ3qa0p8X7gPbgadP9
        Y6IqpNfM6jM0Hh4s=; b=kAbZFMELq71mZJsxYiaOkfub4NfLFEp0pfqTNqSiWiI
        5cndcP2tzMq/RatcPS9C0r7wDMdzqKZo0LzHhv0ejAAjGa/32H3JKAEHHdn9oP1w
        CBOEZ75Z8LYaGyXr1YqKEfwtBDyKDCMQE3VunuOkp4CeT79KPiA0WU93vEhgyifq
        2viPhTiGG1c8gfk/50f9p+MeDJxtiQnZfC7fldkhDhyNiqI1MVeaZcIqOEZBvl05
        M4u4JnQ6JbcsqmLC8zgkiYqw5I7PioLyyJc7jLAoLbZQWzJETcKS6xsklsu7Oin8
        QjyzNg/r754rFmMuvr7PFIMpz+pm8AQxzG2AHBVdlbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=diNf4g
        TcrGJ3qa0p8X7gPbgadP9Y6IqpNfM6jM0Hh4s=; b=VmHzEZ0VVY8T439Rwth8S7
        fZ1CNVi+bY9aqsV6vm65SnIPugNFtlGxSgB1hQ0sYPAq+cHvNn2Y+2dpbBjD1bgV
        o9QQckRZhbEwF3i1npTkTqyPRSJO+DkJB1LB/GfgW8gheO60XEUoyQhazhxC0zeq
        iFDBCbdHHpvTE4ZzuMcTagoSAwY0tSYabZVtv4/X5AVH8jKZo2rsXI9Lc55fyMGe
        mNYR8h0uNHxCXXz3LhzqhkAdRUnjNRx7PhVh2zVbJ88x6w/E5Xp3C96eHgeZJQzD
        IprjYBV/iIGrrOJ/msOpU3jQTdl+c6wujNNivlFBjet3XqY8q9rFRuLbPIHyA2oQ
        ==
X-ME-Sender: <xms:_0eNXwBEuUobue-BrwHJKTcLk0F1N_fX8rEYv2QFhd8udxWFRPwzOg>
    <xme:_0eNXygQ8DtBOLaNks7RKApsd1vFtuv8QeADj4j7ckg5EYvdamOIccOWP8YG2dq0d
    YHXHJWpwJLIp4e7JP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeduucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhi
    phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnh
    epleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieehgedunecu
    kfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_0eNXzkp-79Lj1PlzXJ2Xt6z9PLIl4_1htmKqbBLnc-SIdpglcKwuA>
    <xmx:_0eNX2wvaRhWEvjIux5iXOs5c16JEVlOzFZy96arHkuQZx-9-XHcsQ>
    <xmx:_0eNX1T9N4EyZ2N9ThHfkNj0mnZ85Ab9Ph-s8UuDZZeOW64A9ZyNww>
    <xmx:AEiNX-JE4Ru2m5pstkhKS7RaMarYyYgN_BqIhcBmkJFBsIsKL55v8w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 77AE4328006A;
        Mon, 19 Oct 2020 04:02:05 -0400 (EDT)
Date:   Mon, 19 Oct 2020 10:02:02 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
Message-ID: <20201019080202.kgjoksz27dgyov7q@gilmour.lan>
References: <20201018072810.4249-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eysahoho2ly5z2pe"
Content-Disposition: inline
In-Reply-To: <20201018072810.4249-1-dinghao.liu@zju.edu.cn>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--eysahoho2ly5z2pe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 18, 2020 at 03:28:10PM +0800, Dinghao Liu wrote:
> When clk_hw_register_fixed_rate_with_accuracy() fails,
> clk_data should be freed. It's the same for the subsequent
> two error paths, but we should also unregister the already
> registered clocks in them.
>=20
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>=20
> Changelog:
>=20
> v2: - Unregister the already registered clocks on failure.
> ---
>  drivers/rtc/rtc-sun6i.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index e2b8b150bcb4..6de0d3ad736a 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -272,7 +272,7 @@ static void __init sun6i_rtc_clk_init(struct device_n=
ode *node,
>  								300000000);
>  	if (IS_ERR(rtc->int_osc)) {
>  		pr_crit("Couldn't register the internal oscillator\n");
> -		return;
> +		goto err;
>  	}
> =20
>  	parents[0] =3D clk_hw_get_name(rtc->int_osc);
> @@ -290,7 +290,8 @@ static void __init sun6i_rtc_clk_init(struct device_n=
ode *node,
>  	rtc->losc =3D clk_register(NULL, &rtc->hw);
>  	if (IS_ERR(rtc->losc)) {
>  		pr_crit("Couldn't register the LOSC clock\n");
> -		return;
> +		clk_hw_unregister_fixed_rate(rtc->int_osc);
> +		goto err;
>  	}

The point of having labels for the error sequence is to avoid to
duplicate the error handling code in each and every error code path.

You should add another label for the fixed rate clock unregistration

Maxime

--eysahoho2ly5z2pe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX41H+gAKCRDj7w1vZxhR
xRfqAQCbiVNT+UE2hgDn0u6dUdHY1NXEECYdu7ux/kYlBLIZAQD+JfV+wU7KONeu
VRxjm3n3KRutZdb3BR0GnnVRQ4MWGAI=
=Jfv5
-----END PGP SIGNATURE-----

--eysahoho2ly5z2pe--

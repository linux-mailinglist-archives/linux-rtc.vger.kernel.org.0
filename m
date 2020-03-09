Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5369517E344
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2020 16:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgCIPRp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Mar 2020 11:17:45 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35291 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726918AbgCIPRp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Mar 2020 11:17:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5F4542208C;
        Mon,  9 Mar 2020 11:17:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 09 Mar 2020 11:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=eiBGI29FHei08t6XFORVjpCHPMk
        OAUq3d1gYSUqVL4g=; b=ONOY9KjdoN9Ygq7N2Jq3G8mxgcbdbzsZIlf+4N3P1U0
        2y7GuTVXX4ACmPPc7sCqwMBC3vZp/BHRYy1aZep4nnABEQogFWpkezpx6TaVm+ZP
        mDJhJKiq9Mw+iEVsy5ZuyrAmOgkjNPNyEJ7Dxl2II8puze3qi8nrNXTSG6AAeosu
        ylb+ubfc1SGkeWOqGmlNfjRw7W/Uvu5XSFqm+zluHQbhPcci0IBIp+fhG50C9vw5
        gvCtPZbn2HnSeuAStG75YZss7CD/WF+JCbRz3/5CefVbHDYCU7FrEj6QLnb580hB
        DkjSA1h9sZtLnmQ1xKGuNQIXuEX3AxeKONfLHt/ev5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eiBGI2
        9FHei08t6XFORVjpCHPMkOAUq3d1gYSUqVL4g=; b=FgOc4N0Ncq8b6lSP62JDG+
        qwNdaR9IN1uaHUPOA90xtyj0g0Wy+ScVImJER+RiR6Z+Zen7FQiUQMj+418ZFZ3d
        2dK+6hS3EVDeWFA23PUi17o2R7zgmfwDG33O6Q3e4ohemGyTcPUz35UbTMfdhoJe
        V2k6dWoRyLNlOJ+OxXAjg6HNxqYUmiV56sbsetDPuuMa5Riwm1nu1NHlJv57Nmq8
        Wg/HXXs3yGCL1LJUey+TvecAwyZZKXHP/D3UrdTJmWXvX5nwwnyKSeqNaGhk86Zr
        W65YHQ4gY6XCAWHt4xYN+WYcf8qGgcTsx2xito00hYhPC33U8KL8g8DIAPCfL74Q
        ==
X-ME-Sender: <xms:E15mXpWwSFYLVNYrVqz-nqUEjjKt0NsLgke6lJhfjFNAlgS-0PC4qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddukedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:E15mXuZDLxqrwOnsqS6WYZ7r46M_ksnCi_m2AvFWy7pObmPvzO1brQ>
    <xmx:E15mXmWsqpPyBORinJgfb_IZaZQ7hS1qMa194RN4fvcprTNPU5FHTg>
    <xmx:E15mXpWVOwYT1Fdg_C8XErH2-TJCTZ2z5eVhWEnxwM9mkwSCqvTnvw>
    <xmx:Fl5mXg5_-4Kv-Ps1ermAG47ZWOAfoLcEFHJlblcB1oYPS6yiE9xuNQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D8A0A3280063;
        Mon,  9 Mar 2020 11:17:38 -0400 (EDT)
Date:   Mon, 9 Mar 2020 16:17:37 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtc: sun6i: Make external 32k oscillator optional
Message-ID: <20200309151737.oklian4uskzsur7x@gilmour.lan>
References: <20200308135849.106333-1-jernej.skrabec@siol.net>
 <20200308135849.106333-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zmt2v6xvi26ix5fd"
Content-Disposition: inline
In-Reply-To: <20200308135849.106333-2-jernej.skrabec@siol.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--zmt2v6xvi26ix5fd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 08, 2020 at 02:58:48PM +0100, Jernej Skrabec wrote:
> Some boards, like OrangePi PC2 (H5), OrangePi Plus 2E (H3) and Tanix TX6
> (H6) don't have external 32kHz oscillator. Till H6, it didn't really
> matter if external oscillator was enabled because HW detected error and
> fall back to internal one. H6 has same functionality but it's the first
> SoC which have "auto switch bypass" bit documented and always enabled in
> driver. This prevents RTC to work correctly if external crystal is not
> present on board. There are other side effects - all peripherals which
> depends on this clock also don't work (HDMI CEC for example).
>
> Make clocks property optional. If it is present, select external
> oscillator. If not, stay on internal.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--zmt2v6xvi26ix5fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXmZd/gAKCRDj7w1vZxhR
xVw9AP0VCEgk97xX+BaDQqoGIYsBqjYiEQlNki/RjBw/7bId5QEA24cqSb8XbO7U
RhEPzJjA8PzDCNUq1swQ2hIvvURD6AI=
=BaHG
-----END PGP SIGNATURE-----

--zmt2v6xvi26ix5fd--

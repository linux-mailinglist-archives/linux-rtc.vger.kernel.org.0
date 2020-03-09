Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEAB17E359
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2020 16:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgCIPSK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Mar 2020 11:18:10 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40943 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726922AbgCIPSJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Mar 2020 11:18:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id BB9E322050;
        Mon,  9 Mar 2020 11:18:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 09 Mar 2020 11:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=FzkSUNOJXK4eu8BOSDV7DOU/ZSv
        0p8/ceeRaBi0OHNk=; b=mZjuohJ0nrVUq8Ue73mun2mtyARxgeJ/pndzyv8JVoq
        LLGkv8gIoDpQWf9UIDMKntzoe4ZexFB43zTNvXtGLioHPhijF3FPUtaDAmnnf3UX
        WAVwsMaH2V5m24509WN/OKYNSfSKDKu8GVzG2drbWNUpc04mnzOaSq2lj2J7XMge
        8Y/UaH0ccDs6oC+xFPI2n491EXkRpEshZUij3YU/X12ZWlLFP2F3MWoM/IG2vcIG
        b2qPqafr1n25DTUD6H8sYwqBpwFhR+CqDhOQubwHgY6oWOBtJuCcGMgeKlTGLcIo
        p2iBrjXVZr6ZAOJP2xm35t3EyApvzDvhWoKkqfj2hqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FzkSUN
        OJXK4eu8BOSDV7DOU/ZSv0p8/ceeRaBi0OHNk=; b=A/PofnUFdfVssU2mni2W9H
        7mnoSAT49qAooyCQVmUz+Cl42YTZU1JZERaZCdIqodYkLsdMS8IoLAAlFvZSASyj
        9bDTSlonWFG2Q56WfNxysMbi1aR21Iza2m69qbsvi91RtIOLZxdP/RFmj3w9Hbr7
        ApPni+iJY5xds7FKSWErx5YyVPRkEor+HpXgBXWTfSUF5Bx1trrFJQZFuIK1Q5YV
        eSpGIpRUGXssK4crjdQHu2szfcVnKoo5ewBwh2Jtteilq4VV73ZEoD+/El77ZAtE
        Qcv1DwI2BBw7keImgiSz4BIdiXPzy5iVoz2izn0oaERaozRlSZS0UJ2/6F5pq7+A
        ==
X-ME-Sender: <xms:MF5mXr180yGr00Kr_31--sZ11gGHmIwUmROBtRXaV9Yr-SRyuqnDQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddukedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MF5mXkWdGVq1UT1bBxS1jkvlAh__HZ4myBbz4np9x0C676ie2lrZYA>
    <xmx:MF5mXhWQ-M6iLmYQXobJM0O8J3Z-dlhsr5XUXP-8mX_YV3qTAMUSdA>
    <xmx:MF5mXnFWQ8WVdg27LQrhLc17QJJ6oNnFrU-OnznAdkQTZvqaFeKOCA>
    <xmx:MF5mXgUrUSNa6IpyrNAGFYeYHfV5k2i-0hwIypr3y7mqm3vIdqKdvQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id EFFB4328005D;
        Mon,  9 Mar 2020 11:18:07 -0400 (EDT)
Date:   Mon, 9 Mar 2020 16:18:06 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: h6: Move ext. oscillator
 to board DTs
Message-ID: <20200309151806.7sxgis4akb6zdmuv@gilmour.lan>
References: <20200308135849.106333-1-jernej.skrabec@siol.net>
 <20200308135849.106333-3-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="elcgw7ieqvmk4fns"
Content-Disposition: inline
In-Reply-To: <20200308135849.106333-3-jernej.skrabec@siol.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--elcgw7ieqvmk4fns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 08, 2020 at 02:58:49PM +0100, Jernej Skrabec wrote:
> It turns out that not all H6 boards have external 32kHz oscillator.
> Currently the only one known such H6 board is Tanix TX6.
>
> Move external oscillator node from common H6 dtsi to board specific dts
> files where present.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied, thanks

Maxime

--elcgw7ieqvmk4fns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXmZeLgAKCRDj7w1vZxhR
xellAP97yFvv1suUpEeMYtlmRBIx/T+Noww6myEv6ikcflh4ZwD9E0I1jVOnDbbP
S3hbh1vdMREygEhT05r0c3C4QcQ26A0=
=+m/H
-----END PGP SIGNATURE-----

--elcgw7ieqvmk4fns--

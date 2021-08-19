Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B093F149C
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Aug 2021 09:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhHSH5L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 03:57:11 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:41309 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229927AbhHSH5K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 03:57:10 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id AFC4D580B35;
        Thu, 19 Aug 2021 03:56:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 19 Aug 2021 03:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=0eV2e4Kt4bNdKmcOimi64QwDPOM
        ArP7lXcHLaxrh8n4=; b=yB3Iee0lCnm04lXOMQEZk+JX2ueSLYcimEiTt4Xrxkk
        1U+OewzOvufFTmoC4arfSdYIys9U6enZj7Xz/OkcIMUxGlz9GojIkPJTi0mxNH0f
        z2u14xUK+M47fvnVUkDggFNpyVbuiS8eXxfgBfOaWGuTb3AHnrExDmtV5FyzkiYC
        strWxxxtSyQBpheFn580ZjdKYmiTojb5TURqh9iKjfbxMQ1gxcLt109y6c5NH48V
        egiH1NGht9rbjPMFPVayW1IyOGaM5i3akxo/Ln5uR6HNuCP7Jj8d1k2dDl3hfcde
        Op5Lb3iMLt9+2I6zLf/lJPd5ljl59P4t/K8OzynRu7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0eV2e4
        Kt4bNdKmcOimi64QwDPOMArP7lXcHLaxrh8n4=; b=vHDw1246WMq7l281GJdEU/
        pssk45Uw94P1LqAelquOrLRrAWaPKElgJOtXGvmFpmE3me3E7my/JDQaGuUIwT/b
        s8Nr9xiPdumM0Mb+QbR2Blk0L/XdG8SyquDFZcw6WnqyQ1xcc2+tl8DbSakLJiu5
        XQ9rAtgtZYUvZlzoayu9eMTOGPdaHYltQ3hCvX6alkF5mmTFrtx1gk41vhVCQdJ5
        gPDcFWvEID1906UtZx2lsnuIkn3A70HQe3MvvkHCCkceiZtJpEkeWEQxXdmu96Lp
        fwtEZzWSE8PQ9B5Bi/o25cxdeMZknlIf9LoEG8QlGc+rzUqXZXkmg42ccvcQ+Qag
        ==
X-ME-Sender: <xms:rw4eYapFGf0AG-I5upgnqvQz6ox5Q-YNluUCTUnb-4dFHsrvdxomYQ>
    <xme:rw4eYYqBB2Uk6GCFGjIJi-DHSOWhrlUwp1aPONhNf7GthhLgMf140tyM90g49pSlG
    2_-HUc4TirgLB69sPk>
X-ME-Received: <xmr:rw4eYfN7LNF_y2CUJKot8gbzqYX4lPfs9IYMjtAXXhYELg0C1qr2tvwnQafeoVBT8u8e6iWI7r685jhbJf1DMKqBjpAp6iLEEZRW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeigdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rw4eYZ6ENEonOeb37AI--SlGM3sA76xCQ_Nh98Qhl4BQ-4MA6be5Ag>
    <xmx:rw4eYZ4vbklc_TlslhM_pp2nsxcU9fihvSHvtqu_RaHbHgJcsc2acQ>
    <xmx:rw4eYZjWQK0Nsls5co4ny5HXbO1BxnJ06cHLiHCBlBHLzAicWzaSBA>
    <xmx:sg4eYYLLmXkFsxwzVUAuB729wkA-ZTF4V4b-yGgfYpC_1v6DE71UHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 03:56:31 -0400 (EDT)
Date:   Thu, 19 Aug 2021 09:56:30 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 02/11] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210819075630.upliivqux4dsohzd@gilmour>
References: <20210723153838.6785-1-andre.przywara@arm.com>
 <20210723153838.6785-3-andre.przywara@arm.com>
 <20210726144137.6dauuxdssu7yszox@gilmour>
 <20210802013938.29fa18ed@slackpad.fritz.box>
 <20210817073810.7stuzrppyjf4spab@gilmour>
 <YRtvl2FWKqAw4b3l@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3hmvsdooooerg7xw"
Content-Disposition: inline
In-Reply-To: <YRtvl2FWKqAw4b3l@piout.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--3hmvsdooooerg7xw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Salut Alex,

On Tue, Aug 17, 2021 at 10:13:11AM +0200, Alexandre Belloni wrote:
> On 17/08/2021 09:38:10+0200, Maxime Ripard wrote:
> > > > It's not entirely clear to me what those clocks are about though. I=
f we
> > > > look at the clock output in the user manual, it looks like there's =
only
> > > > two clocks that are actually being output: the 32k "fanout" clock a=
nd
> > > > the losc. What are the 3 you're talking about?]
> > >=20
> > > I see three: the raw SYSTEM "CLK32K_LOSC", the RTC input + debounce
> > > clock (/32), and the multiplexed PAD.
> >=20
> > But the input and debounce clock is only for the RTC itself right? So it
> > should be local to the driver and doesn't need to be made available to
> > the other drivers
> >=20
>=20
> Shouldn't they be exposed to be able to use assigned-clock?

I'm not sure we would even need that? If it's an internal clock to the
RTC, then we probably won't ever need to change it from the device tree?

Maxime

--3hmvsdooooerg7xw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYR4OrgAKCRDj7w1vZxhR
xcfHAQD57em6KsLSV7qIaoRsDHdIufLm3Kb3PQEB8BalFLnh9wEAriRxL2uxqKaW
zsgaYApsMZjAkwzrGtWjndk9bGNnfQw=
=cvW0
-----END PGP SIGNATURE-----

--3hmvsdooooerg7xw--

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2709E3A9C76
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 15:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbhFPNuB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Jun 2021 09:50:01 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38611 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233467AbhFPNt7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Jun 2021 09:49:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 00B6D580533;
        Wed, 16 Jun 2021 09:47:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 16 Jun 2021 09:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=K7K8HmNdTN19CUzpoIecFYqJU9L
        x/mk0+DFc76H/lIQ=; b=mU99aKyC2cwAPsiRViyOpHWKzCdzvF6LDMZN3o16i3O
        gPD0dAImpbHCmJlrV29msEJ/M/l6VzjUjAjUhV9xEcZezJfXELf4R/qTNrDhTMyg
        /nY8RCwH7cEjn5biGY7Goy7AfNuDo6ghdoVKyDKR/sdyaQDt8djk92R7XuR7CpeF
        tO5z3QOJRIh37dIMCBTe8B2MEWZGrx1nF+pvD9DXKHj8/2Wbh1l1ov7GILFS7bsF
        kxtfx3Yvh8EaUP5f0FUXDSSDvSlgEUIR7ekaOgcjiSTsJpK+edggH+XFXSuHcsA5
        NGVIVusBneiuHsrfrMOwFKaG+lqLP0LvEcSD6+7xuLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=K7K8Hm
        NdTN19CUzpoIecFYqJU9Lx/mk0+DFc76H/lIQ=; b=fUMliT++5jIroIU/XwP7tr
        P27hGBTyp+Hng+IAYgoXoqY6awVYPoOsYd7Gqddpy2pP5aXuhrTX0mw0bQXT7B79
        KfP5tR3k16mywXXM9xXZC4CS/GJ5MWwmWt08THQk89mbWCm4Ilp/+wLmq3P2VtcO
        ZQdSLSSKj+/syucb5W6OH36qd1l758f6plGCcyrzV8Hy/WBp2FCLyYFUlYAua8N7
        fKfA7HKRqzi4mXnu5Q2l3Bh0nJiBoKLQD5wCwD75KKxvrFwNtD8Hc44mxXhzcAbI
        Mh5Riam2rj3g4pyE0uumVAQwvo9x4pzXGR5vU3Wszcb46B/z4thvYQNQwSpHVviQ
        ==
X-ME-Sender: <xms:BwHKYNA4b10RcSbtR_6S6gxvgUk7e3Dn5UEWWn9DppmdHcnsSpko2w>
    <xme:BwHKYLgsHL0T0dIPv1nD_oobnjpAuJCve2O1JFGVOPf8Sx_BjtcoJ8UIg_ObBX7Y5
    PfYI7qQe79dpIDkD8c>
X-ME-Received: <xmr:BwHKYImyLJZIB80WdI4qL5LiNNDvaxgqxN5GLzac8IiB-n9n7-LCrko7rbjWZjaMIVHoEYWQmKM8jLgeUEam1_ApLzzbfsiwO9CO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
    ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BwHKYHyGnsIE0gq1sfFVnzgDBh8ExP8mlZlTemq5ZO4tyqZDE1QCiA>
    <xmx:BwHKYCRv5ghfT_cD336fip4_LM2iOrehxOjHlD5gtTII_YG_8DeGJQ>
    <xmx:BwHKYKZGDgC8inVOOsJQ2y4b-056Yw6iqmO0HUbUp2-KPCbpKknHBA>
    <xmx:CAHKYJK_tdmU-Ja58__dYFrGllrSJRQ4MkAiE2d0L0XFphBkmWo2Mg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 09:47:51 -0400 (EDT)
Date:   Wed, 16 Jun 2021 15:47:49 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v7 06/19] rtc: sun6i: Add support for RTCs without
 external LOSCs
Message-ID: <20210616134749.mzp52dvbjmiabgl3@gilmour>
References: <20210615110636.23403-1-andre.przywara@arm.com>
 <20210615110636.23403-7-andre.przywara@arm.com>
 <20210616091431.6tm3zdf77p2x3upc@gilmour>
 <20210616111452.1d7f2423@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="imbf7s7uxyughhg5"
Content-Disposition: inline
In-Reply-To: <20210616111452.1d7f2423@slackpad.fritz.box>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--imbf7s7uxyughhg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 11:14:52AM +0100, Andre Przywara wrote:
> On Wed, 16 Jun 2021 11:14:31 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> Hi,
>=20
> > On Tue, Jun 15, 2021 at 12:06:23PM +0100, Andre Przywara wrote:
> > > Some newer Allwinner RTCs (for instance the one in the H616 SoC) lack
> > > a pin for an external 32768 Hz oscillator. As a consequence, this LOSC
> > > can't be selected as the RTC clock source, and we must rely on the
> > > internal RC oscillator.
> > > To allow additions of clocks to the RTC node, add a feature bit to ig=
nore
> > > any provided clocks for now (the current code would think this is the
> > > external LOSC). Later DTs and code can then for instance add the PLL
> > > based clock input, and older kernel won't get confused.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
> >=20
> > Honestly, I don't really know if it's worth it at this point.
> >=20
> > If we sums this up:
> >=20
> >  - The RTC has 2 features that we use, mostly centered around 2
> >    registers set plus a global one
> >=20
> >  - Those 2 features are programmed in a completely different way
> >=20
> >  - Even the common part is different, given the discussion around the
> >    clocks that we have.
> >=20
> > What is there to share in that driver aside from the probe, and maybe
> > the interrupt handling? Instead of complicating this further with more
> > special case that you were (rightfully) complaining about, shouldn't we
> > just acknowledge the fact that it's a completely separate design and
> > should be treated as such, with a completely separate driver?
>=20
> If you mean to have a separate clock driver, and one RTC driver: I
> agree, and IIUC Samuel has a prototype, covering the H6 and D1 as well:
> https://github.com/smaeul/linux/commit/6f8f761db1d8dd4b6abf006fb7e2427da7=
9321c2
>=20
> The only problem I see that they are sharing MMIO registers. Maybe it
> works because the RTC part never touches anything below 0x10, and the
> clock part just needs the first four registers?
> But this means we can't easily change this for the H6, as the
> existing H6 RTC code adds 0x10 to the MMIO base, and also old DTs will
> have the RTC base address in their RTC reg property.
>=20
> If we can somehow solve this (let the clock driver point to the RTC
> node to get a regmap?) I am all in, for the reasons you mentioned.

I meant having a separate RTC+clocks driver. I'm not really sure why we
need to split them.

Maxime

--imbf7s7uxyughhg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMoBBQAKCRDj7w1vZxhR
xbliAP9ffUPo3wF3pnVZcrXBLtFGjc2Rn5DdZDDyUE52eLFAjwD/VN2TJ+pjpVHW
Q+5MMaBNj8qfnkPn7dLqm6i/5LaoTQw=
=rIZz
-----END PGP SIGNATURE-----

--imbf7s7uxyughhg5--

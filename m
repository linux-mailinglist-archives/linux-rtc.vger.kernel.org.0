Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18FB3D5C88
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jul 2021 16:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbhGZOTD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Jul 2021 10:19:03 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:45579 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234837AbhGZOS7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Jul 2021 10:18:59 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0F50E58041D;
        Mon, 26 Jul 2021 10:59:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 26 Jul 2021 10:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=aafEayI1sVZWEQ+8Kldbq4Mehnl
        cqhooAS5lRNnCO7Q=; b=1xZtgOsNPwxRhKdemCXg5/P1UQ/TvHM4SDl8L/Wrepj
        uxm931dVSx7NZlCh5RaWw38eIDlyO+8DFnlyMMX7JNr0tM81i2kTMCUl8WpnodEI
        Crq/XQ8W8++H+nGxC/8Wy4ZsmoEXh7kNZVFKAOzZxFCDIrQa2ADfQzjag3RG/foi
        JLHNpezIBnAW9IYnySDRs2+i/5ItKePmc1l8of6gQRazAhWtKXjupKTAEyupanGJ
        B5ZGHbz5I4pbeFWBT4e9jv3JWk78QXmNAq/J83rC26g/6YC8QZjEABUqrun0zEnK
        7M87gSb/vgKBJgRGMoQKkfrkwIH+TIVkp2Z9St0uJPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aafEay
        I1sVZWEQ+8Kldbq4MehnlcqhooAS5lRNnCO7Q=; b=IDplYQoIDpe3BvYBGdCCGE
        ISvOzLFz4DkiFBdTRDWWDBFNzgh5CLpcQU4g6faWBjdPUWBApjP3wlIveSEqYACa
        oYsyrZXmbJjJGL864XGnfH8I7iBKk6AHkceKcTz/to6zJnCJ3W+fFwVznBm2cGJC
        T3fSBfryP7hSaY9eeIHYXOMSM40tD5PUAoznE0yPKXvT79NcOVFVOLZDYn7rSXZl
        l/eq5V9lVWe4kt6AQgjZD2E7w7UJCKfhUJ60AanLHqCVAKT9dn0JFA8ZNh6Dckm2
        vi4jXw9L3lAfgZObV3Xu7JETGAp1uOZ/K/2CTf/1k01VQ3d7k8fQYnubzzJMQSBA
        ==
X-ME-Sender: <xms:zs3-YOrglhDinUb178XSqdTPmaCBfUWUbwMF7pnA4x3Tyk3EnxwQAw>
    <xme:zs3-YMob_ilDdwC2CfszxsHIK7B0_okJ9Sa4iMNBVRCYty8cqj6g2HS4ptBf6ttkY
    tp29_x9Ad18wph46lY>
X-ME-Received: <xmr:zs3-YDOpwe8ntxr5nMc8bAc0upEOW-IEwCC3PDPVJWlyAac-AI1E4mtWIejMEeVSQQrrSBlhP6MGMf2vI8osB1d9yyl2m4SxN2NR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zs3-YN5IYI0swRCWggQbhtzS0YQMvgQY4l2fEnQUP_iWEgVZD7uGkA>
    <xmx:zs3-YN4-YqAaUbk-2cEucrS45SQyvXpPXPRNSlwYYMW7jXAT029yIQ>
    <xmx:zs3-YNjU3odC2wMq2IRedW0elXhyV8Qpfl3kAonXrpd4SdKh5Xxf-Q>
    <xmx:0M3-YFydLwFOWLiu5r3gu1u6_wPd77I0NZ-GuidvVzUER6i3P8sB2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 10:59:26 -0400 (EDT)
Date:   Mon, 26 Jul 2021 16:59:23 +0200
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
Message-ID: <20210726145923.mdk6llzqppczkv5v@gilmour>
References: <20210615110636.23403-1-andre.przywara@arm.com>
 <20210615110636.23403-7-andre.przywara@arm.com>
 <20210616091431.6tm3zdf77p2x3upc@gilmour>
 <20210723001721.0bb02cf2@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lfxsk3mfqv3tm5fy"
Content-Disposition: inline
In-Reply-To: <20210723001721.0bb02cf2@slackpad.fritz.box>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--lfxsk3mfqv3tm5fy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 12:17:21AM +0100, Andre Przywara wrote:
> On Wed, 16 Jun 2021 11:14:31 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> Hi Maxime,
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
> So I had a look, and I don't think it justifies a separate driver:
> - Indeed it looks like the core functionality is different, but there
>   are a lot of commonalities, with all the RTC and driver boilerplate,
>   register offsets, and also the special access pattern (rtc_wait and
>   rtc_setaie).
> - The actual difference is really in the way the *date* is stored
>   (the time is still in 24h H/M/S format), and the missing LOSC input
>   clock - which is already optional for existing devices. The two
>   patches just make this obvious, by using if() statements at the parts
>   where they differ.

My point was that the code that is shared, like the driver boilerplate,
is much more complicated than it can be precisely because it's shared.

I'd take two simple-but-with-some-redundancy drivers over one big,
shared but complicated driver any day.

But fine, I guess.

> So we would end up with possibly some shared .c file, and two driver
> front-end files, which I am not sure is really worth it.
>=20
> Next I thought about providing separate rtc_class_ops, but even they
> share a lot of code, so they would be possibly be calling a shared
> function each. I don't think that is really better.
>=20
> If you dislike the rather large if/else branches in the previous two
> patches, I could move that out into separate functions, but I feel this
> is more code, for no real benefit.
>=20
> So for now I am tempted to keep it shared. I think Samuel had ideas for
> bigger changes in the clock part, at which point we could revisit this
> decision - for instance keep the RTC part (still quite similar) mostly
> in a shared file, while modelling the clocks in separate files - in a
> more "common clock" style for the new SoCs.

What's the plan?

Maxime

--lfxsk3mfqv3tm5fy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYP7NywAKCRDj7w1vZxhR
xRY+AP41nD/WBdA9hAMZ6UcQge286Jku1Q+P63JZGaIwFd1zPgD7BOEoO8cWt8Fg
ep6EHpxzz7yzcEIouyu2MVJ5FNzHMQI=
=nHk2
-----END PGP SIGNATURE-----

--lfxsk3mfqv3tm5fy--

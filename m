Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 559BC166545
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Feb 2020 18:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgBTRry (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Feb 2020 12:47:54 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49071 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726959AbgBTRry (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Feb 2020 12:47:54 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 29CCD21B82;
        Thu, 20 Feb 2020 12:47:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 20 Feb 2020 12:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=OzZ5s0/+nPTILqp5qR3suIDlHla
        J5VfGwJdDzxiCG14=; b=SW1Wt5DPZub7FFigeTeXlQpSM8LZ6gVC61HOI9/kv1d
        OpiZc95TH2v3BcTOXKnHryH58+qEPeJJXAi4wi6CPiG78w7BiAELymaNs7f44xrp
        R74/kQwSh3Zlj4e3m8A03b1z3KAbWAX7mFXXKSA3PtHoFjaev/rCcHsfFgf3R/iM
        jiXTX9y+Xl8oEJas6DXUse6MbdYUpals/GUrAydIEriJfowz20tAEyytMk/GMKa0
        Te5ripKwZnUrU1xPxz0xrytRqdsMtVQxdKnd+TLXkIlT51/19NEV5nr7YW2smuCx
        BoD41TLhg5v07UzrCjcDipofT/gzQdn9urEO0GrKuxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OzZ5s0
        /+nPTILqp5qR3suIDlHlaJ5VfGwJdDzxiCG14=; b=w8pJuTV132EgFBMoe2QE65
        GESqRBWBAlWW4Foj4E3n9InYMPM89MlLcWdK4yLZhOXIJA+jDXYsCUnqLTh8DPU4
        1QrRCcWhxIi8IHaA14peWCIh1GMgHWiGE3SaCMNSGcodK6sslyUBYq6ynlCdK01V
        4KyZfW2y8Et1YIYppwvI3Rt6lV3kxg7P+lFb0szFIROkkzkbmBrk2xT8IXff3Sjp
        vFNM9bTL50KyY39C9l5UEMPh7rOpfELFb7fn5ogPOFGJuR5wASFugDT2bJ7TNCl2
        vjtKLi1TsLXE/W6glbtOlGA7TEiMG7csuys2yemPhrA5AV685MH5TNLxvohBWsug
        ==
X-ME-Sender: <xms:R8ZOXuTRwC9E3WP6cRy9axgkTnlp3ZOD0x0M5lMqyMVUwvv5e4Ve4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvffukfhfgggtuggj
    sehgtderredttdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimh
    gvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpehigidrihhonecukfhppeeltddr
    keelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R8ZOXtFQZvJPU359f3JzCx8yJ0rxAANuubZGxec8WsTLgaFACDKGPw>
    <xmx:R8ZOXoPuHeGQ0xiCv0zWqfUn406LPPunfI7firkigt6mtM_-ukia_g>
    <xmx:R8ZOXhlglNRMFqx8QNA--N3h1kPm1O0LAERLbCxP0Jcl8uOo630rgA>
    <xmx:ScZOXh8wSbiGXZfzswMdCmKY7XJc6tB5KYkH2OpAg6YSIbzHoLkrlA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 550143280060;
        Thu, 20 Feb 2020 12:47:51 -0500 (EST)
Date:   Thu, 20 Feb 2020 18:47:49 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: sun6i: Make external 32k oscillator optional
Message-ID: <20200220174749.ih3pcj3oxiwvuurz@gilmour.lan>
References: <20200213211427.33004-1-jernej.skrabec@siol.net>
 <20200213211427.33004-2-jernej.skrabec@siol.net>
 <20200214081443.ajz2sxh5ztk6qb2i@gilmour.lan>
 <5326350.DvuYhMxLoT@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qx7cvp6xg6zw344o"
Content-Disposition: inline
In-Reply-To: <5326350.DvuYhMxLoT@jernej-laptop>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--qx7cvp6xg6zw344o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 05:42:13PM +0100, Jernej =C5=A0krabec wrote:
> Hi Maxime,
>
> Dne petek, 14. februar 2020 ob 09:14:43 CET je Maxime Ripard napisal(a):
> > Hi Jernej,
> >
> > Thanks for taking care of this
> >
> > On Thu, Feb 13, 2020 at 10:14:26PM +0100, Jernej Skrabec wrote:
> > > Some boards, like OrangePi PC2 (H5), OrangePi Plus 2E (H3) and Tanix =
TX6
> > > (H6) don't have external 32kHz oscillator. Till H6, it didn't really
> > > matter if external oscillator was enabled because HW detected error a=
nd
> > > fall back to internal one. H6 has same functionality but it's the fir=
st
> > > SoC which have "auto switch bypass" bit documented and always enabled=
 in
> > > driver. This prevents RTC to work correctly if external crystal is not
> > > present on board. There are other side effects - all peripherals which
> > > depends on this clock also don't work (HDMI CEC for example).
> > >
> > > Make clocks property optional. If it is present, select external
> > > oscillator. If not, stay on internal.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > >
> > >  drivers/rtc/rtc-sun6i.c | 14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > > index 852f5f3b3592..538cf7e19034 100644
> > > --- a/drivers/rtc/rtc-sun6i.c
> > > +++ b/drivers/rtc/rtc-sun6i.c
> > > @@ -250,19 +250,17 @@ static void __init sun6i_rtc_clk_init(struct
> > > device_node *node,>
> > >  		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> > >
> > >  	}
> > >
> > > -	/* Switch to the external, more precise, oscillator */
> > > -	reg |=3D SUN6I_LOSC_CTRL_EXT_OSC;
> > > -	if (rtc->data->has_losc_en)
> > > -		reg |=3D SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > > +	/* Switch to the external, more precise, oscillator, if present */
> > > +	if (of_get_property(node, "clocks", NULL)) {
> > > +		reg |=3D SUN6I_LOSC_CTRL_EXT_OSC;
> > > +		if (rtc->data->has_losc_en)
> > > +			reg |=3D SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > > +	}
> > >
> > >  	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> > >
> > >  	/* Yes, I know, this is ugly. */
> > >  	sun6i_rtc =3D rtc;
> > >
> > > -	/* Deal with old DTs */
> > > -	if (!of_get_property(node, "clocks", NULL))
> > > -		goto err;
> > > -
> >
> > Doesn't that prevent the parents to be properly set if there's an
> > external crystal?
>
> No, why?
>
> Check these two clk_summary:
> http://ix.io/2bHY Tanix TX6 (no external crystal)
> http://ix.io/2bI2 OrangePi 3 (external crystal present)

I was concerned about the "other" parent. In the case where you don't
have a clocks property (so the check that you are removing), the code
then registers a clock with two parents: the one that we create (the
internal oscillator) and the one coming from the clocks property.

clk_summary only shows the current parent, which is going to be right
with your patch, but in the case where you have no clocks property,
you still (attempts to) register two parents, the second one being
non-functional.

Further looking at it, we might be good because we allocate an array
of two clocks, but only register of_clk_get_parent_count(node) + 1
clocks, so 1 if clocks is missing.

Still, I think this should be more obvious, through a comment or
shuffling a bit the parent registration maybe?

Maxime

--qx7cvp6xg6zw344o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7GRQAKCRDj7w1vZxhR
xQesAQC0dLTkjQRPv7nN8RoGvwkfQKD3MlJW0DS82ULs76MWzQD/XsYEwCgNWukt
Jfxdu03CMK7a7R+nH2HNRolTJSWwpgQ=
=5PFt
-----END PGP SIGNATURE-----

--qx7cvp6xg6zw344o--

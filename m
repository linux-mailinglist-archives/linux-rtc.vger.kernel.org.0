Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153986F7062
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 19:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjEDREQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 13:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjEDREP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 13:04:15 -0400
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90B62719;
        Thu,  4 May 2023 10:04:13 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id F1E2E580E6A;
        Thu,  4 May 2023 13:04:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 04 May 2023 13:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1683219852; x=1683227052; bh=Pk
        SQbmz2mEiFvQuMjYfFpQvVcVsNXX6yAK0DMQvrT78=; b=cmJlwLa8yhdC4PdQoI
        d0hb531eiI2SORxL3Fl3hrBicgmrIqTK2JruPb97I5kPMeDAKroA/qfvcVn4SHpi
        0GJwBwwJhVyBr0Z3gCWPJStGYlLHJVRHb8h+jKHQvCaAntRpesESAK3sBnsryQLT
        SY1pMZNm7NeXzxB0X4LGhh4tDtYGJwHvxymMS6zun/yeRMUOk17dwvfkedHb73tr
        HDJwJT3hqrDjvLymB2DkFIWIl9NAK1sqV8mngyOKOOkARjYozakGWeevZLdVnLJM
        2r9OCaZnJE/Iut75vl7CK6hrYFM8e09Zs5jDuDCIHU4E46AgWleB+oJARw3dPB4i
        nWXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683219852; x=1683227052; bh=PkSQbmz2mEiFv
        QuMjYfFpQvVcVsNXX6yAK0DMQvrT78=; b=AuagbG+sDeabBm6qygO9uf6q6oPyP
        ln51yGwNChqfoFi25xJw+emXpwH8g/NTNhI3i5k1yWKZiYlTlAS5rplMF6gQkK/e
        laonPFrlE/3b3UZB5kH5Oe8M2j6oYoZR4K3PB9E/ohKD6c/GRXCbuk26UWMvS6ps
        IGPMb413/9tdMInk8seyummLGmLiYcAs0royMw83PEXI5IllNN1DDdz1ub/MnRtP
        jNV3A8TnFjNuN73VANJme+us+/xozB2Fslb8vtM7RCSV5PVpN7WkauqzxtupFLrH
        w6KIslwyhc14ZQfGI9ojV26lTWu/2uydNx3dHVpk0RYe0JWyoFktgKk2g==
X-ME-Sender: <xms:iuVTZB3-j9J9v_I9u_nLe23G-6Km95qYmGddsS8j9B3EISxW2I58tQ>
    <xme:iuVTZIFcT7ZRU7I8Q-j_hIxB2UA45VX7YZUSc23XiwcJfwvL32Fc00IBM8g7HDbhY
    fDMxv-M9z8kq6nDOks>
X-ME-Received: <xmr:iuVTZB6hMgnVSN6caEFK-biUtu_4lRmFrrREwhLfK0aqpVD8obrAFVEs3OgODGka612q-Vxrss0VmiOBn_hzt2nWqkubj9U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeftddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepueevudehuedtkeevgfduveejueefvddvvefhjefglefgtdekveeugeet
    kefgleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iuVTZO352jeG413D2-8gCuvaVz9nzir5JVeGb9Qt5T66BjFUHxDI6A>
    <xmx:iuVTZEEch61XFzQdgNXpnEgchfdDLzHESPV9TD2R7L76K_Tm_CGCzg>
    <xmx:iuVTZP8JvDB9v2-05uIiSmwcEsdw1ZGXKd400N956wEG9rbS3yqRhA>
    <xmx:jOVTZIO2DARyLcbYRuAk0sTaKYb8VuLfnAb3kuIJaa_ZaJPDtFbScA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 May 2023 13:04:09 -0400 (EDT)
Date:   Thu, 4 May 2023 19:04:07 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        alsa-devel@alsa-project.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 29/65] clk: socfpga: gate: Add a determine_rate hook
Message-ID: <tgtfisqxubin4cjj6q26fboirbcnjzcazt5y3m322lw5lskz6l@d3tgz4hdfnk2>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-29-9a1358472d52@cerno.tech>
 <679921ee-98d4-d6ef-5934-e009fd4b31fc@kernel.org>
 <sjlp5ubnpvulgwhhymmfkmmobkgxacyqwagqozodkee3di2qik@3igj6k3zgbk6>
 <57dd81d0-510e-0fab-670d-1109eb8dd974@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wz33ctz6wi47hpno"
Content-Disposition: inline
In-Reply-To: <57dd81d0-510e-0fab-670d-1109eb8dd974@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--wz33ctz6wi47hpno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dinh,

On Thu, Apr 27, 2023 at 02:09:48PM -0500, Dinh Nguyen wrote:
> Hi Maxime,
>=20
> On 4/25/23 09:48, Maxime Ripard wrote:
> > Hi Dinh,
> >=20
> > On Mon, Apr 24, 2023 at 01:32:28PM -0500, Dinh Nguyen wrote:
> > > On 4/4/23 05:11, Maxime Ripard wrote:
> > > > The SoCFGPA gate clock implements a mux with a set_parent hook, but
> > > > doesn't provide a determine_rate implementation.
> > > >=20
> > > > This is a bit odd, since set_parent() is there to, as its name impl=
ies,
> > > > change the parent of a clock. However, the most likely candidate to
> > > > trigger that parent change is a call to clk_set_rate(), with
> > > > determine_rate() figuring out which parent is the best suited for a
> > > > given rate.
> > > >=20
> > > > The other trigger would be a call to clk_set_parent(), but it's far=
 less
> > > > used, and it doesn't look like there's any obvious user for that cl=
ock.
> > > >=20
> > > > So, the set_parent hook is effectively unused, possibly because of =
an
> > > > oversight. However, it could also be an explicit decision by the
> > > > original author to avoid any reparenting but through an explicit ca=
ll to
> > > > clk_set_parent().
> > > >=20
> > > > The latter case would be equivalent to setting the flag
> > > > CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate =
hook
> > > > to __clk_mux_determine_rate(). Indeed, if no determine_rate
> > > > implementation is provided, clk_round_rate() (through
> > > > clk_core_round_rate_nolock()) will call itself on the parent if
> > > > CLK_SET_RATE_PARENT is set, and will not change the clock rate
> > > > otherwise. __clk_mux_determine_rate() has the exact same behavior w=
hen
> > > > CLK_SET_RATE_NO_REPARENT is set.
> > > >=20
> > > > And if it was an oversight, then we are at least explicit about our
> > > > behavior now and it can be further refined down the line.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >    drivers/clk/socfpga/clk-gate.c | 3 ++-
> > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/c=
lk-gate.c
> > > > index 32ccda960f28..cbba8462a09e 100644
> > > > --- a/drivers/clk/socfpga/clk-gate.c
> > > > +++ b/drivers/clk/socfpga/clk-gate.c
> > > > @@ -110,6 +110,7 @@ static unsigned long socfpga_clk_recalc_rate(st=
ruct clk_hw *hwclk,
> > > >    static struct clk_ops gateclk_ops =3D {
> > > >    	.recalc_rate =3D socfpga_clk_recalc_rate,
> > > > +	.determine_rate =3D __clk_mux_determine_rate,
> > > >    	.get_parent =3D socfpga_clk_get_parent,
> > > >    	.set_parent =3D socfpga_clk_set_parent,
> > > >    };
> > > > @@ -166,7 +167,7 @@ void __init socfpga_gate_init(struct device_nod=
e *node)
> > > >    	init.name =3D clk_name;
> > > >    	init.ops =3D ops;
> > > > -	init.flags =3D 0;
> > > > +	init.flags =3D CLK_SET_RATE_NO_REPARENT;
> > > >    	init.num_parents =3D of_clk_parent_fill(node, parent_name, SOCF=
PGA_MAX_PARENTS);
> > > >    	if (init.num_parents < 2) {
> > > >=20
> > >=20
> > > This patch broke SoCFPGA boot serial port. The characters are mangled.
> >=20
> > Do you have any other access to that board? If so, could you dump
> > clk_summary in debugfs with and without that patch?
> >=20
>=20
> That dump from the clk_summary are identical for both cases.

Thanks for testing

I'm a bit confused, there should be no difference in behaviour, and if
there was any difference I would expect the clock tree to be somewhat
different.

Could you still paste the clk_summary (and dmesg) output? Which UART
driver is being used?

Also, is there a way for me to test it somehow?

Thanks,
Maxime

--wz33ctz6wi47hpno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZFPlhwAKCRDj7w1vZxhR
xctpAQD9sYYRJZv9h/D0iPAAtlYeOZYDF7u18IvdR8rTQHoA/wEAz3/h3C/WCX/e
9OHv6OkqMBGTFLQxWrqvIxshn0fuYg4=
=DIwC
-----END PGP SIGNATURE-----

--wz33ctz6wi47hpno--

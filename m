Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE1062293C
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Nov 2022 11:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbiKIKy2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Nov 2022 05:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiKIKxl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Nov 2022 05:53:41 -0500
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3684D29C96;
        Wed,  9 Nov 2022 02:53:12 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id DB383580373;
        Wed,  9 Nov 2022 05:53:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 09 Nov 2022 05:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1667991187; x=
        1667998387; bh=rFpYMyteGOfAqhSkg+1Bq7UwfUr5hnbTR+ptZFTnXBQ=; b=d
        9rjnj7HnOCP1X+SeQUgsQ3IucDnvzVGLm2dELGG3KHGc2Jaz/S56DblOlUBpxzB4
        F8quqM+/7OFrlXJn61DnRvwbQIZE/xZR2lNx7cP/SAXozs7KtEYdwt02SrGKK7o1
        us2EVYHqbSj7KNt7xi1NhBc9wKAP8MfhUM0qaadptAb+neoi1BJ6o1QmkqU02Yfe
        0berZ0jxZQyBFqCfBIp+3sxuin8dyghdLbYvan6AnvyFPiMh0OpKlO0Q873v29v6
        40IUtYpj5tqlPVfpABde2xwOgYTe4Z5iqblUUuTOjmN5BKyv6bKPG374pPg/EJaH
        zFSsQ9oCcIk4mHkKvPhAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667991187; x=
        1667998387; bh=rFpYMyteGOfAqhSkg+1Bq7UwfUr5hnbTR+ptZFTnXBQ=; b=p
        RvaZdegoo2TmyzmHQIkCS03rw/7QVrFwy+X8QhAzFw/G6qH9r4J8ABXk7q+j013D
        ry+b+FzVgm0cS7diKNbZIv8W01PzwZlHlybUaFDwHWe++fB9Op0H6BXbZfkn22Hb
        HvbxHtoCFEWsveHrV0TtYwlGYDxy/N64quV1biXWdpdhxuqaEoVLtJHi4MSKcD71
        QIwwAaG97ix6C0FRIJAb1kYZvY5gxrN6RnsFwtHkfpGM26U/bkbi4xxQnTAt3imD
        yTtVN1SLm0l2gXP7IeFVD2+1W71uoDjiXRfgUjYx78vkchBd4D0CxIUrqYHRYOde
        vbFo6b6W4+xzk/AGPivkg==
X-ME-Sender: <xms:kYZrY-tLlhO6ZUAX9-k6sQ88O6bV79mbri2Vu76BsCNU2WtceqQM4g>
    <xme:kYZrYzeRzW2Xx9j5Vy5SrsKV1Axlb9W7IJm4to7NCoXBCQ2mA7sktDRmLvppOlH7N
    Ko8eEGURV2x6lC8hQM>
X-ME-Received: <xmr:kYZrY5yWEvlS3RcwFJ1Q8cnZOAMPeg8WoMGw9hs3jjQWSwoi2Bl17bow8ZYnQgjDaEptl70M9As3mQrrybOu4MsyWITW4LGGQ4fSrvKPerqqkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedvvdei
    ledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kYZrY5O07SRD6puA3358osiXrtuSMFdGVdRTIqNB_Y1j0e2kCrf3cA>
    <xmx:kYZrY--4OXcwxilx3M7PefuYPOE7Q-cNXA_rzfVHe3YNDICUyK2Sxw>
    <xmx:kYZrYxUU9d6D9QOR4wgnmfdDTJak7SCgP6L9mst33jeFoqJvvYx3Lg>
    <xmx:k4ZrYzEPHAcIp0kQHYqoCO6CcZhqHoAWErXk2GU8pNi2CThqinPAvA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 05:53:03 -0500 (EST)
Date:   Wed, 9 Nov 2022 11:53:01 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Takashi Iwai <tiwai@suse.com>,
        David Airlie <airlied@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Lechner <david@lechnology.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-stm32@st-md-mailman.stormreply.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Message-ID: <20221109105301.ueus7o3b75j5yeff@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <IOEVKR.TWFKJND2FJ473@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <IOEVKR.TWFKJND2FJ473@crapouillou.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Paul,

On Sat, Nov 05, 2022 at 10:33:54AM +0000, Paul Cercueil wrote:
> Hi Maxime,
>=20
> Le ven. 4 nov. 2022 =E0 15:59:46 +0100, Maxime Ripard <maxime@cerno.tech>=
 a
> =E9crit :
> > Hi Paul,
> >=20
> > On Fri, Nov 04, 2022 at 02:31:20PM +0000, Paul Cercueil wrote:
> > >  Le ven. 4 nov. 2022 =E0 14:18:13 +0100, Maxime Ripard
> > > <maxime@cerno.tech> a
> > >  =E9crit :
> > >  > The Ingenic CGU clocks implements a mux with a set_parent hook,
> > > but
> > >  > doesn't provide a determine_rate implementation.
> > >  >
> > >  > This is a bit odd, since set_parent() is there to, as its name
> > > implies,
> > >  > change the parent of a clock. However, the most likely candidate
> > > to
> > >  > trigger that parent change is a call to clk_set_rate(), with
> > >  > determine_rate() figuring out which parent is the best suited for
> > > a
> > >  > given rate.
> > >  >
> > >  > The other trigger would be a call to clk_set_parent(), but it's
> > > far less
> > >  > used, and it doesn't look like there's any obvious user for that
> > > clock.
> > >  >
> > >  > So, the set_parent hook is effectively unused, possibly because
> > > of an
> > >  > oversight. However, it could also be an explicit decision by the
> > >  > original author to avoid any reparenting but through an explicit
> > > call to
> > >  > clk_set_parent().
> > >  >
> > >  > The driver does implement round_rate() though, which means that
> > > we can
> > >  > change the rate of the clock, but we will never get to change the
> > >  > parent.
> > >  >
> > >  > However, It's hard to tell whether it's been done on purpose or
> > > not.
> > >  >
> > >  > Since we'll start mandating a determine_rate() implementation,
> > > let's
> > >  > convert the round_rate() implementation to a determine_rate(),
> > > which
> > >  > will also make the current behavior explicit. And if it was an
> > >  > oversight, the clock behaviour can be adjusted later on.
> > >=20
> > >  So it's partly on purpose, partly because I didn't know about
> > >  .determine_rate.
> > >=20
> > >  There's nothing odd about having a lonely .set_parent callback; in
> > > my case
> > >  the clocks are parented from the device tree.
> > >=20
> > >  Having the clocks driver trigger a parent change when requesting a
> > > rate
> > >  change sounds very dangerous, IMHO. My MMC controller can be
> > > parented to the
> > >  external 48 MHz oscillator, and if the card requests 50 MHz, it
> > > could switch
> > >  to one of the PLLs. That works as long as the PLLs don't change
> > > rate, but if
> > >  one is configured as driving the CPU clock, it becomes messy.
> > >  The thing is, the clocks driver has no way to know whether or not
> > > it is
> > >  "safe" to use a designated parent.
> > >=20
> > >  For that reason, in practice, I never actually want to have a clock
> > >  re-parented - it's almost always a bad idea vs. sticking to the
> > > parent clock
> > >  configured in the DTS.
> >=20
> > Yeah, and this is totally fine. But we need to be explicit about it. The
> > determine_rate implementation I did in all the patches is an exact
> > equivalent to the round_rate one if there was one. We will never ask to
> > change the parent.
> >=20
> > Given what you just said, I would suggest to set the
> > CLK_SET_RATE_NO_REPARENT flag as well.
>=20
> But that would introduce policy into the driver...

I'm not sure why you're bringing policies into that discussion. There's
plenty of policy in the driver already, and the current code doesn't do
something that the old wasn't doing (implicitly).

And there's plenty of policies in drivers in general. Whether you limit
the rate or not, whether you allow reparenting or not, even the
CLK_SET_RATE_NO_REPARENT flag mentioned above is a policy decision set
by drivers.

> The fact that I don't want the MMC parented to the PLLs, doesn't mean
> that it's an invalid configuration per se.

Sure, and that's another policy :)

Maxime

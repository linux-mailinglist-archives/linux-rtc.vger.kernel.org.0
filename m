Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B163DA115
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jul 2021 12:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbhG2Kci (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Jul 2021 06:32:38 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40933 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235309AbhG2Kch (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Jul 2021 06:32:37 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0C8F45808AB;
        Thu, 29 Jul 2021 06:32:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 29 Jul 2021 06:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=4
        p33TcQrDT0su6nNnp8CfeYZh0a1YwnH+3qX4uO2KEI=; b=OHtBvYsNvP4S3/81C
        uQeJ5TScMUoomJei1HmFbMroPPA7HmjVZ5qHybtjMH5R2xQJJYlA6be2A7kLGaWe
        PR5LsvTVnsXvA+gZgey9rSxqsrEoLy3sFdqj1ulmlfWCKkr7FbYYDA2mf4fW1Eco
        5D7VTvpjIOL9fSGLGbNns+1HFugVby2TeyHVxdEHijLqdX5L3s3pElMkDXP/72hh
        is75qYrGfb3XJn8oWYgu4ztv8aN4V5582lqiXtjdM9A3271ioJG6VghDsHR3OcaB
        WyrYMkgAj9fSwMfdiYvEqHORWaVmAU4HfM6ubDBj77VgTJi6oyKBs1LXX1AFhOzH
        uKy0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=4p33TcQrDT0su6nNnp8CfeYZh0a1YwnH+3qX4uO2K
        EI=; b=itDMqA4EcVciNeJfRnM99ptZB3Nr7NQk2gVFYhAaW0CC1o/2mcgvYxp7o
        UkkO6Tgd/BGeAZb0vUock7BjgXnvbIi1Uf2vYaDNGhfxtikVizlybgCdlUS4vckW
        aOd4oANVn+hCLzTmVRnS3NwB0SBxKJJvd8Mgb89BQ5lbwNKyNvv9T1N67GMlFq2Q
        HeJYgVB4xJ2WemOREXF9WswK2lmvHDI5/okUUN2mSaRkkzMHIIOO9BiGQb21c9Ys
        3TbOwc18kQtu+bOpmJcN8QdZNgj3kDFZ8PJutiIRj5rrm3ivHY8FCb8UNwU96pYV
        wGkHiLaBf52N0GcqSjaLwdcd7xLfg==
X-ME-Sender: <xms:v4MCYX2DTjNRxkbQcXeAo13T3ts4ic8DjrOrpBO8p7S7FKJbOIfUQw>
    <xme:v4MCYWFmwkdlOSCSSnRZqKfCBmS7BDLO-nolzpjGLT7qZDjwTX040DvrfRy4Wie6H
    WGJUvX3XX8Rwa0vLOA>
X-ME-Received: <xmr:v4MCYX4VjazlhTG6a62ad0zE_cOY--q1jx2qPYBaVxCspkcZ19BAhf9E9Nt1Ud5laL42iRIZqb6nd0LGT2f9d-KW5e7c6-U_Htb5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedugddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejjeekjedttdethedtfeelteefffduvdevvdfhtdeiudetleejgeelfeef
    uedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:v4MCYc3GbJLGUxfYCXOWqOLWAkAGcb2x_prAYoVQUR6XSq0liXmI6g>
    <xmx:v4MCYaGXLFp6wLczjM-wGqeNStOoe5D8Gf2AlTQ4eRgn_yPxYlEyIg>
    <xmx:v4MCYd_RiVwZTSl2LFjYKW6feKrhEcBF5vvsupfOJ5U9LnacTkI9xg>
    <xmx:woMCYRcYD6mI_zYUGYXj5ILDso__6Uhyv7DcKgKC5EqsnUg2L9Bnog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jul 2021 06:32:31 -0400 (EDT)
Date:   Thu, 29 Jul 2021 12:32:28 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v7 06/19] rtc: sun6i: Add support for RTCs without
 external LOSCs
Message-ID: <20210729103228.prdav7eobi52y3ny@gilmour>
References: <20210615110636.23403-1-andre.przywara@arm.com>
 <20210615110636.23403-7-andre.przywara@arm.com>
 <20210616091431.6tm3zdf77p2x3upc@gilmour>
 <1e49692a2f4548ae942e170bc1ae9431a6eb512e.camel@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1e49692a2f4548ae942e170bc1ae9431a6eb512e.camel@aosc.io>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jul 29, 2021 at 04:04:10PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2021-06-16=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:14 +0200=EF=
=BC=8CMaxime Ripard=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >=20
> > On Tue, Jun 15, 2021 at 12:06:23PM +0100, Andre Przywara wrote:
> > > Some newer Allwinner RTCs (for instance the one in the H616 SoC)
> > > lack
> > > a pin for an external 32768 Hz oscillator. As a consequence, this
> > > LOSC
> > > can't be selected as the RTC clock source, and we must rely on the
> > > internal RC oscillator.
> > > To allow additions of clocks to the RTC node, add a feature bit to
> > > ignore
> > > any provided clocks for now (the current code would think this is
> > > the
> > > external LOSC). Later DTs and code can then for instance add the
> > > PLL
> > > based clock input, and older kernel won't get confused.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >=20
> > Honestly, I don't really know if it's worth it at this point.
> >=20
> > If we sums this up:
> >=20
> > =C2=A0- The RTC has 2 features that we use, mostly centered around 2
> > =C2=A0=C2=A0 registers set plus a global one
> >=20
> > =C2=A0- Those 2 features are programmed in a completely different way
> >=20
> > =C2=A0- Even the common part is different, given the discussion around =
the
> > =C2=A0=C2=A0 clocks that we have.
> >=20
> > What is there to share in that driver aside from the probe, and maybe
> > the interrupt handling? Instead of complicating this further with
> > more
> > special case that you were (rightfully) complaining about, shouldn't
> > we
> > just acknowledge the fact that it's a completely separate design and
> > should be treated as such, with a completely separate driver?
>=20
> I think our problem is just that we're having a single driver for both
> functionalities (clock manager and RTC).
>=20
> Personally I don't think we should have seperated driver for clock
> managers, although I am fine with seperated RTC driver for linear days.

Why do you think it's a bad idea to have the RTC and clocks in the same
driver?

Maxime

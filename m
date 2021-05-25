Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8FF38FCAB
	for <lists+linux-rtc@lfdr.de>; Tue, 25 May 2021 10:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbhEYI0L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 May 2021 04:26:11 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38395 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232367AbhEYIZw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 May 2021 04:25:52 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 20E84134E;
        Tue, 25 May 2021 04:24:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 25 May 2021 04:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=T/RJ8jiQp+vj5a/FxgpoVSB6RkM
        3N/iycSA1uRI4V9Y=; b=E6LWyS/AL240aCpCg0oTZ0rCRNqvK1REKMqJETsp6so
        q8bfE9MS9h+VozUQoEM7hi/MhlIGzcU9L9B3d92VM2ZBSjkNvOYcNKPiH+GknLad
        n16W/ULfrI6TMp7ZbmIOZ1ZuakKGOWlJwh8u1tpuXtyiU6vby671YCqzpRGeOX4O
        iRBl7qXSg019Ix0yP//PuJq5u+OyVnMRa2UY9qZTPj2/BqoiiILzZCpZ8nfBgjps
        6+lbg0z6EaZB6hidK1/INdMhQirD5KHhA1/VwHU65RretnDgMq8pWnmV35EjZEeA
        AaHtRvMEoLYJ/pU6afEVixqLqjKOV5jb0Fx5fB43LTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T/RJ8j
        iQp+vj5a/FxgpoVSB6RkM3N/iycSA1uRI4V9Y=; b=G7dCijkWcD6Lo0klqzMSxH
        ZxaL1q8SPZdGtIDYRuc1Og+3VIhFgLezP22O7J0VvY3isFt2CWnbADdWA0aWrF1m
        +W1/OKIC75NNW7Jjk9ll2uRKNs1Q2TeWpAheJC7Kjhb/NcU5YK3Lvdy/DxR1Wlqy
        k7hF5RmeOFosvr8irUzajWUz2Tkz9LNtpnEcEuwWRME0MwTJUsI+tcH7iAn6/Z3X
        bnB0+9NWFpwcqay0VZHUnZiU71fQeBdFxbMnopZ3ge8HgJejaKba1llJuNRiNNg/
        O+d/bAs/9cHOWCaVGDRI61OuTJQJlGc/lu/JBm/HIRDxcxr6UfopSN6IEUslPMJw
        ==
X-ME-Sender: <xms:MrSsYKDHe2Ve7v8xMI1Nm-a-Z3DFZ4uRgcybubU-Uy_Pmb1WDFqotQ>
    <xme:MrSsYEjbg3rskx2DGuWGP_G-bZbjXHEl32nUCJCBsGKbiBk_WVT-dHq6Q15OvLRE4
    2lD-lsiFdxrDspGWPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MrSsYNll5y5WwZSPVPEKuqejkPFgqJ5GoaLDJKTLzm255XlGrXpKjg>
    <xmx:MrSsYIy_9jRluU9lX4uKu4yNWdDoCW3uZAbgnJJ5Mid3sKu8tZHUYQ>
    <xmx:MrSsYPQae3bCTC5d9gLbFOA_f3KPKx1eomLafcxRerXw_Efe3qwcFA>
    <xmx:NLSsYOFU6tt5S4gLXNDuSCFbPHAAg5k6GxhBt3Zcf51S5RznFDSZiw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Tue, 25 May 2021 04:24:18 -0400 (EDT)
Date:   Tue, 25 May 2021 10:24:16 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: Add NVMEM provider
Message-ID: <20210525082416.jkqmlkbdx6nhrens@gilmour>
References: <20210419014549.26900-1-samuel@sholland.org>
 <20210430090206.lybmygrt636nysoc@gilmour>
 <a3b03a06-c8fc-7dbe-7c0b-ffd1f194ecbc@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4ls3b5jytkdblw2f"
Content-Disposition: inline
In-Reply-To: <a3b03a06-c8fc-7dbe-7c0b-ffd1f194ecbc@sholland.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--4ls3b5jytkdblw2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 09, 2021 at 10:39:30PM -0500, Samuel Holland wrote:
> On 4/30/21 4:02 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sun, Apr 18, 2021 at 08:45:49PM -0500, Samuel Holland wrote:
> >> The sun6i RTC provides 32 bytes of general-purpose data registers.
> >> They can be used to save data in the always-on RTC power domain.
> >> The registers are writable via 32-bit MMIO accesses only.
> >>
> >> Expose the region as a NVMEM provider so it can be used by userspace a=
nd
> >> other drivers.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >=20
> > As far as I understood, you want to use those registers to implement
> > super-standby? If so, while it makes sense for the kernel to be able to
> > be able to write to those registers, I guess it would be a bit unwise to
> > allow the userspace to access it?
>=20
> I want the user to be able to pass information to the bootloader (to
> select a boot device, e.g. reboot to FEL). I also want the user to be
> able to read data stored to these registers by system firmware (e.g.
> crust writes exception information there). It's not really related to
> standby.

What information do you want to provide? This looks like punching
through the abstraction layer provided by the kernel. This is also an
issue since it ties an ABI to the use of crust: if there's another user
for those RTC registers at some point, the userspace would have no way
to tell whether or not crust is being used and might get complete
garbage (compared to what crust usually provides) instead.

> I would want to stack a nvmem-reboot-mode on top to give friendlier
> names to some of the numbers, but I don't see a problem with root having
> direct access to the registers. It's no different from /dev/nvram
> providing access to the PC CMOS RAM.

And those solutions have issues too. efivarfs for example can totally
brick the system it runs on if the user has an unfortunate rm -rf.

Maxime

--4ls3b5jytkdblw2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKy0MAAKCRDj7w1vZxhR
xR+VAP0ZpqtCK0cgTcMjk72tdAhvDqLefB0iokheh3dtgHzhfAEAv6UX65vsXn/P
qCCHgsLdWfCH+BHEVtSEd+X1hNOuJwk=
=TKw9
-----END PGP SIGNATURE-----

--4ls3b5jytkdblw2f--

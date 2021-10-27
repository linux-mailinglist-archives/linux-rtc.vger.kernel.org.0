Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE23143CF7B
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Oct 2021 19:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236756AbhJ0RMT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Oct 2021 13:12:19 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:54286 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhJ0RMR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Oct 2021 13:12:17 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 53458F4076F; Wed, 27 Oct 2021 19:09:50 +0200 (CEST)
Date:   Wed, 27 Oct 2021 19:09:49 +0200
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: nintendo: Add a RTC driver for the GameCube, Wii
 and Wii U
Message-ID: <20211027170949.kaalftusbukhwzq3@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <YXmCQnJTujtak+Qy@piout.net>
 <20211027170527.za6xlwvmzmulgqoa@luna>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d7jl2ukwggmnu2gg"
Content-Disposition: inline
In-Reply-To: <20211027170527.za6xlwvmzmulgqoa@luna>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--d7jl2ukwggmnu2gg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 07:05:27PM +0200, Emmanuel Gil Peyrot wrote:
> On Wed, Oct 27, 2021 at 06:45:54PM +0200, Alexandre Belloni wrote:
[=E2=80=A6]
> > >  drivers/rtc/rtc-nintendo.c | 305 +++++++++++++++++++++++++++++++++++=
++
> >=20
> > I'm not convinced this is a good name, seeing that the switch will
> > certainly not use this driver (neither is the snes mini).
>=20
> Other subsystem maintainers have requested this to be changed, so I
> reflected it here too.  For instance hid requested a Wii=C2=A0U-specific
> driver to be merged with the Switch one.
>=20
> Would rtc-gamecube be fine then?  So far I have only tested on Wii=C2=A0U,
> but this driver is expected to support all three generations of
> GameCube, Wii and Wii=C2=A0U.
>=20

Another thing to note is that the Switch would be a Nvidia platform, and
the NES Mini an Allwinner platform.  This would leave the DS/DSi/3DS to
be a custom SoC with their own RTC implementation different from this
one.

--=20
Emmanuel Gil Peyrot

--d7jl2ukwggmnu2gg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmF5h90ACgkQOWgfYkb2
LpBnrQf/WxHZRnVbc+R68ha+65o4XEfkVbLJK+jJQMFntI9dRroTzLCT2CxIa/tK
o1NU13YdVQagWAujor3uznAQdxPgNloG0B+bwpU2VF4P/3Cczch/rg9vLHak0ILn
7gV8r5JD3KYrnJEzxFEowHMip/DrR+wGjVkcTCQKEgouvN0bigE7NJaZB2eJLmGe
SKdgv0IpREvgHs9XNMKcdNHOXVK7ouoqKmwxh2qKKX5GfhO00uSIybLzO1jDrXR+
4m597A/ROiNY+K9kTMCyhiHpLpYToGSeP0r8+hRPzIBD7UPtMQ4ISuIdpEq95hOj
pb+RIxjxk6iSQKFv1H8soKZxjDE/ew==
=FuBV
-----END PGP SIGNATURE-----

--d7jl2ukwggmnu2gg--

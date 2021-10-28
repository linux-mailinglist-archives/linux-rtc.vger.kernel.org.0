Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A9843F1D2
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Oct 2021 23:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJ1Vgq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Oct 2021 17:36:46 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:42406 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhJ1Vgq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Oct 2021 17:36:46 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 43B31F40C9C; Thu, 28 Oct 2021 23:34:14 +0200 (CEST)
Date:   Thu, 28 Oct 2021 23:34:13 +0200
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Alessandro Zummo <a.zummo@towertech.it>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        Ash Logan <ash@heyquark.com>, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: nintendo: Add a RTC driver for the GameCube, Wii
 and Wii U
Message-ID: <20211028213413.7lpd62vzs46ru7ul@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <YXmCQnJTujtak+Qy@piout.net>
 <YXsIwGmgy+ZIyvWI@latitude>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="746juvgefw2w5bfx"
Content-Disposition: inline
In-Reply-To: <YXsIwGmgy+ZIyvWI@latitude>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--746juvgefw2w5bfx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 08:32:00PM +0000, Jonathan Neusch=C3=A4fer wrote:
> Hi,
>=20
> On Wed, Oct 27, 2021 at 06:45:54PM +0200, Alexandre Belloni wrote:
> > Hello Emmanuel,
> >=20
> > Thanks for the patch!
> >=20
> > On 15/10/2021 00:05:24+0200, Emmanuel Gil Peyrot wrote:
> [...]
> > Something great to do would be to convert the driver to regmap, provding
> > custom regmap_read and regmap_write functions to access the EXI bus.
> > Then you'd get this directly in debugfs. And this could be split ou once
> > other drivers need access to the bus (I guess power/reset at some
> > point).
>=20
> Ultimately, a proper bus driver might be even better. Another popular
> (but 3rd-party) device on the EXI bus is the "USB Gecko", a serial port
> adapter.

The gc-linux project had such a bus driver, and I think also an
USB=C2=A0Gecko driver, but from what I remember they got rejected in the
kernel.  I=E2=80=99d have to do some archeology to figure out why though.

Still, maybe it would be sensible to port their 2.6.32-era driver?

I have one such USB=C2=A0Gecko btw, so I should be able to test against it.

>=20
> (But I realize it might be significantly more work. Not sure.)
>=20
>=20
>=20
> Best regards, and in any case still thanks for working on the GC/Wii/U
> platforms,
> Jonathan

--=20
Emmanuel Gil Peyrot

--746juvgefw2w5bfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmF7F1IACgkQOWgfYkb2
LpBuuwf/XcDN07K5PZoIS/MNunEV8ZTzK1qddRET7yJcqTfZoeZCFP5ztG0u9+Ax
PoUlly5g/0LT+TgF84zw8bfZCaIa7djTouSBKPEWR082mcEwQIPs6z+CKKeEKMvc
kdrz1iLB+d2CTPmGWKA5GDOGylnezxhoC1r9PV3JhcltB1yvBPJe8qkhUQM2Gs1M
whYVWagr6NYK38JyzdJAZIwHtIwyAXQ8hxncSkeHGHjQ2muvmWj2GsliWPTf1x4x
ZF+wZLSbnGY4FGOa841tJChuVMmYFb7Zm+GS3jkFRJOj3DqgCwx1pdcp4EnQjeVE
q42eGvVz71NNMEToWAmc0+FFMsHcUg==
=5esS
-----END PGP SIGNATURE-----

--746juvgefw2w5bfx--

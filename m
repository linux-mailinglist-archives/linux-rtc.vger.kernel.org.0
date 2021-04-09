Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD60359C51
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Apr 2021 12:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbhDIKqe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Apr 2021 06:46:34 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43236 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhDIKqd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Apr 2021 06:46:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 231C01C0B77; Fri,  9 Apr 2021 12:46:19 +0200 (CEST)
Date:   Fri, 9 Apr 2021 12:46:17 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Kirill Kapranov <kirill.kapranov@compulab.co.il>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        phdm@macqel.be, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] rtc:abx80x: Enable xt digital calibration
Message-ID: <20210409104617.GB10988@amd>
References: <20210328210232.10395-1-kirill.kapranov@compulab.co.il>
 <20210328210232.10395-5-kirill.kapranov@compulab.co.il>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <20210328210232.10395-5-kirill.kapranov@compulab.co.il>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The XT digital calibration feature allows to improve the RTC accuracy,
> using a Distributed Digital Calibration function.
> See ch. 5.9.1 of AB08XX Series Ultra Low Power RTC IC User's Guide
> https://abracon.com/realtimeclock/AB08XX-Application-Manual.pdf
>=20
> Signed-off-by: Kirill Kapranov <kirill.kapranov@compulab.co.il>
> ---
>  drivers/rtc/rtc-abx80x.c | 145 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 145 insertions(+)


> =20
> +static const int xt_freq_nom =3D 32768000; //Nominal XT frequency 32 kHz=
 in mHz

C-style comment?

is it 32 kHz or 32.768 kHz?

> +{
> +	int retval;
> +	long Adj;

Adj -> adj.

> +
> +static DEVICE_ATTR_WO(xt_frequency);

You are adding new user interface, you sould add documentation.

Best regards,
								Pavel
							=09
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBwMHkACgkQMOfwapXb+vIZCQCgpLHySKQSuRHiyPEiKl+9062O
rlAAnA86MaZPa0g8CeIxTSVd9Uu19NbW
=P1AG
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

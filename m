Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068EC3AE10D
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jun 2021 00:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFTXBs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Jun 2021 19:01:48 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42198 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbhFTXBs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Jun 2021 19:01:48 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 196101C0B82; Mon, 21 Jun 2021 00:59:34 +0200 (CEST)
Date:   Mon, 21 Jun 2021 00:59:33 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: ti,bq32k: take maintainership
Message-ID: <20210620225933.GA21262@amd>
References: <20210620224030.1115356-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <20210620224030.1115356-1-alexandre.belloni@bootlin.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Take maintainership of the binding as PAvel said he doesn't have the
> hardware anymore.

Thank you!

Best regards,
								Pavel

> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> +++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: TI BQ32000 I2C Serial Real-Time Clock
> =20
>  maintainers:
> -  - Pavel Machek <pavel@ucw.cz>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> =20
>  allOf:
>    - $ref: rtc.yaml#

--=20
http://www.livejournal.com/~pavelmachek

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDPyFUACgkQMOfwapXb+vI2egCfZbwKFy3jqZWHwfBqrffZuD5v
8DgAoJLPr5UZ3jqf9lS3SXy9KY6JqQBs
=uWTP
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

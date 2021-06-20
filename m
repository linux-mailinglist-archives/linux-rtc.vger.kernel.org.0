Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5954B3AE079
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Jun 2021 22:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFTU6C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Jun 2021 16:58:02 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:32794 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhFTU6B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Jun 2021 16:58:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8BC201C0B82; Sun, 20 Jun 2021 22:55:47 +0200 (CEST)
Date:   Sun, 20 Jun 2021 22:55:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: ti,bq32k: Convert to json-schema
Message-ID: <20210620205546.GA17070@amd>
References: <42d9c71b4ee1f120e0cdcf6b266547d29d1fb9a4.1623851377.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <42d9c71b4ee1f120e0cdcf6b266547d29d1fb9a4.1623851377.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Convert the TI BQ32000 I2C Serial Real-Time Clock Device Tree binding
> documentation to json-schema.
>=20
> Document missing properties.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> index 0000000000000000..392bd71bd1bee25c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/ti,bq32000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI BQ32000 I2C Serial Real-Time Clock
> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>

I'm not sure why I'm listed here, but I probably should not be. I
don't have access to that hardware any more.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDPq1IACgkQMOfwapXb+vII/ACfeeS/6nYeSpaDAuJ7dFSn9p7Z
fDcAnjkOxmjx5fnxYNKT8tDw7G8wlyc9
=J16w
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--

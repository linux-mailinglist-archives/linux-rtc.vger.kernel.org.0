Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E628780614
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Aug 2023 09:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345893AbjHRHDH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Aug 2023 03:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358122AbjHRHDB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 18 Aug 2023 03:03:01 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D412D73;
        Fri, 18 Aug 2023 00:02:58 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5238E1C0004; Fri, 18 Aug 2023 09:02:56 +0200 (CEST)
Date:   Fri, 18 Aug 2023 09:02:55 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rtc: isl1208: Fix incorrect logic in isl1208_set_xtoscb()
Message-ID: <ZN8Xny+sYCnoLINM@duo.ucw.cz>
References: <20230817161038.407960-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vhMN/q3qgJ35pC2J"
Content-Disposition: inline
In-Reply-To: <20230817161038.407960-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NEUTRAL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--vhMN/q3qgJ35pC2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2023-08-17 17:10:38, Biju Das wrote:
> The XTOSCB bit is not bit 0, but xtosb_val is either 0 or 1. If it is 1,
> test will never succeed. Fix this issue by using double negation.
>=20
> While at it, remove unnecessary blank line from probe().

Reviewed-by: Pavel Machek <pavel@denx.de>

Thank you!

Best regards,
								Pavel

> +++ b/drivers/rtc/rtc-isl1208.c
> @@ -188,7 +188,7 @@ isl1208_i2c_validate_client(struct i2c_client *client)
>  static int isl1208_set_xtoscb(struct i2c_client *client, int sr, int xto=
sb_val)
>  {
>  	/* Do nothing if bit is already set to desired value */
> -	if ((sr & ISL1208_REG_SR_XTOSCB) =3D=3D xtosb_val)
> +	if (!!(sr & ISL1208_REG_SR_XTOSCB) =3D=3D xtosb_val)
>  		return 0;
> =20
>  	if (xtosb_val)
> @@ -944,7 +944,6 @@ isl1208_probe(struct i2c_client *client)
>  		rc =3D isl1208_setup_irq(client, client->irq);
>  		if (rc)
>  			return rc;
> -
>  	} else {
>  		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, isl1208->rtc->features);
>  	}

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--vhMN/q3qgJ35pC2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZN8XnwAKCRAw5/Bqldv6
8jNbAJ41UwIs2TFVKmDACB+Q5KKPEMdppgCeKTQ0XsX+XjijYB1eFi0zcIp6U+o=
=aDq+
-----END PGP SIGNATURE-----

--vhMN/q3qgJ35pC2J--

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE36368384
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Apr 2021 17:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbhDVPk1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Apr 2021 11:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbhDVPk1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Apr 2021 11:40:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD9BC06174A
        for <linux-rtc@vger.kernel.org>; Thu, 22 Apr 2021 08:39:52 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZbQc-0008L1-Ma; Thu, 22 Apr 2021 17:39:42 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZbQb-00083D-H6; Thu, 22 Apr 2021 17:39:41 +0200
Date:   Thu, 22 Apr 2021 17:39:41 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 4/6] rtc: at91sma9: Simplify using
 devm_clk_get_enabled()
Message-ID: <20210422153941.og3j76krdfw4mcyr@pengutronix.de>
References: <20210422065726.1646742-1-u.kleine-koenig@pengutronix.de>
 <20210422065726.1646742-5-u.kleine-koenig@pengutronix.de>
 <YIEtVVE8ZdwbTTgM@ada-deb-carambola.ifak-system.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kqfznum3oxovbyl2"
Content-Disposition: inline
In-Reply-To: <YIEtVVE8ZdwbTTgM@ada-deb-carambola.ifak-system.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--kqfznum3oxovbyl2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 10:01:25AM +0200, Alexander Dahl wrote:
> Hello Uwe,
>=20
> I think there's a typo in the subject.  It should be sam9 instead of
> sma9, right?

Ah indeed, thanks for spotting this. Will fix this for the next round.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kqfznum3oxovbyl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCBmLoACgkQwfwUeK3K
7Ams3wf+MSx7n6yY5i8n4uw3XkPisJjBwud0ESALfRaOFi5jUfZP7rnA3YESu0UB
QMHAcAs8mqaeAiLoMZ3l+5TVwnbiu0HbQAhRkgvMxF5zL4Jr54U1prpbrXuF0tgt
W5BLeasFE+qrvBOPwBsNBV50pmAtRh+FRDkAKTtQxpsVGKwXId63nUyDqQ5zHbp1
zlwtEXHWmkApoI/ti2qvv+VvUR9g1DhLpKCzbcNSb9q4koAF52XfvlJi2VBKT7V7
J5a3YTZxssPxWEpu9tKhg9RHs4cSId3S9aJNq/qhcwBJ5zzD+kZGV4g/VPWOQQbh
o4dA52rvalsxcXF/ODM7XGPnvLny9w==
=NwZo
-----END PGP SIGNATURE-----

--kqfznum3oxovbyl2--

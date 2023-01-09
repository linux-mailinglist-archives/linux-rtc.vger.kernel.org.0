Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F346628A6
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Jan 2023 15:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjAIOga (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Jan 2023 09:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjAIOg3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Jan 2023 09:36:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C120B26FB
        for <linux-rtc@vger.kernel.org>; Mon,  9 Jan 2023 06:36:23 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1pEtG9-0006S6-8R; Mon, 09 Jan 2023 15:36:21 +0100
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:5712:c65e:d5c2:94c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 762161524E0;
        Mon,  9 Jan 2023 14:36:20 +0000 (UTC)
Date:   Mon, 9 Jan 2023 15:36:12 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND 0/2] rtc: rv8803 patches
Message-ID: <20230109143612.7gqul6ccsjswvajg@pengutronix.de>
References: <20221123095527.2771434-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x5cjs62lm5zav7pg"
Content-Disposition: inline
In-Reply-To: <20221123095527.2771434-1-s.hauer@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--x5cjs62lm5zav7pg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 23.11.2022 10:55:25, Sascha Hauer wrote:
> This series has the remainder of
> https://lore.kernel.org/all/20220426071056.1187235-1-s.hauer@pengutronix.=
de/
> which was partly applied.
>=20
> Alexandre,
>=20
> Last time this series was send you asked if this series fixes a problem
> we've really seen to which Ahmad answered:

Happy new Year Alexandre!

What can we do to bring this patch froward?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--x5cjs62lm5zav7pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmO8JlkACgkQrX5LkNig
0126GQf/ZjalsA6j3wONADHsDlsIZIHFsrcgIb2cp4Mpyj+m8OIrX0UzooB5znng
CBEIm5TM5cIlhi8Trm0IYdbkIu8Ko3NjxvJ2OIfUjYSV6OcdddjXtdeZMADt0CXG
bEmB5rLcdWRIp6bTV42+JOVnu3k0+yt8mHTTuYEgcOxDIVTq+RHuFE847nlzHf4A
QBt6K9soDYA24J6TwuhomWPoMMGqqbt7jqO6KCoU+ap7iG/dwppOxb+fvNvHnYUu
KwdLjqCwvtVYgolTcWVNnWCeiAnBX9j/daOENpJU0ADVz3LmiHnWFg0861QOeElG
cWX6VQGmJNaNrsKa76I8wM2AA42gow==
=xYOl
-----END PGP SIGNATURE-----

--x5cjs62lm5zav7pg--

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6A7711FF7
	for <lists+linux-rtc@lfdr.de>; Fri, 26 May 2023 08:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242138AbjEZG3Q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 May 2023 02:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjEZG3L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 May 2023 02:29:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE63213D
        for <linux-rtc@vger.kernel.org>; Thu, 25 May 2023 23:29:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Qwk-0005IP-Oy; Fri, 26 May 2023 08:29:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Qwj-002tT1-Od; Fri, 26 May 2023 08:29:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Qwi-0084xJ-Tt; Fri, 26 May 2023 08:29:04 +0200
Date:   Fri, 26 May 2023 08:29:04 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] rtc: Switch i2c drivers back to use .probe()
Message-ID: <20230526062904.vcsmst7rmdw2vkiw@pengutronix.de>
References: <20230505121136.1185653-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2y5hgy5f5dmdxs7c"
Content-Disposition: inline
In-Reply-To: <20230505121136.1185653-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--2y5hgy5f5dmdxs7c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, May 05, 2023 at 02:11:36PM +0200, Uwe Kleine-K=F6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.

this patch wasn't applied yet and I didn't receive any feedback. It
still applies fine to yesterday's next and is still complete there (i.e.
no new drivers introducing another .probe_new()).

Is this patch still considered to be applied?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2y5hgy5f5dmdxs7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRwUa8ACgkQj4D7WH0S
/k7SBAf/U0kQFhPaq7kRxh7nf9i1Xy+v4PZC5sKXhsacuxG7LKLrrHzC2egKDUPd
pb7D7jmNi5jKojuQ+qy6GdP9ly080MGFPhRA0/BWp/e9PBftm0oYb2TO3/YOGiPI
8UHfRetMzEGZvVuz6LDvnosFav2FGoTR6Zor/69GdwpJRYzm4lun50gSARJN8emt
H0e01hVhTGJKJ6H8l/Q5QWes8uYF7rp9e4Y+ZN7fVPhi5stJDiGf/76dkOHH/CoJ
IjN1Kdn08cbZ3aCjzk5US6Y16Qh0XcmL5jrtvTXj1h9iKZzhZgdHEdJSwOSVcgbV
5PDEDCPj9qlU+IUnuk+x699lRKGeCA==
=p/ZI
-----END PGP SIGNATURE-----

--2y5hgy5f5dmdxs7c--

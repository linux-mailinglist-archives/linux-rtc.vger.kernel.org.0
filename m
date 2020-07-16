Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBF722261E
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jul 2020 16:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgGPOrJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jul 2020 10:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgGPOrI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jul 2020 10:47:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEB5C061755
        for <linux-rtc@vger.kernel.org>; Thu, 16 Jul 2020 07:47:08 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jw5AB-0002nr-8h; Thu, 16 Jul 2020 16:47:07 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jw5A9-0002fZ-LK; Thu, 16 Jul 2020 16:47:05 +0200
Date:   Thu, 16 Jul 2020 16:47:05 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net, bth@kamstrup.com
Subject: Re: [PATCH v3 4/5] rtc: pcf2127: add watchdog feature support
Message-ID: <20200716144705.o57m4r7ptmsm3m6n@pengutronix.de>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
 <20190822131936.18772-4-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wlydsxkzm4ykmx3v"
Content-Disposition: inline
In-Reply-To: <20190822131936.18772-4-bruno.thomsen@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--wlydsxkzm4ykmx3v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Aug 22, 2019 at 03:19:35PM +0200, Bruno Thomsen wrote:
> Add partial support for the watchdog functionality of
> both PCF2127 and PCF2129 chips.

I have a board here with a pcf2127 that has the #RST pin
not connected.

The problem this creates is: The bootloader arms the SoC's watchdog and
jumps into Linux. The pcf2127 driver happens to load first, so watchdog0
is provided by the RTC (but non-functional). Systemd is configured to
feed the watchdog, but happens to feed the wrong one, so the machine
resets shortly after it is up :-|

So I wonder if we need a dt property that tells the driver if the RST
line is connected or not.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wlydsxkzm4ykmx3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8QaGYACgkQwfwUeK3K
7AnYzQf/V7RnI9MWGMYzHgloRnRN97jS9wQHOPccvFvBIh9fwps/5vVDxGmJxuJN
PYmMoPye3fDDArmEi1apkMx8qVu0ou35EaPfqs72RcfwCObtDILEfCEGyyA6QcDS
Mi6IBtDtPBhb3DRR5UUuzbnB2gyrxO/iPWt9Btb8Mb0etdFhSrO9KD91GXpfL0ja
X7CoyBqOkV+9ujnH38CWdfDKfDsgw01Em06+D2wtyyT7Q/h2VtZMGa/Kt/DGFbNb
0AqHYeyoB9m2NSqiBbcC0zfjJ11nrhlsPmufbK5BxPFUuESAhdUjnyxX/U55QD5i
BY/z/2xS4ijW0cYC0HZtWnlf7HTpuA==
=HTG/
-----END PGP SIGNATURE-----

--wlydsxkzm4ykmx3v--

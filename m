Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464012FAAEB
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Jan 2021 21:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388022AbhARKpU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Jan 2021 05:45:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388295AbhARJ2L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Jan 2021 04:28:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9B5C061575
        for <linux-rtc@vger.kernel.org>; Mon, 18 Jan 2021 01:27:26 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l1QoY-0001wO-QU; Mon, 18 Jan 2021 10:27:10 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l1QoX-0003Ay-0P; Mon, 18 Jan 2021 10:27:09 +0100
Date:   Mon, 18 Jan 2021 10:27:08 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        dan.carpenter@oracle.com, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rtc: pcf2127: Disable Power-On Reset Override
Message-ID: <20210118092708.gphy6jtlldp3il25@pengutronix.de>
References: <20210118085752.5759-1-p.rosenberger@kunbus.com>
 <20210118085752.5759-2-p.rosenberger@kunbus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hhph5dpzwlj3fiam"
Content-Disposition: inline
In-Reply-To: <20210118085752.5759-2-p.rosenberger@kunbus.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--hhph5dpzwlj3fiam
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Philipp,

On Mon, Jan 18, 2021 at 09:57:51AM +0100, Philipp Rosenberger wrote:
> From what I've seen on the PCF2127 and PCF2129 there is not
> interrupted gernerated at the interrupt pin (INT), as long the PORO bit

Apart from s/not interrupted gernerated/no event generated/ this looks
good now.

> is set. This behavior is not documented in the manual.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hhph5dpzwlj3fiam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAFVGkACgkQwfwUeK3K
7Ak1yQgAkBAWwmfASiKHUo6Cx3U02EVUkYp58VGmTNi9W2sCKGXcRxviQmmLVbcb
PyecxvLdmbYpwrOkP1ZszgcG8GsQCzrv1889ugVFE9oODLSuKjEO2w3wg3YVbbhL
5vIkT3CGEtPgYQ1FxJQ3f6Y4h+TISc1E31vQJgJXdhFw6a87SC+KEQVi/h4zG7GC
oS/vKgj0IfNdxx2yyPYiba7HQXmbq8EfOfJ/zZHJr9R6x/6o1+b0rwCYQzU7T6b5
eCCr0Wskx1Y0ihSCVen0OJwqWSBXqZCT7GDEDhL1CGNyh2Uwlp/iyaviLmDAy+eC
Nsg22zIWCcwci4wj1QPC4VvM72K79Q==
=mR4+
-----END PGP SIGNATURE-----

--hhph5dpzwlj3fiam--

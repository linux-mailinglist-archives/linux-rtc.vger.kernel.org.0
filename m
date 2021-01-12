Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9497C2F3A50
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Jan 2021 20:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392395AbhALT12 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Jan 2021 14:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732196AbhALT12 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Jan 2021 14:27:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795B9C061575
        for <linux-rtc@vger.kernel.org>; Tue, 12 Jan 2021 11:26:47 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzPJK-0006u3-Rt; Tue, 12 Jan 2021 20:26:34 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzPJJ-0002zj-Df; Tue, 12 Jan 2021 20:26:33 +0100
Date:   Tue, 12 Jan 2021 20:26:33 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     linux-rtc@vger.kernel.org, dan.carpenter@oracle.com,
        biwen.li@nxp.com, lvb@xiphos.com, bruno.thomsen@gmail.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: pcf2127: Disable Power-On Reset Override
Message-ID: <20210112192633.yl7nx474r6njfynd@pengutronix.de>
References: <20210104161910.9144-1-p.rosenberger@kunbus.com>
 <20210104161910.9144-2-p.rosenberger@kunbus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="svmvd7gj24gqtrwm"
Content-Disposition: inline
In-Reply-To: <20210104161910.9144-2-p.rosenberger@kunbus.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--svmvd7gj24gqtrwm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jan 04, 2021 at 05:19:09PM +0100, Philipp Rosenberger wrote:
> If the PCF2127/2129 has lost all power and is then powered again it goes
> into "Power-On Reset Override" mode. In this mode the RTC seems to work
> fine. Also the watchdog can be configured. The watchdog timer counts as
> expected and the WDTF (watchdog timer flag) gets set. But no interrupt
> is generated on the INT pin. The same applies to the alarm function.
>=20
> The POR_OVRD bit on the Control_1 register must be cleared first. In
> some cases the bootloader or firmware might have done this already. But
> we clear the bit nevertheless to guarantee correct behavior the
> watchdog and alarm function.

I don't understand this. The reference manual tells us about this bit:

| The POR duration is directly related to the crystal oscillator
| start-up time. Due to the long start-up times experienced by these
| types of circuits, a mechanism has been built in to disable the POR
| and therefore speed up the on-board test of the device.
| The setting of the PORO mode requires that POR_OVRD in register
| Control_1 is set logic 1 and that the signals at the interface pins
| SDA/CE and SCL are toggled as illustrated in Figure 18.

So this means that with the bit set (i.e. with this patch added) after a
power-on the oscillator isn't properly reset. This means the chip might
not work correctly, right? Does "speed up the on-board test" suggest,
this is a feature that is to be used while testing the chip and not for
production use? You missed to ensure that the requested toggling is
done. Did you test how much time this actually saves? I doubt it is
worth to trade correct operation for quicker startup time is the thing
we want here.

If you still think this is a good idea I guess you need a much better
commit log (and code comment).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--svmvd7gj24gqtrwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/99+YACgkQwfwUeK3K
7AkGUgf8DEkEJIIoQUMH3qnEjBn/MzV6B6syv2Nsl4yfa+IjiO1q3f3oOXVnos2P
iERLxJJhn9YUAmK8b8eexbHinCVXprHpyVYM8XsFNz0lPAZ3uxoAzVRxgSVb4dAW
YAJTB4eDIBkQ0AKS0k1lWZ0x9fTAZWXAQZE9+7KTJNZWzQ1k+ftfQlEkVJc/CYQm
Nnm1vA7MiAq3UEGqIrEO4lsbZlGLNwViZzdCEwvyM6JHYmyyVXWLYHj4LEfDCf72
s26zMBa+6khOZISYWz9nJprR6KnRKT4f1WBT/lujtUYtmHvevYMtJ6jkCH9nrhn0
v+iT3Y6h0HexrAL0Ij3IN+pqrdlFYA==
=l0DM
-----END PGP SIGNATURE-----

--svmvd7gj24gqtrwm--

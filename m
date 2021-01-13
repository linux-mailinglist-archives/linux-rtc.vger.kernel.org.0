Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266AD2F469C
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 09:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbhAMIgr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Jan 2021 03:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbhAMIgr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Jan 2021 03:36:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCCAC061575
        for <linux-rtc@vger.kernel.org>; Wed, 13 Jan 2021 00:36:06 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzbdF-0006KQ-PH; Wed, 13 Jan 2021 09:35:57 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzbdE-00073P-23; Wed, 13 Jan 2021 09:35:56 +0100
Date:   Wed, 13 Jan 2021 09:35:53 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     linux-rtc@vger.kernel.org, dan.carpenter@oracle.com,
        biwen.li@nxp.com, lvb@xiphos.com, bruno.thomsen@gmail.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: pcf2127: Disable Power-On Reset Override
Message-ID: <20210113083553.vsrc5xksssmpdw2f@pengutronix.de>
References: <20210104161910.9144-1-p.rosenberger@kunbus.com>
 <20210104161910.9144-2-p.rosenberger@kunbus.com>
 <20210112192633.yl7nx474r6njfynd@pengutronix.de>
 <8bd2f360-c43d-10a4-58ef-804833de4779@kunbus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yapg2yybic44ha35"
Content-Disposition: inline
In-Reply-To: <8bd2f360-c43d-10a4-58ef-804833de4779@kunbus.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--yapg2yybic44ha35
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 09:18:31AM +0100, Philipp Rosenberger wrote:
> Hi Uwe,
>=20
> On 12.01.21 20:26, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Mon, Jan 04, 2021 at 05:19:09PM +0100, Philipp Rosenberger wrote:
> > > If the PCF2127/2129 has lost all power and is then powered again it g=
oes
> > > into "Power-On Reset Override" mode. In this mode the RTC seems to wo=
rk
> > > fine. Also the watchdog can be configured. The watchdog timer counts =
as
> > > expected and the WDTF (watchdog timer flag) gets set. But no interrupt
> > > is generated on the INT pin. The same applies to the alarm function.
> > >=20
> > > The POR_OVRD bit on the Control_1 register must be cleared first. In
> > > some cases the bootloader or firmware might have done this already. B=
ut
> > > we clear the bit nevertheless to guarantee correct behavior the
> > > watchdog and alarm function.
> >=20
> > I don't understand this. The reference manual tells us about this bit:
> >=20
> > | The POR duration is directly related to the crystal oscillator
> > | start-up time. Due to the long start-up times experienced by these
> > | types of circuits, a mechanism has been built in to disable the POR
> > | and therefore speed up the on-board test of the device.
> > | The setting of the PORO mode requires that POR_OVRD in register
> > | Control_1 is set logic 1 and that the signals at the interface pins
> > | SDA/CE and SCL are toggled as illustrated in Figure 18.
> >=20
> > So this means that with the bit set (i.e. with this patch added) after a
> > power-on the oscillator isn't properly reset. This means the chip might
> > not work correctly, right? Does "speed up the on-board test" suggest,
> > this is a feature that is to be used while testing the chip and not for
> > production use? You missed to ensure that the requested toggling is
> > done. Did you test how much time this actually saves? I doubt it is
> > worth to trade correct operation for quicker startup time is the thing
> > we want here.
> >=20
> > If you still think this is a good idea I guess you need a much better
> > commit log (and code comment).
>=20
> Yes I guess the commit log and the comment are not good enough. I took me=
 a
> long time to find what was wrong with my setup until I realized the the P=
ORO
> was the problem. I find the description in the manual not very clear. But
> from my tests and from the description in Table 7 Bit 3 it is pretty clear
> that the PORO bit should not be set during normal operation.

Ah, I misunderstood your intention. I though you want to enable this
bit, after rereading the commit log and patch I don't know why though. I
think the part "If the PCF2127/2129 has lost all power and is then
powered again it goes into "Power-On Reset Override" mode." is wrong in
general. So there is still something to improve (which we seem to agree
on). So I look forward to your v2.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yapg2yybic44ha35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/+sOYACgkQwfwUeK3K
7AltVgf+NG398rmrZEjGqF8NdcKRddAozUAdnEXpwldJ6pbvTOxfT8hf1QOfoh0n
IyReFuN2K6olAoehfu54IIcsncafsmpfGLk7dsip0CFcMd6vyLH9KwtOvR1Uw+P2
sJXZj+h09J6/ioucVgcbmwC5xBYqSYjJ7IAhALuHWD4S3I+vSTIxbR8wjw8ckdDk
Sdk/ebQrPZF7HoS4IU9th9VUmEf9CiAlgOi32JHkBSrVIsqaVVmKDnxtWz0m8Vm8
51VK2/3cFAu7cj0PPujbqLgEvAPIslsmxS4z7y8vKB0+0/D8ns1kT4ZLCTt5JiSS
GCGCDqW3Wk+DhtbL1LRIhX5qGWPh6Q==
=fhGE
-----END PGP SIGNATURE-----

--yapg2yybic44ha35--

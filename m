Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED4168263E
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Jan 2023 09:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjAaIUG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 31 Jan 2023 03:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjAaIUF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 31 Jan 2023 03:20:05 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A67BEB64
        for <linux-rtc@vger.kernel.org>; Tue, 31 Jan 2023 00:20:04 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1pMls2-0007NV-3d; Tue, 31 Jan 2023 09:20:02 +0100
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:29f7:a2fc:d3f6:7550])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 421F4169B6A;
        Tue, 31 Jan 2023 08:20:01 +0000 (UTC)
Date:   Tue, 31 Jan 2023 09:19:55 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>, linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND 0/2] rtc: rv8803 patches
Message-ID: <20230131081955.ke2larva6ftm5v4j@pengutronix.de>
References: <20221123095527.2771434-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gkiyxll5cdmehrgy"
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


--gkiyxll5cdmehrgy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexandre,

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
>=20
> > The kernel message
> >=20
> >   rtc rtc0: invalid alarm value: 2020-3-27 7:82:0
> >=20
> > listed in the commit message is something I actually ran into. There
> > was no v2f set then. The customer has also variously observed bit flips
> > independently of v2f: During EMC testing, electrostatic discharge at de=
veloper
> > desks and even in the field: Suspected causes were lightning strikes in=
 the
> > vicinity and the switching of larger inductive loads.
> > They're very paranoid of logging invalid timestamps, so we'll keep the =
patch
> > anyhow at our side, but I think it is generally useful as well: If we c=
an't
> > set an invalid alarm time by normal means, but read back an invalid tim=
e,
> > something may have corrupted other memory, so treating it as a v2f is s=
ensible.
>=20
> There was no answer to this. I would be glad if you could take this
> series. I would understand though if you say that this problem is too
> esoteric to fix it upstream, we would keep the patches locally then.
> Please just say so, it would help me to get the problem from my desk
> ;)

Can someone take this patch series? If not, what can we do to get these
changes upstream?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--gkiyxll5cdmehrgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmPYzykACgkQrX5LkNig
011N9gf/fzb3QJWRmcpacDngtJ29px1Ik7Q1EKaF1trwDvvRtiEZIO49JcxUAFSN
CSlwsD/vleMgiQME8PP4XQ6kOmfXujY9w7KCyktvibePwx2sNA1EYScvWziNL/E5
qXCGpT95QPkT4TSMSudI1eoK/eyzOZmuBNsKRvqTQAIWRLDMCDIUDUIxMXNheN9h
P4Mt+4q6wkTL0/gLyuKBNkBuYn8+jBeR8V0LxGVO7PAVGHGIbR7J1uT90VF/kdM2
Gr0Aaex5EOFnVIVc1ugOqqeY6HGx3O+o8Nojopqrkjgxbrs8P31TgFF4MvLBIRoi
KqcJLpegv8H53bezufrWQTzakpsW3g==
=38nR
-----END PGP SIGNATURE-----

--gkiyxll5cdmehrgy--

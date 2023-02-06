Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825BB68C12F
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Feb 2023 16:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBFPSk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Feb 2023 10:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBFPSi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Feb 2023 10:18:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638C57A97
        for <linux-rtc@vger.kernel.org>; Mon,  6 Feb 2023 07:18:36 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1pP3GM-0004Jl-4c; Mon, 06 Feb 2023 16:18:34 +0100
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:ed53:8ea4:3645:4bd2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 0C324171903;
        Mon,  6 Feb 2023 15:18:33 +0000 (UTC)
Date:   Mon, 6 Feb 2023 16:18:24 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND 0/2] rtc: rv8803 patches
Message-ID: <20230206151824.rb32y2jojtcdz5wp@pengutronix.de>
References: <20221123095527.2771434-1-s.hauer@pengutronix.de>
 <20230131081955.ke2larva6ftm5v4j@pengutronix.de>
 <Y9kCzCvGopu8+RCb@mail.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="43djrhc3gjx3uggm"
Content-Disposition: inline
In-Reply-To: <Y9kCzCvGopu8+RCb@mail.local>
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


--43djrhc3gjx3uggm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 31.01.2023 13:00:12, Alexandre Belloni wrote:
> On 31/01/2023 09:19:55+0100, Marc Kleine-Budde wrote:
> > Hello Alexandre,
> >=20
> > On 23.11.2022 10:55:25, Sascha Hauer wrote:
> > > This series has the remainder of
> > > https://lore.kernel.org/all/20220426071056.1187235-1-s.hauer@pengutro=
nix.de/
> > > which was partly applied.
> > >=20
> > > Alexandre,
> > >=20
> > > Last time this series was send you asked if this series fixes a probl=
em
> > > we've really seen to which Ahmad answered:
> > >=20
> > > > The kernel message
> > > >=20
> > > >   rtc rtc0: invalid alarm value: 2020-3-27 7:82:0
> > > >=20
> > > > listed in the commit message is something I actually ran into. There
> > > > was no v2f set then. The customer has also variously observed bit f=
lips
> > > > independently of v2f: During EMC testing, electrostatic discharge a=
t developer
> > > > desks and even in the field: Suspected causes were lightning strike=
s in the
> > > > vicinity and the switching of larger inductive loads.
> > > > They're very paranoid of logging invalid timestamps, so we'll keep =
the patch
> > > > anyhow at our side, but I think it is generally useful as well: If =
we can't
> > > > set an invalid alarm time by normal means, but read back an invalid=
 time,
> > > > something may have corrupted other memory, so treating it as a v2f =
is sensible.
> > >=20
> > > There was no answer to this. I would be glad if you could take this
> > > series. I would understand though if you say that this problem is too
> > > esoteric to fix it upstream, we would keep the patches locally then.
> > > Please just say so, it would help me to get the problem from my desk
> > > ;)
> >=20
> > Can someone take this patch series? If not, what can we do to get these
> > changes upstream?
>=20
> I'm going to take it but this may silently break existing users with a
> niche use case.
> Also, this check will only happen at boot time so I'm not sure there is
> a huge benefit, unless your customer reboots the platform often.

Thanks Alexandre, is this patch already on an immutable branch?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--43djrhc3gjx3uggm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmPhGi0ACgkQvlAcSiqK
BOivpwf8CsXd/B6/U9IZU2mP+m1R7tuknGZ5wTzWBx+ewVHQ7OTW+oJvxL8sXiga
I7n+vm8PVaGspzMNlujZP74kznwN9Od2/GDv8k5O8TMuXekTFd8PpuDag+U+296X
X1itpwu4Llw0XWH66m7piETEHxb+1QQ0p1GA/gLB3qotUwaLhfnCcvdOK8V33FCM
A9at3g41gpBWBn4cVS3tK0izTFKG/+r+N2zlsE6wyxYgVUDYrVkEV2lCqKRJqI4x
hKXQb9u9r8zQBgEX+QWI5LokNSY7g12BFvP2OOjpTXKc/koPzEbfRjx3TsH3X2KC
DI5mzBhroIdZXs6ptWNPREBxTPuNOA==
=j7+d
-----END PGP SIGNATURE-----

--43djrhc3gjx3uggm--

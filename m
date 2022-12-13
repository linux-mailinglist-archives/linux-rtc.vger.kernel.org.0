Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4D864B2FB
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Dec 2022 11:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbiLMKIk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Dec 2022 05:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbiLMKIb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Dec 2022 05:08:31 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5495C63FD
        for <linux-rtc@vger.kernel.org>; Tue, 13 Dec 2022 02:08:30 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1p52D6-0002Iv-2j; Tue, 13 Dec 2022 11:08:28 +0100
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:7718:f6d6:39bc:6089])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 3603813DC49;
        Tue, 13 Dec 2022 10:08:27 +0000 (UTC)
Date:   Tue, 13 Dec 2022 11:08:21 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND 0/2] rtc: rv8803 patches
Message-ID: <20221213100821.7ho3etmahujdmm3x@pengutronix.de>
References: <20221123095527.2771434-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bd45thwwgbi5lora"
Content-Disposition: inline
In-Reply-To: <20221123095527.2771434-1-s.hauer@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--bd45thwwgbi5lora
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alexandre,

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
> Please just say so, it would help me to get the problem from my desk ;)

Any news on this, what's the status?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--bd45thwwgbi5lora
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmOYTxMACgkQrX5LkNig
010cWwf/fSF4rpojXwTV4oB0rS1C0tNyhEbPvkViBUbTaNZRcIpDbe2q8hCTDIgq
QrhgHoC8Ab7ZWfltWbYginagof3r2uoPZZ0weZU7QkSwGKXU8IXSnYt532vhcuSg
29++WTICPQVjf3dt3MRl2+sb09X5VIFv/BNBZcP8Zgn93FRmZcso8MY3YhowhMpi
O0qzOFwGI+5XIHut7TA6rD38biK09VmOK7OlNgzZQH1ZOliqtusUv4V0evouceHo
0aJDBRATm3FnMzLZoCjXbSkspbo8nPK4ZQEbVOx+fkuUYBj++9NNN1LjARPaR+k6
nDMj2iG/0lfwMJUEitfX5HDPWNYhYw==
=BSxj
-----END PGP SIGNATURE-----

--bd45thwwgbi5lora--

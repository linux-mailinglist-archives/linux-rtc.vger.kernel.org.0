Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA5A602636
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Oct 2022 09:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiJRHyN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 18 Oct 2022 03:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiJRHxx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 18 Oct 2022 03:53:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B443172868
        for <linux-rtc@vger.kernel.org>; Tue, 18 Oct 2022 00:53:51 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1okhQ4-0002Y1-Ol; Tue, 18 Oct 2022 09:53:48 +0200
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 743A4101675;
        Tue, 18 Oct 2022 07:53:47 +0000 (UTC)
Date:   Tue, 18 Oct 2022 09:53:45 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/2] rtc: rv8803 patches
Message-ID: <20221018075345.gknzmdpxqqoxpcfo@pengutronix.de>
References: <20220817085330.1050492-1-s.hauer@pengutronix.de>
 <20220921131753.GP12909@pengutronix.de>
 <YyseEdX9/xuyKGka@mail.local>
 <20220921143557.GE986@pengutronix.de>
 <952c4575-1acc-4cbd-4d64-1dc58c53ae99@pengutronix.de>
 <20221006115346.d4q4y6rrfumqn7tz@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="65dklherpy5zamjj"
Content-Disposition: inline
In-Reply-To: <20221006115346.d4q4y6rrfumqn7tz@pengutronix.de>
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


--65dklherpy5zamjj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexandre,

On 06.10.2022 13:53:46, Marc Kleine-Budde wrote:
> Hi Alexandre,
>=20
> On 26.09.2022 11:23:13, Ahmad Fatoum wrote:
> > Hello Alexandre,
> > Hello Sascha,
> >=20
> > On 21.09.22 15:35, Sascha Hauer wrote:
> > > On Wed, Sep 21, 2022 at 04:22:09PM +0200, Alexandre Belloni wrote:
> > >> Hi,
> > >>
> > >> On 21/09/2022 15:17:53+0200, Sascha Hauer wrote:
> > >>> Hi Alexandre,
> > >>>
> > >>> Any input to this series?
> > >>
> > >> I'm not convinced this is necessary. Having an invalid alarm doesn't
> > >> mean that the time is invalid and that check will only ever happen at
> > >> boot time whereas V2F is a reliable indication that the time is inva=
lid.
> > >>
> > >> Have you really had an RTC with an invalid time that is not caught by
> > >> rtc_valid_tm and with V2F not set?
> > >=20
> > > I don't know. I must talk to Ahmad in this regard, he'll be back next
> > > week. It could be that we only created this patch to be sure the RTC
> > > state is sane.
> >=20
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
> Should we re-send the patch with an updated patch description, or do you
> take it as is?

As v6.1-rc1 just came out, what about this patch?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--65dklherpy5zamjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmNOW4YACgkQrX5LkNig
013DjAgAodKm945SrHuB9ZogN1CSs+prCny7/DhR0lt7U6eoc0eSFMLn9Yew8wtj
0uEHW3HN9T7EdCRCB8MoXx5ElTrCC7R0XunYMmkHx/ZXT2+l/GvGi7uemY9VZ9H+
8c9QVDc0SHL+e8dj8vU+++Gu9HjX9Y3tpGu8Yx3DK+zTlPCYDq6FjjgoFOR1lpgC
8WWcU8TW/LPI3W00Ng73Z+Zx65jwexlbEBnRIlpAiYg4MjvSvcoBauphl8rZrT+E
bIMhvAd2PKm1DgaxHz+jeCfqwtW6hAhhYg6Non0R1RGPh74N96WaDlsoxPdU8U2n
Yfbp8nuUK5kDss/Ay7nafXcuUnmhfA==
=fRjm
-----END PGP SIGNATURE-----

--65dklherpy5zamjj--

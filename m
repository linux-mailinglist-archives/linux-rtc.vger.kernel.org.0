Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E985F656D
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Oct 2022 13:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiJFLx7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 Oct 2022 07:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiJFLx4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Oct 2022 07:53:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8509DF82
        for <linux-rtc@vger.kernel.org>; Thu,  6 Oct 2022 04:53:54 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1ogPRn-0005Pm-36; Thu, 06 Oct 2022 13:53:51 +0200
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id C959DF6270;
        Thu,  6 Oct 2022 11:53:49 +0000 (UTC)
Date:   Thu, 6 Oct 2022 13:53:46 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/2] rtc: rv8803 patches
Message-ID: <20221006115346.d4q4y6rrfumqn7tz@pengutronix.de>
References: <20220817085330.1050492-1-s.hauer@pengutronix.de>
 <20220921131753.GP12909@pengutronix.de>
 <YyseEdX9/xuyKGka@mail.local>
 <20220921143557.GE986@pengutronix.de>
 <952c4575-1acc-4cbd-4d64-1dc58c53ae99@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zxprooaebkdv323n"
Content-Disposition: inline
In-Reply-To: <952c4575-1acc-4cbd-4d64-1dc58c53ae99@pengutronix.de>
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


--zxprooaebkdv323n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On 26.09.2022 11:23:13, Ahmad Fatoum wrote:
> Hello Alexandre,
> Hello Sascha,
>=20
> On 21.09.22 15:35, Sascha Hauer wrote:
> > On Wed, Sep 21, 2022 at 04:22:09PM +0200, Alexandre Belloni wrote:
> >> Hi,
> >>
> >> On 21/09/2022 15:17:53+0200, Sascha Hauer wrote:
> >>> Hi Alexandre,
> >>>
> >>> Any input to this series?
> >>
> >> I'm not convinced this is necessary. Having an invalid alarm doesn't
> >> mean that the time is invalid and that check will only ever happen at
> >> boot time whereas V2F is a reliable indication that the time is invali=
d.
> >>
> >> Have you really had an RTC with an invalid time that is not caught by
> >> rtc_valid_tm and with V2F not set?
> >=20
> > I don't know. I must talk to Ahmad in this regard, he'll be back next
> > week. It could be that we only created this patch to be sure the RTC
> > state is sane.
>=20
> The kernel message
>=20
>   rtc rtc0: invalid alarm value: 2020-3-27 7:82:0
>=20
> listed in the commit message is something I actually ran into. There
> was no v2f set then. The customer has also variously observed bit flips
> independently of v2f: During EMC testing, electrostatic discharge at deve=
loper
> desks and even in the field: Suspected causes were lightning strikes in t=
he
> vicinity and the switching of larger inductive loads.
> They're very paranoid of logging invalid timestamps, so we'll keep the pa=
tch
> anyhow at our side, but I think it is generally useful as well: If we can=
't
> set an invalid alarm time by normal means, but read back an invalid time,
> something may have corrupted other memory, so treating it as a v2f is sen=
sible.

Should we re-send the patch with an updated patch description, or do you
take it as is?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--zxprooaebkdv323n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmM+wccACgkQrX5LkNig
012poQgArUgNKv3tQEKw3x3zcLJd10fxvqNIxBRH4GUG47EUReuwLQbF9cjykHgY
MtSqNw3scWQrFDnqQfeyDJNhymDuSFR1zyEl5oFVmi+hJonnQceKijAtweeHNbLR
qejGlPGE0xnPe5c65shuU42MtjpcfuXldis1SbnIQOslZO7SNm64Fh7yhb61Jh1I
yqPbEfphtKtT5Hwa87rC5GUj1HMZ2gfaHieTjVyebPhuiDYDMDB6kEORFmEyglGE
vke2E7sqWUSlJbjKwKDuOXzTa4oqLypSCqmLp1c+tBMi8g2H40F4pLXAoQxtIHPY
hZuDBsqROSj83yif5Xjf000tj9wX2w==
=+Tsu
-----END PGP SIGNATURE-----

--zxprooaebkdv323n--

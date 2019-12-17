Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3EE1229D6
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Dec 2019 12:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfLQL0w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Dec 2019 06:26:52 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:33838 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLQL0w (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Dec 2019 06:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/wfbz1AV7kpzq1k5a+twp8p7YU9BRi32n2mrSQtAFC0=; b=b1/EpmkcGl18jMSXshd7kdkGx
        Qvo0SjjcRJcNtAqAgRtOrvridnm2QMIQ4bOkVLY1KUgfM/bC4PieQ1bIO9t38ZcU43q4+Fvk0S0xf
        HwGonddVj1xOIqLMiz51EKQd1FqAEEH/hRcQdw4z6k5fAmdU7AKIABl1sPhuoMTzcG2Hg=;
Received: from [2a02:790:ff:919:7ee9:d3ff:fe1f:a246] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ihAzz-0007Ji-BQ; Tue, 17 Dec 2019 12:26:44 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ihAys-0001qH-56; Tue, 17 Dec 2019 12:25:34 +0100
Date:   Tue, 17 Dec 2019 12:25:26 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v4 4/5] mfd: rn5t618: add more subdevices
Message-ID: <20191217122526.7da85553@kemnade.info>
In-Reply-To: <20191217080146.GE18955@dell>
References: <20191211215409.32764-1-andreas@kemnade.info>
        <20191211215409.32764-5-andreas@kemnade.info>
        <20191216153106.GK2369@dell>
        <20191216170000.022a4c31@kemnade.info>
        <20191217080146.GE18955@dell>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N9qDnK+quarkvTFp.jEyjS="; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/N9qDnK+quarkvTFp.jEyjS=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Dec 2019 08:01:46 +0000
Lee Jones <lee.jones@linaro.org> wrote:

> On Mon, 16 Dec 2019, Andreas Kemnade wrote:
>=20
> > On Mon, 16 Dec 2019 15:31:06 +0000
> > Lee Jones <lee.jones@linaro.org> wrote:
> >  =20
> > > On Wed, 11 Dec 2019, Andreas Kemnade wrote:
> > >  =20
> > > > The RC5T619 has a RTC which is missing in the
> > > > RN5T618. Add it as subdevice to prepare for their implementation
> > > >=20
> > > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > > ---
> > > > Changes in v3:
> > > > - alignment cleanup
> > > >  drivers/mfd/rn5t618.c | 16 ++++++++++++++--
> > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> > > > index d78eb29b94a4..18d56a732b20 100644
> > > > --- a/drivers/mfd/rn5t618.c
> > > > +++ b/drivers/mfd/rn5t618.c
> > > > @@ -22,6 +22,12 @@ static const struct mfd_cell rn5t618_cells[] =3D=
 {
> > > >  	{ .name =3D "rn5t618-wdt" },
> > > >  };
> > > > =20
> > > > +static const struct mfd_cell rc5t619_cells[] =3D {
> > > > +	{ .name =3D "rn5t618-regulator" },
> > > > +	{ .name =3D "rc5t619-rtc" },
> > > > +	{ .name =3D "rn5t618-wdt" },
> > > > +};
> > > > +
> > > >  static bool rn5t618_volatile_reg(struct device *dev, unsigned int =
reg)
> > > >  {
> > > >  	switch (reg) {
> > > > @@ -173,8 +179,14 @@ static int rn5t618_i2c_probe(struct i2c_client=
 *i2c,
> > > >  		return ret;
> > > >  	}
> > > > =20
> > > > -	ret =3D devm_mfd_add_devices(&i2c->dev, -1, rn5t618_cells,
> > > > -				   ARRAY_SIZE(rn5t618_cells), NULL, 0, NULL);
> > > > +	if (priv->variant =3D=3D RC5T619)
> > > > +		ret =3D devm_mfd_add_devices(&i2c->dev, -1, rc5t619_cells,   =20
> > >=20
> > > Ref: The "-1", please use this as an opportunity to use the defines.
> > >  =20
BTW: of course I can clean that up.

> > > > +					   ARRAY_SIZE(rc5t619_cells),
> > > > +					   NULL, 0, NULL);
> > > > +	else   =20
> > >=20
> > > Are you sure it's not possible for 'variant' to be an unsupported
> > > device?
> > >  =20
> > Well, does it change the behavior for devices other than the rc5t619?
> > I do not think so. If the mfd driver is bound to unsupported devices,
> > rn5t618_of_match is wrong. =20
>=20
> Right, and can you catch that?
>=20
Well, maybe we don't get each other. RC5T619 has an RTC.
If I understand the code right, priv->variant is set to RC5T619.
if there is compatible =3D "ricoh,rc5t619" in the device tree.
So in that and only in that case I have an extended subdevice list,
which includes the RTC subdevice instead of only regulator and wdt.
For everything else I do not touch it.

So now you have doubts wether the existing regulator and watchdog subdevice
drivers (which I do not touch) works with the other two variants (RN5T618=20
and RN5T567) and want me to check that again as part of my work to get
RTC support for RC5T619 in?=20

Regards,
Andreas

--Sig_/N9qDnK+quarkvTFp.jEyjS=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl34uyYACgkQl4jFM1s/
ye+6kQ//Y2nQnAR5//z75aAA5b+jYm0Axk1msKCd9ScF1cndhaTE2V8I4yRLG3ox
jhvRoxk9N5wWGV3Db4vR6DJlUJPmqNpwuLndyJiiBYbTxU2nuY2EthwPmyYh0xf9
ByzDyU7nrUabU5dSPNVpm+nGj4iwAQZZbNUtDpbhAe7v47REgLkMPUs4Y7oQk+S/
nRoZRcrZfArQvxu2sbqSvghDuakESjMXLO8suMROxH5JaJuM0X8JhpHbY+AhcPYb
eTHLs0nVA8zHqYCDfKgTJYg1DztHzg1nz1M+XVysVvz0U4CGkBnatBqkSb/LFtcl
DsW9jCX2p0km162vsbEEcV0MAaFGHhNOlsiIm4VjIcPgIg7iT+poy0EXf/2vmwPl
qeaTCb6aPtWjnRiAGn34i9RmoSauz/a2TlBLlgRY/bS4ivu79GpfgU3+uA4C1Rqo
puyOsgKkk8nZsRLtNrkLLScbrg91bkL56BpDERhOn8CWqPL/9ygh+OEwpGYYhNeM
wpVbUD/2iK6qF3hXQPk/k7Ljxn2PibJJ7iYOavTFCHT06f8mDgodUYm6zhbm4t8S
QgJ2mrS5Uw7322cQyMFJe1F2VeEMjuU2wV3I8z/1dy9gBoDVt/oWpGZf6KzBiXvV
BvQ0fJHirPfYXKiM0PHrlFMt2dgYxM++MdVIEZ5DB5jzGcyBomQ=
=Aicg
-----END PGP SIGNATURE-----

--Sig_/N9qDnK+quarkvTFp.jEyjS=--

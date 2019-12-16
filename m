Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 692A0120EB3
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Dec 2019 17:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfLPQAV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Dec 2019 11:00:21 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:41490 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726916AbfLPQAV (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 16 Dec 2019 11:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=TGS6+SfNbYsSCiX0i/Vze/bvZqEPAq9yguFMTOt+qeE=; b=bahBcOQEYf+ySP5k1DGY+HdaS
        ZUHbgUMOSarIkdQoM8LMLUgFjUPb1TO+430OmjbBeOQdjtejJ/p1/wLYlZLpdDdHeNH/ayqHEAoF/
        y7V8LKFhvU9TXDv8G39mShYJyNzPvbIbLr9sq6+tXq0r3rqcsp6ymRK+GmJL7pQvykhxE=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1igsn4-0005FX-By; Mon, 16 Dec 2019 17:00:10 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1igsn1-0004dj-Ta; Mon, 16 Dec 2019 17:00:07 +0100
Date:   Mon, 16 Dec 2019 17:00:00 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v4 4/5] mfd: rn5t618: add more subdevices
Message-ID: <20191216170000.022a4c31@kemnade.info>
In-Reply-To: <20191216153106.GK2369@dell>
References: <20191211215409.32764-1-andreas@kemnade.info>
        <20191211215409.32764-5-andreas@kemnade.info>
        <20191216153106.GK2369@dell>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//.OSMD9FJV2e9zRYmChQGSF"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_//.OSMD9FJV2e9zRYmChQGSF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Dec 2019 15:31:06 +0000
Lee Jones <lee.jones@linaro.org> wrote:

> On Wed, 11 Dec 2019, Andreas Kemnade wrote:
>=20
> > The RC5T619 has a RTC which is missing in the
> > RN5T618. Add it as subdevice to prepare for their implementation
> >=20
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > Changes in v3:
> > - alignment cleanup
> >  drivers/mfd/rn5t618.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> > index d78eb29b94a4..18d56a732b20 100644
> > --- a/drivers/mfd/rn5t618.c
> > +++ b/drivers/mfd/rn5t618.c
> > @@ -22,6 +22,12 @@ static const struct mfd_cell rn5t618_cells[] =3D {
> >  	{ .name =3D "rn5t618-wdt" },
> >  };
> > =20
> > +static const struct mfd_cell rc5t619_cells[] =3D {
> > +	{ .name =3D "rn5t618-regulator" },
> > +	{ .name =3D "rc5t619-rtc" },
> > +	{ .name =3D "rn5t618-wdt" },
> > +};
> > +
> >  static bool rn5t618_volatile_reg(struct device *dev, unsigned int reg)
> >  {
> >  	switch (reg) {
> > @@ -173,8 +179,14 @@ static int rn5t618_i2c_probe(struct i2c_client *i2=
c,
> >  		return ret;
> >  	}
> > =20
> > -	ret =3D devm_mfd_add_devices(&i2c->dev, -1, rn5t618_cells,
> > -				   ARRAY_SIZE(rn5t618_cells), NULL, 0, NULL);
> > +	if (priv->variant =3D=3D RC5T619)
> > +		ret =3D devm_mfd_add_devices(&i2c->dev, -1, rc5t619_cells, =20
>=20
> Ref: The "-1", please use this as an opportunity to use the defines.
>=20
> > +					   ARRAY_SIZE(rc5t619_cells),
> > +					   NULL, 0, NULL);
> > +	else =20
>=20
> Are you sure it's not possible for 'variant' to be an unsupported
> device?
>=20
Well, does it change the behavior for devices other than the rc5t619?
I do not think so. If the mfd driver is bound to unsupported devices,
rn5t618_of_match is wrong.

Or do you want separate cell arrays for each of the three variant now to
ease future extensions?

Regards,
Andreas

--Sig_//.OSMD9FJV2e9zRYmChQGSF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl33qgAACgkQl4jFM1s/
ye8L3Q/9FC/7kYfw6hbthxCJkPmri2gjx5kxI9eS0GygR7CTvGRUmSY6EfeuMHVo
Pw7GmY2MlgUdrvWePw0iZaVEkO4P66w5vx/29Cv4p3ul5KHaJj4Pz//zK214WYSZ
yrMMvMgCsBNQdV0jwr0ATFSoQImuFlj6i967FQCCj6fxesfEBtR7IMYNrVjxMNAH
rmBJxSKTa++pNcw1vGSKnWw2bTCYYcWazhtKVUWTeP0mYGcpzmjEFzeUmUBgQu9o
A8LFRdEr69Tg7Zq55B8BytfcLcMlkaPjO1a5WMchWXpNixmepWzv6R3KMQ0HpA0D
XnQi9Lmh3CGBONYwcwznx53+msc8B8ACmQd5tvmLPzzbg55+LEQ6GOc7dSontY4z
4EScSx0GWioZO8No5QRndainByPTAAnln3+OFCQ4/XcPIUN/clV6xt4rxQ7a6WPL
8nkOeHsvncUxcIuZ5zrgunUsgElDsmtfAxHSAIQBZaF8XExtmrHSvVKS+/hKjIHL
9ZrfcmGTy8eMYqUzlWrMBNFCem9OjsXl/bb58szFEOGTZZ6hk3ZnlEthMZdpvEaM
E2tC7LNYGySAe4ImDmdrguYut3Hfkc2UYq4HQo82c/wSfmlvgBWHOEe1ohP53JP0
n35O5UJYWyR3NfBAf70jC4Y6DGKfNoakj7A9KgJBiL1g592r/48=
=1S8M
-----END PGP SIGNATURE-----

--Sig_//.OSMD9FJV2e9zRYmChQGSF--

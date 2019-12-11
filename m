Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0015A11AA16
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 12:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728976AbfLKLnp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 06:43:45 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:40504 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727477AbfLKLnp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 11 Dec 2019 06:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ysyNjTSsmEcgClf9ZxXEgP2ysGGg+LMv85Q0mUD/N2k=; b=A/LOMSEg2V59J0lHgD2cVZD75
        ugtsfbeLru2x5FGQCofE/qiFcQZFRoJ5WTmhgRATb//dMfit2N/Y6oqH/4Mc5VfZuJ7+DEVia7es8
        3naHAHrh/gRO1+PalhZ20fH71nctjrpLmaPDOTbutAAuagjczbp2l40iHY5L9+HwP5EY0=;
Received: from leintor.e.ffh.zone ([81.3.6.94] helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1if0P3-0006ib-VN; Wed, 11 Dec 2019 12:43:38 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1if0P1-00060J-Iy; Wed, 11 Dec 2019 12:43:35 +0100
Date:   Wed, 11 Dec 2019 12:43:20 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 3/6] mfd: rn5t618: add irq support
Message-ID: <20191211124320.5744531f@kemnade.info>
In-Reply-To: <20191211075021.GW3468@dell>
References: <20191129212045.18325-1-andreas@kemnade.info>
        <20191129212045.18325-4-andreas@kemnade.info>
        <20191210093225.GT3468@dell>
        <20191210175900.64df7de8@kemnade.info>
        <20191211075021.GW3468@dell>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MuFE3bBo6T9L2my3GBgeHNO"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/MuFE3bBo6T9L2my3GBgeHNO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Dec 2019 07:50:21 +0000
Lee Jones <lee.jones@linaro.org> wrote:

[...]
> > > > +
> > > >  static const struct i2c_device_id rn5t618_i2c_id[] =3D {
> > > >  	{ }
> > > >  };
> > > >  MODULE_DEVICE_TABLE(i2c, rn5t618_i2c_id);   =20
> > >=20
> > > Not this patch I know, but it's strange to see this empty. =20
> >=20
> > Yes, should be cleaned up. For now the device tree stuff seems to kick =
in. =20
>=20
> I think this can be removed completely.
>=20
> Just make sure you use .probe2 and it should be automatic.
>=20
Hmm, I cannot find probe2 but probe_new. So you mean probe_new?

I will send a separate cleanup patch

Regards,
Andreas

--Sig_/MuFE3bBo6T9L2my3GBgeHNO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl3w1lgACgkQl4jFM1s/
ye8mzxAAwCQcnHLPZi7KSYFXNKvY03FrI5UA5XrQCmZuhsjhGl1WdxClm0fnj9Vw
GDhsb6IJXyRJ+CyCokNnjD8mClv/Wis3Z/smz/10l2b89ZY8lryfaSWs4AAffQLi
QXrOV+XR9gx66FralblNB8sCJdSIOVaDjnsQgrMVNrR7yXHvzG3q8vpl7ObI/1oj
iXC2dzygKaBxBVtM/KTCBSHEbOgGMKWKU0Lvr5M6L9oktjnoOtLdMljiisMhlMgy
stOEuAXJ33G112OkcW+He/F1zxLAydzmTT4ZYXvK+IqLAc3X1mrUgWg4O+HBNioe
6LBGBV06gXtj7wgjHWGdq1yT5h1lSzAuZLonoaECocppkbqdUgMvOdFZcYch70Wj
PAIDtguSQEAQOTWJS6kSkD66vZeHSSUm5xCopmGOijmBKYGvXS5MNeZLDXje2oag
lTvJE2Z35wR3TYK2x4ynmMUKI6JQEcdaCt1V4+41WeFJGQg7zYZ82fdVejb9vrRR
UDmLYoFFHKaYYdvg57S6Sz5UGb82aCnPjdWREPnQR2tfjpOA2GuHE0rVHK037vrv
aVSgHfOJNVKeuzzvlRWX6fsRIv5j0pOL6KiZiiYRWk0Y+hLhl9WHPoo0HdwPeaxJ
dwKmfJNEbktanEiGTago7CmyEgx7dwiYYxp1a5NaKozRl0EovKU=
=lfsU
-----END PGP SIGNATURE-----

--Sig_/MuFE3bBo6T9L2my3GBgeHNO--

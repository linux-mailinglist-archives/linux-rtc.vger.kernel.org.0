Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982E0118E8C
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 18:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfLJRHD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 12:07:03 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:37854 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727525AbfLJRHD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 10 Dec 2019 12:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=14t3M7FRUcrAAT08sCCcDF5opKxVYW1DWqA46kBJpoU=; b=Gzg8Jay5rFyrL64iOMHkPzLa7
        bwqW55F3jLJC88TtpMYqIMklcWPuoDsGvtROu2PLfNkNdaiU/0P3Vm6h/pL/NRNpv6+VzjOTRV3UW
        dpWyhku5oM1bpJpVniztT9zG7TAfq9udHAsWmD85CWFoH+Csaa7GO4JpfJt+qXLZ8atRc=;
Received: from [185.238.219.18] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ieiyO-0007Wh-HK; Tue, 10 Dec 2019 18:06:56 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ieiyM-00056V-Lv; Tue, 10 Dec 2019 18:06:55 +0100
Date:   Tue, 10 Dec 2019 18:06:53 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 2/6] mfd: rn5t618: prepare for irq handling
Message-ID: <20191210173146.6b31e599@kemnade.info>
In-Reply-To: <20191210091351.GS3468@dell>
References: <20191129212045.18325-1-andreas@kemnade.info>
 <20191129212045.18325-3-andreas@kemnade.info>
 <20191210091351.GS3468@dell>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lcL2C=9LQcpfETqHHrb8+K3"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/lcL2C=9LQcpfETqHHrb8+K3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

accidently send it only to Lee, that was unintended.

On Tue, 10 Dec 2019 09:13:51 +0000
Lee Jones <lee.jones@linaro.org> wrote:

> On Fri, 29 Nov 2019, Andreas Kemnade wrote:
>=20
> > rn5t618 currently lacks irq handling. To prepare implementation =20
>=20
> "RN5T618"
> "IRQ"
>=20
> > in a rn5t618-irq.c, move main file to rn5t618-core.c =20
>=20
> Why do you *need* to call it "core"?
>=20
Well, the pattern is that irq stuff is in a separate file
for other mfds. And when I want to link things together to a rn5t618.[k]o
I think that none objects cannot be called rn5t618.o and so no source
file rn5t618.o. Am I wrong here? Of course if things can live in one file
this thing is not needed.

Regards,
Andreas

> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  drivers/mfd/Makefile                      | 2 ++
> >  drivers/mfd/{rn5t618.c =3D> rn5t618-core.c} | 0
> >  2 files changed, 2 insertions(+)
> >  rename drivers/mfd/{rn5t618.c =3D> rn5t618-core.c} (100%)
> >=20
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index c1067ea46204..110ea700231b 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -216,6 +216,8 @@ obj-$(CONFIG_MFD_PALMAS)	+=3D palmas.o
> >  obj-$(CONFIG_MFD_VIPERBOARD)    +=3D viperboard.o
> >  obj-$(CONFIG_MFD_RC5T583)	+=3D rc5t583.o rc5t583-irq.o
> >  obj-$(CONFIG_MFD_RK808)		+=3D rk808.o
> > +
> > +rn5t618-objs			:=3D rn5t618-core.o
> >  obj-$(CONFIG_MFD_RN5T618)	+=3D rn5t618.o
> >  obj-$(CONFIG_MFD_SEC_CORE)	+=3D sec-core.o sec-irq.o
> >  obj-$(CONFIG_MFD_SYSCON)	+=3D syscon.o
> > diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618-core.c
> > similarity index 100%
> > rename from drivers/mfd/rn5t618.c
> > rename to drivers/mfd/rn5t618-core.c =20
>=20
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
>=20

--Sig_/lcL2C=9LQcpfETqHHrb8+K3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl3v0K0ACgkQl4jFM1s/
ye/ilA/+OzgyZOMtqGTMLVIQy3K+s3tkm31ltQ6hT2NILDZsgmCwPUo5IkG+GJdL
9s5LX3lPEB7tP523Vxz+CUk/9+WD59jwtoTaQ3Rz7p0CZfvjQhTPbPPu4SFmDYrp
6VljHW/0sMgGsSQ/IyNFH949Obi2OZNe6n33UWr65MoNxPaMi/aNrzyHWjHIzqVo
jjrYmI0pvzOspPojvFYfxOlHfNJrdtAnOdmp5dT+eckGhRk6cdprGvDEN9sZ6WiK
enR5A6/y+5dRVW3L/ljm53rR2VK74gTNvVNDI+zwwNsgMSFBZwZeKgd8K3cVhNYr
XC8ZtHrP0tPVxChyaDUoTT2ewUMFsp7jCRoFYu4kLYwLfKNo4VNLh+oK+7MWLldb
GYsVMLemK1lISA4gmaZo6DYOL29J4b9yauXgbaPHHbfsMf77QZgOGX+HQGDpZb0f
tyKw8aym6lot/pciMw08ehFPgxJsqOHB6HIbxBLeIFhNkLoG1hHbUpCUcae6x7vQ
Xrb3uOyS3o+Fxcv4Qwf15sJ5T3oAWLUln4LbLtS9JAHDGvpYVKW/0zQydnCJ9fae
mXY3J8AcaR0ktYsAUGCeFs1y4gACSSwGIunximx+mQB5thhA6C89nSkp9BYC7ykU
Sq5n7wEcM+dDgwMD4NQwfaRGh5mDxgWMdvGXsr2TMskmoGF241Y=
=t/ga
-----END PGP SIGNATURE-----

--Sig_/lcL2C=9LQcpfETqHHrb8+K3--

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8D12120EBB
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Dec 2019 17:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfLPQCD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Dec 2019 11:02:03 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:44228 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfLPQCD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 16 Dec 2019 11:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=PFTbYGO/dc90I2YXG41N9f41dU8GVWMEed9i++G4Wv8=; b=AAQQx//12skpZ/haFxx66yTiC
        dN9Vm0vL43P4Cm/Jxigzt0tPdg0f4RovXhWvsx7jGU+5eDHgQ/IR1fADbyAW8tN2Ivmtj29p5X/Xf
        GOeC8uxFOI+i9ArqkrmhWraELxw4+KIExOuPqswF6nBIpY+OijyxDiVlq9BKFsVACDyq4=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1igson-0005GN-4P; Mon, 16 Dec 2019 17:01:57 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1igsoj-0004ec-Vp; Mon, 16 Dec 2019 17:01:54 +0100
Date:   Mon, 16 Dec 2019 17:01:52 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v4 2/5] mfd: rn5t618: add IRQ support
Message-ID: <20191216170152.25da1051@kemnade.info>
In-Reply-To: <20191216152715.GH2369@dell>
References: <20191211215409.32764-1-andreas@kemnade.info>
        <20191211215409.32764-3-andreas@kemnade.info>
        <20191216152715.GH2369@dell>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XbepMN/1jKrHdjWF6aXCDE7"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/XbepMN/1jKrHdjWF6aXCDE7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Dec 2019 15:27:15 +0000
Lee Jones <lee.jones@linaro.org> wrote:

> On Wed, 11 Dec 2019, Andreas Kemnade wrote:
>=20
> > This adds support for IRQ handling in the RC5T619 which is required
> > for properly implementing subdevices like RTC.
> > For now only definitions for the variant RC5T619 are included.
> >=20
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > Changes in v4:
> > merge rn5t618-irq.c into rn5t618.c
> > use macros for IRQ table
> >=20
> > Changes in v3:
> > alignment cleanup
> >=20
> > Changes in v2:
> > - no dead code, did some more testing and thinking for that
> > - remove extra empty lines
> >  drivers/mfd/Kconfig         |  1 +
> >  drivers/mfd/rn5t618.c       | 88 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  include/linux/mfd/rn5t618.h | 15 ++++++++
> >  3 files changed, 104 insertions(+)
> >=20
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index ae24d3ea68ea..522e068d0082 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1057,6 +1057,7 @@ config MFD_RN5T618
> >  	depends on OF
> >  	select MFD_CORE
> >  	select REGMAP_I2C
> > +	select REGMAP_IRQ
> >  	help
> >  	  Say yes here to add support for the Ricoh RN5T567,
> >  	  RN5T618, RC5T619 PMIC.
> > diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> > index da5cd9c92a59..76d997c0cfe4 100644
> > --- a/drivers/mfd/rn5t618.c
> > +++ b/drivers/mfd/rn5t618.c
> > @@ -8,6 +8,8 @@
> > =20
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/mfd/rn5t618.h>
> >  #include <linux/module.h>
> > @@ -45,9 +47,63 @@ static const struct regmap_config rn5t618_regmap_con=
fig =3D {
> >  	.cache_type	=3D REGCACHE_RBTREE,
> >  };
> > =20
> > +static const struct regmap_irq rc5t619_irqs[] =3D {
> > +	REGMAP_IRQ_REG(RN5T618_IRQ_SYS, 0, BIT(0)),
> > +	REGMAP_IRQ_REG(RN5T618_IRQ_DCDC, 0, BIT(1)),
> > +	REGMAP_IRQ_REG(RN5T618_IRQ_RTC, 0, BIT(2)),
> > +	REGMAP_IRQ_REG(RN5T618_IRQ_ADC, 0, BIT(3)),
> > +	REGMAP_IRQ_REG(RN5T618_IRQ_GPIO, 0, BIT(4)),
> > +	REGMAP_IRQ_REG(RN5T618_IRQ_CHG, 0, BIT(6)),
> > +};
> > +
> > +static const struct regmap_irq_chip rc5t619_irq_chip =3D {
> > +	.name =3D "rc5t619",
> > +	.irqs =3D rc5t619_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(rc5t619_irqs),
> > +	.num_regs =3D 1,
> > +	.status_base =3D RN5T618_INTMON,
> > +	.mask_base =3D RN5T618_INTEN,
> > +	.mask_invert =3D true,
> > +};
> > +
> >  static struct rn5t618 *rn5t618_pm_power_off;
> >  static struct notifier_block rn5t618_restart_handler;
> > =20
> > +int rn5t618_irq_init(struct rn5t618 *rn5t618) =20
>=20
> Static?
>=20
yes, it should be static since IRQ and core do live
in the same file now.

Regards,
Andreas

--Sig_/XbepMN/1jKrHdjWF6aXCDE7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl33qnAACgkQl4jFM1s/
ye/HZg//az7XDNxeh0oR3qY1nTmAOtRxQEviyCIvDuStB2kAvGRFnrfBBm7ZnO3n
js7yQjVP9rdLvQzKTnmBem8gwFCRfP+83lgQrW9nUenFbN0eqDlY6ManEHXqcWx4
1PTQKZ6u8vNHDIYE9fwxkzK4WrJfKSmIxuc24fosCfVk14zA92eCM1dHn2VoQ/TJ
dqMty9nrGsSEJXOdPNCAItQ7QGUDWhU2RBQnHltux4Con8YXlIT5fgjVyFOjMcSK
1jFTiL1pTR/CT8rdm8fwVycCESoLxe55YPdy5j0Z19f3fCUdsIUH+OG1H3nLpqy6
F9d70fvm3M00qcAGxnIerDB/w1QvG2CbzB49zcHPe2B14m4L+V4wAmnyyKCuuJL4
Wzn7maA82ahCI5Oczr2hAWq8YSg3xC6Nb+1IE5KKTQC6gjYgBJwyRdOkx7xrL+Oz
x9BHrn93nE6Iqv6w+FD5mYAsil+li/yTS/H8WocQATSv+efMQR+jxwKZe3NTMRrA
imX/7Tu4arf9erPttL3GBVL6HDAemWtChWMdyUhr6K5bZH5LpAQeLionvQ1Chm2/
GT0ovDs5IZ7+CwhFJxbZUqsmXVPrvBP+cQSt1AwEmkvO3YXoovYGgCBk9YaCH6sU
Qj7YZtbMjYxmogsqc93Wk+aMFGytSdlTTOSYDJhdBcwsyzI3djw=
=kwXw
-----END PGP SIGNATURE-----

--Sig_/XbepMN/1jKrHdjWF6aXCDE7--

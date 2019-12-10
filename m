Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C217118E64
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 17:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbfLJQ72 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 11:59:28 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:52460 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727562AbfLJQ72 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 10 Dec 2019 11:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=e3Eayld71WxoF0AxZFlGK/z0blEZ1CibDBODXOeXOiE=; b=CYf1AKpQ1qbBFXJcu5z/pJ6sF
        nh83owO/XV7FrNQ3czOssfgw9JXkw48tQv/Z+xoQOPcO/bOh9x3DuiamxgPnCTAjBPFl2Ym/O371Q
        tYWbgE+Qgj+wgiuHPG2xs7/z3Cx/rReOVmJAG9eKVBsd08QZxakVRSlW0ezG8/oTlOMSU=;
Received: from [185.238.219.18] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ieir0-0007Tk-U7; Tue, 10 Dec 2019 17:59:19 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ieiqu-00055E-Oo; Tue, 10 Dec 2019 17:59:12 +0100
Date:   Tue, 10 Dec 2019 17:59:00 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 3/6] mfd: rn5t618: add irq support
Message-ID: <20191210175900.64df7de8@kemnade.info>
In-Reply-To: <20191210093225.GT3468@dell>
References: <20191129212045.18325-1-andreas@kemnade.info>
        <20191129212045.18325-4-andreas@kemnade.info>
        <20191210093225.GT3468@dell>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Dv09M1d72KUKicRX56C2L8A"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/Dv09M1d72KUKicRX56C2L8A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Dec 2019 09:32:25 +0000
Lee Jones <lee.jones@linaro.org> wrote:

> On Fri, 29 Nov 2019, Andreas Kemnade wrote:
>=20
> > This adds support for irq handling in the rc5t619 which is required =20
>=20
> Please capitalise abbreviations and device names (as they do in the
> datasheet).
>=20
for IRQ vs. irq: I see both things in commit messages. Is there any rule ab=
out
that?

> > for properly implementing subdevices like rtc. =20
>=20
> "RTC"
>=20
> > For now only definitions for the variant rc5t619 are included.
> >=20
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > Changes in v3:
> > alignment cleanup
> >=20
> > Changes in v2:
> > - no dead code, did some more testing and thinking for that
> > - remove extra empty lines
> >=20
> >  drivers/mfd/Kconfig         |  1 +
> >  drivers/mfd/Makefile        |  2 +-
> >  drivers/mfd/rn5t618-core.c  | 34 ++++++++++++++-
> >  drivers/mfd/rn5t618-irq.c   | 85 +++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/rn5t618.h | 16 +++++++
> >  5 files changed, 136 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/mfd/rn5t618-irq.c
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
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 110ea700231b..2906d5db67d0 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -217,7 +217,7 @@ obj-$(CONFIG_MFD_VIPERBOARD)    +=3D viperboard.o
> >  obj-$(CONFIG_MFD_RC5T583)	+=3D rc5t583.o rc5t583-irq.o
> >  obj-$(CONFIG_MFD_RK808)		+=3D rk808.o
> > =20
> > -rn5t618-objs			:=3D rn5t618-core.o
> > +rn5t618-objs			:=3D rn5t618-core.o rn5t618-irq.o
> >  obj-$(CONFIG_MFD_RN5T618)	+=3D rn5t618.o
> >  obj-$(CONFIG_MFD_SEC_CORE)	+=3D sec-core.o sec-irq.o
> >  obj-$(CONFIG_MFD_SYSCON)	+=3D syscon.o
> > diff --git a/drivers/mfd/rn5t618-core.c b/drivers/mfd/rn5t618-core.c
> > index da5cd9c92a59..1e2326217681 100644
> > --- a/drivers/mfd/rn5t618-core.c
> > +++ b/drivers/mfd/rn5t618-core.c
> > @@ -8,6 +8,7 @@
> > =20
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/mfd/rn5t618.h>
> >  #include <linux/module.h>
> > @@ -105,7 +106,8 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
> > =20
> >  	i2c_set_clientdata(i2c, priv);
> >  	priv->variant =3D (long)of_id->data;
> > -
> > +	priv->chip_irq =3D i2c->irq;
> > +	priv->dev =3D &i2c->dev; =20
>=20
> '\n'
>=20
> >  	priv->regmap =3D devm_regmap_init_i2c(i2c, &rn5t618_regmap_config);
> >  	if (IS_ERR(priv->regmap)) {
> >  		ret =3D PTR_ERR(priv->regmap);
> > @@ -137,6 +139,11 @@ static int rn5t618_i2c_probe(struct i2c_client *i2=
c,
> >  		return ret;
> >  	}
> > =20
> > +	if (priv->chip_irq > 0) {
> > +		if (rn5t618_irq_init(priv))
> > +			priv->chip_irq =3D 0;
> > +	}
> > +
> >  	return 0;
> >  }
> > =20
> > @@ -154,15 +161,40 @@ static int rn5t618_i2c_remove(struct i2c_client *=
i2c)
> >  	return 0;
> >  }
> > =20
> > +static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
> > +{
> > +	struct rn5t618 *priv =3D dev_get_drvdata(dev);
> > +
> > +	if (priv->chip_irq)
> > +		disable_irq(priv->chip_irq);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
> > +{
> > +	struct rn5t618 *priv =3D dev_get_drvdata(dev);
> > +
> > +	if (priv->chip_irq)
> > +		enable_irq(priv->chip_irq);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct i2c_device_id rn5t618_i2c_id[] =3D {
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, rn5t618_i2c_id); =20
>=20
> Not this patch I know, but it's strange to see this empty.
>

Yes, should be cleaned up. For now the device tree stuff seems to kick in.
=20
> > +static SIMPLE_DEV_PM_OPS(rn5t618_i2c_dev_pm_ops,
> > +			rn5t618_i2c_suspend,
> > +			rn5t618_i2c_resume);
> > +
> >  static struct i2c_driver rn5t618_i2c_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "rn5t618",
> >  		.of_match_table =3D of_match_ptr(rn5t618_of_match),
> > +		.pm =3D &rn5t618_i2c_dev_pm_ops,
> >  	},
> >  	.probe =3D rn5t618_i2c_probe,
> >  	.remove =3D rn5t618_i2c_remove,
> > diff --git a/drivers/mfd/rn5t618-irq.c b/drivers/mfd/rn5t618-irq.c =20
>=20
> Why does this need to be separate from the core file?
>=20
It does not need. It is not that complex. There will just be another set of
tables for the rn5t618

> > new file mode 100644
> > index 000000000000..8a4c56429768
> > --- /dev/null
> > +++ b/drivers/mfd/rn5t618-irq.c
> > @@ -0,0 +1,85 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019 Andreas Kemnade
> > + */
> > +#include <linux/device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <linux/mfd/rn5t618.h>
> > +
> > +static const struct regmap_irq rc5t619_irqs[] =3D {
> > +	[RN5T618_IRQ_SYS] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D (0 << 1)
> > +	},
> > +	[RN5T618_IRQ_DCDC] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D (1 << 1) =20
>=20
> BIT()
>=20
yes, makes things more readable.

> > +	},
> > +	[RN5T618_IRQ_RTC]  =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D (1 << 2)
> > +	},
> > +	[RN5T618_IRQ_ADC] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D (1 << 3)
> > +	},
> > +	[RN5T618_IRQ_GPIO] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D (1 << 4)
> > +	},
> > +	[RN5T618_IRQ_CHG] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D (1 << 6),
> > +	}
> > +}; =20
>=20
> There are probably macros available to tidy this up.
>=20
> Take a look in include/linux/regmap.h
>=20
I will have a look.

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
> > +int rn5t618_irq_init(struct rn5t618 *rn5t618)
> > +{
> > +	const struct regmap_irq_chip *irq_chip;
> > +	int ret;
> > +
> > +	if (!rn5t618->chip_irq)
> > +		return 0;
> > +
> > +	switch (rn5t618->variant) {
> > +	case RC5T619:
> > +		irq_chip =3D &rc5t619_irq_chip;
> > +		break;
> > +
> > +		/* TODO: check irq definitions for other variants */ =20
>=20
> No need for this.  It's implied.
>=20
> OOI, when support for more variants be added?
>=20
I have done research about the RN5T618. It has just the RTC IRQ missing, I =
could just
add the table for it to prepare the path for others. I cannot test it but
since there are no users yet, it does not harm that it is not well-tested.

No idea about the RN5T567.

> > +	default:
> > +		irq_chip =3D NULL;
> > +		break;
> > +	}
> > +
> > +	if (!irq_chip) {
> > +		dev_err(rn5t618->dev, "no IRQ definition known for variant\n"); =20
>=20
> How about '"Variant %d not currently supported", rn5t618->variant'
>=20
makes sense.

> > +		return -ENOENT;
> > +	}
> > +
> > +	ret =3D devm_regmap_add_irq_chip(rn5t618->dev, rn5t618->regmap,
> > +				       rn5t618->chip_irq,
> > +				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > +				       0, irq_chip, &rn5t618->irq_data);
> > +	if (ret !=3D 0) { =20
>=20
> if (ret)
>=20
> > +		dev_err(rn5t618->dev, "Failed to register IRQ chip\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t618.h
> > index d62ef48060b5..edd2b6485e3b 100644
> > --- a/include/linux/mfd/rn5t618.h
> > +++ b/include/linux/mfd/rn5t618.h
> > @@ -242,9 +242,25 @@ enum {
> >  	RC5T619,
> >  };
> > =20
> > +/* RN5T618 IRQ definitions */
> > +enum {
> > +	RN5T618_IRQ_SYS, =20
>=20
> =3D 0?
>=20
> > +	RN5T618_IRQ_DCDC,
> > +	RN5T618_IRQ_RTC,
> > +	RN5T618_IRQ_ADC,
> > +	RN5T618_IRQ_GPIO,
> > +	RN5T618_IRQ_CHG,
> > +	RN5T618_NR_IRQS,
> > +};
> > +
> >  struct rn5t618 {
> >  	struct regmap *regmap;
> > +	struct device *dev;
> >  	long variant;
> > +
> > +	int chip_irq; =20
>=20
> Are there any other kinds of IRQ?
>=20
there is some separate battery low input for the charger which
could be modeled as an IRQ.
But that could be handled entirely there when I am at it and
in the corresponding subdevice.=20

Regards,
Andreas

--Sig_/Dv09M1d72KUKicRX56C2L8A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl3vztQACgkQl4jFM1s/
ye94Eg//X7sWu/swNKNaYfDxa1hoIU7i4W0iEJiDxN47uejAeMeMgFPb+C0H/Hjs
JCYmHgdu96WQQ48qW7oaKQmZ3zhTNTHE4LiUYIrpwPoSbwSbk4Q3MD1wLGUN88kq
txmt5l+l7rVjkP0LOo/HFb8qmVSAwrlR4OXUpX3cs//qFBed/n5jhW69TZJAJXl7
+jZA+c57Nz5zlNFghm98izQNXPHE6Q57xZmR9C8rNKJeoKSyu1y6zC9FDeEgjfKm
EQVktS86hfDbClkrvl1juecoRtmygDc8RW7gz0MGLYreTayQXUAT0WGimExP4OD9
7916tP9ddJ/HJSzvCC2E7HfTi/z3fCPOYfLkr26f7EWFOjQ+Vhi6XucJnnpa7i4G
kXUfXvDg0GEAJNR4btxRlzdXfUQAPBgRM9gbaw/Cys6QC7XZLd3X9+IfEzgha1Ow
DA2JocsJ6K2GKbQmMS/EGYHpL1yJo4ayZ3yykOmWSUGCaG7CTzbZL08B/K/Z0KOQ
FXPXGUTLiIhPnUwgpVEDrSvS074MN3rWnT0hz5CQpCH8h5QbqTsa4cvxaLoNccqo
5yx0QB8yFD5nQbKVRdA4MAyagRilhd22Ei6meJmOT/ahBCcp/gQeg5vFp6bq85BR
P9B6F0nP8vF1Lo14ARoMBqKyu84uM8bFLyzkNGpkptwlZ0AaEY0=
=4yQw
-----END PGP SIGNATURE-----

--Sig_/Dv09M1d72KUKicRX56C2L8A--

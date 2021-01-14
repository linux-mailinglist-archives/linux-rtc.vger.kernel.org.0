Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA7F2F5C18
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 09:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbhANIGr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 03:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbhANIGX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Jan 2021 03:06:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E4CC061786
        for <linux-rtc@vger.kernel.org>; Thu, 14 Jan 2021 00:05:43 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzxdP-0000a9-GU; Thu, 14 Jan 2021 09:05:35 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzxdN-0004qT-Ol; Thu, 14 Jan 2021 09:05:33 +0100
Date:   Thu, 14 Jan 2021 09:05:33 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     dan.carpenter@oracle.com, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtc: pcf2127: Disable Power-On Reset Override
Message-ID: <20210114080533.tnipsnqfxeqotvlg@pengutronix.de>
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-2-p.rosenberger@kunbus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7hlg47jdrphncaem"
Content-Disposition: inline
In-Reply-To: <20210113112742.7354-2-p.rosenberger@kunbus.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--7hlg47jdrphncaem
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 12:27:41PM +0100, Philipp Rosenberger wrote:
> To resume normal operation after a total power loss (no or empty
> battery) the "Power-On Reset Override (PORO)" facility needs to be
> disabled.
>=20
> As the oscillator may take a long time (200 ms to 2 s) to resume normal
> operation. The default behaviour is to use the PORO facility.

I'd write instead: The register reset value sets PORO enabled and the
data sheet recommends setting it to disabled for normal operation.
In my eyes having a reset default value that is unsuitable for
production use is just another bad design choice of this chip. At least
now this is known and can be somewhat fixed in software. :-\

> But with the PORO active no interrupts are generated on the interrupt
> pin (INT).

This sentence about no interrupts is your observation, or does this base
on some authoritative source (datasheet, FAE or similar)?

> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 39a7b5116aa4..378b1ce812d6 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -26,6 +26,7 @@
> =20
>  /* Control register 1 */
>  #define PCF2127_REG_CTRL1		0x00
> +#define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
>  #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
>  /* Control register 2 */
>  #define PCF2127_REG_CTRL2		0x01
> @@ -612,6 +613,23 @@ static int pcf2127_probe(struct device *dev, struct =
regmap *regmap,
>  		ret =3D devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
>  	}
> =20
> +	/*
> +	 * The "Power-On Reset Override" facility prevents the RTC to do a reset
> +	 * after power on. For normal operation the PORO must be disabled.
> +	 */
> +	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
> +				PCF2127_BIT_CTRL1_POR_OVRD);
> +	/*
> +	 * If the PORO can't be disabled, just move on. The RTC should
> +	 * work fine, but functions like watchdog and alarm interrupts might
> +	 * not work. There will be no interrupt generated on the interrupt pin.
> +	 */
> +	ret =3D regmap_test_bits(pcf2127->regmap, PCF2127_REG_CTRL1, PCF2127_BI=
T_CTRL1_POR_OVRD);
> +	if (ret <=3D 0) {
> +		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
> +		dev_warn(dev, "Watchdog and alarm functions might not work properly\n"=
);

I would not emit two messages here. Also including __func__ isn't so
nice IMHO. (Great for debugging, but not in production code IMHO.)

We should consider a Cc: to stable.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7hlg47jdrphncaem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl//+0oACgkQwfwUeK3K
7AnncwgAmgwavQFuGTcL160YS+dop1vuwxFgXqqpsvGaYddNW3rPLnOfo6GAl0ZR
sbKuNYlkHcgrz5LzWT8iDF+WS6R/TVoFVg0arUJxtBMhnKkAVnUUi36Rte0Quttk
v5i7scFgboKKxMHFcsqUVGOHhC6LcuNKOAuZg52Np8zgnnthgOIqrmKvQ1kYi1xa
+VFoCjvoKfIrjNISraPacqHu/mHWB8P1KXxbvqADjrrUDRQQU5/TNhlFVAF3Nwa/
ln0x/BR0a/OxGf0qK93kLbVZkifN1j/6dgWtP2kvgnDnD98z56Twwlikm9dKgsbm
HHJqz7/IHTc9jZ2wXyEykVllrU2W8A==
=GfZX
-----END PGP SIGNATURE-----

--7hlg47jdrphncaem--

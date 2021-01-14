Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D222F5C29
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 09:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbhANIHo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 03:07:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbhANIHo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Jan 2021 03:07:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86227C061794
        for <linux-rtc@vger.kernel.org>; Thu, 14 Jan 2021 00:07:03 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzxej-0000oA-1r; Thu, 14 Jan 2021 09:06:57 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzxei-0004s9-FX; Thu, 14 Jan 2021 09:06:56 +0100
Date:   Thu, 14 Jan 2021 09:06:56 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     dan.carpenter@oracle.com, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: Run a OTP refresh if not done before
Message-ID: <20210114080656.ee7fdqufu2biyy4y@pengutronix.de>
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-3-p.rosenberger@kunbus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a6dyhtavpy6kionk"
Content-Disposition: inline
In-Reply-To: <20210113112742.7354-3-p.rosenberger@kunbus.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--a6dyhtavpy6kionk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 12:27:42PM +0100, Philipp Rosenberger wrote:
> The datasheet of the PCF2127 states,it is recommended to process an OTP

s/,/, /

> refresh once the power is up and the oscillator is operating stable. The
> OTP refresh takes less than 100 ms to complete.
>=20
> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 378b1ce812d6..ca56dba64e79 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -58,6 +58,9 @@
>  #define PCF2127_REG_ALARM_DM		0x0D
>  #define PCF2127_REG_ALARM_DW		0x0E
>  #define PCF2127_BIT_ALARM_AE			BIT(7)
> +/* CLKOUT control register */
> +#define PCF2127_REG_CLKOUT		0x0f
> +#define PCF2127_BIT_CLKOUT_OTPR			BIT(5)
>  /* Watchdog registers */
>  #define PCF2127_REG_WD_CTL		0x10
>  #define PCF2127_BIT_WD_CTL_TF0			BIT(0)
> @@ -630,6 +633,19 @@ static int pcf2127_probe(struct device *dev, struct =
regmap *regmap,
>  		dev_warn(dev, "Watchdog and alarm functions might not work properly\n"=
);
>  	}
> =20
> +	/*
> +	 * Set the OTP refresh bit unconditionally. If an OTP refresh was
> +	 * already done the bit is already set and will not rerun the refresh
> +	 * operation.
> +	 */
> +	ret =3D regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
> +			      PCF2127_BIT_CLKOUT_OTPR);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: OTP refresh (clkout_ctrl) failed.\n", __func__);
> +		return ret;
> +	}
> +	msleep(100);

This unconditional sleep isn't so nice. Maybe it makes sense to only do
this when the chip reports a power loss?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--a6dyhtavpy6kionk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl//+5sACgkQwfwUeK3K
7Al3KggAkpBdilZu6pQowNjH7PQK3KItn0Ec6JtSpdlA8Hz+6WgfMwIkweOEcYW0
Fzef+0L3MGaFpsEtWKIZlEC+tOk2YhPF8XF3o0rYrFxMDpP2Ainq3SkVeDKMJi5d
55XqmPNyG1bTtL5xwpYv5Q+YnKi1aHRZAnxlhoYFLoJFgANnAIwqOO89XYWuYnHY
xMq9C3wBA0LzHTXfDVA1IuXM5j0/mv6CRLtqUBOjj5JcKunLyrQWd0dDoU5QCBkT
Mfz08NpaYeGYEpVkVwzY6CMkW+HB7aiwclJXk8GqGUxX3VlpGdTKs2tTrAohVVbL
m5mgLqBeNfydg+PfKv3kudB3Fi+Jpw==
=uaim
-----END PGP SIGNATURE-----

--a6dyhtavpy6kionk--

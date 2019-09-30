Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB2B9C1C69
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Sep 2019 09:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfI3H5F (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Sep 2019 03:57:05 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:34599 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfI3H5F (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Sep 2019 03:57:05 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46hZVj3ZN0z1rP1X;
        Mon, 30 Sep 2019 09:57:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46hZVj2sl8z1qqkD;
        Mon, 30 Sep 2019 09:57:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id zDHIZVXcUQys; Mon, 30 Sep 2019 09:57:00 +0200 (CEST)
X-Auth-Info: 2tpDh3UFdAVdsjFb4VpTf175oFxbKUUmH0AbH5dUlHU=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 30 Sep 2019 09:57:00 +0200 (CEST)
Date:   Mon, 30 Sep 2019 09:56:59 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Add support for century bits to m41t62 (rv4162)
 RTC devices
Message-ID: <20190930095659.783fa45f@jawa>
In-Reply-To: <20190911154803.15969-1-lukma@denx.de>
References: <20190911154803.15969-1-lukma@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/BddmQxahLNVx5eme1c9dJ9X"; protocol="application/pgp-signature"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/BddmQxahLNVx5eme1c9dJ9X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alessandro, Alexandre,

> This change adds support for 'century bits' on 4162 family of RTC
> devices (from ST or microcrystal), which allow storing time beyond
> year 2099.
>=20
> For rv4162 century bits - CB1[7]:CB0[6] are stored in reg6 - 0x6
> (MONTH): CB1  CB0
>  0    0      (year 2000 - 2099)
>  0    1      (year 2100 - 2199)
>  1    0      (year 2200 - 2299)
>  1    1      (year 2300 - 2399)
>=20
> The driver has been also adjusted to allow setting time up to year
> 2399 if the M41T80_FEATURE_CB is set in its DTS/I2C data.
>=20
> There shall be no functional changes for devices not supporting this
> feature. However, other devices - like m41t80 - have different
> approaches to handle century information.

Gentle ping on this patch - it has been almost 3 weeks without any
reply ...

Thanks in advance.

>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  drivers/rtc/rtc-m41t80.c | 56
> +++++++++++++++++++++++++++++++--------- 1 file changed, 44
> insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 9fdc284c943b..5452ab693568 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -68,9 +68,22 @@
>  #define M41T80_FEATURE_SQ	BIT(2)	/* Squarewave feature
> */ #define M41T80_FEATURE_WD	BIT(3)	/* Extra watchdog
> resolution */ #define M41T80_FEATURE_SQ_ALT	BIT(4)	/*
> RSx bits are in reg 4 */ +#define M41T80_FEATURE_CB
> BIT(5)	/* Century Bits[CB1:CB0] are in reg 6 */ +
> +/*
> + * Century bits - CB1[7]:CB0[6] in reg6 (MONTH):
> + * CB1  CB0
> + * 0    0      (year 2000 - 2099)
> + * 0    1      (year 2100 - 2199)
> + * 1    0      (year 2200 - 2299)
> + * 1    1      (year 2300 - 2399)
> + */
> +#define M41T80_CB_SHIFT         6       /* CB[0] bit position */
> +#define M41T80_CB_MASK          0xc0    /* Century bits mask */
> =20
>  static const struct i2c_device_id m41t80_id[] =3D {
> -	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
> +	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT |
> +	  M41T80_FEATURE_CB},
>  	{ "m41t65", M41T80_FEATURE_HT | M41T80_FEATURE_WD },
>  	{ "m41t80", M41T80_FEATURE_SQ },
>  	{ "m41t81", M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
> @@ -80,7 +93,8 @@ static const struct i2c_device_id m41t80_id[] =3D {
>  	{ "m41st84", M41T80_FEATURE_HT | M41T80_FEATURE_BL |
> M41T80_FEATURE_SQ }, { "m41st85", M41T80_FEATURE_HT |
> M41T80_FEATURE_BL | M41T80_FEATURE_SQ }, { "m41st87",
> M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
> -	{ "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WD |
> M41T80_FEATURE_SQ_ALT },
> +	{ "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WD |
> +	  M41T80_FEATURE_SQ_ALT | M41T80_FEATURE_CB},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, m41t80_id);
> @@ -88,7 +102,8 @@ MODULE_DEVICE_TABLE(i2c, m41t80_id);
>  static const struct of_device_id m41t80_of_match[] =3D {
>  	{
>  		.compatible =3D "st,m41t62",
> -		.data =3D (void *)(M41T80_FEATURE_SQ |
> M41T80_FEATURE_SQ_ALT)
> +		.data =3D (void *)(M41T80_FEATURE_SQ |
> M41T80_FEATURE_SQ_ALT |
> +				 M41T80_FEATURE_CB)
>  	},
>  	{
>  		.compatible =3D "st,m41t65",
> @@ -128,16 +143,19 @@ static const struct of_device_id
> m41t80_of_match[] =3D { },
>  	{
>  		.compatible =3D "microcrystal,rv4162",
> -		.data =3D (void *)(M41T80_FEATURE_SQ |
> M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
> +		.data =3D (void *)(M41T80_FEATURE_SQ |
> M41T80_FEATURE_WD |
> +				 M41T80_FEATURE_SQ_ALT |
> M41T80_FEATURE_CB) },
>  	/* DT compatibility only, do not use compatibles below: */
>  	{
>  		.compatible =3D "st,rv4162",
> -		.data =3D (void *)(M41T80_FEATURE_SQ |
> M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
> +		.data =3D (void *)(M41T80_FEATURE_SQ |
> M41T80_FEATURE_WD |
> +				 M41T80_FEATURE_SQ_ALT |
> M41T80_FEATURE_CB) },
>  	{
>  		.compatible =3D "rv4162",
> -		.data =3D (void *)(M41T80_FEATURE_SQ |
> M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
> +		.data =3D (void *)(M41T80_FEATURE_SQ |
> M41T80_FEATURE_WD |
> +				 M41T80_FEATURE_SQ_ALT |
> M41T80_FEATURE_CB) },
>  	{ }
>  };
> @@ -197,6 +215,7 @@ static irqreturn_t m41t80_handle_irq(int irq,
> void *dev_id) static int m41t80_rtc_read_time(struct device *dev,
> struct rtc_time *tm) {
>  	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct m41t80_data *clientdata =3D i2c_get_clientdata(client);
>  	unsigned char buf[8];
>  	int err, flags;
> =20
> @@ -222,9 +241,13 @@ static int m41t80_rtc_read_time(struct device
> *dev, struct rtc_time *tm) tm->tm_mday =3D bcd2bin(buf[M41T80_REG_DAY]
> & 0x3f); tm->tm_wday =3D buf[M41T80_REG_WDAY] & 0x07;
>  	tm->tm_mon =3D bcd2bin(buf[M41T80_REG_MON] & 0x1f) - 1;
> -
> -	/* assume 20YY not 19YY, and ignore the Century Bit */
> +	/* assume 20YY not 19YY */
>  	tm->tm_year =3D bcd2bin(buf[M41T80_REG_YEAR]) + 100;
> +
> +	if (clientdata->features & M41T80_FEATURE_CB)
> +		tm->tm_year +=3D ((buf[M41T80_REG_MON] &
> M41T80_CB_MASK)
> +				>> M41T80_CB_SHIFT) * 100;
> +
>  	return 0;
>  }
> =20
> @@ -232,10 +255,13 @@ static int m41t80_rtc_set_time(struct device
> *dev, struct rtc_time *tm) {
>  	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct m41t80_data *clientdata =3D i2c_get_clientdata(client);
> +	int err, flags, max_year =3D 199;
>  	unsigned char buf[8];
> -	int err, flags;
> =20
> -	if (tm->tm_year < 100 || tm->tm_year > 199)
> +	if (clientdata->features & M41T80_FEATURE_CB)
> +		max_year =3D 499;
> +
> +	if (tm->tm_year < 100 || tm->tm_year > max_year)
>  		return -EINVAL;
> =20
>  	buf[M41T80_REG_SSEC] =3D 0;
> @@ -243,8 +269,14 @@ static int m41t80_rtc_set_time(struct device
> *dev, struct rtc_time *tm) buf[M41T80_REG_MIN] =3D bin2bcd(tm->tm_min);
>  	buf[M41T80_REG_HOUR] =3D bin2bcd(tm->tm_hour);
>  	buf[M41T80_REG_DAY] =3D bin2bcd(tm->tm_mday);
> -	buf[M41T80_REG_MON] =3D bin2bcd(tm->tm_mon + 1);
> -	buf[M41T80_REG_YEAR] =3D bin2bcd(tm->tm_year - 100);
> +	if (clientdata->features & M41T80_FEATURE_CB) {
> +		buf[M41T80_REG_YEAR] =3D bin2bcd((tm->tm_year - 100) %
> 100);
> +		buf[M41T80_REG_MON] =3D bin2bcd(tm->tm_mon + 1) |
> +			(((tm->tm_year - 100) / 100) <<
> M41T80_CB_SHIFT);
> +	} else {
> +		buf[M41T80_REG_MON] =3D bin2bcd(tm->tm_mon + 1);
> +		buf[M41T80_REG_YEAR] =3D bin2bcd(tm->tm_year - 100);
> +	}
>  	buf[M41T80_REG_WDAY] =3D tm->tm_wday;
> =20
>  	/* If the square wave output is controlled in the weekday
> register */




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/BddmQxahLNVx5eme1c9dJ9X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2RtUsACgkQAR8vZIA0
zr0ETggAu5/6S2LnMAmk5WLXOflb6XT1x+eKYVGvCLXV5SYYFrHRHjZrl54Qwgdn
irUXVNG0DiLWVflDVvks8k40nt8B+wgHdLXHrgJCLVRl52qLJ2HTsyFsBucvkIPc
pedobGxtO9lQmstiOGxHMbbyUp/jEAvkH5GrVfVkL3SPtZXXwQZ0fLwrMpNQOP54
68kMuZp0jnxhFdEH9aa/RrlwYzRFsCtOqJaWo7AlRLlHS1xO05pTBgorDORCnZtO
B5yBfTHdQzsBrZoH01tg3zp/AJj4CB9Ujnzgq243a7oqxkjVTsicqnY8xUhM+XKU
+1Q3cYewlR0jvHNfR6Q1d9DdX/zTzA==
=79GP
-----END PGP SIGNATURE-----

--Sig_/BddmQxahLNVx5eme1c9dJ9X--

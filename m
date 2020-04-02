Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2F7619C35B
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2020 15:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgDBN5y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Apr 2020 09:57:54 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60115 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbgDBN5x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Apr 2020 09:57:53 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 66E12E0007;
        Thu,  2 Apr 2020 13:57:50 +0000 (UTC)
Date:   Thu, 2 Apr 2020 15:57:50 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] rtc: sun6i: let the core handle rtc range
Message-ID: <20200402135750.GB625345@aptenodytes>
References: <20200330201226.860967-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
In-Reply-To: <20200330201226.860967-1-alexandre.belloni@bootlin.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 30 Mar 20, 22:12, Alexandre Belloni wrote:
> Let the rtc core check the date/time against the RTC range.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

This was successfully:
Tested-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/rtc/rtc-sun6i.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 415a20a936e4..446ce38c1592 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -108,7 +108,6 @@
>   * driver, even though it is somewhat limited.
>   */
>  #define SUN6I_YEAR_MIN				1970
> -#define SUN6I_YEAR_MAX				2033
>  #define SUN6I_YEAR_OFF				(SUN6I_YEAR_MIN - 1900)
> =20
>  /*
> @@ -569,14 +568,6 @@ static int sun6i_rtc_settime(struct device *dev, str=
uct rtc_time *rtc_tm)
>  	struct sun6i_rtc_dev *chip =3D dev_get_drvdata(dev);
>  	u32 date =3D 0;
>  	u32 time =3D 0;
> -	int year;
> -
> -	year =3D rtc_tm->tm_year + 1900;
> -	if (year < SUN6I_YEAR_MIN || year > SUN6I_YEAR_MAX) {
> -		dev_err(dev, "rtc only supports year in range %d - %d\n",
> -			SUN6I_YEAR_MIN, SUN6I_YEAR_MAX);
> -		return -EINVAL;
> -	}
> =20
>  	rtc_tm->tm_year -=3D SUN6I_YEAR_OFF;
>  	rtc_tm->tm_mon +=3D 1;
> @@ -585,7 +576,7 @@ static int sun6i_rtc_settime(struct device *dev, stru=
ct rtc_time *rtc_tm)
>  		SUN6I_DATE_SET_MON_VALUE(rtc_tm->tm_mon)  |
>  		SUN6I_DATE_SET_YEAR_VALUE(rtc_tm->tm_year);
> =20
> -	if (is_leap_year(year))
> +	if (is_leap_year(rtc_tm->tm_year + SUN6I_YEAR_MIN))
>  		date |=3D SUN6I_LEAP_SET_VALUE(1);
> =20
>  	time =3D SUN6I_TIME_SET_SEC_VALUE(rtc_tm->tm_sec)  |
> @@ -726,12 +717,16 @@ static int sun6i_rtc_probe(struct platform_device *=
pdev)
> =20
>  	device_init_wakeup(&pdev->dev, 1);
> =20
> -	chip->rtc =3D devm_rtc_device_register(&pdev->dev, "rtc-sun6i",
> -					     &sun6i_rtc_ops, THIS_MODULE);
> -	if (IS_ERR(chip->rtc)) {
> -		dev_err(&pdev->dev, "unable to register device\n");
> +	chip->rtc =3D devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(chip->rtc))
>  		return PTR_ERR(chip->rtc);
> -	}
> +
> +	chip->rtc->ops =3D &sun6i_rtc_ops;
> +	chip->rtc->range_max =3D 2019686399LL; /* 2033-12-31 23:59:59 */
> +
> +	ret =3D rtc_register_device(chip->rtc);
> +	if (ret)
> +		return ret;
> =20
>  	dev_info(&pdev->dev, "RTC enabled\n");
> =20
> --=20
> 2.25.1
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6F710ACgkQ3cLmz3+f
v9Gq1wf/eZuw4SqfApdh/ne7KCouiVqi0dVgGBxHtJS+Ri7ubxxKPy6gL4uvjq4b
mWk8NTgQS9SQR+tcPxT54JBoN/PlYiB8yaI8ZUBOsHTMl2F3HZfvvaVNWlqiLqd0
hDt+aw6lO0j1q48VDR55EcjxocBCDrEGrpnM65lZc6qg7FWtxgSRWSxMUWm/AKiD
YHzNzP2gjWEyQ5a34KoYZK64bTJcWS7F+hqh7gUWs33hzT4qtL3BlSGJf5Dz4dFN
Z82A5GkA9WVDULUgO7VmaFDsg8VRGZpzg3OOXFRpMnXOprILikTU6zKuJqfb+0+F
znTn9YNLLJYbRsAgJ2Hr9/oJCIlnZw==
=sjtj
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7148019C357
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2020 15:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgDBN5f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Apr 2020 09:57:35 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55991 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgDBN5f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Apr 2020 09:57:35 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E40DB6000D;
        Thu,  2 Apr 2020 13:57:31 +0000 (UTC)
Date:   Thu, 2 Apr 2020 15:57:31 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] rtc: sun6i: switch to
 rtc_time64_to_tm/rtc_tm_to_time64
Message-ID: <20200402135731.GA625345@aptenodytes>
References: <20200330201510.861217-1-alexandre.belloni@bootlin.com>
 <20200330201510.861217-3-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <20200330201510.861217-3-alexandre.belloni@bootlin.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 30 Mar 20, 22:15, Alexandre Belloni wrote:
> Call the 64bit versions of rtc_tm time conversion.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

This was successfully:
Tested-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/rtc/rtc-sun6i.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 446ce38c1592..e2b8b150bcb4 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -498,7 +498,7 @@ static int sun6i_rtc_getalarm(struct device *dev, str=
uct rtc_wkalrm *wkalrm)
> =20
>  	wkalrm->enabled =3D !!(alrm_en & SUN6I_ALRM_EN_CNT_EN);
>  	wkalrm->pending =3D !!(alrm_st & SUN6I_ALRM_EN_CNT_EN);
> -	rtc_time_to_tm(chip->alarm, &wkalrm->time);
> +	rtc_time64_to_tm(chip->alarm, &wkalrm->time);
> =20
>  	return 0;
>  }
> @@ -519,8 +519,8 @@ static int sun6i_rtc_setalarm(struct device *dev, str=
uct rtc_wkalrm *wkalrm)
>  		return -EINVAL;
>  	}
> =20
> -	rtc_tm_to_time(alrm_tm, &time_set);
> -	rtc_tm_to_time(&tm_now, &time_now);
> +	time_set =3D rtc_tm_to_time64(alrm_tm);
> +	time_now =3D rtc_tm_to_time64(&tm_now);
>  	if (time_set <=3D time_now) {
>  		dev_err(dev, "Date to set in the past\n");
>  		return -EINVAL;
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

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6F70sACgkQ3cLmz3+f
v9FADgf/Z8x/NG6rzW4iNYoe/p42n/FIn4dXr7WV1OAzVj+G2wBINasXpLZtHsOI
yOoKl5GNGQXF85p1b6sQaZ+FVwA0YqZsGfzum93w0s0YeoQpBSMjhYjUuneHarB0
hsQR0LWjcgTe2/FmvBKgsjZ+iAo+6M+iB0R0M/qVLpFl3vzNltJFPcLTABAbdFOX
WLy84aeTTrwWnvjPkxIZpMQGXkAnEfYe+NlejO/KqlvUZVvOsbVVokqmCk2/4iib
oOV+35FTm8Bg0jwD7VORvp8CcMbNRTDT3dIivW+SzG4qnx2Q1kGyRKxYDpMSdgyc
M+gTvQcwLkm5zpwNxP85+Y0aIqBYxA==
=/1Dq
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--

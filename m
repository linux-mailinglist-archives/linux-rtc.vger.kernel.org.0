Return-Path: <linux-rtc+bounces-930-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219F8924ED
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08040285A6B
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA6013B58C;
	Fri, 29 Mar 2024 20:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HE1VE+jY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB3513B2BF
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711742986; cv=none; b=FEm/JlzqcHsijlWN7KzHezkZ4Dib/KTGiMm3ZHP57EEadp+YgrCP9SuiE/YHb/rVsHgqbvUHD0YDB4TZxJtc5XAlhVOnHRWCRJLIaM0FaN3+JRtsSMjq6NkkmgD7frayUMwZZwBnyOF839Z3QyXU/vJtEr4YJb6LBZu7qmG67hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711742986; c=relaxed/simple;
	bh=fpfqkmGXB7n9+0LYANgR7EqyAASwdGxlh3klBzxc6kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaLSVgTTAVvgcYuygKW8uRQrbxhX8pEFJaPgH93cVZTfS7iCZZ+Iy1SU5s2no8DDoXaMna0BAnmxxJuUu6TRo5P3MDXy18j/aeoITcLeYPh/1w2Amjn6WvXnS0NokKPcd7ylGVkqVJbM/IyUtIgGPkO/u2R2oFj4GaasH7KE6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HE1VE+jY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e062f3a47bso165495ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711742983; x=1712347783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIFtqdGIQ7mImaUplvEPxDs4CukYRUaTqeFy43qXsgc=;
        b=HE1VE+jYR7wM1m8hyEUCGpbwh75QjBawfLlV4WNw2CIOb6JxRrkCwPRSwIfKwfNKcl
         jJBtmXl6K+1hnrAjPmCS2IxXhQdISDacZ+q3t0zL/YUZa7mEFEjoEl06eJkxlNYSo2Br
         SnjLwwZ/veohByUnDBHhd8yzfikFlgnCCKfln+GTzO88kakyX7LSMUgjvl4HvMr4ZClp
         SqHd89u001HTgq6xj6TVkefoZd/SFUKY+KjBdvGaLgeHEzjCWNdsz+9gL+o2a6tmlCwN
         tbzbL7Ap6lVVlkoCPNd6DEp57r501W0JGBGOopgfoQ6KrWVdG5tUxu0dyMiLEcMiVflT
         MFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742983; x=1712347783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIFtqdGIQ7mImaUplvEPxDs4CukYRUaTqeFy43qXsgc=;
        b=u6/w3skx2zkTAwGad+nkV+hrulkoj7PwDTU+ewnAa7hG3JUdjPmOW1I8Z65NRuMhH/
         24QxDkW908hXOYNppSW1xw91qFcf2tLvsHa9LxAIuNLuAxf4WXVyIjSnP7qUwg8kfxu8
         dWAggz+2Z2w/dFAulGTTfEVi+iQC6Y2h2fx9VpZDh1i3WuwhaGbSE8lv+5haAfaPwHWS
         p9KAys7Df0sCr321wibdZFlzOSCWMG9X/YOpA/+Qh8xoAQqAouxWJ2DN5AlT0Iy3/2es
         DzSsQuZkZPwvmnMG1z1cd+QohcgUFxAaKlLOQ+/oI1FtFrtmHPWH44VCcdyW20V5go2d
         cidA==
X-Forwarded-Encrypted: i=1; AJvYcCWCWQEIUZ1AYoshb6Oy345F1VCd3/Pqec9i+aKO3PTA1O2KIkChFGNZmXNFYgQ+Jg2dYvg2b0ERFH/W/M3N4w5gCALnLPQtfrwL
X-Gm-Message-State: AOJu0YyOswpDF4g+hgDfLzz/eL8rEWeeqYrve2bZzApaHjd39qN/Q4zL
	tf8S4kip0nMKqda2Z3oNpqKrM/2jxD6BqU57/hJHZJWW6BQ6mWG04RBvpckvTA==
X-Google-Smtp-Source: AGHT+IGfmsTFT7kIOrTPD/cQ/cey/6SebJ3AuBTnCao11U+z4lOnEeS8bwMb8RWIpAD6J9ZdI7fzCA==
X-Received: by 2002:a17:902:f602:b0:1e0:a7c2:af91 with SMTP id n2-20020a170902f60200b001e0a7c2af91mr228153plg.3.1711742983257;
        Fri, 29 Mar 2024 13:09:43 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id 8-20020a630f48000000b005f0793db2ebsm3301512pgp.74.2024.03.29.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:09:42 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:09:38 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 05/18] power: supply: cros_usbpd: provide ID table for
 avoiding fallback match
Message-ID: <ZgcgAhgjTck9zUn1@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dI4MRy0aqIMAhdXR"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-6-tzungbi@kernel.org>


--dI4MRy0aqIMAhdXR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:17PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/power/supply/cros_usbpd-charger.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/su=
pply/cros_usbpd-charger.c
> index b6c96376776a..8008e31c0c09 100644
> --- a/drivers/power/supply/cros_usbpd-charger.c
> +++ b/drivers/power/supply/cros_usbpd-charger.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2014 - 2018 Google, Inc
>   */
> =20
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -711,16 +712,22 @@ static int cros_usbpd_charger_resume(struct device =
*dev)
>  static SIMPLE_DEV_PM_OPS(cros_usbpd_charger_pm_ops, NULL,
>  			 cros_usbpd_charger_resume);
> =20
> +static const struct platform_device_id cros_usbpd_charger_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_usbpd_charger_id);
> +
>  static struct platform_driver cros_usbpd_charger_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D &cros_usbpd_charger_pm_ops,
>  	},
> -	.probe =3D cros_usbpd_charger_probe
> +	.probe =3D cros_usbpd_charger_probe,
> +	.id_table =3D cros_usbpd_charger_id,
>  };
> =20
>  module_platform_driver(cros_usbpd_charger_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("ChromeOS EC USBPD charger");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--dI4MRy0aqIMAhdXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcgAgAKCRBzbaomhzOw
wmt2AP40vMxxAa4zwtZtVrWREJj+MwGszhlzYJPj6BOkLfqX7gD+ORpSENh+ezPN
zlFJlx7H92rph0+UbSNn7CN7k2laIAA=
=eMqN
-----END PGP SIGNATURE-----

--dI4MRy0aqIMAhdXR--


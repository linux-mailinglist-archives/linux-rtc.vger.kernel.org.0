Return-Path: <linux-rtc+bounces-933-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DE892501
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB13E284FFE
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFBE13B59E;
	Fri, 29 Mar 2024 20:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hhd4A689"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17713AA3C
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743220; cv=none; b=s8QQi43kq2xt/8/umhwHVm68tMoUtzpiutHFEnQp09MmmGu0mTrxKI9zK2cOw9PewSJRdePexEe/hh0jbVmbQDKi88X+WGtvLTM4CVKfD8rPRDbQhfIoh2ODk3eWrg1G5ksw7Cr+27QfDkeyWYl+z6C1Ya1Kan9MOvCxHg0ci4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743220; c=relaxed/simple;
	bh=1CIhbiDhLdPetfy8JNPZBtZ4Bo5ffBYFYyqo2HebwIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE2RqEHVDd6cWppAhWtL1h5Cysq+WdhbO8mcyLGQaCnlBRKEESzykgkRB0JpPunVVUkApx2ONq7qRdmtShoQJVxg8R8Yi/lCxA7nflu5vPCS7xqbTdq4xnnEA58S7lYP+4hfxCCs9jd/01Y8sCbiywReE4ACgBOkEhpGUJvofHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hhd4A689; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dee917abd5so136695ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743218; x=1712348018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qWs7zN/LFor0Uf4kjH3ZAhI6dar6SefwVzRPkQY1ryU=;
        b=Hhd4A6893PolLhfHSXHGuPSDLWapdpaib9Xen3qXWljxUpIkzKE/FsituyJklOcWFo
         YQ2WaVwZPRiGq8MbpvsvYf2iz+EGjaSel1R7Jo57TUsiurUyo3hvwdjO+V/sAojyaF40
         bjqrJWhP/VvfgjLJVBSd3HKFjgk0qWuyFl6ejDcip/TZYzPkqW+JfW6uACrLU67uWxB5
         XNcu7VhFWuHbv+vVan3WhwoPXBosg6noLBa3d0WxcKyBuLlBo5zhXeYl6nBAKco5BC3v
         mCV54feMzy1anDoIyMMBHKdRL+I6gdh8CBa4Igh1myhm6ZnUCdzpiKoRwo3z63Bw5cFn
         I1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743218; x=1712348018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWs7zN/LFor0Uf4kjH3ZAhI6dar6SefwVzRPkQY1ryU=;
        b=ZCX6JKMzNsjaKFQYrBbpNQ+H3GSUVSvQ09GwQ3d4/8vLK5VhKV2L/Km/S9uR1EzeAL
         4z7syNUW+F99bs/s++BiAM/ass6LTSdd2uTYGNHR5J4Qu/o6QpS1CxOAkTbmOsaZBOk5
         L8peC3ntlPLZZ1ek4PCvapYouXXNqNPcwdjvxWvFq5bZmsHCheDFVZMNLJl0ptAqq1Bp
         fKxfhcWuWkMjJJu+9ZbHADKucwcsqLi1PCcWWNUDZgc2N/OM4irQict8BfdQOmQWB4i9
         NmG4mjTUW+zwT2XCPLJN4psGB/3Pa+zb4kLLRZRcT33deM6Qwox/cG742Yp9aBtva8wd
         rMog==
X-Forwarded-Encrypted: i=1; AJvYcCVSUx7FftN2GgBIekloOiSClL5tHjO8DMbVUo0wFxQ5/2hENUKWw0FNwFyu06jnQv86ujHGtIYVfEfrv6hKfLO6EZ7AVunUDgkw
X-Gm-Message-State: AOJu0YxX3j7dcBZGYBm4dmtRV/Darnk8adXnt6l2XP/0hG4GziOWQ466
	h4AasONzOrMDC+y9bJf4dfFhQxsqfn3POy2D/wIbQVCSrrncPNH8TTpmVCq8rg==
X-Google-Smtp-Source: AGHT+IHsexnfMRJbpIHl9fmuE3u0hPgMNGbbB4LfvtV65/D832Ij+scd+b8wqjyQ7qu7XIMJR5vcbA==
X-Received: by 2002:a17:903:124c:b0:1e0:984b:6215 with SMTP id u12-20020a170903124c00b001e0984b6215mr270043plh.16.1711743218318;
        Fri, 29 Mar 2024 13:13:38 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id c21-20020aa78c15000000b006ea8c030c1esm3371937pfd.211.2024.03.29.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:13:37 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:13:33 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 08/18] platform/chrome: cros_ec_chardev: provide ID table
 for avoiding fallback match
Message-ID: <Zgcg7bAnp-tM_-oz@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-9-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wFqlCGmJIgYSWWvX"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-9-tzungbi@kernel.org>


--wFqlCGmJIgYSWWvX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:20PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_chardev.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform=
/chrome/cros_ec_chardev.c
> index 81950bb2c6da..7f034ead7ae4 100644
> --- a/drivers/platform/chrome/cros_ec_chardev.c
> +++ b/drivers/platform/chrome/cros_ec_chardev.c
> @@ -14,6 +14,7 @@
>  #include <linux/device.h>
>  #include <linux/fs.h>
>  #include <linux/miscdevice.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/platform_data/cros_ec_chardev.h>
> @@ -403,17 +404,23 @@ static void cros_ec_chardev_remove(struct platform_=
device *pdev)
>  	misc_deregister(&data->misc);
>  }
> =20
> +static const struct platform_device_id cros_ec_chardev_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_chardev_id);
> +
>  static struct platform_driver cros_ec_chardev_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_ec_chardev_probe,
>  	.remove_new =3D cros_ec_chardev_remove,
> +	.id_table =3D cros_ec_chardev_id,
>  };
> =20
>  module_platform_driver(cros_ec_chardev_driver);
> =20
> -MODULE_ALIAS("platform:" DRV_NAME);
>  MODULE_AUTHOR("Enric Balletbo i Serra <enric.balletbo@collabora.com>");
>  MODULE_DESCRIPTION("ChromeOS EC Miscellaneous Character Driver");
>  MODULE_LICENSE("GPL");
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--wFqlCGmJIgYSWWvX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcg7QAKCRBzbaomhzOw
wvrTAP9XyHBI49KZpUJOqS3U6D/DlyctZOrtzWcMGwpPYLOnSwEAn6YA3cLIsuZd
54v611hE+7u8dPasuYmhfLU8nNUfqwc=
=mzdp
-----END PGP SIGNATURE-----

--wFqlCGmJIgYSWWvX--


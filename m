Return-Path: <linux-rtc+bounces-938-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603D89251F
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E8831C21D92
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58D713BC03;
	Fri, 29 Mar 2024 20:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jrHPWXk4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0736A1311BD
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743557; cv=none; b=nb+m7zhgMOCbHuiCNxaVfQ4JsmtUBZY4dw/7fQjFJaclyREFh0yYhYh1XDnukrLZifpneiPPhnNSqQ9iOO1gQhIPA3uCkHECE5LbKkp6qje8xa8HauvgsIcduAbFFEkcZR+wl28pOUNFy790NXbWVBblJSr2x2V42XdP+e9Q47o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743557; c=relaxed/simple;
	bh=rlVT+A7P0+M7DQSgYFKJUFHaX4Xww7TPrMUaIZ3nnas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neTcqXYnYBWHWDJGzw9RByMlLcEINbTgROl0d/YR5KFOmToi+LGTCLd4R3seeVC3Ke3Q1ksAUoRqHi3N1qQnXgSQDxo9iWnhXZMmAsWx7eZJ0T28Q/LWNR3slDKAOBLHFUtIWpAGbkjoljAn1IfMvxTUXTXy9+Zd6/aQvn4PlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jrHPWXk4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e21ddc1911so206215ad.0
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743555; x=1712348355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xc1B/KzNb5fuAu79OocVzaBbGY8Smo5+Ca0wgrVA1PI=;
        b=jrHPWXk4L2tLi0rfc2RHnsAXGXSyDS3a/LRVn1wX6Ywwk2fut3UoxnyFjHTQTvX85m
         zfVEYYTuUi1PPi+uoO24hAYI1bYmHoKpjB2tiA/QX+NAbTfMhG96748NPcbLWwokRz0Q
         0VARF+6q+tXy1AeLtMo9im2m2lpxq4tImx0bGPU74FcSxmFeoAUBQyzafadrWpOgtvEp
         eL8J1dIl3wLK0gtpqNkbk/YZBROAw151hYFNF/8YTIaSxXw3EqKf8WSpkcfXLLFDjb/9
         BTrNp4g8FujD9Om6kgQ16ee6gBozb/djlEit87ebi53yyKTNJ5CR4iTynnqRAiRQulCP
         ZcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743555; x=1712348355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc1B/KzNb5fuAu79OocVzaBbGY8Smo5+Ca0wgrVA1PI=;
        b=UTglJMzSS9OZAidAvBpF4sDVWEcdm9t3bQCUcGEkudQWzCh8Hk3ma5DtWbgu0pmTtd
         svJZDGsHetHwu7VUD+0pikhjkJcZOTVl5Io/QlUn9rLotwnHv2FEmXIxD/C5ONpl+hrF
         9AN6XdrX6AbjYgjQgpwEkWAcXHGqknmyCO2gyBrf5Rt+XwGZdPxBJ01blFOGHJ3T7CsD
         sZhX/dUvB2z1TbcGzM+MMKVcrDBy06gybDCOWs+hkd/Cy62pQ9ys6nVj4KiJMRt5fcIu
         pDW3Q0pCKe8MpwwH9lFEwRDhhgSHn7YuCvT1MKOKcISSIBWi81ANHfAlNUKRe8yr/yQo
         wSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOFMKV2F1bZ6ugoLI7WC2BQZ6Oq6K0xItsR57Qyx04B1k4wz2oTdqlsawMbi/rZRCSaojUl/ou4CTbjPxWum+5a0QTkxNp7uU6
X-Gm-Message-State: AOJu0YxO9cWdgoGXiLn1VlTF/i0OlqouubDzNIZLTsibHT/DmVN5QUX2
	mPnY5GI4QcXopmecouFZeNymvtqcVeG8yMmvGKGsz5GIu08HuNq8ypcWjWIhNw==
X-Google-Smtp-Source: AGHT+IGPHfOm4VyHRdbt+OF49JdkIGYmbMfYA6a7eigDoydW913jtuONF1p9hINFOSPxQt7YYfJW2g==
X-Received: by 2002:a17:902:da89:b0:1e0:a8b8:abbd with SMTP id j9-20020a170902da8900b001e0a8b8abbdmr272383plx.28.1711743555062;
        Fri, 29 Mar 2024 13:19:15 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id sb8-20020a17090b50c800b002a1f5b8e787sm3726pjb.14.2024.03.29.13.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:19:14 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:19:10 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 13/18] platform/chrome: cros_ec_vbc: provide ID table for
 avoiding fallback match
Message-ID: <ZgciPjZH4JP1nD_R@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-14-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LnnzVqJRKlkZ2tEc"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-14-tzungbi@kernel.org>


--LnnzVqJRKlkZ2tEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:25PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_vbc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chr=
ome/cros_ec_vbc.c
> index 274ea0c64b33..787a19db4911 100644
> --- a/drivers/platform/chrome/cros_ec_vbc.c
> +++ b/drivers/platform/chrome/cros_ec_vbc.c
> @@ -6,6 +6,7 @@
> =20
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -133,16 +134,22 @@ static void cros_ec_vbc_remove(struct platform_devi=
ce *pd)
>  			   &cros_ec_vbc_attr_group);
>  }
> =20
> +static const struct platform_device_id cros_ec_vbc_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_vbc_id);
> +
>  static struct platform_driver cros_ec_vbc_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_ec_vbc_probe,
>  	.remove_new =3D cros_ec_vbc_remove,
> +	.id_table =3D cros_ec_vbc_id,
>  };
> =20
>  module_platform_driver(cros_ec_vbc_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Expose the vboot context nvram to userspace");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--LnnzVqJRKlkZ2tEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgciPgAKCRBzbaomhzOw
wm9pAP971js6nk1ojT1TFykJTGPn9mT3ynf2ygoMhjcr/EzN+QD+MNHAfGc/6M3n
6a8WNJXTO+xfhNM17z3PnpAKZ8MXrQE=
=sfxZ
-----END PGP SIGNATURE-----

--LnnzVqJRKlkZ2tEc--


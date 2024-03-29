Return-Path: <linux-rtc+bounces-941-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F62892530
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 414EC287F02
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E7513B58D;
	Fri, 29 Mar 2024 20:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vhe6bEZo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A613B7B2
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743719; cv=none; b=ejkNkp/gfFZjZulmP0EBJo1gRqdG8b1SEy7WuzgGZfVL4ReJn+OaipvVmbwNnXBtW5i2qhA/TYu0LkuyN2GUZQecPuHp/KWTExC+jADV6ZNXhxJTScZA8Zkn3EJq24wmO9+qP8pIrR2SBL3dm6uOCf69MlNg0ckLhUrS1PEJ0aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743719; c=relaxed/simple;
	bh=UNaKjzakgC3/YqdJUQaCrQMV5+3RTvaedPtnhZgej14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpazxx7ZBraRPoeqZLlEoOMyWmDUXXn+OGxzk3o/Oa4GHj7zIh+9hrYEPadhlnr79DQ/I4soa0jcaRACc4EvuEYISg7afE2JE8WHJXloLqnL4n0hiXO/gM7DVdUrgOzG2i8qAv/zzb3ST0ZEXhfzhRxzeELlny+ImoVW2hUEMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vhe6bEZo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e062f3a47bso167475ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743717; x=1712348517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLn+lLgkDX5fY2sRI7cVb/miAMO8Hgz/20wFvN6AVl8=;
        b=Vhe6bEZoV/RosRV5rhzxto9uuLel8vKVrghUDj4qiV+goUnEGlIfrmP5pM14DwZbJz
         1EafcBt5QmFNJfbxDIZzFLg+dIsMjrTcjTNN9ZTqK2PpuLJEsmnAbKxIXSn3TvlMd3iV
         AJGQ6qYSgRkn86BSo7A2D3kFcWYmvUWCbLzjzO4jIUhOC6Idmlu0EVbHD7jsqirTsIRr
         8lcbRM+gCEKoqNCJsbAzqO8msAo6G2Gx8Uv4cC8C2lec9p7786Y8WQFcZaunR7pY3OyQ
         7RzAw9UEvyqxRMpzdkkOJZNKMUtF+y59bZpyMN7LaIjaOFlOm7wSk8HqFeJvcj5Qw/mK
         OnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743717; x=1712348517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLn+lLgkDX5fY2sRI7cVb/miAMO8Hgz/20wFvN6AVl8=;
        b=b5rVbf1gj40EbHYuluhLT18X4xx8fU11bsoUmX08yvdAc0ZjVvLgIu3vk3y8CUSgRK
         /dBrhK1fs9eHx9BsRnOkt7u1a2v2aFk0aXh7F6QfDWgkZZpxkqPc1uDmkGYNJLsUnwoC
         B6jUBqMpVyZufAEdynFu0D200aA5fjJP9rvPDBdGmX6IhLc6oDla3UAX9DJttV16T3xu
         G9YxCi1+kJA3tlC3ke8TONaLYf2KlcwJ0doI93/ir1faeSNPHnHseiP618MOhqDXoqcc
         X0ymSaHP95VegNGL/gCdHXOCj4NYfXVo+VP7/nBE8FU2j2sIkkv0x5y/5B0TmRgUzHut
         vfsg==
X-Forwarded-Encrypted: i=1; AJvYcCVgDAKhXRhPANHHJMh3NVUW+y8O4rRrDrvJLv83Ed/VptO2nagniiZqgdmURUkcX21+KBrN0/e2wRg3pXmxoi8M5G2JjJBZt5JL
X-Gm-Message-State: AOJu0YxWbUyidGHrPT/7x4IJVjtKXl1lhvoiKG5uvpan+QFbE5jmiTii
	cG4TCl/gfD1okjRVJ2B/TSsRlF9I3DC8QgX0Rp6YKkqk7A2p2r4JoDliySnXJg==
X-Google-Smtp-Source: AGHT+IEMJwj2jd4/l859KGpWpENBcoKXmdmgnTzTcBXMh2Vl4SpUYa4OQU9H7SXbsGL7YqZVJFFicA==
X-Received: by 2002:a17:902:cec6:b0:1e0:f525:a831 with SMTP id d6-20020a170902cec600b001e0f525a831mr275700plg.28.1711743717066;
        Fri, 29 Mar 2024 13:21:57 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id bw28-20020a056a02049c00b005dcaa45d87esm2911148pgb.42.2024.03.29.13.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:21:56 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:21:52 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 16/18] platform/chrome: wilco_ec: debugfs: provide ID
 table for avoiding fallback match
Message-ID: <Zgci4OqaNBLBl2yF@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-17-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lXtHlkwSH46+O9d2"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-17-tzungbi@kernel.org>


--lXtHlkwSH46+O9d2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:28PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/wilco_ec/debugfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/debugfs.c b/drivers/platfor=
m/chrome/wilco_ec/debugfs.c
> index 93c11f81ca45..983f2fa44ba5 100644
> --- a/drivers/platform/chrome/wilco_ec/debugfs.c
> +++ b/drivers/platform/chrome/wilco_ec/debugfs.c
> @@ -10,6 +10,7 @@
>  #include <linux/ctype.h>
>  #include <linux/debugfs.h>
>  #include <linux/fs.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/wilco-ec.h>
>  #include <linux/platform_device.h>
> @@ -265,17 +266,23 @@ static void wilco_ec_debugfs_remove(struct platform=
_device *pdev)
>  	debugfs_remove_recursive(debug_info->dir);
>  }
> =20
> +static const struct platform_device_id wilco_ec_debugfs_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, wilco_ec_debugfs_id);
> +
>  static struct platform_driver wilco_ec_debugfs_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D wilco_ec_debugfs_probe,
>  	.remove_new =3D wilco_ec_debugfs_remove,
> +	.id_table =3D wilco_ec_debugfs_id,
>  };
> =20
>  module_platform_driver(wilco_ec_debugfs_driver);
> =20
> -MODULE_ALIAS("platform:" DRV_NAME);
>  MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Wilco EC debugfs driver");
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--lXtHlkwSH46+O9d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgci4AAKCRBzbaomhzOw
wia/AP41p7WV0zGE8a4VlHRNVebcAVah1YwJhtCsuzSE1aniUwEA0q9rvwuwO+b9
QHhNI8FMZWtiwak8zvmc3GzQq3ODqgk=
=NyE4
-----END PGP SIGNATURE-----

--lXtHlkwSH46+O9d2--


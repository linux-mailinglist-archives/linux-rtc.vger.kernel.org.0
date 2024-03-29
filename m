Return-Path: <linux-rtc+bounces-928-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A488924E0
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295561F2355E
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF4C13B58C;
	Fri, 29 Mar 2024 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QK1mp5/C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0657F13792C
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711742827; cv=none; b=AkIxlvLYfogQT4/USmcRkq4oCDIqUpmfhwMwx5NytRVdeKN1EQX0nE42dgqHYI35eK1fo9lX2tXtNAMOG00UcNDPwFM8yd1KeAQHbuUW3C3IS4fjOQ5lx5GX2VlXnokw6UbCI3A+JjPd8u8l4mYtJ5az9jif4EKZp/yy/tWf4hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711742827; c=relaxed/simple;
	bh=r+skzr39WHsIjKxfCdEB1wP9cYEVHafh3tgtF3jsYd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbl1cGNCnEUY7cLl6/yKfUvQFpO2UYnxBAHfK93APMz3K5Ta3DVtLb+Tye5iwdoLtYwF1TWORP5eVDtg3NjSwmf5fu6gWeVh1Hvrc3EOLG5g9oXRQdE3b7SsJ6kAmyNc8VnzVzp+M/ISb+4JFwBkO/N72VpDFfLT2AjFlmgHRPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QK1mp5/C; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1deddb82b43so169855ad.0
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711742825; x=1712347625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yDr8xhMZUheX/5ZecGm1BMQwFFY+3gvYNbb5gMLJkNo=;
        b=QK1mp5/CtRSdXooM5aAV2mrYNcxaWW0nZZv2VAbvAzWaTqhIAvu/iLbCuKUsbBKL6F
         hUPSgef9B6dT+qMChRZrhrzhn4cEcyOZTSk+8VHHw/TG5xoeNR1+89cr0FQ65+D9ZvKf
         ZpYMlFMdTNy2ijWdlyRzM9DR3topdeRL2MbRutF6TLUmRG1Gt/tCEl1FOHa8WCBER4rt
         HLjxov/REWy/HLq6/kTWlXz5K7oPnLIHlr/eHM7qOVzP6tzCqjrZHNr2mm1S+OO4alWC
         +sBTv00dFjN4Q9uVEVsD++LSyyNIjoWgl/UvYg3QU/Oe1+NUZg3x702WOl9m1or8wenR
         Ecuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742825; x=1712347625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDr8xhMZUheX/5ZecGm1BMQwFFY+3gvYNbb5gMLJkNo=;
        b=fNxPCO4Y68sUKiLGzWQPHTEXC2VrIbKPeuTRb/s1An5vpQ7S9IIb9QiLsT9aWYrLey
         0nWxiR5cvzKjfmMrL3bPdUWLSiMx6Pc9CkvA0qsHMAj/b5AO2WIAYBYHwTT8wCdt4ywK
         cF42VL49R8jn2CmGIcrfUzJhyVJWq2qg8irscMwAd7oZ+HcjXHHiZ9Do0JKVM6nL1zan
         +lykCBnFJdYN3TBfTNuaUIDFRjuTif77MBrl+SwXmaDO3xcZ1UqVOD6y92aLEiUv6pIQ
         44IsKolqWfB7UD9ofZ+gaNUtJ0goY6xMr4ANBtva7cfIdZVFF1CqUD2/RCedVBE9z3AP
         SSgw==
X-Forwarded-Encrypted: i=1; AJvYcCUE3eBipc6wz7hUUByugM2aGK6DudBsmx/parQvU1Axmq/JQXt9LrkdwMFS6+d9EU3HiEtPlS09ZdeZsPpJ94Yc6U/Crzq4bL+r
X-Gm-Message-State: AOJu0Yy0iRRqSHoYT3eok763sCbefDzXhNGYHZQbdClMyLk7WzEls/th
	NQOGxdFIkgrg1rkuy45F8S6Fo23nS7FW2Mk0UbMHctk2C6gpM9HncC4rIhYSVw==
X-Google-Smtp-Source: AGHT+IGMLxqzzhs4v9bSN/YjCcCDoK6g4QOUmlamOwMJWvwcjj5C6K6sQu5s1XxRg26cbCTWTPr0Ew==
X-Received: by 2002:a17:903:2a8d:b0:1e2:3991:9e9 with SMTP id lv13-20020a1709032a8d00b001e2399109e9mr127629plb.0.1711742824876;
        Fri, 29 Mar 2024 13:07:04 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id k92-20020a17090a3ee500b0029b32b85d3dsm5950236pjc.29.2024.03.29.13.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:07:03 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:07:00 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 03/18] rtc: cros-ec: provide ID table for avoiding
 fallback match
Message-ID: <ZgcfZDZQzLppMLqw@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-4-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XjzV9UcZACHbcmst"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-4-tzungbi@kernel.org>


--XjzV9UcZACHbcmst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:15PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/rtc/rtc-cros-ec.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
> index 0cd397c04ff0..f57462c7b2c6 100644
> --- a/drivers/rtc/rtc-cros-ec.c
> +++ b/drivers/rtc/rtc-cros-ec.c
> @@ -5,6 +5,7 @@
>  // Author: Stephen Barber <smbarber@chromium.org>
> =20
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -392,6 +393,12 @@ static void cros_ec_rtc_remove(struct platform_devic=
e *pdev)
>  		dev_err(dev, "failed to unregister notifier\n");
>  }
> =20
> +static const struct platform_device_id cros_ec_rtc_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_rtc_id);
> +
>  static struct platform_driver cros_ec_rtc_driver =3D {
>  	.probe =3D cros_ec_rtc_probe,
>  	.remove_new =3D cros_ec_rtc_remove,
> @@ -399,6 +406,7 @@ static struct platform_driver cros_ec_rtc_driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D &cros_ec_rtc_pm_ops,
>  	},
> +	.id_table =3D cros_ec_rtc_id,
>  };
> =20
>  module_platform_driver(cros_ec_rtc_driver);
> @@ -406,4 +414,3 @@ module_platform_driver(cros_ec_rtc_driver);
>  MODULE_DESCRIPTION("RTC driver for Chrome OS ECs");
>  MODULE_AUTHOR("Stephen Barber <smbarber@chromium.org>");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--XjzV9UcZACHbcmst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcfYwAKCRBzbaomhzOw
wkkJAP9uw5For6wPwr4GzdwUm99XHEIiu6p+9R90edx5+wBIGAEAybvPs21S+b1Q
hvvSe/ggXrdw3GKXX7kJCrnS+V13Qgw=
=SMyH
-----END PGP SIGNATURE-----

--XjzV9UcZACHbcmst--


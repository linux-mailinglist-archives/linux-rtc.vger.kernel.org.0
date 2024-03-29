Return-Path: <linux-rtc+bounces-931-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1103C8924F2
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAC47285D49
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD6113B596;
	Fri, 29 Mar 2024 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="whlEyCXW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECF338DD3
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743111; cv=none; b=pt5P33arnb35yy+c1nWuqCtY08IoeBSB08I6eC5HxArwVwdX+Y6qClsnG7o1J1DWZi7syAEd5+IuF3yjZtbuDjKTaztImA6TxG83SR7IetTkr7OaF998omZqgHBCiM/hkq9B4dFARksC3QIAcvOV7rFR/l59PGCwRh868yIxdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743111; c=relaxed/simple;
	bh=BIuag0g6C6Y3y8ZICTD7oRnrFkAWMfEOyFsH4BKw78I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbXOWa+Bt/thCqUbQu413C7xLfZMrXnOvO6QAu9gihlKmCk3pAabhXPlAYXX11tv3DHQg/3eC/goO9NYWrvMl6XqqWCj1zv3en1a52EEKoTVerIYv15uzy+BOQ45sq8RMeugHp8dFbzwcd5dgVPerxMXLFJD9Qh+aRLmDgf15TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=whlEyCXW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e062f3a47bso165845ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743110; x=1712347910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFzyg0npWqeBaTEsJ+0b6NEDJj79+MH/Mz+iGKuuB4g=;
        b=whlEyCXWZPzyxxrHdFjImZgsNXQ6Jp2KcdR0B6VIu/PLhBop/Qbfbxh9ZTnTXJRhpy
         SFiAZG+8sbyxMt/3KhluHhSfA3YphsdRQv8PEJ5QfBHfsPwBLEaEWUHA/nF0kJ2u7K4m
         cY5j1RQhLGpXac8EBFZgCFfuHA7Ls7cx5JeDCwmNHqsnuTOyHz5hbRSLnGS50Jc9BPmc
         ZYL+Eto9KtTvO+YzaPur1rHiWe5dQmcEOtG0Ed2TYi2QDYaY/yuzmbHkShuN/lqlI/Ac
         4Fpm2zG3arHVyCVTvjkrjfDjCJrlomm++xWkIkWEaNH0rwHkwRydEg1e3FoN8MFfXuSD
         JT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743110; x=1712347910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFzyg0npWqeBaTEsJ+0b6NEDJj79+MH/Mz+iGKuuB4g=;
        b=qvo41q2TX8x0b9or+OmnOtlwdj5KhFTelV3onWCBs451ny8F5PS54ktEI2y1kJHxYD
         2Z1F8H8mOHxusEFjTaOw568j8iUa1ZMsFIXVSLJRqVUK3PgsD3YCw1No7m2Pc6LViuGI
         lhmC/245FoOveWm0nSsL8ESeij7lqMs11BstY7eG+z5vyWNrjWi+onb0w5lkuZj8F6pA
         i40/iCbTFswxfxaX/6xG75QHO9uFv+tMV/dTPnUq7Ry/QLBLr2UQzQR6BKEcp7CRE/GV
         eGu9IjdBlx54te5sSigqPg0Tcwai1EHmt9h9F8XxcEnVOU7/oRgDT9VMVJTiAyICMG7f
         182A==
X-Forwarded-Encrypted: i=1; AJvYcCXvGuJO9KU+JS/NgbkKmuy7BCvgbCBDX1IgQc92N19qc3LvPd7kyaU9/zrVfUS4zpDPh4zyn2bJwiZjy7YHGJdzaYH5scYBDXdG
X-Gm-Message-State: AOJu0YxNL5275NvEBgGDeucTNajk1QGLh9QFdxAkyTZtGChR8H0Ugcyi
	3n+WMLg8tW045Iixd4y1J3DojspCxnPKaKjFK620qUlcAADqujF5WTRiUKwKsw==
X-Google-Smtp-Source: AGHT+IEL58LbYxlBBeN18c2RvVRQC+ZIyhfJ0rX5w8lvsXWRLgTuRmFh+TgKTeiotO7VuCrRGTZyVw==
X-Received: by 2002:a17:902:f689:b0:1de:fbe1:beb1 with SMTP id l9-20020a170902f68900b001defbe1beb1mr225765plg.7.1711743109564;
        Fri, 29 Mar 2024 13:11:49 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id e25-20020aa78c59000000b006e6529c7d75sm3376947pfd.3.2024.03.29.13.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:11:48 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:11:44 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 06/18] platform/chrome: cros_usbpd_logger: provide ID
 table for avoiding fallback match
Message-ID: <ZgcggNwgH25rWqnw@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-7-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOhqASqjoSJjHZPV"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-7-tzungbi@kernel.org>


--hOhqASqjoSJjHZPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:18PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_usbpd_logger.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platfo=
rm/chrome/cros_usbpd_logger.c
> index f618757f8b32..930c2f47269f 100644
> --- a/drivers/platform/chrome/cros_usbpd_logger.c
> +++ b/drivers/platform/chrome/cros_usbpd_logger.c
> @@ -7,6 +7,7 @@
> =20
>  #include <linux/ktime.h>
>  #include <linux/math64.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -249,6 +250,12 @@ static int __maybe_unused cros_usbpd_logger_suspend(=
struct device *dev)
>  static SIMPLE_DEV_PM_OPS(cros_usbpd_logger_pm_ops, cros_usbpd_logger_sus=
pend,
>  			 cros_usbpd_logger_resume);
> =20
> +static const struct platform_device_id cros_usbpd_logger_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_usbpd_logger_id);
> +
>  static struct platform_driver cros_usbpd_logger_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -256,10 +263,10 @@ static struct platform_driver cros_usbpd_logger_dri=
ver =3D {
>  	},
>  	.probe =3D cros_usbpd_logger_probe,
>  	.remove_new =3D cros_usbpd_logger_remove,
> +	.id_table =3D cros_usbpd_logger_id,
>  };
> =20
>  module_platform_driver(cros_usbpd_logger_driver);
> =20
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Logging driver for ChromeOS EC USBPD Charger.");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--hOhqASqjoSJjHZPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcggAAKCRBzbaomhzOw
wp6CAQDZ4IPSXJWCQwtAiu25DxG5FmLKai6jWzCOofpAyGyOiQEAgs8jaeM8T1OV
pUoh3bLUDXyza8oOtFZY7Eis8bue9Ao=
=H648
-----END PGP SIGNATURE-----

--hOhqASqjoSJjHZPV--


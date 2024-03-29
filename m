Return-Path: <linux-rtc+bounces-940-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DE389252E
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA0A6B22AB6
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F88713BAD4;
	Fri, 29 Mar 2024 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EP+uBhZn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300F13B7A7
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743685; cv=none; b=nT25FWGlREWYQzW+4AumCYYtaXOnYWoxagiCR+G+0wh3KzKKzmJGkbc2Q1pfcT51+57zIehCg+qaqG19/uleo9dIRr0IO53DdeJ98G+upF3wiSuOfDAirlYQsYGhOyJhUGuMFAAyfjjWVvRpKPSADtlLol6RX/hZrRHOqZgRc9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743685; c=relaxed/simple;
	bh=np8jpCO9J19m7Baa5raXJCd5KOQkzMFX2UxqnbP49tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iL+7qh+XnRo5UzyLQuCm1Fn+0xIIIo8qArhxLLFzsiMWEtaPaWMTcGd+SombPtRt94mgL1a3SGcZu+gghdSY/5BFxapBnH+PEHWbKv7wH1e2ohB9QHPpyC+c06gzLhPo6RjzuVOZhSanIPPepUlZrQt+59kqFHDDaHTbYdYfVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EP+uBhZn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e062f3a47bso167385ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743682; x=1712348482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6sGxNDBcv8xLjinxmcTUAsTp0COn1T3Tyc3MSC2QOy0=;
        b=EP+uBhZnxbd8rl4xOA4FPn8GxuTU1LdY00m8KorsRJjAhQHfWMT5VSa0fVf2uhYKmC
         XV6A+hoomx+kYsjShGrV6QQaZVksEARby36TajJ26FgbqVd8CJgGZZJV5Eow6wa96Azt
         uWftMX98gxzsxGzMw2QW7rVi7oHbq9dKnSsn8TVqy0sgp4nNBI+7VRGv6VpMQ9fEe7d/
         0Wb2QuKqa7e1SVoCzrutldFLB6JLCHnHaPlpCRLuiarn+03PaQJTmULo4KS2JvuXSLV2
         DLy1DTXobhjVKtEkWWzxju4D7UUfXUWOT9gBgOOjL2q+Yvk/HNZuLKpRR9XzFnhsvtPE
         xMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743682; x=1712348482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sGxNDBcv8xLjinxmcTUAsTp0COn1T3Tyc3MSC2QOy0=;
        b=anyHZ+VrJu6r0KhXXk7pNtHG0J2UVI8xI5gStwPO7Im0XRCxEp8FkT4ivrHyQSyApv
         gy93N/TJsumJMLIG4rJs2+58usyK8YiNR3tItaRBn51/n5HkELPCHEOuoW55WX5W0e4Y
         Gcj8DWYn4IP1X/fpEYPiLKXyxx2FdFvgizsmIcfj1kITTQPat+0/rPPJMmDcVh2r8rNl
         IKBLWBy9eXSOYW0jOeCgi03h9kEJ2JbSQKo8lrSBzEJBZHo5W+uXHOPfZ6mHy+2j8u4p
         e0lQWRemswr/NDKe++lMTA81uEvIKV1XO3hR3tKbAYI9Zmn+McjOt4ct5pUZ3GF+QT11
         kxfg==
X-Forwarded-Encrypted: i=1; AJvYcCVzHK4RtsAw7GhFjO8G60nnwYT04/41y1HtLj8qHD8ziSjbUphJJRQ+Gq1xnvdSfXru61oq745sBYQJbvFMeR3WTSb3yEGsXnxu
X-Gm-Message-State: AOJu0YzIHlMWavSwKBbLY8aGsWi2zoeTdFAZJEwc6qMpD5RfNity/509
	8OyWCgEzf82tyJrD97NbiklA1fIzXj8BmURzXthF3jeCnTOu/DxQth4IBOZDiQ==
X-Google-Smtp-Source: AGHT+IEKHZqeyykFzk77dnoQcGOU2q5HQsYxQrTsAx/9tn6mZjea/AvJMONbvkBDGO9GQj8CvXvLvg==
X-Received: by 2002:a17:903:2a8d:b0:1e2:3991:9e9 with SMTP id lv13-20020a1709032a8d00b001e2399109e9mr130729plb.0.1711743682041;
        Fri, 29 Mar 2024 13:21:22 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001dc9422891esm3824560plg.30.2024.03.29.13.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:21:21 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:21:17 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 15/18] platform/chrome: wilco_ec: telemetry: provide ID
 table for avoiding fallback match
Message-ID: <ZgcivZdmsa7hvqcy@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-16-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lail5dS7ELi9Odvn"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-16-tzungbi@kernel.org>


--lail5dS7ELi9Odvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:27PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/wilco_ec/telemetry.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/telemetry.c b/drivers/platf=
orm/chrome/wilco_ec/telemetry.c
> index b7c616f3d179..21d4cbbb009a 100644
> --- a/drivers/platform/chrome/wilco_ec/telemetry.c
> +++ b/drivers/platform/chrome/wilco_ec/telemetry.c
> @@ -30,6 +30,7 @@
>  #include <linux/cdev.h>
>  #include <linux/device.h>
>  #include <linux/fs.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/wilco-ec.h>
>  #include <linux/platform_device.h>
> @@ -409,12 +410,19 @@ static void telem_device_remove(struct platform_dev=
ice *pdev)
>  	put_device(&dev_data->dev);
>  }
> =20
> +static const struct platform_device_id telem_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, telem_id);
> +
>  static struct platform_driver telem_driver =3D {
>  	.probe =3D telem_device_probe,
>  	.remove_new =3D telem_device_remove,
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
> +	.id_table =3D telem_id,
>  };
> =20
>  static int __init telem_module_init(void)
> @@ -466,4 +474,3 @@ module_exit(telem_module_exit);
>  MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
>  MODULE_DESCRIPTION("Wilco EC telemetry driver");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--lail5dS7ELi9Odvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcivQAKCRBzbaomhzOw
wtz7APwIVyFhxHO6JIUKJgZPe20/mrreiwH6op66UiDCInaamwD/TXxo/ywv8vtr
ZbjLUmIDp2xJa0Mkni5Fxmi2FW3qhQk=
=uIK1
-----END PGP SIGNATURE-----

--lail5dS7ELi9Odvn--


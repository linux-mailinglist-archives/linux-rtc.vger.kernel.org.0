Return-Path: <linux-rtc+bounces-937-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ECE892515
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53044B23C37
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FCF13BAE0;
	Fri, 29 Mar 2024 20:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xbi8JOh0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA6213B58D
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743491; cv=none; b=bxCUJpzismvld8Z4Jo7TsqUczI8j8RJNErjaynM9KQBftT6gnFDrGqtjKzKRAAwbu+lS3xr1Nm1SZZ4LUgD5+pgrDo33p2zhro/0YKdKOxnIsTkbejZwdIgxRLoNYNT38DAR6vNSBx4mP/2f3yeyus0xLn5KzEsrYHxVfVZnjFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743491; c=relaxed/simple;
	bh=3WbLA9Tayyx5l7XBtxYtcQu/1RXvOvT4WZKieEDaOzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9UK9UQq8w5o2w4aOMYoGeDBWQsQLjNrSt5GGBhUIJ+KdH/B2zmNzGaUWd+aGN+FQIkTzQm1qT/xCpNgFGgbwRpc5i38pXYYNH0ZMXnJZKA1b10wqpDzYmyXzKzxeR2agbiRBiWFGtlxeL6imq3dhYknzNFpKU4x2ERM1A50GxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xbi8JOh0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1deddb82b43so171115ad.0
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743488; x=1712348288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg6m+O36BVgBKp2BfarjLDVsnWA4tAwgiFOnj36SdA0=;
        b=xbi8JOh09rHHlGahJ/e60JADBuf+RF0OFSCKBCAW2vETGQTyOJurPHj0y7t5DqJB+B
         SGFeE/UqZwRaBmwboEYNL3Cw5qkdcixamYV9pQovsrhyN5keMa4A1Q6CZv5QwRtvmCbf
         tUX6u2xqntGjz0GLVtTj4e415cwEIdkTBjJyXy+YsUMnDpNj05XR6XyQx5Frs52kp+DY
         QccnX30O9BE49l/nxKV2IRj+QKl570/tz044+PfuMh7noEdc1QoMgOMGcAsU/f0bRK4p
         WZ7mlscd0/Do9xXqsHsgUkOLZtoqreXxLBLMBFEWZuAIQbh+wGcNTj/G75NNqqI6A6T5
         RTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743488; x=1712348288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg6m+O36BVgBKp2BfarjLDVsnWA4tAwgiFOnj36SdA0=;
        b=ZkWxw/TM2oErvMvbLn3jAmJJGy1EcKpz3J29OEcegdbK8Uv4MrTIfbANAslf1iApkC
         KmrjaqaIMiCBw/5j+reLKn+M0WKbT0a3PUmL3zSk5pgkWNsZHmpkJ8szS6A0k/+2suFf
         VGAsPpoRWwXlh9eTWjP+VSPUzz8EdKoicnRWFwezBMtqCVX1Sn1yiuwn98FGyMjSDZWa
         P2JpULqyh/ojiU7GV6AC9Nkl13ZsjnWD+9EJIwAgANU6wtiIElvqx2vEYgsTshN307sT
         6Q0JenEge/uRmVgAehR/riCKlfIntLy50QRsGkYSlSWPfh3uxv5o5qFoVRZq58Vhb6O/
         wqeg==
X-Forwarded-Encrypted: i=1; AJvYcCWXrpW9YrmIb4ilVU6KfmwOU3QR/n07t8s+1VyrG254yPEV/gDAmm+XdCOmVUJRxnMaIWIvTHeRYYgmfWcMR1rCFqAKq1zdBagJ
X-Gm-Message-State: AOJu0Yzx6JL4RDLIDl1o1WJahrlWoe4Ebzxrmdx+jIONz4aLBQAEWV2A
	RhBxr+/xm+mTZ5DU8YSzZ9918L/JmBYC8wx88VK08FsIomF2AP+1DiaWPvgFuA==
X-Google-Smtp-Source: AGHT+IEMrr6gtaQSq3svrIypR7Gvc5mKqMuHZj3C6jkaJI+vd2LfrkRr6mbcX6hbmqCHo2nHi/KWcg==
X-Received: by 2002:a17:902:eccb:b0:1e0:a494:4bb7 with SMTP id a11-20020a170902eccb00b001e0a4944bb7mr286932plh.2.1711743488041;
        Fri, 29 Mar 2024 13:18:08 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902ec8300b001e035cecd27sm3828903plg.129.2024.03.29.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:18:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:18:03 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 12/18] platform/chrome: cros_ec_lightbar: provide ID
 table for avoiding fallback match
Message-ID: <Zgch-zclVLSqTFVZ@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-13-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jGJ4Z6TsBTQg0SOc"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-13-tzungbi@kernel.org>


--jGJ4Z6TsBTQg0SOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:24PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_lightbar.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platfor=
m/chrome/cros_ec_lightbar.c
> index 6677cc6c4984..1e69f61115a4 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -9,6 +9,7 @@
>  #include <linux/fs.h>
>  #include <linux/kobject.h>
>  #include <linux/kstrtox.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -594,6 +595,12 @@ static int __maybe_unused cros_ec_lightbar_suspend(s=
truct device *dev)
>  static SIMPLE_DEV_PM_OPS(cros_ec_lightbar_pm_ops,
>  			 cros_ec_lightbar_suspend, cros_ec_lightbar_resume);
> =20
> +static const struct platform_device_id cros_ec_lightbar_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_lightbar_id);
> +
>  static struct platform_driver cros_ec_lightbar_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -602,10 +609,10 @@ static struct platform_driver cros_ec_lightbar_driv=
er =3D {
>  	},
>  	.probe =3D cros_ec_lightbar_probe,
>  	.remove_new =3D cros_ec_lightbar_remove,
> +	.id_table =3D cros_ec_lightbar_id,
>  };
> =20
>  module_platform_driver(cros_ec_lightbar_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Expose the Chromebook Pixel's lightbar to userspace"=
);
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--jGJ4Z6TsBTQg0SOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgch+wAKCRBzbaomhzOw
wuzjAQCy/MjVt+YNcK751CMXj2j/EU6HWv9x0qhgCLWvuXJxDQEA3SMl8hSQYrBf
8OGD/VWV78xkaXLmP8YciNQoF+pNowI=
=u+MD
-----END PGP SIGNATURE-----

--jGJ4Z6TsBTQg0SOc--


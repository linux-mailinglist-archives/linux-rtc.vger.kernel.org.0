Return-Path: <linux-rtc+bounces-934-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B519B892508
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C1531F23503
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F53313BAC4;
	Fri, 29 Mar 2024 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SrRowCAX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C3413B59A
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743285; cv=none; b=ETXxlodvoA8z7zhac7sy07rRf7se6kbPVJj6pGqzhdOjz5Q8GTSlJzMOxYw0O99qwenKFAIg7qOEBHNfJf9+zu5xhzOeAH8BoNQBOiPNYKmI3shdVO9ydnwJzGlO/nlARMYT3waAsdw3DLjDxfAuDTUdFTfpZtIU60Jp4V95ySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743285; c=relaxed/simple;
	bh=Ue67/aWZBFXHbks1VsfgKBe2xxXryMkq5NnPitT7UFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdMZoVfc0Hi1EswczK1taDPtlIBQvFF4U2HHkjIJ/nbc7IbHMEJ7lyrJDNl5RVhWGnEcsX6Wn5tnd8Fmetu63Zf35DdTG9IDRddl3pyv/LfXhOhE2aOAekqrtUOgqBSM1I3Xl1SWLUibDv3luJTjdAJVsXHbGQi7OzrfJcXXs00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SrRowCAX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e062f3a47bso166245ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743282; x=1712348082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KyKDOpyo0CvUhZvmqAETcwlXYmOLuTf1osPn+ePZivQ=;
        b=SrRowCAX7LLe6QpLPkoa+kW5eL46QpeX4S45NI4hjdGJhlhpM91I1mhdD7uTcPiNb7
         1QIRqRZBxVzKrL8cANbiWX8iWnaCIG6Dmbgs5TkLCeYqI4hiOOyyeDouj8S1b8tLSQJs
         yeXqNRozRSzqUlfRV1vDuBr4nA8575vMblzcnMkJJxbQ/HHDOlFCsyxHNTR3jAgVUHh6
         DMtP78qxXEUWN0HuNmuYPnuTOv5INl8ZCLYw5akCOtisH99SP700l6bpk8+1Q95xRCS1
         T5DKmD91cZrEHMEROf4sSNxLS4Spv2q/3cVky0Ibuv6GK0IkI6GSyDzxBBPZApnCB6IM
         SoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743282; x=1712348082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyKDOpyo0CvUhZvmqAETcwlXYmOLuTf1osPn+ePZivQ=;
        b=OwZxlCrweni8nPirjM22hkU6VAEyjlhhoULjQ2DLt7lK/APeBdwxyMopG7A2W4rteT
         GHWm5JnVlJ5ueVbidGTMg/BcWNQjF252sC7aUp5acX3j2HUJyF+iD8m26/LaQ0VuXf8d
         nqt/RYBhFs8aVOlmwj5+3WXnDd52lO6gseO5UXdBizxtfDA1Dhi8kYao6ZjtypF8kGDM
         RUzefDc6WwKYO1EseE3KS50rf3Ku1K5wrd2xmdUXjj57q98CFzgLUiPnvB+7lUqknfOq
         y3COJzfFE3Xt4ilt4c4Et+fqK5S1edtqKap/P4tkVNUbKMJNF8fTOg7jri8OIexH51Q8
         5qSw==
X-Forwarded-Encrypted: i=1; AJvYcCU8O2OuSk8cGTz5ChPoyhDs5FydGwA5hXq10GPhedDQeRDfJWthqZXllRLw5vYLJlnQWozNXysFJKE06SbaKlXHFyZRCy7X0KUV
X-Gm-Message-State: AOJu0YxkBtb8jaxcwu+9CG7lTSzrO0DfWzdfZN01Gybw1e4vMQImRW/b
	4h5vHiFlfuH8M7XB3l22I0Ep56XjhIIncEFUSEouVT9j9ZxcE/HA389Gm2XO/w==
X-Google-Smtp-Source: AGHT+IEs/KL53oMZZ4ceHxkkiQGhFUFfwtYFCC7gcQBKJHFph/5YpTLepHU6Fk1HitA6rVmfl4ITHA==
X-Received: by 2002:a17:902:f689:b0:1de:fbe1:beb1 with SMTP id l9-20020a170902f68900b001defbe1beb1mr226387plg.7.1711743281527;
        Fri, 29 Mar 2024 13:14:41 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902ecc800b001e0eaf9ac5dsm3831012plh.36.2024.03.29.13.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:14:40 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:14:37 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 09/18] platform/chrome: cros_ec_debugfs: provide ID table
 for avoiding fallback match
Message-ID: <ZgchLZc1jJnPiTLs@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-10-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7y0qWvUl4tzyws91"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-10-tzungbi@kernel.org>


--7y0qWvUl4tzyws91
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:21PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_debugfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform=
/chrome/cros_ec_debugfs.c
> index 6bf6f0e7b597..e1d313246beb 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -7,6 +7,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/fs.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -564,6 +565,12 @@ static int __maybe_unused cros_ec_debugfs_resume(str=
uct device *dev)
>  static SIMPLE_DEV_PM_OPS(cros_ec_debugfs_pm_ops,
>  			 cros_ec_debugfs_suspend, cros_ec_debugfs_resume);
> =20
> +static const struct platform_device_id cros_ec_debugfs_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_debugfs_id);
> +
>  static struct platform_driver cros_ec_debugfs_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -572,10 +579,10 @@ static struct platform_driver cros_ec_debugfs_drive=
r =3D {
>  	},
>  	.probe =3D cros_ec_debugfs_probe,
>  	.remove_new =3D cros_ec_debugfs_remove,
> +	.id_table =3D cros_ec_debugfs_id,
>  };
> =20
>  module_platform_driver(cros_ec_debugfs_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Debug logs for ChromeOS EC");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--7y0qWvUl4tzyws91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgchLAAKCRBzbaomhzOw
wtX6AP9vqoC57DVK+nXf0l+z9YktOJhv6yXw/fbq5tXbW6H4lQD+PtEfbvOmSXSb
J9Kw8aSpHvzFt8U3I38LIhsCTGn+KgY=
=FNvA
-----END PGP SIGNATURE-----

--7y0qWvUl4tzyws91--


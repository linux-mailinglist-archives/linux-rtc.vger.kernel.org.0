Return-Path: <linux-rtc+bounces-939-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB3892528
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 21:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B152287F4F
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 20:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941F913BC1C;
	Fri, 29 Mar 2024 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DgGEKciz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2AC13AA54
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743611; cv=none; b=FDZhNkU6Eta9ebnp75SIWzGXIo9foo03xxwPTNibREXteuMNXnzIVDYy8d9IZ2im8tI79hRwBlEC/BnJ8jtQCu+HaD6opvdGbESP41ZwYlk6myxmIUJJexZT/B3OvOJlEGtaroXtRbQsApANdy8o+N1rCO1lJcqR4Y3fsrUWT/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743611; c=relaxed/simple;
	bh=TMlSCVvARv+/QQk1peCI1QhFYmOokgWDjrBUu16e/Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMAps+S4WXxa9xMc/7WAmwr9/jvhXHv9q+FdREjUgxU/AsrjAoxm7Z/Vgvv+Wm7mdHxgNidAksNWq3xbss5GehxsDxCsNsuCzUfynmMxgveSyoMSr8KOaW22LT5sIuP/3TuIP93o4XGMbMz6MTrhVAYuTa+3YYYRdYt+Js0KBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DgGEKciz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dee917abd5so137515ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743609; x=1712348409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dw2UKEsmEQ1dbfFsl/Q4xKQKdTjVuPNAKBUI0kl2qao=;
        b=DgGEKciz02pIzRVVmz5P0GXaxklmbiQn6PYAsspCjzfFz2rexYJi8LiszV0WE+FjLK
         fmT2U0KA7bMeoz29VjNEv7NbapFN2HlsNYq3xlYGi3whPUP6ddDUjMp9GO3LB9oNR1RU
         OAiwN8mt2EhBNCd7gKkgZWzbWnoK8tF3sqW9GveHTbNR//As8MCevTqQ9Z9g2jnFfnOy
         mXTt5y9eBdZ62DXG+5ooI992OdxhMLn8aPu2D82z8n0ZRS1/jKpxkwqH4OfhYXHIglXT
         5TeG2lRRy9qPlqti2pwe0r4S+yF10ae474lIZ0BLSb63Rxy9xh23r4SNb05PzSYiztA+
         fzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743609; x=1712348409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dw2UKEsmEQ1dbfFsl/Q4xKQKdTjVuPNAKBUI0kl2qao=;
        b=IpqKsJSpYr1BjGsvDre5qnMYsuyDIP9EUGXUsoGDfTvp2yeMu17wyV7wHVUP1MkMii
         bzQihAP3WNo74GRhSNnxPMTKK8ci+zQE4cd/eXQ8g/DtyZNkgPkQgDToDpVx8jtpckHd
         bO2xK6qtsccp1MA939prseF0Te/1oo3a540DwF83bG3FtU5RvB3iM1HAa22qxp1Y4UUY
         JWiadFzZdEYF1vivN7y43+YeRkzwklqyZOjRixpEttWjgd9AQMpc/iLoTQYpwvmcrrCq
         dwGNmrsbcgGXx4KyCjY+K0gWY7/0QqyJWxTeSJBiioEAZTwJW5N4q2IQLXvBH5NoH8rc
         BI0g==
X-Forwarded-Encrypted: i=1; AJvYcCUxkl00+KLo1L9L9Yn7Ao5c/aNeBMVY9gsF/L4WdAA+96vMS1lNq9T14xQ91tsOF9WpStJuOQsDG3O6QtWpqaIDHpkxMbtGJtp6
X-Gm-Message-State: AOJu0YxEqfdLpP7fy0WsTwo1wZ8x8YWwovMzPZS4q8UKcuKcBLuSi76J
	km5YQcRuIorGt9xLbHwUt+66WZVOt3bakhFg9RtA0laozpomBo2iVCQt9+i74Q==
X-Google-Smtp-Source: AGHT+IEZytbvJa5yNZVS6rHrzZ0f3+OwdvhypA97X7iN+ES1iLWIZ7fwGbVEbMh3zlHPs2bYBDBciQ==
X-Received: by 2002:a17:902:ccd0:b0:1e2:4092:467c with SMTP id z16-20020a170902ccd000b001e24092467cmr72007ple.2.1711743608655;
        Fri, 29 Mar 2024 13:20:08 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id h11-20020a17090aa88b00b0029bacd0f271sm5499074pjq.31.2024.03.29.13.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:20:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:20:00 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 14/18] platform/chrome: cros_kbd_led_backlight: provide
 ID table for avoiding fallback match
Message-ID: <ZgcicEucsO_vcVqk@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-15-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EXWDu5FgItCHGBBn"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-15-tzungbi@kernel.org>


--EXWDu5FgItCHGBBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:26PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> Also shrink the name for fitting to [2].
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
> [2]: https://elixir.bootlin.com/linux/v6.8/source/include/linux/mod_devic=
etable.h#L608
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_kbd_led_backlight.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/p=
latform/chrome/cros_kbd_led_backlight.c
> index 793fd3f1015d..b83e4f328620 100644
> --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -9,6 +9,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -247,17 +248,23 @@ static const struct of_device_id keyboard_led_of_ma=
tch[] =3D {
>  MODULE_DEVICE_TABLE(of, keyboard_led_of_match);
>  #endif
> =20
> +static const struct platform_device_id keyboard_led_id[] =3D {
> +	{ "cros-keyboard-leds", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, keyboard_led_id);
> +
>  static struct platform_driver keyboard_led_driver =3D {
>  	.driver		=3D {
> -		.name	=3D "chromeos-keyboard-leds",
> +		.name	=3D "cros-keyboard-leds",
>  		.acpi_match_table =3D ACPI_PTR(keyboard_led_acpi_match),
>  		.of_match_table =3D of_match_ptr(keyboard_led_of_match),
>  	},
>  	.probe		=3D keyboard_led_probe,
> +	.id_table	=3D keyboard_led_id,
>  };
>  module_platform_driver(keyboard_led_driver);
> =20
>  MODULE_AUTHOR("Simon Que <sque@chromium.org>");
>  MODULE_DESCRIPTION("ChromeOS Keyboard backlight LED Driver");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:chromeos-keyboard-leds");
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--EXWDu5FgItCHGBBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcicAAKCRBzbaomhzOw
wq0OAP400FBKzZ1bg529Vae52rOmu0AJp1mCnVBHtVPTH8qVHwEA+RXCK2NfrrFX
QgDUxhT14YgEhhADRBiy0dbP4DnQAg8=
=Ey5M
-----END PGP SIGNATURE-----

--EXWDu5FgItCHGBBn--


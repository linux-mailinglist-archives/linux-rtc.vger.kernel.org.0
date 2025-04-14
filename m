Return-Path: <linux-rtc+bounces-3962-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7F1A88F21
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Apr 2025 00:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57677189B8CA
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 22:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D881F7075;
	Mon, 14 Apr 2025 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gdjcp/WI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A01C5496
	for <linux-rtc@vger.kernel.org>; Mon, 14 Apr 2025 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744669833; cv=none; b=ZVATzEb/NTSPcKm20JOgmyBSP/qZGJDKv6t+pggF/Wb1s89GRxbDzfM8jcJzlwej+wtJMKdO2sL7ZAyu5h4M/Y4JEateTZ9EXDwsF3CWWfrRmXi4ED3xf7VhF/jInMornGeteJT9N556JI/FeZaFOzKGos91szF8oMcHF2Izbes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744669833; c=relaxed/simple;
	bh=qQBx3gwR7BoGNGR16e3u+TKdmh6EonNUcNYeazUzxLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fShVu5D1uDbpY9e7FwnyV5Ez+bSJjxe+If0UXohZ7Gt/8BH9P2oNYyh9Z17yOm5tQBYPmxP44Pv0RAQ8pigcdV4gAIuks8mt739yrUFzr1PQ99+CXvu1jt6wgz2hHM39UvFx/CdGY7dtkFTH7B/31tRnISwufko4cy+dB7eRyUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gdjcp/WI; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so8363965a12.2
        for <linux-rtc@vger.kernel.org>; Mon, 14 Apr 2025 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744669827; x=1745274627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJUU5/KwFR6EBw6HmiWZSj5H1CAAPNYinIfo2az6p00=;
        b=gdjcp/WIV3gt+SboT9sxx8vm8OeWUKH211hGSr3SnDH+5634HqmHDUT4hlhTd8qH3r
         JwRUSbhY6q1isNOfIP7BxqvqEl9LzDCcR8qo3QZ+LCFqmAkAkpMwjsGbwjUNaVhiTDPL
         SZt8g9K0lXbcoVq7hokJCE11toyptL3t8bqaZjlMc9N97r+uQequ1EmQ9eVAQjI9oJrO
         nYPNHWkb3WR4EIVZIekc2xsPnbWtIOuHW+4aNemm4abwfUE4fYWtrBmv0oabLOOGFaF6
         R6lioOq4JHra8OShcXbldbeTl5jHPJWxWk9ePVk+xGxOxSbd25ltfF4zwb7G0ranjUw4
         X1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744669827; x=1745274627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJUU5/KwFR6EBw6HmiWZSj5H1CAAPNYinIfo2az6p00=;
        b=i0nWjBTjfAmXCajbyPLEuhUhe+Fq8/tQKRvju+H6zE1EZqC+cWGwEbqythqD4jekJU
         4jO55zy8EMbamwkzadGykr2cuzV0XeStlKQmqZSfc0P4lOngnI2CQ91upwkN8aYkyEVl
         OQ1GdqcQiIeVbDLfRAqd1WhqmAmmYCmgpxI/xcyqhELDWl1lGOyab0i17cDEP3ZyWLqU
         e0uGDHtQgAnl+bI2zKJ8d+K/1FJb4coVoJP9scGBYPW6aDsFSRbphKN5cDJbBrJ+XdVa
         1k6NYvKsuBGPFd+yNvmxyB1YyGpccQhDG92t7Y7LRV8PsegdITcagP+6eZKwf28o+9hB
         /F4A==
X-Forwarded-Encrypted: i=1; AJvYcCVqlY+Y+OJLlB8Ld9ihKUiBPwLpDX1morXt2rGZxlEo2sed6QokQUbB3eFJJiw4QLuQdMmyLXVOhWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7TgZKmWrDFoiIzPLqE+zL3lV9pDZolM5ySW5AuI2C0Kmf+H4p
	SAoOMFwYUg/tMkoYv+KN86trLe4UGB1WET+6aVkKaP+C2IJtofjSL9XtpRZGMUY=
X-Gm-Gg: ASbGnct35gBvoCADmbUDg9lEpNBuDBF938xMa0CjvnOON9trs8i4Dz0dvDu4UJ3C2r4
	u2xk4I7yqGxHIVxodUM26JZ4FGTlKQRvGSQHjVFpBXgR7p/MjO2OyLbGYKCuVlgMWYY0CVtyzp3
	Yq+FPr+5SRE1QqdJEnnfSBQyEUEUR/6INJ6r6J6vzaKhqjQkWvYjn+vJQ6J2uIxACLlmaIXlzHI
	P6bM1DllMClsQ2FFftS0hU0gfZ2QWcWKx2WYBbh7oDXEaSf1K4tTggQN2cOa+PNgbuAnbXj61LT
	5m9l23wwFNQ8MFvj0AEAOdK0ZPibSmG30ivugGHtXZ78+w==
X-Google-Smtp-Source: AGHT+IHZhK+qYZqSi1SpL+1u6PEyVqPY3kj7P/rJwDZYHQs5W9C/B5usPcBT3HSPzMoZrr6flIoa1w==
X-Received: by 2002:a05:6402:3214:b0:5f4:370d:96c4 with SMTP id 4fb4d7f45d1cf-5f4370d9b5amr5203042a12.0.1744669827520;
        Mon, 14 Apr 2025 15:30:27 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f36ee54d84sm5746425a12.8.2025.04.14.15.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 15:30:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 00:30:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
Message-ID: <erttkpna2hzg7zuddzlocaou2wqcwmgcxfhldwdt55yleie6dm@nfg374fv66fq>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsmmcnqrrufeyjni"
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>


--tsmmcnqrrufeyjni
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
MIME-Version: 1.0

Hello Alex,

On Fri, Apr 11, 2025 at 02:35:56PM +0200, Alexandre Mergnat wrote:
> The RTC subsystem was experiencing comparison issues between signed and
> unsigned time values. When comparing time64_t variables (signed) with
> potentially unsigned range values, incorrect results could occur leading
> to runtime errors.
>=20
> Adds explicit type casts to time64_t for critical RTC time comparisons
> in both class.c and interface.c files. The changes ensure proper
> handling of negative time values during range validation and offset
> calculations, particularly when dealing with timestamps before 1970.
>=20
> The previous implementation might incorrectly interpret negative values
> as extremely large positive values, causing unexpected behavior in the
> RTC hardware abstraction logic.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/class.c     | 6 +++---
>  drivers/rtc/interface.c | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index e31fa0ad127e9..1ee3f609f92ea 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	 * then we can not expand the RTC range by adding or subtracting one
>  	 * offset.
>  	 */
> -	if (rtc->range_min =3D=3D rtc->range_max)
> +	if (rtc->range_min =3D=3D (time64_t)rtc->range_max)
>  		return;

For which values of range_min and range_max does this change result in a
different semantic?

Trying to answer that question myself I wrote two functions:

	#include <stdint.h>

	int compare_unsigned(uint64_t a, int64_t b)
	{
		return a =3D=3D b;
	}

	int compare_signed(uint64_t a, int64_t b)
	{
		return (int64_t)a =3D=3D b;
	}

When I compile this (with gcc -Os) the assembly for both functions is
the same (tested for x86_64 and arm32).

>  	ret =3D device_property_read_u32(rtc->dev.parent, "start-year",
> @@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	if (!rtc->set_start_time)
>  		return;
> =20
> -	range_secs =3D rtc->range_max - rtc->range_min + 1;
> +	range_secs =3D (time64_t)rtc->range_max - rtc->range_min + 1;

In the case where no overflow (or underflow) happens, the result is the
same, isn't it? If there is an overflow, the unsigned variant is
probably the better choice because overflow for signed variables is
undefined behaviour (UB).

Respective demo program looks as follows:

	#include <stdint.h>

	int test_unsigned(uint64_t a)
	{
		return a + 3 > a;
	}

	int test_signed(int64_t a)
	{
		return a + 3 > a;
	}

Using again `gcc -Os`, the signed variant is compiled to a function that
returns true unconditionally while the unsigned one implements the
expected semantic.

>  	/*
>  	 * If the start_secs is larger than the maximum seconds (rtc->range_max)
> @@ -327,7 +327,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	 *
>  	 * Otherwise the offset seconds should be 0.
>  	 */
> -	if (rtc->start_secs > rtc->range_max ||

The original comparison uses unsigned semantics. With start_secs signed
and range_max unsigned, this might become true if start_secs is less
than 0.

> +	if (rtc->start_secs > (time64_t)rtc->range_max ||

This new comparison has a similar problem: If range_max is bigger than
INT64_MAX, its value interpreted as signed 64bit integer might be a
negative number and so this comparison might become true unexpectedly.

So even if UB doesn't play a role here (I'm not sure), it's not clear to
me why you consider the issue of the unsigned comparison worse than the
signed one.

If this is indeed beneficial, it needs a better explanation than "When
comparing time64_t variables (signed) with potentially unsigned range
values, incorrect results could occur leading to runtime errors.".

Maybe you have to replace

	rtc->start_secs > rtc->range_max

by:

	rtc->start_secs >=3D 0 && rtc->start_secs > rtc->range_max

instead?

>  	    rtc->start_secs + range_secs - 1 < rtc->range_min)
>  		rtc->offset_secs =3D rtc->start_secs - rtc->range_min;
>  	else if (rtc->start_secs > rtc->range_min)

I didn't check the other hunks.

All in all I would suggest to split this series in two:

 - Adding support for mt6357 in the rtc-mt6359 driver
 - Fixing overflow issues in the rtc core

Given that I don't understand the intend of this patch, I cannot say if
it should be included in the 2nd series, or if this is yet another
standalone topic.

Best regards
Uwe

--tsmmcnqrrufeyjni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf9jH4ACgkQj4D7WH0S
/k51FwgAsL7mzjW04I3FbsimeTdILk9y1+3zCv9FAZYVpWnaNgF1Ug6wloE92sfC
A6VZrP7eNxWVQ9EcrpIqph4n6AnLEukD2eY9MeSndzqnJJQWJuJ06aafMX7DvkJh
lvvXOn6lX1VI0gjX/pYu4ayTiJ2iBLyXJXM5Pk1E2raJJfF1r5cuRJPXPk0HNwgL
pHIOgpIQKEO1OxYFY8Q7W/af63h/ZmqvQadBh4gPEpDGDKvHG5DgA3G2BMAhqiDX
fvNL/hqBmRa8FC7e274ACveXF00oTDU5uGP/ezWx+U5J2K5wIb3kBzd1BDhIaNFS
oOLoIX9qnbCZ1GOtLtXWLAkT7Wjm4A==
=bJIL
-----END PGP SIGNATURE-----

--tsmmcnqrrufeyjni--


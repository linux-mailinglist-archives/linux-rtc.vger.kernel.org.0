Return-Path: <linux-rtc+bounces-4669-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9725B22087
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 10:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C2B4164D8D
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 08:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DC82D8DD1;
	Tue, 12 Aug 2025 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t7VDAG16"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C8296BB1
	for <linux-rtc@vger.kernel.org>; Tue, 12 Aug 2025 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986567; cv=none; b=nw4t6Z8e+01Ga2NXGOZgiXH6nVO3wHLwY/FD0FPYlAs5PogAdLLVgIj6CgK5AVrWzHVdSRcp4WWznOUDLb7/LecnKTV1SPAD2k2OGDDAVKL2mXYIYJbfD/V29JJR5swFNrH4JzcAp9B4t7ZZl0Emx6yFBjD2jlz/NOtHbtAXme8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986567; c=relaxed/simple;
	bh=S+lb7e7I7HDCbUrpJr4L+oW1fVzuwt4YV1OTP2C4QtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uwi79uWYYfD7RZ+T+62v/ZYR9Qwx3x2KE8PJEY+oylc/Er6X2v8tEe0DSxZV5LYDI38gsYwkc1xxXGvpAzjLhYNegOG/8ERs+9zf4mX41EbtCqPv1NdfpLNOMGx2L7Cc3MPt7NE2Vl7/59VjhZ82hBuhBao5//h+wwJHOqaDmVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t7VDAG16; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459ddb41539so16463975e9.2
        for <linux-rtc@vger.kernel.org>; Tue, 12 Aug 2025 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754986561; x=1755591361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+lb7e7I7HDCbUrpJr4L+oW1fVzuwt4YV1OTP2C4QtY=;
        b=t7VDAG16UtJ+yDFOikdHCZDG3565lItxjwil96crcy0QrvpZ9g0E4FTvBbQx4VBoje
         ylWclP3BOV+tLY6dXXhySWNUE+eOVFxmxh5o94dVMY+h0wqVC7Ywr/qP0jXEdnipJeQ0
         Ro+t6NYwoTa1YCheucE/qfdgt84yKw1EcGDi3q6iOsK8w0IaSylVU7NBQRCYIkYNTbhS
         xACVBsV2U34JdXTKOuagP9/RUyWg6HqVKUXKJPbACn4HGHAQ5awuUon1jze6JMPm/NfP
         yMn/CV5cCGkc8JirzriDHsu+k9uvZc6IIR/YQWh8XFRSu3VZlSC9y9XPzknEdemcLiHo
         uIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986561; x=1755591361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+lb7e7I7HDCbUrpJr4L+oW1fVzuwt4YV1OTP2C4QtY=;
        b=HmoO3HTLGw3/FP5MxUVLlqA8R9uW2Gi4rlVJHlgiy5zuT9uzM6Qw8T1xd2iIgVX3SW
         hNS8Sclid+Grp4UKoWwnuNYvRvex8PshW2wxKFbxWYtBv0QJ4v4eUs8q19W6Sut0mkOp
         ZQxQJJWXx3PgSMzFRADzRKPC1pQTslfxBZ4VgUBiJGxxCe9PX+hhoe4E557RXkjjFbpC
         JrLsxdqM8WyXo5tRUIuKID3FjNoRt6A6y+R3VUDdZFKisLtWy06DR30dNdkWJDON9Ie0
         cui6KwfdGjpM4KK0qyLWWya5wyaIORHPrIDBNn2b+fLoptk+JgCQEp4aLyYWSDlbM5pA
         RJUw==
X-Forwarded-Encrypted: i=1; AJvYcCVofTPnmoUvoKJe6jWk3AfWcaikL219GLBfkr6SmQd5m9CXaX1oXmjCOu/WWWV8muihtKqYK3rvxjI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3aoDQtu3ap/v4VTHhBR5duCyw2aHbaeF0Stb3lMghzigojwgc
	avi6f1seFGG7a+8LxemLw4wJT7JN7n6U2C2BghFQLVca5CU8cmITlnLYWVZeH5eZrq8=
X-Gm-Gg: ASbGncuvXEFuK6DBJApih20S91SNsxYxeOLnSFWXbSpgOh2S4lTnytkxTICMYWNED08
	Ol+23lAMogNq81+1xkacZXSGe8f9j/X7p/uI70EwrDWAXqYEwNvt48Zq0Fdjd1zKVhPPXzKkgv1
	/8gnx9YBY4bNuVaYdEsxH/8fcNqQ+1ckrfXD3ARFe/9A6+MDyC8yihhABzrqxRk77H2jTo+yPqp
	DoWZuok8+ldK2CM+gPCkVWIUoGNeWP/eCG2stoTLgAxeqDVus0TsYMhpbwgHfQBR14UHHGKlSsF
	oWB9qG77LhLkuxz5wb3SRHXRnaZd0VvqoaeDGyQaiZIMPwYIrFJ3QRFUE4aW/jSw1tu+eOENL+v
	HTLjE3ocKFix12MEmsDQwUJyXewY1kQuTlw9su5/y2SGAxaz9OqgSPV+yyKPQN/B1
X-Google-Smtp-Source: AGHT+IFMjR+00EDdOD6rhFQCUHKXMjPDPPRWGKN32vMvFQ0zf5DUnDDq8q3x3Roq+P+e/3ML/0DhsQ==
X-Received: by 2002:a05:600c:c8a:b0:456:19be:5e8 with SMTP id 5b1f17b1804b1-459f4f128ddmr108054675e9.20.1754986560743;
        Tue, 12 Aug 2025 01:16:00 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e587e154sm308312825e9.27.2025.08.12.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:16:00 -0700 (PDT)
Date: Tue, 12 Aug 2025 10:15:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexander Kurz <akurz@blala.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.or, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] Drivers: mc13783: remove deprecated mc13xxx_irq_ack()
Message-ID: <lvknzes7sza4bw3onufckk3pd6rixljfqdzivzqdp6v5ef3wgi@reulh66444v3>
References: <20250811064358.1659-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5q76xnetgyya73u"
Content-Disposition: inline
In-Reply-To: <20250811064358.1659-1-akurz@blala.de>


--z5q76xnetgyya73u
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Drivers: mc13783: remove deprecated mc13xxx_irq_ack()
MIME-Version: 1.0

On Mon, Aug 11, 2025 at 06:43:58AM +0000, Alexander Kurz wrote:
> mc13xxx_irq_ack() got deprecated and became dead code with commit
> 10f9edaeaa30 ("mfd: mc13xxx: Use regmap irq framework for interrupts").
> It should be safe to remove it now.
>=20
> Signed-off-by: Alexander Kurz <akurz@blala.de>

LGTM

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--z5q76xnetgyya73u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmia+DwACgkQj4D7WH0S
/k6TSwf/fIffU4zXR76BKmjAwlFIXK++70fQAT5/s1+PF+b0xcV6OkM9UA7m9HNf
2IlMRtHwcLjCUaFlK9AGJ2wQab2VGrtuJndl219UU18VU2waKdUzXwvHPcHr14f3
XBH7brhCLgPNuPZHMce4zZYBHdJXSQm6zwIjyvm8W4ItCf9v3+Bi1qf9zBBsYmSt
LfT43Sk4UTyn7RHySz9vJqFSyU+YqYxfVynm4v1LCAtCfhHQmDD1sYM/Wfb68vwJ
lwWd8A5NAf5ybthrEbloUTF02W7vythkY5GAHSy1MuOIBoZdvga2eKC/PD/dzquS
PuLwudoi6gZ7ivGg7RZsnyiP2w3XeQ==
=igOJ
-----END PGP SIGNATURE-----

--z5q76xnetgyya73u--


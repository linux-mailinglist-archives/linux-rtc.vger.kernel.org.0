Return-Path: <linux-rtc+bounces-4014-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D18FA9F65F
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 18:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B8813BA8D6
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 16:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F064288C92;
	Mon, 28 Apr 2025 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ANdIWV2M"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC9C28B4F3
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 16:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859579; cv=none; b=Lx2jF2GzNB5PU9SLcTqUHKvssV4pgUo0Z/IeMxysGd7Fj1FB2uCxSeLrh8uwjsSoWWncUGmQmYi74vgbe+9nS7AtIr2Fnwv/QZZ+EjaXG1rSF5lPuXc9OHGRQi4eB3UTxvNL+kNPGz7dPJjuML88YSUHHxNKGmalZEFosU1XbpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859579; c=relaxed/simple;
	bh=/0lhlyPmYUWcxElB14bJ/Ii39YHXHOTu5shfI4I472g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJwOf1M+pndrPv6A36slvUEialJ4YhPwrrJmYpaOsrH9QG+FYJyuaNrZv6IUV2lFA3EYVEK8bSPCtLy5+yG0FayKeESK/rp4Ce5HaV65wWy9Aixmxbt9F3NHFgI7ZcvztJl9rZZiWB78iJHaEodifbyBBd6Fmaehdbq/u5AXLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ANdIWV2M; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so26259575e9.2
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745859575; x=1746464375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/0lhlyPmYUWcxElB14bJ/Ii39YHXHOTu5shfI4I472g=;
        b=ANdIWV2M9oCdGwpdIdO1M6X4Jh6Qur4De9JMWx/H9eDxKYVGiByjo80h1lN1Iuz+Ec
         JS9ALKhBGp+INJpZTjN8fImQ2hulcgeGs3344wQqqldPivIF94HLTCYIqGC2sRgQ/Q2i
         smT0kyxh/V6AsEbYv1Ovz7bbuK1siTAKWnxnZHQGXNogk/VwhtGUfXlu33vHFPcIQp0t
         6X7tgMABOF4xBbyDWmR8TqYGyI4dmsuFodfN3idZ4xndKuj6zMaDb/bZCsgL80r5DwC3
         KLsnlfOyvDy2u7LdCWdUT/kGmnQm0Cwic7OxObI9utGJfddh/8aejhl/XUt+wTXM27um
         DSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859575; x=1746464375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0lhlyPmYUWcxElB14bJ/Ii39YHXHOTu5shfI4I472g=;
        b=awyGVyvl5IfMGJpsFyqemRsR195IjseQYFl9MQo15plbGfWF52ESCDJb11a+FgRIoL
         QWEU9svzGQdpyLn/88Fbzp/qK5Mmm5LXgOKTIAKoZT0GluNQ7VdTT5QrPxrk2b2QHUEU
         gHZYAUcBEweYUxjcLD9lw9iTg6HQTjbkRvvjX1AoIlkLVuZU0evkyaA/FpUchTuj4iPa
         Xfr0OphCV4JYZsu3C0JbmcpASRy0b+erUDmlYulKGBskDpTJJN8X/L9KJAw25uXUJYMI
         MHIDKQ5EXpJSrzYmwYlgYhMdQHRcEeLb3mxzCNBfsI0V3UG20KM6jnenWUBi512eHVTF
         pR/g==
X-Forwarded-Encrypted: i=1; AJvYcCUcsvvnznLl4DsaztWpr6qlD2NCO+mG5Sy5pf1zSwka6ug3QMMSr+UeAj8qmx/SDS63gegwp4YUHE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IMAac2VpfkyOuWjaZ/jN1Jm8EiVRFAko3cxCIwBAPon1It46
	NS1qo+ABj/ZON42Wkx+dvwMOrpS5YM5E99+zhSGCl3O//oSO3k+d6UniJXDbc+4=
X-Gm-Gg: ASbGncsKLxnapEfKVLxt/HpDRuw0B7qrJPvR4+nc4+wV+C5+i3m/seNrWqfdwcqCDNO
	T7gEHH3l4oEdYeiWa3yOx+fzGb6eoDEkTg5JR7Nvgunpqg6diWOUNt8hhyN1QnWFh9GC4CWQJ4K
	yDs8sH9zKQuER5HUUBGUCdOn4UtivKhgs7AL6TP3QmuG02GOnsaVhhMEHmBLj1LYyGDiBV5Y2l/
	lvUjzQszHWzaCw/mZl/kBk+tcGvJsY8fT+HzZk6hkrnutJ7z9DJY+PlqngJUVeB+iI9uC2eI/Ho
	jncQ8J0KlX81SQiIZRRWDL+3HMTGowlEJpM2/0Xsl3T88eR7nnFzp83gf8/AmxBIZ6DhKBgZHrt
	xolSIXh4=
X-Google-Smtp-Source: AGHT+IGuTVZ8jA7D1hbRu4INRJB1CRJz4DEtmshvngJPSojbivSdalQodiZ2I1GxiajcHOWEqCCDyA==
X-Received: by 2002:a05:600c:c109:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-440a9eda450mr96923145e9.10.1745859574814;
        Mon, 28 Apr 2025 09:59:34 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a5310ad2sm129288045e9.21.2025.04.28.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:59:34 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:59:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
Message-ID: <5gpvxwgqfgvb6eu6nwso3xk4xpdqayz7wo6y2mvweci2veetqw@wsurri5h7xvu>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
 <20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4e5cxo2d27gwqcz"
Content-Disposition: inline
In-Reply-To: <20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com>


--y4e5cxo2d27gwqcz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
MIME-Version: 1.0

Hello Alexandre,

On Mon, Apr 28, 2025 at 12:06:47PM +0200, Alexandre Mergnat wrote:
> Conversion of dates before 1970 is still relevant today because these
> dates are reused on some hardwares to store dates bigger than the
> maximal date that is representable in the device's native format.
> This prominently and very soon affects the hardware covered by the
> rtc-mt6397 driver that can only natively store dates in the interval
> 1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
> to such a device, rtc_time64_to_tm() must do the right thing for
> time=3D-2208988800.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Given this problem starts to bite in 2028 I'd like to see this (and the
next) patch backported to stable. If you want a Fixes: line, maybe
34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for
start-year") is sensible here as this is the commit that introduced the
requirement to handle negative timestamps. (The drivers that made use
of the offset feature already before that commit all had
=2Erange_min >=3D 0, and so are not affected by this problem.)

With my Debian kernel team member hat on, I even welcome
34bbdc12d04e2f18a2ca96351c59e40b62da3314 being backported to 6.12.y
given that the next Debian stable release ("trixie") will use 6.12.y and
will likely matter longer than 2027.

Apart from that:

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--y4e5cxo2d27gwqcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgPs/IACgkQj4D7WH0S
/k7digf9FKoIhdOcmHmeQPe1van55wAA+pc18lmces7unuU2bGnM6w1c9ii6Pz6Y
BjlTpEk8KbRT//E4Vwh/fFfoHCF6llU094eg0hSeKXzhb3A5ejlA9tXc14pzH+k6
0foyRTy3scbgJHilh71Mvch/XkKGXQShIN6/WoFNd25AweSEybciYdw2ZRQWWH9C
oWFtePqlBL2OQHmIFbs5DSHCx3CHrbq8cvtV++yfWQtLCt6w7CV5ahhMZ7C4l1hf
cKo1HjJZbZvu+X3r7issX+Fax8sGfUjRFTw5FnHmhJVOeMLyVchRTME0BxmVNbAg
LSh1+LopXgjHD2IXa+m7W4XyPsxL+A==
=S8Cc
-----END PGP SIGNATURE-----

--y4e5cxo2d27gwqcz--


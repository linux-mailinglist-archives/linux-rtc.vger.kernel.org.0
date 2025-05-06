Return-Path: <linux-rtc+bounces-4041-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368DAABC73
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 10:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA7B506F41
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 08:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E251EF396;
	Tue,  6 May 2025 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jwP2gHZt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A851990CD
	for <linux-rtc@vger.kernel.org>; Tue,  6 May 2025 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518317; cv=none; b=r5u4a7/Ni0+XMhjnbxbVWL7RtAf59v9d/Y+AhZidDXRb1yK6quwr1VlWt+U53yk3yb3n38FC41cPOsKryzQCw0JCTaEHDUMTgd0pgZjVCTQ2HT4kChe7HwwykBQ1HgUmQ52IlXPiZiKtyOi3qlWZVvOWd0WcJmozSS2GAQPuGkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518317; c=relaxed/simple;
	bh=otMgDfAKMDhndfNFbnuhKeKRA6gX2e8cs9z4QIFvVnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwvfDHfCUctjJj+UEJzxp5ALwl9sBTDwYQCAE/FFeEaV7yvXfIGkL/FMtEXJp0m5CqRMtjvO+7rFco5wyEsi/7pI13HV6b5TQmFwsv3b71iKxYZphB+9SN5Mm6YKA9ykPwTIQo7cDw5vtovrioUhXex2/Kf/TWCcfq1LgW6ecNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jwP2gHZt; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb615228a4so1221872766b.0
        for <linux-rtc@vger.kernel.org>; Tue, 06 May 2025 00:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746518312; x=1747123112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otMgDfAKMDhndfNFbnuhKeKRA6gX2e8cs9z4QIFvVnY=;
        b=jwP2gHZt+kM1S841Jpm5l9wBKFuH7d2rkQvxdeBHgC+ZBqZlfmcgj3/oVBYvOA4xdG
         GZKyHqD2DmLw8TPhMXj1cM9tdn47WUibnFfTM0KsMWKA+jPLOWbE5miOmeTQtdU+81ZH
         zKrP7Y30trpxdwGUYOGkBZ2Cbg6MqXIoXuveJMMf/vT/NbR8E7Dvty+7uPf6AGTzfFvb
         fQY7kCmLwPIOY9J8es7dn3YDwjdP+Ou0mOwwvJCkWLzmVNzi7WQNjCCNJKxGnhWzeiPy
         ZtKhfbytfql+mSl3zkhW6e60d82TC74wb+e96/XLS1j5zVj1yg1QkhpCPm4cJgR7Y/UX
         gPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518312; x=1747123112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otMgDfAKMDhndfNFbnuhKeKRA6gX2e8cs9z4QIFvVnY=;
        b=B4S2ER2ufntjFRikvf7nRGwagOoUd3OKo/C00ppMwo/zLeSu/WdpcWLV2f72MMMqKW
         9Trv70azZ77lTcAcc29CggZxEXU1ISt6/Vul5xnkXySwfH1p5/GJqy6P4bgRjFdNjiMT
         oK7H3OAVs+XMAdz86132ReNgpe1fwwgMWdIQsJtqo7cRai+2TIXRgD1ZDHyu5kakaRDX
         IsR5jo92DDr0MpIBD6QMN7eeI/KXYTvdFbVDGzNG0Ba5n8TQMoOXup17N0o1QiLAjTdw
         g1BFynJ7CsnoDvgQj5xSDtARn98PUjKyQ8HTWaeqtzlwcsypeK0fDQ52hSTRLvPQ3aFL
         LLUA==
X-Forwarded-Encrypted: i=1; AJvYcCV61RyPypLZxUm/5fp3MfO3Gb107V+p/QxRa9NaXiEc/Pea2PSAoSA0o/n1jDV8w7aauvDHmInfM9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKKwnhV57FWX32l7BJY2Dt0zGXBKIGytiaFnoAY0Xa9j1KLyS6
	cfbrpvSViOIDsUe8qFKw7DtXyb7+neo92Lzur2XASlAJu2V1Fpp1z4opVV4pgy4=
X-Gm-Gg: ASbGnct0QrvACkgrz+FL9TwzzrmoQP5YpDyQTJoJymAOScGJSwFFX5vdcHxxVHGE41Q
	iBo6PZbE16XJdh1geRw62dRFKxmP4Zsi2ktdcI6U7MOZL0D/J5Py2WU7Ke/BpG8VvYagmg00d1y
	cJEZs6xiUt7M6ldMjtAEMM+kyzppkHyfReRHHl0MavknoQeEFhVApE7kJKD/k3PzE9Mn6JdWHC8
	7hgCTXPnoNlFAy88QoJ2R0QJLSIt4LP+r4JyLp8F/xQ+y+RdqvJ3aLVNGqQcJSbnw/8Lg23+X+h
	YPh67/S4QXbNsoZoAEAiwzZTUM5TgR1jgIy+iLMGIezClY86mfjZr2m4
X-Google-Smtp-Source: AGHT+IFFYr58SDGefH2QTO/nsOoxaqVlyOnmQ7fiobmWHO9c2KZZLAxLqCaXDivMXlOZZJK7dWO9eg==
X-Received: by 2002:a17:907:6eac:b0:ac7:b213:b7e5 with SMTP id a640c23a62f3a-ad1d2ecb11emr219935566b.18.1746518311999;
        Tue, 06 May 2025 00:58:31 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad189508c2csm652230866b.130.2025.05.06.00.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 00:58:31 -0700 (PDT)
Date: Tue, 6 May 2025 09:58:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
Message-ID: <yjymcsje4z5c2htgefya2cocyx5guvepng756vdigjmvxvk6dv@wqyeh33mfty4>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
 <20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com>
 <5gpvxwgqfgvb6eu6nwso3xk4xpdqayz7wo6y2mvweci2veetqw@wsurri5h7xvu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7bpbuhfrvksdohsk"
Content-Disposition: inline
In-Reply-To: <5gpvxwgqfgvb6eu6nwso3xk4xpdqayz7wo6y2mvweci2veetqw@wsurri5h7xvu>


--7bpbuhfrvksdohsk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
MIME-Version: 1.0

Hello Alexandre,

On Mon, Apr 28, 2025 at 06:59:33PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 28, 2025 at 12:06:47PM +0200, Alexandre Mergnat wrote:
> > Conversion of dates before 1970 is still relevant today because these
> > dates are reused on some hardwares to store dates bigger than the
> > maximal date that is representable in the device's native format.
> > This prominently and very soon affects the hardware covered by the
> > rtc-mt6397 driver that can only natively store dates in the interval
> > 1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
> > to such a device, rtc_time64_to_tm() must do the right thing for
> > time=3D-2208988800.
> >=20
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>=20
> Given this problem starts to bite in 2028 I'd like to see this (and the
> next) patch backported to stable. If you want a Fixes: line, maybe
> 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for
> start-year") is sensible here as this is the commit that introduced the
> requirement to handle negative timestamps. (The drivers that made use
> of the offset feature already before that commit all had
> .range_min >=3D 0, and so are not affected by this problem.)

Given that we're already at v6.15-rc5 I wonder if there is a chance to
get these changes reviewed and applied before v6.15. Would a pull
request help you? If yes, should it only contain the fixes, or also the
updated tests?

Best regards
Uwe

--7bpbuhfrvksdohsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgZwSEACgkQj4D7WH0S
/k4w7QgAlqa6THLQEj9lQWvkqFBMpHSH6z56IM+J0ukUkyU+RAP4TjCKb8qAKhbo
ZHUf7kNi7bdrWNX1DGEfG7T0UY/GdSSihOEr9A912AMiVzOTuzNn+pvnh0Dr1ZCO
+mnfG3ZS1dvLHSe7JbnvFR+/EV8c1HyZbS/caYrJao0iq0Lq+dnvskA/r5kNh5ys
MElR5BF0lAiJVCxxBiktuUGdAAVJh/969lAhtHKynT0ZkanTurm/lWo9QoB8wDKc
Hi7PtSbxGGv5bw/6PxzVUBJaXOeHnnu5yHuLGBKTFbu1srb6y+IylKzVCCRf8Q3U
0pviub4KQf2lnrf7d8j8bpqautf24A==
=jZgu
-----END PGP SIGNATURE-----

--7bpbuhfrvksdohsk--


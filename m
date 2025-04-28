Return-Path: <linux-rtc+bounces-4015-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486D8A9F661
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 19:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D6E3A9607
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 17:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBB927B4E8;
	Mon, 28 Apr 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fQkUyCoK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9C27A90B
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859623; cv=none; b=SgjOcvqXf4+GSwJSik6G6gs7h0c2GpIST7PrLDm3VbjlU0tzXS+fwTkjalsk363AGy/24FNevvDZ+Vku3r5cPUt3Nu3LEcilOHzK72dMl/3H4ieqj6cxIWlkIcJkUpupfzttAYTDumJfbH3kQADxnqJaYkhm50mi1/VUxJXxLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859623; c=relaxed/simple;
	bh=w4x84lODS+QAHRN8EMLjw/p/t7a91E/LLtSBryDL7eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unFiuEaprg9c2nEEgx3ZbUrtfsXtNBgeMnkfbJ4l68B1BAaqppvm75JxbSTJG1aQ6wkKWFHvCBUH1H6ftmD+Lm2xf18kdGdS6M1Chx5qEaZLwnvPQPGyoLWX223qIxGWSqx4TPs9liBgnQXNiz/hLzqMmDW6oOscSqjfujFzSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fQkUyCoK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso3948055f8f.2
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745859620; x=1746464420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8PGEVntBYwExNM5jR5HyOMl7n0XplmYVb/kJff+sOo=;
        b=fQkUyCoK48BIxU+avdaTls9h8P1nEwfJ2ILef9Y4Q8ccniS6aEaQaCFEg9P6IJIT+D
         E54jsjJN0sw7YWqvbmcWveSbp4mlce/3+imyOzFIdD1XiaMQnRuA6zImN2c6K0br44Fx
         BGLTiBReeE7wnKr1ji1cCeS88+DpBKzIt/fa9vhJUxbCd2EzmFk/cScXADrE49ZF/uKO
         iLNOIp2pIzH3HyOLT2NRi1cHXItGV0kOMul6baVZjBha3pEpcHHaDPO8tIXb4ZpZuQKn
         Vf31G7GCcX3QyAEqPjZyV2guByoSVDoKkjhoTt5QzPshksdN7Nd/6w04udeO5djRz8wx
         eqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859620; x=1746464420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8PGEVntBYwExNM5jR5HyOMl7n0XplmYVb/kJff+sOo=;
        b=Tae2scg/oHJJ6zi2osScUr5S7r87WZuNvGfF0SpG3PS9F698waET8uSIOg5m9lK2jq
         HFgIoY4Hq0nKAGYFRn/EOHK0kA7DCff+zNdUBqTV7hr081D1KCPUDPKh4SXYSUBX3Q/5
         0Qb+GSOCzTh8Qcn/WTkuLqz46+4I54PrVeucZrPBzlDk+Oe43NwzvBeUUBi2kz+9/gPB
         Etv3sRMoYGkY9EQ6FryLdQFmnre60pvxbDpE3PMD+ejLGryx3IL/vtRY4Fuf9b+DUe9G
         PxPii9X47TbEjhljkEc0e1W3m3CCJvAOLto3uXXM7a/CIPS/Z8A6kUh0wZRb1F4LL8tl
         Yvvg==
X-Forwarded-Encrypted: i=1; AJvYcCVS6qk17GULXowR3Ir2gEzEVx/5Lj7XY7FGWrbpmIoDXhQ3hmNxLw7ENQjvfTxyfDz2Wf0zTVKLmYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzePTyHFllNL/TncsH/DibbYqC2eoToAJdfdUEj6MUsvs03Q9qf
	IvwyQcbT5/TjO3wUOLO509ycrNTwKNsg8g+Fmy6/UzXjfsQer42M0FDvUOQVkqM=
X-Gm-Gg: ASbGncu1VFoOLjRXcftpHzWENely09geLCLHk68vV9HNHuY15v/YVjGnsnLhTinN4BI
	kT0iyoD+iI8Dfm0BnrXNg7aeH2gpF72Lgu084K48u8aqMHQ1e6xNcaamKePXrlGpPq+z/2fMgBJ
	Ko+TbTpboGEy2nCr2f2uOmsEUUHuHNXimgW+DsMBAJ4mjXWovJpBPKOHVuvtWRZlsvl0DVt1PL2
	diUX2G6KyWXTRtML0Khy1etOlTH1Low7urMqP+iOKV7G/npQK71NyCcl8HWOUYci9Usfbclk48n
	nUwLjgltzl3o9j8xKXFjSWeSkCIthOss9k1klkHTRyyj70+CY0+IavE0fV8vWtWX6vqi59cmINr
	Q9Gyrfso=
X-Google-Smtp-Source: AGHT+IFVZLb8kJuqkDFjP154IUhR+bkr5kl34F/44rfPGoLzIVhDYQRN05232S1PIENpaWF7X00Ssg==
X-Received: by 2002:adf:f048:0:b0:39c:1efd:ed8f with SMTP id ffacd0b85a97d-3a0894a1978mr411147f8f.50.1745859619771;
        Mon, 28 Apr 2025 10:00:19 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a089edeca6sm183876f8f.40.2025.04.28.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:00:19 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:00:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] rtc: Fix offset calculation for .start_secs < 0
Message-ID: <yhcdgillcnlwditdmitklbhkfd2lh5on7ibvuqdxnhricjoele@c246pnf4uc42>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
 <20250428-enable-rtc-v4-2-2b2f7e3f9349@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ja36ara4ddswchsp"
Content-Disposition: inline
In-Reply-To: <20250428-enable-rtc-v4-2-2b2f7e3f9349@baylibre.com>


--ja36ara4ddswchsp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] rtc: Fix offset calculation for .start_secs < 0
MIME-Version: 1.0

Hello,

On Mon, Apr 28, 2025 at 12:06:48PM +0200, Alexandre Mergnat wrote:
> The comparison
>=20
>         rtc->start_secs > rtc->range_max
>=20
> has a signed left-hand side and an unsigned right-hand side.
> So the comparison might become true for negative start_secs which is
> interpreted as a (possibly very large) positive value.
>=20
> As a negative value can never be bigger than an unsigned value
> the correct representation of the (mathematical) comparison
>=20
>         rtc->start_secs > rtc->range_max
>=20
> in C is:
>=20
>         rtc->start_secs >=3D 0 && rtc->start_secs > rtc->range_max
>=20
> Use that to fix the offset calculation currently used in the
> rtc-mt6397 driver.
>=20
> Fixes: 989515647e783 ("rtc: Add one offset seconds to expand RTC range")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--ja36ara4ddswchsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgPtB8ACgkQj4D7WH0S
/k4BbQf8CaVnrNVi6ALQx0pdjBVRl4aZiV8PktMUnlHkY8JSNIN278Iv1Mutq7Ed
wrgvm+tuqXDlFvKXApQnnRnokZVh0uYQ18ES80Qu/YuSzp2MantS38qlFBNOQ8ns
Xwg3q2+VrwFjgMRTKuK+rwyjpUXt8HN3TFiy1bapwvQMHFXoCCHdKbYxOGVRPUrv
0ztn65TRmEKjipGpQr/E7g1xiNMVKXR0jfKlUi2U5fM/TEoK6XLq+tfssgvseNNM
Cas0rfDR/ifOqCWuoyUronLpRdRpCP88k/29K1riZzRUbW5bWlbmgZjbXKW1VjrZ
7xBwGCBsnrfHdQMO0XXap0jNbpybEQ==
=MS12
-----END PGP SIGNATURE-----

--ja36ara4ddswchsp--


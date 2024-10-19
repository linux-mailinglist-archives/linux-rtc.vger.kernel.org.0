Return-Path: <linux-rtc+bounces-2255-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEC99A4FB2
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 18:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E393F1F24004
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 16:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6B518BB8E;
	Sat, 19 Oct 2024 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tnvDm/Br"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E5186607
	for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729354582; cv=none; b=QEcp/LRT+SOWpTp0rvBFcITzoWOd+Gc9uZtqoRPA8U8w0vq6LT0vZKRBhgrceog4xRTqEPemJOTGlgIAsGQUfwMBKfdqlIeQh4YKIxcT3zdip+k9bxZ/SabH706ozXaMJB7LNuBeDtqwOOBdTR53yKzjwutIP1Fuqshs3ELv9VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729354582; c=relaxed/simple;
	bh=StuBSN/GRyNQc/pG0x5/xQFTvBZGWqHm+6Jr33Ss7V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFUgBnDciNxvIsBm8e06tizk4Mr4FBn7TXNbx+X+pfK7SCElOkUGgwVoMPqfN6hDnjKuIeBPcUpgZximt74Woxq8cHlBWDUAJAn5vDV6bg2GdtLJRvYm00IsaNX/7PWDnUGj7S/aZiQaHtlmMyPHfmq/Ato+aTGLSFf6xnzz81U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tnvDm/Br; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99f646ff1bso377960266b.2
        for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729354578; x=1729959378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMKGahwoszcg3v581bmcW1DmO8H5y+Y8QgEXy/B2rl8=;
        b=tnvDm/Bruu8Oh/3mm3eZA4UdtC5HLDYaxMTt0ube4IRwM3mIsXBWdNoDIY1TUy/1Rj
         DhDhqCPBHxeOsSnMbFyLhk9jW776dZJMpU5QaUeqLO8m9NIwos6TpuIaikBFoZF5Nc5u
         Eb1l81T0tkb2TJppiQCKV8IaQxhdGzwdYmaDMfl0wbm3lltLpp65vJuek8Vku38a0dgt
         NEPGRqM+DEYJ/2Na0K4NtASaCtfIsE1oGb/2CQbgRYBAr43GkKoaEueG8/cejd2DmzGP
         PcLy5Uey7LfVdodhRLJrDA5xQ7yjWH+3bD8cAdQVglw41aFQ4O8WUGCpVQOedFTAeUuK
         smEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729354578; x=1729959378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMKGahwoszcg3v581bmcW1DmO8H5y+Y8QgEXy/B2rl8=;
        b=fnCjcVnXQQdiVMpIYZPxhKpxvt8m+/OD+T8s5xAqkSPJsvltuEADrnfDPc+Y89cRY2
         0ATHAk93aRWFtiT1gbI4ILK3F7AiBhtNcOfiasIbUbi8yBc7pu0ldmKi0pOkz4PXb9mt
         /hpQeU3BmJkB9rxidQzWesPiE1/V85BfVE+2h7WnRXS7lrs57c9WJF2scyVHj/nAAh4x
         3KuerfSO3tH+p5MYXJmQR3et6DsUneOgAQL5yK2C13/pMftzZRcmRu3kPa7hJdpY0uzA
         Ow/oDAZyHr8dnDB0o0xkQ8snAz76/uayRp8w82gagP9qUOwnPXEmQpFYD65svxRDypuF
         /q7w==
X-Forwarded-Encrypted: i=1; AJvYcCW2MpqJE6SJBp7QI+uSERLIELa1DrY9zFBLqEZ9NAMtWaQhlM2BlcVq/fGQufjjvYhOX0LWDyYBIyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSr0N5t7IOfLgEyrylzes3mZIjLEqbz1Nf885wZLjOKPh2pDrG
	pzScA5VyNIV/Bs5Fqto+RyE83RYE38PWi7t3D/Ozk20SVtkv8H7P3alWIOEcmxw=
X-Google-Smtp-Source: AGHT+IGmvPoyNXRtNONcUztTuPoBpcDMSxWfpc8rl3an9FxYAtZFBmtHaZx/ixcLWiSk9mG9RLLQzg==
X-Received: by 2002:a17:907:1c1e:b0:a99:4162:4e42 with SMTP id a640c23a62f3a-a9a69baad40mr460125866b.37.1729354578283;
        Sat, 19 Oct 2024 09:16:18 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:677d:cc5a:24af:d1a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a8e758sm226723966b.31.2024.10.19.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 09:16:17 -0700 (PDT)
Date: Sat, 19 Oct 2024 18:16:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 07/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Message-ID: <c5r5yfiujywad4g37lrnqqhojroxcite3uavy7fbytxpdeskio@istcpft4v4z6>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
 <20241019084738.3370489-8-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zus3as7bpkuwpgmb"
Content-Disposition: inline
In-Reply-To: <20241019084738.3370489-8-claudiu.beznea.uj@bp.renesas.com>


--zus3as7bpkuwpgmb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 07/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
MIME-Version: 1.0

Hello,

On Sat, Oct 19, 2024 at 11:47:33AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC has calendar count
> mode and binary count mode (selectable though RCR2.CNTMD) capabilities,
> alarm capabilities, clock error correction capabilities. It can generate
> alarm, period, carry interrupts.
>=20
> Add a driver for RTCA-3 IP. The driver implements calendar count mode (as
> the conversion b/w RTC and system time is simpler, done with bcd2bin(),
> bin2bcd()), read and set time, read and set alarm, read and set
> an offset.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

I don't know how picky Alexandre is, but there is no S-o-b line for the
patch sender.

> +static struct platform_driver rtca3_platform_driver =3D {
> +	.driver =3D {
> +		.name =3D "rtc-rtca3",
> +		.pm =3D pm_ptr(&rtca3_pm_ops),
> +		.of_match_table =3D rtca3_of_match,
> +	},
> +	.probe =3D rtca3_probe,
> +	.remove_new =3D rtca3_remove,
> +};

Please use .remove here. You just need to drop "_new". See
https://lore.kernel.org/linux-rtc/20241007205803.444994-6-u.kleine-koenig@b=
aylibre.com/=20

Best regards
Uwe

--zus3as7bpkuwpgmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcT20wACgkQj4D7WH0S
/k5sigf/WQisuypfB38zNIkAPJJO+gsAp1o4h/CXa8Bp4Iqsyn0kSttNjSqE1cCL
jpuyFgQYDDBS3xR8uy5+odIWCuOPtQUyFly3rXmcHRM0O5a7/owHYNI+cjUwvtDu
u9mgP061ri2zKSrKvhLPrmyfbRmMH4QL6Ny2UDflVWM8eC8wGAi6Qs4d1hqFNqT9
Rhb6CVu9m7GKTJi663dDZMvg4FovYzZ7t391xeP7N/G7bqrp0PPRotSoXYPn9ahr
xFRTolIhA46CJDKzS5FjLcdUOcfMYNXdfHqkMnIH18fV0WBR0KfpNFjHe//M/+FR
puerjp/PPQ8x3IJwlbuwb28tmEq/Tw==
=0EYG
-----END PGP SIGNATURE-----

--zus3as7bpkuwpgmb--


Return-Path: <linux-rtc+bounces-5486-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F51C8E086
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Nov 2025 12:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80E563A6E4C
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Nov 2025 11:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D71932ED26;
	Thu, 27 Nov 2025 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bNZKoPli"
X-Original-To: linux-rtc@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C932D0EE
	for <linux-rtc@vger.kernel.org>; Thu, 27 Nov 2025 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764242471; cv=none; b=ds57MDnpwkFFZixIGhA8Hlih6bT6R2FBIDQBPF9rKhy0rkbUX/m90Vbou4Jw4vEy6PxV/hndG3z6vk9NNrEDkyoLn6dNWaIruyWufF31jFedBMXVjKZAVxIWtvNKBj8Q8C4UVOP8IybB42UZl729LpayanXBt05ca0+L1S+Bn6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764242471; c=relaxed/simple;
	bh=Ap6/9SbkbbPmwKUm+ihzBVNWRWeUs4zdF9KjvdKRdpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7Hs+9EXsQoyyK5/85l9KZh3UlLTKlcd6LvmnkfONrAvuyzvA+a7L/SPk6tFpJhJh/G8EBk3av8kd7u0wLf/nfzYir2huOxEo3QdyKDba6MWHgfsUSk/06F1AbJBVgRG965RPX2EXffIsVGQkgrmRxyemBySKS2+vlmkTWZu6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bNZKoPli; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 27 Nov 2025 13:20:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764242467; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=9hlvCyZam0KEugkCTICJnPQK3CmfT/W9AcEwJZGBgVM=;
	b=bNZKoPlijfeIKaessbhVKny47LUKJ96A8IP++cezctLMuEAswDl7dm94n5cgZ1rJgbu0kH
	ac7WG827thIkBZkzxrRokIrtVGsgZufp/lcbh5c/GQOo+haInO57NBPwGB5cJ8jPreLuBa
	EP7ij3w6c52Q2cch1r5DqRWtXjxMjps=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v6 17/17] MAINTAINERS: Add ROHM BD72720 PMIC
Message-ID: <e9bf9a504fdd5011adc4a012d59f71a9385d57ea.1764241265.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1764241265.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TAKA8cOt62rM1h2P"
Content-Disposition: inline
In-Reply-To: <cover.1764241265.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--TAKA8cOt62rM1h2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the ROHM BD72720 PMIC driver files to be maintained by undersigned.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 RFCv1 =3D>:
 - No changes
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe01aa31c58b..7e3c1eac7cda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22353,6 +22353,7 @@ S:	Supported
 F:	drivers/clk/clk-bd718x7.c
 F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
+F:	drivers/gpio/gpio-bd72720.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/mfd/rohm-bd9576.c
@@ -22369,6 +22370,7 @@ F:	drivers/watchdog/bd96801_wdt.c
 F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
+F:	include/linux/mfd/rohm-bd72720.h
 F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-bd96801.h
 F:	include/linux/mfd/rohm-bd96802.h
--=20
2.52.0


--TAKA8cOt62rM1h2P
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmkoNBsACgkQeFA3/03a
ocX3XwgA0e7s/RbGuUWSAffxeMa2iMDujJPBu2E1K8RfwmVs+g7zs1N1LXPRjig0
RsN2Q6KdvgbMyTWjhich47XuU1THSsNf5zWKCWw9lgsopVO5UMxnRfJWaNlDNCDG
5WetCUfKGSjh0uJHmg6y48ggWigquj/D+8z/cqELCWTiXlEVxvzSW1gbYUn2a6/e
oKHSGSHMg1gXoho7utxadtFxdfI0kBiuEs724deIcx9L4TLMsktEmV0+t5j5E1Jj
naA+FsVE0tfSlMwpSEOV7L4WVUaDrd/JjeO+poH74sjwgQx7CXke9nCYIbdywWCs
5hjJhl0RnIlLdrd4k9xiu0lCEs/KLQ==
=l3La
-----END PGP SIGNATURE-----

--TAKA8cOt62rM1h2P--


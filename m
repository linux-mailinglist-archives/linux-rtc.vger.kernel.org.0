Return-Path: <linux-rtc+bounces-1485-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A19992EA93
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 16:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BF121C20C00
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 14:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82D5161B43;
	Thu, 11 Jul 2024 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWl3dqbi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBE115AD99;
	Thu, 11 Jul 2024 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720707672; cv=none; b=uElEEHaiceMkZTL+PKgHmLWD09FgFB5Q0ZUVMVxY9Z9QTzYzjKygzrHdjeFoelu0NCgClooMWVyreFgi0DmjDpGrjBloJn3xb2+z69sAhGeBZhfxbq+jjduOO07nryLD9CvbI06li/L6B+yDcGN8NYK/StXvnvnS7IzBYchbgUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720707672; c=relaxed/simple;
	bh=EVzV5gygTBPaMO6VawoS8jAqq4SBfpcm8pnxcTObV1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUHyQDasvs9yWMhM+J9ocSAJ/P+Tj1BKJiJ96luNhxyCpVy3I5qHP1RV7u3xXFF6H+0/lWeDcR/dSXfEh5Dcv1FIKM++Si1acq1kCI6ocgM8iiVxpvELm6ZfgGwNHPd9UUBd3UeikpmGUFaWJcaac/coRGmxrlsOVVw8/GmBVzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWl3dqbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCB8C116B1;
	Thu, 11 Jul 2024 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720707672;
	bh=EVzV5gygTBPaMO6VawoS8jAqq4SBfpcm8pnxcTObV1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWl3dqbi9l+exogGQkFYJPdgJPRrrVZpD0UcL4MrMsZUXBgE3ElcD+bsnupXR79oU
	 EQZjriJdpTO+K1qwW705WnrtgosmqrvzWsAEcnFipurNpabVjL34Q2f8QtVfoj5mRz
	 1Bub1oz7Qym7t0v2sTB5fE7iQp+RnMjenW+cX2JSK9+6vZ5W7c5oGJIPralU1QA6tG
	 PqXWq3DyaqkhRuzUcxxeLTQ20lBBckYsPFklx+RVXpaqDdQG/aB1p650lp9KVJNCJ5
	 P1VbCfuK4xWLCUkIIa70qlJNUY7dSJzA6UprdnDF0Mb4A8EflIuBO5mh0ZCUjqpqY6
	 EwSnnmddgyLkA==
Date: Thu, 11 Jul 2024 15:21:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH] rtc: ds1343: Force SPI chip select to be active
 high
Message-ID: <bd7c0eb9-bcb6-42e3-8be6-3d07452e3fd5@sirena.org.uk>
References: <20240710175246.3560207-1-abbotti@mev.co.uk>
 <20240710184053c34201f0@mail.local>
 <2b0e8a6c-f89e-4d71-a816-9da46ea695eb@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X16MSWMy47KogHCw"
Content-Disposition: inline
In-Reply-To: <2b0e8a6c-f89e-4d71-a816-9da46ea695eb@mev.co.uk>
X-Cookie: Individualists unite!


--X16MSWMy47KogHCw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2024 at 03:05:01PM +0100, Ian Abbott wrote:

> I think the devicetree node for the RTC device ought to be setting
> `spi-cs-high` but cannot do so at the moment because the driver clobbers it.

Specifying spi-cs-high in the device tree should almost always be
redundant or a mistake, if the device needs a high chip select then we
already know that from the compatible.  The property is adding nothing
but potential confusion, in the normal course of affairs the driver
should just specify the configuration it needs for the bus.

--X16MSWMy47KogHCw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaP6lMACgkQJNaLcl1U
h9C4hgf+I5lbIHVNYT9X+IHAW9VbWGC3NJG/GzSxonaA+chDK4FHyDlJU/ZnEtj0
8Dftfoy2RAMOivQp0mK9VQHoo9M/pEeBhzmFzaY6cOc2mKEDVrWgZQ+KLP2VWgBp
HhS89oe8vRv4z+ivGoa2Y6ErOYxFAZuizjkBRGeNLmt6lnb4TGFbbANAgCLm0MI3
BYn2NM4qtLXUE0wsvd0qV92v1V7t1Mo6JWG+hrv0+32EHuFkacBtvKIniR9z2aHz
IhqJHjnfy0zWcNKeDy0BfTUUGe/MpP3BTDbMrntmZVBbet3gYSS3Toqfkq0LiVIb
sXxp0DE+qpmQC/lewp0gn0PKJ/TJEA==
=1sxe
-----END PGP SIGNATURE-----

--X16MSWMy47KogHCw--


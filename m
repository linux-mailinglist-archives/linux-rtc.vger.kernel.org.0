Return-Path: <linux-rtc+bounces-1488-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66D92EC65
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 18:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C79EE2850EA
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 16:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B211216C862;
	Thu, 11 Jul 2024 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKgJRwIh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8320016B392;
	Thu, 11 Jul 2024 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720714334; cv=none; b=NiXdK7i/PK859xpOyP1EhwFU9AnbZWZanKTVuVGIfRyYG793rNIKe/BqIxVP157T3R5VCWbQ7y4jjQH+zwbc+riqyhqgVTBzt+4Us3+LIuPH+a9aTQRI4caObKyXxCAIZHXx1ynDyG3ngl+RDXo6VRpFCDpSYJZhP0mfm2HFH+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720714334; c=relaxed/simple;
	bh=vDhm4iKUhB3g5WYPqXvLPS4hLGM8VplEQMGAsbyCkEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCmifenK9Bq7AfX6OKTkNtB9TSR8StxkTYtBDO/+vZiWpNgv+K8kpIxBOURXo3+kC7MCYx4EJthfJKNNAGvoe5Os5dlRT3yIJPDdHKwYlbiiKNCI4m4mz8dn/dIXCCLlKGb1RG4FMfedpxrs9QEFSnsH0iJ7Rar+ITgbWW3vq8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKgJRwIh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBA9C116B1;
	Thu, 11 Jul 2024 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720714334;
	bh=vDhm4iKUhB3g5WYPqXvLPS4hLGM8VplEQMGAsbyCkEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKgJRwIhs1DxJsnIDW1XFs/XqXJ85ch+U8aMK0q0GD0pOVZ1B8BkefqWY8YLItxbY
	 UO0jpyURbrtaWDa0QlbCtHUdF6YDcvlOHWkXxTUi+SB0G9bKYO3vNoBeo/G5SZtUC4
	 lzu7rHIScDEgYeYH0V4+HA6xKfHOK5QfmSX785nNfw2YcSZht7+4II+9e7A/k8X4GF
	 +QSDHFFZ4HL+0TAI/4U35OBuje9l2Hl8wJo7EWqvF5w7xi5yZ1UUhcig+ShxQg8tax
	 d0oYNtiVeV0JSOYOHb+Yjum6mHCNEE067XEOc+aCyo/x9jPNXaA9MHKXU3NlFXOXkb
	 mtGZ8misgBGnw==
Date: Thu, 11 Jul 2024 17:12:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH] rtc: ds1343: Force SPI chip select to be active
 high
Message-ID: <37049fbe-6a7f-49df-a093-2f4f7351592e@sirena.org.uk>
References: <20240710175246.3560207-1-abbotti@mev.co.uk>
 <20240710184053c34201f0@mail.local>
 <2b0e8a6c-f89e-4d71-a816-9da46ea695eb@mev.co.uk>
 <bd7c0eb9-bcb6-42e3-8be6-3d07452e3fd5@sirena.org.uk>
 <6f122282-1675-497f-bc2f-0bbfba6640aa@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XjwW/yTPZkLPBfeP"
Content-Disposition: inline
In-Reply-To: <6f122282-1675-497f-bc2f-0bbfba6640aa@mev.co.uk>
X-Cookie: Individualists unite!


--XjwW/yTPZkLPBfeP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2024 at 04:29:07PM +0100, Ian Abbott wrote:

> Regarding `spi-cs-high` in the device tree, what about the compatibility
> table for `spi-cs-high` and `cs-gpio` active level in
> "Documentation/devicetree/bindings/spi/spi-controller.yaml"?

Specifying spi-cs-high should be equivalent to setting the mode in the
driver, it's just a redundant way of saying the same thing.

--XjwW/yTPZkLPBfeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaQBFcACgkQJNaLcl1U
h9CGJAf/c51MoOBzHFY//zUxIpeTgnJGKUmKPEYKHU7ChwWW4lT+r591AY0ZXH26
la0QF+IJVfDu0DnedCc9v/6+nBZMRrbuZOTLsYsr00+81/zlJc0Hccc1j0zmm7HH
lQd8+HzTtPJ58wbVgI/hAebpa16+bUTEJOu+Q3HLl4/XZs3IdHrO3ZJJFcrFadNN
EvL0HxIH5RgDlV9cPyFv0w+qADJv3L+tT6pxfhwjjlebEuVCfAPARGGeBD79gMtj
bloPG5AFKhwjv7eurs++K3XsaO4D3f+ztW5e+cJt3YbomXZWhWkm5PCMtik+W8O+
dolfsWp/5CA2O5/8V6moGqF2RWgoWA==
=0+8q
-----END PGP SIGNATURE-----

--XjwW/yTPZkLPBfeP--


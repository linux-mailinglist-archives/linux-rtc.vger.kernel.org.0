Return-Path: <linux-rtc+bounces-4908-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50506B578BA
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 13:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA10A1884F98
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 11:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAED42FE59F;
	Mon, 15 Sep 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1rIBLGq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D12FDC52;
	Mon, 15 Sep 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757936551; cv=none; b=AO9ADskXC+Nib4+G6DhDu5Cea8seUhyuWOZjcVDv/D/rfXbZVcO/J9jwWkmZsuEp5+SwUBhB1CmCRaS7kr7qP1yMZpLKfsDvV+djeQ54eLOdEUK2dziCUd5AhBi0Rw3ESM068Res48eYAAv7aDz7yT0F47tUF3vm3lgYLhsZZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757936551; c=relaxed/simple;
	bh=ajbPUytumu0CYluhZI1VFCY6fxojox7Qh/NgvsPboFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DL3pvXG+8WmA3t8uljAm0Cqnx4Bsp5IVEqN5NI6FZXCagenZn3EPoBukI4qAM2yvAZso66dtSd4yuDsWnQ/VI68B1OyjyA0FvwQljzzKDJgSl9mlrpIouYn2Fe3HX51vQe2wh6kt8zYAJM+wa//3r1QJLE5Au9pcxM6Ub0t8+u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1rIBLGq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF12BC4CEF1;
	Mon, 15 Sep 2025 11:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936551;
	bh=ajbPUytumu0CYluhZI1VFCY6fxojox7Qh/NgvsPboFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1rIBLGq1tBvYdIR7PEsmaY8uolPSNmShYsgQhMCF8ydQUZc/pI+e09ACURJ6WnoW
	 LpTkgnLXc+7f6IjlP2nIi0eFhimGYfO42x1B9yVVUcXNqK4phQdN/9KsBOjA8TWeNO
	 cTnK59Ht/M2WnqL1kR4OE2mXVc2n6NHl+mx4B9xq07KGZJXC9s/GX6lSkl7hPBVInj
	 V9rC6eJsCyck4qtIwyJ0YCD8n+Kw5RQ6A6SNi1db9ECX+Gl7rBFkfvwogOZc0u/E/3
	 IyH/cVLWtCfFtVkJvDVUbLW3UtlZrl8H1gOVGliWC0BlUYsAB7ixZv3BHTqwLw6Fw8
	 QAe75IVc63u3g==
Date: Mon, 15 Sep 2025 12:42:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 7/7] regulator: s2mps11: add support for S2MPS16
 regulators
Message-ID: <f1944f1f-334a-4194-90a3-946c57528927@sirena.org.uk>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914124227.2619925-8-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xI+eyQ6kVMST17yA"
Content-Disposition: inline
In-Reply-To: <20250914124227.2619925-8-ivo.ivanov.ivanov1@gmail.com>
X-Cookie: Use a pun, go to jail.


--xI+eyQ6kVMST17yA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 14, 2025 at 03:42:27PM +0300, Ivaylo Ivanov wrote:

> +static int s2mps16_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
> +{
> +	unsigned int ramp_val, ramp_shift, ramp_reg;
> +	int rdev_id = rdev_get_id(rdev);
> +
> +	switch (rdev_id) {

..

> +		ramp_shift = S2MPS16_BUCK_RAMP_SHIFT4;
> +		break;
> +	default:
> +		return 0;
> +	}

The operation should not be present if it's not supported, and should
error out if mistakenly called on an invalid regulator.

--xI+eyQ6kVMST17yA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjH+6AACgkQJNaLcl1U
h9D0JAf/USq3/KVRC+2grlWD9G3VRW4/Ag3cmNm3nycXs410YXU+fDOeD6mjUe4g
RRReRKHAZ/BUNq7ZdxhTuRHZpuRFL7lSgMNVqoPZUS4kOLkapl7qD7F8RRXW3kKV
mtQX+kOas8wEuZZEs6eX0idaRl4R2tIS9sWFqIyezfXBJjGijXoiPYR12BF9NWfx
itl9wA72GUDyhAJQNf/KMNqOVSFm+3aj+NWg/K3c8Y56J7yMW2+EOfpFGuB+1R0r
ZcIihamxSp1LvrsIOo4cwWvFrJUmWEpLaiN91JyaboAAdF8pEJXyilEfKXVhESuj
vj3ZwStB1FZaMP+m2NlXql8O4F3pHw==
=WpDM
-----END PGP SIGNATURE-----

--xI+eyQ6kVMST17yA--


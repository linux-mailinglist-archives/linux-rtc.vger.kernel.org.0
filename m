Return-Path: <linux-rtc+bounces-2562-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8357B9C931A
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 21:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 492AA28534B
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 20:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5606F1AB6ED;
	Thu, 14 Nov 2024 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kh8On7gq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226381A9B4F;
	Thu, 14 Nov 2024 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731615434; cv=none; b=Ri3/ro+d4s9WIHNTj3oiFHUnWVv8hiXFGweDt12jp86RDCPfj9+GzDXAfxRc+eKqDSs1qBQzdaMSLSjyjljT1r2x7Q07OWEvvJquOHGT86ATcZXsHZKmvBaO6f7RubmtzdZm/E26/YDxL75/1Uy5AxmXqrynC1qR3OktPwIVl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731615434; c=relaxed/simple;
	bh=yYJ83seyTbIkEkldRnTO7y9avHpL1XS7XndSlHwyg88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLrmqxIHzEPcwnoO9+itBvI+2qjPZDdAQgThZWHTdCYjDh0x30oRCKtveqRtB7zIgRMGKdjww69LOlRR7moOcEGrPljZX8b55hE1V6AMctmThKLiO0D7PQOvjIxh+8jLBlyPMX2g7yAfVP5RiQehVbWxwu4taTJL/6DGwxXAKtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kh8On7gq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B425EC4CECD;
	Thu, 14 Nov 2024 20:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731615433;
	bh=yYJ83seyTbIkEkldRnTO7y9avHpL1XS7XndSlHwyg88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kh8On7gq7Rv+KsOPVPqUnCk5EQfy1Ka+Qrp2jgMzkGNy8pmumvZ7SHxiPua9sDEpi
	 8Nhp0Zr+mJL9ABhDxKR3/W9gZ5LSP7wfwNrOAl29v2F13c7c2bQXOwnzXs/KabIrOm
	 E+nSRjMFSg3E0itVNxh9JZ2R9V/jem0QYGS/as9V0JRN2PEVFtcILBqR8XHRdjy+z+
	 eW+jgFfdvDROttYAHtBz6495OZY3n1xo4cB3ia9Xb6qaHiyf82kvgiPKOtopsx/5Xf
	 J8GaH+08m9kG0zrl+fu+C+vlsFXSjmcM7O7g3QqREEyCP7ChBPR1lIzECMOPEm3YO2
	 1Q7HV9/R3rzGw==
Date: Thu, 14 Nov 2024 20:17:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/5] Merge RTC Haoyu HYM8563 into RTC PCF8563
Message-ID: <20241114-pebbly-bondless-a3e1ded70840@spud>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T0BKHKFsJ6ROrSX+"
Content-Disposition: inline
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>


--T0BKHKFsJ6ROrSX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 05:53:50PM +0900, Nobuhiro Iwamatsu wrote:
> RTC Haoyu HYM8563 has the same hardware structure as RTC PCF8563, and
> operates with the same device driver. Therefore, since we do not need
> two drivers with the same function, this merges HYM8563 into PCF8563.
>=20
> This series was tested with PCF8563 and HYM8563 on khadas vim3 board.
>=20
> Nobuhiro Iwamatsu (5):
>   ARM: multi_v7_defconfig: Add RTC PCF8563 support
>   rtc: pcf8563: Add support Haoyu HYM8563
>   dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
>   rtc: Remove HYM8563 RTC driver
>   dt-bindings: rtc: hym8563: Remove hym8563 binding

Both binding patches here should be squashed.

Cheers,
Conor.

--T0BKHKFsJ6ROrSX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZaxAAKCRB4tDGHoIJi
0nVXAP9lP5qvW+8yZjRI90llmK9YqGs4I+F1C9FeQe+YF1am1AD/eExxghR4h7K7
OWfTsMUzGLSk2PrYAbFvMP5tnsseKQw=
=dkSo
-----END PGP SIGNATURE-----

--T0BKHKFsJ6ROrSX+--


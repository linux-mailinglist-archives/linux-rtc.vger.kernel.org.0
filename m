Return-Path: <linux-rtc+bounces-2051-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C115F983907
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 23:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 738FB282245
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 21:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E3E6F2F2;
	Mon, 23 Sep 2024 21:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scMkj888"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48703839EB;
	Mon, 23 Sep 2024 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727126494; cv=none; b=EavGUqe4K85iSjZkI2pKhzQzUZGkh14rF/l3P/CAdruwy4TSudooPUK3TcktTYXZfFAstKc1rNa/Fl6a6JPwK+bRFAtTPXZMlGHy4QplXBiKzSiys+d6WjyRph9/a3hbLlcjYdgwIES+IR5kGjU6p+rozXbKrhXa0I3Zk4XlfxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727126494; c=relaxed/simple;
	bh=PhVIkYYam35mTCNvxD8+iXXElx/rv7x57VwyLUJ2qQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHo3KPse2UN0FiByotPZ0JXRiDEKlDFyBnlpvEyl6A/ABzdtnrMr4qd6QiAWKwjq553MNnp92QPGdaI3VGMIRR9omuo6kQ+w/5fsy08hHjtBbm4hSrs9w+78tTRSsycDghd9t/CoWzyguMUswXLrbNamTsy7dxZJnxYrFd4wAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scMkj888; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C01C4CEC4;
	Mon, 23 Sep 2024 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727126493;
	bh=PhVIkYYam35mTCNvxD8+iXXElx/rv7x57VwyLUJ2qQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scMkj888oGGRxDs0fVHaWnf/HGRoWyuAPBbbyzGE8fB+Fpuj+QN931FnQS8yuGdo7
	 wufD/ODhnCFAZJZrJS9DaEoZsDWh1KQ/GRbWb9+LvSYpgEohlYJHikwCBeYKMe1a4I
	 NhcV6wUEEFSIcEHSer70MrIM2UWWDFbIARXiUGWDYuEWzuZ7Q/QWC/VZC8pcCmpBmA
	 JUbcRZKOzEY8joj9X/YRWMlC+Gh9vOrk5D2VyLXoCoA7IApQ1/AqSBdprsp06WbAEy
	 Y2hBhUDx30GpM16oqMkmGlsXIBanox+toKqnSqEHVGZA8401dK1ONqG65q/kS2F8Ty
	 xQtuvbzExBoMg==
Date: Mon, 23 Sep 2024 22:21:28 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	eddie.huang@mediatek.com, sean.wang@mediatek.com,
	alexandre.belloni@bootlin.com, sen.chu@mediatek.com,
	macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 start-year property to RTC
Message-ID: <20240923-breeching-trusting-6dc59af2dba0@spud>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uOMUhhLvLeNabVr3"
Content-Disposition: inline
In-Reply-To: <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>


--uOMUhhLvLeNabVr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 12:00:08PM +0200, AngeloGioacchino Del Regno wrote:
> Enable evaluating the start-year property to allow shifting the
> RTC's HW range.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uOMUhhLvLeNabVr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvHb2AAKCRB4tDGHoIJi
0nj7AP9LIRHDUXGKaJRyhWfKcV4KwbtbqVNur2OIJ/OgAOmC6AD/cy/Ivoq02P8w
1UtX0rheLn5Y9M9UzaqtpEjhgfMWbwA=
=ncCH
-----END PGP SIGNATURE-----

--uOMUhhLvLeNabVr3--


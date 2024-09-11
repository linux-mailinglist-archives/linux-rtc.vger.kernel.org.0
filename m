Return-Path: <linux-rtc+bounces-1939-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFD975A4B
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 20:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A92311F25415
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 18:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C5C1B5EAA;
	Wed, 11 Sep 2024 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ce0bn2Z7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18FC1B532F;
	Wed, 11 Sep 2024 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726078940; cv=none; b=SPgfmLvT60SfynQWavLUIUocAxzjkQV3vpxkoqDV240ZkER+YPP/0NkyNJFBBHHLHutXURckaZDlEvkysjyuFEiUd/fkc0MhtBxSeuH3mtjmMUjyQ3aibENAoGGoCh2UoBPClpZh89pNON/SHwoTUQZlcMipLioYcjmJ8WuljMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726078940; c=relaxed/simple;
	bh=sq6L1riuD7cYiOPQFSI+B1XybX396IaIpZo/NsjiBd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8V1pJpYJxisId4cinIvZZGJ2OXscS3K2bId8xibXoP+vMtqM+BFlYu5wrHu76+jsoe9TJPO1vIly87/JUUTvDENEbv2/7nWMW3pm39U5U73Fy8AW+djiteuPnfwNc0Zsw2DfSij/y1iKCTg/WecvxkzAqzWpGA9DRO73qsJk/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ce0bn2Z7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81A2C4CEC0;
	Wed, 11 Sep 2024 18:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726078939;
	bh=sq6L1riuD7cYiOPQFSI+B1XybX396IaIpZo/NsjiBd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ce0bn2Z7pSksg9myPrP48QMxeao7At5FjSiNq3OrZSVCjE+OMkjAdbsQM8H/uwxYA
	 R/0ZvCyn2Yk7467CqJeGO1N6a8l0TBY2b6gYyPtnK3Sl8PrXC0mq0p1AYYPY44OQ1A
	 aLIl5hCyXIwISmjIIU/YKKbbe1pcdaJGvClBC2TcpTeLHZ3GJBI20A8oQ9ndY5YnjW
	 RqmNyzaXs86/SJwMGh+oyj3RYL1MNE0fp4+XRzlIBRoantVJ193muP/3zAbvusBqhj
	 2lmHtTlsJPGpT/Ex/b9FzdW48s+F3hmT9XkKpYXRggBgaGncptoRHw2WxIZC2IxpeB
	 NtJu/EgRvLOMQ==
Date: Wed, 11 Sep 2024 19:22:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Message-ID: <20240911-caretaker-dropper-424e102f8634@spud>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JD2DkkPa7pLd/+PG"
Content-Disposition: inline
In-Reply-To: <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>


--JD2DkkPa7pLd/+PG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.

> +properties:
> +  compatible:
> +    const: nxp,s32g-rtc

Also, how come there are not specific compatibles for the two SoCs
supported here?

--JD2DkkPa7pLd/+PG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHf1gAKCRB4tDGHoIJi
0t5EAP4r4p2neB083wFlQCgpzYn7BnECuuACT395eRInNH9S0QD/TaFBcAJkS4dN
zvdU11oIk080BQJw4QJCusBJuusdBw8=
=r0Fc
-----END PGP SIGNATURE-----

--JD2DkkPa7pLd/+PG--


Return-Path: <linux-rtc+bounces-2511-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D164D9C4655
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 21:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881C91F22684
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 20:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038981AB6E2;
	Mon, 11 Nov 2024 20:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpGN5Kd2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676A156C72;
	Mon, 11 Nov 2024 20:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731355607; cv=none; b=k9wnKqqMIpP7x4dgY2EWf+pqHfJa3B/Q6TRwWSnRDERlVoQfVVaWiVbcF0WT8hUTLSSzeuuwZF5ZwN5kDwkPMUv8y0E2dNSN/qUymYrxfcD+ZvY1/wJopGKWfh00kFBwL76fMqHy/waaroBY75LWWs2SteYbXxCfIUqfgButP10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731355607; c=relaxed/simple;
	bh=8Hq+tW3dAjqM4zX1c/kgHv6haEc0h8N2F9jRDiNygsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iC3mw++jqmRL1rDGxeAl+m+DpOdjdd0F+noQKZ3Enlc22WLoD3S6ZxNTj8B1CvDXdIzkrabME0ITQfCANwyjD9bcFUKReJ8EGjC5wYDquAZGJUPjALQqu9QTVwlGOhdBScGih6k+iYWSfpTYOI0c0TIILbtTkL3a1VHDhRyvlMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpGN5Kd2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31931C4CECF;
	Mon, 11 Nov 2024 20:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731355607;
	bh=8Hq+tW3dAjqM4zX1c/kgHv6haEc0h8N2F9jRDiNygsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpGN5Kd2Y/nLGvgvrXtAZMi45Ndm8laZTz5FkkHrCsvZnyPkKMNevxE754z/AHX9V
	 6niA8GqYEKVGVGZAMN0jFEXuEnvJrKmLdEnGyrj0nQzYAEHnQ/u1Ro09sajig3O+Tb
	 nPMuqXWmOydOGYyfkp2X2zGkC1RlnDPAWNWO0u51weegndJU4DgBXvPwicCDGM8EjJ
	 oh9ZljbbY2CqavEtxEU+IgSXEEGF5Rs9IZ9MZhnxXb/0olbMHXODHaWnWVXLW5j92J
	 uOdbhGmPNy2R2R0+Jv8cgQMGhrx0tIxC/ZrY7ETna/gkJNSVZdu4R5yjGJS+8PLTOb
	 3wXp5U5mfwPSw==
Date: Mon, 11 Nov 2024 20:06:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241111-manatee-decipher-fb3d20982109@spud>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
 <20241111-guidance-theft-9d49ded4d9a0@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UQyWMxaK+oqp1iq7"
Content-Disposition: inline
In-Reply-To: <20241111-guidance-theft-9d49ded4d9a0@spud>


--UQyWMxaK+oqp1iq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 08:05:50PM +0000, Conor Dooley wrote:
> On Mon, Nov 11, 2024 at 03:59:37PM +0200, Ciprian Costea wrote:
> > +  clock-names:
> > +    minItems: 2
> > +    maxItems: 3
>=20
> You actually have to provide the clock-names, otherwise you can't rely
> on them

Oh, and drop the "rtc_" prefix while you're at it.

--UQyWMxaK+oqp1iq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJj0gAKCRB4tDGHoIJi
0j2tAQDbKn1iW014icnEi6FZLhMjczdSymxpf7fLWOoh7+fSYgEA+jBT1hE2Auy8
reyQsc7xvFaqhuzwDN70yRWFKwYhywk=
=VSRa
-----END PGP SIGNATURE-----

--UQyWMxaK+oqp1iq7--


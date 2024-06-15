Return-Path: <linux-rtc+bounces-1316-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D9A90982D
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 14:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E7D8B214AB
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 12:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB0E45027;
	Sat, 15 Jun 2024 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrB4kDMm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60BB45020;
	Sat, 15 Jun 2024 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718453792; cv=none; b=J5TdKdrRTchUHDLV34f1tOO2tyrv7GfVSQv4huRgVLgm6iey7yqn05EM/Aq6Snxt2HdaGa3gM4zbjmYHb74zdnSKF+vil11qdUKkUEg6nTwzhAmVHpWUUurHhG9NWoz8wNBblMMKJtNTPS2T+8IssllWozHh4sD030Uw1lVELZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718453792; c=relaxed/simple;
	bh=fIa7Fu5rfI4MXQKrG+JnjbyVR+srNml2BpZ8EMMTVxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYA2245R8iybNI+XqM+zQzD0xplkCqd7lI1k4Hd++QIRzTBZ8gO4Zvsk7K/7y8z67uaNb2vBzgo1181RvXWrwPMxpxYHj8FPhBz6DJNLrLvcQ1kt0xeX22ywNfwu4hk+7cmf5eplM3B1BkvNoos31LnSNMUPRsEJjEtmWYkCj70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrB4kDMm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7662C116B1;
	Sat, 15 Jun 2024 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718453792;
	bh=fIa7Fu5rfI4MXQKrG+JnjbyVR+srNml2BpZ8EMMTVxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrB4kDMmJTeiuyQOOkCj4Q1LDTg4yuNd0/ZYAsOv8J0waSVa1ZXik2Bpm2P4CK4rf
	 YbcrrqGPDTKuwAvoo0Hes0ybEH1p8RdUfg2WjrdtedCpK9UeFZtOsXjeCuOxK6IDeZ
	 s7cvjwzbYhS/QTkz614TYaOT4ab00my2nxTtvQ55BZgrLZKOgynNA/3p+BQ5RQvi03
	 WW4kobYsc/6i0tNLMEnDhQe6k9BUn2JOzdn/CKL3u3ihIzwO+qFJgpH8RLwG4HmpdF
	 H3p5uK6C6WjN4UFeAC69RiaY9PUL5gYmHJZd6Heef94qATd7ocJGPNLaFQpmsa5fGM
	 cHVCMxPnoflIA==
Date: Sat, 15 Jun 2024 13:16:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Message-ID: <20240615-unwell-hardcover-e95af7c4a43b@spud>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464811F43F19115FCF62A786C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <d6b4e0cc-c16e-4ea7-bbc4-ddbaaadc9a25@tuxon.dev>
 <TY3PR01MB113468BB7BC53E43F41C6D65386C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="clAPQ20Y+OV8szeS"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113468BB7BC53E43F41C6D65386C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--clAPQ20Y+OV8szeS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 08:22:57AM +0000, Biju Das wrote:

> > >> +$id: http://devicetree.org/schemas/rtc/renesas,rzg3s-rtc.yaml#
> > >
> > > Please make it generic renesas,rtca3-rtc.yaml. Future SoCs may use th=
is IP.
> > > So use IP name instead.
> >=20
> > From what I know the file name should correspond with the compatible th=
at file was introduced with,
> > and this one shouldn't be generic but SoC specific.
>=20
> I maybe wrong, I was under the impression, we should use "vendor,ipname" =
for the filename
> and compatible should use vendor,ipname as generic compatible.
> If there are differences between SoCs, then use SoC specific compatible.
>=20
> Currently there is one device, so not sure??

The usual policy for new files is "filename matching a compatible".

--clAPQ20Y+OV8szeS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm2GGgAKCRB4tDGHoIJi
0ihkAP42Coh08F/VL7TmA4JWvrf8daBenjco1rVFZ1mSY5Q7iAD8COSVRjBudGDs
xPkSHl85M/MiNRb4aFC6H8d+g8qECAY=
=P/zh
-----END PGP SIGNATURE-----

--clAPQ20Y+OV8szeS--


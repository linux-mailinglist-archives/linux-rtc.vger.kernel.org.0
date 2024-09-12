Return-Path: <linux-rtc+bounces-1958-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F097673B
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 13:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47A301F21B51
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 11:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADE31A08C4;
	Thu, 12 Sep 2024 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1GSRRtYG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2BE18FDCE;
	Thu, 12 Sep 2024 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726139667; cv=none; b=QC3cyfoMI1QQZm/p7JCaHkthihvK5GWA5uDV+WgbYwFDciBvu/xmb8SPpX2gkoTPtFIdYv6x5caXY3IcJSZtMHJZ7lyQahGkTh8j/c8d7OZ7tsfbz77L7NHmKK0K9Jg4KSBEI+sigEUC+USiTfkaFHr6i2hsTbUpdDkJPO2gD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726139667; c=relaxed/simple;
	bh=HtsM+VxZhjPJU4fx43uFacWkGy+3pESq3717kdumdWY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikjW/KDoD/sDVi9cPcGB4AD2kuF0WOsTryLddK+662pM3o9ixbe4R6niXT3ayA+RcWao9BIlFu5eG8AfQ6NBVjHn+AH1dM9vUk3wmbhlpD1cs+SSyXJyoTtIeUg+pTAKvtIaUHwGR9xaefqXKXwLAl7yq2655qdbfD8W48EIvjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1GSRRtYG; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726139666; x=1757675666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HtsM+VxZhjPJU4fx43uFacWkGy+3pESq3717kdumdWY=;
  b=1GSRRtYG3kne0Rt9kb6Fr2/XaegaYACYlUBob04NVATLIT1TFCiobwNv
   ZQyAPXz0ubeEQ7Rd7rO08sTWLzaKwustVgpS9COn0HqOtIeEvo59hdqC6
   O9SX+QfBVqwgUaWUAjZmmEDtOgrm5mfDHFvru0vs9xXxFhFPBrdY2TvIP
   1R73ceSO5DDz6SlveO14RyGf/n7Asg+6En0B/eXWjsixq7tCrNIkrWTwn
   9LEysHOhuIfUr97bwWr/9vp2+26bbV68YJgBZj1kVsEbG04CvtOBmHf8n
   EoRxNlNeZe40IunCpCjNGGNz1VT7QdCUuwunr8v8q3ga2K3oAKshRnidO
   g==;
X-CSE-ConnectionGUID: TSEKEgbySee3tgxdgYmKAA==
X-CSE-MsgGUID: hpV6DImfRbCEwR4vdx9eBA==
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="asc'?scan'208";a="31695298"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 04:14:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 04:14:15 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 12 Sep 2024 04:14:11 -0700
Date: Thu, 12 Sep 2024 12:13:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
CC: Conor Dooley <conor@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, NXP
 S32 Linux Team <s32@nxp.com>, Bogdan-Gabriel Roman
	<bogdan-gabriel.roman@nxp.com>, Ghennadi Procopciuc
	<ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Message-ID: <20240912-skedaddle-till-2fa6f44c6e66@wendy>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-caretaker-dropper-424e102f8634@spud>
 <2aa1d3ff-bc9b-4c1f-a6d7-5673981d0ed6@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="67j9pQMb7j95qvNk"
Content-Disposition: inline
In-Reply-To: <2aa1d3ff-bc9b-4c1f-a6d7-5673981d0ed6@oss.nxp.com>

--67j9pQMb7j95qvNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 01:55:34PM +0300, Ciprian Marian Costea wrote:
> On 9/11/2024 9:22 PM, Conor Dooley wrote:
> > On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > >=20
> > > This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
> >=20
> > > +properties:
> > > +  compatible:
> > > +    const: nxp,s32g-rtc
> >=20
> > Also, how come there are not specific compatibles for the two SoCs
> > supported here?
>=20
> Hello Conor,
>=20
> The RTC module is the same for S32G2 and S32G3 SoCs.
> Therefore, I did not wanted to add two compatible strings ('nxp,s32g2-rtc'
> and 'nxp,s32g3-rtc') when there is no actual difference which they could
> target.

Are these different fusings of the same silicon, or are they distinctly
different SoCs that happen to share an IP block?

> Furthermore, in the future I plan to refactor the common part from [1] and
> [2] files into 's32g.dtsi'. Maybe then such common compatible strings wou=
ld
> make more sense.
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm64/boot/dts/freescale/s32g2.dtsi
>=20
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm64/boot/dts/freescale/s32g3.dtsi
>=20
> Regards,
> Ciprian

--67j9pQMb7j95qvNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuLM4QAKCRB4tDGHoIJi
0kLfAQD+O/+GgkonKxicjUsL7SrcvVlY+sV8b5Kdlt7miFgIqgD+IznxMm4HOHQt
DIcJY2qgpodqDPsCOBIRILBEyuL7tAY=
=gT4X
-----END PGP SIGNATURE-----

--67j9pQMb7j95qvNk--


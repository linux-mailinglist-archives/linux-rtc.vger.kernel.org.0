Return-Path: <linux-rtc+bounces-1961-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863C9768CC
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3F9FB2112C
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 12:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6651A2567;
	Thu, 12 Sep 2024 12:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="MZkojX1F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCCF190662;
	Thu, 12 Sep 2024 12:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143209; cv=none; b=bm751R5mMNdOhsmpbtveO1XKza/N0iaqwNBiqZEWETg5PDiVOprkkrP31lzGGG/9kyfGLtsfrOogS0Z22Kuxxo0MIZbYgJw/7bMFKg42kRsTnWDkgEIuNrkkt1oRitklhaRKcVPPUFQrpQ/RI0SatC3D99AjPh1wWMqtIV/CsDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143209; c=relaxed/simple;
	bh=cEY1AOlL91/61eGcJH2ELkDPPzV3GkUqoGzJ0Pd46k8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxwaVqK0um+gvyklv9iVgCiPxOshwVgISNI+cp/1UtQdZPP7lmM1niYA6CcWJgEli+x0Kjzp6LqU1wM3G7+EdZcdJdbTbw3ZKDMXjifl84H1uOO1jWMMEFkdefhrIhZp5OmvS6b1zBoMQNXVD9iembUIqDarvhWZcWVA0tPuHxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=MZkojX1F; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726143208; x=1757679208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEY1AOlL91/61eGcJH2ELkDPPzV3GkUqoGzJ0Pd46k8=;
  b=MZkojX1FVGekpnNSDTtL1J7gAGbgz804RtSZ5M5cAXc3ymLQ6kNu/Xok
   80f+NkSKgkoZlh9FUEB6DwJGpqTelr0vmKjymnUacWBRZWPgpbNYduqUo
   QrojMtt77pgxpmDvSDd2c04BvtAB0dBxLrPudhQD9EQS54tDGR61mIn0b
   BczqKkVrCsIWyVoxCoiIatyOJ5FJUlTr4sx/rP1mxLkaR++gJyeJMGDmN
   G9saeRDmsuX6VuTV1tmiBDXX5CPLvsbl/+Rm2Aem5kl7GGxT3eIdRy2j/
   veIJjQQ1C4fDSTN7WYujwO9G/AkcTxb1ZgHEMDXG4jU4gTGf8a0EVs7Kr
   Q==;
X-CSE-ConnectionGUID: 18BxjTQpRoWaBWoUq6oHpQ==
X-CSE-MsgGUID: x9envEQaRfmwJpgwNfqwSA==
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="asc'?scan'208";a="262683165"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 05:13:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 05:12:44 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 12 Sep 2024 05:12:42 -0700
Date: Thu, 12 Sep 2024 13:12:09 +0100
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
Message-ID: <20240912-trodden-lens-1dbf15786960@wendy>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-caretaker-dropper-424e102f8634@spud>
 <2aa1d3ff-bc9b-4c1f-a6d7-5673981d0ed6@oss.nxp.com>
 <20240912-skedaddle-till-2fa6f44c6e66@wendy>
 <f6c4a4b4-d05d-40e1-8ecd-45df7cc21ebd@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T9fVS6fm1fe+YfoO"
Content-Disposition: inline
In-Reply-To: <f6c4a4b4-d05d-40e1-8ecd-45df7cc21ebd@oss.nxp.com>

--T9fVS6fm1fe+YfoO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 03:00:20PM +0300, Ciprian Marian Costea wrote:
> On 9/12/2024 2:13 PM, Conor Dooley wrote:
> > On Thu, Sep 12, 2024 at 01:55:34PM +0300, Ciprian Marian Costea wrote:
> > > On 9/11/2024 9:22 PM, Conor Dooley wrote:
> > > > On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
> > > > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > >=20
> > > > > This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driv=
er.
> > > >=20
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: nxp,s32g-rtc
> > > >=20
> > > > Also, how come there are not specific compatibles for the two SoCs
> > > > supported here?
> > >=20
> > > The RTC module is the same for S32G2 and S32G3 SoCs.
> > > Therefore, I did not wanted to add two compatible strings ('nxp,s32g2=
-rtc'
> > > and 'nxp,s32g3-rtc') when there is no actual difference which they co=
uld
> > > target.
> >=20
> > Are these different fusings of the same silicon, or are they distinctly
> > different SoCs that happen to share an IP block?
> >=20
>=20
> S32G2 and S32G3 are different SoCs that share the RTC IP block.

In that case, I'd expect there to be two compatibles, one for each SoC.
One can then fall back to the other, so the driver only has to be aware
of one compatible. Had they been different fusings of the same silicon,
thus sharing the same integration etc, a generic compatible would have
been fine.

--T9fVS6fm1fe+YfoO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuLamQAKCRB4tDGHoIJi
0pKUAP98pWkcE6doOXtn3+eXgRMuCf3W2atGBYQjaD33w4oQ1AEApWry3Dc81DSh
j2yu5s5TN5SXpWQAx1YS/GDpVTIlrgA=
=ZOCH
-----END PGP SIGNATURE-----

--T9fVS6fm1fe+YfoO--


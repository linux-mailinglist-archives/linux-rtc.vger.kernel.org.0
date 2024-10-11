Return-Path: <linux-rtc+bounces-2165-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08A99A17F
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 12:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E04C1F216AE
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 10:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D96216A0B;
	Fri, 11 Oct 2024 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fNUb/Ec/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5B212F10;
	Fri, 11 Oct 2024 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642924; cv=none; b=cBQqhCFZntK9Id8lHFLdo05gk+0dXcJ3nwaMFpHta8e0uJD80Ncs82XuyGIQgcd5TP2zONiV8ES9BE7Gv7EQSqIF+wBpc0CIWYRDlgDiNgr345bGHzPh6ClzsyiQuJtbqcl6i/TpQLA5560LdObYxWUt72xfRFg0IY7nYJyEggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642924; c=relaxed/simple;
	bh=xDaaMV954JgOdOC3UjDHxdfq1JycgOahpeicffIuOSk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCVnkVVJXuGGfKiC9A/sy7IfJLdQ758hljhYp9GdJT13eVPR+PkraiV2Ry+CjLiUBuRQ2NMS1iBS9mVNirPeA1AjHdqIknX7tg9x+l1a/Wi5ckUOJRhrbRm1twjDttBH0iOr/tfXY6DTZ+ClexVz4Mv2TsRQs299zVwpjINGl0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=fNUb/Ec/; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1728642922; x=1760178922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xDaaMV954JgOdOC3UjDHxdfq1JycgOahpeicffIuOSk=;
  b=fNUb/Ec/71v/1wwuxypXSItK/SLEmW7c/aw0k0CUw8bW0cl9ATLAT0gF
   SQdy4yvWA7Z8P+D7Kp/rEZtmght2IwTYHekcRSTtbrHVjVXyRzXXGOfJZ
   7Y4xc1QGQwfUzZXq/Q+N2DFaPhXuXRNgxXeM3LpJxWwIUlCcJl9hyVGtC
   qLXr7oWPMa+hcmcFCHGL4m4zA5LNeIIyRTp+BXk/OQs269Qc+ZSquhEAW
   Xg2/30p310HXmNEg5JMAd623Y4WJ2wZmk3k8BLN4OgOM/S9KhfCApEAbp
   PLbjA1kl3RPZCn1lchzCKH+QHMVQoTyq5TfAG0vqR8mFM+1wjVodLIYwA
   Q==;
X-CSE-ConnectionGUID: as8QRgjNQQawwZZSMUzNlQ==
X-CSE-MsgGUID: mmL5Iw1fTzS1MKGvv0+R2A==
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="asc'?scan'208";a="32706629"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Oct 2024 03:35:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 11 Oct 2024 03:34:41 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 11 Oct 2024 03:34:39 -0700
Date: Fri, 11 Oct 2024 11:34:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <alexandre.belloni@bootlin.com>
CC: <pierre-henry.moussay@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>, Lewis Hanly
	<lewis.hanly@microchip.com>, <linux-rtc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: rtc: mpfs-rtc: Properly name file
Message-ID: <20241011-jackpot-headsman-a4f3102e3117@wendy>
References: <20241011100608.862428-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yp2/InY8ltOqmIk6"
Content-Disposition: inline
In-Reply-To: <20241011100608.862428-1-alexandre.belloni@bootlin.com>

--yp2/InY8ltOqmIk6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 12:06:07PM +0200, alexandre.belloni@bootlin.com wro=
te:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>=20
> The actual compatible string is microchip,mpfs-rtc, not microchip,mfps-rt=
c.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

lol.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../rtc/{microchip,mfps-rtc.yaml =3D> microchip,mpfs-rtc.yaml}      | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/rtc/{microchip,mfps-rtc.yaml =
=3D> microchip,mpfs-rtc.yaml} (100%)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yam=
l b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
> similarity index 100%
> rename from Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> rename to Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
> --=20
> 2.46.2
>=20

--yp2/InY8ltOqmIk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwj/LAAKCRB4tDGHoIJi
0lUBAQDOsv1fHqDMB9UH0DYPgPNaoQMlKNyahPyNZECmJYC4ZgD/S3qT3a7q2n4r
g8u1OXsjV6JepssUrOl+xEBz8M+P4wg=
=dqUs
-----END PGP SIGNATURE-----

--yp2/InY8ltOqmIk6--


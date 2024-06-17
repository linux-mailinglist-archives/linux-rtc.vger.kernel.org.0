Return-Path: <linux-rtc+bounces-1341-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A890B4F2
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 17:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A03C1F20F5A
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 15:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F38158216;
	Mon, 17 Jun 2024 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6VDtBz2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E42715820C;
	Mon, 17 Jun 2024 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637444; cv=none; b=in+riuP82EBDrDH6DfDo2hJ2GoMBGMHxtepme/fGfYCPkj+3ULcky1O8bHb/jSznAhdoBUkcRMyiumD56S+yZQ1zAgOitUocc9urkX5zGAD9QzXpe2y5jT3vlzPtHyR9RObKHK6IQ9CzKgtqPFOStWDYWEPB2HjsWZ483A0yK1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637444; c=relaxed/simple;
	bh=nWUdZZx/qGzG/FxPtp0ZG7/Kb7lkI4Z5KRLX389IjV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/Ddr+q8O6KTduvyFJerGdAHLfXmIb6RJPGz7zcmuuc/+41q2EmB75CDO1gu1wRMJx/yohWtUroz6HwHbGx200oMBzRUlltKeYjyUPhlw7vMUfyttbZrjYWYYJohzbW+n6pR0XqbOso5NuUUxaz1xh+bdoSXpOB4ma7uHkfssmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6VDtBz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1498AC4DDE9;
	Mon, 17 Jun 2024 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637444;
	bh=nWUdZZx/qGzG/FxPtp0ZG7/Kb7lkI4Z5KRLX389IjV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6VDtBz2GFuh/TxFnY4X49pZjeVVBu5nIMDYlwWMkLWRpdz4ZxJU/hUnUo7J4XI8R
	 KJBs1Iavrtn+eExGCO30Pnp/fBIdU3X+dkBHUCiPX0xB8YwBMtrxavb0D0s+b61p1q
	 mCFR/Wt13TjCCgvI+EYLy0wo/qm3sDpb/8bPK6Au+pXVMuuX5I1jcXnBGRym/BnC/W
	 /+PuB6Ft2bwzn0sVdNPa/nZIgnGlMGtNKO97we7BrNTXelVyEl+cirCL6p30BZyq2H
	 mApEsOI6zs0WQCulEjFhLq6Xbr6UxNWqTv1TIefir2MhBayaKozCvHXkrlRVq75efW
	 vX24BdSAEcvXA==
Date: Mon, 17 Jun 2024 16:17:19 +0100
From: Conor Dooley <conor@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Message-ID: <20240617-pretense-angles-89a9396ba795@spud>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
 <20240615-clench-turbofan-024a14939897@spud>
 <7768f3e5-0574-4d9b-baff-8a35792cc854@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1CZXiZLzRX7MOLGq"
Content-Disposition: inline
In-Reply-To: <7768f3e5-0574-4d9b-baff-8a35792cc854@tuxon.dev>


--1CZXiZLzRX7MOLGq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 10:19:55AM +0300, claudiu beznea wrote:
>=20
>=20
> On 15.06.2024 15:20, Conor Dooley wrote:
> > On Fri, Jun 14, 2024 at 10:19:25AM +0300, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> ---
> >>  .../bindings/rtc/renesas,rzg3s-rtc.yaml       | 60 +++++++++++++++++++
> >>  1 file changed, 60 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzg3=
s-rtc.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.y=
aml b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
> >> new file mode 100644
> >> index 000000000000..0e17f8a36155
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
> >> @@ -0,0 +1,60 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/rtc/renesas,rzg3s-rtc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Real Time Clock for Renesas RZ/G3S SoC
> >> +
> >> +maintainers:
> >> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> +
> >=20
> > Missing a ref to adc.yaml,
>=20
> I guess you mean rtc.yaml?
>=20
> I missed that rtc.yaml. I'll update it.

iio on my brain, I did indeed mean rtc.yaml.

--1CZXiZLzRX7MOLGq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBTfgAKCRB4tDGHoIJi
0iVeAQDQW3L6bUxaaK9BZivyTpl6d1RE/8LDP4xCSlcihI4dmQEAryxnJuBTPBzG
/Z2Z9zQYf/Rz//QmZQsfOeAeO5lUwA4=
=CKsT
-----END PGP SIGNATURE-----

--1CZXiZLzRX7MOLGq--


Return-Path: <linux-rtc+bounces-1723-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6701295D31D
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 18:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A3801C22AFB
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 16:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB58188A1A;
	Fri, 23 Aug 2024 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjcWYOkP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4191412B6C;
	Fri, 23 Aug 2024 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430073; cv=none; b=mcCyB7QdaFr4IyGofz3dk2l96ElRujqwec+uH0J9ITQlmNbWc4cGZU5vQ8PVyIYBR3Dy2OFDu/6RdKrASyaJzFyULcfH2ooLYwfz1sZ6reON0wA6c8LsrzXYpIDtB3c8JOCxqfQYzEhp24QKH6hKwg9fe9W2MSeFAnuKr6gGsGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430073; c=relaxed/simple;
	bh=6ZTDNhXDl6c05tRMKVf0ZhASXXuFxe9MockPdGhtLGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6NraCdsR2nALLvRnR7W2oc11QxysUavu+gjzJkulejr35w661gapKQ/9ilyBD6B946atnQoODDxl8GLY0hg+oyqsD38ancWB2HPvZIlohiGEUh+Txcc5nfu7P1Qy/fGNWolTTHr+HcW8ZNF/o1K5alRYF50rD4qzcq2mBFx0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjcWYOkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D3BC4AF0B;
	Fri, 23 Aug 2024 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724430072;
	bh=6ZTDNhXDl6c05tRMKVf0ZhASXXuFxe9MockPdGhtLGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjcWYOkPAFkyGjdeYpW4eIPySk7PHr3dIaj9ezimM4dN54GrYqyRCMoB2cq70YB0F
	 JMMPr5X2dU1EuC93uvE8fPe6wfSQNucRsW8HNZKV56HHcwz9L2mNc0exp+TTxBQ35b
	 s9M96AkVX0X/5lAuPGas5aP5EdUXEY03EU7Ail7fD1GicxT0Xbfre8FW+4agZK2TGQ
	 7AkAcnzeax+uyGsIhs0yF8ugZs8eC+ymckeQzDmxEZDc+DT9GTuLrdkbewve9kNivb
	 pAzQiHtpG4HUdSUmm2by3fv46d+BsINV/8l80JgNvrYfTVB8HJUOCN4vbu///aKm8D
	 bP4aJHQfE5New==
Date: Fri, 23 Aug 2024 17:21:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 7/8] dt-bindings: arm: rockchip: Add Relfor Saib
Message-ID: <20240823-lark-regime-0d3ab4215d69@spud>
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
 <20240823153528.3863993-8-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KudtDxnQkUzFHTIL"
Content-Disposition: inline
In-Reply-To: <20240823153528.3863993-8-karthikeyan@linumiz.com>


--KudtDxnQkUzFHTIL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 09:05:27PM +0530, Karthikeyan Krishnasamy wrote:
> Add devicetree binding documentation for Relfor Saib
> board which uses Rockchip RV1109 SoC
>=20
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 1ef09fbfdfaf..29f7e09ae443 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -848,6 +848,12 @@ properties:
>                - radxa,zero-3w
>            - const: rockchip,rk3566
> =20
> +      - description: Relfor SAIB board
> +        items:
> +          - const: relfor,saib
> +          - enum:
> +              - rockchip,rv1109

This does not make sense to me. Why do you have an enum for the SoC
model, implying that this SAIB board would have more than one possible=20
SoC? I'd expect to see - const: rockvhip,rv1109

> +
>        - description: Rikomagic MK808 v1
>          items:
>            - const: rikomagic,mk808
> --=20
> 2.39.2
>=20

--KudtDxnQkUzFHTIL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsi29AAKCRB4tDGHoIJi
0j3UAP9CtNVsmtseZB0iEvfn9Gf/ujRFza/6humZZ8Ai8A2hZgD8C0uTkuqwGngk
Pk0WERcvKysuRMSFVF8tl3kXhq+UkAo=
=MkK7
-----END PGP SIGNATURE-----

--KudtDxnQkUzFHTIL--


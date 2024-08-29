Return-Path: <linux-rtc+bounces-1778-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D432964AEF
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 18:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE54286262
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 16:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A511B1502;
	Thu, 29 Aug 2024 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6EN2YXu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAC1A2C0A;
	Thu, 29 Aug 2024 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724947442; cv=none; b=dG9wb5kfJv3SwCIMIY4OPs3rngvVaZ1+sNMAnRPvY3yaRCFCZsltNPmlho4TMcCnAelSy7m+NVCr6nOm57twJ/ISelkudc6ax2PbK9xOziath3M7vrwfZ8GXJrwsSWhu7bcJAXhOD5/V2+5OI0R6n8xNTUjch9NxnYifoOH1QhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724947442; c=relaxed/simple;
	bh=O/DvXCbm0mUIBbuHpVMnROI8oLLkYu27ZqpxUyR7bTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEKZo/++dbtlxC+N834NESc8pukFS+sHN/hXF053kltcNr0/tiBgdbTQTfmiCCNHFdCpoyCGeyID22Kbaay4tFsgvf3Xiq84UvOnAOVmk5FGNmFo3+YFq4/fHSLrLXD2kvH20kU8htokg80iQm5tSEPsVvkXkD0jwL+METP7kAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6EN2YXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D5BC4CEC1;
	Thu, 29 Aug 2024 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724947442;
	bh=O/DvXCbm0mUIBbuHpVMnROI8oLLkYu27ZqpxUyR7bTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6EN2YXuiFQYBmMbVWVgvMX0quuqs7yvj0VwVFh7HsghFJPyy4TakqHucFkmMyLic
	 F1o1IH/OroPkgqUECEQDL1KtOdflpdtG5awAL5JDkLnvfiHLgq5ZiJCHov3DW2u7lt
	 NlwdNAQRm8ZXhQHIhCwf22f6jifguBR3/IVxbLxuHDe7CIWBMDTqree9biZKagUEVt
	 +OE1Xb8rfxsPJP1PIGm5ozUNsGJXwDdyhYAmpiWP+sAlP82v1nGBS6UKqTcGyJvdXe
	 i6oilR6vNRTWTyYOC7pdSWFvbnXObYkGIlSBKkLC4QeFvKtc7zS1tVbZosncrjrVdS
	 ZPT11Y0z+RTyw==
Date: Thu, 29 Aug 2024 17:03:58 +0100
From: Conor Dooley <conor@kernel.org>
To: gomba007@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, csokas.bence@prolan.hu,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dt-bindings: rtc: Add support for SD2405AL.
Message-ID: <20240829-reissue-curtsy-3c7c10d0797f@spud>
References: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
 <20240829-rtc-sd2405al-v6-2-4fbfe2624aa7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4SBVkb1i5yWqdfTP"
Content-Disposition: inline
In-Reply-To: <20240829-rtc-sd2405al-v6-2-4fbfe2624aa7@gmail.com>


--4SBVkb1i5yWqdfTP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 01:31:45PM +0200, T=F3th J=E1nos via B4 Relay wrote:
> From: T=F3th J=E1nos <gomba007@gmail.com>
>=20
> Add the necessary documentation for SD2405AL.
>=20
> Signed-off-by: T=F3th J=E1nos <gomba007@gmail.com>
> ---
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++

Both of these should really be two different patches, despite how
trivial they would be. If you resubmit, please do that and provide a
link to the vendor in the vendor-prefixes patch. Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  2 files changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Doc=
umentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index fffd759c603f..dae594626b2e 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -38,6 +38,8 @@ properties:
>        - dallas,ds1672
>        # Extremely Accurate I=B2C RTC with Integrated Crystal and SRAM
>        - dallas,ds3232
> +      # SD2405AL Real-Time Clock
> +      - dfrobot,sd2405al
>        # EM Microelectronic EM3027 RTC
>        - emmicro,em3027
>        # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index a70ce43b3dc0..bd8b279a5152 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -368,6 +368,8 @@ patternProperties:
>      description: Devantech, Ltd.
>    "^dfi,.*":
>      description: DFI Inc.
> +  "^dfrobot,.*":
> +    description: DFRobot Corporation
>    "^dh,.*":
>      description: DH electronics GmbH
>    "^difrnce,.*":
>=20
> --=20
> 2.34.1
>=20
>=20

--4SBVkb1i5yWqdfTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtCb7gAKCRB4tDGHoIJi
0pO0AP9nFYr5MAPzV6Djrk7CIqjBrQzH+sxexRRGqM2+/8lLFgEAmNT/FudTE89a
s6vnW2G/aGr2aeZ8rMJuNP4wo/xgUgY=
=8tXq
-----END PGP SIGNATURE-----

--4SBVkb1i5yWqdfTP--


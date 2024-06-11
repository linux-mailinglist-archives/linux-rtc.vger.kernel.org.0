Return-Path: <linux-rtc+bounces-1279-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307B904357
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 20:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74D5F1C2284E
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 18:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD88940858;
	Tue, 11 Jun 2024 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEPxnzB8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF274418;
	Tue, 11 Jun 2024 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718129789; cv=none; b=RtxiRcypHlQBDILSODBeNGxVRpJBx6dJ+QqRJOzllb605rd8pAnuo3UNrHuxAt3UVfTzpEVzL6xlY81KSNTgcFE8nru28nc1CKfwiG2KZQ/u6lX3yRaz50GMBJKE26bhZn6AklKchjAesvDpuEKcw2GoLCL8Uev83UMWAH5vkKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718129789; c=relaxed/simple;
	bh=QhiccRUa8nUsNwUtkF0DHVHRaqAFjgzP5RrKB+6T1JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQMvk29cuZ5pdYpRdxHQcNsniITSmJCuGViZluiWpsh8tDE3goO35BMvXwEaHaMsJOVeAhrDnYlJ39OwBvgpVqMNYNe6vCNnfIRLIoPwaEDmeHv7wfAJKku58HLqPzLc3SEKm/eM3cYTc2If0NpugLH9UQTqxwFfJljJeB2uy3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEPxnzB8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08239C2BD10;
	Tue, 11 Jun 2024 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718129789;
	bh=QhiccRUa8nUsNwUtkF0DHVHRaqAFjgzP5RrKB+6T1JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEPxnzB8t7dMfbQEPHmexKo0L4OWfieS9RXtZ4ZFc3/2fSzLcXqPQepAcvTrqtHLd
	 swqvZEK56Eai0ZNq9HFFFks6VlBoARyn+FIZNySty+FPp2GocnCdVhAkdDnOqpDRQs
	 wq1MUYKD6OWlM+vNeRH3hkV8OrzY7PU5ZVj/Ywnk0A2sbb0MsoC+LXX9uyoryiqRgg
	 Z7HVuzfDTubzLDmHXjYRWFW5rqFEtNiHOB3Au83wdMtTIR7+7QxfqhxnmAGVN2GAp3
	 A1lCO5FZvpfLxspUkn5zrF+iLAmcXC3F/AH7mhrHGwAAyu5UIKGM6C4/DfmLcDArhI
	 NoX7FEHV+mhuA==
Date: Tue, 11 Jun 2024 19:16:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: rtc: stm32: introduce new
 st,stm32mp25-rtc compatible
Message-ID: <20240611-sample-remold-a75d6f6515d8@spud>
References: <20240611161958.469209-1-valentin.caron@foss.st.com>
 <20240611161958.469209-2-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KKwSS3olauYNtTau"
Content-Disposition: inline
In-Reply-To: <20240611161958.469209-2-valentin.caron@foss.st.com>


--KKwSS3olauYNtTau
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 06:19:57PM +0200, Valentin Caron wrote:
> Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.
>=20
> Difference is that stm32mp25 SoC implements a triple protection on RTC
> registers:
> - Secure bit based protection
> - Privileged context based protection
> - Compartment ID filtering based protection
> This driver will now check theses configurations before probing to avoid
> exceptions and fake reads on register.
>=20
> Link: https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-=
advanced-armbased-3264bit-mpus-stmicroelectronics.pdf#page=3D4081
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Do=
cumentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> index 4703083d1f11f..65a8a93ef5753 100644
> --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> @@ -15,6 +15,7 @@ properties:
>        - st,stm32-rtc
>        - st,stm32h7-rtc
>        - st,stm32mp1-rtc
> +      - st,stm32mp25-rtc
> =20
>    reg:
>      maxItems: 1
> @@ -90,7 +91,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: st,stm32mp1-rtc
> +            anyOf:
> +              - const: st,stm32mp1-rtc

anyOf:
  - const: foo
  - const: bar

is just the same as using
enum:
  - foo
  - bar

Thanks,
Conor.

> +              - const: st,stm32mp25-rtc
> =20
>      then:
>        properties:
> --=20
> 2.25.1
>=20

--KKwSS3olauYNtTau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmiUeAAKCRB4tDGHoIJi
0vaeAP40eEjU5fOjvpKKJDIRxVKhVBgtjG8rxLq1chsBTt6ukQEAoXjCusbWQHYQ
5OMNChI7TBH/+N8h7CaL9XazCcw9CwY=
=91pq
-----END PGP SIGNATURE-----

--KKwSS3olauYNtTau--


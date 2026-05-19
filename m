Return-Path: <linux-rtc+bounces-6550-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAwAFuuVDGp1jAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6550-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 19 May 2026 18:55:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E8582B08
	for <lists+linux-rtc@lfdr.de>; Tue, 19 May 2026 18:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C653313B8B4
	for <lists+linux-rtc@lfdr.de>; Tue, 19 May 2026 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC234E3787;
	Tue, 19 May 2026 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqkpJkA5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB504A33F0;
	Tue, 19 May 2026 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779208655; cv=none; b=Mvm2xBZfk7zxBEQt0z6qX7Sm13B7JMPvuEsqrfJ7e1DitcCUvMECFiaPBawpYHa5fzlAtLGbbkhT+6a0AsWAtDf7BUEPDjS6RA6EENOVYag1vgdqUazluIO4YQswrlzsvUWDDhdW2pHToohcdDFQp8uv5dxjo7yfg0d07oeWrQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779208655; c=relaxed/simple;
	bh=nXLH0tkJ6RPAH/3BqTDoqsctKYpVGrgL/TN8VqnLZkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEoj4R3bUqqx4gyjhJRnYhnMplZ0v+HvdtM6O8eH6FJm7gXDrrzgR4WsTRhbc4EBvRsTiKYR30RrbIa947UnIpkh0DUkQjWhD03Ft7c5yZ7Y5SlAnjipGCU9IkC0nzkLaHLwoqYUn+wo9Ip/hoq9bJpuNvH6yyp9AQ/ZPi1Nv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqkpJkA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F60C2BCB3;
	Tue, 19 May 2026 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779208655;
	bh=nXLH0tkJ6RPAH/3BqTDoqsctKYpVGrgL/TN8VqnLZkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqkpJkA5InO1SyA2zR9VDsYzdqRyEGAoyJLPTNy+wgw2d/8XLzM6Crm2MCkv9up8G
	 iWrDJREUDxWLTFZLnUqKBfN5US8G6JNnJgO65AI7VPg4aqVb3A3S5KEl8h3QVdMVuQ
	 F2ZyAdtsMMTZAjbojPP0Sm54D/NF2OiKbtmQhJPZ+9kqDtqpTa2VPZQ1b4QpknAvix
	 rkR6qSj37T3qE5BIM5gs4kb6EwVdY8ori834fDyhUC9STwCe1NsT5iOoLKgxJaVHwE
	 +cYV6ok4k0wRI0/GWJJ/zOKod1K4pimD3+17bgkE7GEa2suEXxy3OEId/WVEso34F5
	 FKHZTJROrlXNA==
Date: Tue, 19 May 2026 17:37:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Teja Sai Charan B <tejaasaye@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Message-ID: <20260519-reference-scrubbed-be351df412d3@spud>
References: <20260519095929.76011-1-tejaasaye@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q8ynMrF/pYs0LOKs"
Content-Disposition: inline
In-Reply-To: <20260519095929.76011-1-tejaasaye@gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6550-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.70:email,devicetree.org:url,bootlin.com:email]
X-Rspamd-Queue-Id: A41E8582B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--q8ynMrF/pYs0LOKs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 03:29:29PM +0530, Teja Sai Charan B wrote:
> From: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
>=20
> Convert the rtc-cmos devicetree bindings to dt schema.
>=20
> Signed-off-by: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
> ---
>  .../devicetree/bindings/rtc/rtc-cmos.txt      | 27 ---------
>  .../devicetree/bindings/rtc/rtc-cmos.yaml     | 55 +++++++++++++++++++
>  2 files changed, 55 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt b/Documen=
tation/devicetree/bindings/rtc/rtc-cmos.txt
> deleted file mode 100644
> index 7d7b5f6bda65..000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> - Motorola mc146818 compatible RTC
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Required properties:
> -  - compatible : "motorola,mc146818"
> -  - reg : should contain registers location and length.
> -
> -Optional properties:
> -  - interrupts : should contain interrupt.
> -  - ctrl-reg : Contains the initial value of the control register also
> -    called "Register B".
> -  - freq-reg : Contains the initial value of the frequency register also
> -    called "Register A".
> -
> -"Register A" and "B" are usually initialized by the firmware (BIOS for
> -instance). If this is not done, it can be performed by the driver.
> -
> -ISA Example:
> -
> -	rtc@70 {
> -	         compatible =3D "motorola,mc146818";
> -	         interrupts =3D <8 3>;
> -	         interrupt-parent =3D <&ioapic1>;
> -	         ctrl-reg =3D <2>;
> -	         freq-reg =3D <0x26>;
> -	         reg =3D <1 0x70 2>;
> -	 };
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml b/Docume=
ntation/devicetree/bindings/rtc/rtc-cmos.yaml
> new file mode 100644
> index 000000000000..e368264ac483
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/rtc-cmos.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorola mc146818 compatible RTC
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: motorola,mc146818

It's not a problem with the conversion per se, but as sashiko pointed out,
there's an intel device with a soc-specific compatible.
Could you document that here, with a fallback to this motorola one
please?

pw-bot: changes-requested

Thanks,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ctrl-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Initial value of the control register
> +      (also known as Register B).
> +
> +  freq-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Initial value of the frequency register
> +      (also known as Register A).
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +
> +        rtc@70 {
> +            compatible =3D "motorola,mc146818";
> +            reg =3D <1 0x70 2>;

Please be consistent here about using only hex, even if the text file
didn't do that.

> +
> +            interrupts =3D <8 3>;
> +
> +            ctrl-reg =3D <2>;
> +            freq-reg =3D <0x26>;
> +        };
> +    };
> --=20
> 2.43.0
>=20

--q8ynMrF/pYs0LOKs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagyRywAKCRB4tDGHoIJi
0o6CAP4j2M/Yr+cksOURVOftThiiuq6DI9l5GLHK4GCmTeliQgD+OPd3ZJ9zJef+
P8uqrlqPOdGUmpNexYzpRYZ7bics+wQ=
=XXqO
-----END PGP SIGNATURE-----

--q8ynMrF/pYs0LOKs--


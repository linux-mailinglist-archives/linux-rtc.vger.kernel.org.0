Return-Path: <linux-rtc+bounces-6464-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFLnL0sb+mkJJgMAu9opvQ
	(envelope-from <linux-rtc+bounces-6464-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 05 May 2026 18:31:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 606B64D1516
	for <lists+linux-rtc@lfdr.de>; Tue, 05 May 2026 18:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EFAC3005991
	for <lists+linux-rtc@lfdr.de>; Tue,  5 May 2026 16:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263A148C412;
	Tue,  5 May 2026 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzYGnNwZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAFD48C8BA;
	Tue,  5 May 2026 16:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998663; cv=none; b=s4YgujMl23Wb2Fxht1GnDDDmw2bS+j554CFctwwBjAOrYXZ9n3nRC5KndxraX/D6jmKJN5s3UDOursgSbNou4Pp2GWWNgBvqpGFvZ0+lgG7II0fxAwWCtosmmQ6KgMUxMNDpYvCjUOJUp62efm4t5VyhMnKQdeA0fp66Jws8maU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998663; c=relaxed/simple;
	bh=gF0YOpy0AgSgb45W10/iDuugizyRyn5fWd2ue+rexOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Owq8tA5mZKHglK+6vOoWzkLwdwAXk+3G/RgA0DjisR0GLZmG4MzeTngoOCAkXi4RA/11fJ5miFBOKqmLh5Agy99DX7pchvBRzI+RCWA33M3Rc+iYfwlufupmXz1VkRrBcMkwO9Q6iWDq3p0yWQjVlz9ACSMFC+LHYfNzLlY/Rfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzYGnNwZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38049C2BCB4;
	Tue,  5 May 2026 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998662;
	bh=gF0YOpy0AgSgb45W10/iDuugizyRyn5fWd2ue+rexOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzYGnNwZk+DEt6X/IqCE9cbmjWS/OljsoHDDApVa/de2zbm+NxqABHSsf89h+Rc3N
	 3se0GBo4jnyFHHXerfsq0jtBZB4gJIGIgeQOS6R7gSfewiFTOgcTR5x05dc/kz6YgQ
	 TN5PDRBkRfYsdiDjUpCB013sTBnFLnytdXdmtMniNk4F95XEQpXuS6YRlz/vsxz3bj
	 slD1iapmnUg+y/Rjn/wBKF7fulY3JsmoeqYyhZoHnBPXsaocS311sYMM+0BMSdeN93
	 mWkHpZGJuyF+/7anivFIL37RM59pfGNqMUtqV28vlSOol52uhdXtb5RCnuykPyX1k2
	 B2ItOg0l8SGeQ==
Date: Tue, 5 May 2026 17:30:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, skhan@linuxfoundation.org,
	me@brighamcampbell.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Message-ID: <20260505-draw-unbraided-be4f74e38df1@spud>
References: <20260504183728.27412-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6jWYLpgRGISHE5p"
Content-Disposition: inline
In-Reply-To: <20260504183728.27412-1-challauday369@gmail.com>
X-Rspamd-Queue-Id: 606B64D1516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6464-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,0.0.0.32:email]


--r6jWYLpgRGISHE5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 12:07:28AM +0530, Udaya Kiran Challa wrote:
> Convert the Epson RX6110 Real Time Clock devicetree binding
> from the legacy text format to DT schema.
>=20
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
>  .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 -----------
>  .../devicetree/bindings/rtc/epson,rx6110.yaml | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt b/Doc=
umentation/devicetree/bindings/rtc/epson,rx6110.txt
> deleted file mode 100644
> index 3dc313e01f77..000000000000
> --- a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Epson RX6110 Real Time Clock
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> -
> -The Epson RX6110 can be used with SPI or I2C busses. The kind of
> -bus depends on the SPISEL pin and can not be configured via software.
> -
> -I2C mode
> ---------
> -
> -Required properties:
> -  - compatible: should be: "epson,rx6110"
> -  - reg : the I2C address of the device for I2C
> -
> -Example:
> -
> -	rtc: rtc@32 {
> -		compatible =3D "epson,rx6110"
> -		reg =3D <0x32>;
> -	};
> -
> -SPI mode
> ---------
> -
> -Required properties:
> -  - compatible: should be: "epson,rx6110"
> -  - reg: chip select number
> -  - spi-cs-high: RX6110 needs chipselect high
> -  - spi-cpha: RX6110 works with SPI shifted clock phase
> -  - spi-cpol: RX6110 works with SPI inverse clock polarity
> -
> -Example:
> -
> -	rtc: rtc@3 {
> -		compatible =3D "epson,rx6110"
> -		reg =3D <3>
> -		spi-cs-high;
> -		spi-cpha;
> -		spi-cpol;
> -	};
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/Do=
cumentation/devicetree/bindings/rtc/epson,rx6110.yaml
> new file mode 100644
> index 000000000000..32d15a014f91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/epson,rx6110.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Epson RX6110 Real Time Clock
> +
> +description: |
> +  The Epson RX6110 can be used with SPI or I2C busses.
> +  The kind of bus depends on the SPISEL pin and can not be
> +  configured via software.
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: epson,rx6110
> +
> +  reg:
> +    maxItems: 1
> +
> +  # SPI-specific properties

Drop the obvious comment.

> +  spi-cs-high:
> +    type: boolean
> +    description: RX6110 needs chipselect high
> +
> +  spi-cpha:
> +    type: boolean
> +    description: RX6110 works with SPI shifted clock phase
> +
> +  spi-cpol:
> +    type: boolean
> +    description: RX6110 works with SPI inverse clock polarity

These spi properties should be replaced by a ref to /schemas/spi/spi-periph=
eral-props.yaml
and become "spi-foo: true", unless you want to reword these descriptions
to make it clear that these are all mandatory.

pw-bot: changes-requested

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # I2C mode
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc1: rtc@32 {

Drop the labels here, since they have no users.

> +        compatible =3D "epson,rx6110";
> +        reg =3D <0x32>;
> +      };
> +    };
> +
> +  # SPI mode
> +  - |
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc2: rtc@3 {
> +        compatible =3D "epson,rx6110";
> +        reg =3D <3>;
> +        spi-cs-high;
> +        spi-cpha;
> +        spi-cpol;
> +      };
> +    };
> --=20
> 2.43.0
>=20

--r6jWYLpgRGISHE5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafobQgAKCRB4tDGHoIJi
0uYpAP0WA5K+8qHfZVSBOQnWTOBDnzoIDEoPv5IShp9c6lFFyQD+OYEUckJzxc3I
QLFfJm1NmFr/e85cZeyrDa21AEuHUg4=
=95g/
-----END PGP SIGNATURE-----

--r6jWYLpgRGISHE5p--


Return-Path: <linux-rtc+bounces-2271-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D29AB41C
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 18:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A5851C225C7
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 16:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F8D1B654C;
	Tue, 22 Oct 2024 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRBGzM9w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF0B1A4F1B;
	Tue, 22 Oct 2024 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729614959; cv=none; b=FFT+wc6sMSOmTsF/s5Co9+A/YJLzcG0/1DC8Lrh6slcU6ZCDQ5p0TuMbABXmkk8ziuhtan7k8+hDGGzREY1JotkGX+9V21vc9l6XuBWGJOJO9DVP0YZ35lu655v8PEeTjKVEKvjA1Ls505kzgHdK5a27HHUgB5wAYCXagQ975Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729614959; c=relaxed/simple;
	bh=HKIT1GB9I2Pw8GnpOIOFPtWfYM9DYHxHuIwKhIlijg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWbJbavyuAPV1rTMgvmtn/T8KtP8uWEjw8fm7+ySAxyC1AVMVgrCtiCNax9LqsyWNfVK/KLWG7wC2ZgGJYXT4Ww4HJ764yJ0zzKCMymBVRMi0OnIihhtaUgHDP0NO/Co2IFRdXqFoktBnTcA7yeRV4bUP92zbB5L/o7Wt01pWtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRBGzM9w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274C6C4CEC3;
	Tue, 22 Oct 2024 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729614959;
	bh=HKIT1GB9I2Pw8GnpOIOFPtWfYM9DYHxHuIwKhIlijg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRBGzM9wKsrl6QT3VYmwGf+KvBGLL5zGDbIC4bge1qldHREXFINHZY27hxLFQPEFp
	 VYUUk+J+LRsrMnmFZI2irDHu/3ooVJcbZyDxOvRYIcerFXA1CHm0zfzHaWvvM78/wJ
	 9jaFjPlSujVvuY6yT0MFrBeYsn1JwJLgu+FmFq8EWdLXx221o5ZtUVo67ItRqBJRzd
	 rXsh/Vz1A2wcbHCFibZHpsJY87es3J704EWGhrdjp3L7YpirmPgyoK+D+F5gaiUqIi
	 yEd1bNGlcHA7GDB+U5V6jAS79i69sn+H2OJfTWKhYDhTnPyxU5CtUc+CkhCobpRAun
	 T3o1C9YQmQNjw==
Date: Tue, 22 Oct 2024 17:35:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: pcf2127: Add
 nxp,battery-switch-over property
Message-ID: <20241022-radiator-blemish-3819dd4d94e0@spud>
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
 <20241022092855.1609427-2-p.rosenberger@kunbus.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+KTeWsQ8l8Yvriiu"
Content-Disposition: inline
In-Reply-To: <20241022092855.1609427-2-p.rosenberger@kunbus.com>


--+KTeWsQ8l8Yvriiu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:28:54AM +0200, Philipp Rosenberger wrote:
> The nxp,battery-switch-over property is used to control the switch-over,
> battery low detection and extra power fail detection functions.
>=20
> The PCF2131 has a different default value for the PWRMNG bits. It is set
> to 0x7: battery switch-over function is disabled, only one power supply
> (VDD); battery low detection function is disabled.
> This is the opposite of the default of the PCF2127/PCA2129 and PCF2129.
> With the nxp,battery-switch-over the behavior can be controlled through
> the device tree.
>=20
> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Doc=
umentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> index 2d9fe5a75b06..5739c3e371e7 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> @@ -30,6 +30,16 @@ properties:
> =20
>    reset-source: true
> =20
> +  nxp,battery-switch-over:
> +    description:
> +      Battery and power related configuration. This property is used to =
set the
> +      PWRMNG bits of the Control_3 register to control the battery switc=
h-over,
> +      battery low detection and extra power fail detection functions.
> +      The actual supported functions depend on the device capabilities.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 0
> +    maximum: 7

Beyond the fact that I dislike register-content properties like this, where
it is not possible to grok the meaning by reading the property, what
even makes this suitable for DT in the first place? Reading the commit
message this sounds like software policy, and that different users of
the same board might want to configure these register bits in different
ways.

--+KTeWsQ8l8Yvriiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfUagAKCRB4tDGHoIJi
0k4dAQD64SynLJ2HE4dFv/JDZwl8zoM2AKjat0CrtbfMq2E8DgD8Dlnk6fbrOQgn
V8U47+nzU4OyWKpf5IFuaVQLjBnDAg0=
=N53I
-----END PGP SIGNATURE-----

--+KTeWsQ8l8Yvriiu--


Return-Path: <linux-rtc+bounces-4051-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47632AAC9FF
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 17:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F1589827A0
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 15:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AF3285406;
	Tue,  6 May 2025 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kh8VxP8I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A002853FC;
	Tue,  6 May 2025 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546527; cv=none; b=bnF3A2BRotCl6lE49MhSEyzR1J2TP5h4HO5ohZ/MAjD3BRnIyv0MlNwcO0rhMGw7jNfwKyXHGE6IqMZoE5JmxpN+5kjIoE3+y5WhWwwXOWaZAWedPY+phoU7xOyrpDuAzdVdZwPvPmmT4ayYkHBTZo0PQDAWGQhOYKIrJxsg16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546527; c=relaxed/simple;
	bh=LL/6xDkSD1/0MDkC310YPOBF6wfTECaTbyABLCK9T+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZlPnexL/f1fXt6Cq0TUWmITVvrwEpEJGAkXzFdp14GmF2Uw1H2+R6//G+JBxm2HTa4IgJbl1did53P7KFmdngLfZWVNW8E4zT7gJ6X7f+gu1vZv5aBZ995wgkj0jX0qfL9qRMJWs3zqpQIunDRNrd1CU8ZDlSy2wOf1+hp7DbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kh8VxP8I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41880C4CEEF;
	Tue,  6 May 2025 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746546526;
	bh=LL/6xDkSD1/0MDkC310YPOBF6wfTECaTbyABLCK9T+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kh8VxP8IEXeGucQwn2yR/zw3AkNxZRKOrFTRPRIXqjf7B2gPuaj/sdmZb2kiGDAVv
	 dDZS5lPSYmHhEj5c/Kj4R0D7I+ghafukSsC6jy2vo5IQPilVohdtmHpU8EU8CejiB+
	 MA/UllmPy6jp6tTyFs9QHoeSrqIomgHofPIbsHRDlEQ2jC763VQKgEsFa5ZKoCzivF
	 EfHWYPVLAx5w96tsLUcB63ClB2RQTTUZ9jwwja1XnJyTlA15rH8TA0abGC2HcfrBWt
	 EcK4XD+tIOEQKwOIMBapt2eZkUMcwfO4PjuzyQQ0chgQDw4B7R6tB5R6S1IR5sKXSf
	 fKcbIuFE+sKxg==
Date: Tue, 6 May 2025 16:48:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Pankit Garg <pankit.garg@nxp.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	alexandre.belloni@bootlin.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, daniel.aguirre@nxp.com,
	shashank.rebbapragada@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: Add pcf85053a support
Message-ID: <20250506-durable-cryptic-24119a6e7dbd@spud>
References: <20250506094815.3765598-1-pankit.garg@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0wR+eHOwNpTPI9SZ"
Content-Disposition: inline
In-Reply-To: <20250506094815.3765598-1-pankit.garg@nxp.com>


--0wR+eHOwNpTPI9SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 03:18:14PM +0530, Pankit Garg wrote:
> Add device tree bindings for NXP PCF85053a RTC chip.
>=20
> Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> ---
> V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
>=20
> ---
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  MAINTAINERS                                            | 5 +++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Doc=
umentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index 7330a7200831..47be7bbbfedd 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -65,6 +65,8 @@ properties:
>        - microcrystal,rv8523
>        # NXP LPC32xx SoC Real-time Clock
>        - nxp,lpc3220-rtc
> +      # NXP PCF85053A Real Time Clock Module with I2C-Bus
> +      - nxp,pcf85053a

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
>        - ricoh,r2025sd
>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0737dcb2e411..d39fc05c6454 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17782,6 +17782,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
>  F:	sound/soc/codecs/tfa989x.c
> =20
> +NXP RTC PCF85053A DRIVER
> +M:	Pankit Garg<pankit.garg@nxp.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained

This looks like a hang-over from your v1 and should really be moved
to the patch adding the driver.

--0wR+eHOwNpTPI9SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBovWQAKCRB4tDGHoIJi
0pdkAP4tBxS54yfsXjb3rDyc/HUOCio3MOBQ502NNNXZ2ICpywD/ab24a01++WLV
TKm1JU5IlBvZuj88OsDFgFDjfPYxoQE=
=IBZ6
-----END PGP SIGNATURE-----

--0wR+eHOwNpTPI9SZ--


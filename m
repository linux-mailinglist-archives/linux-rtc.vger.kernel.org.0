Return-Path: <linux-rtc+bounces-2455-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0989BBDA7
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 20:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3092812AC
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 19:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9471CBEBA;
	Mon,  4 Nov 2024 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lO1yJ8Uu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CA61CB9F4;
	Mon,  4 Nov 2024 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747172; cv=none; b=QQFR6b3ACF/+y+07HrWrZIv9g6fXvqBRRuzXx3zzXk1Wn9soGwgYU4La6HN5//JGOzDUB42BwzVIyhFKTPZGJKPRFHGJaiNOJXPD21JdQZ8v1regMDe412Md1j0OTw7oUG4l5mOiPYQkgWThLPWSTdezE8L6JUnvuP2X0BJYwWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747172; c=relaxed/simple;
	bh=JBVrtATskCzv7INVkabkiMcc6JE0MwYvfyVsJYvZhrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLLYkB2JFI/WKKCk6fmU8kT8I9qG9XgqNNWuLnwH6efl8FyYW+GRCmD4VujjntM66upSbnmvjVD7727k++mLm10WmrriyrLKbgntROgxWW29wYKr+mz2Hv5QQzY0uS/EubHkaxINGXiMX190yDE1W4caVYcP4IWRC9YjtSekVWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lO1yJ8Uu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFE1C4CECE;
	Mon,  4 Nov 2024 19:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747172;
	bh=JBVrtATskCzv7INVkabkiMcc6JE0MwYvfyVsJYvZhrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lO1yJ8UuWs0hm/pLJA1PQGiG6WtNqyGjrC1KOOawFuZqT3AFTwBnyz4uTWAFMfOY8
	 730X+VFRdGcYuBMiE+xXlWuPwpjyv/GNDy4MQ3uA0z5IhJcUk+ht/sRoHe9Xtgu3Fo
	 3MD8FUbcj6WydEa8FxVTkLjWUaLq/ZuPG4YDEdcRf0nNnz8B9JQwFdK4pAvhCTUgyY
	 QpYrv7CJOSap1So3T7TxUlYj9ZdO9Wh8fKSE6Jki4xTU9CtmTGQWQ+Vr9g/L4X0Lhu
	 WnVil/tv/Lb+eQPkVd4279pQYiMRY5/B6sZ/dL/WQKwI6AeWQjzjnRUju8U4rzTJO5
	 FQ2hRII61InnQ==
Date: Mon, 4 Nov 2024 19:06:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: rtc: mpfs-rtc: remove Lewis from
 maintainers
Message-ID: <20241104-immodest-finishing-354430b8e386@spud>
References: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e/KpZXvkrNTSFxzZ"
Content-Disposition: inline
In-Reply-To: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>


--e/KpZXvkrNTSFxzZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 07:52:05AM +0100, Conor Dooley wrote:
> Lewis hasn't worked at Microchip for a while, and IIRC never actually
> worked on the RTC in the first place. Remove him from the maintainers
> list in the binding, leaving Daire.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Noticed him in the CC list of your resend, figured it was worth removing
> him.

Could you pick this up Alexandre? I've got no contact info for Lewis, so
I doubt you'll see an ack from him...

> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: linux-rtc@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yam=
l b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
> index 7742465b93839..59919a3e1c46c 100644
> --- a/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
> @@ -12,7 +12,6 @@ allOf:
> =20
>  maintainers:
>    - Daire McNamara <daire.mcnamara@microchip.com>
> -  - Lewis Hanly <lewis.hanly@microchip.com>
> =20
>  properties:
>    compatible:
> --=20
> 2.43.2
>=20

--e/KpZXvkrNTSFxzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZykbIAAKCRB4tDGHoIJi
0gQEAP9cbgDskQtU7bxwDBs12edEA33t0ckQLMPgWrOIJTXflwD/QJ8mrvzGxFkN
lBJWxJdHecJtGwvyj4JVcbSb1ZVFKgs=
=QbOs
-----END PGP SIGNATURE-----

--e/KpZXvkrNTSFxzZ--


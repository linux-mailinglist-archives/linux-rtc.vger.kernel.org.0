Return-Path: <linux-rtc+bounces-6256-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHI1OR4hxGmZwgQAu9opvQ
	(envelope-from <linux-rtc+bounces-6256-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 18:53:34 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 628FB32A227
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 18:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C7F3302C325
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 17:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9F63EDADE;
	Wed, 25 Mar 2026 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMjwEP+6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A53A16B0;
	Wed, 25 Mar 2026 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774460983; cv=none; b=AH5OkDOoetANmWUpRTDnLBXi8n7FEFMs6J1jCSF1PQ9uPCdu8I8jh8Qvmnv9+FiQfOQaQm+caCH25JguaWKpGndxcBfTUJsh9fjb3mJGyKAe6N03NohFvRHepkidhCzmONEyaSMw9IfvlbNpkWJjpJSC538mN/71Tk8f9l2fmMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774460983; c=relaxed/simple;
	bh=DXtnp+wMxtJFBTU2VZeVpqzL0GX1tWCUxADa+Fqi9IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXiha06qsuoDk7n3GCbIYBpJAkBohi3kicqFLciFavGFUOnUBDmjuhFrazOb3A8XFbyRvOHYypSc3wdG3o9WGRseCF2mfgkuVUFkuRxKCvPuxV0D9w35eZQMxdrmZdraIf5LJlzDoRu0v8wcaynUqKPR9e7KNz0d1EStZvmMs/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMjwEP+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A20C4CEF7;
	Wed, 25 Mar 2026 17:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774460983;
	bh=DXtnp+wMxtJFBTU2VZeVpqzL0GX1tWCUxADa+Fqi9IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMjwEP+6Dy3h0E8vbDv7WMaefbe92U6sGCsugAHjvUNnyueNWyr4I3VgCacAMYOWS
	 bcaHaiSkz0+QelMqrKXqs/iMCbvQo4xiaXCTmE+wM+XkqoslWgflNEfXIOOWLUCVe7
	 F2K1rhk50FUHlbFxV89hBvTX1f/JRbc0xun1EWGgITylZ4qKqPpnjyu9ZpRYvmUQWu
	 2Z8neszaFd1QrT6e4YBjWX32Bhu3zGNq8ybaGgaMKO0ETKl5ATAaHxyIaMe6RjeCBU
	 x5YIgOHq5GKFGKiWl4GEuXHDD0zD8ZpCB8rXxCklcKM7A0JYU/jWIyhYM6vUKtREz5
	 EYcU1icl9xTFA==
Date: Wed, 25 Mar 2026 17:49:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: alexandre.belloni@bootlin.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dsd@laptop.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2] dt-bindings: rtc: add olpc,xo1-rtc to trivial-rtc
Message-ID: <20260325-aflutter-waged-2c3af1f1bb4b@spud>
References: <202603250854523a8809af@mail.local>
 <20260325093003.44051-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wqIVxawSGUibAEuz"
Content-Disposition: inline
In-Reply-To: <20260325093003.44051-1-anushkabadhe@gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6256-lists,linux-rtc=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 628FB32A227
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--wqIVxawSGUibAEuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 03:00:03PM +0530, Anushka Badhe wrote:
> Add the OLPC XO-1 RTC compatible string to the trivial-rtc schema
> instead of creating a standalone binding file, as it only requires
> a compatible property with no additional configuration.
>=20
> Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> ---
>=20
> Changes in v2:
> - Move binding to trivial-rtc.yaml instead of separate file

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Please don't send new versions in response to old ones.

pw-bot: not-applicable

Cheers,
Conor.

>=20
> Note:
> * This patch is part of the GSoC2026 application process for device tree=
=20
> bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Devi=
ce-Tree-Bindings
>=20
>  Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt | 5 -----
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  2 files changed, 2 insertions(+), 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt b/Doc=
umentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
> deleted file mode 100644
> index a2891ceb6344..000000000000
> --- a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -OLPC XO-1 RTC
> -~~~~~~~~~~~~~
> -
> -Required properties:
> - - compatible : "olpc,xo1-rtc"
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Doc=
umentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index b47822370d6f..722176c831aa 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -65,6 +65,8 @@ properties:
>        - microcrystal,rv3029
>        # Real Time Clock
>        - microcrystal,rv8523
> +      # OLPC XO-1 RTC
> +      - olpc,xo1-rtc
>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
>        - ricoh,r2025sd
>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> --=20
> 2.43.0
>=20

--wqIVxawSGUibAEuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQgMwAKCRB4tDGHoIJi
0uq+AQDDRwPk4CZjW2War3mkb5oYAXtUaK1luHE0z3gm3OLsxQEAmfJbOLlfwEzq
h4Dc2wHL93iiB8rnJZ/Azguxyv5JGwk=
=eT2u
-----END PGP SIGNATURE-----

--wqIVxawSGUibAEuz--


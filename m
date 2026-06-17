Return-Path: <linux-rtc+bounces-6688-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pMK8Iw5uMmpUzwUAu9opvQ
	(envelope-from <linux-rtc+bounces-6688-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 11:51:10 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFFF69818A
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 11:51:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="XaPtupS/";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6688-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6688-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08852326FE28
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033C73D1AAA;
	Wed, 17 Jun 2026 09:38:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A48A37F732
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 09:38:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689119; cv=none; b=CPxi897XV5N5nPLaANZH/WEiDD+mdz2kWq3jdXzsnhFDC9oOk0yr2aZ2co5hV7tHAWd0oe9aviUD5LCtG2fou3+H22aV8GlNyZIWKg5OGwUEfpGFvi5a0mBhvfoJqN71FRx8H4VnixIPuUZQU0s3dW0wXr/fu7Mxf7LP7cUFaWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689119; c=relaxed/simple;
	bh=rgm36y2OpGnpfZDyJq45v+u5S54koPvVYpOixi6Jo6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/kT7o/U/XjKLegnjoNKDvMQ2jkYNwIZQE5qb+JtoZkQJ5aL9PIzKdd5LZL8TpEyjAo2P3Kydfq8uJlP7gqHL+Tj5VlFfiWbwz79eKnvV3VHCthMKfUXoUkM8ZiApTzR1IXKuXCOvLGQx4tdmttNQjCA6TxtxVXZ/1xfhXchAG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XaPtupS/; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rgm3
	6y2OpGnpfZDyJq45v+u5S54koPvVYpOixi6Jo6E=; b=XaPtupS/JnmjRKBJ4YPp
	0DigDPNogMfztF9OWk+MC+NvlOQB/SJWWIdeGMxxyt1n7b0tuu9g9nmSqmlbgmuO
	VErKW7IZ8TQXGF+jI3kqVpN9vSKEWRkTFhGNl6IwHtYXoufSPNq3P1tkCxn5yLju
	w1wtD5mdq7A+OoUg+eHwDM4eyx51jlDosw9198ziES7uqKuspNXH+3vuxdQM6iUL
	XQ7VuoJxe/k6vVCGWZ7KajoslCiBn0x7l6vCxOEtsHCdzK84IsuNPhlWFhuZxG4M
	IAcOp+JdkuaMFRHD4xoIs5UiwY7O0eIQKd8GfjTDlsdqyUS6Eupll80dR67Bbzvc
	AQ==
Received: (qmail 106160 invoked from network); 17 Jun 2026 11:38:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 11:38:36 +0200
X-UD-Smtp-Session: l3s3148p1@2HrX0m9UiKQujnvI
Date: Wed, 17 Jun 2026 11:38:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and
 RZ/N2H support
Message-ID: <ajJrG51jysbJQujR@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9KewOfIgVqcuK8jH"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-rtc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6688-lists,linux-rtc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp,shikoro:mid,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFFFF69818A


--9KewOfIgVqcuK8jH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 04:47:54PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add compatible strings for the RTC block found on the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>=20
> These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
> Unlike RZ/N1, they do not implement the RTCA0SUBU and RTCA0TCR
> registers. This is not a limitation for Linux support, as these
> registers are not used when the RTC operates in "scmp" clock mode, which
> is required on RZ/T2H and RZ/N2H due to their 195.3 kHz input clock.
>=20
> The RZ/T2H RTC variant also supports a 1Hz output signal on the
> RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
> marked as reserved in the RZ/N1 hardware manual.
>=20
> Update the binding schema to require the additional clock inputs used by
> these SoCs.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sashiko is wrong here because

a) TCR is the "Test Register"
b) TCR is not even present on RZ/N1D. Cover-letter misses that, too.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--9KewOfIgVqcuK8jH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoyaxsACgkQFA3kzBSg
Kbb8RA//b1xWUiwEPvJfSOWW96169F2XSyhe0K7AtnjiPwqycXdgnN67t/VyHqiM
ujexSHD/Xm5N/l2xIW7B23X+yXlMov5iZBrH4y1z2jS7DXafrlpyjy8CuINfUfcw
UfH9hBv4lUaudlXBXpHaofVlygOGHnCZQm8UGB6gyBPWCt7pK4hQ2Zq5EK4oMJDh
1yH0sZIMmrJLJwhECbtJFdcgoVxugiY4wdnjvyKZ+ukP/fTNYZJaDnwOf89uNMl3
94lsBSobIFs2x9k60KV1x8UKrcz0nuvbGOLzraplen1OrUmsUjgxtvbK1oe0goKV
nGoSHfIZXXULSvHGdSnMU3xWv0IPifJX+Mn3+QEsT1v4rhKLIyOVXwoQDfJk/BV8
0LaHrfy0v4y4Q94lchcm+SYBBUS6dE+O0GJQ9n1WCaXA4oYY2O0LO3wpaviVwftC
kBCatWPQi0AWe2IXUr/EOBaq4Z42XK+ecctJH4EBAbkRJZNveQ3nJea1TzCkmZ1z
vCYjtQ3vmDd+cfgtwuvzM0x++CTVmUbbY4P3HgQtpWX0k0udZ8EkWiIbFT+K1nm4
zYwGZdbg3hXJFQXM9NijCfv91lRUNnfHIivoC3IxtvXPPiMp4ItgsMHtOCoeWHNh
p2emQw6UibeA5ezXcnTGW8SD/dpmGUmyAshZrQ0yDVzq028LWE0=
=Y5jp
-----END PGP SIGNATURE-----

--9KewOfIgVqcuK8jH--


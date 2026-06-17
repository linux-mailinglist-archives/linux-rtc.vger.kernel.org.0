Return-Path: <linux-rtc+bounces-6695-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HeDWOdGAMmoN1AUAu9opvQ
	(envelope-from <linux-rtc+bounces-6695-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:11:13 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D9F698DAC
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:11:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=mRauZSft;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6695-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6695-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACA3A31F6570
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 10:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A2439B4BB;
	Wed, 17 Jun 2026 10:49:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FE309F00
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 10:49:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693391; cv=none; b=bHZNDHMH+VOACW72ffjBmyryCPYOfXWGcw1kNxNNtIJxcnr/0bzYczjMRqWigrugkxuxLhwC8NoeBH3Z8im9+2X6BAX/VfCB0YXQnphF0QoOnPIsbgDeo5VLWbq4hu9IQlXwPZXx5/1dMv1wMNeXl8baYaBwZTldnpoJVWkKxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693391; c=relaxed/simple;
	bh=Nn8wg+Z7wUOkFoafAMDetdLdfHYSTwcl3VKFqFeYQVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkKaqri24G5dPMAANRkyPPATmdAgwKGaEK+/0SZgbdwIO8otsofUR143Z6ZQB88pZwoRDzoB3rc40t5sA8iC/cGqJI3ZzxrD3kUtt+jKwtwtePKEBwJal2QIJ3ZrOrGW9XN6/xmh1y0Ult3z6X5KbaI7y5lJwB+CFnEfHSmZbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mRauZSft; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Nn8w
	g+Z7wUOkFoafAMDetdLdfHYSTwcl3VKFqFeYQVU=; b=mRauZSft36VdjuVkqN+u
	in674LwuXVeCuqVINMgKusKwc/ToKD9V0WqTpr1HSZ2cVbMZi9S4cL2boMgn80OY
	V4GYq/PBk3msrtAiOQzMa1EuELzwUYrP1ufK6+M1ecsoKIN9ynKJrbkPKDVxdezG
	xSrc4p7nR/uIjCWHcoRBMdz4hKFxbvdnn6ctUpVX3Pv4Zn9X2qU/1AUldogyZ26T
	0L6hNH70omm9PL159CEMsQqMko/Tg3cg2lsOoxIpNnBj2WvIhJW9q75JSyOezVHi
	9+mNKafLtWbkMH3QNmy6RoC9lzmRpUxM+S/Qs0VhWUAkH/zVs5SX34lGzaJgksas
	Og==
Received: (qmail 129810 invoked from network); 17 Jun 2026 12:49:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 12:49:44 +0200
X-UD-Smtp-Session: l3s3148p1@aS9K0XBUep0ujnvI
Date: Wed, 17 Jun 2026 12:49:44 +0200
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
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
Message-ID: <ajJ7yHNW9FnASuTW@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2C4IQubKzRsAj3ev"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-rtc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6695-lists,linux-rtc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,shikoro:mid,sang-engineering.com:dkim,sang-engineering.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55D9F698DAC


--2C4IQubKzRsAj3ev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 04:48:00PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> alarm and farest were declared as unsigned long, but
> rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
> unsigned long is 32 bits, the assignment silently truncates the upper
> 32 bits of the timestamp.
>=20
> Fix by declaring alarm and farest as time64_t and replacing
> time_after() with a direct signed comparison, which is correct for
> time64_t values that will never realistically overflow.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I need to postpone testing this to the evening. Setting alarm behaves
strange here for alarms beyond the one-week-ahead-limit. No error, but
bogus values. Seems to be irrelevant to your patch, though. Does it work
for you?


--2C4IQubKzRsAj3ev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoye8QACgkQFA3kzBSg
KbariBAAsh85CuzWt8H1+maznXMXpaoF/5nizSXqhd90y0Mh3tsMOJrw6eoH8iFu
Zy305N03nRDJPHNBXX/KzTfNnCbZaTVtrXq8K4sC6AaU69D3xAFaPAd5+4OG2nU7
Y1fQPTx5+GLP05CoBQcvbro82f2Bq7KjB2eEVJi0tZd53AgQ5W3q0eC5+soh5UWm
/N/Xpcd0DDTKzaINlQKiqTDSuxvvqKQf+YQKvoELLPAOLblE6POm9XR/Cyx0uQzx
XGVE8DK+MaxMh4M442CjHeW7iIB4wWXEdZpGSTKijjOsyfqZeMYSCxShPo/Cdx+p
CZtNOEDZL+0bqalhsDp3atWjK5N5/r66yNczdL1kOrLKVCdNcQXbTM5gcqhlt+eD
fDseLSjM149WRev0dGjBd0Hll7XkTiE+6uu13nBG7khwRt6nUKCZvJpwpaIb8cCv
BDnqhEI+kLs7zMKsGLhQsvYYRS1wgLIybHduFV6mzvmfKjR63Sj7ezehEDzmfiHS
WSa1iBOJ9qTJREUAug41C28BdxA3Kmvgpqu8PcOaDQtbILOQdo//E0750+04yUlE
RN5XN/MHGrWkmifey/PanUt2vr/PiqEOaSLLnFg9hmpaQeMI5Vtwgs6dr6qPZ4JC
6/DSdk6GvcT58r39TFVQBdMcI98urPlSzCr71aPlXgVpnFHeWU4=
=nvKZ
-----END PGP SIGNATURE-----

--2C4IQubKzRsAj3ev--


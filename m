Return-Path: <linux-rtc+bounces-6703-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qUXEBD6EMmpv1QUAu9opvQ
	(envelope-from <linux-rtc+bounces-6703-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:25:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4A76990C1
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:25:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=cz3cZLCm;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6703-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6703-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63A75310CE09
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 11:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0849D384242;
	Wed, 17 Jun 2026 11:12:11 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB42E739A
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 11:12:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694730; cv=none; b=uCMup16kWuWxZh+imvsDLqIddmF8clBW3Q3DahsrU/c/q6yj9p/RB6Wnf6Wh22UWdyUaNEtmFF1YOFiORM71T98fb8d+7cTlSTHKPcrNUNwffqSsG/KbPxGDTP75uTqVM130eGGtpTrE8duuHkQXBmM0E2CNoAGpCz13CZH25uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694730; c=relaxed/simple;
	bh=pqfx1Kz9Wn12PIFaf55ovBxOXez+eh0VV23VISnLVBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNpV/+6SA9+juVymNTiyNmKTpEU6Gk5WDcEjLnvusn86ipMNoJ+SpFnnp77JY31SGYqbxwdn+w2xXeIRMANC9XIaZDTQ7ihyc9HkUX1DKGWgwMN1ahzqqUSfM0uUmftCXNXET/UqMCfodg6iCM+X+vD+vqSmbpm564QAAba7Gss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cz3cZLCm; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pqfx
	1Kz9Wn12PIFaf55ovBxOXez+eh0VV23VISnLVBk=; b=cz3cZLCmGhaN3okhv6ue
	V3XbwjDFla4dDy7biZbA4wJgzOovjXx4knrA1smyakh242lT/dN9PUduIQTFjX7V
	YM5nWFR01cxHP8iS0TSa+aL09mhVuUz8NNYLS0R6cOxaa3WHVx+Oj06llfVf5TV9
	rotjUcHC1wxH40KSebI+oERV8Q0z2zAKfg+y3TTjwlCHp/+t8noQUemOiNoQ06l8
	dxVwqyNT9SFX/BsWgErSLiG7x6pvbYwXHo637CQCpL2lzvhBFZrsZpWjHvSvu5xu
	bczW2yS6n0WR8yDpUy3IKHWi/pqUSAGaqI07TacbVFkGcUJqbNC85oPyASi8mC8P
	2A==
Received: (qmail 137433 invoked from network); 17 Jun 2026 13:12:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 13:12:07 +0200
X-UD-Smtp-Session: l3s3148p1@Dk9OIXFUBM0ujnvI
Date: Wed, 17 Jun 2026 13:12:06 +0200
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
Subject: Re: [PATCH 00/12] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Message-ID: <ajKBBqJZssGk79dV@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJmacl9ZJtkoLyf@shikoro>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QZhgB7Djq8Hxo8mR"
Content-Disposition: inline
In-Reply-To: <ajJmacl9ZJtkoLyf@shikoro>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-6703-lists,linux-rtc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:from_mime,shikoro:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA4A76990C1


--QZhgB7Djq8Hxo8mR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I will review and test in on my N1D-board today.

Except for the strange alarm-boundary behaviour, the tests went well.
Will do further tests, it is probably not related to this series.


--QZhgB7Djq8Hxo8mR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoygQYACgkQFA3kzBSg
KbaDbw/9GG7nh3Fgh5SM6xw0smJjzDmMORq2jOlkPvZVFyypPhumd8th2/tMAjbi
8dqhmiUQMhutMWhFRn0SPCHU3hqbVxuzIp47VaJKOPzYF8CFHsNEm7y/gcdVegJG
s9rQ5fcWAkP8Jyr2Mi//3tNYXe0+soZqdREkV9m4Z7d724AZmuapm/QZtr0FaQ1w
fzpSzTKN9auZ+egqW8Gt8iUknwG1mLucr8zkVsH7AdslJwlQc7nnHN+1hg+qr98/
0F/mbTnr8lACF6U7VgIMKY82Y+UgS3KPe9/LvOVJIS+nyPmvhlTzao8ndSSZkpzt
+PY2D3bCYgSNhCq+LgpxoRbK3BKt+4h3DxOuYi7dA6sRjR+LzPB0QELbXRblOigE
NilH4dNe6AUQm05C1giTLcIB9bwH1gzCwbmWJVDYEqUNpOGvH+ILmDTVlqoRfW5c
1U3ZovEGW8whpRvHBYD3VtlBuYCictRaZeA9183xRWY1vhR14VQikVWxRd6zoRoc
f+dG65WJeCoY90r3yvju7Aiaa67HpSywjlxIRgyA+/txIXdBNO8J862qKZDeL7FF
Sk2uU1C1dYAxE+4R7aqKaEIKVSHceSW/2A3ydEMamKvdSfz6ry4sKmwZOoRX/Nmt
c+KlT+nGh3m8Hi22O4EU+V/2x0F7Tmivenb9NWFCWmuCk8WWtOU=
=Q3Hz
-----END PGP SIGNATURE-----

--QZhgB7Djq8Hxo8mR--


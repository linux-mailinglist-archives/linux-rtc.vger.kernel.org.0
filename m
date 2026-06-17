Return-Path: <linux-rtc+bounces-6699-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IbkOGWJ/MmqX0wUAu9opvQ
	(envelope-from <linux-rtc+bounces-6699-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:05:06 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2481698CA8
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:05:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=Pg7EPL5x;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6699-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6699-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173B1313A806
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 11:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C274D378D9F;
	Wed, 17 Jun 2026 11:01:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1953E30BB8A
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 11:01:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694100; cv=none; b=L4MdqBBWUBW6B46un7jREIuRq3Mmg3sY97klzy+w8DHp4+ZS746V70cKgv15D5iJf/1jPRmXMQuf2ocFvkqavcjPpz6fEODmU4hq+Eg46ku7+HHth70jTatsw3ngj9QPcv/nodmTL6spLDG5m2AZnVTqhqRF/f1wRojxgI1gZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694100; c=relaxed/simple;
	bh=Tl4Z4BqCviMYKctx1lwpEAGhFTPdhr4eNsYvfmtVgPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTU2OSpgiCKMG6vXR93qyjJNUuNp7n9AMNt3FEMwzXVFKJLDb+CieAuJsovPyjZovsuaw6hRmgwN8nlxcNaDkJwuCk6o+ecwbNLurlQMJH0MytCdKtL3mJNpd8fHT2Sb5jixzd0ftehHVgJObcD0TbpSFA23r3vorAuUvJ6c/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Pg7EPL5x; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Tl4Z
	4BqCviMYKctx1lwpEAGhFTPdhr4eNsYvfmtVgPo=; b=Pg7EPL5xj9Xy5YihZGHv
	Xw5TmWe87h5hNhApCLJHD2n5inPruExxvSWaYG/MymS08YpRVmQBwcLGNdTEkGqX
	eVNJ4vxgjD3JLymsLKs/EYuauKixyB0Jevq8vGpHsIR8UutjtYSvNaw7qHH078Xj
	IsXoKdCbvvAQq/3eonWnPfzlCaCAeT6zcgpJ4G4obTFbTTKdi5rYc/xXj7e6u69Z
	jZs8goNzb43hNmtAe+0+bxG6GpwuJyeO3IsOT6Kxsr9vj0L3nWauEZsn6aqnbaWw
	HPhm4sAV2mvI1UhLVSC7BxQwODL0kuqEEgHEVeGM3MSGIYhw7I8wnvTkDV5buoxg
	DA==
Received: (qmail 133539 invoked from network); 17 Jun 2026 13:01:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 13:01:36 +0200
X-UD-Smtp-Session: l3s3148p1@C+is+3BUCOgujnvI
Date: Wed, 17 Jun 2026 13:01:35 +0200
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
Subject: Re: [PATCH 10/12] rtc: rzn1: Consistently use dev_err_probe()
Message-ID: <ajJ-j4ZfLxOzltSR@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4MFPohSmB5fsdAaj"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-6699-lists,linux-rtc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2481698CA8


--4MFPohSmB5fsdAaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 04:48:03PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use dev_err_probe() in the IRQ request error path to make error handling
> consistent with the rest of rzn1_rtc_probe().
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4MFPohSmB5fsdAaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoyfo8ACgkQFA3kzBSg
Kbb2zA//abihGqxyQrIWaGjp/tCRstkxb6bNhljQpKadPNi/VlsfsK74WfRpkXbB
Yu9g9RcAun/2CjOnElNDt2joG9cz2t+xVC4KdDz+CuaewGSGUCSUEjEXse6isb1M
OolLTOF7kAOuob1VejivIs1qBkr66SsfIvsRJrzrITcS67xu9fT0yLsqk96EyjBb
z9/fJwE/Dk2lAMY/3TE1uhzGM8fRqwMoO+Wl5hcTMWcQQOVk6mAxm6Tv8QgWvdQm
RoQWTZybxQnEhtv373HiLwJR8CbtmST+LdLQKfZdkjTFSETRU0GC1rIDx9yFOmlD
LDgZyZDjPwf8nC3DJDhGxBS3Y+O7nnK/ksI5BMHYTXuuY6LPYlGSOo1yHuNrj/eu
qg3nU4KhyKsh2vFuMOTBmhufqzu7gEly1d3Ik9E1qld6jegCaLd+MaNEwKIPhocU
ncyYMrjvGG3gVGeTtSrIppAGkALdmaiJHrg79SuiqzGuQUoMm/ZEmy5tdScS+/od
S/rsIe+yv/nbob6Hlqk4a5S+GF562yi21owIpkwWQcDBmRbX+c3HIdCURVyhmJlc
AcEDAMFktqZ8+yhHyRQHAeYxbotAVno7S1Kwc8LYpI3RPBEtM7kH19fZSB4tyJeM
mufrP7xRXl6FB5t3fDVXSTh3gRDmmlYl3uXRxTPTU1QRiF4rNK4=
=FhHi
-----END PGP SIGNATURE-----

--4MFPohSmB5fsdAaj--


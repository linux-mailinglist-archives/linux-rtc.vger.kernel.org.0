Return-Path: <linux-rtc+bounces-6698-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KJp8DsF+Mmpn0wUAu9opvQ
	(envelope-from <linux-rtc+bounces-6698-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:02:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CCB698C3E
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:02:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=TF48Qm7l;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6698-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6698-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DDDC301D699
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 11:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1452E738B;
	Wed, 17 Jun 2026 11:00:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F122E739A
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 11:00:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694052; cv=none; b=qvRyDp3/3rwa1wdx1MVYX+QSfEr1ohDHNiSigOm11i2rUYDaHy59GGEY33RXfvNeNn74KHydtzeBEQ75qjunoX+D5ztGi86EcjoyLgGuhtAbCBmMCIVxrsf7PYet2zG2wYZhS7NmSYF/qqpzTTNv+SkoT4JcosxfreaatnPOme4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694052; c=relaxed/simple;
	bh=t/0M6FtlG2AhpicjI57jtSrBD7lIUbI6bhh1cBmC/hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVLxzS/llZyXC6kVHUy+VaqOkiD9x5UAzuPCwyYD7c9kC9GXv5J44gGxzbqcaPEJ4/ayyI22DDapbZij0PSOB3cfo13b7u1zW6nGAPEAYwU+6Q8COslAIdAn54N4ItQssMa706RcPSXoWWgnpvd0VQA3qgmMBSRKBwLAB17EbC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TF48Qm7l; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=t/0M
	6FtlG2AhpicjI57jtSrBD7lIUbI6bhh1cBmC/hw=; b=TF48Qm7lUd7Ct3VI27CH
	5foioDyJGTt5T96vTUquIrmQz8dqkMpUPwNh2ZLtABC4ZD1kcHaxcSzAOGjRlGRJ
	NbBUN78gWpbJLTvajnhHsj6HTFkx1v6PYE8xY8KPVEhZROKf15wPoltte6oJ7eZJ
	OZz3KfPQhvt4YI76RpVlD2UV0ub4QAI0JmlDJk3zIMqrgdSUj9m6pT3Vg65My/kx
	IgV2EWLZgpLlXI/+W8ChzYfwKmhr6xHnNGrROh5F33YVvQu5qdrndGn7i1enwMnG
	8A0EnIeK1PMNoprFD8TMVNEg5vzfvTF695i/qtsf3cvHVqUoS5KAqxVEfZIKTGXg
	xg==
Received: (qmail 133285 invoked from network); 17 Jun 2026 13:00:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 13:00:48 +0200
X-UD-Smtp-Session: l3s3148p1@pfze+HBUWMgujnvI
Date: Wed, 17 Jun 2026 13:00:48 +0200
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
Subject: Re: [PATCH 09/12] rtc: rzn1: Use temporary variable for struct device
Message-ID: <ajJ-YGFKIL5Ksz6U@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mNkDObJwTT0FPziH"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-6698-lists,linux-rtc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30CCB698C3E


--mNkDObJwTT0FPziH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 04:48:02PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use a temporary variable for the struct device pointers to avoid
> dereferencing.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Some churn, but still okay in my book:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--mNkDObJwTT0FPziH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoyfmAACgkQFA3kzBSg
KbbcNA//f8uBKI6kVyGhctFC4YwfKpMIFYHRN+Roo5MKdnP76zdgzeGzzQYvZ1U0
bzsMdlTSD6VKHFnxHlymQ62QRbLHHpQ4Z32j4loN+bbs0n6pnxYn9rqJQgZDW1uq
d0jgLNbo3YSLOb8sCvzlK6NtXWuVr8B/15kkU/CYC/wL6ATZUtknHhOaKnj7nCfj
zBCCI3/bqq9T1eFvvUKkF33AY7FeaVovE5fo1eVqJXHxFGKNCWuwR/pD+hNnOfAp
A4QMpP8H21JuqOY63JY/+5QKoINCH6PeIPg3ZgVRlkPVn7v10YKbM2y8VgKlxiuh
NevJyYsyLipIw0bTaRvDRtWWznstHrU04kP85o0sv4rFkarjKUJYOOssH6/Ow5AK
+lBLOOMSIuF2/8aNwrbJ9YjN9qF7/h0FfoHAgTD/yPB4J3N4UBIIK78CJV0vZZKo
0cR2VEGa93RqBqJ4G6wwYtynxKXd+mrK+Sj02R/RJEOjM0UUd8tozv94XVlGfQ3t
xIpoMHG51Sx9bNCv0hi9PRczJw3CtZbXcTd6PXMbtCt1dbP72dxyknymrKI9AIHx
dLd7YzfqgDZj5+LCdWvB+3PK8uCRsHxvnZ5DpqejXxopLcE5sOjpQpexrKC48HUF
XPh4+vC5xVxQgDY9Hg/tRS6lNYQ5m7g3+dJm1dkwQLRZgZKF6Qw=
=acJU
-----END PGP SIGNATURE-----

--mNkDObJwTT0FPziH--


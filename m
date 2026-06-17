Return-Path: <linux-rtc+bounces-6702-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CmYTGSqGMmrm1QUAu9opvQ
	(envelope-from <linux-rtc+bounces-6702-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:34:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6409F6991CE
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:34:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=KCnPNYAJ;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6702-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6702-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4F8D30795FD
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 11:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0809388E40;
	Wed, 17 Jun 2026 11:10:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025037EFE4
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 11:10:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694638; cv=none; b=ZoEwmpFRNHGunRNifT9IWYeK8yJdgcEPh2hr5AxfRT+3pvFdnZBhsFclyWIQLC5DHM2lO5hEqZYa2X4CH8Qd7bfPptWqQ8tjP0Kjugg4TeYhyeg6i1Zq435Jq4SDOsw3TdX5qSsw/QZBNfib7oeZfOF68MormwJdM8vgyhpLuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694638; c=relaxed/simple;
	bh=jrnjpfjWAj2gCwYMXgtp+HmbJSErYJxq9mIT1gb3HQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GabHOHGXOEczQFku69e1OyVRZM4usX7wP0CO9jezVqHOTQPIoFLr99P/oYI834TWauka5tNKZKiSJXraJO7kxDCWEZTUU+oO+SDr4ihl5b+fHLQk2m9bGD3FpbhThX0Q4TUa6hDO2oXRrhqC+nxjwKNvJXdVfCSdwql3+xM+LdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KCnPNYAJ; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FuAl
	Trj2AiO+4ixzIlxrsr0EN8qN3zNP8tpsHRx8xww=; b=KCnPNYAJ5bJhBofWStP2
	8GQ1leVhShAIemfP9olqqRlNKbBKI2jsqQrKvtGip/ABaa5KNOoyzjND2YwOVGZb
	YhrcbSSOYLMNHL7Gqv16J8MfMd1j2+e7GVN3Q+cDbBOCrxxjmLUEE4GEmy6fjdER
	XE/4DfibCA5FeNL2CCPGXakJ3t2kcwPUPhCGOqJE77nqjiURK9J2TzT+oDiskZcZ
	a2ve2D9oY3LuSQ87LRcGMq60Xauj9oQST8qSUd82/T0DBgN22DOQ6G7a2bm/DQXs
	fjRd9IXPfdIZ+pbgS33BP7JGJXCLcHM5r/CDo7CELZolU53xiKnYfW0RBul/5d2O
	WA==
Received: (qmail 136960 invoked from network); 17 Jun 2026 13:10:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 13:10:35 +0200
X-UD-Smtp-Session: l3s3148p1@jh7NG3FUKrAujnvI
Date: Wed, 17 Jun 2026 13:10:34 +0200
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
Subject: Re: [PATCH 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and
 RZ/N2H SoCs
Message-ID: <ajKAqn1F074JJazF@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="It5r3rNYSomVnrZg"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
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
	TAGGED_FROM(0.00)[bounces-6702-lists,linux-rtc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shikoro:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6409F6991CE


--It5r3rNYSomVnrZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 04:48:05PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a new compatible string "renesas,r9a09g077-rtc" to the OF match table
> to support the RTC IP variant found on the RZ/T2H and RZ/N2H SoCs.
>=20
> These newer SoCs integrate a closely related variant of the RZ/N1 RTC IP.
> The RZ/T2H and RZ/N2H variants lack the RTCA0SUBU and RTCA0TCR  registers,

The RTCA0TCR is also not on RZ/N1.

> those registers are not accessed or used when operating under the
> rzn1_rtc_ops_scmp configurations, making the current infrastructure
> compatible.
>=20
> The RZ/T2H RTC variant also supports a 1 Hz output signal on the
> RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
> marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
> distinct RTC variant despite its overall compatibility with the RZ/N1
> implementation.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

With that fixed:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--It5r3rNYSomVnrZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoygKoACgkQFA3kzBSg
Kbbs8xAAmX10HSwI/vLKRU9rI0perg+e+xnS5czN/LRlwyNmXDwpegfH2kjyclO3
lbdUwwN1WI7LAZtaWIW5Vhq3pJ5xiC3xP7i+pmYdBefXukLEtwjIQjKUnhmsoTWD
8FZj9O8x+4oMbAJ69mAvt3bDU+8OIrcdhfMO/+1TTXhF0wrjPVGUCwvaLfuBnshm
TtLDFWe8Wdq18C+yRe+DwoPODSAyZlXqxMYJFsBekJd4QvXWXy2IyMBUcR/Y+u9k
7asdbBQrEC0V100NgvHFMINGZAaz8PjU6TxKjKmoCWZtlPoCjg0MmqIDPLs7F/4O
ibPcdmkmg4Dat/WsWAc3aR7qZIPUcUQ8LDfXBLAdLmvv1jNLo3KvobDAJAI9XrqJ
y73e/Djo3aX8GEKT2OOc95kfvmBVzJVeh92Ug+DktLEfWfo35Jia0pdtWRAroAxb
IRBJXNRXYlwfXo2nseW4P+qURuyD3lgrc0jEeHFz0mnvWM71F/z60OaAPrI5KNVo
Ne7qYH/ygWzNn/H/kth2K1d30ssiMfdtxeyXffwG5P8/g2LwtbTzJRjphtR/0HLF
c7AIkKy2ji3paOXB0OmbiIT2yIKF424mC7U4J7piM0URhb1aEl1W//MaT5nqRXN4
pv0NPzQnyCZJAzcnf96Z8IrjtW5lkTUt0UyMm4PsOKVY2kUs208=
=pT8T
-----END PGP SIGNATURE-----

--It5r3rNYSomVnrZg--


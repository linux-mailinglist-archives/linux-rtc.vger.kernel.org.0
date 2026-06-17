Return-Path: <linux-rtc+bounces-6690-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QyMeFQ9xMmoe0AUAu9opvQ
	(envelope-from <linux-rtc+bounces-6690-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 12:03:59 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B26983AC
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 12:03:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=VDTL4vio;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6690-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6690-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7901A31B4C72
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9263CDBC3;
	Wed, 17 Jun 2026 09:55:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4F3CF1F2
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 09:55:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690124; cv=none; b=esSlgBpPu8TeWpRh28mW+GHMuVGg//xVPNs8hfOOGnrJx3xE8aWAz8iHR9DDKtTcBXVo+caD85LtBidi0oiROOyzWc7aQ3wnqDQMufGMoIVevQF6pVBV/k+YOKNQmz4if26bVDOv4/ATie3Gm6gBXF6pX26HwuQZy/cERNNhuV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690124; c=relaxed/simple;
	bh=/xDuO4a3wwE9DMvntr6l9sC3lXJwxvdOJnzzCkiARhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iB9SYAMWl9uK3WF8QqdNx+5WZ6JZ9kHUWstB2KlYeGIiVtPamCVQJTWcz/UI01axQcFW270CovP6MNOWhz4oJebok94Pz23oB8tE143OJ3hpKaY7yk8z3FKDhjh03/IDXjXi2+BtpXhsNgbNqIdwvCzQMMlAMxIjPWJYlxgUFN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VDTL4vio; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/xDu
	O4a3wwE9DMvntr6l9sC3lXJwxvdOJnzzCkiARhE=; b=VDTL4viopWQS36HZVS9W
	Fl8xANE8qKRHtJcVfLYbVNtGPXDorgid5b16p83Or/WY3TtJL7VvLj0FEWean0pf
	jiFFIDkirjnTFPe5IDf02+p+TLjUZbEE0fHKTGfzk+560PXEIZ5tKHKvMF1MJNOg
	RHELNXsbk4ShZQAxUwN/YLj6PBjL6nu5MV+Hoj2CXS5TDSIX24XmD8GS7yrEBCTG
	QOiDTrTI3F578TfcIk63ZuO7UXz0KjTvFl7gciE6soI8ZT6QDetBKCTpXITPKiKP
	4yOToZDSzHdSSXT5RU3+uSPJHd8RZ9NTZa0RmdeXYgSKLtcL6X4rQpT66iWWjEm2
	EA==
Received: (qmail 111445 invoked from network); 17 Jun 2026 11:55:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 11:55:20 +0200
X-UD-Smtp-Session: l3s3148p1@V2u0DnBUAK0ujnvI
Date: Wed, 17 Jun 2026 11:55:19 +0200
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
Subject: Re: [PATCH 03/12] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Message-ID: <ajJvBzLu0O5lP1fO@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4M1db+vqfnSrX48"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
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
	TAGGED_FROM(0.00)[bounces-6690-lists,linux-rtc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,shikoro:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A17B26983AC


--y4M1db+vqfnSrX48
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 04:47:56PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
> closing angle bracket on the second author entry creates an invalid forma=
t.
> Correct it to the standard "Name <email>" format.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--y4M1db+vqfnSrX48
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoybwcACgkQFA3kzBSg
KbbJbA/7BvivZjlnNS8uTVnRV/sJPgFBYYHOU2N4Nn/TJ/ldGLyl+Dr3H/0mBepl
PWe+w1aUdbPuskY5g3KGk+DdSX0YPBFIaKz8FKYknSuvyKRXrzzjug0w00HjNlQL
2jKs2GL1+m3KZkqhH6QJ5K/qu68svoQ5UDonkli/qyTBLMAuOujDY7DAAGtoCj8f
bDxsOXLVKntGSjvWVhJIbt35Umtkj5j0z6InTdioMp0FOqaiQsRwqyFjUJ3K/JDj
65JsTlwY9DBl7gz42L9kh1JbmPAFyaGb/4Ku9eScPcVKwfgA1QbezBYM3vMaLOsd
lEzPAOsZSMvwxWdBK33pOjKy3R4/+z87hJHHIk+nr+jjV4xfXabmY6RelGTt2PwB
4uPa/yg8T5n+NXOwWHbDssNW27JSb4F7/RDzBzWiN9aIBW4eo9G5356oqVXM2+L1
NB98SnwVE8w3i3J9g5POZOQnZCTybSUKYxGzxzAhKjypf+t0nwGBgvfITzpQND4M
81Fi8HHRi0cr1LB67YZar/nsmLjduK22TIgpj4nU8atA26F2nJBYj/u2klMtzgP4
Sn4jgxy+OXS29cAOtbrDN95SKv7nH1RFozgcnONSiRxAYx1xI9+v/1q4dH0hEBSR
CdNFHIUqClLy63zss5Uo/BDvgHnZrFJWkOKYPZW9T+kXg3tQBI4=
=CIPP
-----END PGP SIGNATURE-----

--y4M1db+vqfnSrX48--


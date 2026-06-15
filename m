Return-Path: <linux-rtc+bounces-6672-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fjZ/O24oMGrMPAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6672-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 18:29:35 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153C688610
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 18:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Smx5OMjZ;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6672-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6672-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BA45306BA82
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 16:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92EC40962E;
	Mon, 15 Jun 2026 16:22:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B69404BD9;
	Mon, 15 Jun 2026 16:22:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540548; cv=none; b=sMvLsZOukuhkCtgrOUuZXjD022qd6jAhiLeTvAlJHjva/6mmOPfzVpp8fermnU6iauWPT0JQ0imiCPtWYlVjK4e/31dkHbViWmHMrJDIahhs1ZOXSHx9whSfe7yKceHUuMaJ7nvpYNwbO5k6iCC/KuSHEaEpMDB0CC9ERlGNn54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540548; c=relaxed/simple;
	bh=ZL99LIkSmfCuu2ZPcaPH43OJHW+fgcXUoWcaJytU6y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvkUGkIy4nfoNnzZqPWETA7XXEMZZrQfpMoZ/zsy0Abc5YH3Fg3uboZJH26HJjAml3qeTMmdRkS3DqMY083zXyA920C/CJ72d9VyWIzNnfRkTjtHp05AZhSEIuaZzfa46tpVT7dQJ0T8IR0VC0P/bGkgVFZGsMZaK724znPLRdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Smx5OMjZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DE41F000E9;
	Mon, 15 Jun 2026 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540547;
	bh=ZL99LIkSmfCuu2ZPcaPH43OJHW+fgcXUoWcaJytU6y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Smx5OMjZYpEIXxjYpvupg/WYt/YuK3qXBkdpJDJ8HOrVBc9Aiiq/aknFUfdJ9q9by
	 roANGQD/Uc1VUVsE35cpUvQ8W5FH3ufsGwq+JPleg6GbqP5C2VsYUnR6SeqNGYqmY/
	 /VcHO5sAAthnPRN/c90CrWcOO77ODXZwqFMsbh/HBHvHT1YOGchpqTDzN7IAYIVI0u
	 pjcDgYJSxE05t8cqPDJ2hyPNFDq4h+84FZRGlpcVe3M1jEM6YVLfSw817mYwFENnop
	 O0Yci4RTGVYIQkwhDR7mbe9MwMiGdZviSiCbFhDId+arANhiZ9PB1AgZRhobIJxtFg
	 lbi0ZvaLZ8MAA==
Date: Mon, 15 Jun 2026 17:22:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and
 RZ/N2H support
Message-ID: <20260615-yesterday-saddled-d41792aea31a@spud>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SpV7twdmNb/juJoq"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6672-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,microchip.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7153C688610


--SpV7twdmNb/juJoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SpV7twdmNb/juJoq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAmvgAKCRB4tDGHoIJi
0hUDAP9iJBjB3lNC743jBeXutSciKO8Ww0dip07NxF4msIEveQEA9LBI8d/jH1tq
R52znrXWad9X3ihXtuTBEY4ELo/MMAM=
=0sPM
-----END PGP SIGNATURE-----

--SpV7twdmNb/juJoq--


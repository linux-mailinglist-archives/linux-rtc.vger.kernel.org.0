Return-Path: <linux-rtc+bounces-6707-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /wQFIdbJM2o7GQYAu9opvQ
	(envelope-from <linux-rtc+bounces-6707-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:35:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2769F5C9
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:35:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=bHr48bgJ;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6707-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6707-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C6BC3055907
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 10:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9E63EBF1A;
	Thu, 18 Jun 2026 10:32:09 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7D3DE42A
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 10:32:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778729; cv=none; b=XIRB7oO8iVDyJkSG4Q8s3RG6VoS+Kmwj8PZdq7GNP+bAqDYOEoMdstTgfPofC3+r896poqoNh62V4mb++ugg97EjvOPZ6tuVrPa/K9LXCnjAeeSuGyWusWysEGNHWlLfuHs5TzxuPk7MAd+uqQf4Weqwk6HBxg3vDEUix0dtl/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778729; c=relaxed/simple;
	bh=ICJbwuQFqJH3MjkBX87SVGN26zF29YTm5geT48J+HII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0abivOIpXZnS6us3KAmNgsKyQZsOokmfE5aE7seEeewpZBg/LB1iIsccb/DQQSTenExyez2twDy4od41MfDZlTHzTsJtYnL/3F7V/EXBKpRNYepNrIdimivmAyvqXvXUqzrj2BMDCdBS186PYRQWDs8fGzl4wY1ibtvs3xoIw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bHr48bgJ; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ICJb
	wuQFqJH3MjkBX87SVGN26zF29YTm5geT48J+HII=; b=bHr48bgJgAUMg08cQOIS
	euizn3I1bzIyaHb+5zQZvAN5PkcErCNwqM2VEIpfgrtBQymQjj3qKHwfmcppJ1/3
	699QurZnKh/r4KveKEFda1Spg92XW9APRgM7RxygkJ82evKL0mt8F0CZplspFnnR
	969/+Omw0K/7rcqVlJ1OwGtzGUimcpCbS2qvJvsBAi56kl+3vvv3E1etE/2nm+8s
	Pt3VG6OuZCUm8rWKrkwy84Rhe9+NQL0LFLlC9dls97bfSYhnP7tW/1AAVTu7j+I8
	81rHVAmrUt1uQcGwDmeTm/EfL+yjtdR6L702bLlcXcKCaHcfQ2tTM9/CuMH9os4v
	Ig==
Received: (qmail 525476 invoked from network); 18 Jun 2026 12:31:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2026 12:31:56 +0200
X-UD-Smtp-Session: l3s3148p1@np93r4RUhrEujnsq
Date: Thu, 18 Jun 2026 12:31:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
Subject: Re: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and
 wakeup capability
Message-ID: <ajPJHKut92mAoo-B@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJwqDt2jUfhSD1x@shikoro>
 <CA+V-a8uo9sr3m9F_MQYbHVD5wa3LT3n6MWrVpiNiPDumnVHMYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DD9Lvj8eqqR3LfjR"
Content-Disposition: inline
In-Reply-To: <CA+V-a8uo9sr3m9F_MQYbHVD5wa3LT3n6MWrVpiNiPDumnVHMYQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6707-lists,linux-rtc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCF2769F5C9


--DD9Lvj8eqqR3LfjR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> For running s2idle cases with rtcwake > 60sec this feature would be
> helpful. What do you think?

I think maintaining such a fragile feature is cumbersome. People might
have different expectations and the maintainers have to handle the delta
then. So, if we cannot to support to a large degree some feature, I
think we should just skip it. Until some user really wants (and tests
and accepts) a half-baked solution.


--DD9Lvj8eqqR3LfjR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmozyRgACgkQFA3kzBSg
KbaTXw/+Pet5isbeIJs7zEbYzaNpdqUKe6KH89BvH9pPeHMN9/t1eqDKoZFwDDyy
/3KUhPtltC23NdIVq9mY/LomqK+ObwCfIex9IG+REvShrZx4wdmqZPFEhtXMrT4d
E0YjwICgx/joHt5vW8GDBy/lgb4Nl7hMQxpJy49plaSUMKPNj2ZnpwzLawXum3Ld
xm87E96WnVKPOs5n5ceaOXAWkgidXy9tiyMtpehU5QFrCjQ8SMCPov9hn1ksDt6L
UdGa9W+INSUC62H0Wjr1naHnQCSyuAwkhvclSUf8p8/CWx7a+pAIeRaR2vHWJCTv
9vXv1KgSw4LpM/mrU4dJ4Cv1kqsARLzFPN8QDtTwQoLQ94F+vYPGZlRh47hNecnb
z4feFEibOktHLwzOV+2+N7mmr5rE83YU8Y7Y5SLOKmnTB40BuvZsIWko6ZrQuSko
Wjn4edQN++sCmHDSwjxi5fJiH37Uk1BbEvXTxIlNz6gfucGtij5Wu+PEuQ0+oRB+
aATyLT7W0w0g4mxeMr/HhSco1Z8LadhdyTBEHHnWHJ0U9O1izFxtGprmgzFXnpCF
khhXjixmCHiYq7WuS5JJMBmSeD5ZnvGbjQhAygfCniUALj98crZKmgOJFjeabZin
9K5Un+Emo5iwGUFfzmktI/JvLnWnLF5jkwGsRjOzoHKrAolw5EQ=
=kcqa
-----END PGP SIGNATURE-----

--DD9Lvj8eqqR3LfjR--


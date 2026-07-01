Return-Path: <linux-rtc+bounces-6807-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7b8ZAqvzRGqq3woAu9opvQ
	(envelope-from <linux-rtc+bounces-6807-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 13:02:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E89396EC7E9
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 13:01:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=UWxG8p5s;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6807-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6807-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 491893009F87
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 11:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C5C42DFEA;
	Wed,  1 Jul 2026 11:01:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6F442B72C
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 11:00:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903663; cv=none; b=Q7JEpWCrbTbDxHIJ0TPWFEqrVxm+L+CPTU5XFIi5LTU2cfz6c5w7z6It9NMwkWg84FMSE6QA8snJgNmv4porRGbJcDs/JWKUMCtU9SAy3HXuFqzKZl0YXNlmD9TIfnGAakRq9Sozg5B2KS7sMTlNlsbX1cf2I1Oj1FJhqOi4Qrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903663; c=relaxed/simple;
	bh=UZy0n/01gszj1LovSYaViZ/RBxd5MKpgSyrcZMJ/Kgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SL/SMK7vI7RDhUp3iL1CiWbN8q0Rr0xBSMKIvFAe6pEWyEGzhyAAcMZODL/lG3iuL9eVUQ8WqouDTEpNxZv7NoiA7MiHmamKQtBQ/AatbMsALbuqT9/KDuRunzxjhu4Dwi9J9TQuSO3GhQ4hbiQUWwxVva/PZKMqpxJr19/3UZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UWxG8p5s; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jHv5
	jf6o0MBfPU0bNEf/sSgaluNexXsyMjiq7q5MTFs=; b=UWxG8p5sAeTl4gF/M64G
	GI/za0sy9zeCbmwNh8AGmiiYTuaMbAn1fKCef1xHAabmKteJiX9yUYV4lSfsAZZT
	kjk8Xev6AaIwtD/uOwsA0v1bHWqSp/WFc4ARm+weO0RPZcLkQGDtP/OJLfybaI6d
	p2UcErIPx4XWSDy8D8xf4OPATL4I0ohgmnLiQHaQ5Et0AXfY0d7/yQjZMYnny3Tb
	pPJp0xzz6iqecpUFYnp4UImVfb6YISDPmZs7iEKFkc4pLPUX0bWm3vocEV1S8P4Z
	Bcx9S1LpqlSElb1/8JCFiQWgCErlgF14qK7AYz2Pt9hWPB+Bw/oY5IQz61I/UvtE
	Nw==
Received: (qmail 667004 invoked from network); 1 Jul 2026 13:00:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2026 13:00:51 +0200
X-UD-Smtp-Session: l3s3148p1@FbLPmopV6FZUhsc0
Date: Wed, 1 Jul 2026 13:00:51 +0200
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
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
Message-ID: <akTzY0hQqwAprV4g@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJ9kNJtrY6DyQ-S@shikoro>
 <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
 <ajr1wXCI2U23d1sY@shikoro>
 <CA+V-a8tfb5YFsh-K5F8OOBsuJi0PG72vQ=2PQb2avVNF8-kcrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6yLW7/UnYGTOQ+QC"
Content-Disposition: inline
In-Reply-To: <CA+V-a8tfb5YFsh-K5F8OOBsuJi0PG72vQ=2PQb2avVNF8-kcrQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6807-lists,linux-rtc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E89396EC7E9


--6yLW7/UnYGTOQ+QC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

So, when I improved this driver back then, 'rtctest' from within the
kernel was my reference. This test still passes with the current kernel.
However, setting an alarm one day in the future does not work for me. It
just stays the old alarm. Without your patch series, that is. So, I
think this issue should not affect your series. Especially if you can
set an alarm more than one day in the future (and less than a week, of
course, because of the HW limit). Can you? I recall I had issues with
RTC programs compiled against uclibc. Despite I am sure I used a
glibc-compiled version of the rtc-tools, I need to investigate this. But
not now, but somewhen. I have to take care of other issues first. Let's
assume for now that I am the problem.

> I ran some tests for cases #1 and #2, and we see an out-of-range
> error. By adding a 1-sec leeway when checking the ranges I don't get
> the out-of-range error. Let me know what you think (I'll create a
> seprate patch for it).

=46rom a glimpse, I think -ERANGE is correct. Increasing the already
calculated 'farest' doesn't sound like a good idea to me TBH, unless I
am missing something.

Happy hacking,

   Wolfram


--6yLW7/UnYGTOQ+QC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpE814ACgkQFA3kzBSg
KbZuQw/9F8vOkvGVvom2XSpAo4p7tOaRGeP4N4aAoV6daZ1amS+Nqy9Bo2Ydd4yz
Jj1JWxrCXRy8aagau7ITRF0jAQ7Eh+bSo5ZFdK8Iq+6mFozyhAAPUBqqBPHQQMGl
t021ZcvrBDevjpwuXkoWz0ka18MrleDAiRuN0YPLXtUzq4+oGIrlwCtPgzZpERv4
rIIv5A1h92HtQVee59fumaPO25w9Wgy7vG3zZkiyhxRSr6DMUUj0c0bDgOlnt4xE
xIW5qHoLWrN3Lg8DtAfflkMrWPJXNksot+583+33UwyA5fVjkfKhigBCGNapZESu
cPKQ1BIGnBktKQieQG59XFuDzxTslJhSQ/APxCMbQ+Nj+gl5c8xQZosnmTv+KjuX
s/vEUtw208jrg+NO5rf2hd8tilRX6OYKRThTC9ml3B6E9x66REu6WcyDGw4WOGOY
42UB6a0l1+rM6BNz22OclrHiCbrHZavF+9XeeDrIl72wHwsirJNfnkSrNqOrI/KV
Bja1xsHAnW484NlR+FE1+yxWYaZkWYcRqVvx4QO6CReCvlzkn6WdNtMvtTQGBCfs
xkkdKLPZAJafMbiLsDHdPxV+lZkx1zW/wmZ84LjLB3/BYPN1CqWjy4jH8hVIFCwN
S/5F2yikYzWobxgDDYvH19H/XWHq8SfUJ4zqS+GwcqufreyL17M=
=Nc8W
-----END PGP SIGNATURE-----

--6yLW7/UnYGTOQ+QC--


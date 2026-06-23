Return-Path: <linux-rtc+bounces-6729-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dJjKJdD1OmqXNAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6729-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 23:08:32 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E29C6BA337
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 23:08:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=OuSaxk9E;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6729-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6729-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4841C300D7A6
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 21:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C383AE6F8;
	Tue, 23 Jun 2026 21:08:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117D392C3C
	for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 21:08:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782248904; cv=none; b=adSu0M1UXIOq0E5XHiCJJ7bAZbcILL2vnWFbGx+1pq71S3NC6+DQBQoVhBqS6HWulUHhoz7c6e5fROKVm+XlmKiuuurigbB1PbaAg1cOwcXr75XaJYSkQaOv9C1nosOcAvd4QRhnR/K72scUnGyw5Li0sAcsX50o0pxgybiVifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782248904; c=relaxed/simple;
	bh=bH02PQgUP+LOytn8ULqS+x6+APWJqOhdUw98JalmD0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bdey9MVgtxiDTHHgG5w5EhtSr4uT4BLJnOv6jnfrvZw+aB0aOBMI6M469sM/SFF2Onwr2bWzebmjgTZQRWdAzxllYTZhM0Lv7SDbYf/KxXnecnptaohSIHypw0y6yKEvHaxoHYyARE3a3gfS03gSQt2W8hojuMh7xctDAWb2q1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OuSaxk9E; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bH02
	PQgUP+LOytn8ULqS+x6+APWJqOhdUw98JalmD0Y=; b=OuSaxk9EwdXEEVLyybMX
	H4waTPkSIOoUlqt2N68GEQkZmLTo/52h2DaT6ICShipoY+rKEHk+qvVHKfickyY/
	UqMFYce/yioSQQq7owCmt7Ym68nNxlQse9ze+GoPokr8vas0YiY9URswbdSwmFq/
	6ADvkO/eydafkhwpNpDK/tpojNbSsgiBX2DSLPQFwn4VSha1KrE8bpmxkAmHMOto
	VxoKmB/TWnA3guZmzIr4kdBBJX2yO7UGeJG0I1Q6UvUXJt3HzD9MBLJE9g7AzeWV
	a+CKSd1ldsP/0abua8bJaOaNse6W1t7vBKnccNTNuDQ0kGLUET3YtEFzld+QM5CP
	wg==
Received: (qmail 2505875 invoked from network); 23 Jun 2026 23:08:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2026 23:08:17 +0200
X-UD-Smtp-Session: l3s3148p1@SWdzKPJUqOMujnuj
Date: Tue, 23 Jun 2026 23:08:17 +0200
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
Message-ID: <ajr1wXCI2U23d1sY@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJ9kNJtrY6DyQ-S@shikoro>
 <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IQrbvfrJwKbLcqHs"
Content-Disposition: inline
In-Reply-To: <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-6729-lists,linux-rtc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E29C6BA337


--IQrbvfrJwKbLcqHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Can you please share the commands you tried, I'll try and replicate it
> on my side.

Sorry, can't give you the commands, just from my head: I tried to set an
alarm more than a week in the future, and the alarm was set to the next
day. But I was in a hurry, maybe I overlooked something, because that
handling used to work in the past IIRC. I can return to this topic on
Friday earliest, sadly. Maybe next week only...


--IQrbvfrJwKbLcqHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo69b0ACgkQFA3kzBSg
KbbL/g/9Ffzr85nk4fwKrR+OVge9gQk368nR5HR+bXQ4T16cuZi6EwVQd8v7IeRL
v2TNInbehi15qf2+T51IRvyBLlkAxEx/GHhDMp3AwVL4HAN4HpEPbjYU3WV/nxO2
VcZBHdb9PvTMIzTrx8gpbXsVLRgxzNito4xdMEON5AEs3UImWIU8wqAjAGL0Co3T
6nsfVTPkZyasJa6aqFDTYQtL3UZeio4a11HGUZdmm9RhIIthW0EcXaeMIuTHsrfQ
6JA8FI6h6iZCxTVSuShdPCLl7+a34cLdudvlttGzRFkWcdNP5ORx8MKax8JuRkJr
fNTvTMkOeuHbPTHZd7u/djq7iBK4mGVW55vghOZY7xw3rB9YDmSDPYQMCqyDkPbF
BzLVONEYVvhpQYhOUHedypNJL6fSVTBKkfzlid5npy/EWUjuhzU8A//qkRAfyZBi
FCw8O0RZafJ5WBpueWSGaeU1KCzIYyvv8jBsG1VVNcpOI/9reppr7Hihk0wCqSH6
JmRmQqbesU4E63yTC6pZ7wH+fM6qA6bkBCX/eIRL3tApxXz1uRCARp5yG5hC3sBq
bsiPOg/vQOaTInQLf71E/WgNaHDktBUOCv3uzWl2JZ0vML/TDnunzk9vHcR8kl3J
sHx6QYjJLdhhL4+AM2Qj0P8pK0UgbWdvUAXeV8qfwc2DO5ecC44=
=WL+b
-----END PGP SIGNATURE-----

--IQrbvfrJwKbLcqHs--


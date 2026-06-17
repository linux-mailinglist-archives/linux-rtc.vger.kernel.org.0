Return-Path: <linux-rtc+bounces-6693-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OwMpDAxyMmpa0AUAu9opvQ
	(envelope-from <linux-rtc+bounces-6693-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 12:08:12 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A28698480
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 12:08:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=Sd4rtzZf;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6693-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6693-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BCE630F3FB1
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 10:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2DE3D413C;
	Wed, 17 Jun 2026 10:04:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8453D1A82
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 10:04:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690677; cv=none; b=BtzW9oaY3U0aF1sQyHs9WfC6i5bZ2ANzp/PtN/HHKvr6SBGTcy2lhtlczMWD0DVTKbbegpKBsU2S6hAPW5NOrYfpfyh/kyuo+/E8ue2hfQK1Xct0dB7FCcGmPBGGrKh/4NdfXw1wA/XCX18WZ62BIuOX6g/IVjRcVPTshQeb1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690677; c=relaxed/simple;
	bh=lPh//dIkKPE6lFC5XUMt84P/FROdrRxTL//Ir3Bd/jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6TkMIieZuv+C5Iw17QzXE1nFfkz5wLrVBQwuFA4NgANoOQb4Y8VcLFeoZ9MjCzb+KFCInjcRKirpWee6Ttr+2npHvdVc6SZjRstCtJ6i9Jpb2Y5WL9bBxNgwBQWaFYrNYHqQ27sgvz8jBfCiezjZmPB05mmiqTl7ZnfO9UITLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Sd4rtzZf; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=61sb
	l/w908/xJRNyWlqomqFd7S40v9pzQvZmcXhPkyA=; b=Sd4rtzZf3/l88azECl/p
	nI/zMolWXG4sccUe4/xrPA8xVZq9Ow3L5iEAcLTrrJwF1swDxQ12LI8/u3LhDM+U
	xh1hTxhLBTlS9eP5ZkfH3XvHO1nT3+3Rb+ueoC0bqD0NnoWHAeqft4rYM4Wlkei+
	qgcsm8RCOAQ2eGkA84KVp4VHwJ6BrLhh7zr+CuWUH52aoPYjTGxOVwAsYx2JhjUk
	6fh2/1rtaRMq6DtEnymy4xNYdW66qPxFRn/z5QZbcrSpMOZcv1M/cbfS7Buw0okE
	XSanzbuUwO2SRTgdQ+luTuXFIkxzoI25RTM3BRMqJOP0ofW8mDdvIkZTRDgMumwQ
	3g==
Received: (qmail 115458 invoked from network); 17 Jun 2026 12:04:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 12:04:31 +0200
X-UD-Smtp-Session: l3s3148p1@2tqJL3BU7LIujnvI
Date: Wed, 17 Jun 2026 12:04:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 06/12] rtc: rzn1: Sort headers alphabetically
Message-ID: <ajJxLmDOCMfmf8Ct@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXg16frnn88_P_jHRH+HPy00wWfoqNKdOv8teSWNpMEGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hBtgEMc2jtrv0zQU"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXg16frnn88_P_jHRH+HPy00wWfoqNKdOv8teSWNpMEGg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-rtc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6693-lists,linux-rtc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime,shikoro:mid,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8A28698480


--hBtgEMc2jtrv0zQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > --- a/drivers/rtc/rtc-rzn1.c
> > +++ b/drivers/rtc/rtc-rzn1.c
> > @@ -15,8 +15,8 @@
> >  #include <linux/clk.h>
> >  #include <linux/init.h>
> >  #include <linux/iopoll.h>
> > -#include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
>=20
> Sorting of special characters w.r.t. alphanumericals is always
> a bit fuzzy...

I rely on the 'sort' utility which gives the same output, so:

> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/rtc.h>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--hBtgEMc2jtrv0zQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoycS4ACgkQFA3kzBSg
KbbG1A//dQW0VHQWEcQ5TptO3NyqdAqaLXWtXdhzo4vEUmiRcyAkUZmDoOX3MCph
eCjUZsMopEduFl1QmpB+YuRFhN4mYGwcz8NJzGr/efgEr08IBiX4F7Vt6xSpCdDj
pu4I4UruaUhrN0yReZ5JeXrJCNZ+wAdtmcS2T/kONe1RRhvRZTNbtiRaWQzMFFGg
yLerqk08+dsXq3iMHITRCQ504A58o4DmYm5QsIIQ+bG7KGpct02vpVAaFexGAZNV
oCOCPrnT2K6llmUzPhRLvuMymUC3cLlik48fPNVLjpo517RQup9S/O5+FJ9y9qo9
CsEkzsVRYRfUWNQD2PvAyN4bnUw36kamlHBwYwgo6KWT1JX3Z5Dgz3BMD+Y62dM+
A9hlhyp5/Hs+pzaxh2JLvDlrbVdZW/lKHFwsSAO0nQLBWbU1y8uUfy8SY3/77kua
OviyHRjDs5v0K1/ZQw5jmaOhgTwMyNPN6mqo6kZLkG+BsxF69knoYVRb6w3/J6Gg
0f2pwMV4ocus/hXvP8h3pZxJjjOGxL3z7E5piBCn/RNgzB+vAjZugjKbmgqFjWO3
tOkWk6ObcJ1arFTf3GO5XfdrajEgCx2sDwZxxAq3mhLavOR89SJcH879RVunLfxG
KEFrGLag688orRQ4yb2okU2Tg3BGX9zG1FAkUL9LhhefmQ6Er/o=
=JLdM
-----END PGP SIGNATURE-----

--hBtgEMc2jtrv0zQU--


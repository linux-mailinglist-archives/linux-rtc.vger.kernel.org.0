Return-Path: <linux-rtc+bounces-6817-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IMcPHPcURWqp6goAu9opvQ
	(envelope-from <linux-rtc+bounces-6817-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 15:24:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5996EE0D0
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 15:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=e4vV2phO;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6817-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6817-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F6B63075B52
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 12:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0A748124D;
	Wed,  1 Jul 2026 12:43:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F801481641
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 12:43:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909839; cv=none; b=QzkaboWCHiwDnahh5bAs3lseX3Rv+1nNQCpreq27XhvtGMc+wMe/nMWSwdi23jnhSVxEWvLX/HzSgQiSfpiD7/4AGTGOMUGlJFKo00tuxPfRIhtutQJ84naTgdeSc4N0i0z17VVUfieJQeVtShBC6RdCgKF4gHCnIeT69fpPFxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909839; c=relaxed/simple;
	bh=6t6TRoE3H/XPSUTPmMbz5ishetNjDBcVUQXQegWXEiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6VYUoqx86U6CLuJxVebXCvWF7nDv6ols2Cr4E9lRQZ+/GuP2q69etvVf76BByK/o0IBtSWVMKUebbYm0C4l5sObEYsxnei99CEba48SBHZWecVgc4zJWYBtOu2DDPG63WJAIXm8He1lo7CHY9lU2PtGuWnD4UjDibD8UOAhbWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e4vV2phO; arc=none smtp.client-ip=95.215.58.181
Date: Wed, 1 Jul 2026 15:43:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782909836; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=MiQ1/C1jpe96dAYn+Baq5dQ8BcaDntA255UEyCOTILQ=;
	b=e4vV2phOsDtihHVJ+K8nZUPzvB6o6KPg6J1kPpGLgeKHETTupGMW7UMNnnpN7Zarar21B8
	AcsvNCogj2cVvF7To0PvBt9PXDMXetI/mLf9GSK4OGP14bxCPiEtO8FqmnCQ6FTyYfWT5J
	8j5h1kaNM33d5rMBRx8TNemRqjIjOz8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 8/8] MAINTAINERS: Add ROHM BD73800 PMIC files
Message-ID: <1eebab6c729762d30b843edda6b4d94c7d2f7a5f.1782909323.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kDmr9dI/n9pZMDFs"
Content-Disposition: inline
In-Reply-To: <cover.1782909323.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	SIGNED_PGP(-2.00)[];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:from_mime];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-6817-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F5996EE0D0


--kDmr9dI/n9pZMDFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the undersigned as a maintainer for the ROHM BD73800 PMIC related
files.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..92795b08bc52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23539,6 +23539,7 @@ F:	drivers/clk/clk-bd718x7.c
 F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
 F:	drivers/gpio/gpio-bd72720.c
+F:	drivers/gpio/gpio-bd73800.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/mfd/rohm-bd9576.c
@@ -23556,6 +23557,7 @@ F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
 F:	include/linux/mfd/rohm-bd72720.h
+F:	include/linux/mfd/rohm-bd73800.h
 F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-bd96801.h
 F:	include/linux/mfd/rohm-bd96802.h
--=20
2.54.0


--kDmr9dI/n9pZMDFs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpFC4EACgkQeFA3/03a
ocVcuwf/V8mvdJre7xxJ4FAz8hw8Mqz8mjvmSZnGNnbVkH7ZoKolHDW53cyJlNmZ
C+Gz586iz/lXmQSssIMJcm1xUKvkULFKS6lLMn3108fdmoc2xbtIiJT78fZevNfp
2Mgg+GPmgxEXHheyB06ih6qf32UlaDlrZwb2nUAKchyNFWoz6zTUBI23nv+CiHpq
0knu0LeM4MAzOBxKO3ZqB4BYgixbcw6t5XnWLwmaeABbgVsxy8VOHj7IqmoYYKMI
LNQg60m/eo0wPIs9QI0unQUQetbECr3WkcBDGy2P8U3SaHLq9v1p9nTwa2DhhDNX
Wny0/puUnjqFBZvPUAmWTrg1tvBZhA==
=uRdm
-----END PGP SIGNATURE-----

--kDmr9dI/n9pZMDFs--


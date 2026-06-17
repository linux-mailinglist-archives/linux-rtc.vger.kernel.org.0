Return-Path: <linux-rtc+bounces-6687-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D+8bC5ZnMmoNzgUAu9opvQ
	(envelope-from <linux-rtc+bounces-6687-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 11:23:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC8697DC1
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 11:23:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="Qh+AZ//b";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6687-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6687-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A3AB306B360
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD8739E9A0;
	Wed, 17 Jun 2026 09:18:46 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A9D39B4A3
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 09:18:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687926; cv=none; b=Xepjw3mJFF4cRtz+vjOwGoXk0qY2APcYVc6QLeQUwLRz1nMv+ArH3SveycaPY2cCe1nY/1DEceIVJG/VSM9P49BFEbFagnDswKy0ZIyYi0kFwuSpyNjqvuqo8sizZZg8uKTMESPFt5VG59Xp563HKgbEQ9jYB34f/UJK9awO+8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687926; c=relaxed/simple;
	bh=u/PcLubphUScZEyBHaDZmnw+jmhYqzbxcAUrT0FPOEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEjTaFHeDd0dEh/+TTZfb9e6G24icdqM27NAKfjmqSvrtqRleMsUy2qWlrd4NqJQMKiTRawvyx7FZV7hS1LpG4E7yUNpLpSa+N/ogYPkxen/Prfn5BrUtTIKfbGksdM6VfbmSkEk7bj8GXQ07LHIxTDc3qMdjzUagNzGDo5PXNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qh+AZ//b; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ur2A
	Kqttq9C1jxhZMMt3HsRHBG/YG9LFX2Iyhl4yrOI=; b=Qh+AZ//bH0G/NG/VBV2F
	6IOC4T7Yp8U1WSc51+01gHzjXBcOO6m4SQ1pWrbkfc6v8tmaVhLpvXmOVnjvS3ON
	46/wlwHstUkrjiLQduGCozHACdg+9ppc4aBhLRkWzjPweZ7LXHM1fMZGcJEB4Z2K
	50vdMsswM5H8etycmGqmsbBQiIQ59ZjOTWck6aNV2WAQc7eviYk+wwvl7yP8VPWj
	xJp4xtKYLYpKDBYsNbNQsm+MyKvz2ZKXDf9cUU3PWxb70k+UMt+w9v6Y1YQO6Ftd
	BsMJtddJjvlBLCe4GIds2JF02tM7xW9oFMY9HRojruh2+uGQ2w/dl2cuAaQLsTbO
	fQ==
Received: (qmail 99205 invoked from network); 17 Jun 2026 11:18:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 11:18:33 +0200
X-UD-Smtp-Session: l3s3148p1@XKwpi29UEJQujnvI
Date: Wed, 17 Jun 2026 11:18:33 +0200
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
Subject: Re: [PATCH 00/12] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Message-ID: <ajJmacl9ZJtkoLyf@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ESSLquH2XRyJzGVh"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-6687-lists,linux-rtc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84DC8697DC1


--ESSLquH2XRyJzGVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> The RTC block is closely related to the RZ/N1 implementation and can
> reuse the existing driver infrastructure when operating in SCMP mode,
> which is required on these SoCs due to their 195.3 kHz RTC input clock.

Yes, I implemented SCMP mode because the (back then) upcoming R-Car X5H
also dropped SUBU mode. And SCMP works on my RZ/N1D board as well, so I
could test it already.

> While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU and
> RTCA0TCR registers present on RZ/N1, those registers are not accessed by
> the driver in SCMP mode, allowing support to be added with minimal
> changes.

Note that even for RZ/N1, RTCA0TCR is marked as "not available".

> The RZ/T2H RTC variant also supports a 1 Hz output signal on the
> RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
> marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
> distinct RTC variant despite its overall compatibility with the RZ/N1
> implementation.

R-Car X5H is the same for the above as well.

> The series consists of:
> dt-bindings updates to describe the RZ/T2H and RZ/N2H RTC variants,
> driver updates to recognize the new compatible string and enable
> support for these SoCs.

I will review and test in on my N1D-board today.

Thanks for your work and happy hacking,

   Wolfram


--ESSLquH2XRyJzGVh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoyZmUACgkQFA3kzBSg
KbbAzxAAgB3BEg7c5V1u7545NG7MVNtSPrNRk8H1VT4T+L5DuGNgxnr5LVOFoLEJ
/7qp1hGauNt1dV72FQms45UvscsIf0anF4aI9WlitN/J8cc8wR4W6zbs8OMDfz7w
v+66/fkSDHpnZL37oOxCsdjvUr8acZG2MjiP5yuYRMGWDDj+jZ/AS5fWYQ0OA8oH
CqBZIQT1r8Y1RbOHrHQfYC9DnUwswKcc7KUeASnc49xteDVLs55BduZclR+C4c2q
1XB7Q71vUCGJIX0JjtwS26kM1SKRiUBx5rR78MelFYFvo++nXGtsZUKy8RcK6i2I
COn12npVL7Z2TaaoFH0FpGLAbEGQUm8hT6zPqMTtEr/M5tQB9TY92JAv72OoGcmJ
UuEpQ+ZEilH6OqZAGBn4FhN2ufTTHZHEM7Fv+/PlKKWql1rRvWA9HKRd3pBu6ulf
PeM97qRU8dFY2dND/9Lk8tnolzWZU/Sh4r34acRd0A0990hf2Mu+d55Ci6XQEzmW
SuEKUQkfDROP1TkFKeEwEIXzA11KHByUqiM9qY0wx2y9VmvNMSdFkyvudlbHfSVj
hzdJhbDEVH5zE8Nxab1zvEuYB1bvcLdtHQp2Hrsa9E0WlZ8eaNRmti1nPz5K1SvN
dYlLbGfvozx11Hwpc1/aWzIsvwESXq2pNQsamR8PpDTjBx2FZlM=
=CbMX
-----END PGP SIGNATURE-----

--ESSLquH2XRyJzGVh--


Return-Path: <linux-rtc+bounces-6885-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NTEYHXThR2oWhAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6885-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Jul 2026 18:21:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D4B704351
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Jul 2026 18:21:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ob47GSok;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6885-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6885-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FC063013862
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jul 2026 16:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AA5305690;
	Fri,  3 Jul 2026 16:20:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8181304976;
	Fri,  3 Jul 2026 16:20:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095657; cv=none; b=LbImny1sq6jk8RpykjwCIXguhB30hg8pum+nFTno6GV4F02dSmoJLm6gHcz8rVSy/hrFSB+9SRIxq++/K9KN0/y8oHloCl6Xs6q3MkfUZEVhH4I3XdNra0lgR6BPCvasj590GPXPnUuZjutIFVxXCpXvqEin/dOTpIJU3Hzs9I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095657; c=relaxed/simple;
	bh=OM5LeX7Z3zehI7Br7kaR6AJOzvkDGU+AsyY3eqD986Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp9tJbhDWNHnn1mwdl8QTdJG9lfhmmOArEeGWUTxZfYGkDFEDZCslICTdWUoRMcZKhdSBWAbuhReR4sjCZGPUhiCrKi8Vx0HrbiokWALRRoT8HRaXfphJGk6CAvy2SIIGTOxnzECRBDWg5jaWu7tpSQ8pArn2wWf5A/JbFocXok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ob47GSok; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0271F000E9;
	Fri,  3 Jul 2026 16:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783095655;
	bh=OM5LeX7Z3zehI7Br7kaR6AJOzvkDGU+AsyY3eqD986Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ob47GSokjsPQlNeF1DRo+w36Qqk3j9a2jBm2ZRPypV82dDcgEhaMtpO8cg1FfNnEk
	 So4PGlSpvzqisjpgfs3gCKJ3Lf+Qq/pk/iPRWtk6uGoM8Nmi5lp4yvTgXxYwC7n8d2
	 eN1pkTjnnb+767W300paAMsO5lA91HdlzkEUw0C4wrQ5yy+OuEtgOtn/D9dFkWjyMW
	 PDYuVtgy2xN4HU7XRkh8tj2q4rFjBn/guryMnTHZ7rCW4wZT/Z0BGyfS2ZQq7Rf2OS
	 BunNP/qYhgPuCDlWWzPjUHhKbugT0jBAVgStCALqGoFUKc4qld1OyGLc2UO9l/mvQ2
	 c4ysojZEQUTLQ==
Date: Fri, 3 Jul 2026 17:20:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, skhan@linuxfoundation.org,
	me@brighamcampbell.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: microchip,pic32mzda-rtc: Convert to DT
 schema
Message-ID: <20260703-identify-cringe-ef88079923cd@spud>
References: <20260703110442.205026-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OaoQxJwKPRf9lloS"
Content-Disposition: inline
In-Reply-To: <20260703110442.205026-1-challauday369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6885-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5D4B704351

--OaoQxJwKPRf9lloS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OaoQxJwKPRf9lloS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakfhYwAKCRB4tDGHoIJi
0jHsAQDdBhJEQFSxOsFL/90Eml086rure97kHVAlfSAso8DvAAD/VYDXUUP+IoQ3
WCNQ+7brY8b5e9u3ctKoD/7ml02CngA=
=Wmta
-----END PGP SIGNATURE-----

--OaoQxJwKPRf9lloS--


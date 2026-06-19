Return-Path: <linux-rtc+bounces-6722-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MJeRKFirNWqT2wYAu9opvQ
	(envelope-from <linux-rtc+bounces-6722-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jun 2026 22:49:28 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 024CC6A7B64
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jun 2026 22:49:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=iM2VLsOK;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6722-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6722-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A450E3051D3F
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jun 2026 20:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DFD3B7B8E;
	Fri, 19 Jun 2026 20:48:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF59305679
	for <linux-rtc@vger.kernel.org>; Fri, 19 Jun 2026 20:48:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781902134; cv=none; b=D6FXsk8BXLEh1+Z51Hvvn6JtcpuF3HOzwS0eG2qMTnC8B581G6cAQOWXUcoYMCAxvQ2EGtf3TaNkl0Vf1/7KJvtAlmzKhT99HOxx3+Y54CKwgOhplddRY5x/QWO4gt+uVxM4V9vaEz/CLnc3lsyDh7iubB4JMh1I2YF6SuSOT64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781902134; c=relaxed/simple;
	bh=/DhohJZGTz9abykatRmBdgN8Jg9E90Yf3gikqPNftfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRInlrsO2yssNCzDILcYtwxY3DiOSWX7Wplq2lPCoG8/6xdbZtX48e+ETT/9pt5y9uY586RDfDDaOMdDEq0twKD2b9JQOmzgNE8vfz4KbW+mOSECpQPH+l702VGDgh9B8tfhnnm4A7piV6vczq14lWMprYfdSsATHc3YrTDYfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iM2VLsOK; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=djwa
	D7/2v543piX+m0B8KYh8jLWg+1EPgr0osKN70mg=; b=iM2VLsOK27d5MQ2pkggG
	SFQn+JvEtRNH9I6TJs1gWt/d9PdOVzJaFBVEKmQmEu3H7wCRh13VIJEZDxsDFJ+9
	MOG4g1KTW/A34NeALkAv8JwlV0l5upmWADOOlFVVexOnN02EqLo0i5R/rBejIws0
	nN4S0IFIFLSAINRpkuY/KHZCwWKuYIGhsxJuWHZQ2UhIZSfhBgsXELDuaoOFeBh1
	tbaaA/nTYsrhH4LlORuNcN+dK8JKJ7y4TghcNYj8JDp4bROiDWZSE8zh04E2xxJ+
	vvU7EjWGQMagkDXuROrkInjittaH+nh7DlW6Kw/NOAjdM6/02bK/JJFt7hGCVfRa
	LQ==
Received: (qmail 1078737 invoked from network); 19 Jun 2026 22:48:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jun 2026 22:48:51 +0200
X-UD-Smtp-Session: l3s3148p1@wseMa6FUENEujnu2
Date: Fri, 19 Jun 2026 22:48:50 +0200
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
Subject: Re: [PATCH 09/12] rtc: rzn1: Use temporary variable for struct device
Message-ID: <ajWrMuCaUEFJSbkF@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajKAPJGrea01XVeI@shikoro>
 <CA+V-a8t-phAuaH5g_3Nt=2d=KPw2QqA6r1dqOZv9k-Xhp5q2Zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TTgDSYB9X45Zj4L1"
Content-Disposition: inline
In-Reply-To: <CA+V-a8t-phAuaH5g_3Nt=2d=KPw2QqA6r1dqOZv9k-Xhp5q2Zw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6722-lists,linux-rtc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 024CC6A7B64


--TTgDSYB9X45Zj4L1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> > > Could userspace still interact with the RTC during this window via ioctls
> > > or sysfs, potentially causing synchronous bus faults since the hardware is
> > > already suspended? Should teardown be bound using
> > > devm_add_action_or_reset() to guarantee correct reverse execution order?
> >
> > [wsa] Or maybe not use devm then?
> >
> Maybe just add two `devm_add_action_or_reset()` calls: one to clear
> interrupts and another to call pm_runtime_put()?

Why two? I wouldn't think it matters much if the two are separated. Main
problem seems to me the disabled clocks because of pm_runtime_put()? But
maybe I am overlooking sth?

> > > [Severity: High]
> > > This is a pre-existing issue, but does using pm_runtime_put() here (and in
> > > rzn1_rtc_remove) leave the device powered on indefinitely?
> > >
> > > Since devm_pm_runtime_enable(dev) schedules pm_runtime_disable() to
> > > execute during devres cleanup, calling pm_runtime_put() only queues an
> > > asynchronous idle check. The immediate return triggers devres cleanup,
> > > which executes a barrier that explicitly cancels pending async operations.
> > >
> > > Should this use pm_runtime_put_sync() instead to ensure the device is
> > > synchronously suspended before teardown?
> > >
> Although there were some patches accepted for similar kind of issue
> reported by Sashiko, do you think I should switch to
> pm_runtime_put_sync() (Ive not seen any issues)

I am not a PM expert, so I can't guide you. The report from Sashiko
sounds reasonable to me. But you'd have to look up the code path to
verify the reasoning. Or ask an PM expert.

Happy hacking,

   Wolfram


--TTgDSYB9X45Zj4L1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo1qzIACgkQFA3kzBSg
Kbb1LQ/+JlXsCm6AwwIQftLvmKNpZmsL7YUrP3rt3fR5tKZJNMsg+4+as36AEEAh
XWlRIvvvxgIHLhF1HOb52Mxfn3Fzdxiq3a1+wYSqfZQ30dTvq8CQA9CZC7oaHQzN
EfooGbxN+2A9ypbp+Y3uIChoAUB02Kxy0DHtIpwCY1mU3wvQ+lgQFKHPvfLPI/zD
4GWw6GGb6XWrV4dgSdG3EuLk7NtfFkUDmkMCMONTLKkoyT3U20v7cbj/jhgTroKt
z6ZRIdU+hgzCLYRj3tmvsZi7dSN8EJjsLecidu0cJcBVHBOGs/khV41C7IVyLo08
Rh3yrSTGlI3mxt08bYpxpKeR+OrmFCcecc0m5Mu/irmLmn8DWgblcISEPdstwKgC
4O86JrNswWgjUOs8BtFsFn/rEtkrzyYI1LK7WL0etbmWfe/87oKvYhul5CCn3iHH
+kBxZ88enMSOAZf9kz/IuiJkACBRLNyQrLRkHw63W7hE7rHVtNOWNobK42Uo76F5
hQRBqvxtVc27EzXAtn1TsQ1zYOdJ+hqIriEho3zU2VSpIMVaWqp2JRJKaW7Mpys9
IWoNQCVktyXkXSjl3O/5TmCaWhdCtxtu1/38BHcWnMCKmweA9xa04CPMwj1Bpekg
5Dq6hoA6eatnLscgo2KozH/nvp2gDdI/w9csYJi4nQT0EvPixn8=
=TgdY
-----END PGP SIGNATURE-----

--TTgDSYB9X45Zj4L1--


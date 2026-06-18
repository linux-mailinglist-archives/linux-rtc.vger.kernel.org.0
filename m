Return-Path: <linux-rtc+bounces-6712-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i00KOhjkM2rTHgYAu9opvQ
	(envelope-from <linux-rtc+bounces-6712-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 14:27:04 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B536A0045
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 14:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=v6BJdF8t;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6712-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6712-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C87A303BDD2
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADA63F4DDC;
	Thu, 18 Jun 2026 12:26:32 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345513F4DCA;
	Thu, 18 Jun 2026 12:26:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785592; cv=none; b=KCgBMrA0Jt43Iy1i2Trn/YWrc4hrWlqhEu7EC7XRexTgkwXOkgrkv+11RSOo0nqk2Acl2TbU97T9bgVTINopzjWkt3MBjFkjOzVsCnurGnAKf+TTZd1j+ZIzMheILWJuSdEAIboQPWLkZnPfUvmSeaGSRGvGSVg2mOajzq4u4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785592; c=relaxed/simple;
	bh=3DFA7fCc6O6qeQCtyGpD7RtWjpAIIgJGLL9FHvmMa/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6TPirtHXDP3I78wKTWhFQQBjdKEN+BORO1TyQQzAHK/ZNyWPmm1/JMyDqdiFBTXEGrcBPuolP85fzGXQLMqc7iyESX/cKNiXmIYBdpk6YVNO4TzSCOKNjo2SMYNHuuSLRqjHVStodbDTyzEYNeCccGNil5w8Woj4n8h2K0bv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v6BJdF8t; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3664E1A39D6;
	Thu, 18 Jun 2026 12:26:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 019275FF03;
	Thu, 18 Jun 2026 12:26:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24E7D106C809C;
	Thu, 18 Jun 2026 14:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781785582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FPC4w75SHCrMUMtFaPFQKiS1Ezm90OLzUVPWXqnhYdE=;
	b=v6BJdF8tVcFG0jaozv6oCOvmuV28m7VKVNLevs7GqTdTlygAOB74Di79bO9HiGbelz4grQ
	Gk0cAOwhgjjWTa4thxzoYSmawWjpSy1RxLx0v12iQcE0S3pcQWjIhbUtF6G+nQQPQzS28J
	S/B+JmtCrSXsjkZweUtOs0E8LM98ruLb+ZC8vZ6P5k7VLqzhR+g1WTTLDNbJoZH+anhIED
	ixmFGkaX0BP9ibPmkJ8CHFWvQJd6q2S6/vjozpQFqMl3DA6XjeLbdU9gQBzsRYAX1tTM/k
	jFUzDLnXMEnOPg7cfvdCWr4/0e7XWqtrPi6okfuj1mR5eMyjgVoNPH1jq1CkMg==
Date: Thu, 18 Jun 2026 14:26:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
Message-ID: <20260618122619ed9dfd28@mail.local>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260617165538dad7e36b@mail.local>
 <CA+V-a8uHVR0i+3PY_qi3i0H6fMJSUFb=1cwrgw0VeztVQk-dWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8uHVR0i+3PY_qi3i0H6fMJSUFb=1cwrgw0VeztVQk-dWw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6712-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.local:mid,renesas.com:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66B536A0045

On 18/06/2026 11:49:12+0100, Lad, Prabhakar wrote:
> Hi Alexandre,
> 
> On Wed, Jun 17, 2026 at 5:55 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 15/06/2026 16:48:00+0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > alarm and farest were declared as unsigned long, but
> > > rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
> > > unsigned long is 32 bits, the assignment silently truncates the upper
> > > 32 bits of the timestamp.
> > >
> > > Fix by declaring alarm and farest as time64_t and replacing
> > > time_after() with a direct signed comparison, which is correct for
> > > time64_t values that will never realistically overflow.
> > >
> >
> > I'd argue that this is never going to overflow ever as unsigned long
> > gets you to 2106 which is way past the usable range of the RTC so there
> > is a trade off between the size you are going to take on the stack and
> > the actual usefulness of the fix.
> >
> While it's true that unsigned long lasts until 2106 (well past this
> RTC's practical lifetime), rtc_tm_to_time64() explicitly returns
> time64_t. Using unsigned long causes silent truncation and types
> mismatch with the API, which modern static analyzers flag. Given that
> this function is not deeply nested, the 8-byte stack trade-off seems
> worth it for type cleanliness and consistency. What do you think?
> 

I'll take the patch but I still find t a bit irritating that the
justification for this kind of patches is static analyzers report an
issue so let's make the kernel less efficient for everyone.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


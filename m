Return-Path: <linux-rtc+bounces-6710-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hsTMFubNM2o3GgYAu9opvQ
	(envelope-from <linux-rtc+bounces-6710-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:52:22 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FA69F831
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:52:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J3wENa60;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6710-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6710-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94E4F30534C7
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 10:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7693EFD04;
	Thu, 18 Jun 2026 10:49:44 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF93EF650
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 10:49:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779784; cv=pass; b=seBz/gSYJ/7sHCkNpvPtrvu5c5iLkiHKydoPyuogp24Ru6TBes/So6o8x7BQrdQli+59Q+jlubae8bjqhpliwCiQwmMSr87MlsE9LgHeaIg8lDNxb3XMFUgSVkDfABATvDYSm4MZFfyJmSDwmeA2a53iUXYxSL3o0rS5nxQWM1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779784; c=relaxed/simple;
	bh=i0LPAIbHaQDaHzL0HbBEibfN6MdLfmwe/8X8xZtq9KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Em1F4GS/j/r2v4aLu05EVRH7vUWz8aQyYqeRUhy4haZ5R+5LQm64tQZB9kBgevJnGk2gw8zyTyGTJwkzxXlWjLpUc6xLSCTpLr3ZEErGL1RooaREqPDRdUoLiHWDvzhVFR7n85Y2d5yhJVp7c6T+KsZkDq3//7MIg07QN6CONOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3wENa60; arc=pass smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso18656955e9.0
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 03:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779779; cv=none;
        d=google.com; s=arc-20240605;
        b=RZUnAnbg2IUSLmU4K89oZD7YssViwu+bC1RPR3FQaP1C62JXWDb13cylN1KeAxa1vh
         wV4IZYHWUHThx36eHYu8RPm0SYUVteir1zW2XNnrIgoiE2zRv1luegxy0LaVjdBIw0gl
         mIur7Cz9DHqN1raTmubTyFyurn8BMtLai0vRuDjaaVlO0WRGjzfupeFk1OQ38+zBxt7J
         MXkgk00GbVKPtUWzNrHWowlqH7Sv1g6x0tLRUDCJCx0yklv1o0D049FMLt6r5g85O2DL
         7ZT/yr/RE2LLIW2WkZTfBF313ZyseV+4eJYZiwZ5HDPKxSvlC9VZZz+VOjHw1WPODsXk
         D5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0LPAIbHaQDaHzL0HbBEibfN6MdLfmwe/8X8xZtq9KA=;
        fh=nJLOqVJQhOadBk0BoYI23jvpEwp6EBfuMA9eFIKIemI=;
        b=NqHteUCr/BN8wFVZhCw77PGv4118sOTC39l1KKD41OWwOin9RQzzonzrikuMJJD1OC
         KSo6ZdvKHUKqcxzovvc+XvgjVmVisTbnXoUYl8NoGopWw2b57IdEUM4J6c6A4qxRMtn+
         IP1YqLiijdhT5zQIzKMzWdeN5Al3kMUDdTxggXFy5YsjpEwgRW+eDrfPjveK0NlkcZHA
         zEpw80kXSzFJo6BPC2s3TSUD4TY7B350SEZEQGyHhG6219qCmz4Dlg7tFIniWwrH7jCb
         uJAdAklmiKyoi0uWA4Hb1RmYno5UeUiiPKbTV3pO8V4lapXbaTjCNkOiF+FQXJ4VyMqn
         8cFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779779; x=1782384579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0LPAIbHaQDaHzL0HbBEibfN6MdLfmwe/8X8xZtq9KA=;
        b=J3wENa60BJlFNPgu5MC4i8o7aET2JQXdZf0KIVpQfaukhLBv64LQ95aqYHz16NumqO
         wVs72vDzV/+tbrkOSActWfKatfDdNa4FCH/TmNHeNpc6vOq5l60i5LtJv9I5jvrXmIBZ
         CrYtRsnxP3qMJoXyJ6uqQXK1rLArAZyVb+bTPeAJ5NVsU7Tl0e0KFtBs6r57HCrkd7Ct
         pZRbdnf5RLUgZoIrPizosgZCpMNGXKNGTvCp4n/DmzGYxtQKZls/yBBbOF6FlWJ+/5WQ
         TBb+b780RtxjB+3x80FDQMrZBbu5U9IiBo99s+kCzVcqjaz/lYrKXfakjTsRX7SbKi8B
         yZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779779; x=1782384579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0LPAIbHaQDaHzL0HbBEibfN6MdLfmwe/8X8xZtq9KA=;
        b=kQXvZYaE7e83nO0xFllRR4xFqL8MgVn0t6LnzpUEhKjKZRUy6pues5Lug6I/Olx9Uu
         SfleA2myr87FvqC3+TH/hjIE6neFapUTtvpEXTF4hRginK7FPRTlqeDN/cMi4qiDptwG
         GrL8mvZrQQApg/qpuQPwP23F9rWAC4/FE1jbc/i3s+HUGY6mCFlZ1UtIXm3OVQCcUduk
         bG7jtBosaXKfMMGlvzRxE9L65yR/p9Tmz3+btquNdio7NWwncCsq2NZcFKk6/eIETX4m
         XZyWkn7T3gFYNaSiMF0rmcq5IMMtoEsdzID0U3p/0b2grBy9st4NKl14UIio8m+BYvqM
         mtag==
X-Forwarded-Encrypted: i=1; AFNElJ/ejA4mmBC0b9jDQxJC24o0OMxBv+WORqa0cLc9KLExr5si4k0hTtRITte9X35PTNBtzaehW/YPOMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ily3LgoSFbfKZHj4Rs3S3v4kavp+moYq/qHBa6Nm28D/rT5R
	9kxbdT5+XIv7IPhnXo65YqMppf8YJtd9Wx07LZXadcEbHsG8uV8Ji9pAN+hqybN3Ln01VFUpx3a
	e6i4eMtg6OsLgBqYqqU/IV36sPtea2vY=
X-Gm-Gg: AfdE7cnLxJsqDGZlutT6kjqJL12am5NCB1EphAhnwLTnhUjOAD3dUe+k4c1qG/gGd9b
	BqrYER8vNfsp4gQ77T2NtRweOYYUCbGeTF9HAD1/WWPyCs2YRdQAnFuEcxRxU+20vX+Drrx4KMy
	IuL5Df/4LtbOlSh6ztaWmo6X9dnMKPvwca/HVTvRk88oe0G47Ne87e9lFgxQzcp1GwQgLdU+rDB
	mAtMMzwNtwgtgH6kS7zgFCFStOZ3x8+uDHDJdGLT+RouAdt4XYVyJlm9TwW8qXF57h6gVN26wx4
	aQ2txQXS6vh7OjWMBiVGij3wUCU018JDE1gJZi6tb2F0jJxz3huXz9+qs5t2ddAIXqolYn05Fho
	z6pQ3KZgZELZDgY8=
X-Received: by 2002:a7b:cc18:0:b0:490:af46:5c68 with SMTP id
 5b1f17b1804b1-49238169164mr41010675e9.7.1781779779249; Thu, 18 Jun 2026
 03:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260617165538dad7e36b@mail.local>
In-Reply-To: <20260617165538dad7e36b@mail.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:49:12 +0100
X-Gm-Features: AVVi8CcVzeG9DZs1UJrNQL_uvR_wiTr31L-zM3pE70n6KHb0bc6nE7Z0AGIpfyA
Message-ID: <CA+V-a8uHVR0i+3PY_qi3i0H6fMJSUFb=1cwrgw0VeztVQk-dWw@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6710-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:miquel.raynal@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,renesas.com:email,vger.kernel.org:from_smtp,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F32FA69F831

Hi Alexandre,

On Wed, Jun 17, 2026 at 5:55=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 15/06/2026 16:48:00+0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > alarm and farest were declared as unsigned long, but
> > rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
> > unsigned long is 32 bits, the assignment silently truncates the upper
> > 32 bits of the timestamp.
> >
> > Fix by declaring alarm and farest as time64_t and replacing
> > time_after() with a direct signed comparison, which is correct for
> > time64_t values that will never realistically overflow.
> >
>
> I'd argue that this is never going to overflow ever as unsigned long
> gets you to 2106 which is way past the usable range of the RTC so there
> is a trade off between the size you are going to take on the stack and
> the actual usefulness of the fix.
>
While it's true that unsigned long lasts until 2106 (well past this
RTC's practical lifetime), rtc_tm_to_time64() explicitly returns
time64_t. Using unsigned long causes silent truncation and types
mismatch with the API, which modern static analyzers flag. Given that
this function is not deeply nested, the 8-byte stack trade-off seems
worth it for type cleanliness and consistency. What do you think?

Cheers,
Prabhakar


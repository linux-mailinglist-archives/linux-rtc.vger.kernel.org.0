Return-Path: <linux-rtc+bounces-6705-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rK7YJ4TGM2qFGAYAu9opvQ
	(envelope-from <linux-rtc+bounces-6705-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:20:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A969F3DF
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:20:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ID4/kqZ8";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6705-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6705-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB563028EDB
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 10:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DE13E8346;
	Thu, 18 Jun 2026 10:18:06 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805463C73DE
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 10:18:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777886; cv=pass; b=kVZuK3iQU7E+E8Fy+8w/UeeM4Ws7WqJFoiNMzVxADlGI522ThDTIiS6V07Ek12dJgpJLyuA6WpskTMv9WSI/YehyjnLX3g4t21wLYFZgUnihp1N6Ww3Ev+a5Jf4P2ecnjdRe6CA8tgDapfcTSXMzmiprkbo21eZQ53y1Iy/alUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777886; c=relaxed/simple;
	bh=d3UI51xhDccu7qrMqr31ZRLTAiml8TgixkPl2atEXVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBqsJ001wKsGXUa3DiV84gFOylDM4MFGuJ7np6OZgS03yNX8glV8IM747fR3xMaP9I/nj1I9THlqFhfknDSQU5tF0wplua7HUo93GB55IOboWYD3vh/l00dZUvBaRpoq6MJt4Sj4x7oro3/j4RbDhmaVR/HzSoDBJ+svjIkMsDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ID4/kqZ8; arc=pass smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4633193af19so582176f8f.2
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 03:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781777884; cv=none;
        d=google.com; s=arc-20240605;
        b=Syb9ldVnbxnZxFUmd5s/hM33wQakc+IdW3vVMgeTITCrRy4aRNS8ikp7zhT6kP7vjC
         kAzNcBptNsrqPPTbN0ll+wTIyECyAkYkT3nCuia2AI4on/Yis0aOsMpmh8yfvFyNnqXa
         PJ6N3UoaFuNKEPo6e7Y711B5CzIdhp4DYF1TzG1Ub6ZY59lC4Y5R3oItMB7Ke3obIoSw
         XmPZsQgGmFGEYeen3hlxmpkCBF9CHlD9XSqZYa+p7gg2lwwCpCQelQyd2UNfDqd/y+6g
         SGLNdPoSbWQSFMJeC6n6YIvx0bu3DRWKrZCLd7xFv8VUAKO1CkBZs46Dgq5GYYgczcYJ
         8UCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmshtDYoyJi3az2OMgVxmco1OYRSd0HgGniKLz30q/M=;
        fh=mzPqe1krbNp7pFs3UbHf2PE2KiTGpsqtvMypr25qnis=;
        b=DmqnDVFn5NR4KewJeTsCeELjWrffO3sBIqfW1Wg6lCmYO4JeuqREpxtzgDSMvzDJxv
         RXTwI8QKpFfWoxPNnGR4SJmkDwcoODGZEHpouI7fQBVP2fiyoyIKz2CvhucxVLEJ3vRF
         aZW07AJfoNk/COf5AYgEgVZPVoA+EGIz2u8zZCZu568FetqH1IyjnqFsy6xcPj7WpPHq
         Y7SFnZSry4itxVnFM2UbNG+De0VRhqrBbyuHpdvhM7FpS1u1iLcvj8lNo8Q28ABaTG/U
         /CGZtAca0lzstFgQPMGCKGsoSSWGsSUx2sVeNcri8FPHqv6JhF9vPDEn4DfFJDn/T8hJ
         EvDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781777884; x=1782382684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmshtDYoyJi3az2OMgVxmco1OYRSd0HgGniKLz30q/M=;
        b=ID4/kqZ8vADaM1lJqaiaYShy3/fKugrn9Q7rHcWSf43WT00yhafJZMc5Ckhd9OMnQW
         VMa5O9snDlmfgAa2HFIE3h6R08cgFcNDz0x0PifG+Rby2aBimayCp9qbbqd0Eg0aLygp
         CYSTu2kVBNriIpIBn2mm6HkOA24sskW3nwQ2XAEXWl7BdcOm+SmqP9mW8nKAVIH9iA5V
         wD6pkZvwj7v9ixyEziF4Kg6ipISsHu5QOd6JAdWJ7SSaQre4mq+pNqIrZ1r8O1ErR4Jp
         MZVWxBpzUJTm0/3h/v12FRgwTPTG0FONamTFanoSCPES+CZBUxY8R/D6omDJqiblGqWn
         sIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777884; x=1782382684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmshtDYoyJi3az2OMgVxmco1OYRSd0HgGniKLz30q/M=;
        b=tOTTM7oYbaOBi8MUFDCXXio359XS3dRt4YWN8pgNmCWtGwHilTPsrzzmbFoYJ3ngjQ
         mGvrMYIdoxdfl1dM65PltftYLvACcqupzkJB8GYAV6qwIHN1mZOqw/TTZh8OM0uHoTFv
         SR1nIiurA/yC0w3rdl7ISM3s+PKALkMoosq5CFblzsn1JTMmWs2y4DuFwjJgDxTq1KpO
         2KrcxkY37AVxr3CchVAgmxnvGHmeHUg7wVJL3axERo4EhmedxaN91ijIVaruP4WE4PMM
         pA0rDsykZKKU1Vh9bOsmDzufQh1Y5cj3XvqStt+e7XHlNzDbX02RT2I0i4w0NsBn0vf4
         eBwg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZdoPC6Yh8sEkY7+CseTt09NhVMhd15WejFhjHF8fDlnt3piESrGBHcBuT3Kp3RBHCiUkAU/ek9ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmAJG26jymviNzuVyao90LSSwNqjJWqV2HffQOQovezqfPrvMl
	zUxDDba4lv1b3D9LAKqokfyBWkrP/0nLhlAV9rBQVmqB93tkZHjg4Ex9rZngC4+v0lJyDegO2GC
	sR70NeO9oaKUxS4ERLsbiSXKU2Ug4SD0=
X-Gm-Gg: AfdE7ck86J8yleo4zyDWePCq4bwCMvg4wADl+p9HetZKuqLtiROfpLpVYfiJGA/quVr
	ORHrpJ1e4FGi2edX5SWNLflAkN6O1o/baecX2T69TjV6XeC2Apr2SxqOBzTsrooCphyDBe0lOt5
	GoC2jU0zJeDMswvYWcBJd/932kN515krTgbkqRpNuA0ha4+pGX3VRQou/2+sbxx3Zxc6J7F19NG
	Bn2DfjZ/H+1800jMwlUCaojOxoEZ5DNSSzYLqKt7a9IsNGLYZ8d7ZLbKtwr+FZx5V6fzQF8SkDv
	5cZPZxnGeanfCGfGCnS9RYSWpHP5VEMJRU3IWjBfWReZzJh4z6+3IoxaGzXNcEdcafP1h+k1DJ8
	AqujV15EI2zge33ZyXneRE4jj2g==
X-Received: by 2002:a05:600c:1395:b0:490:e5c1:b8b9 with SMTP id
 5b1f17b1804b1-4923a8c402emr24573155e9.0.1781777883721; Thu, 18 Jun 2026
 03:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJvn2YkaspTYx9M@shikoro>
In-Reply-To: <ajJvn2YkaspTYx9M@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:17:37 +0100
X-Gm-Features: AVVi8CejmAUnxV28-Nv-iRPPqNanTzOmym7-UH_9-4KCncFioQAXLRdjmh4wMqM
Message-ID: <CA+V-a8uKW6QSOjhW0NW3pp4d0+mVh19rYUKKexqCjdD-WThNDQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6705-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 012A969F3DF

Hi Wolfram,

Thank you for the review.

On Wed, Jun 17, 2026 at 10:57=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > -     depends on ARCH_RZN1 || COMPILE_TEST
> > +     depends on ARCH_RENESAS || COMPILE_TEST
>
> Yes, this helps X5H also :)
>
> > -       If you say yes here you get support for the Renesas RZ/N1 RTC.
> > +       If you say yes here you get support for the RTC found on Renesa=
s RZ/N1,
> > +       RZ/N2H, and RZ/T2H SoCs.
>
> Such lists are easy to get stale IMHO. What about "initially found on
> Renesas RZ/N1 SoCs."?
>
Ok, I will update it as above.

Cheers,
Prabhakar


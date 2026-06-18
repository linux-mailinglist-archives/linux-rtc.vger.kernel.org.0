Return-Path: <linux-rtc+bounces-6709-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cl4/BIrLM2qpGQYAu9opvQ
	(envelope-from <linux-rtc+bounces-6709-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:42:18 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2769F726
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:42:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WG0Y9YBP;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6709-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6709-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE9663063612
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 10:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEB93E5591;
	Thu, 18 Jun 2026 10:38:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51938B14C
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 10:38:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779136; cv=pass; b=EaphhWbQW1PDSJy9kpTTvDXiEEcihyVt6qZxabnq1KD2FKzEELBBBurhIWAbk7t7mJJed5eu4/dUMWxMu3QlgNO4fERFr451lB5ZJCRfQvxa7c8wUGwF8CMgSgiRaMEYDTpait5MOaBhMdSa5MBRmSwn+tVbdXxI+0pVRuneCYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779136; c=relaxed/simple;
	bh=FxTHPTEGs32xTR9c7EYu9d5glP/R7XHMD3VZDYPe2+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfGKIYgOgaScdNwP+FSYc73p4e/1MTdVBJQv835Z2iMuEsdm7Hfh2k90mhVekChrZ8WZviIZwg8riO24FJ3YQqD6v5KBdasHxMhJYMWfvNzF0EXrdNKzu5hVvkH00PfX7ll15LcO8XJnq0QiTGCiie1fy/lieu2fzAumVSZMf1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG0Y9YBP; arc=pass smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b64c8311so6516165e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 03:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779133; cv=none;
        d=google.com; s=arc-20240605;
        b=Dx08jsATYcuGOUdEUZzx4rfV+GcfR3dbAC81LNQaO+9TAhpGhNbVMpUwTuXL5JOq9F
         PcEmX6rSLT3k7PVt8BoNr3kauWdXrnDvRpIrEX441EHtwtZcPg+yBziiameqk4MSMa/V
         +iP4jh6JoN2fEk/TsMaJ4cT3r2LQcVXixG1veUeRNk7qoM9meLOOvP4sI/uvpem3uXnO
         p/cRIBnE0ejTdbUfArV5lMf5HXZqGOn2gsHywUs26A7t1bS08l81bjQ5e/2moM0roQgs
         JTgr805HHBDIJZk68/FZrc6DKWfoAbMKNIxrIlNaikQgZI3oMtrkyfRqIZ08+0sLa4bB
         JBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KljND14vOQKsdbxxFQM55SGvFHxRxUmSYC3xs5Hgop8=;
        fh=kCIK22fLr/qIQMMsqETs/DwIbfGoOkP1PFcNOsdJ0bI=;
        b=QE1Lj/yPTakCTVE5+L1YW8bxpUmI6J0+c1oqSx9SzX2bpsRx5bONeyyjwQIwXKAUIY
         RRFN+8jO2WmcjcUmhq0vG6Vvqdor1Xstc8VjbyhbZUZPbLd+s9A6Qoaf/93eP1GIlSPx
         /qP9fgDwDGp3KaIEp4okMjkJkWcaWX1otfQTgDLL70R0joHuRezBNueSLhCmrf13LUs6
         qE0lVJGY2K88T2QVoDgI2aMBPcYZJaqz1sM5eCORaONLMIlzxw6tAFMS7OFRyHkJiMxC
         BhB/e/rHsIj9Um9iJ3giqx8EEqpyXQkMbShlt/KL0fc3p/9f00FX1gZEmhEeYlFpmJZm
         2Isw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779133; x=1782383933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KljND14vOQKsdbxxFQM55SGvFHxRxUmSYC3xs5Hgop8=;
        b=WG0Y9YBPPWN5Hp6tj5IjoQAE/L25bGQl0UN6+RJCjTAaoynkyO1xEErgH8ovHYJUqu
         0hAhkzyFFJCvGj/PyjqZcVqdr0sLR4N4Bcc10vxyKpc6wLhASTMnLnk+GHpf2MOgvOKY
         hcS3cCWMGJs1qlCzcxH7Krk+lehDwBPsp80uuwuNZzG3no75+lf+dG2wc5MHO4BXGj0A
         bgK7I/uk6KKdin2nOoCaNIiP37zgSfqoyJsH7URvN5B1dXCKdCk6mPzuNSdbMMCxKAMQ
         Z+4bRg6FagnpRHOJg6/6d6Z7zB5ouIlDOVjhZnDeqorXYTdYonZ1ZsPnsKS79m0M6geH
         rCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779133; x=1782383933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KljND14vOQKsdbxxFQM55SGvFHxRxUmSYC3xs5Hgop8=;
        b=rJoe8lrxerRaNzprXHgJEBpnJUVi6mT3P4V+lp12eMNB/AJwYtwLPA3n+k9dp2Gqly
         /SCj666hvtRDlYdlGi0aIWhwJU4oxYUK6DFZ6aPM+JLKRgeCB0/eUHDKuC+KNIrUXuTM
         PeLvYuz63wD0UPm9Tw3QHwm2I1o3ivbLOFr3E2COkxQ8VrAsIzKpE+0TPomdlZ5h1JoC
         2piUw8/IJjItYYKDHtWiggiOnPeCxnm8q/CHdCKmFKJNpQDHJuoAqVoTfXIGKhX66EcM
         /nGPG0RchRpq+gvFkDef1t8BNSepCg0NWhjuBDxc7tt93l7L5CkEZGvWmYkTxOPvDBU9
         6YxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Iv26nP461q4ihhq3uPp4MkYLOX1yTjs3mPC3b3klErXoFJMyWeRyLHfCmrx/EaKWi0MLY6DiN4+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysl8zfzKGY+MBZl6VcmDjj4ak3zFDOW7ov6K55hF9GTpYzq2fV
	KB4US6CeANCper47ZwpIp76pEoFk5MvZNWU7JKiaUXjNHbdFspxLF29ixzvS4HhQlTPlNUnDW1/
	IUGb2VX83TngaCkcAfKsMZbYPMeM4O5c=
X-Gm-Gg: AfdE7cl9Z9Wnmhg3hCUea7qGwbORPi8MnJP9GFFYFye6PMHvEl2hSMVZbbuP7/ycBUP
	QWTYAu08veXmlJkDBUIwRH1cwcEeRWTaOqbLVVUUDbJumXOJ7Rz7nse/W+KeLzJrWwPdgf1FPyT
	OLKdLPclvK68t6dAmAYUteFhL0ThOq11B28rFI5nOrrv3BobXGls8qH3nQCavZ1Lhk7LII252TL
	2bRnyErUdUij9CyVOC2QWgHlHwEW0k5GX/gqoyw5f9NMCyF4NjoB5o9QY2ROWlV8A71/vRB56jT
	AtwI6H1jaiLXyAS3TE8aQMikFtIxCFPHADgKQZimdn0po0fvafgzv/uWzyPqN32d7XzFiBxzNBd
	1i5VrAb3LUQa50lo=
X-Received: by 2002:a05:600c:c04b:20b0:490:a298:acf7 with SMTP id
 5b1f17b1804b1-492333ca341mr114316775e9.17.1781779132935; Thu, 18 Jun 2026
 03:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJ9kNJtrY6DyQ-S@shikoro>
In-Reply-To: <ajJ9kNJtrY6DyQ-S@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:38:23 +0100
X-Gm-Features: AVVi8Cd-U7tUFEAJg3IGSxDM56ukcxBLxZbA138pqjhmvl4iTE10lUkkjXNQdKI
Message-ID: <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6709-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url,sang-engineering.com:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BC2769F726

Hi Wolfram,

Thank you for testing.

On Wed, Jun 17, 2026 at 11:57=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> Sashiko found issues, not introduced by your patch, but still.. I
> curated the list and left only those which I think are valid. Do you
> have time to look at these issues?
>
Can you please share the commands you tried, I'll try and replicate it
on my side.

Cheers,
Prabhakar

> Thank you and happy hacking,
>
>    Wolfram
>
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] Incorrect hardware alarm weekday assignment due to unsigned un=
derflow when the alarm crosses a month boundary.
> > - [High] Unconfigured alarms in `rzn1_rtc_read_alarm` can return an inv=
alid `tm_wday` value of `-1`, risking out-of-bounds array access in userspa=
ce.
> > - [High] Potential spurious interrupt when sequentially updating active=
 hardware alarm registers.
> > --
> >
> > commit d278abd6309a65fff235820bea9a8e8631da47be
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: rtc: rzn1: fix alarm range check truncation on 32-bit systems
> >
> > This commit fixes a silent truncation issue on 32-bit systems by changi=
ng
> > the alarm and farest variables from unsigned long to time64_t. It also
> > replaces the time_after() macro with a direct signed comparison.
> >
> > > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > > index fe21fa6242881..06339adae71f6 100644
> > > --- a/drivers/rtc/rtc-rzn1.c
> > > +++ b/drivers/rtc/rtc-rzn1.c
> > [ ... ]
> > > @@ -265,8 +266,8 @@ static int rzn1_rtc_set_alarm(struct device *dev,=
 struct rtc_wkalrm *alrm)
> > >  {
> > >     struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
> > >     struct rtc_time *tm =3D &alrm->time, tm_now;
> > > -   unsigned long alarm, farest;
> > >     unsigned int days_ahead, wday;
> > > +   time64_t alarm, farest;
> > >     int ret;
> > >
> > >     ret =3D rzn1_rtc_read_time(dev, &tm_now);
> > > @@ -276,7 +277,7 @@ static int rzn1_rtc_set_alarm(struct device *dev,=
 struct rtc_wkalrm *alrm)
> > >     /* We cannot set alarms more than one week ahead */
> > >     farest =3D rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_=
max;
> > >     alarm =3D rtc_tm_to_time64(tm);
> > > -   if (time_after(alarm, farest))
> > > +   if (alarm > farest)
> > >             return -ERANGE;
> > >
> > >     /* Convert alarm day into week day */
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does the calculation for
> > days_ahead underflow if the alarm crosses a month boundary?
> >
> > In rzn1_rtc_set_alarm(), days_ahead is typed as an unsigned int and is
> > calculated like this:
> >
> >     days_ahead =3D tm->tm_mday - tm_now.tm_mday;
> >     wday =3D (tm_now.tm_wday + days_ahead) % 7;
> >
> > If the alarm is set for the 1st of the next month, and today is the 31s=
t,
> > the subtraction results in -30. When assigned to an unsigned int, this
> > underflows. Because 2^32 % 7 evaluates to 4, the resulting wday calcula=
tion
> > shifts the weekday by exactly 4 days, causing the hardware alarm regist=
er
> > to be programmed for the wrong day.
> >
> > [Severity: High]
> > This is a pre-existing issue, but is there a risk of a spurious interru=
pt
> > when updating the active hardware alarm registers?
> >
> > Just below this hunk in rzn1_rtc_set_alarm(), the match registers are
> > updated sequentially:
> >
> >     writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
> >     writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
> >     writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
> >
> > The RTC core can invoke this function without first disabling the hardw=
are
> > alarm if replacing an existing timer. If the hardware alarm interrupt i=
s
> > active, modifying these registers sequentially could cause the intermed=
iate
> > hardware state to momentarily match the current time, triggering a spur=
ious
> > interrupt and prematurely expiring the next timer in the queue.
> >
> > [Severity: High]
> > This is a pre-existing issue, but what happens in rzn1_rtc_read_alarm()=
 if
> > the hardware alarm is unconfigured?
> >
> > If the hardware alarm register reads 0, fls(0) - 1 evaluates to -1:
> >
> > drivers/rtc/rtc-rzn1.c:rzn1_rtc_read_alarm() {
> >     ...
> >     wday =3D readl(rtc->base + RZN1_RTC_ALW);
> >     ...
> >     delta_days =3D ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
> >     tm->tm_wday =3D fls(wday) - 1;
> >     ...
> > }
> >
> > If the current weekday is Saturday (6), delta_days evaluates to 0:
> > ((-1 - 6 + 7) % 7) =3D=3D 0.
> >
> > Because delta_days is 0, the rtc_time64_to_tm() block is skipped, and t=
he
> > function returns with tm->tm_wday =3D -1. Since rtc_valid_tm() does not
> > bound-check tm_wday, this -1 is passed to userspace where tools commonl=
y
> > use it as an array index, which could cause an out-of-bounds memory rea=
d.
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.=
1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D7


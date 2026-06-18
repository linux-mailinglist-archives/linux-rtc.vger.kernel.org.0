Return-Path: <linux-rtc+bounces-6713-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FJBDF8rvM2pcJQYAu9opvQ
	(envelope-from <linux-rtc+bounces-6713-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 15:16:58 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C14A26A0679
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 15:16:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=b3GVcUzn;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6713-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6713-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42C893071B37
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 13:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCAD3F927A;
	Thu, 18 Jun 2026 13:10:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8B3F88BE
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 13:10:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788244; cv=pass; b=IkYNie4u4AMzEvx2cT5mAf9lb8Fjh4BTIr8OsPw1W/WtUklq8s7v/KF+HjduH5bOYKdsAY/NdLULHVOv64BJeuh/6oVqK5r6wsOxvkLYkbY2PgYUe7jmXSwaijuZXEs2y84PO8NNwKlVXkKO0S/J6UIpJuC26nSKDFFrsEkGLog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788244; c=relaxed/simple;
	bh=d+QNhcciioN8943WQueiVIs1K1U1Kqo6ylyvJfyMYfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5oA21aDGV+4OTBsaqhfE9/zuGfZ4GvDFIE29/II0sw4CGnV3TIEAHG2bppbH9ITaqzZUCD1I5cIQy68nwoI+92faF5DJUuPfOzmIgkAgwhiE54Z0WzkUf/C6tkLemhgzh27DTyWqeSSq/hbYkmcc/ToHZxATWZ9VTyyvBVXrrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3GVcUzn; arc=pass smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45fd464d51fso581280f8f.3
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 06:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781788239; cv=none;
        d=google.com; s=arc-20240605;
        b=WmX3Rqr8msiqt+naPxkuLIH0XBcuC/TNjjD0tsfUoCw676ci7oOxMOKVah9xE/glkT
         fimXP2SENFASGdswCTbqPvKKMGgIh/eew9LesEbZeKDjanb9kXlvpizNru9VNXMfS4ZQ
         538Cz5nZXfyYXYIus+O/N5/tL/756JVzTuD+OBf/YnVOtwHUavURVP+oWOqBchTNKJeV
         FTTJYwnqKEeeTxoKSmUEB7pICkJdhw5G8rIm1UVaf2ih9VkqcA/n59GXxA7THe+KfDQF
         YioW8cY1eO9+PN1gUAXhbmy9kuLVjzbNnWJl6Qn/1Ej8zHou4j7qnUfCL0AxIjgy8/pB
         giGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        fh=reXYnPd1v9rBhM2K6ia0fNX9u8o/7DKdmLTmQXLiAx0=;
        b=XWKB+uEG8xN3iJy1YXzcWJF/GeTAbv0iTVaJGXrcRQVg1LCahHvAYPG4O//um929vN
         9psnx7iKjb/1hsTx+vHgoRbw47HmjcKzJEeLIwTaPbF6kJ+Gb7MztQH4ZcvfZJaWWoCA
         2csZqzSQB7OzU+l2zk4bRWECNJq+XZO4HUPJQc3AgVizjb242b1BY7j44ZosX3kI9ron
         iNqZB7GSqotYx7eVw7dybj7Cb6WvaDCKEgzUhGEB5BmRu0RFh5oElQ1urgMswWDf+vwK
         lk44yXR9FpaWSy38KDdIiNaQhsyipjJfX5///taBNJIxqQ04qPDblybLO0xu2kKJ+fWz
         GEXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781788239; x=1782393039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        b=b3GVcUznlTFfdK9SwEaQz+tv5zxEyN1t5qL56kCeauLhEgnmcNUTgagNb9ZnV9JdlS
         5Gfc94Qo2KmN601PI0iEfdmkDNaPG9CL7M+oxg83o/OnYtEbSPoRw8cIcFJKnGTtWzLM
         8q3ZSomWvSPZR2g1BRarb/77FpqpoD9XdBtiM3phdFx6sGXNP97MI5s+CFlu63xsE7fe
         5MOXCsL0qVZMdtQXFDtv6cxBi6Y3GVpiW2HgPJtdvyH+OxChoorMWtFpBYIMmSQwyj4R
         Ww+6GS8gHipmz5nlkLWbyVF/kUz+hKxOswanOOqxWlfNtzfvy6Pua/FbM8tCG2umzkaT
         t7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788239; x=1782393039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        b=sZcPup4MCVXecHQzqz8C3NmzjpMTWex8KTThKYVKadad+8gH00oGfqtc3F3UX4cprY
         BEITHgW6M24IiN3DzNLVldtZOAvlO6nsvge6QipVu5u68T0FKTl55yKRXRk+eEJ2ecVs
         V/yqtQkoZjnw9JG2EQYOHhuGtbVzmjOeZ3exQKrzQ3S95kAYRFm0Ck1WmYQtvjYTiOW+
         +qPSVOVq+PNwalq9G6h6PkmuD+eRu4cGh99UyARE4xNpDDt9ENbfT34quhvTpmPsVpYq
         cV7B5S2jLoKp8QGoRWgsQ/0u1vJO8/7iCXlJBRqhibHwmwsXNipNV89h/8QXa2wIuTHi
         2rrA==
X-Forwarded-Encrypted: i=1; AFNElJ+X3XZvceYdH1dx9UaqkD6MOuhp4d8z3ZgoHZ6WBdZ4q1ZdQ+o1ymAJM09OyLW5iLJYFoasYGHBmyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzxGZy/ur+NUzXnUvjjASoIDwCLpSG6ZhJriltP5j5cAXMp8io
	ZWphJak/XYlO/ukwsHQcVxw8l2XiV7GgnOIHsO3hhIo2zeiz6aKbPSDswwfkBp3zsxcUMzbRL1R
	dH8Y8t7SHXQ3YwB0KQk0DDcsJO0PSeZw=
X-Gm-Gg: AfdE7cn2ZQLHMHPgfRVjZBGQoEDU31zYUO3a26hbp4dl+8yLK3Cl0mB0qJtKuBoP4ev
	nLfv2A2c+Pt4HxBiYBDnueSi9tEQvRb3iahmpBCIpGxqbegy84bJ2THYoLXOx1YvfZPsv9gy8jq
	NN5aQ76zKNYX6G9nvgJCNjGJ7cMwQztkU1omRRVS/jovA3Vk/vAvcA+FTX6GItRq/CPsxBcXYNx
	8v5PmUM5fsVJuoTtcHsefU1qj8mUjtGlIAUiEdhxpvrRnfRMjXS9vE9MakYUjeSFF0BMd5Vmzuw
	OgEgtNJ/ex3QgILzLbwHw0KeECRREMRp8A70989ETnikn2yz9c+Giws+eEGu17APYaroSQlzSSq
	df1mcdet9sHM1OxI=
X-Received: by 2002:a05:6000:240f:b0:45f:f142:d56f with SMTP id
 ffacd0b85a97d-463ab7f925bmr6142210f8f.12.1781788238861; Thu, 18 Jun 2026
 06:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajKAPJGrea01XVeI@shikoro>
In-Reply-To: <ajKAPJGrea01XVeI@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 14:10:12 +0100
X-Gm-Features: AVVi8CeIE9Zqpx5xUuMdz4g0V9M0203aYYbu2RDELhF5fjl_rVj_ZIbbsG1xByk
Message-ID: <CA+V-a8t-phAuaH5g_3Nt=2d=KPw2QqA6r1dqOZv9k-Xhp5q2Zw@mail.gmail.com>
Subject: Re: [PATCH 09/12] rtc: rzn1: Use temporary variable for struct device
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
	TAGGED_FROM(0.00)[bounces-6713-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,sang-engineering.com:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C14A26A0679

Hi Wolfram,

On Wed, Jun 17, 2026 at 12:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> Sashiko found issues, not introduced by your patch, but still. I
> curated the list and left only those which I think are valid. Do you
> have time to look at these issues?
>
> Thank you and happy hacking,
>
>    Wolfram
>
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] Asynchronous pm_runtime_put() is used instead of pm_runtime_pu=
t_sync() before runtime PM is disabled, potentially leaving the device powe=
red on.
> > - [High] If the optional 'xtal' clock is missing, readl_poll_timeout() =
loops forever with a 0 timeout, risking a boot hang.
> > - [High] The driver's `remove` callback prematurely disables hardware i=
nterrupts and drops the runtime PM reference while the RTC device is still =
fully registered.
> > --
> >
> > commit b7f73c7d0932a6e78b12419c5912ad3243637b8f
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > rtc: rzn1: Use temporary variable for struct device
> >
> > This patch simplifies the rzn1_rtc_probe function by using a local temp=
orary
> > variable for the struct device pointer. This avoids repeated dereferenc=
es of
> > pdev->dev throughout the function.
> >
> > > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > > index bc6af59744e48..25cad9213147d 100644
> > > --- a/drivers/rtc/rtc-rzn1.c
> > > +++ b/drivers/rtc/rtc-rzn1.c
> > [ ... ]
> > >     if (IS_ERR(xtal)) {
> > >             ret =3D PTR_ERR(xtal);
> > >             goto dis_runtime_pm;
> > [ ... ]
> > > @@ -486,18 +487,18 @@ static int rzn1_rtc_probe(struct platform_devic=
e *pdev)
> > [ ... ]
> > >     device_init_wakeup(dev, true);
> > >
> > >     ret =3D devm_rtc_register_device(rtc->rtcdev);
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does registering the RTC
> > device using devm_rtc_register_device() create a race condition during
> > teardown?
> >
> > In rzn1_rtc_remove(), the driver manually disables interrupts and calls
> > pm_runtime_put() before devres has unregistered the RTC device:
> >
> >       writel(0, rtc->base + RZN1_RTC_CTL1);
> >       pm_runtime_put(&pdev->dev);
> >
> > Could userspace still interact with the RTC during this window via ioct=
ls
> > or sysfs, potentially causing synchronous bus faults since the hardware=
 is
> > already suspended? Should teardown be bound using
> > devm_add_action_or_reset() to guarantee correct reverse execution order=
?
>
> [wsa] Or maybe not use devm then?
>
Maybe just add two `devm_add_action_or_reset()` calls: one to clear
interrupts and another to call pm_runtime_put()?

> >
> > >     if (ret)
> > > @@ -506,7 +507,7 @@ static int rzn1_rtc_probe(struct platform_device =
*pdev)
> > >     return 0;
> > >
> > >  dis_runtime_pm:
> > > -   pm_runtime_put(&pdev->dev);
> > > +   pm_runtime_put(dev);
> >
> > [Severity: High]
> > This is a pre-existing issue, but does using pm_runtime_put() here (and=
 in
> > rzn1_rtc_remove) leave the device powered on indefinitely?
> >
> > Since devm_pm_runtime_enable(dev) schedules pm_runtime_disable() to
> > execute during devres cleanup, calling pm_runtime_put() only queues an
> > asynchronous idle check. The immediate return triggers devres cleanup,
> > which executes a barrier that explicitly cancels pending async operatio=
ns.
> >
> > Should this use pm_runtime_put_sync() instead to ensure the device is
> > synchronously suspended before teardown?
> >
Although there were some patches accepted for similar kind of issue
reported by Sashiko, do you think I should switch to
pm_runtime_put_sync() (Ive not seen any issues)

Cheers,
Prabhakar


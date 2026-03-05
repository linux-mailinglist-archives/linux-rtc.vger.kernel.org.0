Return-Path: <linux-rtc+bounces-6118-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLMkLQpEqWlV3gAAu9opvQ
	(envelope-from <linux-rtc+bounces-6118-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 09:51:22 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152E20DC01
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 09:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A50F330117F7
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 08:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7263374183;
	Thu,  5 Mar 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTe/gcmX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9C7366802
	for <linux-rtc@vger.kernel.org>; Thu,  5 Mar 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700679; cv=pass; b=qDXFmmeGmnb6SbtUiGir8mWyk5/jCydnhqdL34vlZIFFSVtuaEngnOa0lcle9DvHM0u05HQgMJneJb/QvTNLywSBkbv7vqwEz3XHbO9LidEhKNEyJgUdrVP/05QC0bjWczls4KSkTts4KQYzNc+hGHlNs3rAtCFbm4iyzlMggP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700679; c=relaxed/simple;
	bh=sEUgx7XQv7g8DoL665lwvFwpJuQi8nuj7bjlTiz9Lag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/a2HxegtNw2Om4gVNEswfpoP9U5X+SRecMYB8+frcgsmrNpgnRvdp+W8iT2/aHG8K155315cnufEGk4MQYrq7BA4gka60D/e0a2uggpR46BaNxmyWVNdxyWPQoBnwemxPRidygEKww9ODTdgPjm62hjpY9t15OMr29CKBdAxoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTe/gcmX; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-660bdba9390so3643884a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 05 Mar 2026 00:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772700677; cv=none;
        d=google.com; s=arc-20240605;
        b=AxTypFbn9DPKEk9kVF3I6IKOqa1mGf6XFND58Tg5UlBPtZNXQCN8RMkPV9vU+5wIBy
         Q9ntnbavj7IHXe0eTGFeGxybaCKenhu4D1RkgI/PZOxVKQyMnYVeahJiuMR1cDo3AS2P
         jgW2gdyZG/K0yo0m1j9ScBSqRAD25LujOxVY3lKcphUSWRmu9C1gIltX/5zQLyF225SK
         LPoAw/e6lQ+Q+NdjuFb5w6nhNM9UuH50UJj2lGsa7aGc4cR9Ki5hXGpYy1jF/40WxgHF
         NrAChQtl68bFqbW5momy6xUBzaa7QuLwoicCJamBguCnB+v+eOfZ/zwVug3N8GY2FVZK
         utZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKI4RkHGLNgLhbmhZhuWJE4qOdTx2GaVOZl5vUzK2NU=;
        fh=/zIOCMh7DKPPPJLh+gazo8Zz7FxwSYTTOwftWesXOgY=;
        b=BxUXNMuoCoSmS7mDKRhY5Hr+Jhgd+NWXZhJYUzVzlyhIymPt/tvDLT7tu/cS6Lvc6w
         N5pQlivKLWDHH47QniKMUPae8D/ZL3F45CWZ804WFygGLB2oFMC1+ZhfR+5EfElZrbOh
         3D5qZR8d5e2g7h5PbobpFU1Z3mUQYppuCpo0instR8rgf9M+NvuYZ1qPKWOKAiGxEOnW
         DVpbNe4O/5BxsPt6AnFFVXBQNSgWROJ95Xd3N3qBcePOS2vz1v4CK1FoGD24i48zZL2i
         HaqvNfmNhxVMg6onhqoW1vlVIkgdRrAygUQ3dKw88782bF6rFWFcnQRcGO97zNWvf1Ll
         JmXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772700677; x=1773305477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKI4RkHGLNgLhbmhZhuWJE4qOdTx2GaVOZl5vUzK2NU=;
        b=jTe/gcmXv1uBCRgTNfRlPhI/TQeVtVX8rKavUnZx6fAf6HdKM/bLO1JURw01dvcw2C
         Kzttl8o+xWmpLKOnbUijbQAvjIaMmbQlWVJTeHco192fQDl/IFdbxV5zlukvqC2lqmTK
         Dd0hpLAeT8PgucHb0QyQzDw+wH/1IoOjtYiNuaNnd67x4p61scNStkzXdT9zcwOtvtnR
         pE9kH9TJTOguJUGY988x03wQiERlNg6uuNpL/aUpAL0l7PMECV1PN7S1panGPWXlZlgC
         FcTrvPG8AN7wHm1XddT7TfELSxM3AIp/oIsrsl8+UonUzwV5AR9dw82rcKUaP4Rr/Hpw
         unEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700677; x=1773305477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKI4RkHGLNgLhbmhZhuWJE4qOdTx2GaVOZl5vUzK2NU=;
        b=daWtbdb67kZgMBT6Xs6jq8y0/cLqfEkzUNvW+c88dz5RJZPY6DYeTpy1mQroU2iBWQ
         gDH4VyprfRdmWueytBJKCc83DHSSTaJqs233j4yrito8i3B5kt/2cmGahvT7IaE29VWF
         6g3RCRlu9aBgiSILyAL/NcGhXxL3h5roqZRBp6u5JJeUZMDrjBc5Knr7iWiPTBvCbWZK
         Q5FaKxABxX7aiHLJDZn+vUO6W8BxXFsYSZuo6+Qp/PACe/59u2qw16jV9Ww1n8QXGqu6
         fDZqz5J9/AReS3HaIwnuERmUznHSkzaxoPMjM0lcIHFQtbeMBBSCv9J4+Iw7p8VB/dcL
         tZLA==
X-Gm-Message-State: AOJu0Yz6jprcHVojt5zGet46dw7F6kRVCsohhPViap0/0GKdUaNnah+c
	yahSMc2rtSsMIbdnpP6XTU0Op/98pqTz455wphYsft/+THMO/BEQKe+nbIFfa+YQhr/5kYqcWv1
	fPb2iSq8gzYV67opW70YsRD2vA4ZASTA=
X-Gm-Gg: ATEYQzwo8vZcWMV2Bv/GQ5PDUmxaraqjn5mkGiQP+uoIFqZd78GDWR3ibCig7+EcdbH
	r1Tm3ifzNS8HSyRYDn5Uvelqdi6KpR4Y7iW8NdkzCwwy5y1MKzqe9f1jd3/jzcthahwMdVtAFv1
	kz4dphBW1Qt81licgiNcrP5R4jXv52q9oQyErDjoDw5O13/kyn4G0sY0n1pLCpchBFiAWSE1qkR
	wILd1sqYfbg3Bx8l9lqpQqZrJpc8DY3cDorNWkPPnhzc6C5NbX3YEARLZO6mdUaB94BLUDs0DCn
	82LZcaqdsJBTMHZOgDpyQNOsu0RlfGZ4MelT1XSnuCaxILf4J8QT4JbCKB8Q4N1BCmPYDGg+rOo
	ogU/87Q==
X-Received: by 2002:a17:907:980e:b0:b8f:848b:4456 with SMTP id
 a640c23a62f3a-b93f116d717mr337178066b.13.1772700676451; Thu, 05 Mar 2026
 00:51:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304225329.24510-1-rosenp@gmail.com> <871phyfz34.fsf@BLaptop.bootlin.com>
In-Reply-To: <871phyfz34.fsf@BLaptop.bootlin.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 00:51:05 -0800
X-Gm-Features: AaiRm51AlcjYnmTJJFe0AVn7Vbz0L85O6On2RH6QhXadGX9VfwLzhLl2d7mR28Q
Message-ID: <CAKxU2N9y_PTTojzUHAExwD_-Mss9uNJa-GnN9C4rfy+M3aschA@mail.gmail.com>
Subject: Re: [PATCH] rtc: armada38x: zalloc + calloc to single allocation
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: linux-rtc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4152E20DC01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6118-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,gmail.com,bootlin.com,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bootlin.com:url,bootlin.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 12:41=E2=80=AFAM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Rosen Penev <rosenp@gmail.com> writes:
>
> > Use a flexible array member to simplify allocation.
> >
>
> I must admit that I didn't know struct_size(), it is a nice helper!
There's kzalloc_flex that's even nicer. Has no devm version yet.
>
> Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>
> Thanks,
>
> Gregory
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/rtc/rtc-armada38x.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> > index 713fa0d077cd..245290ae1a8d 100644
> > --- a/drivers/rtc/rtc-armada38x.c
> > +++ b/drivers/rtc/rtc-armada38x.c
> > @@ -72,8 +72,8 @@ struct armada38x_rtc {
> >       spinlock_t          lock;
> >       int                 irq;
> >       bool                initialized;
> > -     struct value_to_freq *val_to_freq;
> >       const struct armada38x_rtc_data *data;
> > +     struct value_to_freq val_to_freq[];
> >  };
> >
> >  #define ALARM1       0
> > @@ -490,18 +490,13 @@ static __init int armada38x_rtc_probe(struct plat=
form_device *pdev)
> >  {
> >       struct armada38x_rtc *rtc;
> >
> > -     rtc =3D devm_kzalloc(&pdev->dev, sizeof(struct armada38x_rtc),
> > +     rtc =3D devm_kzalloc(&pdev->dev, struct_size(rtc, val_to_freq, SA=
MPLE_NR),
> >                           GFP_KERNEL);
> >       if (!rtc)
> >               return -ENOMEM;
> >
> >       rtc->data =3D of_device_get_match_data(&pdev->dev);
> >
> > -     rtc->val_to_freq =3D devm_kcalloc(&pdev->dev, SAMPLE_NR,
> > -                             sizeof(struct value_to_freq), GFP_KERNEL)=
;
> > -     if (!rtc->val_to_freq)
> > -             return -ENOMEM;
> > -
> >       spin_lock_init(&rtc->lock);
> >
> >       rtc->regs =3D devm_platform_ioremap_resource_byname(pdev, "rtc");
> > --
> > 2.53.0
> >
>
> --
> Gr=C3=A9gory CLEMENT, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


Return-Path: <linux-rtc+bounces-318-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9797EFC36
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Nov 2023 00:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B76BA1F26386
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Nov 2023 23:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEE430354;
	Fri, 17 Nov 2023 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2JGkE38t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAB810C6
	for <linux-rtc@vger.kernel.org>; Fri, 17 Nov 2023 15:43:29 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-45d9d28142fso986893137.2
        for <linux-rtc@vger.kernel.org>; Fri, 17 Nov 2023 15:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700264609; x=1700869409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1NsfHVE0Rs4ohooYR+8BLZuke8eixnzhlqm2hdvcxE=;
        b=2JGkE38tL9tv2Ry3f1VtdhShOqff8xHwSkFZ8ZUfKrUZHtyNkAbZNghK0BADOrz8Hj
         vtWGlw+AtRprl/3fpJ4vHGQoYajHuw9/mTmV/4nULkEjuf3Oda5fbfhK9v9K0T9UsRqD
         mnyVu1d/1S32suIZFt3R/CIbOCZYSiQM1yAui5Zxf4SbM+Q71Mn0TxvbwzN44CTwsG8U
         WCoHjHVaNmmuLldEmSs/jCPazPqYOZfOiTvPXeYdqIxcPkhhmzhBCuRQYfglXt8+Hr6p
         rnuubfRzW7+GbKzO22Q+prdi44N28gCyPudJxqCRuhdQpejaQZ0vJ2euy88bdwIYqXUA
         aL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700264609; x=1700869409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1NsfHVE0Rs4ohooYR+8BLZuke8eixnzhlqm2hdvcxE=;
        b=HVfyPLSFN30lZRhbUBTF/iIcITKCM5yPNcrKFZLU0AAb6x/GvU0Ah3weZ/b2sORcum
         nGfSRIa6XiNVdOGYr8CjfPygp/yyKy9qWzzxHsJhmDnmm/QZMX6mB4e/QVwpDdrWO3hF
         MGrN3iBEUlDryMuVIT/F1dfeClsUqGouVXsap+PUadykhq3CGdNOOAqElrcellRoKu6l
         keKzQbqR/zN8i5xcqTiAV4TofcTFDoJd0L7r7Z1TR0xT3SD32pdIj5ueQ7lA1w/kaG/F
         PBoMH0HhwYr1AvZngVgg1HnjeRK/2mh3tuutJTFV/p//ya/07zhHo99PvQXgClKAcmSE
         oZWw==
X-Gm-Message-State: AOJu0Ywxoa+IKna/iLjSQ1SPPZDaptSb0A9MOGZGcRUnKUR9ldeXS3vb
	Nmjrv2ZL64O6bpz9FfAHMfp7mqvtZHIipx0+a2kqKA==
X-Google-Smtp-Source: AGHT+IGsqH+g23NOuftKZQaJNB6FfaihsCTnH4slf6umspoonCke6N4LfYHlgOLJNv+d2Gp+Ls+hxPht5cpbCXm4f4Y=
X-Received: by 2002:a05:6102:34e2:b0:457:cc6c:9491 with SMTP id
 bi2-20020a05610234e200b00457cc6c9491mr961954vsb.17.1700264608786; Fri, 17 Nov
 2023 15:43:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106162310.85711-1-mario.limonciello@amd.com>
 <CAHQZ30DP8ED4g3bib-tZ53rm2q2_ouEEL3TxD-SgK4YrCe3bew@mail.gmail.com>
 <d55a80f7-ca4d-406f-b2c8-b2bba45e3104@amd.com> <20231113223819fb469198@mail.local>
 <ZVM4nFaDTwrKMr8K@duo.ucw.cz> <2023111422283827b2a3f2@mail.local>
 <5029e355-6fe8-4d48-9bc3-20256adfbdb7@amd.com> <2023111722570552652970@mail.local>
In-Reply-To: <2023111722570552652970@mail.local>
From: Raul Rangel <rrangel@google.com>
Date: Fri, 17 Nov 2023 16:43:15 -0700
Message-ID: <CAHQZ30AkayKxQkLajaY6gcFbGMWb=wu3Nqxzed5yFjLo8bX4hQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Pavel Machek <pavel@ucw.cz>, 
	Alessandro Zummo <a.zummo@towertech.it>, 
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	alvin.zhuge@gmail.com, renzhamin@gmail.com, kelvie@kelvie.ca, 
	Mark Hasemeyer <markhas@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 3:57=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 14/11/2023 18:15:02-0600, Mario Limonciello wrote:
> > On 11/14/2023 16:28, Alexandre Belloni wrote:
> > > On 14/11/2023 10:06:36+0100, Pavel Machek wrote:
> > > > On Mon 2023-11-13 23:38:19, Alexandre Belloni wrote:
> > > > > On 13/11/2023 15:36:28-0600, Mario Limonciello wrote:
> > > > > > Now that the merge window is over, can this be picked up?
> > > > > >
> > > > >
> > > > > I'd be happy to invoice AMD so they get a quick response time.
> > > >
> > > > That is a really bad joke.
> > >
> > > Why would it be a joke?
> > >
> > >  From what I get this is an issue since 2021, I don't get how this is=
 so
> > > urgent that I get a ping less than 24h after the end of the merge
> > > window.
> >
> > It's possibly longer; but I don't have a large enough sample to say tha=
t
> > it's safe that far back.
>
> Would this help this one:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D68331


Honestly, the HPET_EMULATE_RTC code is what drove me to switch the AMD
chromebooks over to using the ACPI timer:
https://chromium-review.googlesource.com/c/chromiumos/overlays/board-overla=
ys/+/2355073.

Ideally if the HPET was configured with proper IRQs by the firmware,
the kernel wouldn't enable the HPET legacy emulation bit. The HPET
spec defines that when the legacy replacement option bit is set, the
HPET takes control of the RTC (#8) and timer (#2) interrupts. Why it
takes over the RTC interrupt I've never understood. The HPET is not an
RTC, so it results in software having to emulate it which results in
extra complexity. If the kernel didn't set the HPET legacy emulation
bit when the HPET declared proper IRQs, then the RTC wake interrupt
would keep working as expected. I guess there's not much benefit to
fixing this anymore, now that this ACPI timer patch has landed. If a
platform were to release new firmware to define proper HPET IRQs, the
date would bump, and it would fall into the ACPI path.

>
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


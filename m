Return-Path: <linux-rtc+bounces-2651-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274F9DF965
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2024 04:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3C73B20A80
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2024 03:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F94A22098;
	Mon,  2 Dec 2024 03:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1WIp2GF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D13BBC5;
	Mon,  2 Dec 2024 03:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733109030; cv=none; b=S2HsfbrrY6x2chDBu9gKYDIRrs5m/iwL6+wESRrUsAp/UfcAGEpfNqb9mrwcUIrA7fd8hPQaQ41fwS8Pq6+ofSViXqYdPjCfhun/Aa7jxjsVaIUDiTIfKY7NWCf1d4mGiIO3l7MfKYY6GTqPrkEU2Mw0xp1qyRr+n4/C0maVSNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733109030; c=relaxed/simple;
	bh=WuABBIyxWxGIuUEf7tH0nMpTsOTuudUyomaRKdl+1gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwumKmbdrzzBgE0xlPgIVtt611cSR8hrenTTCN3v6hZW3u9CX2J8E5zuu4TjQ7BI0XIUmKBV8Z12sdPYfl+HJ1xQX6mpan9t86vErBC7eepSidRjXR6E8+EfsyP5jqbPG9eBjo+9QtHOuhcAv4vgQ4iou5XsleOiTk0dZ/yHzl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1WIp2GF; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso632648366b.1;
        Sun, 01 Dec 2024 19:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733109026; x=1733713826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvNts54nLaDXzoCuC3uPZxLQcEjNcHmmH7slyQInUPc=;
        b=G1WIp2GFxR/6i9gaDbUhljSgBumE9xXsDt9TpVplmPSVTiUhB7G2bQDt2+DtTpqHEP
         6MxgbDhGCDjU3en4NJKVKdsZ6ytiPYkEpM0agnunQ02MFKzRXjKxQo/OvyPTgffrqNEa
         agnbP8imXj9AfgeBXLhJeRjnfWPShajoFHMBOrZdz4j9uLnhiKOiDAWo7zYGxE6JZbws
         roOrAM1OrCNmABN9sfPlttRMdIiFd6jfhaDcttwbSSVGb/DGUsUlSiUM6+6K9WqjQxO/
         ZiPtseWSz0HMzKMNyPC9uccE9UXHII02Nak3e6Nk6qDrmzUF4SWxj63q3W/kDk76AInU
         zRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109026; x=1733713826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvNts54nLaDXzoCuC3uPZxLQcEjNcHmmH7slyQInUPc=;
        b=LQS/kgQYoRfGP+aSNtglUKA1yV3uhtg2MLPNU8BNSlz5F0rm60E8zrFOSZB2pkITY7
         kXcAtN9LSd6X4s4u6BO8R2A8Owvhow/t1Bo/QAoi99xRRM8J3Jt8F85TZoswKR2+TSxO
         ZgHP2hz0l8rQYKKqZMAJCE2k1Thrq0Y5Zj67oYb2aOZAQaxy8e0U/zrpluy+oJMzEv98
         fTNkP9/jm5wkRVtHinz6rfTH2mYkDxHCLTkVw2uBabpTt7FwZH3zPGKqdhITPcrbvPwt
         Tfes6k3Zoanf4VwFGstHXEENaB+nAEMylVD4OHQUCKD3tQ4WWbvMJvfriF9pGX9bTWiX
         yMPw==
X-Forwarded-Encrypted: i=1; AJvYcCUv1NJbpYcbK4qw/PW7GEIYgp/l5n2lRSnNdWS1L1d9lP0lMa+DWB4uWXySExyObXTieaLQjdvmtl4h@vger.kernel.org, AJvYcCW2rSHQGodh49wq5lAvCy1HueZKFHN+tkdam8PpBy3yK8uxM4vx7cp1+JxGB8zt6VtiGyYM/6k414gxcLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YysEfgrf17bc3uZD0wse6pnwf78Y1FLzxpvDmqxUh69q95rngEM
	KtL1SuPTHDe++/FjZofs6Lx9trVcVTK8fZcmwb3gL9SEuL+tUhplktsJrugqnD1IqOX8DE7aWzA
	kSNVMBSZ1JWsgyrWL/vzVJJHEfrM=
X-Gm-Gg: ASbGncvRIfC9tAMFFhMQSkjSaS3CSHP0m2a/FUIAMCm8lLy1aYegNk0A/sO41Ht0im7
	2w9m+PVWCseRGmgsOQdeHp6xiRu+lVr0=
X-Google-Smtp-Source: AGHT+IFokNj0CJ0WKzOxvAtyNcOJBhZbXE20GUIOYjMchjecdIHpvcirTRT1ZnbDUrAGgwd0EJuKmLUH5klgrSXVfrs=
X-Received: by 2002:a17:906:18b2:b0:aa4:f520:41b6 with SMTP id
 a640c23a62f3a-aa580f4c8a6mr1903686366b.30.1733109025811; Sun, 01 Dec 2024
 19:10:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011043153.3788112-1-leonylgao@gmail.com> <173136306889.3322178.5149197946199507685.b4-ty@bootlin.com>
 <CAJxhyqC9hYo3E=J--EYN9uYQc6_q67X4F5DSgpMFzsWrFcbw4Q@mail.gmail.com> <20241129232038ad3be3ae@mail.local>
In-Reply-To: <20241129232038ad3be3ae@mail.local>
From: Yongliang Gao <leonylgao@gmail.com>
Date: Mon, 2 Dec 2024 11:10:14 +0800
Message-ID: <CAJxhyqCGYeYQZfBSD41xFHDE2uqFsn0-9vUcYsa=1zGcSyPAzQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: john.stultz@linaro.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yongliang Gao <leonylgao@tencent.com>, 
	Jingqun Li <jingqunli@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 30, 2024 at 7:20=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 20/11/2024 22:17:34+0800, =E9=AB=98=E6=B0=B8=E8=89=AF wrote:
> > Hi Alexandre Belloni,
> >
> > I've noticed that the post-failure process for __rtc_read_time requires
> > careful handling.
> > 1. Need to call pm_relax.
>
> I had a look when taking your patch and I'm not convinced calling
> pm_relax is necessary.

Before all the code of schedule_work(&rtc->irqwork),
pm_stay_awake(rtc->dev.parent) is called. There are the following 4
functions:
 - rtc_set_time
 - rtc_update_irq
 - rtc_timer_enqueue
 - rtc_timer_remove
At the end of the normal processing flow of the rtc_timer_do_work
function, pm_relax(rtc->dev.parent) is called.
So, if it fails here, pm_relax(rtc->dev.parent) should be called, right?

>
> > 2. Potentially need to set the alarm to ensure subsequent interrupts ca=
n
> > process the
> >     expired timer? Could you give me some advice?
>
> Same thing, if you are not able to read the current time, setting the
> next alarm is going to fail anyway.

OK, I won't set the next alarm if it fails here. Thanks.

>
> > Should I continue to submit a fix patch or create a v2 version of the p=
atch?
> >
> > Best Regards,
> > Yongliang Gao
> >
> > Alexandre Belloni <alexandre.belloni@bootlin.com> =E4=BA=8E2024=E5=B9=
=B411=E6=9C=8812=E6=97=A5=E5=91=A8=E4=BA=8C 06:11=E5=86=99=E9=81=93=EF=BC=
=9A
> >
> > > On Fri, 11 Oct 2024 12:31:53 +0800, Yongliang Gao wrote:
> > > > If the __rtc_read_time call fails,, the struct rtc_time tm; may con=
tain
> > > > uninitialized data, or an illegal date/time read from the RTC hardw=
are.
> > > >
> > > > When calling rtc_tm_to_ktime later, the result may be a very large =
value
> > > > (possibly KTIME_MAX). If there are periodic timers in rtc->timerque=
ue,
> > > > they will continually expire, may causing kernel softlockup.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/1] rtc: check if __rtc_read_time was successful in rtc_timer_do_wo=
rk()
> > >       https://git.kernel.org/abelloni/c/e8ba8a2bc4f6
> > >
> > > Best regards,
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


Return-Path: <linux-rtc+bounces-3223-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8550A3A1F0
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 17:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21DC6174148
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 16:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF080256C97;
	Tue, 18 Feb 2025 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg4/CMKY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50011186295
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894418; cv=none; b=rkJxwnbpAz/fEFEOTQ3RH/E1YBjTAAGYLQd9PjJVoJF7bXRtPfb8fT4Wr0O2/pMLAxa1X6ZHP8rpCnDu47SpkC59TxrfZRvf24ez7AK73PK/xab/olt/ahiI2mtzywYAsQoXTJf1Y05oQvLnQmpjmbnICN2kKpncT0p6kNmMtO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894418; c=relaxed/simple;
	bh=bnUuqbdy1wfbWR99Zd3EzH8fD8Oio777NQcIhIGtDN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkieNl1hfB5tdm+eFVQmkxV54pY3fmujnxqgx3Qp2OVL1tN88I4uKHKunMQNUMOkiXhIjsLBQNR4NY6LOeuPy0QS7GUItFUJGqOiodczjrakeQYPJx1ezNrX+7TL2eRIaKucWoIryCg3Bc4JCpn9K8cOKREm2/2PQg6/l4EWNLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg4/CMKY; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5fcf21d7235so315388eaf.0
        for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 08:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739894416; x=1740499216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2+HtmtuMZmR6j1/4xaGDOW01YNuRe4RHBr52un5kYU=;
        b=Eg4/CMKYuv28t1w67p4jCIV45kZ6qOuXH5OrrjsLZfHVjhYyNCqsPrd2Q//IM4i7hh
         hQyw6U3+PaQvZqBcBBrHHwcpN4+WEZRPnidNATpp6rEIcKP4NuFiJszrUf+GlmQB4Wep
         qlp69Z4Cv2UglFr8OTvi//50ql7KaJmyAHDB8W4yA9bRu3wXfke+3j26OHEsmoEV7KRl
         VMRnk4ubyUhJWBMzKXjqM609NC0dGdjHduZgm2O3qy/HUZ86Hn1nIh41LJMyBen3Wt/3
         v8AqKdg/YPdagiObAW90DzEBA0kDnK7Xbx0TZ54wb3cUC69CxDZ8qDdUh2FQV9WEizQH
         E4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894416; x=1740499216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2+HtmtuMZmR6j1/4xaGDOW01YNuRe4RHBr52un5kYU=;
        b=Nli+DNXlHvZfAhlgSCXaYCo3iWn58Ntaz0R/JiA4R5mxtWX7BhxFjCA4phQNGQdsI2
         Ux/hUhDXFfA1U2tiLfpeJE/BcIFQzpD+aVNSQxl/Oiz8pLVLzFi6VTeZePzMNs+GkuCI
         /qHD9Me7TGEds0CaDbzEue7gNXpJZaKtEGWrLLapJ8BKL92gXTk86/S35UwCb4VA2yMu
         5G9uhVcpgXgTKFUkAAAe+mhPdhMpqP7zyKZUJ1X1bUrzr6KoJIDaqOT/03WpNHx36zA7
         d5OJVVtBD1gwvV+BdaX8OcdadwBEL4Xzs3vtx+kWEP7Q05mWYsP/B8Gy/288XTEYxSOy
         EvJw==
X-Forwarded-Encrypted: i=1; AJvYcCXbQnqXjDZ+LoKxwItLsISTeaqBXWz7zOeg9txE3wlbx/GfotRUeM+cXfY4s3oM9czrezyFUaYJXSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNxgCWlyhgKWO1YXwuE3G3ibuljVGBXLFyeKplocd0QDD1hlb
	4oVTeGhyXPIv4xbvdrz35qr+v0a9tPyp6YBBHLVH4v3hmZCD7ln4lxFuH53XucxGoXHk/92WMil
	dRBv+WnB4p7JRp7a51NaMik6fM06b9rWQyDo=
X-Gm-Gg: ASbGncvwL6zgTY6ZYADRTQd30IstBzjH58fD4UHurHC3aWFkq1kdly083rcMKGgDcFv
	m8RddEQSscL5/VPNNzKXZBYERy/z1Ik+BfyAjoh7MBCXaBkMSD9UBSrsZe7w13r+2lXEoztM=
X-Google-Smtp-Source: AGHT+IHj1WaCwdLIeOJQwUSqMlgu1w1wEqKLSbd+6vUfIrTmpSJ5GWqzVdkvuLE0Qx5JK3woy/BaeAEYc91L0LXZasQ=
X-Received: by 2002:a05:6820:1c88:b0:5fc:b28c:d74d with SMTP id
 006d021491bc7-5fcc55e7795mr7696029eaf.1.1739894416078; Tue, 18 Feb 2025
 08:00:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218111150.3024-1-tolvupostur@gmail.com> <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
 <20250218133039de7b063d@mail.local> <8163c8e0-58d6-44a9-a5a2-6478fe4b0ff8@app.fastmail.com>
 <20250218154057079fa7e0@mail.local>
In-Reply-To: <20250218154057079fa7e0@mail.local>
From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Tue, 18 Feb 2025 17:00:05 +0100
X-Gm-Features: AWEUYZlP4Snox_J2WiUQPJU-ZwRRMqVz73yeHuUt5wBISbayLc2DX0YP5R27FqU
Message-ID: <CABhNV21A5xR6_r5TE3gVKsEaSjaDyot-z9A+tYLtbXB+HBXnbg@mail.gmail.com>
Subject: Re: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit systems
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Feb 2025 at 16:40, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 18/02/2025 15:51:24+0100, Arnd Bergmann wrote:
> > On Tue, Feb 18, 2025, at 14:30, Alexandre Belloni wrote:
> > > On 18/02/2025 13:45:56+0100, Einar J=C3=B3n wrote:
> > >> Hello again
> > >>
> > >> On second thought, removing is too general.
> > >> But it's still very much broken. Is there any reason why this was no=
t
> > >> merged?
> > >> https://lore.kernel.org/all/c5e8ab50-aacb-4651-8893-a6dd9edcd155@app=
.fastmail.com/T/
> > >>
> > >> Any thoughts on how this should be handled?
> > >
> > > The first step is to convince Lennart that mandating RTC_HCTOSYS xwas=
 a
> > > bad idea, the second step is to let userspace set the time instead. T=
he
> > > kernel can't take the proper decision because it simply doesn't know
> > > whether userspace is TIME64 ready or not.
> >
> > It's been seven years since the you added the workaround, and
> > there are a few things that have changed in the meantime:
> >
> > - most distros that use systemd have stopped supporting
> >   32-bit targets
> > - most distros that still support 32-bit have moved to a
> >   64-bit time_t
> > - 2038 is only 13 years away instead of 20, adding to the
> >   urgency of having future-proof default behavior.
> >
> > I don't know how many 32-bit machines are affected by the bug
> > where they return a random time, or if they are more or less
> > common than in the past.
>
> This is going to break some of the Marvell board that RMK uses because I
> guess he is not updating his userspace.
>
> Also, I'd note that OpenEmbedded switched to 64-bit time_t by default
> just last year.

This triggered me on a yocto build (armhf) that is indeed using 64-bit time=
_t
and systemd. I just assumed everyone is on 64-bit time_t already, since gli=
bc
made the change like 3 years ago. My bad.

> I'm not against removing the workaround but keeping it doesn't actually
> break anyone, it is still possible to set the time properly from
> userspace as it should be done anyway so I'm not sure about the urgency.
> The impact is mostly about messages timestamp in the boot log, before
> being able to run hwclock or any similar tool.

I have over a decade until this becomes urgent.
I'll be OK with it being unchanged for a little longer.

> Or am I missing anything?

Without a doubt. So let's not rock the boat and keep it as is.
Although printing a warning before err =3D -ERANGE; would be nice.

>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--=20
Regards
Einar J=C3=B3n


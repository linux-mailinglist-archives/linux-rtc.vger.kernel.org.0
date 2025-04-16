Return-Path: <linux-rtc+bounces-3968-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95185A8B779
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Apr 2025 13:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F413B22CA
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Apr 2025 11:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2E623A9B3;
	Wed, 16 Apr 2025 11:13:17 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14B1230BD9;
	Wed, 16 Apr 2025 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801997; cv=none; b=CLfp1iKWlJC09Iz4JzOFTROp6U+keCa9/MukFBexJHXjCXk3DrF9+Df+3Si1cLBISA85Jnj1tTsQe+RwV81uoP4OdkbJmOcghOsdwfbUJ+LwnDfmRkDtJOkmuG7HGWthrufm5kvk6mymwDSGIL749ifYTs3PseQIsy+QzH28Hs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801997; c=relaxed/simple;
	bh=sOc+D0tolTcUGJ9KPHoXk+kBoSFT8/GUfkzNFqzDPzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYE8H19GZazTdwipOnuRDuktUJYmo8b9TwIoUMgOaelL7hW8kzzggva/A6LzNMb6grnwKSC7Sr6DCXMC6eY6PiayBTP9yPqaaiYw9iGlldm04uEGI6dPnp6susG4oT/A37dzrTCpLYpBkmfMXL+lbmj5/MKOhqJ8+5YZOSITRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5262475372eso2730321e0c.2;
        Wed, 16 Apr 2025 04:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801992; x=1745406792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MocR616+VqlYQgKAO9looh+5bl/oUxpGHWgrj7ut1gY=;
        b=YvNMRqd/Ri2E6uY5dZjEebDTvHCDbu6Rq+M/KmZ5qkcYrfYfFwG/aExDWVExRBHntA
         QVDk4oOF+TmRSIzZ+6fIp0aDRf4LWFkNBSQ0LgWv2xcDnnyi9W6T00c7vnlRJF710CTi
         8wdwHQY0+kCLEpzUBuGlIygk7NkHhxyLVLiiJdAWlzpg7YriFPKA7hg5cOHbLu05yZ/v
         o33PpKrv9A3jQ5J8D30IJZ/VfkQhwzmo5Evp/CzVc8EpagvWXvDxahvb9vOfmi0B9O2o
         RDALX9c3q7gVePwldpokH7C7UIjOLXuAkHt3YOlZMM+AgpPBrB61g0BMtjvpAs9bAfo1
         wLnw==
X-Forwarded-Encrypted: i=1; AJvYcCUxGVyaw2TJMtrRjThVoDGaaCCkXmkdxpSCLRFTzDDIEtrbt82J2PDL6qDRTWmGdVjCuHWQeP6qo6tX@vger.kernel.org, AJvYcCX894TN7okdCUn2QDEqX2uGO3OEJTs0uHUcW49j/3HhPmJJtIAm2ssMGIcFRIgX1zH9Yb7TfW5e1V4LyXWL@vger.kernel.org, AJvYcCXeVfS7kRwT44Ir0vQkk9IVhct4WHwihZQD/j8p0QFb2JyYKHp9LrAJnKhMVrexeHI9mOFUQ7MUHtZs@vger.kernel.org
X-Gm-Message-State: AOJu0YzjeC2RdXlNzHSQRGHKu3wtCk3cWS+dTevdI6zfbawqghqwKvPj
	x4qd256D6cve77k5yQGKbVygqjjcHY3bLw3z3+YVncN4e60hsEPKUo/hiA5x
X-Gm-Gg: ASbGncucB9DqEfxQo+9lnt27jtIFkCyQTk/O7wbezF/eZ+V9mpN9alEzB8J3r/nfdWT
	b9H+YGR/cS064VZ0YYMcNt5vnR+fKfMlnw+1mGpGiewNL9osi2qbF+sczm+hLPV/NLbyWegAWvH
	xkNLm3/S2l766uBsTr9RQYXtH/MrdR5RP0dBvbDewona2VEc6HNO85ahBVdbWyOAcbC7+7zEKI+
	3dRBDQeHf4ICD5xYqBigWpRHq9qVkNCW2QviI/l5a3kqrV2CIVDknVjWglUmtpQyEN35/ykDAxM
	2jQQdlSt738EKAoeW30S1ajE/PBkTBC6GIsrO1xB325iQgff4tKUL28NPUNIrWxe9/EyOaXojds
	2V/k=
X-Google-Smtp-Source: AGHT+IEmyT0XqqO/RVFmwLEG/URFxo9rKk0kXubHpUh/sz4yC3NCBWMjvghdHBXqXXgMwseAgRUbqg==
X-Received: by 2002:a05:6122:3bc2:b0:520:5a87:66eb with SMTP id 71dfb90a1353d-5290debefcfmr557013e0c.3.1744801991987;
        Wed, 16 Apr 2025 04:13:11 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd9b3desm3044757e0c.23.2025.04.16.04.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:13:11 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so2558267241.1;
        Wed, 16 Apr 2025 04:13:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeVEAKkO6nWZlWYQ6SKRb5cJQyGCYvXAyeWQIuwafJSbx5eP/J4io83z5G31xVC1MuRhIVdMEcAP5l77yK@vger.kernel.org, AJvYcCUzujGHKzpb2ouAmmtjjw5b0d2L6F4Ai4QKysZ6ritU7UYSgoS5Xb+gLyMgzCsdKccjZPRecpJubHnl@vger.kernel.org, AJvYcCXGswo+ZQ7Y/KL/H70uFWtJys7zIYzzQP4XvNc87cBLtXFiKka/gNiAmL6AnfhFB7PstvSGSj8E/x40@vger.kernel.org
X-Received: by 2002:a05:6102:2991:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4cb591e784bmr414553137.10.1744801990755; Wed, 16 Apr 2025
 04:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com> <erttkpna2hzg7zuddzlocaou2wqcwmgcxfhldwdt55yleie6dm@nfg374fv66fq>
In-Reply-To: <erttkpna2hzg7zuddzlocaou2wqcwmgcxfhldwdt55yleie6dm@nfg374fv66fq>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 13:12:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3u97MtDiPuJgFtO5YTRuLeDHgs4tx7004CScLO11WkQ@mail.gmail.com>
X-Gm-Features: ATxdqUHjMszLt95drNgnUajxAYkWqRme3b0HzHSYcdCgcByHGIiSYzx7n6CDpNY
Message-ID: <CAMuHMdX3u97MtDiPuJgFtO5YTRuLeDHgs4tx7004CScLO11WkQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding cast
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, 15 Apr 2025 at 00:30, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Fri, Apr 11, 2025 at 02:35:56PM +0200, Alexandre Mergnat wrote:
> > The RTC subsystem was experiencing comparison issues between signed and
> > unsigned time values. When comparing time64_t variables (signed) with
> > potentially unsigned range values, incorrect results could occur leadin=
g
> > to runtime errors.
> >
> > Adds explicit type casts to time64_t for critical RTC time comparisons
> > in both class.c and interface.c files. The changes ensure proper
> > handling of negative time values during range validation and offset
> > calculations, particularly when dealing with timestamps before 1970.
> >
> > The previous implementation might incorrectly interpret negative values
> > as extremely large positive values, causing unexpected behavior in the
> > RTC hardware abstraction logic.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >  drivers/rtc/class.c     | 6 +++---
> >  drivers/rtc/interface.c | 8 ++++----
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> > index e31fa0ad127e9..1ee3f609f92ea 100644
> > --- a/drivers/rtc/class.c
> > +++ b/drivers/rtc/class.c
> > @@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device=
 *rtc)
> >        * then we can not expand the RTC range by adding or subtracting =
one
> >        * offset.
> >        */
> > -     if (rtc->range_min =3D=3D rtc->range_max)
> > +     if (rtc->range_min =3D=3D (time64_t)rtc->range_max)
> >               return;
>
> For which values of range_min and range_max does this change result in a
> different semantic?
>
> Trying to answer that question myself I wrote two functions:
>
>         #include <stdint.h>
>
>         int compare_unsigned(uint64_t a, int64_t b)
>         {
>                 return a =3D=3D b;
>         }
>
>         int compare_signed(uint64_t a, int64_t b)
>         {
>                 return (int64_t)a =3D=3D b;
>         }
>
> When I compile this (with gcc -Os) the assembly for both functions is
> the same (tested for x86_64 and arm32).
>
> >       ret =3D device_property_read_u32(rtc->dev.parent, "start-year",
> > @@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device=
 *rtc)
> >       if (!rtc->set_start_time)
> >               return;
> >
> > -     range_secs =3D rtc->range_max - rtc->range_min + 1;
> > +     range_secs =3D (time64_t)rtc->range_max - rtc->range_min + 1;
>
> In the case where no overflow (or underflow) happens, the result is the
> same, isn't it? If there is an overflow, the unsigned variant is
> probably the better choice because overflow for signed variables is
> undefined behaviour (UB).
>
> Respective demo program looks as follows:
>
>         #include <stdint.h>
>
>         int test_unsigned(uint64_t a)
>         {
>                 return a + 3 > a;
>         }
>
>         int test_signed(int64_t a)
>         {
>                 return a + 3 > a;
>         }
>
> Using again `gcc -Os`, the signed variant is compiled to a function that
> returns true unconditionally while the unsigned one implements the
> expected semantic.

Hence that is why the kernel is compiled with -fwrapv...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


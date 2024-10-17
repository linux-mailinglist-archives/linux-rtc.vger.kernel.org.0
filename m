Return-Path: <linux-rtc+bounces-2223-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F689A1C2B
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 09:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FC228B045
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 07:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC901D1724;
	Thu, 17 Oct 2024 07:58:02 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0159C1D1305;
	Thu, 17 Oct 2024 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729151882; cv=none; b=pjthtONwltwpcUpcOzqaOEP9yU2SAkaQ6MXB4bAkhQefGopQXIbC1WjTfaUvP4oTMclwy5lfN7UtPJtPZeH6XLmtOEjyUzF9Rf1Kymx8cEBtM8eiFmb1JQXUJlbL6y8yRABcnqlcF3BLwj4qFxuiKJ6LwzrcaGTCAWGk1+LO2A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729151882; c=relaxed/simple;
	bh=woqpLgPaCGTfQwJCbL++cbC9965uQEph1RaJOWeQuFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFItZThm6tdmnhH6pW45wO0HO/FFV+Nvaev7boukLi9ronIdzfWm76O8PVSY2SaPx3MHro/NDLJc2hSsbjP6sVf6889k+RXgTnPq0YtS5fWYt/MgjLqfLZaYN+kvuxxxApzbrXJ+9qQ/au2TvYbgHb9pjlC0vWDgQOZ7UqqRiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e305c2987bso6616387b3.0;
        Thu, 17 Oct 2024 00:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729151876; x=1729756676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJ9Z5bkTMD0ssq0KU7rG5p7vpm3/jzh43vgsYHiTFUQ=;
        b=qy0+9cFT5n66X0ouYKWgWLzIgJ+F+5/Q4Mxq92DrdEvs60CYhNf24D/Rel3VmNcecC
         AoilkHrKwa8YGjKPJWty41+Ti7U7gfCx+hDgNdGnsXGehojuIAUaI8B27sxIbuZnP+19
         3QvZwG4VIOpdvz3JHPPV8h+IDv10F6d0bh+cEFp3RC0WazVP8xjxgKsLA36/2ZRxh0qA
         8VnZigmNccpXWjdiYF71ITF2GKPIjwv75qLAP9kgBYMUwIcqO5dVP7D/B0InVWyuJnDt
         jJKwYN0hgDec8IzzjM1Mf17MjnbsDMkUPtoH3LXKpELVAXTmag9S8mPG1iUBj4DHyWaB
         Tvwg==
X-Forwarded-Encrypted: i=1; AJvYcCUOWoWbjVgnBG8BIHbAe0LoCKNf4cRb28CLX+xP0ZEwaNzoVGi95wABMr8ir/EH/AZQ6IbDJpzE474B@vger.kernel.org, AJvYcCVKFwRABAwqtAh2V1jS0LNAtSqgh93hEng1gOYl5nxBNJWXKi2nwYMXKg8GjLHeSpsAU4GOF4vRsjA0@vger.kernel.org, AJvYcCVdXBE03AGY0xOkJUZ0YQvwl471wqanzybMFM5eG5LsPXllD5M9TncJMi+7jxzeD9gJI0n/5xzUtGy88OjEKP+EWZ8=@vger.kernel.org, AJvYcCWhb6jwExYcE1My1um/y0jpGli7aK4zWmqxGGt/ay+sT2SK2koEvMULZ0FBehCqR9RfKZWwM2pCzPMYoxDd@vger.kernel.org, AJvYcCXiuGCtCzVJl95qT4wZJVlSEruQ3cjbtV27uEgnbL3RMtEkhMl0Uj8B9Wemjz/1RgiHshpH5/oXTrz/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywznvd4HIoTvfhEnJS2X0d2SV7VfD+5tWfYOuw5XCY6Rj41/HUX
	MVQCS5qA0ayeNG/w2omXFzHJ2pfKH2QgyAV7o5QoL8FVWkTQ+KmXouv0xp70
X-Google-Smtp-Source: AGHT+IGiCATZl6mXyUfVHlY0qa9V98u2kI2RA0RPVfqbpMK2psyhELwgNvBCgVl7LZvv80JaAvdDnw==
X-Received: by 2002:a05:690c:f0c:b0:6e2:ad08:4914 with SMTP id 00721157ae682-6e3477b9fe0mr193699837b3.9.1729151875887;
        Thu, 17 Oct 2024 00:57:55 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e3c5b8481dsm10183347b3.60.2024.10.17.00.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 00:57:54 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e305c2987bso6615947b3.0;
        Thu, 17 Oct 2024 00:57:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJvyJMj7O878aKBlyRz7cRgmm1b522AEByDzDYzU09+oWEGlW4C4rHy076r8/nIbXRpZdMKL+TDbeeojaC@vger.kernel.org, AJvYcCUeDGgIywmycnsafdaDTxNCGvky9iU9rKbd1CMuEKCqEBdzI4WTk4RAtwKttmK2ij9eumN4z1TcmA6MTOa4qMIT6fg=@vger.kernel.org, AJvYcCVFNZRT3mALoXbnt048GxEEnUVqWusf96U2MsXV9G3heaCgs5Vu1d3JUGOpxcbQQn1whA5TyLhbs5Ez@vger.kernel.org, AJvYcCWSeX7XoeUDjwEL4MRBZB8EemmHauHeu9TdLHO6xMFVArpMPBKrz24Psj8jLv8dtMk5qNWpW99JVjKm@vger.kernel.org, AJvYcCXWdcw3nJAlfD8wDIgTeHweg8rgB58skZeZaD6k+47QiATv9q8GdtfaZFkLQB1D34JbIQAWSRUudvkq@vger.kernel.org
X-Received: by 2002:a05:690c:397:b0:6e2:83d:dfb4 with SMTP id
 00721157ae682-6e347b2f2fbmr194940597b3.34.1729151874560; Thu, 17 Oct 2024
 00:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVqno3vO9T0FtHnNL2afWP4abSE4vmf8vkLRRndg=ws7A@mail.gmail.com>
 <4ff318b0-cd7c-4857-888c-a07c8985fce9@tuxon.dev> <2024101622034648032b39@mail.local>
In-Reply-To: <2024101622034648032b39@mail.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Oct 2024 09:57:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsQrPOz-JP5xgcj0yMBgNpNUG9_anqyQpkh8z6fUZcBg@mail.gmail.com>
Message-ID: <CAMuHMdVsQrPOz-JP5xgcj0yMBgNpNUG9_anqyQpkh8z6fUZcBg@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: renesas: r9a08g045: Add RTC node
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Thu, Oct 17, 2024 at 12:03=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 11/10/2024 13:28:55+0300, claudiu beznea wrote:
> > >> +                       compatible =3D "renesas,r9a08g045-rtca3", "r=
enesas,rz-rtca3";
> > >> +                       reg =3D <0 0x1004ec00 0 0x400>;
> > >> +                       interrupts =3D <GIC_SPI 315 IRQ_TYPE_LEVEL_H=
IGH>,
> > >> +                                    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIG=
H>,
> > >> +                                    <GIC_SPI 317 IRQ_TYPE_LEVEL_HIG=
H>;
> > >> +                       interrupt-names =3D "alarm", "period", "carr=
y";
> > >> +                       clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK=
>, <&vbattb VBATTB_VBATTCLK>;
> > >> +                       clock-names =3D "bus", "counter";
> > >> +                       assigned-clocks =3D <&vbattb VBATTB_MUX>;
> > >> +                       assigned-clock-parents =3D <&vbattb VBATTB_X=
C>;
> > >
> > > Don't the assigned-clock* properties belong in the board DTS?
> >
> > It makes sense to be in the board DTS, indeed.
> >
> > > In addition, I think they should be documented in the DT bindings,
> > > and be made required, so board developers don't forget about them.
> >
> > It would be better, indeed.
>
> There were multiple recent emails from Rob saying that assigned-clocks
> should not be part of the bindings.

You mean "In general, assigned-clocks* do not need to be documented
and should never be required."[1] and "Whatever clock setup needed is
outside the scope of a binding"[2]?

In this case, it's not generic, and not specific to "renesas,rz-rtca3",
but related to the integration of RTC-A3 on the RZ/G3S SoC.
Which is indeed not relevant for the RTC-A3 bindings, so I agree the
assigned-clock* properties should not be part of this binding.
At least they're present in the example in the bindings ;-)

[1] https://lore.kernel.org/all/20241015211540.GA1968867-robh@kernel.org
[2] https://lore.kernel.org/all/20241015164609.GA1235530-robh@kernel.org

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


Return-Path: <linux-rtc+bounces-2142-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33699822E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 11:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C6DD1C240A7
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 09:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188D51B5EBC;
	Thu, 10 Oct 2024 09:29:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E727D1552FC;
	Thu, 10 Oct 2024 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728552582; cv=none; b=A6J2eSKIDKv0vGkXAyrOkMnSLCjUPTA8QS+VRzfoUdHOnwx8PpukN6YN1+42dU1M+oVyat820+Snh/D/GeihZ9FD7u8smv2euuOyvsAt5Q3G3SqwJ4ZqyfYREx9PShYoplf7CTc8UUkK52ZSCHLIcboYEYs1PFivfVw6tkCOx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728552582; c=relaxed/simple;
	bh=3PhQhBX/cDzwmSNYvkeaadDnXuaqJFOOfD26tjgtMKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hb71EVscWJ0R9E6pbWc06VAWz2uPv+ipxNUgEAUOt07tV0hlQp4N0YTaWNuXH/IHiQFhuiD2vrr9JZojoMqTuKwSQC/38WZPwPUzWRUHUUeAHZvuRkkC6+gIqeCRa0rlfTZfyEKMfnWfSBCHtYrZF3AxI9ZFZ46ww8YdMQED4ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso733502276.0;
        Thu, 10 Oct 2024 02:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728552578; x=1729157378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIpkFoyH7xGEmp6Cri7WzAs1H6AzrtVGMzVSG3KUQ5U=;
        b=d8+TeKmLKo5ucYSvYRKIzom5SJlDVRzv7ETSWFLY+tTLOwzMPQj5zJhVXWb2LvG0MZ
         nK75Zrkx0t61UCpz36gIqeXOCkRODl6e6sq8QwzebCQ0IjP9p5gnQ5Rs0xrhhbjkt8tO
         BBmd5cwuRvRGNivCzvyfbneqXOaY1U4FSCO4XKhqDbw3eUYzPKriB1TiEB+B0Kaczpto
         kdU34KSFWlKZCAxB0n6ateks85WqbcNEyLaIJ1BSp1yQpri/LWaYmDJcAF+MMBM8Qsto
         CtJPyt6KyCMlBbYxY9YGERir0cNY/gmyUZOCkxQ0fucCL/VSTqHSAP9Lq/+xnaGX9zaQ
         D0PA==
X-Forwarded-Encrypted: i=1; AJvYcCW+lPLyolPDnqf/dAm2kkDcabju5ND9UWycLq71bsgFHO91vZ7BmibmyS6gVrwGE0wZhlzyJXbURUpV@vger.kernel.org, AJvYcCXCOXexYkM5Z6d8aG4fZVQBc+qo55zrzAPrSSK5Z8a86I45qOKVd5nOG5zMFYyy+kGyLso2mxKSaKr2@vger.kernel.org, AJvYcCXR/2bPBYLK7lIOcualKUzyITd330VP0qNFfL+02BC1gGxZ0v/Bw6HIE4LTelSvRkwCNC7BhoKrDqhi@vger.kernel.org, AJvYcCXSnBW6mmZIRuyXD4swfPF6JSwgjPIVFMy24TRoZBxFRv3czF6qL1U8PeXSzWhT9n34nZhoMkxnt5DzyK+GC9mA0Es=@vger.kernel.org, AJvYcCXt1zfY7kSvZ1VuGNn3m0MMA/mvwZSKy5//wd0vnYlYf9CDNLCMHjd2+pvU3hD87tua7loWPZbO7c0dWfPx@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFomwiMkHlWrWakAZRwfl5ynMmrv/L4E/3YTQZ5DE5YyUu8zC
	FK2W7zllNHz5kp9NAin5iHHgIJZlAVUD1SrT64RH0o0kfLPf8FqY6+tc8QVO
X-Google-Smtp-Source: AGHT+IEITeRqZai7zVrTHzIhSWiLlDHYxuIfLuix/cZ+vAtVjBglIPjXLnLBoOYXIdbbeownnSej5Q==
X-Received: by 2002:a05:6902:2001:b0:e28:6758:fb0e with SMTP id 3f1490d57ef6-e2909c1a9ecmr2801842276.16.1728552578535;
        Thu, 10 Oct 2024 02:29:38 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef5c47bsm216133276.42.2024.10.10.02.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 02:29:38 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e2e4237da4so7140377b3.1;
        Thu, 10 Oct 2024 02:29:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLfSsKUzE2w43UcyebsoUHqbBC1wnikq00+3k361eGNjoClpFbOK1+q5kXQsbVhQDXjYRjUL4cazhu7fRqcCjzSq8=@vger.kernel.org, AJvYcCVad7yFI30fIhqAWJkidI4VNeI7Z+fuQrhgBBxt/gKMb2R2MzCm/0lkEkuy4Jet4iPjMrEywkQclv2TUOyt@vger.kernel.org, AJvYcCWDVfX+edS7UVWcoTe9gZXjACZVrujyk9BPgPCikog1RzhvlKVS77g2ssdtAKGH5tEfUC3AIRXEmQhl@vger.kernel.org, AJvYcCWsCW5x9kJ2pIqnEgdyHmhikhbD8L2v5MfjENG0FyR7caxP63ICuR5UyfBFA6OJrGJSk2InGdagkraD@vger.kernel.org, AJvYcCX+rEp2FmCFetGp9id7mFxl/gYu1wXLyVIk1t4l7/1YbFKbEphEeVGGh2pAc+uhU6X4/oq2muOG6xl/@vger.kernel.org
X-Received: by 2002:a05:690c:388:b0:6e3:2f9d:59fd with SMTP id
 00721157ae682-6e32f9d5d11mr21861857b3.31.1728552577749; Thu, 10 Oct 2024
 02:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 11:29:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeGC_N3-XF29+UUR43OGJKqVNNHs042J8HRuNpiD=vOg@mail.gmail.com>
Message-ID: <CAMuHMdWeGC_N3-XF29+UUR43OGJKqVNNHs042J8HRuNpiD=vOg@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document
 the Renesas RTCA-3 IP
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Aug 30, 2024 at 3:02=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> The RTC IP available on Renesas RZ/V2H is almost identical with the
> one found on Renesas RZ/G3S (it misses the time capture functionality
> which is not yet implemented on proposed driver). For this, added also a
> generic compatible that will be used at the moment as fallback for both
> RZ/G3S and RZ/V2H.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - added RTC bus clock, reset and power-domain; it has been detected
>   by reverse engineering that RTC and VBATTB clock, reset and power
>   domain are shared; HW manual doesn't mention it
> - updated example with these and with assigned-clock properties
>   needed to configure the VBATTCLK MUX with proper parent
> - updated example section with dt-bindings/clock/r9a08g045-cpg.h
>   and dt-bindings/clock/r9a08g045-vbattb.h includes
> - for all these, dropped Conor's Rb tag

Thanks for the update!

Sorry for chiming in late, but this RTCA-3 block seems to be a
derivative of the RTC blocks found on older SuperH SoCs, and on RZ/A1
and RZ/A2 ARM SoCs.  Differences are found in (lack of)
100/1000-year-count parts and the Year Alarm Enable Register, and in
some control register bits.

The SuperH and RZ/A1 variant is supported by drivers/rtc/rtc-sh.c;
DT bindings for the latter are found in
Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml.

(My first guess was that RTC-A1 is used on RZ/A1, RTC-A2 on RZ/A2,
 and RTC-A3 on RZ/A3, but apparently RZ/A3UL does not have an RTC...
 Oh well, at least it is used on later RZ series SoCs...)

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


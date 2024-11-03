Return-Path: <linux-rtc+bounces-2439-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC2E9BA52B
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Nov 2024 11:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3500828183B
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Nov 2024 10:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA960167296;
	Sun,  3 Nov 2024 10:36:04 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91273154BFB;
	Sun,  3 Nov 2024 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730630164; cv=none; b=ZXPpb3WrbAiKSAJlZgD2EtkDVwv3WsdHH7Y4Q8mT7regu3U6w/iG2f1udib3aCic4xFu+oegFv5KdfBOVbOJ4Hd9iW1ODlUv9gntktL9t7Tqbbqf2Wi0WMFvWQvA2j3Ug5fG4ODZRfznHpF9y8rFNhQK/ZEalIMrpC5N0DfJpfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730630164; c=relaxed/simple;
	bh=tVmykVXvLosgHNeME37N10pXj0NPlF2mZGHrprv3SBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmBF1+1MX/hQqMVsuGluF48plTkJqQb0ucwK/QfScWktAPYfXq5neT3lhYCC5m7FUZ6y1XxcsfcDlb5JY8OaKuR1QhWcmd3qOxFSH8miNHNLLhQNyapkNUINaC7g+RXdG9qzQIFLyk+TgRG0XMAIz7/EPCnrjAUoYjqV+LNeS70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e292926104bso2951451276.0;
        Sun, 03 Nov 2024 02:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730630161; x=1731234961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rxI8+R82FkhXbdk7eO8KDrDLgj0MsO7XK9vQ4Tu1FU=;
        b=xDplMs/InlF/NWkVrPaLWibw8REnUpQmbF/O+1pM08HQbZNYFVvYKZh0dO11/SZTmF
         NMlZJDE52I3ronyW7WdOYn9sMoPC/T4sgh6ZqCQX4PdkfTm+ommoLpvqP9E+4xyyRomc
         cO+T4hCXl37hQ6cA1ui0I/XHvTrx0wpFhLUCBs2r5+fDuTNlyFiDM68zDw0EOECQSj4J
         4Hi2+K2g1iUiVAbyPQapa4Cx13G4OEER3IuYVPLLJXp4p11GxGM3BPVcwwDuO+He7j+j
         //QgjABFiAmGHewjxw5nI5MutOg3Gt+N+VeXbyPmMe20ZOCJ1H1wEIXUj68LiR/dNlYi
         qTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFggY/RKsr2cr547ynX9RTzzIFXPEux1Fb6zbZX6d70V3S2YmZiUYxR6fx/Ff6yX2aS/T8joz4M8ZK@vger.kernel.org, AJvYcCUcqv7t5F9SAajI8r0h7vZw+09edcXEAdUO7wD9jJAQtZo/AKgOD6GSaOuLOaTZDWJj2yfNLm2Muhg6@vger.kernel.org, AJvYcCVgOgKQ1f8UOwETKkJ7K3O9lOi56IdFYwWyX58tsjAe3thNCfcuSwidfYZ3fNsI14RsOAeDoIWPwOI6@vger.kernel.org, AJvYcCWFY0q2Sm/k719w0DwSeX+2SN81vrwZQ7Q1vPJzJEGPEpr2iJxxPIe553TCHLveZ/xhcnlBWRXWvko6Ogpe@vger.kernel.org, AJvYcCXGXDh3oLDIvtKYO35jggkFVE2aBdXczVfZzgnEN9HnT6u56ro8O3fzeyJzMMSyAPI+sqD4eu2dumZGhr9/DSeCqXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjh8pZI8MUCVz/T0bnr1pBOepGLWb7JpUoRknEo2Fxp01sE4tS
	qKYPf/4OWd345NLOFfb/5Sl4oY74eeaInanSFWr/p8/noc+xOSHQxbLIEjG+
X-Google-Smtp-Source: AGHT+IHz8OQQbvFjJ6PFzJ3uhcgLK1pe60+E+8T68D/CCc/Zh49X//zQljtPpUpOtFOZDFk4oOLSMQ==
X-Received: by 2002:a05:6902:2b84:b0:e2b:ce99:909b with SMTP id 3f1490d57ef6-e3087c36061mr21564111276.57.1730630160642;
        Sun, 03 Nov 2024 02:36:00 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55b2309asm13938757b3.57.2024.11.03.02.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 02:35:58 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so2739122276.3;
        Sun, 03 Nov 2024 02:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJbcePhf5ZKicypDq7wUo9JP0K99/4mWQmG2o3/sbcPGQ3n2kNmDwuqUFR/3bAwMw+0GDLUkJlYo3PskHcaii5LFY=@vger.kernel.org, AJvYcCUpNaSx2TgUHkXt2cE7ZNSOjqlS4t7emoe8UM5s0WqsJhKA+bguOnIlNxQJ+ihKQb2LIBRC+iyzsl0z@vger.kernel.org, AJvYcCVhLUGes+8HsEHCJrGKXdQgWx+twN7J205igRijczVQIRyhrtUHNWnZOWBJUQ2iA8ZgnmDiz2qc8/h9@vger.kernel.org, AJvYcCWQHkxFek8G3hrVJyDvvfD9miHcQt3xZKy3EmUmjaNarvc87em6LpmG6U1k1EzHkOWUaypxitOlXCg9@vger.kernel.org, AJvYcCXdChaRJwAxEuGwUVvsVa5B/N+G9XJqf+MfT2HFTTkEUQOnNKY1Te0EGA1OIL6tRGErbV8eZWVmEmbvCMqI@vger.kernel.org
X-Received: by 2002:a05:690c:31a:b0:6ea:6876:5226 with SMTP id
 00721157ae682-6ea68765303mr77877237b3.23.1730630158376; Sun, 03 Nov 2024
 02:35:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com> <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Nov 2024 11:35:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdeq_wTdtrn28yhm+Ue==FMJ=0dkEAQTkrNUDRtcQ3Ew@mail.gmail.com>
Message-ID: <CAMuHMdXdeq_wTdtrn28yhm+Ue==FMJ=0dkEAQTkrNUDRtcQ3Ew@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] rtc: renesas-rtca3: Fix compilation error on RISC-V
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

On Fri, Nov 1, 2024 at 10:57=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Fix the following compilation errors when building the RTCA3 for RISCV:
>
> ../drivers/rtc/rtc-renesas-rtca3.c:270:23: error: call to undeclared func=
tion 'FIELD_GET'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   270 |         tm->tm_sec =3D bcd2bin(FIELD_GET(RTCA3_RSECCNT_SEC, sec))=
;
>       |                              ^
> ../drivers/rtc/rtc-renesas-rtca3.c:369:23: error: call to undeclared func=
tion 'FIELD_GET'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   369 |         tm->tm_sec =3D bcd2bin(FIELD_GET(RTCA3_RSECAR_SEC, sec));
>       |                              ^
> ../drivers/rtc/rtc-renesas-rtca3.c:476:11: error: call to undeclared func=
tion 'FIELD_GET'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   476 |         cycles =3D FIELD_GET(RTCA3_RADJ_ADJ, radj);
>       |                  ^
> ../drivers/rtc/rtc-renesas-rtca3.c:523:9: error: call to undeclared funct=
ion 'FIELD_PREP'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   523 |         radj =3D FIELD_PREP(RTCA3_RADJ_ADJ, abs(cycles));
>       |                ^
> ../drivers/rtc/rtc-renesas-rtca3.c:658:8: error: call to undeclared funct=
ion 'FIELD_PREP'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   658 |         val =3D FIELD_PREP(RTCA3_RCR1_PES, RTCA3_RCR1_PES_1_64_SE=
C);
>       |               ^
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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


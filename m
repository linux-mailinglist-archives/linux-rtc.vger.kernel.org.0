Return-Path: <linux-rtc+bounces-2298-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E69AE898
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 16:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8ABC1F211C3
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 14:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1981F76CE;
	Thu, 24 Oct 2024 14:22:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70CC1E1A1D;
	Thu, 24 Oct 2024 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779721; cv=none; b=ra3dLaLu1+VH2GYkzkbwXUxCLWJthOLxXYrQlC4ehH9bC6yxvldrhHjin49pGw1t+oDgFWHgy6N/ug5JABS05WOzEM8NJhNU9bXwZYild61MZxnpTWERpn/MNplafW+309Wm2ZWIKCR10WCAMYzcI+U+EQ2lnNRaJySAYxeF/kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779721; c=relaxed/simple;
	bh=dTe++PhNhr/w7Y1FSeBZrLg4nlZVU+dOWIBJpRGFMpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0lUHJP9M11x2aPsL83i6DGdl8c3VK5kjBdz6QQGC6K5o7aclxDRNL3HKI38+ZPDRlkDpYWrgjKQ5G3ioMif6wLtg3NpuAJtfHLWM5kfM/1rMQFm5EB5sED+gOaDQbxb9gf3FHOkVLuwdkU9pjS7YfMuz6+cXmpLlsWzCqQsZdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e3b7b3e9acso8926527b3.1;
        Thu, 24 Oct 2024 07:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779718; x=1730384518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIClXhU0TI8fTpRc6FjEoGvpVZnc0ncz4HYCuUXs2hs=;
        b=uvHr2ggtjAhDXfAF2t7C9x6v2V1DTFcjlXzYpTD5XQwb2Z6jIARHhfwcNZj4zoZ+cH
         DPPwIWpz/C2TmVyjRYX8UYmufiiyWcFZIDEUL3wTI4l71rdBVS3OPrka7KrkT4bpMdwa
         +oaIpmh6UXgmHahulfl8FCuNq9rvTKlOq6wS4OLtZU7F0D5JC1KW/M2xvzhnINVHl0+E
         Zi8YF0L9Fstf9ZJoNX9s8pE4AzU0vL2N7Ruo0mcxwvEcYQaQLByxsBUNRlb7dXcnB861
         fJM8qf+JsuHjxHUj98XKB4buyQdF9vygNA8Ki19mWMe/JP+7hDnG7tT+zw3a86X+sDzL
         GPUw==
X-Forwarded-Encrypted: i=1; AJvYcCUCbUR3KbUHsY4cnjIRfPHMb7NQHYTLpMhahTPxw3RMiyB84IVVKQuRV8jxejOU80KIpSxNrbYS2mLs@vger.kernel.org, AJvYcCULWUQQaHymAtxSsO/TuFtsuah674DGHHJo2iUF/U7Tp/T9+18CZH+xyAXz9EqVLTSR0Nx+/XvrWX1b@vger.kernel.org, AJvYcCUe9AxTYFrwAZEQTl9LHGCcpOAuIm1gQkEzRdEendnxqqGq4JtHSaVe7DUi/E93UK+8CNKfwJVPN73WGITNOR+ebH0=@vger.kernel.org, AJvYcCVacr9yorKs+veBHPzd6A+0ywEXxiKbMVjieTB6uxPmV+E+ZqBTDptVL09O5xEBZhdEmno1Dcfr1iocQ6HK@vger.kernel.org, AJvYcCXOghO02Pi9W6jrkX1vG6K35NH2vwvoHmGNNUNIaTMRycl6/eRLNm4O1iwN14io/vHf5X8MZFrZm9LU@vger.kernel.org
X-Gm-Message-State: AOJu0YyGbyi56AZi5WsJx/aMQRnyf2p5+pxooRonhRo+E6oiFYN/rEMR
	zORoLWdgUhzeH0bznnM41lsohCIkYQeD9gUcUZPDfb3N0awQHhwauWfrPGEj
X-Google-Smtp-Source: AGHT+IFgkBRp253MH8+wUvM2K6BlhIKfnnKzGV0kN5e05ipaSS6jgoyOn3ghKFHF6pk3chrfGKzVGA==
X-Received: by 2002:a05:690c:89:b0:6d9:90f3:1a79 with SMTP id 00721157ae682-6e7f0fa6c18mr73018387b3.32.1729779718354;
        Thu, 24 Oct 2024 07:21:58 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccb78asm19993777b3.88.2024.10.24.07.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:21:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e377e4aea3so8655847b3.3;
        Thu, 24 Oct 2024 07:21:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4WA7z6y6pM7GafI0IPJxzkwmriDXNSQ1LowsmsekoOmUORBlWvg10GUX32Ul8ouYftyLLXr5ClZIe+n2QaVQHZa8=@vger.kernel.org, AJvYcCX0/eG5wMdIBnivcRiGcKgEyBe26Wv961wfJYubHQiZFMEfGdBOasbXVBdkCy/5W8gPUtHwyIZJ16LR@vger.kernel.org, AJvYcCX75FRPdIzv9Z80RVbSMq9NglmvQ4BZ3LP/bewIavsLkHksr1OnCbmuDA37klqIQ0JetOProdJbm+Rm@vger.kernel.org, AJvYcCXImp+0oa5Bm3pHhvmQ2BeBp0d2vXVx1D26bIdymUN613Fx7UYl2rhzeqipi5dfNpoNnsfvzSmcwRaL@vger.kernel.org, AJvYcCXkq2/OCC76hvXoClp6gSc0amY4jMwKdwWfgpY5NWgDsrzHrFyP2CjxyM48OA/f/gIMSF90y4CkpZGpYJ5Z@vger.kernel.org
X-Received: by 2002:a05:690c:8a46:b0:6e3:2608:d5af with SMTP id
 00721157ae682-6e7f0e8bc99mr47613857b3.26.1729779716691; Thu, 24 Oct 2024
 07:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:21:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZeZQN4T1=wT=K4BCR_Wk02ZBaKVSC7WukC0UGseM12A@mail.gmail.com>
Message-ID: <CAMuHMdXZeZQN4T1=wT=K4BCR_Wk02ZBaKVSC7WukC0UGseM12A@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
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

On Sat, Oct 19, 2024 at 10:47=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B.
>
> The VBATTB controller controls the clock for the RTC on the Renesas
> RZ/G3S. The HW block diagram for the clock logic is as follows:
>
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,/
>
> One could connect as input to this HW block either a crystal or
> an external clock device.
>
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
>
> input-xtal
>   xbyp
>   xc
>      mux
>         vbattclk
>
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
>
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties.
>
> This allows select the input of the mux based on the type of the
> connected input clock:
> - if the 32768 crystal is connected as input for the VBATTB,
>   the input of the mux should be xc
> - if an external clock device is connected as input for the VBATTB the
>   input of the mux should be xbyp
>
> Add bindings for the VBATTB controller.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - squashed with patch "Add clock IDs for the VBATTB controller" from v3
> - removed "oscillator" word from commit description
> - added assigned-clocks, assigned-clock-parents to the documentation exam=
ple
> - used clock-controller for the node name
> - used "quartz-load-femtofarads" property for the load capacitance
> - renamed include/dt-bindings/clock/r9a08g045-vbattb.h to
>   include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


Return-Path: <linux-rtc+bounces-2144-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FB9982ED
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 11:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B85C1C20DE5
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 09:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D641BF80F;
	Thu, 10 Oct 2024 09:56:07 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2315B1BC9E3;
	Thu, 10 Oct 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554167; cv=none; b=RqPiCTFU7yO6AlJftuazfj63azMGPxTMoh3Qly8lXQuRi4Sm1PLQHWie90zr6ctavGhQiJHOsXPzYOFeaqRPenZ3NeFfyUjRGbaKjLoOpOI9Epcumd1CXSXEagFG1NdZYKUhihZFkV2Ou4YUPbAb47cfd8DuyRI/LbC1kE/00IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554167; c=relaxed/simple;
	bh=Z7s4S7xXxu4ckeZN8v9Ozmz96Jx33levV6RepYO7QJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVIaIc0L9q2yfEAGnWZ2QKOq+ijKhs70WZu64kPgAzgbBP5LIih72ZPrAXB01EoGD8KT7UlXPKCiYnEwX8sw1WxYGngpbuAJgYz77sMJTT58U5OptJDueQIa/PTFJEMUxxt99s3IJk3+Pso2+cg/10OxqGgGqfUk2S4Y3qogxVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e305c2987bso7324697b3.0;
        Thu, 10 Oct 2024 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554164; x=1729158964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGfKTx8vVvg7oCOQVeihzlWXsAgt1fcux4KokqwYIHY=;
        b=ciBTqjUJmRuhoLPiHiXOrQbtrflWciEARgp2fSTU1PJIWQG0XujWTgrnzDb4nO1bVs
         DlrveNcNOfLZjBrTH05bObOjIxVzTri1+vb7EEYAWBHJwjo3uerKOoXF3wLFHfzVA6H5
         i8GubjHJjXfPgQXqI+VDrR3CmSdeNFnRs21MoLHMneKQ+XHngdEfxT28DcJoxuuCMgLc
         JFdAVhb1gz0JAnPC+SE3mowM3/SJP+1XH23fOTs/LKW+SP9u7dte2etjuvQCycAQLhyS
         8B2zxQJegi81nMyr2Jgc5+rSlAy5zi7V+iUTebPVlBA0MgocbNKpUpzA6rHvcgCCiky+
         YkKg==
X-Forwarded-Encrypted: i=1; AJvYcCUngrfQdGrtmwjCCmgTcPY/Eobhmzw9pQ2BOhGdnkeHEqSYKd13wCL0PVOEAgnYy3OSC1yjukQrT5HO@vger.kernel.org, AJvYcCVFtHvZdGmwvxXCs0JLyBox+6rh3V1Dv/Z/4yH0N8eGA67RkA1uI0VSnkDLzDdp7xEiJh/Ilks6FajX@vger.kernel.org, AJvYcCVtabfGc7q/ByVRX+B5GsapiteztgRTgFeTApz5lYFy1hOYz5jYKz+mNt504jqu6OOlQ9vqM37DkzEdwWwbWLnlVOc=@vger.kernel.org, AJvYcCWzJGSOkGu+SLe1T0PibL5qK4tt5qUNpmJnV9G0jwy/O8CANw/Hgndq8ac2yr7htfPrQzRQaGuAihpIz4dX@vger.kernel.org, AJvYcCXtqv7GeMdgQ8KPu3yQrlVgn7WCa1awWQ0akfd+H9kK732SHAds9aUpWRncJIUoiE6JCNDhrzTWaaxD@vger.kernel.org
X-Gm-Message-State: AOJu0YyRwTb491UPuHIijyd+PdF5eT7uN8opINz/KwRyAzFqVoz+4wKA
	ivULKfNZ8PoGAr7A0C66kJ77A/Cb3ocfCRstPlH8wh2vl40o3Y+O3wlVre8J
X-Google-Smtp-Source: AGHT+IHp0sN+fHk/moR8PBmNIgbkdGFeLMMBRWuqZ0xI7km4FO/lI190LrBus/670CHmguTqphgQDA==
X-Received: by 2002:a05:690c:4887:b0:6ad:deb1:c8e0 with SMTP id 00721157ae682-6e32e20a00dmr23998827b3.18.1728554164184;
        Thu, 10 Oct 2024 02:56:04 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b618absm1586007b3.22.2024.10.10.02.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 02:56:03 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6dbb24ee34dso6520067b3.2;
        Thu, 10 Oct 2024 02:56:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3Db6G8mXHPkuW67/60tnN+jccFk/xZ3s8pejkNcibXTDVOwaLvuHqDkj4VktIAZE/Xh0QC4ivYcNh@vger.kernel.org, AJvYcCU6oMzT+mvnNpaBzNYkNHxddlxPrTD6WxoJvQzKElfs7pNct9nKryuAyAeYFTivqPkC/4CalxInMKge@vger.kernel.org, AJvYcCUdEGbSt27ZaVvBrKGYykq7OV1ByaxHQ0OllMLcOqi1zb+gLhhJ1SF49jfhVDuDiNZftiKaqCeZ4UzI@vger.kernel.org, AJvYcCVxvDp/6RIM+ojACoYm8h0c2oQNrnMQR/YK+uy/QxrH4/5B0GBDvUvJfRZp9aDjviDWheiqxpzJveqpcggX6ROBxLA=@vger.kernel.org, AJvYcCXqoPspZzTkieyPBQ/fdhhISYCrrc2F0obTB11wFxBYLy08jFjfzFECD5VYYkIP5zRknZY30+ZRTBfctC5N@vger.kernel.org
X-Received: by 2002:a05:690c:86:b0:6e2:fcb5:52ea with SMTP id
 00721157ae682-6e32e435b78mr33581057b3.29.1728554162896; Thu, 10 Oct 2024
 02:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 11:55:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO=gpsTXsBapVi-_11ts3fT4OPr0BJvnZTwxXc6ZfGkA@mail.gmail.com>
Message-ID: <CAMuHMdXO=gpsTXsBapVi-_11ts3fT4OPr0BJvnZTwxXc6ZfGkA@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: clock: r9a08g045-vbattb: Add clock
 IDs for the VBATTB controller
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

Thanks for your patch!

On Fri, Aug 30, 2024 at 3:02=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The VBATTB controllers controls the clock for the RTC on the Renesas

controller

> RZ/G3S. The HW block diagram for the clock logic is as follows:
>
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,/
>
> One could connect as input to this HW block either a crystal oscillator o=
r

Please drop "oscillator". An external crystal is used with the internal
crystal oscillator.

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
> - if the 32768 crystal oscillator is connected as input for the VBATTB,

Please drop "oscillator".

>   the input of the mux should be xc
> - if an external clock device is connected as input for the VBATTB the
>   input of the mux should be xbyp
>
> Add clock IDs for the VBATTB controller.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - none; this patch is new

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g045-vbattb.h

renesas,r9a08g045-vbattb.h

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


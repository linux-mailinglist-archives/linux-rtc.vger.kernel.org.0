Return-Path: <linux-rtc+bounces-2296-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E849AE883
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 16:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 436771C22DC5
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 14:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6561FEFC3;
	Thu, 24 Oct 2024 14:19:50 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED91FEFB3;
	Thu, 24 Oct 2024 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779590; cv=none; b=mlF6VOE/LgtezPUPBQoj6UXldBfh0KOvoifiXQhLWMKSAHReEZlH6HwaB0tYl+kBFQAbnpBk1p3plAXq7uVZ41MDWAILjQjhKfRik9n/EPYfs7P2D3snx39S+CNI6mm5yAuWEvW5XOhNc6FmOfk/xUnMEAuLfpCTVjA8Ldq1vws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779590; c=relaxed/simple;
	bh=psEwkMwbd4ExW2XqThLjC/9nxsA5X0zMlzh220eFI4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5HA6icJKAYV0XcX+6OsFBJ3s/ztv8LzwIn+BAYvl+rNwlwD6eHJtNfSuKojs1+1Uv7nCBKo+96kSBFYFIiIzIvAXlhs+ngbj5R3irkLSB7asU86BdPnxLm9dvRB4xbQIFUe1OFzQgNSVYLS3U0kgVkj10teGfFPgtSz8Vnw3ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2974743675so954316276.1;
        Thu, 24 Oct 2024 07:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779585; x=1730384385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ECOF/H9PFUFioRUiy+IGZiwk0mnHr5Ag/WOy+Iwjhg=;
        b=ke9QUrvYtPDq+n6WV2oOkq+IyPVbfsoBDCiF6JYjloyl8NUgtUH+PpiwaIOxzmAl/S
         yPTXtWSXoUCwNq/C10h5B69fIPzmN/GZdKVPSgFFIWzejk4LIQazGeSlz10pecROGYFO
         CUyCdNFXF8H9C1Vn3ynRfvbo1ji0S5ENQNDNC0GyyULbFHdREqK5z8/D6fwBLkqdO8FG
         pZnauNE0fWJMnhbjSWZBrDdjs+wS00wPTMlUh9m9NSZ1zjSFm90gntlnRTCF3O2XE4Nn
         bV3SAPCCqojjFtLnv/xUo4gr5KfxVE+3l277Ch7CyvtgdFREpcIqLSc3A9otwyLHYr4K
         /m4w==
X-Forwarded-Encrypted: i=1; AJvYcCU6/uvXKA6qj5U3dI4RB5jdTXEgsjaD8z0axvc1d8LNfQeNx4Jk+AxIZ2mc0R+2oVcpzKFpQNxqr0hz@vger.kernel.org, AJvYcCUwOHaLps7vzDgN5OPqFlh59M5LrKZlNwFsunc/jGiH8W/quegpZeYuH9o4i2KIVRKR3nmn3kyL76Sf@vger.kernel.org, AJvYcCVfE0PjdytUvKXTxQVPJvrXACt6kWZSTs8pB746ZqM/996W48e/PJiYSd9HaKcHDBykIpyfcP6dtsr9EoyWuVfB+EM=@vger.kernel.org, AJvYcCVp4UyUH0h5KpZh4BGksXE7ww2fBtkxiqCbXFuf3II4UUkU4i9dO17sUIbO6x1mf5+P8yQToBb/gdMnbAdl@vger.kernel.org, AJvYcCWqu3wVPVdJZf/QTb3XgVK/X7NWlYv+0rRZmhCshFSzJ+EnoDzbFmeryWOhSrJm4X3qcsH93l7Odxnh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0ac8ihJ2/5oMEBEg88sLJ5uSrERRNlzR1xsJXpQiISdn8MW8
	Slvbkr/qRv+7YeSdp87anmp+GtAxtFxSBXFu91rFUcaDGClDQkxG80gostXu
X-Google-Smtp-Source: AGHT+IGXX1eprmzXImJ8jDGID8uyYc1HJ3gABYxOn9aWrg2Eo6yvmb4hhYt+nZiFCqEyAMA2nQBWkQ==
X-Received: by 2002:a05:6902:2848:b0:e25:d900:a0f8 with SMTP id 3f1490d57ef6-e2e3a6d1bdcmr6137765276.43.1729779584859;
        Thu, 24 Oct 2024 07:19:44 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdcaebe18sm1876171276.40.2024.10.24.07.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:19:43 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e3d97b8274so9490397b3.1;
        Thu, 24 Oct 2024 07:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBo9YheUZk1qSYe24e7mQpAa4xeGCNBPHGzozor/GeZ9B5ezDpF6laeF2jj3Yr8IOgyDKXKXCk4nAT@vger.kernel.org, AJvYcCUy3DNgDJ6bB+NuSnrwgV8JB5u0tqoeMsGtup9zmm+r7EiQrRb9pXGrbAbDXonVa9lnFME/foyhcshp2XY5@vger.kernel.org, AJvYcCWN3m5wSNlKnUT44L0zNCpHTSYFC8Cl4ukkngNuww8XLxa1QDWsHtN/woMHirovi2m7zH29jVxobQPd@vger.kernel.org, AJvYcCWitam319DOs57Oppb+LNoBlj6lZpRoh0Ybj2PuuiKSY1dit7g9HanHqKK1kGAQBKjII3c7qgBUwkp4@vger.kernel.org, AJvYcCWvp3gT7YooYyNq1B8UE1rAAmVsoh3MkHv1nba81b4CM1vPm4IjsbH9JrykMPMdc6jLgCFmUMCJFHozuYHtbPldWKY=@vger.kernel.org
X-Received: by 2002:a05:690c:93:b0:6e5:a431:af41 with SMTP id
 00721157ae682-6e7f0fdab91mr62498077b3.38.1729779583362; Thu, 24 Oct 2024
 07:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:19:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgZ1_wJN-rcjy1V=DRcUgEXQp3Qh1ZUTiv1cF8ywi2VA@mail.gmail.com>
Message-ID: <CAMuHMdWgZ1_wJN-rcjy1V=DRcUgEXQp3Qh1ZUTiv1cF8ywi2VA@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] clk: renesas: r9a08g045: Add power domain for RTC
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

On Sat, Oct 19, 2024 at 10:47=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RTC and VBATTB don't share the MSTOP control bit (but only the bus
> clock and the reset signal). As the MSTOP control is modeled though power
> domains add power domain support for the RTC device available on the
> Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - none; this patch is new

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.13...

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -304,6 +304,9 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a=
08g045_pm_domains[] =3D {
>         DEF_PD("vbat",          R9A08G045_PD_VBAT,
>                                 DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8))=
,
>                                 RZG2L_PD_F_ALWAYS_ON),
> +       DEF_PD("rtc",           R9A08G045_PD_RTC,
> +                               DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(7))=
,
> +                               RZG2L_PD_F_NONE),

... with s/RZG2L_PD_F_NONE/0/ due to "[PATCH v4 2/4] clk: renesas:
rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones".

>  };

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


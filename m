Return-Path: <linux-rtc+bounces-2299-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D459AE8A4
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 16:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B18D4290A50
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 14:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE36A1EABC6;
	Thu, 24 Oct 2024 14:22:10 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC61E1A1D;
	Thu, 24 Oct 2024 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779730; cv=none; b=VptReg2mC7+Z4ym3TNnGIZyDtYcqkFvGny+1erFONuNEHPrE+x/vImele7uyk7l8Zcz0wno9DZheULKVPyfq065a21SpnGJCiDp3T0ipKeDlE/lxa62iSiEG0DHn4AKPZSSAkqC//diCTQC174Q/5WfNkaA0ZMw9gCuaeFuNMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779730; c=relaxed/simple;
	bh=BAkdpe/RHBcsNuwwWCAupVt2pbLy2LYEIZ0mxM0VaBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gI98JiKIbTtmtpDnt5nkZ6bBxrYvBz6JpZaBhqF3Xgpd3GPs7p3E3CtmA3pK1aqBjwBX6BXH5wGxPmriuNqq4cyqDcbMWJfsOScvM2U8xueUfs1BoWcBtVqc9zv05PkUxWexx71sXHHRUkukvDB03RZ3KgF5iSJ3powuROG4h2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e33c65d104so9086957b3.3;
        Thu, 24 Oct 2024 07:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779726; x=1730384526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQHpv7ID4TH1EE8mb/9nePf96Sk+WNhyNVzL1VBmj6s=;
        b=Fzu261+7p/FKJftq0v2cDXjC1nUjvmRzVDqojpRZswWgCX5LeqW0Fr5D2F13XbUsVQ
         bHpStf7Grt2Zvp0yxBQgxj94LkIbXu/9w26cO1LBV/BnzH0IFq1ARu92m0auyZBaw24z
         0nDvQVLFyGIHXH4RuIY8MD6ljjuRgAX+c8W+44WnRIivfFg/1g+nC6GD4IGxchocE6ou
         dLQi+Iek6aF8fyXjVdCtUHOLiH0I35Bq4ssJJIz8MZTbPe9wiAkPLcc3XR2lvCvTBMuD
         5IzxC7xGtbYfVwLdJz5gSolKqLL4+13RPqfWYvzfY/J0a0iuwgZ6Jg6nbeC0yhKrHdfc
         kagQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCE4Xo4wiVYIm9MVdwT781P7OxJSjVsVv4Xbkd9rBrsk2zoArlE0QH56y4b1SrkfNwNqDSa2WjyTOg@vger.kernel.org, AJvYcCVdvEu3Yoqa9sqCz8Hc+gv7g8IGs94EupbBgLWgQuhNz7jJ31rdywaqsKPvfGjPDmDg6pZAGN9kpp1HPAT7b9bEjuA=@vger.kernel.org, AJvYcCVyvxUDKzHAeLYpvLxh/PPKG3KhRm0vQLN4g1xR7dMmKOSoWpFUxBzMIA6+LgZue/I1vPYEf/+jLX/d@vger.kernel.org, AJvYcCXhzSRYTd3i2r8yLGeZZetO8g+PRnyZAkZWhKZCYP6qDekueiF7tJ9ue3b6vzTFyjPdMrWnN4yDcgGpTyGg@vger.kernel.org, AJvYcCXnnaEfdZpLJnYS2SiFDYzyUrF0pt2TwtTCXUcyv7VMGoeMz9GQU+NKYbe5XznZOJeUObnOPenvEMcW@vger.kernel.org
X-Gm-Message-State: AOJu0YzTj0q48r4GOFSpbpoKnqgnS6q4o66/xmVNWKjW9YED6+lEbxsE
	2pRn4pvwxQDzeRaqnspqhfsdin7C8XgtiWvDlzfC0296RuLdN855uzPgBGzC
X-Google-Smtp-Source: AGHT+IETuctO7Drc/eZuDEhWWQQwtS5HR0D+z1roxgp/6UavmcEM6d7lTAPYKd8qT3pveWQ70Sts2Q==
X-Received: by 2002:a05:690c:470a:b0:6e3:410e:bb84 with SMTP id 00721157ae682-6e858180f9fmr18391007b3.20.1729779726061;
        Thu, 24 Oct 2024 07:22:06 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccbaf0sm19981997b3.75.2024.10.24.07.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:22:05 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2915f00c12so1127637276.0;
        Thu, 24 Oct 2024 07:22:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYjaeuE6ymiL3WgoAA+nsMbLFcYy7jpHvtIWOrEDtI5zIwgfTadgR7qcPo28tmyyybns2RodS/+Rplfq0L2AzR1Ew=@vger.kernel.org, AJvYcCUqJcgWdboDaMosd93nTLMUFd0iHzAwU60F9i09BJK03Fx2hRpza77MGR9bVp9gJjU4Hvrd+KCzmuYR@vger.kernel.org, AJvYcCVHvsgiCszVDNUZB7Qx9vABf7lag9f+KTNyRM/VaYs+00X5Uyu2VCijONd5zaiQjfUIw81oqGnUgRjN@vger.kernel.org, AJvYcCVWD4r7rYSYGasEeAbPUKS0RluccQgdsFcSTeShFqNsXN1FRVJ2TiLhBVafNJlKISwRi7WGG2RhmTcs/f7f@vger.kernel.org, AJvYcCViHYVPsX/adNgMJI+6jJLzFV/18Garwl1pdCk//GgPABn0H3K8RZTLo5BfbQGV1kOu0BuYa3tEuY+I@vger.kernel.org
X-Received: by 2002:a05:690c:ecb:b0:6de:c0e:20ef with SMTP id
 00721157ae682-6e85814c186mr27075017b3.7.1729779725019; Thu, 24 Oct 2024
 07:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:21:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ2DM7Qzcne5KEN2sx1z4PZn=SFkmWwMENkKQfWGGE_A@mail.gmail.com>
Message-ID: <CAMuHMdXQ2DM7Qzcne5KEN2sx1z4PZn=SFkmWwMENkKQfWGGE_A@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] clk: renesas: clk-vbattb: Add VBATTB clock driver
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
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
> by the RTC. The input to the VBATTB could be a 32KHz crystal
> or an external clock device.
>
> The HW block diagram for the clock generator is as follows:
>
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,
>
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
>
> vbattb-xtal
>    xbyp
>    xc
>       mux
>          vbattbclk
>
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
>
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties. If the crystal is connected on RTXIN,
> RTXOUT pins the XC will be selected as mux input. If an external clock
> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
> mux input.
>
> The load capacitance of the internal crystal can be configured
> with renesas,vbattb-load-nanofarads DT property.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - dropped oscillator from patch description
> - s/on-board/internal in patch description
> - updated dt-binding included file name in the driver as it has been
>   renamed to include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
> - dropped the "_BIT" from driver macros
> - used "quartz-load-femtofarads" dt property instead of adding a new one
> - register the "vbattclk" as critical clock as this feeds the RTC counter
>   logic and it needs to stay on from the moment the RTC is configured;
>   along with it, added a comment to express this.

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


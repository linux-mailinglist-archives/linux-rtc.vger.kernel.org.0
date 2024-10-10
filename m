Return-Path: <linux-rtc+bounces-2147-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11398998321
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 12:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1CF5B2457F
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D981F1BE22D;
	Thu, 10 Oct 2024 10:06:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798336D;
	Thu, 10 Oct 2024 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554799; cv=none; b=SXYRhMX7w2FbDxCcnBIVpulIcfDoXA5U5Djw4zbPc+Z5sHCcx0LC/tbfR0ifuULY+m9FX0ij4bG9JX9tQM14jS9HIPCyzo7vmegRrN6o10oaokPb1BPkeg1x/7bhVMuqYqGjWJo/v0FHNZx2Kaul+4zr38FDfGMYZQSId+sjxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554799; c=relaxed/simple;
	bh=MAL/b0vn6waV9G2tjWzPCbrzfCr1JhdzdB6eQCpdEBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fu2tVpxyBDuTdLESI9b2GOURfPtF9GDERJgZxrMOqIamH8U4qqlo9SbLPOWY6BYZI+aKsq65ePXgFdfL3z8BbSw91O28beM1XSK+LU8Tzr3RGiRF7oM6SC5oEnmORo+dJr1riIW66tL0BSA2YRJJbdZo2SFNkA/eUnkUpvruUDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2ef9af517so6257587b3.1;
        Thu, 10 Oct 2024 03:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554796; x=1729159596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf8lcHNIhpoD8hLdz22DUdfdP58SjzWmYMm2IE4WypY=;
        b=qXJApvyc4mjxds5kj+76PzWzc68RKJB7VHTDBBpfD1p3Hb0WZ4yN+4k1jHmWNzf2FB
         nsZjPBNG3nHesssIvyXvGsGprfW89tHV4MRW+H9JL7iJxAx3Q3SeN1AjvCNnUKlX2lUG
         yMorAesQPVSVuZl5fM0/iuL5MH6Zc+YeTyG2/vVIM9NTt0aEevBbCppB0LxM/TftnwRm
         R69JfgrnpaZ3vZ6qEttkSXaHXWn0xx/Y0JXWPk/Ux09t4U/7z809vNhZyOni+OK/Hlpr
         g635+TEhvKgf6iSqzz7SK9Yjuv3k3hcAlCcJzXZEPZ+NcSk0jXBgVa/lDTa1kqYmGjWu
         sizw==
X-Forwarded-Encrypted: i=1; AJvYcCU/wYeddIEc6jDTcwg61u8RZA0APjRdMUEbBG6SYbd2DJpvVR1xRFqgdRlMpwcImOFf+H5JJFaLjm97@vger.kernel.org, AJvYcCUVVqRFZ/760X9KKDjnZfsmmA44B3I23UPhc37ubr+0bKoVoD63A14kpJqSTUCjHG3WDTUVyWBeI6aqTGT7@vger.kernel.org, AJvYcCUoYSXNd/pvgCFMSEB1SenGdZxvOSCCeLpOlQw66Smhbn4j9ixEoYCewk5sTA27JXBkGaQFGsw2hs/d@vger.kernel.org, AJvYcCWdutCQrzkuyYXVta5U0OklrWfHFOStFOXJ7v2NhcUkSHNaR45PlhAPdYFcloKDJ0ezM7x4hH5256DQs/6P6Bi+V1c=@vger.kernel.org, AJvYcCX8kX6/nYhU8JlxW3TrElZW4tCsyHcw7eBmWeUNaUbuH+Ro3MG21fn+Uq/XITZpl9cN34PS7/1iAzhI@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfxNeiBee00l3PLHdXa9z14+cvursVOlVC0J5GrNaaRQXMMWJ
	lk85697dK96UUIHjF9q1lWLPwjqppOA4jvrowgpX5L1v/Pwv0WfqSEr24r4A
X-Google-Smtp-Source: AGHT+IGtIhegWL8q2r2CrOgPJN9fvo3ZgtD0nRcW2HZQgiETn3s3lvSG1hLTQKvcboz1TA3jsRMkUA==
X-Received: by 2002:a05:690c:5290:b0:6e3:24c1:cdf8 with SMTP id 00721157ae682-6e324c1d29dmr35972567b3.22.1728554795963;
        Thu, 10 Oct 2024 03:06:35 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332c6d784sm1557057b3.105.2024.10.10.03.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 03:06:35 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e330a7b120so5050017b3.2;
        Thu, 10 Oct 2024 03:06:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtZdaEZunh2OmuvJ2IPxxfHU2sBp/3Hs4BXyKwt73jgb1H3MR+23PUyarVkwIfFp/isBzviM5lcmO+Aalv@vger.kernel.org, AJvYcCWobl4TxU1Rkn2mXwlxakbD2Ovxc2xubzKmZ/N47T4eXO6PT8Cp+5cFc84WKgyTvEBmcOraZAkLhdWR@vger.kernel.org, AJvYcCWx29mJGeFbMHp/WFWRkK2iqLfl7uEFyddJLFT9y6Dilw06e0PU2UVCaQNeITzCu5kL1JWB1lZXxFgv@vger.kernel.org, AJvYcCXrGd9+Z2w4F1c/TdY0EajqFKy9wbIFXMue8LCfIYzdSu8QPl3RVMQPfL9wefB/DatRG6+U+TKcj5XD@vger.kernel.org, AJvYcCXvQj0N2C5DmOFO/9RUMAHHcriB+uKpD3/JGRsBmvCFovhdSF6UJZ+j67L8ecKeu8yLZ/0oHjMFEO3eteh1bXYl05U=@vger.kernel.org
X-Received: by 2002:a05:690c:113:b0:6e3:ceb:ce2b with SMTP id
 00721157ae682-6e32250ade9mr50039847b3.44.1728554794830; Thu, 10 Oct 2024
 03:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 12:06:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiycV+_ZzeMYzM118u+rqYoj_hfxFWxm95VKXpTmmuiA@mail.gmail.com>
Message-ID: <CAMuHMdWiycV+_ZzeMYzM118u+rqYoj_hfxFWxm95VKXpTmmuiA@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] clk: renesas: clk-vbattb: Add VBATTB clock driver
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
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
> by the RTC. The input to the VBATTB could be a 32KHz crystal oscillator

Please drop "oscillator".

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
> other DT properties. If the crystal oscillator is connected as on RTXIN,

Please drop "oscillator".

> RTXOUT pins the XC will be selected as mux input. If an external clock
> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
> mux input.
>
> The load capacitance of the on-board crystal oscillator can be configured

s/on-board/internal/

> with renesas,vbattb-load-nanofarads DT property.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> --- /dev/null
> +++ b/drivers/clk/renesas/clk-vbattb.c
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VBATTB clock driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <dt-bindings/clock/r9a08g045-vbattb.h>
> +
> +#define VBATTB_BKSCCR                  0x1c
> +#define VBATTB_BKSCCR_SOSEL_BIT                6
> +#define VBATTB_SOSCCR2                 0x24
> +#define VBATTB_SOSCCR2_SOSTP2_BIT      0
> +#define VBATTB_XOSCCR                  0x30
> +#define VBATTB_XOSCCR_OUTEN_BIT                16

Please either drop the "_BIT"-suffixes...

> +#define VBATTB_XOSCCR_XSEL             GENMASK(1, 0)

or add a "_MASK"-suffix here.

> +#define VBATTB_XOSCCR_XSEL_4_PF                0x0
> +#define VBATTB_XOSCCR_XSEL_7_PF                0x1
> +#define VBATTB_XOSCCR_XSEL_9_PF                0x2
> +#define VBATTB_XOSCCR_XSEL_12_5_PF     0x3

The rest LGTM.

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


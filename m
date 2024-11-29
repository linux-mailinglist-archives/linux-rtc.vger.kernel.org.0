Return-Path: <linux-rtc+bounces-2644-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A789B9DC1D6
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2024 10:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DDD1280A6A
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2024 09:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E4618871F;
	Fri, 29 Nov 2024 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+K4O+HP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC071865E5;
	Fri, 29 Nov 2024 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732874282; cv=none; b=e19ZITxP80st3Iloq9xdBGGyeYVme48KjWFsG4rcDO69FRoida/vtqmDO9sMfVWo1/4861DXtmUj8h7n02KbC591lCfYrkbGJXRs7nQah1WcPWlioDRqA80xedSYWsazJ0BK9D6WfeYNMSEuBcoxjJ2jlodZ2YShLbgEFfQTJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732874282; c=relaxed/simple;
	bh=1hDbGfUA23ougGXXcYk+JyKRByc2HiBrBs3Qlvj72oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHoh2Urm2Yz+v5pidw0q6JHzBx0s6I3zOZxwxNMRSdolZHgTb+vM/eHOnoSdlkW/EmxkLWMBlyTJKPGZx6mBkJvBfEUoyBRO0v8AZQ1abIKqsuXqWC6cPsk4ooIWtQftu1dodSUEnIiyK6jWs/5ult/rP8ZbewMUA7zle3c8orI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+K4O+HP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0405C4CED3;
	Fri, 29 Nov 2024 09:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732874281;
	bh=1hDbGfUA23ougGXXcYk+JyKRByc2HiBrBs3Qlvj72oo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S+K4O+HP1s/SOyDC2ZaronkJTlXMeh+hei9/UDdAxMKNVRc+w6Pa1aw8Wy/DJU1La
	 h4gsxSkfjjHuE0XXYfO6gFNUrCspcr+HTbPhdSP3Y9+RrnGRSnW4CuzZVta1CwZYmX
	 ppOLZYX5ErLP7rIzLKzKTuvY1HH5BVYfec6Ex0H4mdezvnIgoJYlIdWgqzaqgb8hey
	 O/pE9VO4WFda/D1SwRz7D2YJw1JY/Ged/UQVd8iy1pgkjWlSSu9suevByjn6LBpNCs
	 9xn7zPdTsLfS1hnpgk4O5hB2/f9rlKDXqyCBNrzdWyn15J/MpBb5nMO7NQz+0WWobH
	 invGq3vz+janw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa52a5641f8so215526966b.3;
        Fri, 29 Nov 2024 01:58:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIGJgE1O6T9j1RTVOsfcHbTQj0m8Gkm8EPOcUl/Kc74O6vWOZYbaw5btM8SNdmJc3/brOPae+ngF/q@vger.kernel.org, AJvYcCVYre6f+e6ajmPnyDXrVvg0kajUEOJhvvBtG1pSKwpaFGEOUB2TKcqpfRH0GM6whFQL6eLA0mc2wT/EIqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznKymqE8+2siblTody7xYE7WzysUyMknEwWr3Rmnk4gErtHEqC
	tdiyDmOwqbmQ5FJjlsynJ0oDHQ4ZPf4EXpTer0OlmEpyWlVj8sIRFVbUZfav9+FvA5ROD5QxAn5
	83bqwlF5VWn57hx/wrOCgcO/4ZSI=
X-Google-Smtp-Source: AGHT+IEDszHNASRg00jYgRLxlywJhuAd9svadYgJOxs6e8sVD3iACRRDC1RVnQFlbOIIyEy7xCtsiG/ayUapIS8OKWE=
X-Received: by 2002:a17:906:3cb2:b0:aa5:2a41:d2c8 with SMTP id
 a640c23a62f3a-aa58103c784mr800573466b.38.1732874280276; Fri, 29 Nov 2024
 01:58:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128070227.1071352-1-wangming01@loongson.cn>
In-Reply-To: <20241128070227.1071352-1-wangming01@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 29 Nov 2024 17:57:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4rrQ5v85TXSF-oFAxSxFgvvXR+O2YmDhOPhCcwuOzVuA@mail.gmail.com>
Message-ID: <CAAhV-H4rrQ5v85TXSF-oFAxSxFgvvXR+O2YmDhOPhCcwuOzVuA@mail.gmail.com>
Subject: Re: [PATCH] rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr
To: Ming Wang <wangming01@loongson.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, WANG Xuerui <git@xen0n.name>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lixuefeng@loongson.cn, gaojuxin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 28, 2024 at 3:02=E2=80=AFPM Ming Wang <wangming01@loongson.cn> =
wrote:
>
> The TOY_MATCH0_REG should be cleared to 0 in the RTC interrupt handler,
> otherwise the interrupt cannot be cleared, which will cause the
> loongson_rtc_isr to be triggered multiple times.
Function names usually use () postfixes, e.g., loongson_rtc_isr() and
loongson_rtc_handler().

>
> The previous code cleared TOY_MATCH0_REG in the loongson_rtc_handler,
> which is an ACPI interrupt. This did not prevent loongson_rtc_isr
> from being triggered multiple times.
>
> This commit moves the clearing of TOY_MATCH0_REG to the loongson_rtc_isr
> to ensure that the interrupt is properly cleared.
>
> Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> ---
>  drivers/rtc/rtc-loongson.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> index e8ffc1ab90b0..0aa30095978b 100644
> --- a/drivers/rtc/rtc-loongson.c
> +++ b/drivers/rtc/rtc-loongson.c
> @@ -114,6 +114,12 @@ static irqreturn_t loongson_rtc_isr(int irq, void *i=
d)
>         struct loongson_rtc_priv *priv =3D (struct loongson_rtc_priv *)id=
;
>
>         rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> +
> +       /*
> +        * The TOY_MATCH0_REG should be cleared 0 here,
> +        * otherwise the interrupt cannot be cleared.
> +        */
> +       regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
There is usually a blank line before the return statement.

Huacai

>         return IRQ_HANDLED;
>  }
>
> @@ -131,11 +137,7 @@ static u32 loongson_rtc_handler(void *id)
>         writel(RTC_STS, priv->pm_base + PM1_STS_REG);
>         spin_unlock(&priv->lock);
>
> -       /*
> -        * The TOY_MATCH0_REG should be cleared 0 here,
> -        * otherwise the interrupt cannot be cleared.
> -        */
> -       return regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> +       return ACPI_INTERRUPT_HANDLED;
>  }
>
>  static int loongson_rtc_set_enabled(struct device *dev)
> --
> 2.43.0
>


Return-Path: <linux-rtc+bounces-2681-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 749609E7F43
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Dec 2024 09:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41F5C1882236
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Dec 2024 08:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A44513D89D;
	Sat,  7 Dec 2024 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/xyDkYe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1BB82C7E;
	Sat,  7 Dec 2024 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561935; cv=none; b=EltPDnGReQ6rRkW0sFvwdhgRQB7bNXzV0IrskPcVv4oucIqAwvxL4vUCelssZIclE7uMhXYXLaoBxmY2FHJoklA/ghYBwl5CsB3NpUq5JzkmQAe/RIw+Dt2AkczD666oo5yv3e8Oo/4vrpnHXpADiUNdXLRe7Z84wyxxx+rILO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561935; c=relaxed/simple;
	bh=CbfyyJMoHWuUmJ99TbtFahf95hfhbR9G+s3+jsfdbRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GD7geE+o1YicVR5YiMgGPbtr9UjDuiNgfu0E3kSQ5Pmo0GlZZN5BbcOakpmDBeDFE4XWG2VmggiOi0ZH/4/O/e+RMipe7LSD7qVsT+9+4pipk3tQkKJw3u4OiwLMMY0rubEWNw80qzXn0fzspZZ4ZN7S2iLtKrrAM9H7Tb7i3Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/xyDkYe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF06C4CEE3;
	Sat,  7 Dec 2024 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561934;
	bh=CbfyyJMoHWuUmJ99TbtFahf95hfhbR9G+s3+jsfdbRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F/xyDkYeq5KyZ7A/fHdGmpxNbg78iC7W9im/EKoG+aQbitXxV2O83isOjplD/L5Wb
	 DvCtCOzPq73gLu9TQKRqgo2XDKZPST5uhn4ZGsQCUfqvF4m3R57e1ahyd9meeGCDXp
	 DS2GFZ71LIevPgsz07f/t0B/d5u2GqTsSi2TaP11ov4ZZAJK5fPDdJ+1xOkw53RaYE
	 Pa/cVXe6HfzCjaWaVp167el/fuIQEiKaiJHe9FajJzkFh6QrZ5kZEof3I3EiERStnb
	 xjPypw/z80MJ2MQcyIeYEjFsjkjvhpwy8cTTmw8D0waowrmPmlX4rpH75qi6wBKRFH
	 cU2x4y9fSG+Mw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa62f0cb198so318113366b.2;
        Sat, 07 Dec 2024 00:58:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUA9QDu/+dDtdd4VfvWBbBATYhJ2ZEm3p/1Sc2/dKENpJGx2JLhf5HvEsmKuJXfCeJJSnaamL8pYmRZVtE=@vger.kernel.org, AJvYcCWWhv1OGolN4zvA230PQzfV/aFHawdlF7sYb8fHJ/5/BmQmIYOwF/clPG6wHko/T84VU2NADSJ177Dj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47He7pD/9H4oORB0z1BTG6ImVp6ya8noXLSf58GmZFT9Al38n
	1km7Px4iRUYKca7zLctOs/afZNEl7u0D6BLjA29KT3IpbLs3X0W/CizOXDD8EQ7ix1z7aigtwo1
	tdm9Pnum5JD8lpOazejXl1GT8jrM=
X-Google-Smtp-Source: AGHT+IEv1AWReTZ5Xlw0WY0CbfDwUkiT2YzQ/An/+llmTeLIq6HAECdh/u8A/wjwSWXJdJF9rVqTdtgnqf64w+3oDz4=
X-Received: by 2002:a17:906:9d2:b0:aa6:4181:9d04 with SMTP id
 a640c23a62f3a-aa64181a14cmr315227566b.56.1733561933235; Sat, 07 Dec 2024
 00:58:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205114307.1891418-1-wangming01@loongson.cn>
In-Reply-To: <20241205114307.1891418-1-wangming01@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 7 Dec 2024 16:58:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4VpAF7OjAbbBqoJh7kXyoq_NV_dtkSCOAPBCsH247stw@mail.gmail.com>
Message-ID: <CAAhV-H4VpAF7OjAbbBqoJh7kXyoq_NV_dtkSCOAPBCsH247stw@mail.gmail.com>
Subject: Re: [PATCH v2] rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()
To: Ming Wang <wangming01@loongson.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, WANG Xuerui <git@xen0n.name>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lixuefeng@loongson.cn, gaojuxin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Thu, Dec 5, 2024 at 7:43=E2=80=AFPM Ming Wang <wangming01@loongson.cn> w=
rote:
>
> The TOY_MATCH0_REG should be cleared to 0 in the RTC interrupt handler,
> otherwise the interrupt cannot be cleared, which will cause the
> loongson_rtc_isr() to be triggered multiple times.
>
> The previous code cleared TOY_MATCH0_REG in the loongson_rtc_handler(),
> which is an ACPI interrupt. This did not prevent loongson_rtc_isr()
> from being triggered multiple times.
>
> This commit moves the clearing of TOY_MATCH0_REG to the
> loongson_rtc_isr() to ensure that the interrupt is properly cleared.
>
> Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> ---
> v1 -> v2: Fix commit message function name format and add missing blank l=
ine.
> ---
>  drivers/rtc/rtc-loongson.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> index e8ffc1ab90b0..90e9d97a86b4 100644
> --- a/drivers/rtc/rtc-loongson.c
> +++ b/drivers/rtc/rtc-loongson.c
> @@ -114,6 +114,13 @@ static irqreturn_t loongson_rtc_isr(int irq, void *i=
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
> +
>         return IRQ_HANDLED;
>  }
>
> @@ -131,11 +138,7 @@ static u32 loongson_rtc_handler(void *id)
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


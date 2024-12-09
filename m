Return-Path: <linux-rtc+bounces-2683-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993389E9013
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Dec 2024 11:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59C26280FA3
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Dec 2024 10:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDAD216E10;
	Mon,  9 Dec 2024 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9depuE8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A63216E02;
	Mon,  9 Dec 2024 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739912; cv=none; b=GiT7m3wnnULFDNsIl6ghXjbPa5NqEm3wZNQKlKxiYF278b59WdNAfnSbwoXOTxKjb3USagXIZT8R4EQtbrY5ww5Ge55F74Yj30OVPdyO7iXgRjsINKkOL+xkEW5Ii8qzTjaBKi1HxfrOen3+LtutipelBYYOu/Adn/7+1HsgLSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739912; c=relaxed/simple;
	bh=dKVih7aQWpxxyzGvIRBzNpZisx0xR5iWL0AaZXvDHHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwTknwaLlrOv9BsIzGofIvwdj7Z2+DygQ9AMNSl0H1BBpcjcRt+3xIxce2gZ7Yk/z76LIGZgHumnXjrshkEOi6gheK32EQvhOKYepM+QKC9bBL85g1mAVBcOiopE4eSRuBFP3DXWb21VZW7jPPxq7gsieN4Cl3kGArn15iWjdaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9depuE8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so5086031a12.2;
        Mon, 09 Dec 2024 02:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733739909; x=1734344709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vvyt7SGgTlfGIaWy3Ul7r6xQmxk08ugT5cb3M3mzApM=;
        b=c9depuE8RpkcfeJE8XD3MCOw1y5toeY1/HK5Qn5JQYAYMKhFHpHhwOsznvRrl+8I9T
         afkk47htpGTesuy5/8ilvAYuwedEr0UpYwZ94uDsXO522K/PKM0FRW8SXfr/sXSLqap4
         UZ+gG+2eW0a+GVXYTNiUTGGJ6bFTnwD6qhQ/H0T0rtUmhAW2Wivn+bsYeONMfMqoU4+D
         T73n3KS6bYghzZW8P35Eh8Q6nL75e9egC9g07NvF19x9rg8iHU0+agWPExFWTKmr5m+n
         8J2zIYFGEuuATRgjmfs6P8SxSM0zNxaahiKGhCD4iXv86nWSIeBmeXIz2PVfUW+HGLN1
         Rxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733739909; x=1734344709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vvyt7SGgTlfGIaWy3Ul7r6xQmxk08ugT5cb3M3mzApM=;
        b=AQWn8C3BhNznDjXnDkDI6dmcyFERA9lG7woeq61cp9iTdoUhYCmhxSSsAs1o4S6VHy
         Yjsk0bz9V9wrEAVlA2WNqk4lLI9UY8r1YggyR8Ip6TJOESUmd0GluL7i3sV6xh6qrefJ
         J1wtyshTcH7vVp2pwudavdSWQCe7EhtDFA1noP+HppHuU+Xe/Sr2C7VRKWfwEeu34qVr
         HIi7dLUHu02cwW2xO3vTpFov17LdC++hPoamLEIZwAX7RA77UAFZHSI5Pyc/TpV83ciN
         L4WVdWadyT5JO+h5+Ojy5dpty7MTxh7HRp+55VboE0Wv/O1DmZuBeOaATn/6Szhp1B5N
         Re+w==
X-Forwarded-Encrypted: i=1; AJvYcCXS79yMkkW6vdxmGjESCNhgRfH/goY3YoN+WyG48t/3Qikk2LTxeuWG6BZ1wd02csFVR68HtySHuLgp/ts=@vger.kernel.org, AJvYcCXyzf8J4IyLf0ELmUMf2RNspO2EMe9uhufZ6AixSIZTBI0LeUy0jzRIIc47sc+3L3EAHNIhegzMyRav@vger.kernel.org
X-Gm-Message-State: AOJu0YzmhEDagMVFuyC6s8cULx2qDHEaL6JHHLIFNqoQqwrGv6i9gJYj
	bEt0jMJxWJwwamYVAxBRtdtUOJM8x27CXKdmHkvdCpzCILtDKOTmLycJfCWxUKfxsdzPiOwcRPZ
	hebmFTeLvY4sUoJwxQePNlcDaZ8knQLfnCzE=
X-Gm-Gg: ASbGncuiqsTSCGZE1VBF1zUz329GvmC5ZhEnLqB3rXC8UA9dGFOwNx9HaIqPXWS/QLQ
	KdvOiKIuvAKm4FxU2tSHRecBocX2MUbbY
X-Google-Smtp-Source: AGHT+IGD+kkm1zje9QQh9lcZlDTqJCN0cwfjYD4RgxRVD4GIz+nEQp5iq01hYDC/sP3WKsV3LpktbOyIXpt02FvJWRo=
X-Received: by 2002:a05:6402:40ca:b0:5d2:723c:a57e with SMTP id
 4fb4d7f45d1cf-5d4185766ccmr27750a12.16.1733739908841; Mon, 09 Dec 2024
 02:25:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205114307.1891418-1-wangming01@loongson.cn>
In-Reply-To: <20241205114307.1891418-1-wangming01@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 9 Dec 2024 18:24:32 +0800
Message-ID: <CAJhJPsULHY0ps31Z7iLm+Bz=ebokA2LMkOU=DRw=FtYQ__DEUA@mail.gmail.com>
Subject: Re: [PATCH v2] rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()
To: Ming Wang <wangming01@loongson.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	WANG Xuerui <git@xen0n.name>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lixuefeng@loongson.cn, gaojuxin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B
Tested-by: Keguang Zhang <keguang.zhang@gmail.com>

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


--=20
Best regards,

Keguang Zhang


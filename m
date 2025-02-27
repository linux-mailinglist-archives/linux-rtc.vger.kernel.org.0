Return-Path: <linux-rtc+bounces-3277-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22299A47B71
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 12:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B00161917
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 11:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A62522D4DF;
	Thu, 27 Feb 2025 11:05:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46CF22B8BE;
	Thu, 27 Feb 2025 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654343; cv=none; b=rHxXYxaWOqqd4l0UCoT7g7q0elP/dlXaWoD8iYxcNtIgWJNyf6n4JC1ahu1pSa5VD9bFHF4IzTceUjnfvpEOl0vwEKMTFAqD6Oqh9T/feneulp4XeKaHnoqAHI+nwOyVvEKKnrcarnTknoR1Y0dvugzsDvlN/CgWc6ISzVpWF3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654343; c=relaxed/simple;
	bh=MhZ8GViVcNwezLnWisT12m9Ev684ayMaSWy/I8zydqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bybi/zPz6WEjFPzvDi4EjPkhO8gdPzvik7fJoYb3i8+Dt16aAH20fOqLMfTGvYWzck/ikbOV9WUdMWuWxSuWLvss9HQ/ESJl+9mlzbI+/QiT8UhkLAL9TY4dLAMir3JIyYhEIhgdsIUNUqy6F1mraSCaDLc6+M9+R6aidJU9MWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86929964ed3so653061241.0;
        Thu, 27 Feb 2025 03:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740654339; x=1741259139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOYklwSkIF61N5d7gWtZ1gNcm4VTd2AmRb5PcLCTllw=;
        b=udWgP3IzBqLH3pdI5ygLouUQrd/zdY3+uy20vNg7UWCpTwkk6Fp9XSrWPYZG0es2G0
         VFjVoLxRu6QRp030bqLlYvHKe8B9cvhArkkrGtiIhKPiNmY3bCBAyCL6jzijrlNTllzB
         T1a6bhZlc75GipYgPS1BZLK0iCabiDZ4/4vVsJHx87d6MwHsqmRteX42DW2HicqemV5f
         fPTV1Hy7UDf5vV0I7IaHrtguRC1cG0B9lE6VaiSoPtARmpRQhvCqOjokpShTsYIe6at5
         Fp+0+5DKvPTW8H02Q+idFLUT6ACFY+nFPBdUS7v1BhOwVNYnORr4e+5cVhN2NSxXOeRX
         JX+A==
X-Forwarded-Encrypted: i=1; AJvYcCUzE4dfkWgQvVKqzxBCmzS3a7p3Q9jLM0LWURr9cFnqv//Q7E41idlXRqfvdY13f8ig30Y0Qs165oaB+yU=@vger.kernel.org, AJvYcCW4NkySLEnKtWSf0k77q3J6curgnKHbusi5RH0RkUwoZWEveGmKj0GE0O8hdlwDhbUFPvyheFLognXV@vger.kernel.org
X-Gm-Message-State: AOJu0YzC9hCNXWrrO/0AooU2+oiaySmnP57kT+bcxT3JrCQ6xvmwaEla
	8xzwBSoy6SpE+FjEiemv35XV7OZ2QrHBh1E/rOgaLBWGL19kn7iJfzbmDWC0
X-Gm-Gg: ASbGnctfGXhm2aPzJWyzzIlOkwURAH3de94021kq3+DCn8qdqMuLLH4mzhbTaZXzxWg
	pm0DIg7HBGc3XbzKH7Uc1alZX5NOgZ0YNxaYqJaKFgcuMG4IO3gexFBM186azMYpbtijGJdKZeY
	8M4+CUGNa0b8qlCyiAoO6f5VbgW4lXFQH4erBy5bEhx3ulCiFRAjkI+/FcQa4JRcERSMcXEKEKB
	5PpiPsEGgA8HrCknxcd1iLoaafUl0GdSE4qWCT/xHFtluQcOoeavkGeLfotL30JD66PeKFgrlkR
	CsOrogw0cLuWdT0uzl7VD4sFrpnh+OgWAxyVqbZHqILsGhWkcrQ8ZgOmf2jQSB4E
X-Google-Smtp-Source: AGHT+IHv7oPpmabrcdY3QkNxSys2ank8rtHd6dcs+JywcuWtGg9ghXQ/3lLbIKcm7asT8qX9bfhcAQ==
X-Received: by 2002:a05:6102:3a0b:b0:4b1:1eb5:8ee5 with SMTP id ada2fe7eead31-4c01e30e820mr4391767137.25.1740654338994;
        Thu, 27 Feb 2025 03:05:38 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86b3dd25c96sm176082241.31.2025.02.27.03.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 03:05:38 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b2d91997eso666465241.2;
        Thu, 27 Feb 2025 03:05:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLDs2CJCqBKGhJyYPFcYhTWHeoJ/lLxNVF8jAdTUfWVI/Cjd2J6+n0dkBqaboxpVie6wff1kcTTa+uFUw=@vger.kernel.org, AJvYcCXk4wZbScvAdpSbNJdzLoQzZ1kN174YCKTC9prH9YZFX08DXDYN+WJU0fzoNbMxPc+BVcgLLtM0NJCM@vger.kernel.org
X-Received: by 2002:a05:6102:508f:b0:4bc:82f:b4bc with SMTP id
 ada2fe7eead31-4c01e30be50mr4589548137.22.1740654338310; Thu, 27 Feb 2025
 03:05:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-m68k-rtc-v1-0-404641ec62e6@igalia.com> <20250226-m68k-rtc-v1-2-404641ec62e6@igalia.com>
In-Reply-To: <20250226-m68k-rtc-v1-2-404641ec62e6@igalia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 12:05:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_13wOxD0Q0PVCUXBwC9y8iKXTcwH=m5tvX856S9ZU1w@mail.gmail.com>
X-Gm-Features: AQ5f1Jo7H3mkaD1WVTZTrun2RLr9xWvAG0froFsy3cqeS4yVfaaDlHw2vtfEAEI
Message-ID: <CAMuHMdW_13wOxD0Q0PVCUXBwC9y8iKXTcwH=m5tvX856S9ZU1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: rtc: dp8570a: make it a proper RTC class driver
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

Hi Thadeu,

On Wed, 26 Feb 2025 at 13:27, Thadeu Lima de Souza Cascardo
<cascardo@igalia.com> wrote:
> In the past, each rtc implementation had to rewrite the same ioctls in
> order to be compatible. But since 2006, a common RTC interface has been
> introduced. Use it for the last user of RTC_MINOR.
>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Thanks for your patch!

> --- a/arch/m68k/bvme6000/rtc.c
> +++ b/arch/m68k/bvme6000/rtc.c

>
>  static int __init rtc_DP8570A_init(void)
>  {
> +       struct platform_device *pdev;
> +
>         if (!MACH_IS_BVME6000)
>                 return -ENODEV;
>
>         pr_info("DP8570A Real Time Clock Driver v%s\n", RTC_VERSION);
> -       return misc_register(&rtc_dev);
> +
> +       pdev = platform_device_register_data(NULL, "rtc-generic", -1,
> +                                            &dp8570a_rtc_ops,
> +                                            sizeof(dp8570a_rtc_ops));

Doesn't this conflict with the creation of the same device in rtc_init()[1]?

On BVME6000, mach_hwclk is set:

    arch/m68k/bvme6000/config.c:    mach_hwclk           = bvme6000_hwclk;

> +
> +       return PTR_ERR_OR_ZERO(pdev);
>  }
>  module_init(rtc_DP8570A_init);

[1] https://elixir.bootlin.com/linux/v6.13.4/source/arch/m68k/kernel/time.c#L144

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-rtc+bounces-5274-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D4AC39A19
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 09:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A20C4F2122
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 08:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4143090FB;
	Thu,  6 Nov 2025 08:47:44 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2752BE7CC
	for <linux-rtc@vger.kernel.org>; Thu,  6 Nov 2025 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418864; cv=none; b=VeGuFYHKPF3md3cOIOoaWTZKg5hDd6WcKF7qRmjk24xXAp5KDHK+/wIebKPq20EK0YLveqp2n91vsA9JEIFcjuMSZggfbplleljkTkKLr3/XH3twarsCmA5VtZOZbxbMJzD3ZCHqCFxcNWVy5OAYsWG6yIBPdPK+DjF0wj/hedE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418864; c=relaxed/simple;
	bh=r4WI112XNVPvAwbD+KTwJYuTD4uzGIUEVqXtqMZFfmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAmZ1FruINgo8/MBDMjogCKRhbIBHh9h/VjPctqe3k1NLw16bMhRrpJPYV9fy6Wsma9XNuAZBTUWlsLnNFIG7/7iJZa6n4Jk5xJPX1Q8GvDcWuNEafqVFM3YsoWgbTJCsyhoDJhVaLtScvGCztl18U4ULocaYTdGvOsnQpuXl0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5d96756a292so1630102137.0
        for <linux-rtc@vger.kernel.org>; Thu, 06 Nov 2025 00:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762418861; x=1763023661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdhdbS5PtOsV4kjxfjLI8puwF2f4n5VCEZc3tH68S6k=;
        b=gBok+S7noIUOAhaa/+e86E/fWUiivOjS9LExryghiwEDA/dNDktzNeEzlkudAWrMlO
         nj6tCRrrWMqCkVUT0vwvlvE92L1hwSa1yaROr11OA1G8ckmEQRlQrJLD/cky96GiucfF
         NwcwpaBpimBalKH7DqeoB22fznypTWWOHI6+eCjcnwisyqmu8c/ODaGcpN2d3VPIORWN
         eXimDsM8HYzmIomeTfIZnWk3vSw2267h3yfgzO4xTuV/OhvxRh/3ZaP/C39O58FlrEbF
         ZQ+zNH+9DuMCOttuIiNXtoqZP2OP0cLvoKxlWi4135+to9HVEvGDK0y3cpKgVBJ0trZb
         oMRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwfXwSxzMHAyAgTH4bQh7N3td60a+8K686mo5jetCX7txW9rbj6zlQDBjfwHT31dpCY8uE9u2JJTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjUE/4hg0VRpYZ+kdwo3JzGGeUhDWmzCD+mKUs7vvsEdrh/PS8
	7pf7ke3U0hBGLhXs0YA6BzDHEbYAy0JpQUAMlX7lna+IUxh7v1pDuMuDqG+sZ80/
X-Gm-Gg: ASbGncuWC//KOCDCI7bI24Ytj43ME7suRKfDBI+fCs+f3Y9xHQm9kc9qUXiuKBLMQpD
	qNegy96jF8MR6o9Z5VUeQ1W1H0jdD/diXZQmfgcp2hSBJo+zdAbMuvKV8p8pdwOIaJX3sXf+q8K
	5TZ3DNqqGWO+ZqNqVbQyxIFftEnsEKk1T0kq66WHn89buSEFDQNP9BUyYnXrfiQttItJziUvM86
	bZcQImYlUKgelDOXgJxUgeMSLO5SrV94bLv1PNVf4Vesi8MHZhLYvPXVXwSHpPMLsEKVIecBh1b
	EF0VT0ZCvOOr/5/wenUSr891JJKg92UnvTRA8Ih3V1aRSlDWmfVmtz7r6hofWcQb/DdJrxG92gR
	T0ry42qpiK/Ikfir5D+ig5lUURF3pWAn3ppvZ86g0+CPIeGT14vIuTKyfo+8V7gw6rK4t3F7WH1
	HVOROTiUgcEkduDzMaS1IvlMdKGtAdhQ9shpjVF49bBaQvXYcW
X-Google-Smtp-Source: AGHT+IEG27RcAqAR7AktUJb7PyUPPrnWuCY+q4s6gbV/pjYp5EMdJBeRAh3uGe3co2Fb1UxORF4eeQ==
X-Received: by 2002:a05:6102:26c3:b0:596:9fd8:9268 with SMTP id ada2fe7eead31-5dd9fd049ecmr870769137.8.1762418861143;
        Thu, 06 Nov 2025 00:47:41 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-937087f5716sm792790241.3.2025.11.06.00.47.39
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 00:47:40 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9354847e338so433433241.1
        for <linux-rtc@vger.kernel.org>; Thu, 06 Nov 2025 00:47:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVjog0AsJXCzNwyo84fYJoot1AaWQH6a3WmkUsmCKGLqppQR2XMjNrZy8rzlBXx3dGinWBR6Ce0ps=@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:5db:e179:1c2f with SMTP id
 ada2fe7eead31-5dd9feef219mr849186137.18.1762418859485; Thu, 06 Nov 2025
 00:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com> <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 09:47:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
X-Gm-Features: AWmQ_bkMn9K93ASfX-CEwYoeGvJMeNWd5c5VED4d6zuDLnmC2ge-cRo7TaazeRI
Message-ID: <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

Sorry, I still had outstanding review comments I hadn't sent yet, as
I hadn't finished my review yet.

On Tue, 21 Oct 2025 at 10:07, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> (r9a08g045), with the following differences:
> - It lacks the time capture functionality
> - The maximum supported periodic interrupt frequency is 128Hz instead
>   of 256Hz
> - It requires two reset lines instead of one
>
> Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
> the binding accordingly:
> - Allow "resets" to contain one or two entries depending on the SoC.
> - Add "reset-names" property, but make it required only for RZ/V2H.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
> v2 changes:
> - Added "reset-names" property and made it required for RZ/V2H.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml

> @@ -61,6 +63,39 @@ required:
>    - power-domains
>    - resets
>
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-rtca3
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: VBATTB module reset
> +        reset-names:
> +          const: vbattb

Please add this property to the example at the bottom, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


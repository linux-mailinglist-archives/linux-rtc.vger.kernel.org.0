Return-Path: <linux-rtc+bounces-5348-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD0BC57ED1
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Nov 2025 15:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E1E8F4EBF56
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Nov 2025 14:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA6028725B;
	Thu, 13 Nov 2025 14:19:44 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A026D4DD
	for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043584; cv=none; b=pZw5qOhDr5ZF7mGw+Zhhx1ummK1HRw1+aQjSaVarNopBLp7o/kUfxw8ntpBlywbmvYldWuOSgeXE5rki9Kf7GNu4yY09mJ7h15NAL1czJ3OSMMdKUCo6RXuwgvbW6fhRs+fFu1X83xnWlpNLkXdX11TbOMyO8/l/NjW7MOaj3Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043584; c=relaxed/simple;
	bh=comZjXuDIDnizqUYHOKDvMQRgHC3+80Q+P6ov/b0Rc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwVsyUWPtQiBTOjcBxiCAgyWaJxOMke00V+KgNwybuaCChsCuoCi4+9r/Y+KjTi4UfSGTLjIoA4AC7gKo22XGUiPk2tROtFI8uTC2KqMpyAPUm4tE2ahp4vPmciICIt9kITpQLYQgS9Xh5JlNa8n5c+DzMgkjhwYlRbVXBweNmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-343dd5aa6e7so961212a91.0
        for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 06:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043582; x=1763648382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulWJQ4QTuc71083HdY/1CUbZ5xknk1Yhidqn40qfX8s=;
        b=h7bZYJVNaxZjVexHbUsy+yxMwQ8J56AK16LtHpAiNySqT/6N0FwZZRHqS9Y4UoIHtE
         SMillqiEzzfTBQU2+LmNJ4IAOe3F/F+V85Rx1xQF3h3mX/Gn12+LIxcr/MJn15sSaS7g
         JIC9Sy0Gq4/lTWbmXHTK9WyIGKKPcfA/+rUvwEtXOhX2CwzT9n7XRkD0P8+VB+IOqJm7
         jBH7Ce1pIVCLfquC9zWR/srE5xOJwcYQpeVm3ZI1p6Rh9VKnFa7ClvyAmTWkOC7Kx0EU
         oahGP1/ZzvEYbTLJt2f2R0abUg+EHE+9Unel2xTF6xH6iIPNuXobCkvNfrjGtkq23Ff4
         XaSw==
X-Forwarded-Encrypted: i=1; AJvYcCWhbRWaDOlOPzK4sH88JlIXq9S8HTifGSlVcRot7Jb/bPcgogL47LGG2digMp+6NxRqGDs3vbiAcXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz5PAKkrjkYw8B2yfvBVUl2sfELeopOsQrmaYZ5tscEh8ZWjUP
	dxayMGy4VNgqbPCJRxKflr2PpWILXSMejEwknjNhGx66vjVyeAcjruEvxbmQzDb0ZS8=
X-Gm-Gg: ASbGnctb/T3ILMwpxd77M/ZU0adqbgO/rzNjAgrzVRWhRJMt7M4De7pEu24LaLnb2ri
	wllnbUey4fmscMsm6tEKVGYkmhXxwXC+MefwVnn7A1Vaw9aXJkreenb+SoS2rMZo3ebt8pv1DNv
	UHdcI7L+Bs1DNtvTTXrz0txcVVKiBjRL1uHD7feAoygEzP6d1I/fcBfG4AoJ3WefaylrVvI5kgr
	KZqrj1Rr0Ky1DzLFktmcCHOp5MmPpxOUtY7bb8IFiCjq+TK4K41TIy71A29sS/2O8z2Kkt5qeFO
	xjQMNlrAsyBEBKquu3+T+MDg883WsbC1eNrvDbI4ByDXBcTGGAXP3kopBrvb8UmvXGVFmYYfiCq
	vc57g+rjGMHGWakdunNwI/OCUpi/FipnoSWRdGSTeZAIv3Zcug6ZLd1TDKou+PIdWlk90GOusf6
	TzCBQ7RU2GgZYAiT8AXZTaPmMvlkVR9QQGqY+Bws/seQ==
X-Google-Smtp-Source: AGHT+IHgWfHj2p+GK7ns6d341Psd979gjsqkF+ws3AfsFnkTCIPXDcf8g6xpMKOxrXxQhxSNqnseGw==
X-Received: by 2002:a17:90a:ec84:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-343dde195d8mr9873591a91.12.1763043582410;
        Thu, 13 Nov 2025 06:19:42 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07b4b23sm6272245a91.13.2025.11.13.06.19.42
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:19:42 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so999838b3a.3
        for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 06:19:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHTAwJEGL5wN7/m08QWeC2XC1BXEFDih+Nx/dlx851v1+0mEoPgtxGRbu+iWYdW1s+5C6jLJYcZD8=@vger.kernel.org
X-Received: by 2002:a05:6102:d93:b0:5db:20ea:2329 with SMTP id
 ada2fe7eead31-5de07eaedbdmr1809754137.35.1763043138634; Thu, 13 Nov 2025
 06:12:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
 <20251107210706.45044-2-ovidiu.panait.rb@renesas.com> <20251110-hardhead-upside-54baa149f453@spud>
In-Reply-To: <20251110-hardhead-upside-54baa149f453@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:12:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUOMYZGF2xJWUnBi8i3eggxi2+j+FB0G-E7bMBwYAGhQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnlPnhXhYldo17YNgMXfp15mj6ryj0q_5g1DZAmmEAVMaJw8DyorslMWa0
Message-ID: <CAMuHMdUUOMYZGF2xJWUnBi8i3eggxi2+j+FB0G-E7bMBwYAGhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
To: Conor Dooley <conor@kernel.org>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, claudiu.beznea.uj@bp.renesas.com, 
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Mon, 10 Nov 2025 at 19:50, Conor Dooley <conor@kernel.org> wrote:
> On Fri, Nov 07, 2025 at 09:07:03PM +0000, Ovidiu Panait wrote:
> > The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> > (r9a08g045), with the following differences:
> > - It lacks the time capture functionality
> > - The maximum supported periodic interrupt frequency is 128Hz instead
> >   of 256Hz
> > - It requires two reset lines instead of one
> >
> > Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
> > the binding accordingly:
> > - Allow "resets" to contain one or two entries depending on the SoC.
> > - Add "reset-names" property, but make it required only for RZ/V2H.
> >
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>
> Didn't Alexandre already apply this? The changed version is
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> in case this replaces the other.

Alexandre dropped it, so it is no longer found in next-20251107
and later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


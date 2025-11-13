Return-Path: <linux-rtc+bounces-5346-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C0C57EA3
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Nov 2025 15:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F4D24E963E
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Nov 2025 14:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12858283FDF;
	Thu, 13 Nov 2025 14:18:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A6280037
	for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043534; cv=none; b=injUKiICKNj9VdC9/zUEjf6ESD8CMDh3TZgpERO2bSwdiT5gyeaGMVdcuV3flZagVM8t7bKgXKScZ4sKQTpwqqxuAKI3s4ScyXTCdR2JBhampPWiexD0romvaac3HPItWyjf5rfSp/ivT8aWS81cyrhHmrg1iyzGqnIrRPv6ckM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043534; c=relaxed/simple;
	bh=SglwgdJjdXgtbcGuhBd+z1SY8I+c9+nx3fEEJ4chWEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtJFecT0AMPcYrVNyD6xAUSwMDOLceHSL4N8rb+cPeG+Yse5Y8LkGvXEkXz/bRCRmU8LFD5m2Km3fOnxLtAMovlUoIBMxTNEiCEMy7NxuyR3/wJU1txBSv1X8hdDYXoMYfS+OCfF3WWXMCK/o024UTq97I/sjyD68qVQMX1pYqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbde7f4341so1501403137.1
        for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 06:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043531; x=1763648331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lsBSIAEUPRTn5OJ+c8R/u4+S4nJOhGwxwcKm3MB6tI=;
        b=DCxxNWyvC9qKUFY0PDXhawlapq2YELQYEnZrO8s/F9dVKTVTESp8k2tJtNpo44X20P
         vCKttTcVsO6Fn61ZFRFT2J1MK58G+e4VM4OvoQCqeLzEErcPjRQ9bsuO8DhASoQduKnj
         0Lx2xRmbYkaZdomHnyqtdnQt/CMKu5/bdhUqKR0VxXz2VJerBmoX2ZkNnIofXWCSwSPQ
         nQWBUyarEHwHHK+VWp8Y1j+9N7qihT0FVLP8DI7zOsJex0LIKKLLf0LNZ5a4NdVuHuHf
         XhyjnK+ZyRV2foNEF+ksT3vNtp/vlj1ucGVIOytbzDrKA8gw0EpTxlVr1b1FvHW0YjSM
         8W5w==
X-Forwarded-Encrypted: i=1; AJvYcCX7RlHcL5MzuaN1EdC730Cwf6f4+qdiJ41yvzHeBTPP/MBPFGM4m5Rk6b0DWTwZJabbLPWeJ5s+s2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdapRLJuIE7xEkfp44UDwScm/fTruLe39Pj60lvtJqlEY2N7OM
	4TGANDX13pToL2KdUVSzByoFamLgUyflvwfspDclqXR+gEY4T+NpSbpQ7BAWWuFkePs=
X-Gm-Gg: ASbGncv3TouRsp6KzFPTNrxXkm4SufaVhi65ZmaVZumF3DkLEQXT3vDptvWG2qfG/58
	nojcISZIRoXYrz5PVOBb2SGbdc0GA/R7WwHowV/iNYboxzU3GqF/pz6QXiF9gqUubKTY0/13PGP
	HueEc+oYckdrqtNDJWnpFW9NxRPEgItu05Sk+N8caaiDOIgIApOVXjsGHtOL6JMsSsi7DRcStVj
	ZxSWmD+0sGHESMm4rFYCZTOGyQiES7Ngm+4KGa0OYsIJqqjtwP5wwBy4JowL/+j6vUSrrj5XI6o
	ueS/NLRe6pZDdFFR9FKPDw06IfHNQ3MQYeqtEerPNoi3VsVJMdRZxXgS9/NLeEYGia20s8WN+vD
	cTV8XBkXBZRbs9PRswUtluCoyTb0RKdH5KBuTEwa6uga5qz69e6mV9CPRuSo0girlFeNcHB4jmk
	4XOa+FV+nDzLrJXxgxDSrfR4w4P0/sDRcEds6PLT3WyEs5Llir
X-Google-Smtp-Source: AGHT+IGb4k/91AUYkwxUx+RHhAXMivKr4l5RnAL2F+kTvTK8+/NnrXsDXQ2e+Ba28wEC9uepNdtVDA==
X-Received: by 2002:a05:6102:4487:b0:5d5:f6ae:3903 with SMTP id ada2fe7eead31-5dfb43a5a9fmr1473451137.20.1763043530980;
        Thu, 13 Nov 2025 06:18:50 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93761102330sm629909241.4.2025.11.13.06.18.50
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:18:50 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbde7f4341so1501375137.1
        for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 06:18:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3OKc8fO2jFjfHvaQk3yMutoQKsa5NRK7c/lWuoKf+EFEyPucRGC5jqS72yOKbyWCNnIf57MzJKhQ=@vger.kernel.org
X-Received: by 2002:a05:6102:b0b:b0:5db:dad4:840 with SMTP id
 ada2fe7eead31-5dfb41e3b61mr1262190137.12.1763043529716; Thu, 13 Nov 2025
 06:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com> <20251107210706.45044-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251107210706.45044-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:18:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXr+pdZuYM0b1p+hZAjFMR25t3FV8cGWSbqRnTk118TPw@mail.gmail.com>
X-Gm-Features: AWmQ_blZmrYQK7IiX68T9lKCtdQnRgn565V-vW-eTn9Sd-DrKbAs0Z8Z3RjSLgE
Message-ID: <CAMuHMdXr+pdZuYM0b1p+hZAjFMR25t3FV8cGWSbqRnTk118TPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: r9a09g057: Add RTC node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 at 22:07, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Add RTC node to Renesas RZ/V2H ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


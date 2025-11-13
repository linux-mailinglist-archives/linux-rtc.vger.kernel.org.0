Return-Path: <linux-rtc+bounces-5347-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D2C57EA7
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Nov 2025 15:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A1A254E9E76
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Nov 2025 14:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F5326CE15;
	Thu, 13 Nov 2025 14:19:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E52727E3
	for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043553; cv=none; b=r/hLPywiXjVJoRbbJXuPfFhGJSGjUgD2E8OhceUp9nFkJo3U0DIX/SBsn7O2KkA+/7Uu6msSVSy+oTym6d8G8duzgrbWHQ1uln77IJ8BxiZdSIlBaR7G6XFUW4oFe+XTjbGw7AXa9b4/zTT6HAyzDYFB3O404sfQSq38mIZRPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043553; c=relaxed/simple;
	bh=vJVdsmeHsUXqAeVRdhsj7TQml+wrLBqo7mPbRPjpD20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjzQqcuXdBM2O9QXFyy61wg5eafee92TrFdBdMcxonhueR8PR0MODr1XPcGUtf9co4O1W7fTszz/rLV6y4IgZYf6xBvNqz3Hy3fnZFcnBfrjayosVDHEb97Lz5tZqNy0XwNZ+XXvM83Lo+I83LxhTRqNj6LvZJAekOlVvOaCu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-559f4801609so312202e0c.0
        for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 06:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043551; x=1763648351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icPVrj3OePZGMuahj/4/ViTGnP1F/ipWE8Dz8LO0Hro=;
        b=F9zKye/FPMY3AirY/IAX/IiGcLNi2rITRE7CmTogxapeIlkS+MRlTR0E7vjzzUxEXU
         R5qyHA6G3W9eKti0RXZkqbvABLkX7k51GahOyeDC4JtqOXM5Ynoh0QZc9D76i3yMtBOw
         1HEarArzGFykG5OvI0OLK0dBvX2Q1WIaXfCSggqgUTE9lfhSmDZjuSXSyrbZ/oEpDSCV
         pCtGTSMIbPvthe3/N9mFpjiEBvc8G950TaPzkyiKky740OS/IhLs/Om78+Ad69jGbkt1
         2UO0siheCehjlXDCsSDW/vXyeU6Qg/LCNC6wavYCcVDy9qrfzFPCWSXg6kt0UGKnrCWt
         kCRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwXdaibEMIn6w2e2XCY8JfAFsastVkF27jPeN3XdK49SSmVJHbIjzTSlz15DtamGVre5De/52IP+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3tmDmN6xnHpMw+gDocijJX0LtSCqqC1lRcY1etsvlt6dQHUr
	Jk3G+UV4n/6+X5A0PrHwKsEp+d4FPlc7FYfKwCNtoVKhi7i5iPvckE+umJwsg6lNCVs=
X-Gm-Gg: ASbGnctlf2e0mtH6GDv/7mzdKf62IHEqTYILWssw3lNYmYMLdluAs9vMkAilV3yEB1D
	iybiL7NeMPsrovQRCiaRzUwYFtB3sBM9ujxoA/DVM2kxTrHVyXYgv5FJP/VX5drlVnvYQ4hkSa7
	Ih4hWD7YFC2vS+c9LPi3hwe0rmgyOY+spX6jkmaVOL9EqdWfyb2/msX5xHmsZ6Br14Iye+DsOfg
	9c8Y0nKRHcdgGEz6W6l/LwyKMv2Y7Ung65U8H5mgFbz2STLYAGfEz8pWw4g6WDZhH0LUz78gv9K
	8KRYQSPaIMN8rTNEPo8HchfYuGEBTxNv1+1A+KE0NnmK5YT9RSENbQK7nTIhfv89/XhxS+IQ1Hx
	u8h/K59wKMbEi581TAjKLCbClKPNsSi8SPbyE1w3weTdTvIb0qDMUcY0OShFDbSVln2bbOE7Mh1
	MKVNR4kq0VpSDLlSUQfYFfHhAMafBmIIdIB85wtw==
X-Google-Smtp-Source: AGHT+IESZruYO7818AvGMxGjHYq29FTq/g0+il7x4+SphSZoNyPh19tvPhzrPW8fgQgiU491JH9DSQ==
X-Received: by 2002:a05:6122:6b0d:b0:55b:1938:9173 with SMTP id 71dfb90a1353d-55b19389264mr330116e0c.3.1763043550616;
        Thu, 13 Nov 2025 06:19:10 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f359fa2sm792724e0c.8.2025.11.13.06.19.10
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:19:10 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93722262839so509223241.2
        for <linux-rtc@vger.kernel.org>; Thu, 13 Nov 2025 06:19:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHe4wntv4B+Asc4Pywu3cRck23hPTZ5ODqmLal3qxiyMzUfFfSTkgaK9XIVk44pSmzXOlJ54SZqWs=@vger.kernel.org
X-Received: by 2002:a05:6102:390a:b0:5db:d07c:21a9 with SMTP id
 ada2fe7eead31-5de07e67bc0mr2364221137.35.1763043549851; Thu, 13 Nov 2025
 06:19:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com> <20251107210706.45044-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251107210706.45044-5-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:18:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSgpJ3khJGFn9__BW+W+zM+fgrEDFKuAZgQeXyWa6w-g@mail.gmail.com>
X-Gm-Features: AWmQ_bnydjHxg_KvXSzY7Vjv_ur8bfvy2AE8JWRXR2FRDM9SQFjKqTqegYDXS7g
Message-ID: <CAMuHMdVSgpJ3khJGFn9__BW+W+zM+fgrEDFKuAZgQeXyWa6w-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Enable RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 at 22:07, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Enable RTC.
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


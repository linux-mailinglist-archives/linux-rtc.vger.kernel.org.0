Return-Path: <linux-rtc+bounces-1402-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC839180A6
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2024 14:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05E2F289972
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2024 12:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF4318130E;
	Wed, 26 Jun 2024 12:09:18 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BC7180A8B;
	Wed, 26 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403758; cv=none; b=uLtVLgk65cNM1yzwzAOzL5l2Rlh7TPPhwbHRuAkBJsed1y2xowzzHOIuycEPfbB0bmPRPUcZE9/rmUQ8+om3pmSsFGV7BigZmACKA2n06oUB0K1/jai4Dro4WKVG0E8f4rAk2vEgd6Xk8GZn3phx7nZ/XPgLyPeLVF2wQF0HZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403758; c=relaxed/simple;
	bh=2+xH1mBOhPUluIxywXqOwQLxQ9N4Y9lY8NDxqSCdRcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1j38JyX8+k5DdYRCVh6JVvZMDpfrgXY5smeU/io03ACZv26hNcLDQJP87aKetJ4UFFdUGk6PfE2CoJ2Tdca4+lp9coVzVnVf/RnWDV/qF2eGrYzxkJSQlPwy32JgmsxiBWGeqQtpce7rQNgyIZjI0ZZ00cFf0hXVa83qYxd2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso6735833276.0;
        Wed, 26 Jun 2024 05:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719403755; x=1720008555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0mk92Bl3LQ3otRfOdnBzHIQx6l64HiZ4cpcn1DGppY=;
        b=epqPNZcgvvO2GidJuls/Ew3B4Lc7CPtq1QApoRLmqZnSzoBpeLcrBZIexFWY1uHyRP
         CWwrzSSAeDB+zf2oi5e7nXzpiFW6AIyIOc+1Qtkfh97TxgJ5HR0ll41VKM1SZHNoQhG4
         zYjHkIf91lMlEOUnSuulD9f5QfA7vkEeBj0HQqF7MSjmP2aDXiu+tupYuuORBW+j1zv5
         90O/aF+MrQp2qXHS+VMrZo8YphnbaxsmnWXFzNkGPAN7fTKj/Qq6u80KC013e6Pb6sFB
         P897AMMDVfzk2EB8wEEIivx8RhMTouXdLhX0Fj8EjckaHJwt3NBw5XTwxcwzGSUjVRpI
         SBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyubZWhzk3NHcgi+UjaCs0isjYj1CAwPa4IFnEud4OCHhLvbzSv2WweYXDW6gYnouL8kJDf/TWWeUbfg4cZm4mhWc+g/8QVeGrMZ7VqinMMUXBstOH9MkZQRVd2SfSPymk9pfbW/1f4zeinr9onSZLRkvz8PIGd6kczQ8j9R9hUxk96M2LpjlLMH3l5bcHhAileGVRTOizmdA188858ApvS18wqe+mFkK91L/73Vo3vZk+8oWHC71lQ4p7pIj1qeNZ
X-Gm-Message-State: AOJu0YxabAcVDU77n0AJj2GajYDGnNT6TxLM1v33a5A7xmNlzGrUh6S4
	Mq8vOnS2CCxewcpzlM0DIM2WIzabzjJH847bHBsobc0xz4fJQPAhzxTj4rui
X-Google-Smtp-Source: AGHT+IHT8Ji9BSYpDePtcyLAvDd8mwMDstHI+WrAsMa+68ZO1QhEa1+74Lf08SYmALlC1gB1tMs0ug==
X-Received: by 2002:a05:6902:102f:b0:e02:b7ee:5354 with SMTP id 3f1490d57ef6-e0300f893d9mr13313130276.20.1719403755045;
        Wed, 26 Jun 2024 05:09:15 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e65dbbafsm4391812276.60.2024.06.26.05.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 05:09:14 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-63bdb089ffdso52892097b3.3;
        Wed, 26 Jun 2024 05:09:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtP+P2l7EssqxlAePpcX/HMKIobOWHioZsWMcxgSzIrdb+BLEpSGBhCcrIKIEV7TVe5zFJHHz6vXEhqwr9xssi6MI0XUmaClfFbRjdXM4D2PBS/O1ubTZgn58G/o50uBurHQpJhw/tgV2g7l2gGcQnbnc5Q4sXO3J+k2bV8bdUKLMn2xge4+swZw/trlMYJD7iQ/fT1WTBbS7qCh4v72Wylx5w0rqoPylIAbKTukrMT1h8Zxn0MRrs45SRbGMsW1DA
X-Received: by 2002:a0d:eb84:0:b0:61a:ae79:816a with SMTP id
 00721157ae682-643413779ccmr91520187b3.31.1719403754668; Wed, 26 Jun 2024
 05:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com> <20240614071932.1014067-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240614071932.1014067-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 14:09:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMQJrEWEK-RK7Nv4Xoj=B84x9sRPiM=KCNpmx1Xk=Ktw@mail.gmail.com>
Message-ID: <CAMuHMdWMQJrEWEK-RK7Nv4Xoj=B84x9sRPiM=KCNpmx1Xk=Ktw@mail.gmail.com>
Subject: Re: [PATCH 01/12] clk: renesas: r9a08g045: Add clock, reset and power
 domain support for the VBATTB IP
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 9:19=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC has an IP named Battery Backup Function (VBATTB)
> that generates the RTC clock. Add clock, reset and power domain support
> for it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.11.

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


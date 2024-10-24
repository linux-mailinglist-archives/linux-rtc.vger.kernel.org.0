Return-Path: <linux-rtc+bounces-2295-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD199AE87E
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 16:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA8941C22DC5
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 14:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777271F6684;
	Thu, 24 Oct 2024 14:19:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E47CF16;
	Thu, 24 Oct 2024 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779582; cv=none; b=ggrKiHyZBih25V96UDHKdQnXXhbKSg5uMNpyaFghrnuQ+lPldIeKZ+HbXxD7urenhxBeUpcXt32PbIZ5IyzzuGKfcDw1pOoz1qglzARRR4soEQ0hiZQ3C+aE4hzegHpVYgY8ArCpgDG2wnqO4zB0cSX8jZd74WLTtKXopvm9gMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779582; c=relaxed/simple;
	bh=43UXd9cp88hLkF/4MW8cRuIqC+fE5rEFr//+oo/XF50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpLnBM9ZpbJCQyuxOohNt5eXvAKYYDOQVmTZt7S3qwnt88j51SsPE/Oxn/TYI/5ZUkPpnHIABxbWkdGr6sxcKR0wj+JH+2UNU5mos4KbRdnkkJYwTM0h7jSvzP9jEHx0/OwxvSR3wX3vt/p01HUEwPiShiFzXQlnrvRwXuFQ+JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e35f08e23eso9328327b3.2;
        Thu, 24 Oct 2024 07:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779577; x=1730384377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqTnsoEZYxtOvzGswQn/BUh9epLwmQzIa7/D6c1Al8Q=;
        b=A3bAAehTsUyIaaTZ8sZchZa/PFzni9NqEIbMLaxQYYk0yviNJnaDWPZxRBN3bHDDxE
         WsMntwKmWMJMvqgVspU/cC+1wHB91u6vsLl51RK5DkDCLTAAHbeoDtNB/XcTE6JbaxcD
         Qc8ZZX2DrLE261RNRPlGdZonYUztGtd4X20xUR51/tX1Z4uxfLmNp1SfOQW/+iHZOLRX
         a6Da+JWzy7ZjEhiGQGJ/EFmNGB/8je4YSZ0Mqwni9uz4WRsheV57Hrw6iEpcbMDswiyI
         igjC00qh2ummw0op7FzRHkakjy2s6E3k6J93XqVGAP/vuylaFNeFKXe4F3fDC98H1OZG
         mVxA==
X-Forwarded-Encrypted: i=1; AJvYcCUWHUpiRvACo43RpIZA3cXCbyi6FuAY+shmMfbT5YsvNMDFuwclPceUBwJQEk3nqWyNpaxc/UuOAkHVuFl6bqc0jO0=@vger.kernel.org, AJvYcCUXmO75lMTAf2fV9IDH9NCgjSTA24zb07rjzRF6/PoSexHzMgsjUuW/cHGbrIMX20XGIPjq5OlDitFH@vger.kernel.org, AJvYcCUu4f/7cLMEdl4KC510dsdFjHKtSpQBma+EDjGQPyoBdCgSfwQtaE3fedBmNxl5KTFKUYYdgcArGd9a@vger.kernel.org, AJvYcCVwBneVtwGCadLcfAAjBtzI9UFojomFfYLJ5z42zw+iBxqXoqgcqnbSqJGXMzDWHGXccPGC0I7JwtB3QiS+@vger.kernel.org, AJvYcCWFUeuNMlSvoVds2/IS+Lb9xO6E0wIce3JejaLcMsugG3qMis9qGDwlu9EYH546KeL53VeMu2cgf0MM@vger.kernel.org
X-Gm-Message-State: AOJu0YxZjcSwBE813jZFMj5ZLUItQH/q3WMEav7KTa4lyIg5yqXCHYp6
	8DO/vecMcIY+pk6M7NkOVmGTV225TQe+GjtDyl2ZrfJFaIUW2x6m74Dpk7mY
X-Google-Smtp-Source: AGHT+IEMGkho6O8pHqnqlbAkyVq4sIAffhIzZyeZFE67Ps+iSHbk6HkBEc/RLHMZt1lyMAv2iX69JA==
X-Received: by 2002:a05:690c:74c9:b0:6dd:c679:f108 with SMTP id 00721157ae682-6e85815202emr26387337b3.5.1729779577441;
        Thu, 24 Oct 2024 07:19:37 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccc4d2sm19643027b3.101.2024.10.24.07.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:19:35 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11197317b3.3;
        Thu, 24 Oct 2024 07:19:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBSkvE78g+nB2CEXuBq+wYWWbfPiPH2r7zwvyEptKTG2VJNWrUNLBKX+nzzF9gQGhpAvx2Vv2YV3LKCnRxI1AFy60=@vger.kernel.org, AJvYcCVjWsPLZwZuooWtDH+jHoc3NerNquhnuQo20sBkSLRmQyd6PfMItRXNjTaMiPtZV20Klpn3MPoKBD9fLMyG@vger.kernel.org, AJvYcCWIKzQlGnU93TTKqMnAmtwA0b9AGqOimkcK+Cs1jZXscTZmjhrSsdZi3Wgo9G3j7coXsceFaC26hX5I@vger.kernel.org, AJvYcCX9cOxJ4LvTIfaxW03DmRQOuD9qqYeB5PJ2MwDdpZgvU3bQLMy6OQgfLOnlrGrTNzQVRl/nLC/ho3Id@vger.kernel.org, AJvYcCXcyyqFj6VbIB4O0PyUKcc/HOOC+t74WLZQ/qfZkDwavjpiEMWO8Zu4hPGdDo61HVLlfMbCrKdVLjsx@vger.kernel.org
X-Received: by 2002:a05:690c:d8f:b0:6e7:e009:183e with SMTP id
 00721157ae682-6e85814d515mr26107007b3.8.1729779575387; Thu, 24 Oct 2024
 07:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:19:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+7GJammviw9kOXRY8ijchDbDwWEF=gwVJ4nAxCEWAgQ@mail.gmail.com>
Message-ID: <CAMuHMdU+7GJammviw9kOXRY8ijchDbDwWEF=gwVJ4nAxCEWAgQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: clock: r9a08g045-cpg: Add power
 domain ID for RTC
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

On Sat, Oct 19, 2024 at 10:47=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RTC and VBATTB don't share the MSTOP control bit (but only the bus
> clock and the reset signal). As the MSTOP control is modeled though power
> domains add power domain ID for the RTC device available on the
> Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - none; this patch is new; after discussions w/ HW team internally it
>   has established that the RTC and VBATTB shares different MSTOP
>   settings

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.13.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


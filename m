Return-Path: <linux-rtc+bounces-2381-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6989B685C
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 16:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4BFD2844F2
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 15:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745332141D4;
	Wed, 30 Oct 2024 15:51:00 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A7F213159;
	Wed, 30 Oct 2024 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730303460; cv=none; b=etgEPKm4JqHgCC3b4k76xQO4GyjBgBz8XUOJMfrhMV5kx793bgnDfiaHnF19pUo81sho+s5wQ644hXRNV3frWuzzlcbvBalfISPyLy63/D+6TUZruKLSsOcLgbbxRpVhTkczuSvC/DiDKYCzSpLqMgIstD4n/ivqcEnS+no7hsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730303460; c=relaxed/simple;
	bh=oAx3qPoGk7/l7cVyiHCfFylfOD6C1GRnUkmHon3tzRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+GMJ4psQsncJh+b60+WYamwLCoWP/rJpDcku9d2DybExNnbEqFn2VIuAIt5fUrhThW6HVzZK2mcRWWt++hySuv2VRb4vSr11RCDk+tQsga5jhdW7+ibZMfWbiSJPwvOSCVCZPDmlxx6WeOHAC5Yq4SyrjBzTqqHnslsegJl4Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e8063533b5so67980537b3.1;
        Wed, 30 Oct 2024 08:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303456; x=1730908256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EC2kAOyhBeu2A9ruzL2chXlQlK+zyVVG5peyIKTpvEg=;
        b=ksxmZvlEGM52NJyCvE5jb/NKfW/8qwn7AGUWr7XXYgKin1XpG66FvTRc53v7Q6XlzL
         o41TSJTcaqydnXeSOzWUDss2yYT21iEYBR7jHkn/DgxnjO95xANUqB3sztSMJG99VYDL
         o4CXX3Naeaie4GtMhWgW4Mp4dqUO/QoH4wb3CyUU114/HEJCq6cY4YpljYoRDW+2OewU
         TLC++XXfew45vzFTYj9RZWFUqVrDslMzccgfWzqX4r2OvyA0Xjcuw4YU3ViwFGRHIeCM
         IDIAaTad94pre7y80gfCDE0cekPgPqEqpe0p+R4soQwJCiSTATSwNuisE3pd4W9XfY5k
         FaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+l68QAg+5A1DHMfuiw8z2Iiyp/cXoLFEyI3jlq2Vk9MvrQw8PaC/a/uNA/ArliGbF3KKI9SKPt1tQczmu@vger.kernel.org, AJvYcCWINzeOVvfFZ8FbQOBCEvSaiUuHL/ycyPZXd3DoM7/YDkLTWUWkOOIO3UEdIaskf6Xs85WX6itR7/FB@vger.kernel.org, AJvYcCWLTGdeN9MOKTlsiQCgdPdIL9cnI/TauJ1vMNyVAK/RJQA4MbV1GMXdsEzlkhe63JLPkTS0T9DsVvNH@vger.kernel.org, AJvYcCX/G0cth1BjTaJzN09mmg3MDqpZbMkuamooS53+liQhqoEPSILa7ASNT6FMDHY6XPcoWJcE4qvQmzHh@vger.kernel.org, AJvYcCXZWgDLwUxQ/tNyy5cQM6p2O3bEpXp65euKCBbHybBUAyPg749GmJN/hjvY3f/oewDI6o+UrD+JJ6Ea2G7zL8j+oZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpn8Sbaw3UvfAcQq1hPxxoRiBssoqQYCYcQiBYoFWokvnkqT/0
	jCkNO6Csb9hSPNji907LBDg2r23ijAoMXBRToJjOfUztgDntAijWSP9M/4cD
X-Google-Smtp-Source: AGHT+IEuUOKH+yMy6MkJxbn19btFh4k8iJ1oEh5BBRjfFxg6c7gVxEogkJiXVgqg4jSfGWsRSI6wWw==
X-Received: by 2002:a05:690c:4b93:b0:6e3:2630:2a0c with SMTP id 00721157ae682-6e9d8a6ffe0mr177605167b3.26.1730303456544;
        Wed, 30 Oct 2024 08:50:56 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6bafd23sm24506467b3.29.2024.10.30.08.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:50:55 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e8063533b5so67980247b3.1;
        Wed, 30 Oct 2024 08:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuxBdOf7hE8HR1yB/tp+u2tacIsTYInkDgN350TYixnrcf3TwbWtBiNS8QZVJf3B62IF3RY7UgWN+bR72E@vger.kernel.org, AJvYcCVfNJar3qEzxg8w/FIrD6iZKfRrT/j4QrA4coJl1+bCbMtcaIH0zu5Vz0U3YDOBdNkhFId5JZ3JQuH7@vger.kernel.org, AJvYcCW16hkXzV7uZNyGdjZWBJEfKb56H5N0nHrAd+NBQbFaGFPPdEkbJBMftRv7dxQwkoDWGE44WIPSfSOS@vger.kernel.org, AJvYcCWowukWMITJfAEKzG/d5pFmX6kuRbigQCN58QZlpKmKOwZAjhUvNG7vJEfYjGlCnxDWh93bEECUBjDMYKg90S6Yz+s=@vger.kernel.org, AJvYcCXmYduKC2YF6tKA4tVkttUrgPZYw426cH4Vy96/5jw8Kl3En82tWcwIEHQhkhMD2DXUZH9KfNC4aTxc@vger.kernel.org
X-Received: by 2002:a05:690c:60c1:b0:6de:2ae:811f with SMTP id
 00721157ae682-6e9d8b34729mr183550047b3.35.1730303455642; Wed, 30 Oct 2024
 08:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:50:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwW98riCJ0VfZMzf59Lb4-gRm740z7mnSDQDTfQSJzWw@mail.gmail.com>
Message-ID: <CAMuHMdUwW98riCJ0VfZMzf59Lb4-gRm740z7mnSDQDTfQSJzWw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Add RTC support for the Renesas RZ/G3S SoC
To: mturquette@baylibre.com, sboyd@kernel.org, alexandre.belloni@bootlin.com
Cc: Claudiu <claudiu.beznea@tuxon.dev>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen, Alexander,

On Wed, Oct 30, 2024 at 12:01=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
> IP. A 32 KHz crystall oscillator could be connected to the VBATTB
> input pins. The logic to control this clock (and pass it to RTC)
> is inside the VBATTB IP. For this, the clk-vbattb driver was added
> (patches 01-03/12).
>
> Patches:
> - 01-03/10: add VBATTB support that provides the RTC clock
> - 04-05/10: add the RTC driver
> - 06-09/10: update the device trees with proper nodes to enable RTC
> -    10/10: enable proper config flags for RTC to work on RZ/G3S SoC
>
> Merge strategy, if any:
> - clock patches (01-03/10) need to go though the same tree because of
>   patch 03/10 using the devm_clk_hw_register_gate_parent_hw() introduced
>   in patch 02/12

Once Mike/Stephen are happy with 02, I can queue patches 01-03 in
renesas-clk.

> - RTC patches (04-05/10) can go though RTC tree
> - DTS and defconfig patches can go though Renesas tree

Patches 06 and 08 I can queue in renesas-devel soon.
For 07 and 09, I am waiting for feedback from Alexandre on the RTC
DT bindings.

Thanks!

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


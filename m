Return-Path: <linux-rtc+bounces-2440-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 184F99BA55D
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Nov 2024 13:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30FC61C20E2F
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Nov 2024 12:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9135170A29;
	Sun,  3 Nov 2024 12:02:56 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B013635B;
	Sun,  3 Nov 2024 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730635376; cv=none; b=GRG5BfLLFl2PiNSxJeQm3eJHX3301pW4ZdvDFZS786ZDeVbg7KnCbBOSNN5WJ51JDSQU7CHyF3eTRdm1/JLi59p+wBI0Vp/254MYTA+MM6AL3y5hoQdpwtuv4ZfzLF/kLzg46oO5SMRVV17/kvdACv1wEHhoV1jqMdhnsk7W/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730635376; c=relaxed/simple;
	bh=hzqa0J6A/W1DpFzA4bzSC2epR0PHH34jRlxVwGV8E9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7cOs2IGsoLKyj6qHkJ+17MGoz41ej8Y4uAB5TkkURkMrn/zlHkqN7sZ9LoPeUam++LPKhjsIx/TyswFbZ0nytNLvaMBdGXRGbcbgkDmapr1pxXImXVEczvZRGR9j7uE5oW7cRBk0OeW4bYO/5IwjHBF5giTmS6TmqIPfy/XSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5cec98cceso27058457b3.2;
        Sun, 03 Nov 2024 04:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730635373; x=1731240173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cd3kIe56QXQQam1qx/3dD2gryf9hu9/6h0hqv8KkgSA=;
        b=tEUVCmoYOXsE8rGhftAE5LO/2NSVmd57DtJVwKxX8AZBK6wiUPsZNJXp82uqFkjYT+
         W7ibOy28Ee5f+hCxiQb8MSE3IZYd6urvJmlPJqJZnIoD7dHRzN+aQPmBt84myNXZbQNu
         ZpECVmH/H3ibNZM3Iy+8yxbysNWiFNmrh78jwOdvQGbBC87UHYZ0uQkmLKyFcsQm+Fzm
         sr63a9j+n76hyBhycK6pDcn1Gp/o+GG2qRkW7cGiqugIluEmKcTD5ZdHJ6TiU+xO1LM6
         DPfyM5mDIynoA/CfQ8Q3l6m0O2GgD9CUtn9JaA9nkatL/pD4VxOh14I/nDGXqys7ZakJ
         2yLg==
X-Forwarded-Encrypted: i=1; AJvYcCUC62jFXDwEO427ZJ3cDLWZh+aD9gmBDrfi7++KW9JTCZc+sEqKGYPCBD+D9dQt98fX8CKfkT8wy0nh@vger.kernel.org, AJvYcCVHt6dlOWrTf/EiOqHqJk+nGNQjTp93CiYqvdgygqWJoyMiIGS4MV3iVLcLHzLA1pYwVGkhuG4ar8qb8Ir3lIx2TLg=@vger.kernel.org, AJvYcCVRS7sR+blIoEYi2WhNhvTuRvlMAUazZXIbMDhL4cPMuIfpazcmSfIIubYwfJ2nMeBY3tjYfeu2jQSW++8x@vger.kernel.org, AJvYcCXQOXcuNejt22yXSs/122wiFZFTQHqSekZk/VkrDy26TjaoC+R1IEX07Te3FkFUhDXAXPaZpf3cJ6wv@vger.kernel.org, AJvYcCXuAO9bs45eWprnTU1rSYOjSGB+Dn28lVeDbHTsSCW79jEmbGjXq3D90fXiJmjh9lypDtX7Mye76y7v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0wfOL7oW09OkO3O+3k6Rr8oSkZ6GK8JmvVeznAFDg+YigRhKJ
	jhf6f4TYHyPJnXZgkyhCdXTbarF05nVkvqBRXGxjbBxqWT6LCZKQi7RThvyL
X-Google-Smtp-Source: AGHT+IGZd5/u1HXwT3unSGA8s1xPCdRRiXT1hDISOsnllf0+AaCkCcd1WF0FFA4ZiZupNSfroB3TFQ==
X-Received: by 2002:a05:690c:7445:b0:6e2:4c7b:e379 with SMTP id 00721157ae682-6ea523d1ae7mr133923337b3.19.1730635371977;
        Sun, 03 Nov 2024 04:02:51 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm14083157b3.103.2024.11.03.04.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 04:02:50 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so2942175276.3;
        Sun, 03 Nov 2024 04:02:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgJq46aoh1RID9RO5WqW01mBdwvdtMjn2+QBhaInA/KkoGqpEFkQob79FWVYgOZ0LhkY3rqrcVak6B@vger.kernel.org, AJvYcCW8abytacKPTJNy7g11RGecAAj4UxbLLecpoWuf2J1HNolGlDvzkrquAi+eZUkWH8E6BjxexoZpFRnS6XrArePaR8A=@vger.kernel.org, AJvYcCW9SqFV21fQWjniDykd3jbAyPQX6ERjTlCeK9A0PNfdWA7NEEcYblsxKrMN58vCY3KWudUv4SNZrI5S@vger.kernel.org, AJvYcCWL7P0SSS5Ssl07wFlWnDAAR8brORPWLwis3g1F6w1cFf9+8rsLsOp1bHZL+N6r0A89xwr2JAJXJcbb@vger.kernel.org, AJvYcCWNJkLx7HDOYGKPd/T2T4xhPey1XwWtSJVsi81CA/30QjsgkW8N3rNiWOUS3t+mqvvRwHwLFtYzHHTjfEVx@vger.kernel.org
X-Received: by 2002:a05:690c:600c:b0:6e3:21fa:e50f with SMTP id
 00721157ae682-6ea523742dcmr121048567b3.13.1730635369662; Sun, 03 Nov 2024
 04:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Nov 2024 13:02:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ7XSvE4AS67-Xwo9sRayyoFxkjFeffSA0y6242g6thw@mail.gmail.com>
Message-ID: <CAMuHMdWJ7XSvE4AS67-Xwo9sRayyoFxkjFeffSA0y6242g6thw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Add RTC support for the Renesas RZ/G3S SoC
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

Hi Claudiu,

On Fri, Nov 1, 2024 at 10:57=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
> IP. A 32 KHz crystall oscillator could be connected to the VBATTB
> input pins. The logic to control this clock (and pass it to RTC)
> is inside the VBATTB IP. For this, the clk-vbattb driver was added
> (patches 01-03/09).
>
> Patches:
> - 01-03/09: add VBATTB support that provides the RTC clock
> -    04/09: fixes compilation error for RTCA3 when building for RISC-V
> - 05-08/09: update the device trees with proper nodes to enable RTC
> -    09/09: enable proper config flags for RTC to work on RZ/G3S SoC
>
> Merge strategy, if any:
> - clock patches (01-03/09) need to go though the same tree because of
>   patch 03/09 using the devm_clk_hw_register_gate_parent_hw() introduced
>   in patch 02/09
> - RTC patch can go though RTC tree
> - DTS and defconfig patches can go though Renesas tree

Thank you! I have queued 01-03 and 05-09 in renesas-clk resp. renesas-devel=
.

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


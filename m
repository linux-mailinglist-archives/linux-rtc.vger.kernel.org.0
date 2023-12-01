Return-Path: <linux-rtc+bounces-383-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C19800B7A
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 14:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCF452815B8
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 13:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78D525754;
	Fri,  1 Dec 2023 13:11:37 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06471B3;
	Fri,  1 Dec 2023 05:11:34 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db547d3631fso512531276.1;
        Fri, 01 Dec 2023 05:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436294; x=1702041094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHsVxos7OlkDogcgLyWTArXFwEO5M/AIOsvOJ3rKQgE=;
        b=GULB916P4Ez0o5ZRf+71Qizq1DC/hRUAvTBcpLxEBJQbZZbU+gjT6x1ietTVOztqHZ
         dhpNC7CSCYm61r1+006LdiZZDlz5Y/LUdBxiF6iQCRKuqgfpn5LV0RM//yn+KFsfEkNB
         1Meh2Lp8FYuko+3y89ghIsIqdPO6ml2AJJjhcupxvSYQir8cCx/6lWwnqCSyKSL1t8FC
         14kkDyQ8xGgvCSRlGnN/CW8rNNWPsAijn2/w5JrNHNAwbSdnzeUgys655IS1MPx3okxe
         mbG5xlgv1DMhJUy7iLpqNJA+QNgDgOmFaK4r4E2043gboGKAtiVXa+lprEV94O0r/IvF
         wmRA==
X-Gm-Message-State: AOJu0YwQu4YQ/eXfayHgKVm9iM2H7ej9TTEVFbMFO+smWGt5qMAf7ndB
	0mxfMgQuaR8Y2mN5KAxNMdGO3WdljpAvZw==
X-Google-Smtp-Source: AGHT+IEOezujr5iF0E1OfPsiT3Ii7ndvXDxKvAUVoYt5TpNAgmHkzdaq344neFW3jGl+gD70ulM0Zg==
X-Received: by 2002:a25:c08f:0:b0:db5:44c9:26c2 with SMTP id c137-20020a25c08f000000b00db544c926c2mr3817231ybf.53.1701436293914;
        Fri, 01 Dec 2023 05:11:33 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id h11-20020a255f4b000000b00db54cf1383esm349040ybm.10.2023.12.01.05.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:11:33 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5c8c26cf056so23946387b3.1;
        Fri, 01 Dec 2023 05:11:33 -0800 (PST)
X-Received: by 2002:a05:690c:f0e:b0:5d4:87d5:ae0c with SMTP id
 dc14-20020a05690c0f0e00b005d487d5ae0cmr1413695ywb.26.1701436293031; Fri, 01
 Dec 2023 05:11:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com> <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 14:11:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoRpHnzLg+FPTpJ49RdwuUJKEVHkaSzifEH2oKoV=6zA@mail.gmail.com>
Message-ID: <CAMuHMdUoRpHnzLg+FPTpJ49RdwuUJKEVHkaSzifEH2oKoV=6zA@mail.gmail.com>
Subject: Re: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, linux-rtc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Dec 1, 2023 at 12:08=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Replace dev_err()->dev_err_probe() to simpilfy probe().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/rtc/rtc-da9063.c
> +++ b/drivers/rtc/rtc-da9063.c
> @@ -488,8 +480,9 @@ static int da9063_rtc_probe(struct platform_device *p=
dev)
>                                                 IRQF_TRIGGER_LOW | IRQF_O=
NESHOT,
>                                                 "ALARM", rtc);
>                 if (ret)
> -                       dev_err(&pdev->dev, "Failed to request ALARM IRQ =
%d: %d\n",
> -                               irq_alarm, ret);
> +                       return dev_err_probe(&pdev->dev, ret,
> +                                            "Failed to request ALARM IRQ=
 %d\n",
> +                                            irq_alarm);

This changes behavior: before, this was not considered fatal.

>
>                 ret =3D dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
>                 if (ret)

The rest LGTM, so with the above fixed/clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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


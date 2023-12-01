Return-Path: <linux-rtc+bounces-381-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CEB800B5C
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 14:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BDBAB20C95
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 13:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830AE25556;
	Fri,  1 Dec 2023 13:00:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DED1B3;
	Fri,  1 Dec 2023 05:00:33 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5d05ff42db0so23810387b3.2;
        Fri, 01 Dec 2023 05:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701435633; x=1702040433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJhEMe1AeqYIN9p2y46F827GG58Kx/8vX8ipCQuZDHc=;
        b=dpSvY4Nja4/9OmJpLLvZFJUiP5UXeSGgDvFECZIJZKmWaAGAa9RLdX+Ay/RoJwbRw0
         YebcPmOTQH3BQnea/JkQH+uh8v5jF6JWmjXnpYsK3daWVeSLOMUqHl0UdiyQj3hIfiMS
         m0lENYzc4zx4jnDGnCoaeR6HAoBChmEOhOWWFmQQNH+R7RekBTQ2K2VcrUDwESdDQzJ1
         i0wgPF5h5OFce2CJxpP7ziee+D9HrEx1T4assxVEo8OMjIPRbIvdgogX1mJ23t/9sG5Q
         6urTtFPGoLCZGAaIzqug6X68Fak+FXy7k74JQBFoqZew7hLChXs3CO2xQDUI8UZabPwY
         Mtxw==
X-Gm-Message-State: AOJu0YztQ/IpYbuCrQAx4otqDL5o71Nwqtbplc2c8/RlBCOGb93cxYj9
	otAYU3bqt5+/VBJmZlB9sj/C4GfzjfB/dA==
X-Google-Smtp-Source: AGHT+IGery/2E128FPKYeXvlqHr7uYVq74lB2MgnOMOYn5kvM5yUZVvRVxstoB8/6F94keXMtoeu+Q==
X-Received: by 2002:a0d:c441:0:b0:5ae:c0f2:cd42 with SMTP id g62-20020a0dc441000000b005aec0f2cd42mr27359179ywd.43.1701435632608;
        Fri, 01 Dec 2023 05:00:32 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id i71-20020a0ddf4a000000b005d3758fda7dsm930329ywe.31.2023.12.01.05.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:00:28 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db5e692d4e0so396173276.2;
        Fri, 01 Dec 2023 05:00:26 -0800 (PST)
X-Received: by 2002:a25:ec0d:0:b0:db5:4677:6e1a with SMTP id
 j13-20020a25ec0d000000b00db546776e1amr3624535ybh.47.1701435618708; Fri, 01
 Dec 2023 05:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com> <20231201110840.37408-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231201110840.37408-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 14:00:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQaUaJdj-mNBZXNGmCAvgD9ne1ULbhzeoS+WVuvJOM0w@mail.gmail.com>
Message-ID: <CAMuHMdUQaUaJdj-mNBZXNGmCAvgD9ne1ULbhzeoS+WVuvJOM0w@mail.gmail.com>
Subject: Re: [PATCH 1/6] rtc: da9063: Make IRQ as optional
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
> On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no IRQ
> populated by default. Add irq optional support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/rtc/rtc-da9063.c
> +++ b/drivers/rtc/rtc-da9063.c
> @@ -485,25 +485,26 @@ static int da9063_rtc_probe(struct platform_device =
*pdev)
>                 clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->fea=
tures);
>         }
>
> -       irq_alarm =3D platform_get_irq_byname(pdev, "ALARM");
> -       if (irq_alarm < 0)
> -               return irq_alarm;
> -
> -       ret =3D devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
> -                                       da9063_alarm_event,
> -                                       IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -                                       "ALARM", rtc);
> -       if (ret)
> -               dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n=
",
> -                       irq_alarm, ret);
> -
> -       ret =3D dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
> -       if (ret)
> -               dev_warn(&pdev->dev,
> -                        "Failed to set IRQ %d as a wake IRQ: %d\n",
> -                        irq_alarm, ret);
> -
> -       device_init_wakeup(&pdev->dev, true);
> +       irq_alarm =3D platform_get_irq_byname_optional(pdev, "ALARM");
> +       if (irq_alarm >=3D 0) {
> +               ret =3D devm_request_threaded_irq(&pdev->dev, irq_alarm, =
NULL,
> +                                               da9063_alarm_event,
> +                                               IRQF_TRIGGER_LOW | IRQF_O=
NESHOT,
> +                                               "ALARM", rtc);
> +               if (ret)
> +                       dev_err(&pdev->dev, "Failed to request ALARM IRQ =
%d: %d\n",
> +                               irq_alarm, ret);
> +
> +               ret =3D dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
> +               if (ret)
> +                       dev_warn(&pdev->dev,
> +                                "Failed to set IRQ %d as a wake IRQ: %d\=
n",
> +                                irq_alarm, ret);
> +
> +               device_init_wakeup(&pdev->dev, true);
> +       } else {
> +               clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->fea=
tures);

This does not handle and propagate real errors (e.g. -EPROBE_DEFER).

    } else if (irq_alarm !=3D -ENXIO) {
            return irq_alarm;
    } else {
            ....
    }

(I think -ENXIO is the correct error to check for,
 platform_get_irq_byname_optional() really should start returning
 zero for not found)

> +       }
>
>         return devm_rtc_register_device(rtc->rtc_dev);

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


Return-Path: <linux-rtc+bounces-382-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F3800B69
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 14:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C339F2814FB
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 13:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B4325563;
	Fri,  1 Dec 2023 13:07:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEF810D;
	Fri,  1 Dec 2023 05:07:11 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5d2c6c1ab66so22668447b3.1;
        Fri, 01 Dec 2023 05:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436030; x=1702040830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpVz8YXZE71zJJsLr07MioEs5YGxTcZ6hJtrYYDHyIM=;
        b=aXB6Ejl73ogXn1r2FGcZIE8UiCJ2qooPw3dygSYiPQZglxWeW48zm8zUZbRCl1Cjd2
         EU2wOxjAm55g/TtEkc7DEeTcrR8jimuayF9ryIZIMQjVvINQgCgb3kawlxikr4HteyR8
         gW+2mIFDFO2VTDJPZqll1SCarRrJ+YqY4sNTaWC+VGw+uhIcE6g1YWY650URhcLCK6xa
         HA2eR1lr+bu2/MLGrANli21/K52W3Q2suTOtnQJ0bJwVwjBKuwmg+kiCyCY54FPodJfy
         sEpj5vu6pEEzU6jfrau8+ij4aAhZhPTrnrN7KUP1tuHBV+s3FbHuBjIaDrlccFHphlGi
         3ksA==
X-Gm-Message-State: AOJu0YyL7wsDVOZxhzHTzOMgYOKHXZZtKqQ/4aaxYS8W+ZrYOIJgzVIX
	toyFlvvAtpk1t2tFyaQ2Q6C4MVeMzCaIhg==
X-Google-Smtp-Source: AGHT+IFQkn5GDkUmOEvqelgVnPyozx2g0sAeHzTspTAQrKlMRxP5IB3stru2m6p8gJe6dIpxb9pKIQ==
X-Received: by 2002:a81:4e86:0:b0:5d3:ba75:758d with SMTP id c128-20020a814e86000000b005d3ba75758dmr3980240ywb.2.1701436029989;
        Fri, 01 Dec 2023 05:07:09 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id o139-20020a0dcc91000000b005d37b4b7cb6sm906320ywd.77.2023.12.01.05.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:07:08 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d3d5b10197so11565727b3.2;
        Fri, 01 Dec 2023 05:07:08 -0800 (PST)
X-Received: by 2002:a0d:e404:0:b0:5ca:d2ec:7ee7 with SMTP id
 n4-20020a0de404000000b005cad2ec7ee7mr25730100ywe.32.1701436028453; Fri, 01
 Dec 2023 05:07:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com> <20231201110840.37408-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231201110840.37408-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 14:06:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXH+txn30MSJ1scVvz9S-q9CZvkgi0=5Xm0sU5+fvqwqQ@mail.gmail.com>
Message-ID: <CAMuHMdXH+txn30MSJ1scVvz9S-q9CZvkgi0=5Xm0sU5+fvqwqQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] rtc: da9063: Use device_get_match_data()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, linux-rtc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 12:08=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Replace of_match_node()->device_get_match_data() for
> the data associated with device match.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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


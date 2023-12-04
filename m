Return-Path: <linux-rtc+bounces-397-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876B8034DF
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Dec 2023 14:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEE691F2123A
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Dec 2023 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7055E25101;
	Mon,  4 Dec 2023 13:27:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E314489;
	Mon,  4 Dec 2023 05:25:40 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5d8a772157fso7461407b3.3;
        Mon, 04 Dec 2023 05:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701696339; x=1702301139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ036GFFDHBlFE81YbGeEaLCeTtejW2ukTzBXjgPmIg=;
        b=Cn4vTuNuwb0CHl9WJItdjxV6pMPu545s202f+m7UkSxbbzmr0Vyb/DkTkDHJCeLOI2
         lzBsvgBBedNHQFGTQ2jaJSvlImkF3bvbzZT7hWR5XfPB6xw85m+5UQnqDKNhSeBGCqyr
         1zI0MfpEvPLgx4MulWNOJXtHzUcwhRhextUTjR0slaPNEYvb+em44Egptg4cz3Xvqdof
         p7LFfLsOFR514d+Nnzt03w+CQ1+aC+56jprbeQi0jVpxjYGqEmylaEKCBHSkwfcnud9/
         QJAuum/MEZ+kyMLmUfB2DUb/OmE+RaqtdvwAxNoesF40TTsPHxYRYBM0slpqUxROSJy0
         U3PA==
X-Gm-Message-State: AOJu0YwCMyy6fDIUmzdlwLuXV/ShqEGijKrXd9zAQjr0fAp1kLg01gSW
	UtlFTjMwGd+DxA3m7ZAl1BjqLhX650eG8w==
X-Google-Smtp-Source: AGHT+IG6n3XyJux7Uj3HuOaHtEBQ8YGlNRDROUaR4niUN1F2tJt2XzLejcQI7vjTUqIgMbFo/nRVbQ==
X-Received: by 2002:a05:690c:dd0:b0:5d7:1941:aa1 with SMTP id db16-20020a05690c0dd000b005d719410aa1mr3075906ywb.60.1701696338939;
        Mon, 04 Dec 2023 05:25:38 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id d3-20020a0df403000000b005b34d8b33ffsm3312941ywf.119.2023.12.04.05.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 05:25:38 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5d3d5b10197so34886847b3.2;
        Mon, 04 Dec 2023 05:25:38 -0800 (PST)
X-Received: by 2002:a81:ae1b:0:b0:5d7:1941:a9c with SMTP id
 m27-20020a81ae1b000000b005d719410a9cmr2666054ywh.55.1701696338400; Mon, 04
 Dec 2023 05:25:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204130504.126787-1-biju.das.jz@bp.renesas.com> <20231204130504.126787-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231204130504.126787-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Dec 2023 14:25:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFnMgL2Ldo3Giv6_s4=mNOWqRCZOQHZJJA9c=GKBpCKw@mail.gmail.com>
Message-ID: <CAMuHMdVFnMgL2Ldo3Giv6_s4=mNOWqRCZOQHZJJA9c=GKBpCKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rtc: da9063: Make IRQ as optional
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, linux-rtc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 2:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no IRQ
> populated by default. Add irq optional support.
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


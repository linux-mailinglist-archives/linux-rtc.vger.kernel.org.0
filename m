Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1B10755CEC
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jul 2023 09:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjGQHby convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 17 Jul 2023 03:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjGQHbx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 Jul 2023 03:31:53 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D75AB2;
        Mon, 17 Jul 2023 00:31:52 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bff27026cb0so4466513276.1;
        Mon, 17 Jul 2023 00:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579111; x=1692171111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCgNayKY0pdumqOxmF5GF6ZIqIlQ+G3WbstYtyqr9L0=;
        b=TwQVSxeE/4ajFZ/nofilCmPNMn5HgEa8NKrknVxdBW29wc8h5wQKbpHf9EtBidhrWc
         tLiN9GlZgyPboHREdZCkh1YP5R0U+GlJRQIei7szpoisN6f/WuMtEiKc8AebnVpZUH7j
         GEAs+lVefI4ynG3YCP5eIGMV+G0ttJuO7OgYxSzxMNyGPnCiOMdRBYpGmJXwc+0XBqmO
         kKKN36PeExZTcteO07N8OD/6BasgsGcx+dbzCcKt7WCD0yDenenopLkazYltspb8BQvS
         6EgFxK2GnZG/Ct74X/qvuBrnoviSsVaAYWyaLgzUiwplRW2rbsE977eWqK5wS+EiVJOk
         TVOg==
X-Gm-Message-State: ABy/qLZ2jMUJlE4n0BXTjaxx9+COWtDiuzJyznSxI5qJGStaPNG1LT0m
        QqmL/CSNSEyjglaZhUw+jkjGoKYyAv+Juw==
X-Google-Smtp-Source: APBJJlGyIdC62Wxg8P5j8wCvFna007a82YazS/MVHkj8wGyNoyS9ShsXfYsn14Mn+SwtvVWWbdN65w==
X-Received: by 2002:a25:4207:0:b0:c61:98e3:fcb9 with SMTP id p7-20020a254207000000b00c6198e3fcb9mr11460112yba.44.1689579110977;
        Mon, 17 Jul 2023 00:31:50 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id h6-20020a25e206000000b00be865f3d4fdsm2763183ybe.62.2023.07.17.00.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:31:50 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bfe6ea01ff5so4463582276.3;
        Mon, 17 Jul 2023 00:31:50 -0700 (PDT)
X-Received: by 2002:a25:9187:0:b0:cc7:c3ab:c4e0 with SMTP id
 w7-20020a259187000000b00cc7c3abc4e0mr5831837ybl.36.1689579110178; Mon, 17 Jul
 2023 00:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230716152858.92696-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230716152858.92696-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jul 2023 09:31:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDz9kEMbtcg_N8Z4DeKiHeAk_eLvRF3_QbdkMYB+-hvA@mail.gmail.com>
Message-ID: <CAMuHMdWDz9kEMbtcg_N8Z4DeKiHeAk_eLvRF3_QbdkMYB+-hvA@mail.gmail.com>
Subject: Re: [PATCH] rtc: pcf85063: Simplify probe()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Biju,

On Sun, Jul 16, 2023 at 5:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The pcf85063_ids[].driver_data could store a pointer to the config,
> like for DT-based matching, making I2C and DT-based matching
> more similar.
>
> After that, we can simplify the probe() by replacing of_device_get_
> match_data() and i2c_match_id() by i2c_get_match_data() as we have
> similar I2C and DT-based matching table.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One suggestion for improvement (which can be a separate patch,
as it would also touch pcf85063_of_match[]) below...

> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -579,17 +577,9 @@ static int pcf85063_probe(struct i2c_client *client)
>         if (!pcf85063)
>                 return -ENOMEM;
>
> -       if (client->dev.of_node) {
> -               config = of_device_get_match_data(&client->dev);
> -               if (!config)
> -                       return -ENODEV;
> -       } else {
> -               enum pcf85063_type type =
> -                       i2c_match_id(pcf85063_ids, client)->driver_data;
> -               if (type >= PCF85063_LAST_ID)

Note that this was the sole user of PCF85063_LAST_ID...

> @@ -655,11 +645,11 @@ static int pcf85063_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id pcf85063_ids[] = {
> -       { "pca85073a", PCF85063A },
> -       { "pcf85063", PCF85063 },
> -       { "pcf85063tp", PCF85063TP },
> -       { "pcf85063a", PCF85063A },
> -       { "rv8263", RV8263 },
> +       { "pca85073a", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063A] },
> +       { "pcf85063", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063] },
> +       { "pcf85063tp", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063TP] },
> +       { "pcf85063a", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063A] },
> +       { "rv8263", .driver_data = (kernel_ulong_t)&pcf85063_cfg[RV8263] },

These lines can be shortened (and enum pcf85063_type can be removed)
by splitting pcf85063_cfg[] in individual variables.

>         {}
>  };
>  MODULE_DEVICE_TABLE(i2c, pcf85063_ids);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

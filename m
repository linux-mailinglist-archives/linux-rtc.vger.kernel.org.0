Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79E5770977F
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 14:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjESMsw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 19 May 2023 08:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjESMsw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 08:48:52 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21ACD106;
        Fri, 19 May 2023 05:48:51 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561deaad117so45254467b3.0;
        Fri, 19 May 2023 05:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684500530; x=1687092530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Np2Q6cwdFlIPshEj7ORawpLR6UZkJ5eAGP9CNEU2NpI=;
        b=fN9vbXH3a76OMlesIGvez8niO8XOVLDy4vNXwufUvkrMDnUxz2EovAqG+6PyzA4Dvc
         PquEYCf+4XvoJDC6NQz454ISghm7c+tRoYp72WjBKlpCQGvIMChtvWgRluafSmhqizra
         TpVoCh52TDcDaxPT2v9SMdqOXORxlv3DUCDyo+QVWuZKWZSQhnUeM+61jQ8j28Xa/TV0
         DpmuxH5dPjpnjCikBxRljLR2UvWElPQhAM+2sQdB1a50Fl899EA1cqYSjBMX3f6+CYa9
         eGycEo/4ph23HurT4FsrrPjbN4r1ed9JWxkbPEauLpcmNiukvGegIDlKJLNCKwlkLxhF
         ekPA==
X-Gm-Message-State: AC+VfDxXy+6YPyVHwVu721hL1PnP2LqdGYbW/IsHMtAu1+ItMEYe88qh
        SOEn/QbjXM1UjuRwUajrMjkdgIcrfjktJA==
X-Google-Smtp-Source: ACHHUZ4n5C9sIE39S1cDpl1TK9mnUgNkys7TA0XVa8DPshJoBO5Z7LDiXaj5pFP/YvB2OBHc/oFQ/Q==
X-Received: by 2002:a0d:d68b:0:b0:55a:12ab:a739 with SMTP id y133-20020a0dd68b000000b0055a12aba739mr1995713ywd.47.1684500528181;
        Fri, 19 May 2023 05:48:48 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id a205-20020a0dd8d6000000b0055a679f1d91sm1143390ywe.32.2023.05.19.05.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 05:48:47 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-561d5a16be0so46734167b3.2;
        Fri, 19 May 2023 05:48:47 -0700 (PDT)
X-Received: by 2002:a0d:df8b:0:b0:55a:8b11:5f6a with SMTP id
 i133-20020a0ddf8b000000b0055a8b115f6amr1507847ywe.19.1684500527006; Fri, 19
 May 2023 05:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com> <20230518113643.420806-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 14:48:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW73f4TYVTNFnXpKZS6azqJnLP06uhh7XnXa=3YG-o+Cg@mail.gmail.com>
Message-ID: <CAMuHMdW73f4TYVTNFnXpKZS6azqJnLP06uhh7XnXa=3YG-o+Cg@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] rtc: isl1208: Add isl1208_set_xtoscb()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Biju,

On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the HW manual, setting of XTOSCB bit as follws

... set the XTOSCB bit as follows:

> If using an external clock signal, set the XTOSCB bit as 1 to
> disable the crystal oscillator.
>
> If using an external crystal, the XTOSCB bit needs to be set at 0
> to enable the crystal oscillator.
>
> Add isl1208_set_xtoscb() to set XTOSCB bit based on the clock-names
> property. Fallback is enabling the internal crystal oscillator.
>
> While at it, introduce a variable "sr" for reading status register

the status register

> in probe() as it is reused for writing.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * New patch.

Thanks for your patch!

> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c

> @@ -837,6 +852,13 @@ isl1208_probe(struct i2c_client *client)
>                 isl1208->config = (struct isl1208_config *)id->driver_data;
>         }
>
> +       xin = devm_clk_get(&client->dev, "xin");
> +       if (IS_ERR(xin)) {
> +               clkin = devm_clk_get(&client->dev, "clkin");
> +               if (!IS_ERR(clkin))
> +                       int_osc_en = false;
> +       }

devm_clk_get_optional()
(doesn't devm_clk_get() print an error message?)

And check for NULL to find out if a clock is present.
IS_ERR() is a real error condition to be propagated.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

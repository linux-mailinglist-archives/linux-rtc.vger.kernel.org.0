Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252C1712136
	for <lists+linux-rtc@lfdr.de>; Fri, 26 May 2023 09:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242516AbjEZHg1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 26 May 2023 03:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242521AbjEZHgU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 May 2023 03:36:20 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732CAB6;
        Fri, 26 May 2023 00:35:38 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ba81deea9c2so431047276.2;
        Fri, 26 May 2023 00:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685086525; x=1687678525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lw0ehb9zzDGJQZHFbsLfDAkiUJYx4u+oRm8HNoVjSw=;
        b=Yq2xDHBC4/mBxzDE6jUtk5dtPUJSZTsh76cX/R7IyX5cubGGR2Ovluzpr73xDeOYKz
         oMfuTnUfmuLUaLuiCJ9NczWZFMwXRPso7+XHm57kKAPDmQd+rNTTQ3TDHDBKeCzSPC44
         ueJaKNQZGtNodtOhsD/dvDcZrgP29Hywz/eURtL+B6k7wOF5CjpfdFUrh849n7O+GK6R
         59X3j6GrpeGNPIBtFENcPCe887iQNyhPcbQdzN2sdmJsYWzD0w65uu4/YmkYNrGhoeq2
         o0b6dxpHcgmn5N7uoExKD5xGFpVMoCSBl2jTEEYIvjiz+AuwAWQrXYfc7KGcBoLTspYe
         9Uig==
X-Gm-Message-State: AC+VfDyTLOpyzZVt9nqgwyWIph/slDiYAz1auRVgQKF5Dte3DgsNJbps
        sR0ijYTEhnzm/WTWvYzOywpxuga9i3hdJA==
X-Google-Smtp-Source: ACHHUZ7Q0yzHi5vlhQd1qeWVSKVxoIwpPc0ps8a2P0zMsH0Z8/BLlYpuisE+KmKcZpIZLgr4IDtgxA==
X-Received: by 2002:a25:1c5:0:b0:bad:fb1:a9f7 with SMTP id 188-20020a2501c5000000b00bad0fb1a9f7mr873596ybb.24.1685086525132;
        Fri, 26 May 2023 00:35:25 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id h6-20020a255306000000b00ba867a46d19sm864923ybb.18.2023.05.26.00.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 00:35:24 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-ba82059ef0bso440949276.1;
        Fri, 26 May 2023 00:35:23 -0700 (PDT)
X-Received: by 2002:a81:dd06:0:b0:561:dd6a:b84 with SMTP id
 e6-20020a81dd06000000b00561dd6a0b84mr1116960ywn.26.1685086523778; Fri, 26 May
 2023 00:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com> <20230522101849.297499-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230522101849.297499-9-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 May 2023 09:35:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSf0wteEcL9+DGCAqsMX95ULf22=oMEJYGrn_PEm=vRg@mail.gmail.com>
Message-ID: <CAMuHMdXSf0wteEcL9+DGCAqsMX95ULf22=oMEJYGrn_PEm=vRg@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] rtc: isl1208: Add support for the built-in RTC
 on the PMIC RAA215300
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

On Mon, May 22, 2023 at 12:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
> However, the external oscillator bit is inverted on PMIC version
> 0x11. The PMIC driver detects PMIC version and instantiates the
> RTC device based on i2c_device_id.
>
> The internal oscillator is enabled or not is determined by the
> parent clock name.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Updated commit description.
>  * Replaced "unsigned long"->"kernel_ulong_t" in isl1208_id[].
>  * -ENOENT means clock not present, so any other errors are propagated.
>  * Dropped bool inverted parameter from isl1208_set_xtoscb() instead
>    using xor to compute the value of xtoscb.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Some suggestions for improvement below...

> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c

> @@ -852,17 +861,37 @@ isl1208_probe(struct i2c_client *client)
>                 isl1208->config = (struct isl1208_config *)id->driver_data;
>         }
>
> -       xin = devm_clk_get_optional(&client->dev, "xin");
> -       if (IS_ERR(xin))
> -               return PTR_ERR(xin);
> +       if (client->dev.parent->type == &i2c_client_type) {

I think this deserves a comment, to explain why you are looking
at the parent.

> +               xin = of_clk_get_by_name(client->dev.parent->of_node, "xin");
> +               if (IS_ERR(xin)) {
> +                       if (PTR_ERR(xin) != -ENOENT)
> +                               return PTR_ERR(xin);
> +
> +                       clkin = of_clk_get_by_name(client->dev.parent->of_node,
> +                                                  "clkin");
> +                       if (IS_ERR(clkin)) {
> +                               if (PTR_ERR(clkin) != -ENOENT)
> +                                       return PTR_ERR(xin);
> +                       } else {
> +                               xtosb_val = 0;
> +                               clk_put(clkin);
> +                       }
> +               } else {
> +                       clk_put(xin);
> +               }
> +       } else {
> +               xin = devm_clk_get_optional(&client->dev, "xin");
> +               if (IS_ERR(xin))
> +                       return PTR_ERR(xin);
>
> -       if (!xin) {
> -               clkin = devm_clk_get_optional(&client->dev, "clkin");
> -               if (IS_ERR(clkin))
> -                       return PTR_ERR(clkin);
> +               if (!xin) {
> +                       clkin = devm_clk_get_optional(&client->dev, "clkin");
> +                       if (IS_ERR(clkin))
> +                               return PTR_ERR(clkin);
>
> -               if (clkin)
> -                       xtosb_val = 0;
> +                       if (clkin)
> +                               xtosb_val = 0;
> +               }

I think it would make the code more readable if you would spin off the
OF vs. dev-based clock handling into a separate helper function.
Then you can just do in the probe function:

    ret = isl1208_clk_present(client, "xin");
    if (ret < 0)
        return ret;
    if (!ret) {
            ret = isl1208_clk_present(client, "clkin");
            if (ret < 0)
                    return ret;
            if (ret)
                    xtosb_val = 0;
    }

>         }
>
>         isl1208->rtc = devm_rtc_allocate_device(&client->dev);
> @@ -882,6 +911,7 @@ isl1208_probe(struct i2c_client *client)
>                 return sr;
>         }
>
> +       xtosb_val ^= isl1208->config->has_inverted_osc_bit ? 1 : 0;

As has_inverted_osc_bit is already either 0 or 1:

    xtosb_val ^= isl1208->config->has_inverted_osc_bit;

If you don't trust XOR, or want to make the operation more clear:

    if (isl1208->config->has_inverted_osc_bit)
            xtosb_val = !xtosb_val;

>         rc = isl1208_set_xtoscb(client, sr, xtosb_val);
>         if (rc)
>                 return rc;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

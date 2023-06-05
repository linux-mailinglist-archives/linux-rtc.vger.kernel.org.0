Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95FCD722503
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Jun 2023 13:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbjFEL5K convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 5 Jun 2023 07:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbjFEL5A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Jun 2023 07:57:00 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7256FF3;
        Mon,  5 Jun 2023 04:56:59 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-565a6837a0bso52358537b3.3;
        Mon, 05 Jun 2023 04:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685966218; x=1688558218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQLQdlqxM0PH5zm7pwCRzdedAeD2Lgmm9kY2PsDWkC4=;
        b=Q9ZlHckXueRpvtXKwr3bRAoXCRnDgN+dCuTdh7vJ/Vxq7LyS3ft97gKFdehFh/Smki
         afBzc/DUurKl8Plz6tnG9UcPxHu0hdfx96SSZDBr76nV2st25IZK8jC8oS3q+h3FQEFG
         Fq9M6z++FSAasK+qSfJphmwQOKr+GNtr90S5BXGN4rbbOhpLii0aHccZhYBBlehGzqBM
         z0UnMPmjOIQBE9itGBWP6TnscRgbxfybUyMX3Dque3Dr0FLs0gIoQdK97a70o219AsRu
         rAgS1hH0P3PITIPAe2hGjwSfaw9d3aaUh9wK3M0fG+QT6rsWvTLcmo+7R7YJUYtznbWi
         IyNA==
X-Gm-Message-State: AC+VfDwF3tkHthFw/54dgWKWi0o2dhkM+raW0lviwsi/4jGKc0ILmMGU
        neNiIFCH85ZODrtFX4BtDzQvEpKeb0Ct7Q==
X-Google-Smtp-Source: ACHHUZ7J7+R4v/0W1rgHCRxTn0UCUTBeJPWnp9qdSsjk4fbaFpWaARKS4Fsidroc7NSpTc0nAZwckg==
X-Received: by 2002:a81:4f83:0:b0:565:b4e9:74a7 with SMTP id d125-20020a814f83000000b00565b4e974a7mr10107406ywb.47.1685966218103;
        Mon, 05 Jun 2023 04:56:58 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id n203-20020a0dcbd4000000b00565eae9cb5asm3256039ywd.130.2023.06.05.04.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 04:56:57 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bacfb7acdb7so5673499276.0;
        Mon, 05 Jun 2023 04:56:57 -0700 (PDT)
X-Received: by 2002:a25:3486:0:b0:b9d:b399:64b2 with SMTP id
 b128-20020a253486000000b00b9db39964b2mr11885582yba.28.1685966217389; Mon, 05
 Jun 2023 04:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com> <20230602142426.438375-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230602142426.438375-12-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Jun 2023 13:56:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=HFjTPRYfSqdnXF1Rpso241KUYMOH12wYatuto50RVg@mail.gmail.com>
Message-ID: <CAMuHMdW=HFjTPRYfSqdnXF1Rpso241KUYMOH12wYatuto50RVg@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] rtc: isl1208: Add support for the built-in RTC
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
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Biju,

On Fri, Jun 2, 2023 at 4:25 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
> However, the external oscillator bit is inverted on PMIC version
> 0x11. The PMIC driver detects PMIC version and instantiates the
> RTC device based on i2c_device_id.
>
> The internal oscillator is enabled or not is determined by the
> parent clock name.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5->v6:
>  * Added Rb tag from Geert.
>  * Parsing of parent node is moved from probe->isl1208_clk_present()
>  * Added comment for parsing parent node for getting clock resource.
>  * Replaced XOR->NOT to make the operation more clear for the inverted case.

Thanks for the update!

> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c

> @@ -822,14 +831,32 @@ isl1208_clk_present(struct i2c_client *client, const char *name)
>         struct clk *clk;
>         int ret;
>
> -       clk = devm_clk_get_optional(&client->dev, name);
> -       if (IS_ERR(clk)) {
> -               ret = PTR_ERR(clk);
> -       } else {
> -               if (!clk)
> -                       ret = 0;
> -               else
> +       /*
> +        * For the built-in RTC found on PMIC RAA21530, enabling of the
> +        * internal oscillator is based on the parent clock. So parse the
> +        * parent node to get the details.
> +        */
> +       if (client->dev.parent->type == &i2c_client_type) {
> +               clk = of_clk_get_by_name(client->dev.parent->of_node, name);
> +               if (IS_ERR(clk)) {
> +                       if (PTR_ERR(clk) != -ENOENT)
> +                               ret = PTR_ERR(clk);
> +                       else
> +                               ret = 0;
> +               } else {
> +                       clk_put(clk);
>                         ret = 1;
> +               }

Perhaps reshuffle the conditions to decrease indentation?
And return early?

    if (!IS_ERR(clk)) {
            clk_put(clk);
            return 1;
    }

    if (PTR_ERR(clk) != -ENOENT)
            return PTR_ERR(clk);

    return 0;


> +       } else {
> +               clk = devm_clk_get_optional(&client->dev, name);
> +               if (IS_ERR(clk)) {
> +                       ret = PTR_ERR(clk);
> +               } else {
> +                       if (!clk)
> +                               ret = 0;
> +                       else
> +                               ret = 1;
> +               }

Same comments as [PATCH v6 10/11].

>         }
>
>         return ret;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

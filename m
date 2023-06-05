Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463797224EF
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Jun 2023 13:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbjFELwp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 5 Jun 2023 07:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbjFELwo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Jun 2023 07:52:44 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAE2D3;
        Mon,  5 Jun 2023 04:52:43 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b15e510630so1181236a34.3;
        Mon, 05 Jun 2023 04:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685965962; x=1688557962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9kN4k3jGKyLqomziUJlF/seUS8vG7yIxPpdXeMA6Rs=;
        b=IL5P94H+KjYf7mH5345Jl2PseGnsBzDKZVDSo3HV4rBNX7C7Ewwgsr/Ta5EyfCgyVl
         Eq3pD95MDFXuMl73PmNegH9nbj/1MI0zmRx8v+jFxEH10w/PXBZKe6ac2NveSl8VJDuS
         hogb+6vruxsJqjPaE5EFHxgUUkDYWTJwLryYVQSo1ZbEQFUrehEa7sa4uqYIQTGInSOt
         awSUHYqnpHtMJLTfZEaFL1npvp+LYS3hfd2GYYW6gptXAydVb3F3sBmbTlHb1zmasnUZ
         iPC2vM8zcMtCRERfeiYi7ZHcVBi+08cqRIJ0eURLldPwshZVla62hQx3j081w2JVaI1a
         5NwQ==
X-Gm-Message-State: AC+VfDyN1GOIrD4J+xnhGYWiGORFXPXOV9Iv/Fiil7NfH46MebRkYXUL
        DWJEHgZBHwCHFMOIBt3XdJU3RspEXj8M1w==
X-Google-Smtp-Source: ACHHUZ71hd2P5bRSbxTTh9TVYJV+ziGr297roGigDm/7970gvzvWG0G1aASalNixpFlsA4mDVck8nA==
X-Received: by 2002:a9d:6294:0:b0:6b0:9fd7:de3a with SMTP id x20-20020a9d6294000000b006b09fd7de3amr6885159otk.0.1685965962675;
        Mon, 05 Jun 2023 04:52:42 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id c84-20020a25c057000000b00b9a80b9e08esm2595171ybf.12.2023.06.05.04.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 04:52:41 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-ba82059ef0bso4847426276.1;
        Mon, 05 Jun 2023 04:52:41 -0700 (PDT)
X-Received: by 2002:a25:d742:0:b0:b9e:6d2c:ce2 with SMTP id
 o63-20020a25d742000000b00b9e6d2c0ce2mr11257804ybg.46.1685965961457; Mon, 05
 Jun 2023 04:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com> <20230602142426.438375-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230602142426.438375-11-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Jun 2023 13:52:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRM978LZYDQsmH4w5GLTYZE03F5+ZAKN5EQscx0AWgSw@mail.gmail.com>
Message-ID: <CAMuHMdXRM978LZYDQsmH4w5GLTYZE03F5+ZAKN5EQscx0AWgSw@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] rtc: isl1208: Add isl1208_set_xtoscb()
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Biju,

On Fri, Jun 2, 2023 at 4:25 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the HW manual, set the XTOSCB bit as follows:
>
> If using an external clock signal, set the XTOSCB bit as 1 to
> disable the crystal oscillator.
>
> If using an external crystal, the XTOSCB bit needs to be set at 0
> to enable the crystal oscillator.
>
> Add isl1208_set_xtoscb() to set XTOSCB bit based on the clock-names
> property. Fallback is enabling the internal crystal oscillator.
>
> While at it, introduce a variable "sr" for reading the status register
> in probe() as it is reused for writing.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5->v6:
>  * Added Rb tag from Geert
>  * Replaced u8->int for xtosb_val parameter.
>  * Introduced isl1208_clk_present() for checking the presence of "xin" and
>    "clkin" for determining internal oscillator is enabled or not.

Thanks for the update!

> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c
> @@ -805,12 +816,33 @@ static int isl1208_setup_irq(struct i2c_client *client, int irq)
>         return rc;
>  }
>
> +static int
> +isl1208_clk_present(struct i2c_client *client, const char *name)
> +{
> +       struct clk *clk;
> +       int ret;
> +
> +       clk = devm_clk_get_optional(&client->dev, name);
> +       if (IS_ERR(clk)) {
> +               ret = PTR_ERR(clk);
> +       } else {
> +               if (!clk)

What about "else if"? ;-)
But in this case, you can make the code even simpler (less indented)
by returning early after each test.

> +                       ret = 0;
> +               else
> +                       ret = 1;
> +       }

if (IS_ERR(clk))
        return PTR_ERR(clk);

return !!clk;

> +
> +       return ret;
> +}
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

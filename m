Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542CD70979D
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 14:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbjESMye convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 19 May 2023 08:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjESMyd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 08:54:33 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839BF106;
        Fri, 19 May 2023 05:54:32 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ba8cf3cb34fso1227508276.1;
        Fri, 19 May 2023 05:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684500871; x=1687092871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmJ+cBnObchQE46qIKaN4HsO5ILX8r+HzJyhWcq/1bg=;
        b=jwjWDZxQPyZ7EGOo1n+8FwyaVkvPHlR87gpVJzg+l5ER9wNKNPDTnF4EnTkt/OJA9g
         yGJJbGKaJe2OCUmQqfYKGIBBDBQ1hXBHA7zLqSXdK/1tbMltDtY7naynYM909Jp405YE
         zV0ZgkskQcvBVP89GIJQs+6sIOW+JwalRLtNp+R+D1irLghrB25grUlebFW5oTzymzW0
         LUPzPvLpBVw75TZSEjH9D7nsdJ7CAwRHCJMnMOj7kJCE3bzJqsQyJe2+loCct4KwzjzU
         0wAip5t7LYktHcOcLBouNLCPbeexK9EGDW1RbGeIPcYZtT07pJrSMwrX2+5j6cxdzTmS
         5lSg==
X-Gm-Message-State: AC+VfDz8aqXTQe7c7t7I4gyky7VJykgqthMs8Sg8Hi+NNVqzeMIZ7hdh
        FYAIgt/VUs2e7Vh3fVx8E5wWdU2cgCE/Kw==
X-Google-Smtp-Source: ACHHUZ4x3nSPoG4rLOWDTni/AbvtyuKOSMKwLnXZSGiK8jHF9Fnr24tex24ljc+sOEgvdaVhzrH15Q==
X-Received: by 2002:a25:acc5:0:b0:ba8:24c4:ec02 with SMTP id x5-20020a25acc5000000b00ba824c4ec02mr1846260ybd.25.1684500871351;
        Fri, 19 May 2023 05:54:31 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id f126-20020a256a84000000b00ba7fd64e113sm1023350ybc.36.2023.05.19.05.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 05:54:30 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-56190515833so12444587b3.0;
        Fri, 19 May 2023 05:54:30 -0700 (PDT)
X-Received: by 2002:a81:984e:0:b0:55d:ebd7:2944 with SMTP id
 p75-20020a81984e000000b0055debd72944mr1800330ywg.2.1684500870121; Fri, 19 May
 2023 05:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com> <20230518113643.420806-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-9-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 14:54:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNJbiao8Xsk5dQXMH9qtnZyRPaYOSEttwmmkuHqYV6=A@mail.gmail.com>
Message-ID: <CAMuHMdVNJbiao8Xsk5dQXMH9qtnZyRPaYOSEttwmmkuHqYV6=A@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] rtc: isl1208: Add support for the built-in RTC
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

On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
> However, the external oscillator bit is inverted on PMIC version
> 0x11. The PMIC driver detects PMIC version and instantiate appropriate

instantiates the

> RTC device based on i2c_device_id.
>
> Enhance isl1208_set_xtoscb() to handle inverted bit and internal oscillator
> is enabled or not is determined by the parent clock name.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Added support for internal oscillator enable/disable.

Thanks for the update!

> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c

> @@ -852,11 +865,25 @@ isl1208_probe(struct i2c_client *client)
>                 isl1208->config = (struct isl1208_config *)id->driver_data;
>         }
>
> -       xin = devm_clk_get(&client->dev, "xin");
> -       if (IS_ERR(xin)) {
> -               clkin = devm_clk_get(&client->dev, "clkin");
> -               if (!IS_ERR(clkin))
> +       if (client->dev.parent->type == &i2c_client_type) {
> +               xin = of_clk_get_by_name(client->dev.parent->of_node, "xin");
> +               if (IS_ERR(xin)) {

-ENOENT means clock not present, so continue below.
Any other error codes are to be propagated upstream.

> +                       clkin = of_clk_get_by_name(client->dev.parent->of_node, "clkin");
> +                       if (IS_ERR(clkin))

Likewise.

> +                               return -ENODEV;

Clock not present is not an error, as the clock is optional for DT
backwards compatibility.

> +
>                         int_osc_en = false;
> +                       clk_put(clkin);
> +               } else {
> +                       clk_put(xin);
> +               }
> +       } else {
> +               xin = devm_clk_get(&client->dev, "xin");
> +               if (IS_ERR(xin)) {
> +                       clkin = devm_clk_get(&client->dev, "clkin");
> +                       if (!IS_ERR(clkin))
> +                               int_osc_en = false;
> +               }
>         }
>
>         isl1208->rtc = devm_rtc_allocate_device(&client->dev);
> @@ -876,7 +903,8 @@ isl1208_probe(struct i2c_client *client)
>                 return sr;
>         }
>
> -       rc = isl1208_set_xtoscb(client, sr, int_osc_en);
> +       rc = isl1208_set_xtoscb(client, sr, int_osc_en,
> +                               isl1208->config->has_inverted_osc_bit);

No need to change isl1208_set_xtoscb() (but perhaps rename
the int_osc_en parameter?) if you would pass
"int_osc_en ^ isl1208->config->has_inverted_osc_bit".
(beware: C has no logical ^^, only bitwise ^).


>         if (rc)
>                 return rc;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

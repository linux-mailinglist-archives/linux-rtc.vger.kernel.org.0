Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196B85171DE
	for <lists+linux-rtc@lfdr.de>; Mon,  2 May 2022 16:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385598AbiEBOtm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 May 2022 10:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385654AbiEBOtI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 May 2022 10:49:08 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47270A193;
        Mon,  2 May 2022 07:45:37 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id kl21so1867787qvb.9;
        Mon, 02 May 2022 07:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D0SY7wmYyA7yL5OraG4CcPIBeXo9vTXrM08vsIyhv4o=;
        b=s0lxLYEc3XfTmvX4JKKk8eOoDoz7LMLC8GarkiNCF6R1wT7LewGQ/ZwE/cESKkIK+O
         rYv8RsKYvRmavYvJ3xiRflf8Y8Tu3kN93micow9p+0WWOjOn52BpZHg5tS+gf1HrOdv+
         TTEifvcx2c5Z/MxFPIh+3yMOheL/3wFPjhiG3uA3EMF7e8OWu//59MvcxSC60tuHwM7k
         7sfVkDcEE0/GluMKO0pYeRsIp5FABvbAFosJJCzd7pyg1Y1XdXlCvS28nL86AY+OlSYV
         9KtnsfqeeFtQ3BZeqZ8oTevyNVBP0udhtP0auOfiAnTo/WQaN9opwhi9QZBUIEmXHn5s
         Yz5Q==
X-Gm-Message-State: AOAM530X2MxeW9DviFjr/CVtEj47EabCVBOmXzhcO5619LD/glNUSiVR
        PSQGP8S+Cskdz2ZOy7xcdJxbMKWWEuLCHg==
X-Google-Smtp-Source: ABdhPJwiVbuKhdLBqobPuhbBubqqQA0cBtzc5/OPdVwqJr64gYP/66k/GXoyvdc/z3ppLH3RPAUtIg==
X-Received: by 2002:a05:6214:c2d:b0:456:3af7:5ce1 with SMTP id a13-20020a0562140c2d00b004563af75ce1mr9970124qvd.25.1651502736263;
        Mon, 02 May 2022 07:45:36 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id b197-20020a3767ce000000b0069fc13ce1e9sm4549598qkc.26.2022.05.02.07.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 07:45:36 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2ebf4b91212so150222217b3.8;
        Mon, 02 May 2022 07:45:35 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr11313594ywg.316.1651502735635; Mon, 02
 May 2022 07:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220429104602.368055-1-miquel.raynal@bootlin.com> <20220429104602.368055-4-miquel.raynal@bootlin.com>
In-Reply-To: <20220429104602.368055-4-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 16:45:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV8kqfRJFwJt34wi-FGkVTJ4uYb4RwBcRcYcs7XhcNuGA@mail.gmail.com>
Message-ID: <CAMuHMdV8kqfRJFwJt34wi-FGkVTJ4uYb4RwBcRcYcs7XhcNuGA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] rtc: rzn1: Add alarm support
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Miquel,

On Fri, Apr 29, 2022 at 12:46 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> The RZN1 RTC can trigger an interrupt when reaching a particular date up
> to 7 days ahead. Bring support for this alarm.
>
> One drawback though, the granularity is about a minute.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -179,6 +272,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>         if (IS_ERR(rtc->base))
>                 return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
>
> +       alarm_irq = platform_get_irq(pdev, 0);
> +       if (alarm_irq < 0)
> +               return dev_err_probe(&pdev->dev, alarm_irq, "Missing timer IRQ\n");

No need to print a message, platform_get_irq() already does that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

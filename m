Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6C070A00B
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 21:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjESTnX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 19 May 2023 15:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjESTnW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 15:43:22 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EFE186;
        Fri, 19 May 2023 12:43:20 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ba8a0500f4aso2009313276.3;
        Fri, 19 May 2023 12:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684525399; x=1687117399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9et77NNtLM13BT6ergjBq42lTZvxFJR1mV3vZHucDTI=;
        b=iOWvwLQixyzDZoJweS9QaBGyF5NmuIsDzwiGChOqj1m9PUI1gRgumz9ELvtsq8NENM
         +z/MdJZCsZeqsIy6LAkbppI+U8gBUFThk307rHRuOvCqvAZWPEc+Ge7HwSFFsWUAZcWg
         RVXtH4yOlZyd+ZlkRUfb8ljWu1joh4Vj0PvsokbW8uYhPtMU8Bv/OYf5L0BiUZTjAMOd
         ZpiTc6XrQasnAjdAP34WBFFithTEW1xm64iKOUtgAhrblVAON/k0QqsARJFDy6iH6+xF
         08vfEmnQQqV10uAviHcNJMAM66H+wW/Hq8VM4Gh4VFfdYq9PF/IlAREpxAqlZ3l/zT3n
         LUaA==
X-Gm-Message-State: AC+VfDyCND6ET5XxlauYgdCtWj8QEML3vLUF4XDNLEw397jdBll/gk9E
        8jm0FXysiwMCHAiPuhLKbZjfGV60Pw/MGA==
X-Google-Smtp-Source: ACHHUZ6u+y88Qs0PWs6rIDNSGVSi1C9i63PhJ04ClOmqDbDKuACPFI4vvP2eo0lBgRa2c8bCLK4QKw==
X-Received: by 2002:a81:5289:0:b0:561:e7bb:1b24 with SMTP id g131-20020a815289000000b00561e7bb1b24mr3397500ywb.6.1684525399479;
        Fri, 19 May 2023 12:43:19 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id u11-20020a25840b000000b00ba02bbed468sm1225664ybk.28.2023.05.19.12.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 12:43:18 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-561e5014336so29382157b3.1;
        Fri, 19 May 2023 12:43:18 -0700 (PDT)
X-Received: by 2002:a81:4e8f:0:b0:549:2623:6f65 with SMTP id
 c137-20020a814e8f000000b0054926236f65mr3222885ywb.33.1684525398750; Fri, 19
 May 2023 12:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-6-biju.das.jz@bp.renesas.com> <CAMuHMdXaJtZVxp5faw=vovsdukdwiXH8RbaJfiKAoOKTLWrZzA@mail.gmail.com>
 <OS0PR01MB5922AFB243478AA9FA2B0CBC867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922AFB243478AA9FA2B0CBC867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 21:43:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnvceN5+9D+7HK5h4Guxtu12HwkUUy8rns_RW-pGhvYw@mail.gmail.com>
Message-ID: <CAMuHMdWnvceN5+9D+7HK5h4Guxtu12HwkUUy8rns_RW-pGhvYw@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] rtc: isl1208: Make similar I2C and DT-based
 matching table
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

Hi Biju.

On Fri, May 19, 2023 at 6:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Friday, May 19, 2023 1:39 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; linux-rtc@vger.kernel.org; Fabrizio
> > Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-
> > soc@vger.kernel.org
> > Subject: Re: [PATCH v4 05/11] rtc: isl1208: Make similar I2C and DT-
> > based matching table
> >
> > On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > The isl1208_id[].driver_data could store a pointer to the config, like
> > > for DT-based matching, making I2C and DT-based matching more similar.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v4:
> > >  * New patch.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > @@ -822,9 +822,9 @@ isl1208_probe(struct i2c_client *client)
> > >         } else {
> > >                 const struct i2c_device_id *id =
> > > i2c_match_id(isl1208_id, client);
> > >
> > > -               if (id->driver_data >= ISL_LAST_ID)
> > > +               if (!id)
> > >                         return -ENODEV;
> > > -               isl1208->config = &isl1208_configs[id->driver_data];
> > > +               isl1208->config = (struct isl1208_config
> > > + *)id->driver_data;
> >
> > It's a pity there's no i2c_get_match_data() yet...
>
> You mean, introduce [1] and optimize ??
>
>         if (client->dev.of_node)
>                 isl1208->config = of_device_get_match_data(&client->dev);
>         else
>                 isl1208->config = i2c_get_match_data(isl1208_id, client);
>
>         if (!isl1208->config)
>                 return -ENODEV;

Exactly.  Might be better to do that later, to avoid stalling this series.

>
> [1]
> const void * i2c_get_match_data(const struct i2c_device_id *id, const struct i2c_client *client)
> {
>         if (!(id && client))
>                 return NULL;
>
>         while (id->name[0]) {
>                 if (strcmp(client->name, id->name) == 0)
>                         return id->driver_data;
>                 id++;
>         }
>         return NULL;

Please reuse the existing i2c_match_id(), just like of_device_get_match_data()
reuses of_match_device().

> }
> EXPORT_SYMBOL(i2c_get_match_data);
>
> Cheers,
> Biju



-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

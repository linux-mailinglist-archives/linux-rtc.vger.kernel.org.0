Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48EB4704DA2
	for <lists+linux-rtc@lfdr.de>; Tue, 16 May 2023 14:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbjEPMUB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Tue, 16 May 2023 08:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjEPMUA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 May 2023 08:20:00 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA67A469D;
        Tue, 16 May 2023 05:19:57 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ba8151a744fso1312318276.2;
        Tue, 16 May 2023 05:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684239595; x=1686831595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+wO58J+9WLolvkX08i5fr0SVn1qXB65EOP/U8xLIMQ=;
        b=i0Gr0e75t17/WKjWm0ytXOiTue7myQHfz41v0wzmi/kDqiYXjpb8xswKkWNEqfbKJ9
         08wFeUnPGmwjr4MMY8ixVPTHb/n3jedyki/sfOW3yiCt9A3ywAaUO+DL3ZZlZNDwtOZN
         DOx9RitfNe6AgZazrCswhkwD5TV0dkOJOgerj4CEdHMkzOk2ZEOoewNo9oX8YMDh3BcQ
         HJIdiRW7b6neRCEWOLaSHNr2EIpZVTzlRz+XJu9PnIScfKCwq/9JBTNcYPhYME3wZMQT
         dF9wXgV3nFzz+kYasdB8IFV3NUPyQwCVa5Iwhz/hftiVqOUZgyEPMaKGFp9JKocidJCH
         E/eg==
X-Gm-Message-State: AC+VfDyZ0BEWte/sILyRti5BG+jW57qOI1MPe4pS+2UNNPG/Denxe8QP
        9qrr9kQ1SzGTNHRTQKk6Kfl8D3pCroSQFA==
X-Google-Smtp-Source: ACHHUZ7k2AxkImaVSqi1V5gmrWOmqezLEHCoRnZmuFQrE7L+p1JBo7fipX3atdaaE3L963zxqpag/A==
X-Received: by 2002:a25:2f16:0:b0:ba8:1912:ea7b with SMTP id v22-20020a252f16000000b00ba81912ea7bmr1582267ybv.65.1684239594979;
        Tue, 16 May 2023 05:19:54 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id g17-20020a05690203d100b00b9a82c1b070sm435710ybs.27.2023.05.16.05.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 05:19:54 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ba81f71dfefso965684276.0;
        Tue, 16 May 2023 05:19:54 -0700 (PDT)
X-Received: by 2002:a81:920c:0:b0:55a:a635:7e1e with SMTP id
 j12-20020a81920c000000b0055aa6357e1emr37830122ywg.31.1684239592684; Tue, 16
 May 2023 05:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-3-biju.das.jz@bp.renesas.com> <CAMuHMdWWsNdewjug8JEpbwy1jFQqVEoioBctvQEHzjiLQzx7uQ@mail.gmail.com>
 <OS0PR01MB592259C10181D3A9B590CA8186799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWv45YhBtAX-4sAvgp2wkwPP7Q95Cs-tZFWDLQKMcJo=w@mail.gmail.com> <OS0PR01MB5922F63772A1E8F7364E59E586799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F63772A1E8F7364E59E586799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 May 2023 14:19:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDc7qoC_iz6m1s7_2GoZAFb-j4n3iKdqHNp5gYud2bdA@mail.gmail.com>
Message-ID: <CAMuHMdWDc7qoC_iz6m1s7_2GoZAFb-j4n3iKdqHNp5gYud2bdA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] rtc: isl1208: Add support for the built-in RTC on
 the PMIC RAA215300
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

On Tue, May 16, 2023 at 12:22 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Tuesday, May 16, 2023 9:58 AM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; Magnus Damm <magnus.damm@gmail.com>;
> > Lee Jones <lee@kernel.org>; linux-rtc@vger.kernel.org; linux-renesas-
> > soc@vger.kernel.org; Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Subject: Re: [PATCH v3 2/5] rtc: isl1208: Add support for the built-in
> > RTC on the PMIC RAA215300
> >
> > On Tue, May 16, 2023 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH v3 2/5] rtc: isl1208: Add support for the
> > > > built-in RTC on the PMIC RAA215300 On Sat, May 13, 2023 at 6:52 PM
> > > > Biju Das <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
> > > > > However, the external oscillator bit is inverted on PMIC version
> > 0x11.
> > > > > The PMIC driver detects PMIC version and instantiate appropriate
> > > > > RTC device based on i2c_device_id.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > > v2->v3:
> > > > >  * RTC device is instantiated by PMIC driver and dropped
> > > > isl1208_probe_helper().
> > > > >  * Added "TYPE_RAA215300_RTC_A0" to handle inverted oscillator bit
> > > > case.
> > > > > RFC->v2:
> > > > >  * Dropped compatible "renesas,raa215300-isl1208" and
> > > > "renesas,raa215300-pmic" property.
> > > > >  * Updated the comment polarity->bit for External Oscillator.
> > > > >  * Added raa215300_rtc_probe_helper() for registering
> > > > > raa215300_rtc
> > > > device and
> > > > >    added the helper function isl1208_probe_helper() to share the
> > code.
> > > >
> > > > Thanks for the update!
> > > >
> > > > > --- a/drivers/rtc/rtc-isl1208.c
> > > > > +++ b/drivers/rtc/rtc-isl1208.c
> > > > > @@ -74,6 +74,7 @@ enum isl1208_id {
> > > > >         TYPE_ISL1209,
> > > > >         TYPE_ISL1218,
> > > > >         TYPE_ISL1219,
> > > > > +       TYPE_RAA215300_RTC_A0,
> > > > >         ISL_LAST_ID
> > > > >  };
> > > > >
> > > > > @@ -83,11 +84,13 @@ static const struct isl1208_config {
> > > > >         unsigned int    nvmem_length;
> > > > >         unsigned        has_tamper:1;
> > > > >         unsigned        has_timestamp:1;
> > > > > +       unsigned        has_inverted_osc_bit:1;
> > > > >  } isl1208_configs[] = {
> > > > >         [TYPE_ISL1208] = { "isl1208", 2, false, false },
> > > > >         [TYPE_ISL1209] = { "isl1209", 2, true,  false },
> > > > >         [TYPE_ISL1218] = { "isl1218", 8, false, false },
> > > > >         [TYPE_ISL1219] = { "isl1219", 2, true,  true },
> > > > > +       [TYPE_RAA215300_RTC_A0] = { "rtc_a0", 2, false, false,
> > > > > + true },
> > > > >  };
> > > > >
> > > > >  static const struct i2c_device_id isl1208_id[] = { @@ -95,6 +98,7
> > > > > @@ static const struct i2c_device_id isl1208_id[] = {
> > > > >         { "isl1209", TYPE_ISL1209 },
> > > > >         { "isl1218", TYPE_ISL1218 },
> > > > >         { "isl1219", TYPE_ISL1219 },
> > > > > +       { "rtc_a0", TYPE_RAA215300_RTC_A0 },
> > > >
> > > > "rtc_a0" is IMHO a too-generic name.
> > >
> > > I tried to squeeze with string length "8".
> > >
> > > What about changing it to "raa215300_a0" and changing length to "12"?
> > > as version A0 of RAA215300 pmic chip have this inverted oscillator
> > bit.
> >
> > Ah, because of the size limit of isl1208_config.name[]?
> > Note that that field is only initialized, but further unused, so you can
> > just drop it.
>
> Agreed. It will look like
>
> static const struct isl1208_config {
> -       const char      name[8];
>         unsigned int    nvmem_length;
>         unsigned        has_tamper:1;
>         unsigned        has_timestamp:1;
>         unsigned        has_inverted_osc_bit:1;
>  } isl1208_configs[] = {
> -       [TYPE_ISL1208] = { "isl1208", 2, false, false },
> -       [TYPE_ISL1209] = { "isl1209", 2, true,  false },
> -       [TYPE_ISL1218] = { "isl1218", 8, false, false },
> -       [TYPE_ISL1219] = { "isl1219", 2, true,  true },
> -       [TYPE_RAA215300_RTC_A0] = { "rtc_a0", 2, false, false, true },
> +       [TYPE_ISL1208] = { 2, false, false },
> +       [TYPE_ISL1209] = { 2, true,  false },
> +       [TYPE_ISL1218] = { 8, false, false },
> +       [TYPE_ISL1219] = { 2, true,  true },
> +       [TYPE_RAA215300_RTC_A0] = { 2, false, false, true },
>  };
>
> >
> > BTW, isl1208_id[].driver_data could store a pointer to the config, like
> > for DT-based matching, making I2C and DT-based matching more similar.
>
> OK. But some type casting required
>
> +       { "isl1208", .driver_data = (unsigned long)&isl1208_configs[TYPE_ISL1208] },
> +       { "isl1209", .driver_data = (unsigned long)&isl1208_configs[TYPE_ISL1209] },
> +       { "isl1218", .driver_data = (unsigned long)&isl1208_configs[TYPE_ISL1218] },
> +       { "isl1219", .driver_data = (unsigned long)&isl1208_configs[TYPE_ISL1219] },
> +       { "raa215300_rtc_a0", .driver_data = (unsigned long)&isl1208_configs[TYPE_RAA215300_RTC_A0] },

Now there are no more users left of isl1208_configs[], you can split
the array in individual variables, and make lines shorter by referring
to e.g. &config_isl1219 instead of &isl1208_configs[TYPE_ISL1219].

> > > > >  isl1208_i2c_get_sr(struct i2c_client *client)  { @@ -845,6
> > > > > +859,13 @@ isl1208_probe(struct i2c_client *client)
> > > > >                 return rc;
> > > > >         }
> > > > >
> > > > > +       if (isl1208->config->has_inverted_osc_bit) {
> > > > > +               rc = isl1208_set_external_oscillator(client, rc,
> > > >
> > > > Passing "rc" is confusing, this is really the status register value
> > > > obtained above...
> > >
> > > I am planning to drop this function in next version and will use the
> > below logic instead.
> > > Is it ok?
> > >
> > >          if (isl1208->config->has_inverted_osc_bit) {
> > >                     int sr;
> > >
> > >                  sr = i2c_smbus_write_byte_data(client,
> > ISL1208_REG_SR,
> > >                                               rc |
> > ISL1208_REG_SR_XTOSCB);
> > >                  if (sr)
> > >                          return sr;
> >
> > Isn't this more confusing: "rc" is the Status Register value, and "sr"
> > is the Return Code?
>
> OK will use "ret" instead.

Use "ret" instead of what? ;-)
Just declare "int sr" at the top, and use that to store the Status Register
value, and use rc everywhere else?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

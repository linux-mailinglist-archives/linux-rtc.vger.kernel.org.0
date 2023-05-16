Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0230470477F
	for <lists+linux-rtc@lfdr.de>; Tue, 16 May 2023 10:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjEPIMm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Tue, 16 May 2023 04:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjEPIMk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 May 2023 04:12:40 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE573132;
        Tue, 16 May 2023 01:12:38 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-55a00da4e53so238998107b3.0;
        Tue, 16 May 2023 01:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684224758; x=1686816758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaQpyGlRknbt+nkCU2/5e2d4wtBiN/mPoqaHsvq+WOA=;
        b=lJhMrnc64V0DV0SAfXakVndUH1k6y85u3v8KHVFstTfKIClzWAm1tpXjqhtNUgUdSh
         3NnzwXx1ST+kaEyGF8zY8tEbri/RxxhbSsPi2zdleclfwJ9zUkyOgEOJgqmi82LuWaBl
         4NhB6WrEu1yDD5onVlrSlv2kxOkcawM639U+JWFe5ccOXMtE5US6h7jOsHWeLBSBgDqb
         sNXoPnm8dPI2oLdJoBhUGqm3fsvnyixe2hTolaLjtcbvqeUNJzIX6LhjfZ8aMHIISJJG
         NEvRDzHSxKR9pm0wklIqtmoVovYQdw0g7EU2aXtQ4nqPvz0XcsykkManbGRDY1pWk/tx
         xBrg==
X-Gm-Message-State: AC+VfDw/gelUKAf7AzL2DX1FtTMyoX7E0ceM73fFSpXj1/BNFKjGNsLQ
        bFKy5wsjiYfXkqMPA3ZNNt81EHAbCpjPyw==
X-Google-Smtp-Source: ACHHUZ7O+6EEBeqVwY4USCY3hYlA0FWRkuLNWASjFl6y9crrfpSMmA/FVyp6Hp7/spz87ayi48xwnw==
X-Received: by 2002:a81:8a41:0:b0:55a:12ab:a739 with SMTP id a62-20020a818a41000000b0055a12aba739mr32819875ywg.47.1684224757768;
        Tue, 16 May 2023 01:12:37 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id c190-20020a0df3c7000000b0055a1cd96212sm447152ywf.33.2023.05.16.01.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 01:12:37 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55a00da4e53so238997847b3.0;
        Tue, 16 May 2023 01:12:36 -0700 (PDT)
X-Received: by 2002:a0d:d711:0:b0:561:9d66:e1a with SMTP id
 z17-20020a0dd711000000b005619d660e1amr447398ywd.34.1684224756674; Tue, 16 May
 2023 01:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com> <20230513165227.13117-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230513165227.13117-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 May 2023 10:12:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWsNdewjug8JEpbwy1jFQqVEoioBctvQEHzjiLQzx7uQ@mail.gmail.com>
Message-ID: <CAMuHMdWWsNdewjug8JEpbwy1jFQqVEoioBctvQEHzjiLQzx7uQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] rtc: isl1208: Add support for the built-in RTC on
 the PMIC RAA215300
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee@kernel.org>, linux-rtc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
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

On Sat, May 13, 2023 at 6:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
> However, the external oscillator bit is inverted on PMIC version
> 0x11. The PMIC driver detects PMIC version and instantiate appropriate
> RTC device based on i2c_device_id.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * RTC device is instantiated by PMIC driver and dropped isl1208_probe_helper().
>  * Added "TYPE_RAA215300_RTC_A0" to handle inverted oscillator bit case.
> RFC->v2:
>  * Dropped compatible "renesas,raa215300-isl1208" and "renesas,raa215300-pmic" property.
>  * Updated the comment polarity->bit for External Oscillator.
>  * Added raa215300_rtc_probe_helper() for registering raa215300_rtc device and
>    added the helper function isl1208_probe_helper() to share the code.

Thanks for the update!

> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c
> @@ -74,6 +74,7 @@ enum isl1208_id {
>         TYPE_ISL1209,
>         TYPE_ISL1218,
>         TYPE_ISL1219,
> +       TYPE_RAA215300_RTC_A0,
>         ISL_LAST_ID
>  };
>
> @@ -83,11 +84,13 @@ static const struct isl1208_config {
>         unsigned int    nvmem_length;
>         unsigned        has_tamper:1;
>         unsigned        has_timestamp:1;
> +       unsigned        has_inverted_osc_bit:1;
>  } isl1208_configs[] = {
>         [TYPE_ISL1208] = { "isl1208", 2, false, false },
>         [TYPE_ISL1209] = { "isl1209", 2, true,  false },
>         [TYPE_ISL1218] = { "isl1218", 8, false, false },
>         [TYPE_ISL1219] = { "isl1219", 2, true,  true },
> +       [TYPE_RAA215300_RTC_A0] = { "rtc_a0", 2, false, false, true },
>  };
>
>  static const struct i2c_device_id isl1208_id[] = {
> @@ -95,6 +98,7 @@ static const struct i2c_device_id isl1208_id[] = {
>         { "isl1209", TYPE_ISL1209 },
>         { "isl1218", TYPE_ISL1218 },
>         { "isl1219", TYPE_ISL1219 },
> +       { "rtc_a0", TYPE_RAA215300_RTC_A0 },

"rtc_a0" is IMHO a too-generic name.


>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, isl1208_id);
> @@ -166,6 +170,16 @@ isl1208_i2c_validate_client(struct i2c_client *client)
>         return 0;
>  }
>
> +static int
> +isl1208_set_external_oscillator(struct i2c_client *client, int rc,

s/rc/sr/

> +                               bool is_inverted_oscillator_bit)
> +{
> +       if (is_inverted_oscillator_bit)

This condition is always true, given all callers in your series.

> +               rc |= ISL1208_REG_SR_XTOSCB;

If you do decide to keep it, you probably want to add an else branch
to make sure the bit is cleared.

> +
> +       return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, rc);
> +}
> +
>  static int
>  isl1208_i2c_get_sr(struct i2c_client *client)
>  {
> @@ -845,6 +859,13 @@ isl1208_probe(struct i2c_client *client)
>                 return rc;
>         }
>
> +       if (isl1208->config->has_inverted_osc_bit) {
> +               rc = isl1208_set_external_oscillator(client, rc,

Passing "rc" is confusing, this is really the status register value
obtained above...

> +                                                    isl1208->config->has_inverted_osc_bit);
> +               if (rc)
> +                       return rc;

If we get here, rc is always zero ...

> +       }
> +
>         if (rc & ISL1208_REG_SR_RTCF)

... thus breaking this check..

>                 dev_warn(&client->dev, "rtc power failure detected, "
>                          "please set clock.\n");

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

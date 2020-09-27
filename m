Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A57A279F6A
	for <lists+linux-rtc@lfdr.de>; Sun, 27 Sep 2020 09:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730544AbgI0HvN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 27 Sep 2020 03:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730439AbgI0HvG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 27 Sep 2020 03:51:06 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C97C0613CE;
        Sun, 27 Sep 2020 00:51:06 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p15so4103735ejm.7;
        Sun, 27 Sep 2020 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xiszwSzHIPu42VE8ycq9IrzTJRg5eh3Qelq5ghdg0ls=;
        b=F36JFRR2gw4ZLJ4VQJsJYSQOIEhyhd+ZMKXffeDvfDTakEIRy3DWcaZVJOhPcmAzes
         zl+fh9At5nHsvyvnr+1/xp1hsTpvH9AWkxilc+L+7uTryxgc5mDNl9THb9Y02yR+wy0h
         fEepZ2B7QS370fdsvaPwvPmQ9qJ1sLReeD7uUOqtBmm0ixp7WwuPiCm0SyJ56K/BI6VF
         gyiD8h4zDX0u8mgWQ1iYRvkksiKIDcqejWKWKu5PWse/Xj8YhhCeZCsQxAHT0pl/RSeh
         sInY2x52eF+F5nsyneFvZNAQuJk57IqGjueS6wUZpndYlSwGh3LMSRTnlIRqxpuSkEsy
         HwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xiszwSzHIPu42VE8ycq9IrzTJRg5eh3Qelq5ghdg0ls=;
        b=QbR0JczV6fdCrho3+cH9LWWwhlL2cFUHbiuCul7BObpkinTJG4x09rA/+KrWMJ06PJ
         5TH2Joov65fXmv1wC1VQ07hHnalaId2rIJZAWcoq4Vq5S7S3hyKwvVw4rP6lGbDyKiCU
         NorWM9vO35XNldf1q6eNa8WCFEL2tB2E7mWhZkPTuuD/nh2zHZD+SOe2V7IEjeQfj8Sr
         tE0nTpL5hXoRdDfLarWTHviwSvJk07zqaoChs5utGj5J5cvYv5E2bt2+6UpYF7hjrdc4
         Z/WeY11ZeJ6tcdaHTM1p6HHRlWKhrYSk4BLmpSLtmsVjeE8NKW1RsxCQDMOQsVhlr3Hb
         tUEg==
X-Gm-Message-State: AOAM533/V1eQZuvG4pd8GndOZkEauJxr3su6T0l75XbsYGtwbNatcIvw
        ANiK+NlxnHS2wR3zoW4YgfHPGO0uZY3LIwnrKAM=
X-Google-Smtp-Source: ABdhPJz41zBp2OpzRbMdSMYtk4jLfBUVlcPRmTXMA3XHmsB0S2AVtLhCH0GA3dxF12sVaxehPFbqBjP/5eRI1bbLbUo=
X-Received: by 2002:a17:906:8682:: with SMTP id g2mr10436779ejx.110.1601193064793;
 Sun, 27 Sep 2020 00:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200924074715.GT9675@piout.net> <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
 <20200924105256.18162-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20200924105256.18162-2-u.kleine-koenig@pengutronix.de>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Sun, 27 Sep 2020 09:50:48 +0200
Message-ID: <CAH+2xPBu3k53XdLzzak7HP_4W16DkfE9NHXCsjaULRbNctzOuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: pcf2127: move watchdog initialisation to a
 separate function
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-watchdog@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den tor. 24. sep. 2020 kl. 12.53 skrev Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de>:
>
> The obvious advantages are:
>
>  - The linker can drop the watchdog functions if CONFIG_WATCHDOG is off.
>  - All watchdog stuff grouped together with only a single function call
>    left in generic code.
>  - Watchdog register is only read when it is actually used.
>  - Less #ifdefery
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/rtc/rtc-pcf2127.c | 56 ++++++++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index ed6316992cbb..5b1f1949b5e5 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -335,6 +335,36 @@ static const struct watchdog_ops pcf2127_watchdog_op=
s =3D {
>         .set_timeout =3D pcf2127_wdt_set_timeout,
>  };
>
> +static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf=
2127)
> +{
> +       u32 wdd_timeout;
> +       int ret;
> +
> +       if (!IS_ENABLED(CONFIG_WATCHDOG))
> +               return 0;
> +
> +       pcf2127->wdd.parent =3D dev;
> +       pcf2127->wdd.info =3D &pcf2127_wdt_info;
> +       pcf2127->wdd.ops =3D &pcf2127_watchdog_ops;
> +       pcf2127->wdd.min_timeout =3D PCF2127_WD_VAL_MIN;
> +       pcf2127->wdd.max_timeout =3D PCF2127_WD_VAL_MAX;
> +       pcf2127->wdd.timeout =3D PCF2127_WD_VAL_DEFAULT;
> +       pcf2127->wdd.min_hw_heartbeat_ms =3D 500;
> +       pcf2127->wdd.status =3D WATCHDOG_NOWAYOUT_INIT_STATUS;
> +
> +       watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
> +
> +       /* Test if watchdog timer is started by bootloader */
> +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_tim=
eout);
> +       if (ret)
> +               return ret;
> +
> +       if (wdd_timeout)
> +               set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
> +
> +       return devm_watchdog_register_device(dev, &pcf2127->wdd);
> +}
> +
>  /* Alarm */
>  static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm =
*alrm)
>  {
> @@ -536,7 +566,6 @@ static int pcf2127_probe(struct device *dev, struct r=
egmap *regmap,
>                          int alarm_irq, const char *name, bool has_nvmem)
>  {
>         struct pcf2127 *pcf2127;
> -       u32 wdd_timeout;
>         int ret =3D 0;
>
>         dev_dbg(dev, "%s\n", __func__);
> @@ -575,17 +604,6 @@ static int pcf2127_probe(struct device *dev, struct =
regmap *regmap,
>                 pcf2127->rtc->ops =3D &pcf2127_rtc_alrm_ops;
>         }
>
> -       pcf2127->wdd.parent =3D dev;
> -       pcf2127->wdd.info =3D &pcf2127_wdt_info;
> -       pcf2127->wdd.ops =3D &pcf2127_watchdog_ops;
> -       pcf2127->wdd.min_timeout =3D PCF2127_WD_VAL_MIN;
> -       pcf2127->wdd.max_timeout =3D PCF2127_WD_VAL_MAX;
> -       pcf2127->wdd.timeout =3D PCF2127_WD_VAL_DEFAULT;
> -       pcf2127->wdd.min_hw_heartbeat_ms =3D 500;
> -       pcf2127->wdd.status =3D WATCHDOG_NOWAYOUT_INIT_STATUS;
> -
> -       watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
> -
>         if (has_nvmem) {
>                 struct nvmem_config nvmem_cfg =3D {
>                         .priv =3D pcf2127,
> @@ -615,19 +633,7 @@ static int pcf2127_probe(struct device *dev, struct =
regmap *regmap,
>                 return ret;
>         }
>
> -       /* Test if watchdog timer is started by bootloader */
> -       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_tim=
eout);
> -       if (ret)
> -               return ret;
> -
> -       if (wdd_timeout)
> -               set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
> -
> -#ifdef CONFIG_WATCHDOG
> -       ret =3D devm_watchdog_register_device(dev, &pcf2127->wdd);
> -       if (ret)
> -               return ret;
> -#endif /* CONFIG_WATCHDOG */
> +       pcf2127_watchdog_init(dev, pcf2127);

The code refactoring seems like a good idea Uwe, but the new
pcf2127_watchdog_init() is not a void function. If the return
value is not handled, it will change driver behavior. Correct
handling should look like this:

ret =3D pcf2127_watchdog_init(dev, pcf2127);
if (ret)
        return ret;

/Bruno

>         /*
>          * Disable battery low/switch-over timestamp and interrupts.
> --
> 2.28.0
>

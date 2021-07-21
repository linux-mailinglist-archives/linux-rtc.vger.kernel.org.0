Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167163D14AF
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jul 2021 18:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhGUQQO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Jul 2021 12:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235545AbhGUQQL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Jul 2021 12:16:11 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3FDC061575;
        Wed, 21 Jul 2021 09:56:47 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id c9so1080512uat.1;
        Wed, 21 Jul 2021 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=soKsTxfp3JlXQfUzAz/2MafI1ftVItRQDjW8DRM/Ruo=;
        b=V5dapbQqTI9nxBA635LT5YfE4dkOAr52Zh6Tf1AfvcNhGOdTwmOP0amqjKJleXAkJt
         dKqr5TwQ6z7g9xJbvKw3c1R0VA8mXfJIbTqoPt+HVGAsfv4ukoEk4FSBzSF3Cy/0B8oY
         bHLKblgfpWa+7zVrSqIYBG8zxj20bskFYVG+XGGSCd0PtyYW+1d/MvoKxBzzB7L+ZbQ3
         cgnw+9TZz5NHx62ADsjpXY4Bwkyl/qNesldUpNGf5mMFNr0M6vXS6lyp28i/XDVsIbJc
         DnVxhN+Fv9FqkSXvST+kzSXXz2e42BwgUGBiT/ytcDBs3QI/sb03MCti4jT07mVDDvUk
         5ATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=soKsTxfp3JlXQfUzAz/2MafI1ftVItRQDjW8DRM/Ruo=;
        b=CRXW5jC5v24PSN0gUfEJZX92jBaBU0bU+MWIzWTQxDiGGQqjFD3oIhVeq/kDW7Xzx+
         8B7VBSJCk7R+ug7FzQA1nh8yyHEEOIlh4Y6RBFh1/rOsjVaQNjzoGGJlbra92fDyaM0u
         FxmrBuL2mqD1jbfEYuPQbnqAeadpv4vivQ0ThW5KlXD7NCVIZGSAbe4OmNkxPXJUSw6r
         vEFTb+ZWQCMhG+vC9x6CCMyOIgQlaHHFZnW794rQmuV/b2c6tnVV6U0miXDHc4SEJCmw
         9J/jIlyw9RdK7w0rcBQFhUOBQtekZh/QgJjn+OgscjpNDm2Rdu4s/Ebl6TnzvJM9Zp96
         0f/g==
X-Gm-Message-State: AOAM531r4pwz6R31IQnMDSBpdk4v24O4UAJYsRNHCTtkU/TRC3lRBWzS
        ePDU9MbaXcsbNjhDd7Cia6gAMczsjnQl3BqXOOU=
X-Google-Smtp-Source: ABdhPJzAJqh/MT4+UTvyMERbEJLUdK2lAb/jlbXI3N3/Mq9G2nwAtocprZXozt0qP8h6GWGHizbt5VXZo1lgBOE06Hk=
X-Received: by 2002:ab0:2c0e:: with SMTP id l14mr38088577uar.126.1626886606504;
 Wed, 21 Jul 2021 09:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210720172251.4504-1-romain.perier@gmail.com>
 <20210720172251.4504-3-romain.perier@gmail.com> <YPcroRmHYEV9BWaJ@piout.net>
In-Reply-To: <YPcroRmHYEV9BWaJ@piout.net>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Wed, 21 Jul 2021 18:56:34 +0200
Message-ID: <CABgxDoJtd6sVuVoEQ5orWDQ5YV18Tno7K_0GaAsgPdPPB_9HEA@mail.gmail.com>
Subject: Re: [PATCH 2/3] rtc: Add support for the MSTAR MSC313 RTC
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alexandre,

Le mar. 20 juil. 2021 =C3=A0 22:01, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello Romain,
>
> On 20/07/2021 19:22:50+0200, Romain Perier wrote:
> > From: Daniel Palmer <daniel@0x0f.com>
> >
> > This adds support for the RTC block on the Mstar MSC313e SoCs and newer=
.
> >
> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> > Co-developed-by: Romain Perier <romain.perier@gmail.com>
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> >  MAINTAINERS              |   1 +
> >  drivers/rtc/Kconfig      |  10 ++
> >  drivers/rtc/Makefile     |   1 +
> >  drivers/rtc/rtc-msc313.c | 246 +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 258 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-msc313.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6c8be735cc91..7e8d1a375e0d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2220,6 +2220,7 @@ F:      arch/arm/boot/dts/mstar-*
> >  F:   arch/arm/mach-mstar/
> >  F:   drivers/clk/mstar/
> >  F:   drivers/gpio/gpio-msc313.c
> > +F:   drivers/rtc/rtc-msc313.c
> >  F:   drivers/watchdog/msc313e_wdt.c
> >  F:   include/dt-bindings/clock/mstar-*
> >  F:   include/dt-bindings/gpio/msc313-gpio.h
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 12153d5801ce..67870b422bc5 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -1925,4 +1925,14 @@ config RTC_DRV_WILCO_EC
> >         This can also be built as a module. If so, the module will
> >         be named "rtc_wilco_ec".
> >
> > +config RTC_DRV_MSC313
> > +     tristate "MStar MSC313 RTC"
> > +        depends on ARCH_MSTARV7
>
> || COMPILE_TEST maybe ?

Arf, I always forget this option. Ack, I will add it in v2.

>
> > +     help
> > +       If you say yes here you get support for the Mstar MSC313e On-Ch=
ip
> > +       Real Time Clock.
> > +
> > +       This driver can also be built as a module, if so, the module
> > +       will be called "rtc-msc313".
> > +
> >  endif # RTC_CLASS
>
>
> > +static int msc313_rtc_read_time(struct device *dev, struct rtc_time *t=
m)
> > +{
> > +     struct msc313_rtc *priv =3D dev_get_drvdata(dev);
> > +     u32 seconds;
> > +     u16 reg;
> > +
> > +     reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> > +     writew(reg | READ_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
> > +
> > +     /* Wait for HW latch done */
> > +     while (readw(priv->rtc_base + REG_RTC_CTRL) & READ_EN_BIT)
> > +             udelay(1);
> > +
> > +     seconds =3D readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
> > +                     | (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 1=
6);
> > +
> > +     rtc_time64_to_tm(seconds, tm);
> > +
> > +     return rtc_valid_tm(tm);
>
> This is not necessary, tm is valid at that point (and the core will
> check anyway).

ack.

>
> > +}
> > +
> > +static int msc313_rtc_set_time(struct device *dev, struct rtc_time *tm=
)
> > +{
> > +     struct msc313_rtc *priv =3D dev_get_drvdata(dev);
> > +     unsigned long seconds;
> > +     u16 reg;
> > +
> > +     seconds =3D rtc_tm_to_time64(tm);
> > +     writew(seconds & 0xFFFF, priv->rtc_base + REG_RTC_LOAD_VAL_L);
> > +     writew((seconds >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_LOAD_VA=
L_H);
> > +     reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> > +     writew(reg | LOAD_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
> > +
> > +     /* need to check carefully if we want to clear REG_RTC_LOAD_VAL_H=
 for customer*/
> > +     while (readw(priv->rtc_base + REG_RTC_CTRL) & LOAD_EN_BIT)
> > +             udelay(1);
> > +     writew(0, priv->rtc_base + REG_RTC_LOAD_VAL_H);
>
> Why is that necessary? The comment is not super useful here.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct rtc_class_ops msc313_rtc_ops =3D {
> > +     .read_time =3D msc313_rtc_read_time,
> > +     .set_time =3D msc313_rtc_set_time,
> > +     .read_alarm =3D msc313_rtc_read_alarm,
> > +     .set_alarm =3D msc313_rtc_set_alarm,
> > +     .alarm_irq_enable =3D msc313_rtc_alarm_irq_enable,
> > +};
> > +
> > +static irqreturn_t msc313_rtc_interrupt(s32 irq, void *dev_id)
> > +{
> > +     struct msc313_rtc *priv =3D dev_get_drvdata(dev_id);
> > +     u16 reg;
> > +
> > +     reg =3D readw_relaxed(priv->rtc_base + REG_RTC_CTRL);
> > +     reg |=3D INT_CLEAR_BIT;
> > +     reg &=3D ~INT_FORCE_BIT;
> > +     writew_relaxed(reg, priv->rtc_base + REG_RTC_CTRL);
> > +
>
> I'm not convinced the _relaxed functions are doing the right thing here.


Good catch for the _relaxed, I did not pay attention during refactoring.

> Also, shouldn't you check the alarm actually fired?

You mean before set the flag "RTC_AF" ? This driver is mostly based on
reverse engineering,
even if we have some hardware info. I will try to find if it is
possible (I mean,  from the info
I have).

>
> > +     rtc_update_irq(priv->rtc_dev, 1, RTC_IRQF | RTC_AF);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int msc313_rtc_remove(struct platform_device *pdev)
> > +{
> > +     struct msc313_rtc *priv =3D platform_get_drvdata(pdev);
> > +
> > +     clk_disable_unprepare(priv->clk);
>
> With a nice devm_add_action_or_reset() in the probe, you can remove the
> need for msc313_rtc_remove().

devm_add_action_or_reset() you said, interesting I did not know this functi=
on.


>
> > +
> > +     return 0;
> > +}
> > +
> > +static int msc313_rtc_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct msc313_rtc *priv;
> > +     int ret;
> > +     int irq;
> > +     unsigned long rate;
> > +     u16 reg;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, sizeof(struct msc313_rtc), GFP_=
KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->rtc_base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(priv->rtc_base))
> > +             return PTR_ERR(priv->rtc_base);
> > +
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return -EINVAL;
> > +
> > +     ret =3D devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHA=
RED,
> > +                            dev_name(&pdev->dev), &pdev->dev);
> > +     if (ret) {
> > +             dev_err(dev, "Unable to request irq\n");
> > +             return ret;
> > +     }
> > +
> > +     priv->clk =3D devm_clk_get(dev, NULL);
> > +     if (IS_ERR(priv->clk)) {
> > +             dev_err(dev, "No input reference clock\n");
> > +             return PTR_ERR(priv->clk);
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(priv->clk);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to enable the reference clock, %d\n"=
, ret);
> > +             return ret;
> > +     }
> > +
> > +     rate =3D clk_get_rate(priv->clk);
> > +
> > +     reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> > +     if (!(reg & SOFT_RSTZ_BIT)) {
> > +             reg |=3D SOFT_RSTZ_BIT;
> > +             writew(reg, priv->rtc_base + REG_RTC_CTRL);
> > +     }
>
> What is the meaning of this bit? I would think it is better to use that
> to know whether the RTC holds the correct time instead of killing the
> info here.
>
> > +
> > +     writew(rate & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_L);
> > +     writew((rate >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_H)=
;
> > +
> > +     reg |=3D CNT_EN_BIT;
> > +     writew(reg, priv->rtc_base + REG_RTC_CTRL);
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     priv->rtc_dev =3D devm_rtc_device_register(dev, dev_name(dev), &m=
sc313_rtc_ops, THIS_MODULE);
> > +     if (IS_ERR(priv->rtc_dev)) {
> > +             dev_err(dev, "Failed to register rtc device\n");
> > +             return PTR_ERR(priv->rtc_dev);
> > +     }
>
> Please switch to devm_rtc_allocate_device and devm_rtc_register_device.
> Also drop the error message, it is not necessary.
>
> You must also set the RTC range. To help you, you can use:
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tr=
ee/rtc-range.c
> then you must update the DT bindings as the RTC will support the
> start-year property
>
> You must also run rtctest and should include the results.

Ack, I will do this in v2.

Thanks!

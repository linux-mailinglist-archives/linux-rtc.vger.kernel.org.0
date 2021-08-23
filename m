Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9B23F45C8
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Aug 2021 09:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235006AbhHWHaD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Aug 2021 03:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbhHWHaC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Aug 2021 03:30:02 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7634FC061575
        for <linux-rtc@vger.kernel.org>; Mon, 23 Aug 2021 00:29:20 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 13so4233563vke.8
        for <linux-rtc@vger.kernel.org>; Mon, 23 Aug 2021 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r6abzW5EhxD1q5GgfkrzW3RElYYvwZP+C4Q5YRXXnBc=;
        b=y1Sgm4+taI5iG99iQ3ElrepMNxGp8blUTCM/p5vkAdRlhbCnrJtdsxt8w93sCuB84q
         HtcoYxyAV0bWdVT3LL98YCrTPIfjX7IABZseT9v1E4WAKdKOmg8SRWqT+24bvoQUlI3k
         9pwMG0Jrnr9zoYAatfV94QUyht9qxMmsnkkW9ENwzV7b7Vf57VuzJY3NJqBwvyDsRyE1
         CHLdAxfP1MHhE5p6hoL2mDJc2rYJpvFvRKyLVqmUiAQM2xpmg+foLP/FsdxU4gl7j535
         L0zFf1rj5i8yz8ltmeoHEDd9SF/qcsHKh18a/Qr8aE3GOn2hDI5/zCjwLjeHmeo/ZAfw
         +7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r6abzW5EhxD1q5GgfkrzW3RElYYvwZP+C4Q5YRXXnBc=;
        b=FtFFgD2yShrOqNmYdcVi9DDpaBuXyiMMhzqvUMoEoBLNFPqsFJaw1RCoSVBUCsGeij
         F5JpZd5x6eVl9rLrmJ9KRotOLqGnQRYK/zFjv5QA7VGfNrWACMV+ng1ZjymERuO1YdnS
         7V6q8B2ZpyfcvjDUQ+kW1YBQ1pYagBBDzxLexQgBqcxuUiJaLSjIpertVSrssNiaQnkq
         U58uOEIEYZMp948aidK/8wj4hN7LjpwAyy+Ng61kcH0+fU2xwXau6TSeqiGaXjpbBLmb
         Jb2noXyaAxfsznZcltUG9Zug7Z+AFQ72NXsYGRScQWOiyM3lr/wvfa+tVvAJR7LcU5xo
         wJJQ==
X-Gm-Message-State: AOAM530v65BKJTfirWgeF0I/etthbLtOersmewmCwgBKed2wTki2iTMw
        BoSigkyV+VVAiZYp2PyiRag0usTTt6Xx99AVJXJ4ToxTBwKV
X-Google-Smtp-Source: ABdhPJzXg0QLDKC3ypVOLJ8LF+Hnwvf/dzKpGyMpqKTbNZDoVCtszzAT8fU9HhMQeUE9pL0O9BMtnx4Bln3psySzSUA=
X-Received: by 2002:a05:6122:e04:: with SMTP id bk4mr20872064vkb.20.1629703758877;
 Mon, 23 Aug 2021 00:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210819170301.10520-1-romain.perier@gmail.com> <20210819170301.10520-3-romain.perier@gmail.com>
In-Reply-To: <20210819170301.10520-3-romain.perier@gmail.com>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Mon, 23 Aug 2021 16:28:52 +0900
Message-ID: <CABMQnVJwFf4nX6ApdobBnwfzmWSsYHcabFqZd8rUQw=T7V=vcA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] rtc: Add support for the MSTAR MSC313 RTC
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi!

2021=E5=B9=B48=E6=9C=8820=E6=97=A5(=E9=87=91) 2:03 Romain Perier <romain.pe=
rier@gmail.com>:
>
> From: Daniel Palmer <daniel@0x0f.com>
>
> This adds support for the RTC block on the Mstar MSC313e SoCs and newer.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Co-developed-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  MAINTAINERS              |   1 +
>  drivers/rtc/Kconfig      |  10 ++
>  drivers/rtc/Makefile     |   1 +
>  drivers/rtc/rtc-msc313.c | 258 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 270 insertions(+)
>  create mode 100644 drivers/rtc/rtc-msc313.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd25e4ecf0b9..ebacdd5e8878 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2220,6 +2220,7 @@ F:        arch/arm/boot/dts/mstar-*
>  F:     arch/arm/mach-mstar/
>  F:     drivers/clk/mstar/
>  F:     drivers/gpio/gpio-msc313.c
> +F:     drivers/rtc/rtc-msc313.c
>  F:     drivers/watchdog/msc313e_wdt.c
>  F:     include/dt-bindings/clock/mstar-*
>  F:     include/dt-bindings/gpio/msc313-gpio.h
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 12153d5801ce..9ce4baab5fcf 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1925,4 +1925,14 @@ config RTC_DRV_WILCO_EC
>           This can also be built as a module. If so, the module will
>           be named "rtc_wilco_ec".
>
> +config RTC_DRV_MSC313
> +       tristate "MStar MSC313 RTC"
> +        depends on ARCH_MSTARV7 || COMPILE_TEST
> +       help
> +         If you say yes here you get support for the Mstar MSC313e On-Ch=
ip
> +         Real Time Clock.
> +
> +         This driver can also be built as a module, if so, the module
> +         will be called "rtc-msc313".
> +
>  endif # RTC_CLASS
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 2dd0dd956b0e..5efda8a60cee 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_RTC_DRV_MCP795)        +=3D rtc-mcp795.o
>  obj-$(CONFIG_RTC_DRV_MESON)    +=3D rtc-meson.o
>  obj-$(CONFIG_RTC_DRV_MOXART)   +=3D rtc-moxart.o
>  obj-$(CONFIG_RTC_DRV_MPC5121)  +=3D rtc-mpc5121.o
> +obj-$(CONFIG_RTC_DRV_MSC313)   +=3D rtc-msc313.o
>  obj-$(CONFIG_RTC_DRV_MSM6242)  +=3D rtc-msm6242.o
>  obj-$(CONFIG_RTC_DRV_MT2712)   +=3D rtc-mt2712.o
>  obj-$(CONFIG_RTC_DRV_MT6397)   +=3D rtc-mt6397.o
> diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
> new file mode 100644
> index 000000000000..8cf5d5fb298f
> --- /dev/null
> +++ b/drivers/rtc/rtc-msc313.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Real time clocks driver for MStar/SigmaStar ARMv7 SoCs.
> + * Based on "Real Time Clock driver for msb252x." that was contained
> + * in various MStar kernels.
> + *
> + * (C) 2019 Daniel Palmer
> + * (C) 2021 Romain Perier
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +
> +/* Registers */
> +#define REG_RTC_CTRL           0x00
> +#define REG_RTC_FREQ_CW_L      0x04
> +#define REG_RTC_FREQ_CW_H      0x08
> +#define REG_RTC_LOAD_VAL_L     0x0C
> +#define REG_RTC_LOAD_VAL_H     0x10
> +#define REG_RTC_MATCH_VAL_L    0x14
> +#define REG_RTC_MATCH_VAL_H    0x18
> +#define REG_RTC_STATUS_INT     0x1C
> +#define REG_RTC_CNT_VAL_L      0x20
> +#define REG_RTC_CNT_VAL_H      0x24
> +
> +/* Control bits for REG_RTC_CTRL */
> +#define SOFT_RSTZ_BIT          BIT(0)
> +#define CNT_EN_BIT             BIT(1)
> +#define WRAP_EN_BIT            BIT(2)
> +#define LOAD_EN_BIT            BIT(3)
> +#define READ_EN_BIT            BIT(4)
> +#define INT_MASK_BIT           BIT(5)
> +#define INT_FORCE_BIT          BIT(6)
> +#define INT_CLEAR_BIT          BIT(7)
> +
> +/* Control bits for REG_RTC_STATUS_INT */
> +#define RAW_INT_BIT            BIT(0)
> +#define ALM_INT_BIT            BIT(1)
> +
> +struct msc313_rtc {
> +       struct rtc_device *rtc_dev;
> +       void __iomem *rtc_base;
> +       struct clk *clk;

The clk variable is only used in msc313_rtc_probe(). Therefore, it is
not necessary to have it in this structure.

> +};
> +
> +static int msc313_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *=
alarm)
> +{
> +       struct msc313_rtc *priv =3D dev_get_drvdata(dev);
> +       unsigned long seconds;
> +
> +       seconds =3D readw(priv->rtc_base + REG_RTC_MATCH_VAL_L)
> +                       | (readw(priv->rtc_base + REG_RTC_MATCH_VAL_H) <<=
 16);
> +
> +       rtc_time64_to_tm(seconds, &alarm->time);
> +
> +       if (!(readw(priv->rtc_base + REG_RTC_CTRL) & INT_MASK_BIT))
> +               alarm->enabled =3D 1;
> +
> +       return 0;
> +}
> +
> +static int msc313_rtc_alarm_irq_enable(struct device *dev, unsigned int =
enabled)
> +{
> +       struct msc313_rtc *priv =3D dev_get_drvdata(dev);
> +       u16 reg;
> +
> +       reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> +       if (enabled)
> +               reg &=3D ~INT_MASK_BIT;
> +       else
> +               reg |=3D INT_MASK_BIT;
> +       writew(reg, priv->rtc_base + REG_RTC_CTRL);
> +       return 0;
> +}
> +
> +static int msc313_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *a=
larm)
> +{
> +       struct msc313_rtc *priv =3D dev_get_drvdata(dev);
> +       unsigned long seconds;
> +
> +       seconds =3D rtc_tm_to_time64(&alarm->time);
> +       writew((seconds & 0xFFFF), priv->rtc_base + REG_RTC_MATCH_VAL_L);
> +       writew((seconds >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_MATCH_V=
AL_H);
> +
> +       msc313_rtc_alarm_irq_enable(dev, alarm->enabled);
> +
> +       return 0;
> +}
> +
> +static bool msc313_rtc_get_enabled(struct msc313_rtc *priv)
> +{
> +       return readw(priv->rtc_base + REG_RTC_CTRL) & CNT_EN_BIT;
> +}
> +
> +static void msc313_rtc_set_enabled(struct msc313_rtc *priv)
> +{
> +       u16 reg;
> +
> +       reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> +       reg |=3D CNT_EN_BIT;
> +       writew(reg, priv->rtc_base + REG_RTC_CTRL);
> +}
> +
> +static int msc313_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +       struct msc313_rtc *priv =3D dev_get_drvdata(dev);
> +       u32 seconds;
> +       u16 reg;
> +
> +       if (!msc313_rtc_get_enabled(priv))
> +               return -EINVAL;
> +
> +       reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> +       writew(reg | READ_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
> +
> +       /* Wait for HW latch done */
> +       while (readw(priv->rtc_base + REG_RTC_CTRL) & READ_EN_BIT)
> +               udelay(1);
> +
> +       seconds =3D readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
> +                       | (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 1=
6);
> +
> +       rtc_time64_to_tm(seconds, tm);
> +
> +       return 0;
> +}
> +
> +static int msc313_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +       struct msc313_rtc *priv =3D dev_get_drvdata(dev);
> +       unsigned long seconds;
> +       u16 reg;
> +
> +       seconds =3D rtc_tm_to_time64(tm);
> +       writew(seconds & 0xFFFF, priv->rtc_base + REG_RTC_LOAD_VAL_L);
> +       writew((seconds >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_LOAD_VA=
L_H);
> +
> +       /* Enable load for loading value into internal RTC counter */
> +       reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> +       writew(reg | LOAD_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
> +
> +       /* Wait for HW latch done */
> +       while (readw(priv->rtc_base + REG_RTC_CTRL) & LOAD_EN_BIT)
> +               udelay(1);
> +       msc313_rtc_set_enabled(priv);
> +       return 0;
> +}
> +
> +static const struct rtc_class_ops msc313_rtc_ops =3D {
> +       .read_time =3D msc313_rtc_read_time,
> +       .set_time =3D msc313_rtc_set_time,
> +       .read_alarm =3D msc313_rtc_read_alarm,
> +       .set_alarm =3D msc313_rtc_set_alarm,
> +       .alarm_irq_enable =3D msc313_rtc_alarm_irq_enable,
> +};
> +
> +static irqreturn_t msc313_rtc_interrupt(s32 irq, void *dev_id)
> +{
> +       struct msc313_rtc *priv =3D dev_get_drvdata(dev_id);
> +       u16 reg;
> +
> +       reg =3D readw(priv->rtc_base + REG_RTC_STATUS_INT);
> +       if (!(reg & ALM_INT_BIT))
> +               return IRQ_NONE;
> +
> +       reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> +       reg |=3D INT_CLEAR_BIT;
> +       reg &=3D ~INT_FORCE_BIT;
> +       writew(reg, priv->rtc_base + REG_RTC_CTRL);
> +
> +       rtc_update_irq(priv->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int msc313_rtc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct msc313_rtc *priv;
> +       int ret;
> +       int irq;
> +       unsigned long rate;

Please use reverse christmas tree ordering for local variable.

> +
> +       priv =3D devm_kzalloc(&pdev->dev, sizeof(struct msc313_rtc), GFP_=
KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->rtc_base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->rtc_base))
> +               return PTR_ERR(priv->rtc_base);
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return -EINVAL;
> +
> +       priv->rtc_dev =3D devm_rtc_allocate_device(dev);
> +       if (IS_ERR(priv->rtc_dev))
> +               return PTR_ERR(priv->rtc_dev);
> +
> +       priv->rtc_dev->ops =3D &msc313_rtc_ops;
> +       priv->rtc_dev->range_max =3D U32_MAX;
> +
> +       ret =3D devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHA=
RED,
> +                              dev_name(&pdev->dev), &pdev->dev);
> +       if (ret) {
> +               dev_err(dev, "Could not request IRQ\n");
> +               return ret;
> +       }
> +
> +       priv->clk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(priv->clk)) {
> +               dev_err(dev, "No input reference clock\n");
> +               return PTR_ERR(priv->clk);
> +       }
> +
> +       ret =3D clk_prepare_enable(priv->clk);
> +       if (ret) {
> +               dev_err(dev, "Failed to enable the reference clock, %d\n"=
, ret);
> +               return ret;
> +       }
> +
> +       ret =3D devm_add_action_or_reset(dev, (void (*) (void *))clk_disa=
ble_unprepare, priv->clk);
> +       if (ret)
> +               return ret;
> +
> +       rate =3D clk_get_rate(priv->clk);
> +       writew(rate & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_L);
> +       writew((rate >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_H)=
;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       return devm_rtc_register_device(priv->rtc_dev);
> +}
> +
> +static const struct of_device_id msc313_rtc_of_match_table[] =3D {
> +       { .compatible =3D "mstar,msc313-rtc" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, ms_rtc_of_match_table);

msc313_rtc_of_match_table ?

> +
> +static struct platform_driver msc313_rtc_driver =3D {
> +       .probe =3D msc313_rtc_probe,
> +       .driver =3D {
> +               .name =3D "msc313-rtc",
> +               .of_match_table =3D msc313_rtc_of_match_table,
> +       },
> +};
> +
> +module_platform_driver(msc313_rtc_driver);
> +
> +MODULE_AUTHOR("Daniel Palmer <daniel@thingy.jp>");
> +MODULE_AUTHOR("Romain Perier <romain.perier@gmail.com>");
> +MODULE_DESCRIPTION("MStar RTC Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.30.2
>

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 40AD1FA6

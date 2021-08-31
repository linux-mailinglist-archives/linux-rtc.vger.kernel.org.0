Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34BB3FBFFC
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Aug 2021 02:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239129AbhHaAaO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Aug 2021 20:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238692AbhHaAaN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Aug 2021 20:30:13 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9868C061760
        for <linux-rtc@vger.kernel.org>; Mon, 30 Aug 2021 17:29:19 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id p14so127251vsm.2
        for <linux-rtc@vger.kernel.org>; Mon, 30 Aug 2021 17:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ua6RJJdSzE5NnhckPixGrbnyF28l+OENKnDCqpy4XCU=;
        b=LWp6R3wZ9i4CHlNIOtyA2AIrW6TZoKDCSJR8fkKqf3Hx6D2hbEGeIl64dFbuKxFani
         f/9cy3SmkRNj4isHI6CUv7hkYu3PKIlfruejErqtmiDNNKru8cFeiXClWMJIPnxtYKTs
         2lDXVgFf6/V//tOG1BoVSxLF3v9OtDg6NKE74X0a7ZFQFjttVeJGyw2x3/vKgAb+w9ye
         Xjh3GO+/D3aVxzt96Rgs+aGvR1j/7jeNBF1dA7qNPh0DycfxZ5U1h2Y4ybf3gWtvZDEy
         8FzbUja0oiCwlNr0gW4ozQAZz1/X6LpoDm3pVPhLaN8bidn9UrQNp5z1iJCHu8nWORu5
         6WXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ua6RJJdSzE5NnhckPixGrbnyF28l+OENKnDCqpy4XCU=;
        b=ItK0YDMpHf+4VHxzwCw1S0A6DHh2K2kPHdI48C7Ipvv3hZ8/p2fmjaG4/6V+ugO6sC
         HR2f2WaUpDPTOpjQwGH7yDO2eVlXGwyhzQSBx89q4zQ/aRBRD4fKtzwHBDz80aXPtjsK
         BlL2MfbbvDp7dBEc3ah2oRYrC7CSQzqW/NqOaVnABHb9hdwLkKR0wN1Cunx04/BLsQvv
         c+B1GBfwQvII16E8vXs2mlgcEa7Mym1HH+/QlN7Kt1AieUzOZBFwXoA6yfZe+gjLWTWt
         Bj8KvtA+4/plXn/4hHYvqkaJMF2EDIG4b7AJsvrZsbpEKfL2FuNUvWH+nkvq3trPEjKB
         QOxA==
X-Gm-Message-State: AOAM530qhqc41jLwEcV0lKhfwy0c3Ci1q1WHZcexDV/kMXbU/xFsVBpU
        7jynjMKzYl76zQn+YsMTX7JGKrYxGaeqB6PfswoK
X-Google-Smtp-Source: ABdhPJzY8SEoXozwxOq0BDzCTC+NWt319mvEPZ1zvVPdw/f9LIMTDDa7ysRy9Ii9GP84sQ15gFjoLceUt67AlPFoMUg=
X-Received: by 2002:a05:6102:c06:: with SMTP id x6mr17238308vss.2.1630369758714;
 Mon, 30 Aug 2021 17:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210823171613.18941-1-romain.perier@gmail.com> <20210823171613.18941-3-romain.perier@gmail.com>
In-Reply-To: <20210823171613.18941-3-romain.perier@gmail.com>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Tue, 31 Aug 2021 09:28:52 +0900
Message-ID: <CABMQnVLxJ6_ZshFZVC7rxAg+xVv_06XyxxvsOUmkopG9X0A4kA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rtc: Add support for the MSTAR MSC313 RTC
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

Hello,

2021=E5=B9=B48=E6=9C=8824=E6=97=A5(=E7=81=AB) 2:16 Romain Perier <romain.pe=
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

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro

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
> index 000000000000..f493ca5f181b
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
> +       unsigned long rate;
> +       struct clk *clk;
> +       int ret;
> +       int irq;
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
> +       clk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(clk)) {
> +               dev_err(dev, "No input reference clock\n");
> +               return PTR_ERR(clk);
> +       }
> +
> +       ret =3D clk_prepare_enable(clk);
> +       if (ret) {
> +               dev_err(dev, "Failed to enable the reference clock, %d\n"=
, ret);
> +               return ret;
> +       }
> +
> +       ret =3D devm_add_action_or_reset(dev, (void (*) (void *))clk_disa=
ble_unprepare, clk);
> +       if (ret)
> +               return ret;
> +
> +       rate =3D clk_get_rate(clk);
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
> +MODULE_DEVICE_TABLE(of, msc313_rtc_of_match_table);
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


--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6

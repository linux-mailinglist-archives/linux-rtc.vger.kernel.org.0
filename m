Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D659D156FB1
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Feb 2020 07:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgBJG4I (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 10 Feb 2020 01:56:08 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:46600 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgBJG4I (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 Feb 2020 01:56:08 -0500
Received: by mail-qv1-f67.google.com with SMTP id y2so2696785qvu.13
        for <linux-rtc@vger.kernel.org>; Sun, 09 Feb 2020 22:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PMQWUrJ+gmagEIvlkB+8Mm4ezbR5sA39EolG3LwA3ZM=;
        b=jAY+BVb3dS8PBcnjOJg/O7NlGtzJmsU6u8/VrtusXu1KtaCxwZDWLhg6WIzLNKh57r
         bQia0P9SKuopAMc2+P+jjuR9BBR6pMSNT0KTlilVjZA2LcoOGTA3BdSZ9hVx3HOm+OfD
         MBwuBlVAjLqvZtrQwPbCQvOaCPUZ9/uEJC5Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PMQWUrJ+gmagEIvlkB+8Mm4ezbR5sA39EolG3LwA3ZM=;
        b=cao8vK35MlOEgmpkhpj2uYwjZbGnyKcuHJlBgagFMj+1F1MR7GJmuowGj9zp+vUkjz
         p4HlH7/Xu5Dv374Xs7vp4ziTmkmeac/kBBCa0QG49Pf7GaBARsje1WAIDapKRt9i3m8L
         Ly97WKAYTgQjUySxzQvE1Lccjuzd6hbJBGQicaEqwe+QnMnRgqmahXAp3rhkhR1PUtH3
         3ApPXTz8tkmWOFKDdEOsPNTcjHjRkyqzZughyHD1xhlRQHolYD5GqZRjVh8aO8fS322E
         ilRNj+udXy//EOpIVL3B8xyhYB4FgpCgvTILmhmqt2PVvSRHx+q8CBAMuuOXYLZjjUZd
         IuTQ==
X-Gm-Message-State: APjAAAUuqjZlInh6ZSGTBJsZZQy2Z9JaFarAHHI69+GzBbVgiORHISyH
        wjEuNDt197ZwEFc0H/t2Opu29KwVa9Ja/ATU+B76eQ==
X-Google-Smtp-Source: APXvYqy+zD0wXRv6sGHzG6j4LakWqpPnj9kK0CGnF8SWdnJ2H1ojkyzUNJVfOCAzpwLOcch8Rmp8QzFoJPz+HrRuUco=
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr8885081qvb.187.1581317765893;
 Sun, 09 Feb 2020 22:56:05 -0800 (PST)
MIME-Version: 1.0
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1580730044-30501-4-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1580730044-30501-4-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 10 Feb 2020 14:55:54 +0800
Message-ID: <CANMq1KDdU=0zvAE3hzvqCnbiCvDSksNjwkDnv9Uz+tqr0PsNSQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] mfd: Add support for the MediaTek MT6358 PMIC
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Josef Friedl <josef.friedl@speed.at>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ran Bi <ran.bi@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

One nit and 2 small algorithmic improvements to reduce time servicing
interrupts.

On Mon, Feb 3, 2020 at 7:41 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> This adds support for the MediaTek MT6358 PMIC. This is a
> multifunction device with the following sub modules:
>
> - Regulator
> - RTC
> - Codec
> - Interrupt
>
> It is interfaced to the host controller using SPI interface
> by a proprietary hardware called PMIC wrapper or pwrap.
> MT6358 MFD is a child device of the pwrap.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile                 |   2 +-
>  drivers/mfd/mt6358-irq.c             | 230 ++++++++++++++++++++++++++++
>  drivers/mfd/mt6397-core.c            |  55 ++++++-
>  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
>  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   3 +
>  6 files changed, 725 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/mfd/mt6358-irq.c
>  create mode 100644 include/linux/mfd/mt6358/core.h
>  create mode 100644 include/linux/mfd/mt6358/registers.h
>
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index aed99f0..791a8f4 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -237,7 +237,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)        += intel-soc-pmic.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)     += intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     += intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  += intel_soc_pmic_chtdc_ti.o
> -mt6397-objs    := mt6397-core.o mt6397-irq.o
> +mt6397-objs                    := mt6397-core.o mt6397-irq.o mt6358-irq.o
>  obj-$(CONFIG_MFD_MT6397)       += mt6397.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)     += intel_soc_pmic_mrfld.o
>
> diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> new file mode 100644
> index 0000000..1682a3a9
> --- /dev/null
> +++ b/drivers/mfd/mt6358-irq.c
> @@ -0,0 +1,230 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2019 MediaTek Inc.
> +
> +#include <linux/interrupt.h>
> +#include <linux/mfd/mt6358/core.h>
> +#include <linux/mfd/mt6358/registers.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +static struct irq_top_t mt6358_ints[] = {
> +       MT6358_TOP_GEN(BUCK),
> +       MT6358_TOP_GEN(LDO),
> +       MT6358_TOP_GEN(PSC),
> +       MT6358_TOP_GEN(SCK),
> +       MT6358_TOP_GEN(BM),
> +       MT6358_TOP_GEN(HK),
> +       MT6358_TOP_GEN(AUD),
> +       MT6358_TOP_GEN(MISC),
> +};
> +
> +static void pmic_irq_enable(struct irq_data *data)
> +{
> +       unsigned int hwirq = irqd_to_hwirq(data);
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       irqd->enable_hwirq[hwirq] = true;
> +}
> +
> +static void pmic_irq_disable(struct irq_data *data)
> +{
> +       unsigned int hwirq = irqd_to_hwirq(data);
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       irqd->enable_hwirq[hwirq] = false;
> +}
> +
> +static void pmic_irq_lock(struct irq_data *data)
> +{
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +
> +       mutex_lock(&chip->irqlock);
> +}
> +
> +static void pmic_irq_sync_unlock(struct irq_data *data)
> +{
> +       unsigned int i, top_gp, en_reg, int_regs, shift;
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       for (i = 0; i < irqd->num_pmic_irqs; i++) {
> +               if (irqd->enable_hwirq[i] == irqd->cache_hwirq[i])
> +                       continue;
> +
> +               /* Find out the IRQ group */
> +               top_gp = 0;
> +               while ((top_gp + 1) < irqd->num_top &&
> +                      i >= mt6358_ints[top_gp + 1].hwirq_base)
> +                       top_gp++;
> +
> +               /* Find the irq registers */
> +               int_regs = (i - mt6358_ints[top_gp].hwirq_base) /
> +                           MT6358_REG_WIDTH;
> +               en_reg = mt6358_ints[top_gp].en_reg +
> +                        (mt6358_ints[top_gp].en_reg_shift * int_regs);
> +               shift = (i - mt6358_ints[top_gp].hwirq_base) % MT6358_REG_WIDTH;


nit: would it be nicer to use a temp variable and reorder a bit?

gp_offset = i - mt6358_ints[top_gp].hwirq_base;
int_regs = gp_offset / MT6358_REG_WIDTH;
shift = gp_offset % MT6358_REG_WIDTH;
en_reg = ...;

> +
> +               regmap_update_bits(chip->regmap, en_reg, BIT(shift),
> +                                  irqd->enable_hwirq[i] << shift);
> +
> +               irqd->cache_hwirq[i] = irqd->enable_hwirq[i];
> +       }
> +       mutex_unlock(&chip->irqlock);
> +}
> +
> +static struct irq_chip mt6358_irq_chip = {
> +       .name = "mt6358-irq",
> +       .flags = IRQCHIP_SKIP_SET_WAKE,
> +       .irq_enable = pmic_irq_enable,
> +       .irq_disable = pmic_irq_disable,
> +       .irq_bus_lock = pmic_irq_lock,
> +       .irq_bus_sync_unlock = pmic_irq_sync_unlock,
> +};
> +
> +static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
> +                                 unsigned int top_gp)
> +{
> +       unsigned int sta_reg, irq_status;
> +       unsigned int hwirq, virq;
> +       int ret, i, j;
> +
> +       for (i = 0; i < mt6358_ints[top_gp].num_int_regs; i++) {
> +               sta_reg = mt6358_ints[top_gp].sta_reg +
> +                       mt6358_ints[top_gp].sta_reg_shift * i;
> +
> +               ret = regmap_read(chip->regmap, sta_reg, &irq_status);
> +               if (ret) {
> +                       dev_err(chip->dev,
> +                               "Failed to read IRQ status, ret=%d\n", ret);
> +                       return;
> +               }
> +
> +               if (!irq_status)
> +                       continue;
> +
> +               for (j = 0; j < MT6358_REG_WIDTH; j++) {
> +                       if (irq_status & BIT(j) == 0)
> +                               continue;

You can simplify this a bit by using __ffs instead, so that you don't
need to go through this look 16 times even if a single bit is set:
Nice example here:
https://elixir.bootlin.com/linux/latest/source/drivers/irqchip/irq-ts4800.c#L81

status = irq_status;
do {
    j = __ffs(status);

    <rest of the code>

    status &= ~BIT(j);
} while(status);

> +                       hwirq = mt6358_ints[top_gp].hwirq_base +
> +                               MT6358_REG_WIDTH * i + j;
> +
> +                       virq = irq_find_mapping(chip->irq_domain, hwirq);
> +                       if (virq)
> +                               handle_nested_irq(virq);
> +               }
> +
> +               regmap_write(chip->regmap, sta_reg, irq_status);
> +       }
> +}
> +
> +static irqreturn_t mt6358_irq_handler(int irq, void *data)
> +{
> +       struct mt6397_chip *chip = data;
> +       struct pmic_irq_data *mt6358_irq_data = chip->irq_data;
> +       unsigned int top_irq_status;
> +       unsigned int i;
> +       int ret;
> +
> +       ret = regmap_read(chip->regmap,
> +                         mt6358_irq_data->top_int_status_reg,
> +                         &top_irq_status);
> +       if (ret) {
> +               dev_err(chip->dev,
> +                       "Failed to read status from the device, ret=%d\n", ret);
> +               return IRQ_NONE;
> +       }
> +
> +       for (i = 0; i < mt6358_irq_data->num_top; i++) {
> +               if (top_irq_status & BIT(mt6358_ints[i].top_offset))
> +                       mt6358_irq_sp_handler(chip, i);

This one is harder to convert to __ffs, but you can still do this:

for (i = 0; i < mt6358_irq_data->num_top; i++) {
   bit = BIT(mt6358_ints[i].top_offset);
   if (top_irq_status & bit) {
      mt6358_irq_sp_handler(chip, i);
      top_irq_status &= ~bit;
      if (!top_irq_status)
         break;
   }
}

> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int pmic_irq_domain_map(struct irq_domain *d, unsigned int irq,
> +                              irq_hw_number_t hw)
> +{
> +       struct mt6397_chip *mt6397 = d->host_data;
> +
> +       irq_set_chip_data(irq, mt6397);
> +       irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
> +       irq_set_nested_thread(irq, 1);
> +       irq_set_noprobe(irq);
> +
> +       return 0;
> +}
> +
> +static const struct irq_domain_ops mt6358_irq_domain_ops = {
> +       .map = pmic_irq_domain_map,
> +       .xlate = irq_domain_xlate_twocell,
> +};
> +
> +int mt6358_irq_init(struct mt6397_chip *chip)
> +{
> +       int i, j, ret;
> +       struct pmic_irq_data *irqd;
> +
> +       irqd = devm_kzalloc(chip->dev, sizeof(struct pmic_irq_data *),
> +                           GFP_KERNEL);
> +       if (!irqd)
> +               return -ENOMEM;
> +
> +       chip->irq_data = irqd;
> +
> +       mutex_init(&chip->irqlock);
> +       irqd->top_int_status_reg = MT6358_TOP_INT_STATUS0;
> +       irqd->num_pmic_irqs = MT6358_IRQ_NR;
> +       irqd->num_top = ARRAY_SIZE(mt6358_ints);
> +
> +       irqd->enable_hwirq = devm_kcalloc(chip->dev,
> +                                         irqd->num_pmic_irqs,
> +                                         sizeof(*irqd->enable_hwirq),
> +                                         GFP_KERNEL);
> +       if (!irqd->enable_hwirq)
> +               return -ENOMEM;
> +
> +       irqd->cache_hwirq = devm_kcalloc(chip->dev,
> +                                        irqd->num_pmic_irqs,
> +                                        sizeof(*irqd->cache_hwirq),
> +                                        GFP_KERNEL);
> +       if (!irqd->cache_hwirq)
> +               return -ENOMEM;
> +
> +       /* Disable all interrupts for initializing */
> +       for (i = 0; i < irqd->num_top; i++) {
> +               for (j = 0; j < mt6358_ints[i].num_int_regs; j++)
> +                       regmap_write(chip->regmap,
> +                                    mt6358_ints[i].en_reg +
> +                                    mt6358_ints[i].en_reg_shift * j, 0);
> +       }
> +
> +       chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
> +                                                irqd->num_pmic_irqs,
> +                                                &mt6358_irq_domain_ops, chip);
> +       if (!chip->irq_domain) {
> +               dev_err(chip->dev, "Could not create IRQ domain\n");
> +               return -ENODEV;
> +       }
> +
> +       ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
> +                                       mt6358_irq_handler, IRQF_ONESHOT,
> +                                       mt6358_irq_chip.name, chip);
> +       if (ret) {
> +               dev_err(chip->dev, "Failed to register IRQ=%d, ret=%d\n",
> +                       chip->irq, ret);
> +               return ret;
> +       }
> +
> +       enable_irq_wake(chip->irq);
> +       return ret;
> +}
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index d2e70d8..b4ad1f8 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -12,13 +12,18 @@
>  #include <linux/regmap.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/mt6323/core.h>
> +#include <linux/mfd/mt6358/core.h>
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6323/registers.h>
> +#include <linux/mfd/mt6358/registers.h>
>  #include <linux/mfd/mt6397/registers.h>
>
>  #define MT6323_RTC_BASE                0x8000
>  #define MT6323_RTC_SIZE                0x40
>
> +#define MT6358_RTC_BASE                0x0588
> +#define MT6358_RTC_SIZE                0x3c
> +
>  #define MT6397_RTC_BASE                0xe000
>  #define MT6397_RTC_SIZE                0x3e
>
> @@ -30,6 +35,11 @@ static const struct resource mt6323_rtc_resources[] = {
>         DEFINE_RES_IRQ(MT6323_IRQ_STATUS_RTC),
>  };
>
> +static const struct resource mt6358_rtc_resources[] = {
> +       DEFINE_RES_MEM(MT6358_RTC_BASE, MT6358_RTC_SIZE),
> +       DEFINE_RES_IRQ(MT6358_IRQ_RTC),
> +};
> +
>  static const struct resource mt6397_rtc_resources[] = {
>         DEFINE_RES_MEM(MT6397_RTC_BASE, MT6397_RTC_SIZE),
>         DEFINE_RES_IRQ(MT6397_IRQ_RTC),
> @@ -74,6 +84,21 @@ static const struct mfd_cell mt6323_devs[] = {
>         },
>  };
>
> +static const struct mfd_cell mt6358_devs[] = {
> +       {
> +               .name = "mt6358-regulator",
> +               .of_compatible = "mediatek,mt6358-regulator"
> +       }, {
> +               .name = "mt6358-rtc",
> +               .num_resources = ARRAY_SIZE(mt6358_rtc_resources),
> +               .resources = mt6358_rtc_resources,
> +               .of_compatible = "mediatek,mt6358-rtc",
> +       }, {
> +               .name = "mt6358-sound",
> +               .of_compatible = "mediatek,mt6358-sound"
> +       },
> +};
> +
>  static const struct mfd_cell mt6397_devs[] = {
>         {
>                 .name = "mt6397-rtc",
> @@ -110,6 +135,11 @@ static const struct chip_data mt6323_core = {
>         .cid_shift = 0,
>  };
>
> +static const struct chip_data mt6358_core = {
> +       .cid_addr = MT6358_SWCID,
> +       .cid_shift = 8,
> +};
> +
>  static const struct chip_data mt6397_core = {
>         .cid_addr = MT6397_CID,
>         .cid_shift = 0,
> @@ -154,19 +184,33 @@ static int mt6397_probe(struct platform_device *pdev)
>         if (pmic->irq <= 0)
>                 return pmic->irq;
>
> -       ret = mt6397_irq_init(pmic);
> -       if (ret)
> -               return ret;
> -
>         switch (pmic->chip_id) {
>         case MT6323_CHIP_ID:
> +               ret = mt6397_irq_init(pmic);
> +               if (ret)
> +                       return ret;
> +
>                 ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
>                                            mt6323_devs, ARRAY_SIZE(mt6323_devs),
>                                            NULL, 0, pmic->irq_domain);
>                 break;
>
> +       case MT6358_CHIP_ID:
> +               ret = mt6358_irq_init(pmic);
> +               if (ret)
> +                       return ret;
> +
> +               ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> +                                          mt6358_devs, ARRAY_SIZE(mt6358_devs),
> +                                          NULL, 0, pmic->irq_domain);
> +               break;
> +
>         case MT6391_CHIP_ID:
>         case MT6397_CHIP_ID:
> +               ret = mt6397_irq_init(pmic);
> +               if (ret)
> +                       return ret;
> +
>                 ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
>                                            mt6397_devs, ARRAY_SIZE(mt6397_devs),
>                                            NULL, 0, pmic->irq_domain);
> @@ -190,6 +234,9 @@ static const struct of_device_id mt6397_of_match[] = {
>                 .compatible = "mediatek,mt6323",
>                 .data = &mt6323_core,
>         }, {
> +               .compatible = "mediatek,mt6358",
> +               .data = &mt6358_core,
> +       }, {
>                 .compatible = "mediatek,mt6397",
>                 .data = &mt6397_core,
>         }, {
> diff --git a/include/linux/mfd/mt6358/core.h b/include/linux/mfd/mt6358/core.h
> new file mode 100644
> index 0000000..a304aae
> --- /dev/null
> +++ b/include/linux/mfd/mt6358/core.h
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef __MFD_MT6358_CORE_H__
> +#define __MFD_MT6358_CORE_H__
> +
> +#define MT6358_REG_WIDTH 16
> +
> +struct irq_top_t {
> +       int hwirq_base;
> +       unsigned int num_int_regs;
> +       unsigned int num_int_bits;
> +       unsigned int en_reg;
> +       unsigned int en_reg_shift;
> +       unsigned int sta_reg;
> +       unsigned int sta_reg_shift;
> +       unsigned int top_offset;
> +};
> +
> +struct pmic_irq_data {
> +       unsigned int num_top;
> +       unsigned int num_pmic_irqs;
> +       unsigned short top_int_status_reg;
> +       bool *enable_hwirq;
> +       bool *cache_hwirq;
> +};
> +
> +enum mt6358_irq_top_status_shift {
> +       MT6358_BUCK_TOP = 0,
> +       MT6358_LDO_TOP,
> +       MT6358_PSC_TOP,
> +       MT6358_SCK_TOP,
> +       MT6358_BM_TOP,
> +       MT6358_HK_TOP,
> +       MT6358_AUD_TOP,
> +       MT6358_MISC_TOP,
> +};
> +
> +enum mt6358_irq_numbers {
> +       MT6358_IRQ_VPROC11_OC = 0,
> +       MT6358_IRQ_VPROC12_OC,
> +       MT6358_IRQ_VCORE_OC,
> +       MT6358_IRQ_VGPU_OC,
> +       MT6358_IRQ_VMODEM_OC,
> +       MT6358_IRQ_VDRAM1_OC,
> +       MT6358_IRQ_VS1_OC,
> +       MT6358_IRQ_VS2_OC,
> +       MT6358_IRQ_VPA_OC,
> +       MT6358_IRQ_VCORE_PREOC,
> +       MT6358_IRQ_VFE28_OC = 16,
> +       MT6358_IRQ_VXO22_OC,
> +       MT6358_IRQ_VRF18_OC,
> +       MT6358_IRQ_VRF12_OC,
> +       MT6358_IRQ_VEFUSE_OC,
> +       MT6358_IRQ_VCN33_OC,
> +       MT6358_IRQ_VCN28_OC,
> +       MT6358_IRQ_VCN18_OC,
> +       MT6358_IRQ_VCAMA1_OC,
> +       MT6358_IRQ_VCAMA2_OC,
> +       MT6358_IRQ_VCAMD_OC,
> +       MT6358_IRQ_VCAMIO_OC,
> +       MT6358_IRQ_VLDO28_OC,
> +       MT6358_IRQ_VA12_OC,
> +       MT6358_IRQ_VAUX18_OC,
> +       MT6358_IRQ_VAUD28_OC,
> +       MT6358_IRQ_VIO28_OC,
> +       MT6358_IRQ_VIO18_OC,
> +       MT6358_IRQ_VSRAM_PROC11_OC,
> +       MT6358_IRQ_VSRAM_PROC12_OC,
> +       MT6358_IRQ_VSRAM_OTHERS_OC,
> +       MT6358_IRQ_VSRAM_GPU_OC,
> +       MT6358_IRQ_VDRAM2_OC,
> +       MT6358_IRQ_VMC_OC,
> +       MT6358_IRQ_VMCH_OC,
> +       MT6358_IRQ_VEMC_OC,
> +       MT6358_IRQ_VSIM1_OC,
> +       MT6358_IRQ_VSIM2_OC,
> +       MT6358_IRQ_VIBR_OC,
> +       MT6358_IRQ_VUSB_OC,
> +       MT6358_IRQ_VBIF28_OC,
> +       MT6358_IRQ_PWRKEY = 48,
> +       MT6358_IRQ_HOMEKEY,
> +       MT6358_IRQ_PWRKEY_R,
> +       MT6358_IRQ_HOMEKEY_R,
> +       MT6358_IRQ_NI_LBAT_INT,
> +       MT6358_IRQ_CHRDET,
> +       MT6358_IRQ_CHRDET_EDGE,
> +       MT6358_IRQ_VCDT_HV_DET,
> +       MT6358_IRQ_RTC = 64,
> +       MT6358_IRQ_FG_BAT0_H = 80,
> +       MT6358_IRQ_FG_BAT0_L,
> +       MT6358_IRQ_FG_CUR_H,
> +       MT6358_IRQ_FG_CUR_L,
> +       MT6358_IRQ_FG_ZCV,
> +       MT6358_IRQ_FG_BAT1_H,
> +       MT6358_IRQ_FG_BAT1_L,
> +       MT6358_IRQ_FG_N_CHARGE_L,
> +       MT6358_IRQ_FG_IAVG_H,
> +       MT6358_IRQ_FG_IAVG_L,
> +       MT6358_IRQ_FG_TIME_H,
> +       MT6358_IRQ_FG_DISCHARGE,
> +       MT6358_IRQ_FG_CHARGE,
> +       MT6358_IRQ_BATON_LV = 96,
> +       MT6358_IRQ_BATON_HT,
> +       MT6358_IRQ_BATON_BAT_IN,
> +       MT6358_IRQ_BATON_BAT_OUT,
> +       MT6358_IRQ_BIF,
> +       MT6358_IRQ_BAT_H = 112,
> +       MT6358_IRQ_BAT_L,
> +       MT6358_IRQ_BAT2_H,
> +       MT6358_IRQ_BAT2_L,
> +       MT6358_IRQ_BAT_TEMP_H,
> +       MT6358_IRQ_BAT_TEMP_L,
> +       MT6358_IRQ_AUXADC_IMP,
> +       MT6358_IRQ_NAG_C_DLTV,
> +       MT6358_IRQ_AUDIO = 128,
> +       MT6358_IRQ_ACCDET = 133,
> +       MT6358_IRQ_ACCDET_EINT0,
> +       MT6358_IRQ_ACCDET_EINT1,
> +       MT6358_IRQ_SPI_CMD_ALERT = 144,
> +       MT6358_IRQ_NR,
> +};
> +
> +#define MT6358_IRQ_BUCK_BASE MT6358_IRQ_VPROC11_OC
> +#define MT6358_IRQ_LDO_BASE MT6358_IRQ_VFE28_OC
> +#define MT6358_IRQ_PSC_BASE MT6358_IRQ_PWRKEY
> +#define MT6358_IRQ_SCK_BASE MT6358_IRQ_RTC
> +#define MT6358_IRQ_BM_BASE MT6358_IRQ_FG_BAT0_H
> +#define MT6358_IRQ_HK_BASE MT6358_IRQ_BAT_H
> +#define MT6358_IRQ_AUD_BASE MT6358_IRQ_AUDIO
> +#define MT6358_IRQ_MISC_BASE MT6358_IRQ_SPI_CMD_ALERT
> +
> +#define MT6358_IRQ_BUCK_BITS (MT6358_IRQ_VCORE_PREOC - MT6358_IRQ_BUCK_BASE + 1)
> +#define MT6358_IRQ_LDO_BITS (MT6358_IRQ_VBIF28_OC - MT6358_IRQ_LDO_BASE + 1)
> +#define MT6358_IRQ_PSC_BITS (MT6358_IRQ_VCDT_HV_DET - MT6358_IRQ_PSC_BASE + 1)
> +#define MT6358_IRQ_SCK_BITS (MT6358_IRQ_RTC - MT6358_IRQ_SCK_BASE + 1)
> +#define MT6358_IRQ_BM_BITS (MT6358_IRQ_BIF - MT6358_IRQ_BM_BASE + 1)
> +#define MT6358_IRQ_HK_BITS (MT6358_IRQ_NAG_C_DLTV - MT6358_IRQ_HK_BASE + 1)
> +#define MT6358_IRQ_AUD_BITS (MT6358_IRQ_ACCDET_EINT1 - MT6358_IRQ_AUD_BASE + 1)
> +#define MT6358_IRQ_MISC_BITS   \
> +       (MT6358_IRQ_SPI_CMD_ALERT - MT6358_IRQ_MISC_BASE + 1)
> +
> +#define MT6358_TOP_GEN(sp)     \
> +{      \
> +       .hwirq_base = MT6358_IRQ_##sp##_BASE,   \
> +       .num_int_regs = \
> +               ((MT6358_IRQ_##sp##_BITS - 1) / MT6358_REG_WIDTH) + 1,  \
> +       .num_int_bits = MT6358_IRQ_##sp##_BITS, \
> +       .en_reg = MT6358_##sp##_TOP_INT_CON0,   \
> +       .en_reg_shift = 0x6,    \
> +       .sta_reg = MT6358_##sp##_TOP_INT_STATUS0,       \
> +       .sta_reg_shift = 0x2,   \
> +       .top_offset = MT6358_##sp##_TOP,        \
> +}
> +
> +#endif /* __MFD_MT6358_CORE_H__ */
> diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
> new file mode 100644
> index 0000000..ff5645b
> --- /dev/null
> +++ b/include/linux/mfd/mt6358/registers.h
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef __MFD_MT6358_REGISTERS_H__
> +#define __MFD_MT6358_REGISTERS_H__
> +
> +/* PMIC Registers */
> +#define MT6358_SWCID                          0xa
> +#define MT6358_MISC_TOP_INT_CON0              0x188
> +#define MT6358_MISC_TOP_INT_STATUS0           0x194
> +#define MT6358_TOP_INT_STATUS0                0x19e
> +#define MT6358_SCK_TOP_INT_CON0               0x52e
> +#define MT6358_SCK_TOP_INT_STATUS0            0x53a
> +#define MT6358_EOSC_CALI_CON0                 0x540
> +#define MT6358_EOSC_CALI_CON1                 0x542
> +#define MT6358_RTC_MIX_CON0                   0x544
> +#define MT6358_RTC_MIX_CON1                   0x546
> +#define MT6358_RTC_MIX_CON2                   0x548
> +#define MT6358_RTC_DSN_ID                     0x580
> +#define MT6358_RTC_DSN_REV0                   0x582
> +#define MT6358_RTC_DBI                        0x584
> +#define MT6358_RTC_DXI                        0x586
> +#define MT6358_RTC_BBPU                       0x588
> +#define MT6358_RTC_IRQ_STA                    0x58a
> +#define MT6358_RTC_IRQ_EN                     0x58c
> +#define MT6358_RTC_CII_EN                     0x58e
> +#define MT6358_RTC_AL_MASK                    0x590
> +#define MT6358_RTC_TC_SEC                     0x592
> +#define MT6358_RTC_TC_MIN                     0x594
> +#define MT6358_RTC_TC_HOU                     0x596
> +#define MT6358_RTC_TC_DOM                     0x598
> +#define MT6358_RTC_TC_DOW                     0x59a
> +#define MT6358_RTC_TC_MTH                     0x59c
> +#define MT6358_RTC_TC_YEA                     0x59e
> +#define MT6358_RTC_AL_SEC                     0x5a0
> +#define MT6358_RTC_AL_MIN                     0x5a2
> +#define MT6358_RTC_AL_HOU                     0x5a4
> +#define MT6358_RTC_AL_DOM                     0x5a6
> +#define MT6358_RTC_AL_DOW                     0x5a8
> +#define MT6358_RTC_AL_MTH                     0x5aa
> +#define MT6358_RTC_AL_YEA                     0x5ac
> +#define MT6358_RTC_OSC32CON                   0x5ae
> +#define MT6358_RTC_POWERKEY1                  0x5b0
> +#define MT6358_RTC_POWERKEY2                  0x5b2
> +#define MT6358_RTC_PDN1                       0x5b4
> +#define MT6358_RTC_PDN2                       0x5b6
> +#define MT6358_RTC_SPAR0                      0x5b8
> +#define MT6358_RTC_SPAR1                      0x5ba
> +#define MT6358_RTC_PROT                       0x5bc
> +#define MT6358_RTC_DIFF                       0x5be
> +#define MT6358_RTC_CALI                       0x5c0
> +#define MT6358_RTC_WRTGR                      0x5c2
> +#define MT6358_RTC_CON                        0x5c4
> +#define MT6358_RTC_SEC_CTRL                   0x5c6
> +#define MT6358_RTC_INT_CNT                    0x5c8
> +#define MT6358_RTC_SEC_DAT0                   0x5ca
> +#define MT6358_RTC_SEC_DAT1                   0x5cc
> +#define MT6358_RTC_SEC_DAT2                   0x5ce
> +#define MT6358_RTC_SEC_DSN_ID                 0x600
> +#define MT6358_RTC_SEC_DSN_REV0               0x602
> +#define MT6358_RTC_SEC_DBI                    0x604
> +#define MT6358_RTC_SEC_DXI                    0x606
> +#define MT6358_RTC_TC_SEC_SEC                 0x608
> +#define MT6358_RTC_TC_MIN_SEC                 0x60a
> +#define MT6358_RTC_TC_HOU_SEC                 0x60c
> +#define MT6358_RTC_TC_DOM_SEC                 0x60e
> +#define MT6358_RTC_TC_DOW_SEC                 0x610
> +#define MT6358_RTC_TC_MTH_SEC                 0x612
> +#define MT6358_RTC_TC_YEA_SEC                 0x614
> +#define MT6358_RTC_SEC_CK_PDN                 0x616
> +#define MT6358_RTC_SEC_WRTGR                  0x618
> +#define MT6358_PSC_TOP_INT_CON0               0x910
> +#define MT6358_PSC_TOP_INT_STATUS0            0x91c
> +#define MT6358_BM_TOP_INT_CON0                0xc32
> +#define MT6358_BM_TOP_INT_CON1                0xc38
> +#define MT6358_BM_TOP_INT_STATUS0             0xc4a
> +#define MT6358_BM_TOP_INT_STATUS1             0xc4c
> +#define MT6358_HK_TOP_INT_CON0                0xf92
> +#define MT6358_HK_TOP_INT_STATUS0             0xf9e
> +#define MT6358_BUCK_TOP_INT_CON0              0x1318
> +#define MT6358_BUCK_TOP_INT_STATUS0           0x1324
> +#define MT6358_BUCK_VPROC11_CON0              0x1388
> +#define MT6358_BUCK_VPROC11_DBG0              0x139e
> +#define MT6358_BUCK_VPROC11_DBG1              0x13a0
> +#define MT6358_BUCK_VPROC11_ELR0              0x13a6
> +#define MT6358_BUCK_VPROC12_CON0              0x1408
> +#define MT6358_BUCK_VPROC12_DBG0              0x141e
> +#define MT6358_BUCK_VPROC12_DBG1              0x1420
> +#define MT6358_BUCK_VPROC12_ELR0              0x1426
> +#define MT6358_BUCK_VCORE_CON0                0x1488
> +#define MT6358_BUCK_VCORE_DBG0                0x149e
> +#define MT6358_BUCK_VCORE_DBG1                0x14a0
> +#define MT6358_BUCK_VCORE_ELR0                0x14aa
> +#define MT6358_BUCK_VGPU_CON0                 0x1508
> +#define MT6358_BUCK_VGPU_DBG0                 0x151e
> +#define MT6358_BUCK_VGPU_DBG1                 0x1520
> +#define MT6358_BUCK_VGPU_ELR0                 0x1526
> +#define MT6358_BUCK_VMODEM_CON0               0x1588
> +#define MT6358_BUCK_VMODEM_DBG0               0x159e
> +#define MT6358_BUCK_VMODEM_DBG1               0x15a0
> +#define MT6358_BUCK_VMODEM_ELR0               0x15a6
> +#define MT6358_BUCK_VDRAM1_CON0               0x1608
> +#define MT6358_BUCK_VDRAM1_DBG0               0x161e
> +#define MT6358_BUCK_VDRAM1_DBG1               0x1620
> +#define MT6358_BUCK_VDRAM1_ELR0               0x1626
> +#define MT6358_BUCK_VS1_CON0                  0x1688
> +#define MT6358_BUCK_VS1_DBG0                  0x169e
> +#define MT6358_BUCK_VS1_DBG1                  0x16a0
> +#define MT6358_BUCK_VS1_ELR0                  0x16ae
> +#define MT6358_BUCK_VS2_CON0                  0x1708
> +#define MT6358_BUCK_VS2_DBG0                  0x171e
> +#define MT6358_BUCK_VS2_DBG1                  0x1720
> +#define MT6358_BUCK_VS2_ELR0                  0x172e
> +#define MT6358_BUCK_VPA_CON0                  0x1788
> +#define MT6358_BUCK_VPA_CON1                  0x178a
> +#define MT6358_BUCK_VPA_ELR0                  MT6358_BUCK_VPA_CON1
> +#define MT6358_BUCK_VPA_DBG0                  0x1792
> +#define MT6358_BUCK_VPA_DBG1                  0x1794
> +#define MT6358_VPROC_ANA_CON0                 0x180c
> +#define MT6358_VCORE_VGPU_ANA_CON0            0x1828
> +#define MT6358_VMODEM_ANA_CON0                0x1888
> +#define MT6358_VDRAM1_ANA_CON0                0x1896
> +#define MT6358_VS1_ANA_CON0                   0x18a2
> +#define MT6358_VS2_ANA_CON0                   0x18ae
> +#define MT6358_VPA_ANA_CON0                   0x18ba
> +#define MT6358_LDO_TOP_INT_CON0               0x1a50
> +#define MT6358_LDO_TOP_INT_CON1               0x1a56
> +#define MT6358_LDO_TOP_INT_STATUS0            0x1a68
> +#define MT6358_LDO_TOP_INT_STATUS1            0x1a6a
> +#define MT6358_LDO_VXO22_CON0                 0x1a88
> +#define MT6358_LDO_VXO22_CON1                 0x1a96
> +#define MT6358_LDO_VA12_CON0                  0x1a9c
> +#define MT6358_LDO_VA12_CON1                  0x1aaa
> +#define MT6358_LDO_VAUX18_CON0                0x1ab0
> +#define MT6358_LDO_VAUX18_CON1                0x1abe
> +#define MT6358_LDO_VAUD28_CON0                0x1ac4
> +#define MT6358_LDO_VAUD28_CON1                0x1ad2
> +#define MT6358_LDO_VIO28_CON0                 0x1ad8
> +#define MT6358_LDO_VIO28_CON1                 0x1ae6
> +#define MT6358_LDO_VIO18_CON0                 0x1aec
> +#define MT6358_LDO_VIO18_CON1                 0x1afa
> +#define MT6358_LDO_VDRAM2_CON0                0x1b08
> +#define MT6358_LDO_VDRAM2_CON1                0x1b16
> +#define MT6358_LDO_VEMC_CON0                  0x1b1c
> +#define MT6358_LDO_VEMC_CON1                  0x1b2a
> +#define MT6358_LDO_VUSB_CON0_0                0x1b30
> +#define MT6358_LDO_VUSB_CON1                  0x1b40
> +#define MT6358_LDO_VSRAM_PROC11_CON0          0x1b46
> +#define MT6358_LDO_VSRAM_PROC11_DBG0          0x1b60
> +#define MT6358_LDO_VSRAM_PROC11_DBG1          0x1b62
> +#define MT6358_LDO_VSRAM_PROC11_TRACKING_CON0 0x1b64
> +#define MT6358_LDO_VSRAM_PROC11_TRACKING_CON1 0x1b66
> +#define MT6358_LDO_VSRAM_PROC11_TRACKING_CON2 0x1b68
> +#define MT6358_LDO_VSRAM_PROC11_TRACKING_CON3 0x1b6a
> +#define MT6358_LDO_VSRAM_PROC12_TRACKING_CON0 0x1b6c
> +#define MT6358_LDO_VSRAM_PROC12_TRACKING_CON1 0x1b6e
> +#define MT6358_LDO_VSRAM_PROC12_TRACKING_CON2 0x1b70
> +#define MT6358_LDO_VSRAM_PROC12_TRACKING_CON3 0x1b72
> +#define MT6358_LDO_VSRAM_WAKEUP_CON0          0x1b74
> +#define MT6358_LDO_GON1_ELR_NUM               0x1b76
> +#define MT6358_LDO_VDRAM2_ELR0                0x1b78
> +#define MT6358_LDO_VSRAM_PROC12_CON0          0x1b88
> +#define MT6358_LDO_VSRAM_PROC12_DBG0          0x1ba2
> +#define MT6358_LDO_VSRAM_PROC12_DBG1          0x1ba4
> +#define MT6358_LDO_VSRAM_OTHERS_CON0          0x1ba6
> +#define MT6358_LDO_VSRAM_OTHERS_DBG0          0x1bc0
> +#define MT6358_LDO_VSRAM_OTHERS_DBG1          0x1bc2
> +#define MT6358_LDO_VSRAM_GPU_CON0             0x1bc8
> +#define MT6358_LDO_VSRAM_GPU_DBG0             0x1be2
> +#define MT6358_LDO_VSRAM_GPU_DBG1             0x1be4
> +#define MT6358_LDO_VSRAM_CON0                 0x1bee
> +#define MT6358_LDO_VSRAM_CON1                 0x1bf0
> +#define MT6358_LDO_VSRAM_CON2                 0x1bf2
> +#define MT6358_LDO_VSRAM_CON3                 0x1bf4
> +#define MT6358_LDO_VFE28_CON0                 0x1c08
> +#define MT6358_LDO_VFE28_CON1                 0x1c16
> +#define MT6358_LDO_VFE28_CON2                 0x1c18
> +#define MT6358_LDO_VFE28_CON3                 0x1c1a
> +#define MT6358_LDO_VRF18_CON0                 0x1c1c
> +#define MT6358_LDO_VRF18_CON1                 0x1c2a
> +#define MT6358_LDO_VRF18_CON2                 0x1c2c
> +#define MT6358_LDO_VRF18_CON3                 0x1c2e
> +#define MT6358_LDO_VRF12_CON0                 0x1c30
> +#define MT6358_LDO_VRF12_CON1                 0x1c3e
> +#define MT6358_LDO_VRF12_CON2                 0x1c40
> +#define MT6358_LDO_VRF12_CON3                 0x1c42
> +#define MT6358_LDO_VEFUSE_CON0                0x1c44
> +#define MT6358_LDO_VEFUSE_CON1                0x1c52
> +#define MT6358_LDO_VEFUSE_CON2                0x1c54
> +#define MT6358_LDO_VEFUSE_CON3                0x1c56
> +#define MT6358_LDO_VCN18_CON0                 0x1c58
> +#define MT6358_LDO_VCN18_CON1                 0x1c66
> +#define MT6358_LDO_VCN18_CON2                 0x1c68
> +#define MT6358_LDO_VCN18_CON3                 0x1c6a
> +#define MT6358_LDO_VCAMA1_CON0                0x1c6c
> +#define MT6358_LDO_VCAMA1_CON1                0x1c7a
> +#define MT6358_LDO_VCAMA1_CON2                0x1c7c
> +#define MT6358_LDO_VCAMA1_CON3                0x1c7e
> +#define MT6358_LDO_VCAMA2_CON0                0x1c88
> +#define MT6358_LDO_VCAMA2_CON1                0x1c96
> +#define MT6358_LDO_VCAMA2_CON2                0x1c98
> +#define MT6358_LDO_VCAMA2_CON3                0x1c9a
> +#define MT6358_LDO_VCAMD_CON0                 0x1c9c
> +#define MT6358_LDO_VCAMD_CON1                 0x1caa
> +#define MT6358_LDO_VCAMD_CON2                 0x1cac
> +#define MT6358_LDO_VCAMD_CON3                 0x1cae
> +#define MT6358_LDO_VCAMIO_CON0                0x1cb0
> +#define MT6358_LDO_VCAMIO_CON1                0x1cbe
> +#define MT6358_LDO_VCAMIO_CON2                0x1cc0
> +#define MT6358_LDO_VCAMIO_CON3                0x1cc2
> +#define MT6358_LDO_VMC_CON0                   0x1cc4
> +#define MT6358_LDO_VMC_CON1                   0x1cd2
> +#define MT6358_LDO_VMC_CON2                   0x1cd4
> +#define MT6358_LDO_VMC_CON3                   0x1cd6
> +#define MT6358_LDO_VMCH_CON0                  0x1cd8
> +#define MT6358_LDO_VMCH_CON1                  0x1ce6
> +#define MT6358_LDO_VMCH_CON2                  0x1ce8
> +#define MT6358_LDO_VMCH_CON3                  0x1cea
> +#define MT6358_LDO_VIBR_CON0                  0x1d08
> +#define MT6358_LDO_VIBR_CON1                  0x1d16
> +#define MT6358_LDO_VIBR_CON2                  0x1d18
> +#define MT6358_LDO_VIBR_CON3                  0x1d1a
> +#define MT6358_LDO_VCN33_CON0_0               0x1d1c
> +#define MT6358_LDO_VCN33_CON0_1               0x1d2a
> +#define MT6358_LDO_VCN33_CON1                 0x1d2c
> +#define MT6358_LDO_VCN33_BT_CON1              MT6358_LDO_VCN33_CON1
> +#define MT6358_LDO_VCN33_WIFI_CON1            MT6358_LDO_VCN33_CON1
> +#define MT6358_LDO_VCN33_CON2                 0x1d2e
> +#define MT6358_LDO_VCN33_CON3                 0x1d30
> +#define MT6358_LDO_VLDO28_CON0_0              0x1d32
> +#define MT6358_LDO_VLDO28_CON0_1              0x1d40
> +#define MT6358_LDO_VLDO28_CON1                0x1d42
> +#define MT6358_LDO_VLDO28_CON2                0x1d44
> +#define MT6358_LDO_VLDO28_CON3                0x1d46
> +#define MT6358_LDO_VSIM1_CON0                 0x1d48
> +#define MT6358_LDO_VSIM1_CON1                 0x1d56
> +#define MT6358_LDO_VSIM1_CON2                 0x1d58
> +#define MT6358_LDO_VSIM1_CON3                 0x1d5a
> +#define MT6358_LDO_VSIM2_CON0                 0x1d5c
> +#define MT6358_LDO_VSIM2_CON1                 0x1d6a
> +#define MT6358_LDO_VSIM2_CON2                 0x1d6c
> +#define MT6358_LDO_VSIM2_CON3                 0x1d6e
> +#define MT6358_LDO_VCN28_CON0                 0x1d88
> +#define MT6358_LDO_VCN28_CON1                 0x1d96
> +#define MT6358_LDO_VCN28_CON2                 0x1d98
> +#define MT6358_LDO_VCN28_CON3                 0x1d9a
> +#define MT6358_VRTC28_CON0                    0x1d9c
> +#define MT6358_LDO_VBIF28_CON0                0x1d9e
> +#define MT6358_LDO_VBIF28_CON1                0x1dac
> +#define MT6358_LDO_VBIF28_CON2                0x1dae
> +#define MT6358_LDO_VBIF28_CON3                0x1db0
> +#define MT6358_VCAMA1_ANA_CON0                0x1e08
> +#define MT6358_VCAMA2_ANA_CON0                0x1e0c
> +#define MT6358_VCN33_ANA_CON0                 0x1e28
> +#define MT6358_VSIM1_ANA_CON0                 0x1e2c
> +#define MT6358_VSIM2_ANA_CON0                 0x1e30
> +#define MT6358_VUSB_ANA_CON0                  0x1e34
> +#define MT6358_VEMC_ANA_CON0                  0x1e38
> +#define MT6358_VLDO28_ANA_CON0                0x1e3c
> +#define MT6358_VIO28_ANA_CON0                 0x1e40
> +#define MT6358_VIBR_ANA_CON0                  0x1e44
> +#define MT6358_VMCH_ANA_CON0                  0x1e48
> +#define MT6358_VMC_ANA_CON0                   0x1e4c
> +#define MT6358_VRF18_ANA_CON0                 0x1e88
> +#define MT6358_VCN18_ANA_CON0                 0x1e8c
> +#define MT6358_VCAMIO_ANA_CON0                0x1e90
> +#define MT6358_VIO18_ANA_CON0                 0x1e94
> +#define MT6358_VEFUSE_ANA_CON0                0x1e98
> +#define MT6358_VRF12_ANA_CON0                 0x1e9c
> +#define MT6358_VSRAM_PROC11_ANA_CON0          0x1ea0
> +#define MT6358_VSRAM_PROC12_ANA_CON0          0x1ea4
> +#define MT6358_VSRAM_OTHERS_ANA_CON0          0x1ea6
> +#define MT6358_VSRAM_GPU_ANA_CON0             0x1ea8
> +#define MT6358_VDRAM2_ANA_CON0                0x1eaa
> +#define MT6358_VCAMD_ANA_CON0                 0x1eae
> +#define MT6358_VA12_ANA_CON0                  0x1eb2
> +#define MT6358_AUD_TOP_INT_CON0               0x2228
> +#define MT6358_AUD_TOP_INT_STATUS0            0x2234
> +
> +#endif /* __MFD_MT6358_REGISTERS_H__ */
> diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
> index b81d333..9492685 100644
> --- a/include/linux/mfd/mt6397/core.h
> +++ b/include/linux/mfd/mt6397/core.h
> @@ -12,6 +12,7 @@
>
>  enum chip_id {
>         MT6323_CHIP_ID = 0x23,
> +       MT6358_CHIP_ID = 0x58,
>         MT6391_CHIP_ID = 0x91,
>         MT6397_CHIP_ID = 0x97,
>  };
> @@ -65,8 +66,10 @@ struct mt6397_chip {
>         u16 int_con[2];
>         u16 int_status[2];
>         u16 chip_id;
> +       void *irq_data;
>  };
>
> +int mt6358_irq_init(struct mt6397_chip *chip);
>  int mt6397_irq_init(struct mt6397_chip *chip);
>
>  #endif /* __MFD_MT6397_CORE_H__ */
> --
> 2.6.4

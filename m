Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DABC158D5
	for <lists+linux-rtc@lfdr.de>; Tue,  7 May 2019 07:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfEGFRC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 7 May 2019 01:17:02 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45354 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfEGFRC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 7 May 2019 01:17:02 -0400
Received: by mail-qt1-f196.google.com with SMTP id t1so621623qtc.12
        for <linux-rtc@vger.kernel.org>; Mon, 06 May 2019 22:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PnRZci9BrBwrlbT3SC42Kf4W6va6zoVHliMvmYjSekw=;
        b=R4gWYUELHr/a9/HjmfqXKJAXVjIuhPoYDw7EqSogjZVsBx0V99F9ybsk5EF5O97UOw
         NNN3oQsKH4/kuW+AjpMhvRT7UaSOOxbDgaeBWl2nESNlKc9PAg8LxafcE981cZ/A+HtE
         ODYpJOhtMlFWd4MTZd0IxbO9deUY6o5TpxpMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PnRZci9BrBwrlbT3SC42Kf4W6va6zoVHliMvmYjSekw=;
        b=XJiXrYwtWFxown1ZQJhwG2mHWUXN7GeDnRqwOsvYcM75ZBBRnODk6LmHAAa+VGxrCR
         pdyj24t8J2rKn3dLLxJbykMD7C/Hh8DJznbqBUYMjMiBTt+6E9gww37MkKiph+mGiAaQ
         J9UGZsLn5OnLSO4MdJpCoLLDKuNySrUPbz9XG9/ms1MbasUnHI14y9kV77W13WfyZ6ew
         /tt1Fyvx2IcFxLOkvDUPMGOfgR8ZBvpicfnLq80x/eg4vDowPgmFZVQu2JOuwtU7yGAa
         tFswPDhHiGBLmERVfsxXE34GsdO/3n6ZxShYXQAdOaPL6KZ+uEqhw4BF52zsq8GFtWZg
         8BZA==
X-Gm-Message-State: APjAAAWuO8ZAtTpKxUWIqhnF2YFa9sdCVOQcchZkmrIjyLFZMtQwaF2F
        VU/OyZT34Uv9bAkwcyJ3EGtxI0TIsM93oFir594/Rw==
X-Google-Smtp-Source: APXvYqwaItHnmaJJPOCKjz4VWWesl7CeAKkW4A+1GsYqHjficehPIvxQklY0f8QFE1b9qqwkgBCw9dFVC2spSXyszZ0=
X-Received: by 2002:aed:3fad:: with SMTP id s42mr24926645qth.335.1557206221012;
 Mon, 06 May 2019 22:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190503093117.54830-1-hsin-hsiung.wang@mediatek.com>
 <20190503093117.54830-3-hsin-hsiung.wang@mediatek.com> <CANMq1KCGudrXDB-A=1VZ5PbA0gS49S5M-On4Tbn8OW+615joSQ@mail.gmail.com>
In-Reply-To: <CANMq1KCGudrXDB-A=1VZ5PbA0gS49S5M-On4Tbn8OW+615joSQ@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 7 May 2019 14:16:50 +0900
Message-ID: <CANMq1KBn+KQgLHRCj66WYO0x_x9zTCf_pfPj8U9TMkBvWYXcKg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] mfd: mt6397: extract irq related code from core driver
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        linux-rtc@vger.kernel.org, Claire Chang <tientzu@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, May 7, 2019 at 2:11 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Fri, May 3, 2019 at 6:33 PM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
> >
> > In order to support different types of irq design, we decide to add
> > separate irq drivers for different design and keep mt6397 mfd core
> > simple and reusable to all generations of PMICs so far.
> >
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/mfd/Makefile            |   3 +-
> >  drivers/mfd/mt6397-core.c       | 146 --------------------------
> >  drivers/mfd/mt6397-irq.c        | 181 ++++++++++++++++++++++++++++++++
> >  include/linux/mfd/mt6397/core.h |   9 ++
> >  4 files changed, 192 insertions(+), 147 deletions(-)
> >  create mode 100644 drivers/mfd/mt6397-irq.c
> >
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index b4569ed7f3f3..ab1e228b5a2f 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -234,7 +234,8 @@ obj-$(CONFIG_INTEL_SOC_PMIC)        += intel-soc-pmic.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)     += intel_soc_pmic_bxtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     += intel_soc_pmic_chtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  += intel_soc_pmic_chtdc_ti.o
> > -obj-$(CONFIG_MFD_MT6397)       += mt6397-core.o
> > +mt6397-objs    := mt6397-core.o mt6397-irq.o
> > +obj-$(CONFIG_MFD_MT6397)       += mt6397.o
> >
> >  obj-$(CONFIG_MFD_ALTERA_A10SR) += altera-a10sr.o
> >  obj-$(CONFIG_MFD_STPMIC1)      += stpmic1.o
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index c9393bc86743..c80f0449fe7e 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -26,10 +26,6 @@
> >  #define MT6397_RTC_BASE                0xe000
> >  #define MT6397_RTC_SIZE                0x3e
> >
> > -#define MT6323_CHIP_ID         0x23
> > -#define MT6391_CHIP_ID         0x91
> > -#define MT6397_CHIP_ID         0x97
> > -
> >  static const struct resource mt6397_rtc_resources[] = {
> >         {
> >                 .start = MT6397_RTC_BASE,
> > @@ -94,148 +90,6 @@ static const struct mfd_cell mt6397_devs[] = {
> >         }
> >  };
> >
> > -static void mt6397_irq_lock(struct irq_data *data)
> > -{
> > -       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> > -
> > -       mutex_lock(&mt6397->irqlock);
> > -}
> > -
> > -static void mt6397_irq_sync_unlock(struct irq_data *data)
> > -{
> > -       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> > -
> > -       regmap_write(mt6397->regmap, mt6397->int_con[0],
> > -                    mt6397->irq_masks_cur[0]);
> > -       regmap_write(mt6397->regmap, mt6397->int_con[1],
> > -                    mt6397->irq_masks_cur[1]);
> > -
> > -       mutex_unlock(&mt6397->irqlock);
> > -}
> > -
> > -static void mt6397_irq_disable(struct irq_data *data)
> > -{
> > -       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> > -       int shift = data->hwirq & 0xf;
> > -       int reg = data->hwirq >> 4;
> > -
> > -       mt6397->irq_masks_cur[reg] &= ~BIT(shift);
> > -}
> > -
> > -static void mt6397_irq_enable(struct irq_data *data)
> > -{
> > -       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> > -       int shift = data->hwirq & 0xf;
> > -       int reg = data->hwirq >> 4;
> > -
> > -       mt6397->irq_masks_cur[reg] |= BIT(shift);
> > -}
> > -
> > -#ifdef CONFIG_PM_SLEEP
> > -static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
> > -{
> > -       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
> > -       int shift = irq_data->hwirq & 0xf;
> > -       int reg = irq_data->hwirq >> 4;
> > -
> > -       if (on)
> > -               mt6397->wake_mask[reg] |= BIT(shift);
> > -       else
> > -               mt6397->wake_mask[reg] &= ~BIT(shift);
> > -
> > -       return 0;
> > -}
> > -#else
> > -#define mt6397_irq_set_wake NULL
> > -#endif
> > -
> > -static struct irq_chip mt6397_irq_chip = {
> > -       .name = "mt6397-irq",
> > -       .irq_bus_lock = mt6397_irq_lock,
> > -       .irq_bus_sync_unlock = mt6397_irq_sync_unlock,
> > -       .irq_enable = mt6397_irq_enable,
> > -       .irq_disable = mt6397_irq_disable,
> > -       .irq_set_wake = mt6397_irq_set_wake,
> > -};
> > -
> > -static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
> > -               int irqbase)
> > -{
> > -       unsigned int status;
> > -       int i, irq, ret;
> > -
> > -       ret = regmap_read(mt6397->regmap, reg, &status);
> > -       if (ret) {
> > -               dev_err(mt6397->dev, "Failed to read irq status: %d\n", ret);
> > -               return;
> > -       }
> > -
> > -       for (i = 0; i < 16; i++) {
> > -               if (status & BIT(i)) {
> > -                       irq = irq_find_mapping(mt6397->irq_domain, irqbase + i);
> > -                       if (irq)
> > -                               handle_nested_irq(irq);
> > -               }
> > -       }
> > -
> > -       regmap_write(mt6397->regmap, reg, status);
> > -}
> > -
> > -static irqreturn_t mt6397_irq_thread(int irq, void *data)
> > -{
> > -       struct mt6397_chip *mt6397 = data;
> > -
> > -       mt6397_irq_handle_reg(mt6397, mt6397->int_status[0], 0);
> > -       mt6397_irq_handle_reg(mt6397, mt6397->int_status[1], 16);
> > -
> > -       return IRQ_HANDLED;
> > -}
> > -
> > -static int mt6397_irq_domain_map(struct irq_domain *d, unsigned int irq,
> > -                                       irq_hw_number_t hw)
> > -{
> > -       struct mt6397_chip *mt6397 = d->host_data;
> > -
> > -       irq_set_chip_data(irq, mt6397);
> > -       irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
> > -       irq_set_nested_thread(irq, 1);
> > -       irq_set_noprobe(irq);
> > -
> > -       return 0;
> > -}
> > -
> > -static const struct irq_domain_ops mt6397_irq_domain_ops = {
> > -       .map = mt6397_irq_domain_map,
> > -};
> > -
> > -static int mt6397_irq_init(struct mt6397_chip *mt6397)
> > -{
> > -       int ret;
> > -
> > -       mutex_init(&mt6397->irqlock);
> > -
> > -       /* Mask all interrupt sources */
> > -       regmap_write(mt6397->regmap, mt6397->int_con[0], 0x0);
> > -       regmap_write(mt6397->regmap, mt6397->int_con[1], 0x0);
> > -
> > -       mt6397->irq_domain = irq_domain_add_linear(mt6397->dev->of_node,
> > -               MT6397_IRQ_NR, &mt6397_irq_domain_ops, mt6397);
> > -       if (!mt6397->irq_domain) {
> > -               dev_err(mt6397->dev, "could not create irq domain\n");
> > -               return -ENOMEM;
> > -       }
> > -
> > -       ret = devm_request_threaded_irq(mt6397->dev, mt6397->irq, NULL,
> > -               mt6397_irq_thread, IRQF_ONESHOT, "mt6397-pmic", mt6397);
> > -       if (ret) {
> > -               dev_err(mt6397->dev, "failed to register irq=%d; err: %d\n",
> > -                       mt6397->irq, ret);
> > -               return ret;
> > -       }
> > -
> > -       return 0;
> > -}
> > -
> >  #ifdef CONFIG_PM_SLEEP
> >  static int mt6397_irq_suspend(struct device *dev)
> >  {
> > diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> > new file mode 100644
> > index 000000000000..b2d3ce1f3115
> > --- /dev/null
> > +++ b/drivers/mfd/mt6397-irq.c
> > @@ -0,0 +1,181 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (c) 2019 MediaTek Inc.
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/mt6323/core.h>
> > +#include <linux/mfd/mt6323/registers.h>
> > +#include <linux/mfd/mt6397/core.h>
> > +#include <linux/mfd/mt6397/registers.h>
> > +
> > +static void mt6397_irq_lock(struct irq_data *data)
> > +{
> > +       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> > +
> > +       mutex_lock(&mt6397->irqlock);
> > +}
> > +
> > +static void mt6397_irq_sync_unlock(struct irq_data *data)
> > +{
> > +       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> > +
> > +       regmap_write(mt6397->regmap, mt6397->int_con[0],
> > +                    mt6397->irq_masks_cur[0]);
> > +       regmap_write(mt6397->regmap, mt6397->int_con[1],
> > +                    mt6397->irq_masks_cur[1]);
> > +
> > +       mutex_unlock(&mt6397->irqlock);
> > +}
> > +
> > +static void mt6397_irq_disable(struct irq_data *data)
> > +{
> > +       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> > +       int shift = data->hwirq & 0xf;
> > +       int reg = data->hwirq >> 4;
> > +
> > +       mt6397->irq_masks_cur[reg] &= ~BIT(shift);
> > +}
> > +
> > +static void mt6397_irq_enable(struct irq_data *data)
> > +{
> > +       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> > +       int shift = data->hwirq & 0xf;
> > +       int reg = data->hwirq >> 4;
> > +
> > +       mt6397->irq_masks_cur[reg] |= BIT(shift);
> > +}
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
> > +{
> > +       struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
> > +       int shift = irq_data->hwirq & 0xf;
> > +       int reg = irq_data->hwirq >> 4;
> > +
> > +       if (on)
> > +               mt6397->wake_mask[reg] |= BIT(shift);
> > +       else
> > +               mt6397->wake_mask[reg] &= ~BIT(shift);
> > +
> > +       return 0;
> > +}
> > +#else
> > +#define mt6397_irq_set_wake NULL
> > +#endif
> > +
> > +static struct irq_chip mt6397_irq_chip = {
> > +       .name = "mt6397-irq",
> > +       .irq_bus_lock = mt6397_irq_lock,
> > +       .irq_bus_sync_unlock = mt6397_irq_sync_unlock,
> > +       .irq_enable = mt6397_irq_enable,
> > +       .irq_disable = mt6397_irq_disable,
> > +       .irq_set_wake = mt6397_irq_set_wake,
> > +};
> > +
> > +static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
> > +                                 int irqbase)
> > +{
> > +       unsigned int status;
> > +       int i, irq, ret;
> > +
> > +       ret = regmap_read(mt6397->regmap, reg, &status);
> > +       if (ret) {
> > +               dev_err(mt6397->dev, "Failed to read irq status: %d\n", ret);
> > +               return;
> > +       }
> > +
> > +       for (i = 0; i < 16; i++) {
> > +               if (status & BIT(i)) {
> > +                       irq = irq_find_mapping(mt6397->irq_domain, irqbase + i);
> > +                       if (irq)
> > +                               handle_nested_irq(irq);
> > +               }
> > +       }
> > +
> > +       regmap_write(mt6397->regmap, reg, status);
> > +}
> > +
> > +static irqreturn_t mt6397_irq_thread(int irq, void *data)
> > +{
> > +       struct mt6397_chip *mt6397 = data;
> > +
> > +       mt6397_irq_handle_reg(mt6397, mt6397->int_status[0], 0);
> > +       mt6397_irq_handle_reg(mt6397, mt6397->int_status[1], 16);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int mt6397_irq_domain_map(struct irq_domain *d, unsigned int irq,
> > +                                irq_hw_number_t hw)
> > +{
> > +       struct mt6397_chip *mt6397 = d->host_data;
> > +
> > +       irq_set_chip_data(irq, mt6397);
> > +       irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
> > +       irq_set_nested_thread(irq, 1);
> > +       irq_set_noprobe(irq);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct irq_domain_ops mt6397_irq_domain_ops = {
> > +       .map = mt6397_irq_domain_map,
> > +};
> > +
> > +int mt6397_irq_init(struct mt6397_chip *chip)
> > +{
> > +       int ret;
> > +
> > +       mutex_init(&chip->irqlock);
> > +
> > +       switch (chip->chip_id) {
> > +       case MT6323_CHIP_ID:
> > +               chip->int_con[0] = MT6323_INT_CON0;
> > +               chip->int_con[1] = MT6323_INT_CON1;
> > +               chip->int_status[0] = MT6323_INT_STATUS0;
> > +               chip->int_status[1] = MT6323_INT_STATUS1;
> > +               break;
> > +
> > +       case MT6391_CHIP_ID:
> > +       case MT6397_CHIP_ID:
> > +               chip->int_con[0] = MT6397_INT_CON0;
> > +               chip->int_con[1] = MT6397_INT_CON1;
> > +               chip->int_status[0] = MT6397_INT_STATUS0;
> > +               chip->int_status[1] = MT6397_INT_STATUS1;
> > +               break;
> > +
> > +       default:
> > +               dev_err(chip->dev, "unsupported chip: 0x%x\n", chip->chip_id);
> > +               return -ENODEV;
> > +       }
>
> This switch/case wasn't there before the move... Doesn't that now
> duplicates with code in mt6397_probe, or am I missing something?

Oh, I see, that's deleted in patch 3/10
(https://patchwork.kernel.org/patch/10928163/). That still does not
look right. I'd have another patch before this that moves the
switch/case statement, and keep this as a simple move with no
functional difference.

> > +
> > +       /* Mask all interrupt sources */
> > +       regmap_write(chip->regmap, chip->int_con[0], 0x0);
> > +       regmap_write(chip->regmap, chip->int_con[1], 0x0);
> > +
> > +       chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
> > +                                                MT6397_IRQ_NR,
> > +                                                &mt6397_irq_domain_ops,
> > +                                                chip);
> > +       if (!chip->irq_domain) {
> > +               dev_err(chip->dev, "could not create irq domain\n");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
> > +                                       mt6397_irq_thread, IRQF_ONESHOT,
> > +                                       "mt6397-pmic", chip);
> > +       if (ret) {
> > +               dev_err(chip->dev, "failed to register irq=%d; err: %d\n",
> > +                       chip->irq, ret);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
> > index d678f526e498..93f9f5235575 100644
> > --- a/include/linux/mfd/mt6397/core.h
> > +++ b/include/linux/mfd/mt6397/core.h
> > @@ -15,6 +15,12 @@
> >  #ifndef __MFD_MT6397_CORE_H__
> >  #define __MFD_MT6397_CORE_H__
> >
> > +enum chip_id {
> > +       MT6323_CHIP_ID = 0x23,
> > +       MT6391_CHIP_ID = 0x91,
> > +       MT6397_CHIP_ID = 0x97,
> > +};
> > +
> >  enum mt6397_irq_numbers {
> >         MT6397_IRQ_SPKL_AB = 0,
> >         MT6397_IRQ_SPKR_AB,
> > @@ -62,6 +68,9 @@ struct mt6397_chip {
> >         u16 irq_masks_cache[2];
> >         u16 int_con[2];
> >         u16 int_status[2];
> > +       u16 chip_id;
> >  };
> >
> > +int mt6397_irq_init(struct mt6397_chip *chip);
> > +
> >  #endif /* __MFD_MT6397_CORE_H__ */
> > --
> > 2.18.0
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

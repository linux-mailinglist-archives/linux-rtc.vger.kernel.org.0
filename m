Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1680710E6AC
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2019 09:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfLBIHl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Dec 2019 03:07:41 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38797 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfLBIHh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Dec 2019 03:07:37 -0500
Received: by mail-ed1-f65.google.com with SMTP id s10so31331026edi.5
        for <linux-rtc@vger.kernel.org>; Mon, 02 Dec 2019 00:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hB2nJ8CzTKjXCm6SOFfHQcbAJFeLp6+ruAS0J+kmEz4=;
        b=XRIhVxFW2iDfWHxbVlSiSV4PpvApyRBnSh0jlF7EDk/saneQv8Jfys+8UXjIN+iVT4
         UgPX8PYXfFfL+H21cq04VIyNM1HXjeB3XCMex9nIMrzxb/+DIUKLqHyR++nk5PkAgbmP
         Z2E1/rUB/83oyoTGcmJ+ZjW0Yk279VnZIhn3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hB2nJ8CzTKjXCm6SOFfHQcbAJFeLp6+ruAS0J+kmEz4=;
        b=qTdl+gp1RR+wUViXt43QK8hyw6gwKOofFmAuz/4p2n0Res9YHT0XkXpL335tEJ01Ps
         PTkqtp5fAhbYWG7k0qBtHDPK51NochIzxczNo2ddUVk8tWOSImg1SwxsbKgbAV3jYWTk
         LYvK3r86oPiPx2RjH12Fvy/fIBeBTDn5+ZpLnU/e7c1jcVM+K1d2ngtE5UyEwiLnl5rI
         EjEUvo0fDImEKoeZd39YG8jrT0JFW9c30ThflQvFNQqxo3/Hv/0NBeCuaGxoGJqrygqA
         zNMWvyIybp+v7dx1TBmmsiM4DeC6ssuHi88jl9tl5lrD6KomDqjX6+L+eLSo+mx+meXR
         ZK/w==
X-Gm-Message-State: APjAAAWg+5jCuIpLTcIQLUVZGUUXpWIuTBmKDtthifnL47XoLWTsajxW
        8YmO3eSHsvHM93heet3w2u0Akx+6fIeDThoIhaS0jA==
X-Google-Smtp-Source: APXvYqzDbZscQDJrs8HoXLTnIMKzHpXcUPG2LW45MmuMV7G7PnHlmrJzw50Qyt0vl90Wse02bh6Lo9CsDwS9zUUwCBU=
X-Received: by 2002:a50:e00a:: with SMTP id e10mr6951207edl.119.1575274055153;
 Mon, 02 Dec 2019 00:07:35 -0800 (PST)
MIME-Version: 1.0
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1566531931-9772-7-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1566531931-9772-7-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Pi-Hsun Shih <pihsun@chromium.org>
Date:   Mon, 2 Dec 2019 16:06:59 +0800
Message-ID: <CANdKZ0eUDhhQPBBiOWZ0u03SFoFQM6b=ED9AGe+JtBSr_zeJKQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] mfd: Add support for the MediaTek MT6358 PMIC
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Fri, Aug 23, 2019 at 11:46 AM Hsin-Hsiung Wang
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
>  drivers/mfd/Makefile                 |   3 +-
>  drivers/mfd/mt6358-irq.c             | 231 ++++++++++++++++++++++++++++
>  drivers/mfd/mt6397-core.c            |  52 ++++++-
>  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
>  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   3 +
>  6 files changed, 727 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mfd/mt6358-irq.c
>  create mode 100644 include/linux/mfd/mt6358/core.h
>  create mode 100644 include/linux/mfd/mt6358/registers.h
> (...)
> diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> new file mode 100644
> index 0000000..760b72f
> --- /dev/null
> +++ b/drivers/mfd/mt6358-irq.c
> @@ -0,0 +1,231 @@
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
> +               /* Find out the irq group */
> +               top_gp = 0;
> +               while ((top_gp + 1) < ARRAY_SIZE(mt6358_ints) &&
> +                      i >= mt6358_ints[top_gp + 1].hwirq_base)
> +                       top_gp++;
> +
> +               if (top_gp >= ARRAY_SIZE(mt6358_ints)) {

Would this condition ever be true? The while loop before this always
break when top_gp == ARRAY_SIZE(mt6358_ints) - 1.

> +                       mutex_unlock(&chip->irqlock);
> +                       dev_err(chip->dev,
> +                               "Failed to get top_group: %d\n", top_gp);
> +                       return;
> +               }
> +
> +               /* Find the irq registers */
> +               int_regs = (i - mt6358_ints[top_gp].hwirq_base) /
> +                           MT6358_REG_WIDTH;
> +               en_reg = mt6358_ints[top_gp].en_reg +
> +                       mt6358_ints[top_gp].en_reg_shift * int_regs;
> +               shift = (i - mt6358_ints[top_gp].hwirq_base) % MT6358_REG_WIDTH;
> +               regmap_update_bits(chip->regmap, en_reg, BIT(shift),
> +                                  irqd->enable_hwirq[i] << shift);
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
> +               ret = regmap_read(chip->regmap, sta_reg, &irq_status);
> +               if (ret) {
> +                       dev_err(chip->dev,
> +                               "Failed to read irq status: %d\n", ret);
> +                       return;
> +               }
> +
> +               if (!irq_status)
> +                       continue;
> +
> +               for (j = 0; j < MT6358_REG_WIDTH ; j++) {
> +                       if ((irq_status & BIT(j)) == 0)
> +                               continue;
> +                       hwirq = mt6358_ints[top_gp].hwirq_base +
> +                               MT6358_REG_WIDTH * i + j;
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
> +               dev_err(chip->dev, "Can't read TOP_INT_STATUS ret=%d\n", ret);
> +               return IRQ_NONE;
> +       }
> +
> +       for (i = 0; i < mt6358_irq_data->num_top; i++) {
> +               if (top_irq_status & BIT(mt6358_ints[i].top_offset))
> +                       mt6358_irq_sp_handler(chip, i);
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

ARRAY_SIZE(mt6358_ints) is still used in pmic_irq_sync_unlock. Is this
variable needed, or should the ARRAY_SIZE(mt6358_ints) in
pmic_irq_sync_unlock be changed to irqd->num_top too?

> +
> +       irqd->enable_hwirq = devm_kcalloc(chip->dev,
> +                                         irqd->num_pmic_irqs,
> +                                         sizeof(bool),
> +                                         GFP_KERNEL);
> +       if (!irqd->enable_hwirq)
> +               return -ENOMEM;
> +
> +       irqd->cache_hwirq = devm_kcalloc(chip->dev,
> +                                        irqd->num_pmic_irqs,
> +                                        sizeof(bool),
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
> +               dev_err(chip->dev, "could not create IRQ domain\n");
> +               return -ENODEV;
> +       }
> +
> +       ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
> +                                       mt6358_irq_handler, IRQF_ONESHOT,
> +                                       mt6358_irq_chip.name, chip);
> +       if (ret) {
> +               dev_err(chip->dev, "failed to register irq=%d; err: %d\n",
> +                       chip->irq, ret);
> +               return ret;
> +       }
> +
> +       enable_irq_wake(chip->irq);
> +       return ret;
> +}
> (...)

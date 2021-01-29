Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26EC30846E
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Jan 2021 04:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhA2DwV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Jan 2021 22:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbhA2DwN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Jan 2021 22:52:13 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC926C06174A
        for <linux-rtc@vger.kernel.org>; Thu, 28 Jan 2021 19:51:32 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id j138so4196138vsd.8
        for <linux-rtc@vger.kernel.org>; Thu, 28 Jan 2021 19:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jnk1h+Zm6n/okb5cHmLykkrJZohbNZPfoHPOBcykkQs=;
        b=EPerR1sUvTgueO5i3ZL5veSEQxRiqidYCwlCtMXdymJZFv/4wOGX3bJ+YpBrykLm83
         TiZ0aQR4xJdQokVBcc8zGsaUY2yHJk4HC12IIGvJ8NsAXE3Dn/mRER3oBgPrfewtGdVi
         +yvqYhHusXB91BB6wRqLGam6ZYjGhlJDUyRNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jnk1h+Zm6n/okb5cHmLykkrJZohbNZPfoHPOBcykkQs=;
        b=qogcyQBiwh82qPQTScL6btY6hTlJLA4DaThFCglMKX5E0WcFURBg/1aojd0n7CsaNv
         03Cz7WLmt7ka56Q4YiX90exowlJsyE6es97LJBkqHw0RWLsUXSL0hYaI2QjNerdoWLy3
         VPoPsoZY7HplMI9Wugch5iNq6TmhVHdssiwl/KARvByOnWbKXs4ylgu3/ytctzkA5EHs
         c86cINzUAZw2fYKBUzWA8q/Jti+VMgMMeypm6JKGMEg59ZGJqVTDiiJKS9TxOLi+Rz/X
         yGX2WStUS7sYkIlbWlEsBjKie7fIu7caB6saeEeC5g/NkcFmbT3iA5M0s9TCLbV2gDo8
         PRZw==
X-Gm-Message-State: AOAM532yrYSTXDOqOBF0aPPS0YY4hOl1nnm4/3kjjMNfmr63aLrFEblu
        mgqzKXjrBwqtAKNNDjdyqnotnJp3JRYQT737/QloxA==
X-Google-Smtp-Source: ABdhPJz1S0Q9ijxKCsprTFXXrokE0AtPeYZFD8kd0gdJkXUmfBjCwQ0j0zCQ3r/c4+iTeuCCbpUpE+NI5D+wNmlB0Iw=
X-Received: by 2002:a67:8945:: with SMTP id l66mr1502828vsd.48.1611892291939;
 Thu, 28 Jan 2021 19:51:31 -0800 (PST)
MIME-Version: 1.0
References: <1611314381-19517-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1611314381-19517-7-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1611314381-19517-7-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 29 Jan 2021 11:51:20 +0800
Message-ID: <CANMq1KC3rXfKx=4w2tLKRC2=VE8xfTGY47y3f9w_GiEAKvvUFw@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] regulator: mt6359: Add support for MT6359 regulator
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Fei Shao <fshao@chromium.org>, linux-rtc@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        Wen Su <wen.su@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 22, 2021 at 7:27 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> From: Wen Su <wen.su@mediatek.com>
>
> The MT6359 is a regulator found on boards based on MediaTek MT6779 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.
>
> Signed-off-by: Wen Su <wen.su@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v4:
> - add enable time of ldo.
> - use the device of mfd driver for the regulator_config.
> - add the regulators_node support.

This doesn't build at all, please at least compile test before sending
new revisions.

> ---
>  drivers/regulator/Kconfig                  |   9 +
>  drivers/regulator/Makefile                 |   1 +
>  drivers/regulator/mt6359-regulator.c       | 669 +++++++++++++++++++++
>  include/linux/regulator/mt6359-regulator.h |  58 ++
>  4 files changed, 737 insertions(+)
>  create mode 100644 drivers/regulator/mt6359-regulator.c
>  create mode 100644 include/linux/regulator/mt6359-regulator.h
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 53fa84f4d1e1..3de7bb5be8ac 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -750,6 +750,15 @@ config REGULATOR_MT6358
>           This driver supports the control of different power rails of device
>           through regulator interface.
>
> +config REGULATOR_MT6359
> +       tristate "MediaTek MT6359 PMIC"
> +       depends on MFD_MT6397
> +       help
> +         Say y here to select this option to enable the power regulator of
> +         MediaTek MT6359 PMIC.
> +         This driver supports the control of different power rails of device
> +         through regulator interface.
> +
>  config REGULATOR_MT6360
>         tristate "MT6360 SubPMIC Regulator"
>         depends on MFD_MT6360
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 680e539f6579..4f65eaead82d 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
>  obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6323) += mt6323-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6358) += mt6358-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6359) += mt6359-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380) += mt6380-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397) += mt6397-regulator.o
> diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
> new file mode 100644
> index 000000000000..fabc3f57f334
> --- /dev/null
> +++ b/drivers/regulator/mt6359-regulator.c
> @@ -0,0 +1,669 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +
> +#include <linux/platform_device.h>
> +#include <linux/mfd/mt6359/registers.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/mt6359-regulator.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +#define MT6359_BUCK_MODE_AUTO          0
> +#define MT6359_BUCK_MODE_FORCE_PWM     1
> +#define MT6359_BUCK_MODE_NORMAL                0
> +#define MT6359_BUCK_MODE_LP            2
> +
> +/*
> + * MT6359 regulators' information
> + *
> + * @desc: standard fields of regulator description.
> + * @status_reg: for query status of regulators.
> + * @qi: Mask for query enable signal status of regulators.
> + * @modeset_reg: for operating AUTO/PWM mode register.
> + * @modeset_mask: MASK for operating modeset register.
> + * @modeset_shift: SHIFT for operating modeset register.
> + */
> +struct mt6359_regulator_info {
> +       struct regulator_desc desc;
> +       u32 status_reg;
> +       u32 qi;
> +       u32 modeset_reg;
> +       u32 modeset_mask;
> +       u32 modeset_shift;
> +       u32 lp_mode_reg;
> +       u32 lp_mode_mask;
> +       u32 lp_mode_shift;
> +};
> +
> +#define MT6359_BUCK(match, _name, min, max, step, min_sel,     \
> +       volt_ranges, _enable_reg, _status_reg,                  \
> +       _vsel_reg, _vsel_mask,                                  \
> +       _lp_mode_reg, _lp_mode_shift,                           \
> +       _modeset_reg, _modeset_shift)                           \
> +[MT6359_ID_##_name] = {                                                \
> +       .desc = {                                               \
> +               .name = #_name,                                 \
> +               .of_match = of_match_ptr(match),                \
> +               .regulators_node = of_match_ptr("regulators"),  \
> +               .ops = &mt6359_volt_range_ops,                  \
> +               .type = REGULATOR_VOLTAGE,                      \
> +               .id = MT6359_ID_##_name,                        \
> +               .owner = THIS_MODULE,                           \
> +               .uV_step = (step),                              \
> +               .linear_min_sel = (min_sel),                    \
> +               .linear_min_sel = (min_sel),                    \
> +               .n_voltages = ((max) - (min)) / (step) + 1,     \
> +               .linear_min_sel = (min_sel),                    \
> +               .n_voltages = ((max) - (min)) / (step) + 1,     \
> +               .min_uV = (min),                                \
> +               .linear_ranges = volt_ranges,                   \
> +               .n_linear_ranges = ARRAY_SIZE(volt_ranges),     \
> +               .vsel_reg = _vsel_reg,                          \
> +               .vsel_mask = _vsel_mask,                        \
> +               .enable_reg = _enable_reg,                      \
> +               .enable_mask = BIT(0),                          \
> +               .of_map_mode = mt6359_map_mode,                 \
> +               .of_map_mode = mt6359_map_mode,                 \
> +       },                                                      \
> +       .status_reg = _status_reg,                              \
> +       .qi = BIT(0),                                           \
> +       .lp_mode_reg = _lp_mode_reg,                            \
> +       .lp_mode_reg = _lp_mode_reg,                            \
> +       .lp_mode_mask = BIT(_lp_mode_shift),                    \
> +       .lp_mode_reg = _lp_mode_reg,                            \

Repeated 3 times.

> +       .lp_mode_mask = BIT(_lp_mode_shift),                    \

Repeated twice.

> +       .lp_mode_shift = _lp_mode_shift,                        \
> +       .modeset_reg = _modeset_reg,                            \
> +       .modeset_mask = BIT(_modeset_shift),                    \
> +       .modeset_shift = _modeset_shift                         \
> +}
> +
> +#define MT6359_LDO_LINEAR(match, _name, min, max, step, min_sel,\
> +#define MT6359_LDO_LINEAR(match, _name, min, max, step, min_sel,\

Repeated twice

> +       volt_ranges, _enable_reg, _status_reg,                  \
> +       _vsel_reg, _vsel_mask)                                  \
> +       _vsel_reg, _vsel_mask)                                  \
> +[MT6359_ID_##_name] = {                                                \
> +       .desc = {                                               \
> +       .desc = {                                               \
> +               .name = #_name,                                 \
> +               .of_match = of_match_ptr(match),                \
> +               .of_match = of_match_ptr(match),                \
> +               .regulators_node = of_match_ptr("regulators"),  \
> +               .ops = &mt6359_volt_range_ops,                  \
> +               .type = REGULATOR_VOLTAGE,                      \
> +               .id = MT6359_ID_##_name,                        \
> +               .owner = THIS_MODULE,                           \
> +               .owner = THIS_MODULE,                           \
> +               .uV_step = (step),                              \
> +               .linear_min_sel = (min_sel),                    \
> +               .n_voltages = ((max) - (min)) / (step) + 1,     \
> +               .min_uV = (min),                                \
> +               .linear_ranges = volt_ranges,                   \
> +               .n_linear_ranges = ARRAY_SIZE(volt_ranges),     \
> +               .n_linear_ranges = ARRAY_SIZE(volt_ranges),     \
> +               .vsel_reg = _vsel_reg,                          \
> +               .n_linear_ranges = ARRAY_SIZE(volt_ranges),     \
> +               .vsel_reg = _vsel_reg,                          \
> +               .vsel_mask = _vsel_mask,                        \
> +               .enable_reg = _enable_reg,                      \
> +               .enable_mask = BIT(0),                          \
> +       },                                                      \
> +       .status_reg = _status_reg,                              \
> +       .status_reg = _status_reg,                              \
> +       .qi = BIT(0),                                           \
> +       .status_reg = _status_reg,                              \
> +       .qi = BIT(0),                                           \
> +}
> +
> +#define MT6359_LDO(match, _name, _volt_table,                  \
> +       _enable_reg, _enable_mask, _status_reg,                 \
> +       _vsel_reg, _vsel_mask, _en_delay)                       \
> +[MT6359_ID_##_name] = {                                                \
> +[MT6359_ID_##_name] = {                                                \

Repeated twice

> +       .desc = {                                               \
> +               .name = #_name,                                 \
> +               .of_match = of_match_ptr(match),                \
> +               .of_match = of_match_ptr(match),                \
> +               .regulators_node = of_match_ptr("regulators"),  \
> +               .ops = &mt6359_volt_table_ops,                  \
> +               .type = REGULATOR_VOLTAGE,                      \
> +               .id = MT6359_ID_##_name,                        \
> +               .owner = THIS_MODULE,                           \
> +               .n_voltages = ARRAY_SIZE(_volt_table),          \
> +               .n_voltages = ARRAY_SIZE(_volt_table),          \
> +               .volt_table = _volt_table,                      \
> +               .n_voltages = ARRAY_SIZE(_volt_table),          \
> +               .volt_table = _volt_table,                      \
> +               .vsel_reg = _vsel_reg,                          \
> +               .vsel_mask = _vsel_mask,                        \
> +               .enable_reg = _enable_reg,                      \
> +               .enable_mask = BIT(_enable_mask),               \
> +               .enable_time = _en_delay,                       \
> +       },                                                      \
> +       .status_reg = _status_reg,                              \
> +       .qi = BIT(0),                                           \
> +}
> +
> +#define MT6359_REG_FIXED(match, _name, _enable_reg,    \
> +       _status_reg, _fixed_volt)                       \
> +[MT6359_ID_##_name] = {                                        \
> +[MT6359_ID_##_name] = {                                        \
> +       .desc = {                                       \
> +               .name = #_name,                         \
> +               .name = #_name,                         \
> +               .of_match = of_match_ptr(match),        \
> +               .regulators_node = of_match_ptr("regulators"),  \
> +               .ops = &mt6359_volt_fixed_ops,          \
> +               .type = REGULATOR_VOLTAGE,              \
> +               .id = MT6359_ID_##_name,                \
> +               .id = MT6359_ID_##_name,                \
> +               .owner = THIS_MODULE,                   \
> +               .n_voltages = 1,                        \
> +               .enable_reg = _enable_reg,              \
> +               .enable_mask = BIT(0),                  \
> +               .fixed_uV = (_fixed_volt),              \
> +       },                                              \
> +       .status_reg = _status_reg,                      \
> +       .status_reg = _status_reg,                      \
> +       .qi = BIT(0),                                   \
> +}
> +
> +static const struct linear_range mt_volt_range1[] = {
> +       REGULATOR_LINEAR_RANGE(800000, 0, 0x70, 12500),
> +};
> +};
> +
> +static const struct linear_range mt_volt_range2[] = {
> +       REGULATOR_LINEAR_RANGE(400000, 0, 0x7f, 6250),
> +};
> +
> +static const struct linear_range mt_volt_range3[] = {
> +       REGULATOR_LINEAR_RANGE(400000, 0, 0x70, 6250),
> +};
> +
> +static const struct linear_range mt_volt_range4[] = {
> +       REGULATOR_LINEAR_RANGE(800000, 0, 0x40, 12500),
> +};
> +
> +static const struct linear_range mt_volt_range5[] = {
> +static const struct linear_range mt_volt_range5[] = {

This is repeated twice.

> +       REGULATOR_LINEAR_RANGE(500000, 0, 0x3F, 50000),
> +};
> +
> [snip]

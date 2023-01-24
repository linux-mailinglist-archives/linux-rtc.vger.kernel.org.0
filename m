Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3B4679673
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Jan 2023 12:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbjAXLS6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Jan 2023 06:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbjAXLSs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Jan 2023 06:18:48 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6D1113ED
        for <linux-rtc@vger.kernel.org>; Tue, 24 Jan 2023 03:18:46 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id r9so13524205wrw.4
        for <linux-rtc@vger.kernel.org>; Tue, 24 Jan 2023 03:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2qK2A7F5wKZ8rhLeWq4L+8rVvDbisjlQ7qR2HWPTnjc=;
        b=8GkKs5DahXIcYNgIjCtM2BpCTC0GX7fbdkZWWXZ2cJ7w00DZu5ZmLRsOu3i2bEEE8I
         LOoqDDwzZawERSbTseb/+W9vixtTQAYdUcDcjYYEMQtwbKS1IcKJA1HVZrO30UjMU3U7
         HExHLQp30gTa+dZqAplHnI4V6bME98KgTB9d7QeD9eMIsSl0v8DnJwN8RGQ0x5sXTDYp
         LlbPFisYnPkcosHqIWkBpDgLQ6HnNh02dkTG7AB9ynqZ7jloa3dNnldQQGuQFEwEheea
         +9ya6TIh1XR792HuYqbUU+wHk4K2esTxl8mK6Z4NFXsl55+zUWGE+ToRiTNQoNo/MK4z
         PIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qK2A7F5wKZ8rhLeWq4L+8rVvDbisjlQ7qR2HWPTnjc=;
        b=q8L7Cn7Pl1iR+qllGAxPsfHNCygkFnzNKSzuwCbNltbvN78bgtaTFmtTXxZYNLV6th
         58BvZ8LVUXyrCCGeLbByDKopLp6ZyKamJVsXPZtpjnyw4q0eC0v3rl5YE1+1WqH2QByd
         TTa3ypT7sTZWKHQTGNkRGH4YcY/Jto4U7cfs9LAWgYbTnhEPJQLLloZp1xRTbrd1i3Dv
         C2okwkxTuYTI1f7rx/mcJH3YMUWSNc81ghCcRyVtf4ryZD+nlzeXLKENnyVO3uDVJWZW
         k8If92PHpRf2bqIZK1Pz3IegCASLYCkFLgqfasM/eeyw2xHCkzelgznSfgr9j5zwSB7N
         1bJw==
X-Gm-Message-State: AFqh2koI1PVbgW7yRXAEkqapeUPr1qEUixLGkUqdJT5xP71HDAwuQjY1
        7TrmDqWGS/WIEH7iwJ2y5Dyd/w==
X-Google-Smtp-Source: AMrXdXvIsmvUF4yEoKVS0/rjSGMgq1Icc3ay5/OyLgYCWJ7B4WfBq9y0ZBxKPPbUvESJ1z6PY5CR8A==
X-Received: by 2002:adf:f90e:0:b0:2bc:aa67:28fb with SMTP id b14-20020adff90e000000b002bcaa6728fbmr21588839wrr.49.1674559124538;
        Tue, 24 Jan 2023 03:18:44 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d53d1000000b0024274a5db0asm1682635wrw.2.2023.01.24.03.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 03:18:44 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jacky Bai <ping.bai@nxp.com>, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v3 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
In-Reply-To: <20230103074742.2324924-3-ping.bai@nxp.com>
References: <20230103074742.2324924-1-ping.bai@nxp.com>
 <20230103074742.2324924-3-ping.bai@nxp.com>
Date:   Tue, 24 Jan 2023 12:18:43 +0100
Message-ID: <87wn5c18q4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jan 03, 2023 at 15:47, Jacky Bai <ping.bai@nxp.com> wrote:

> The ON/OFF logic inside the BBNSM allows for connecting directly
> into a PMIC or other voltage regulator device. The module has an
> button input signal and a wakeup request input signal. It also
> has two interrupts (set_pwr_off_irq and set_pwr_on_irq) and an
> active-low PMIC enable (pmic_en_b) output.
>
> Add the power key support for the ON/OFF button function found in
> BBNSM module.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>   - v2 changes:
>     - use device_property_read_u32() to read the property

We state this in the changelog

>     - clean up the goto return, return directly
>     - sort the header file alphabetically
>     - rename the file to add 'nxp' prefix
>
>   - v3 changes:
>     - get the regmap directly from the parent node
> ---
>  drivers/input/keyboard/Kconfig            |  11 ++
>  drivers/input/keyboard/Makefile           |   1 +
>  drivers/input/keyboard/nxp-bbnsm-pwrkey.c | 190 ++++++++++++++++++++++
>  3 files changed, 202 insertions(+)
>  create mode 100644 drivers/input/keyboard/nxp-bbnsm-pwrkey.c
>
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 84490915ae4d..43827e34f276 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -456,6 +456,17 @@ config KEYBOARD_SNVS_PWRKEY
>  	  To compile this driver as a module, choose M here; the
>  	  module will be called snvs_pwrkey.
>  
> +config KEYBOARD_BBNSM_PWRKEY
> +	tristate "NXP BBNSM Power Key Driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on OF
> +	help
> +	  This is the bbnsm powerkey driver for the NXP i.MX application
> +	  processors.
> +
> +	  To compile this driver as a module, choose M here; the
> +	  module will be called bbnsm_pwrkey.
> +
>  config KEYBOARD_IMX
>  	tristate "IMX keypad support"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 5f67196bb2c1..e34dd65a34c3 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_KEYBOARD_AMIGA)		+= amikbd.o
>  obj-$(CONFIG_KEYBOARD_APPLESPI)		+= applespi.o
>  obj-$(CONFIG_KEYBOARD_ATARI)		+= atakbd.o
>  obj-$(CONFIG_KEYBOARD_ATKBD)		+= atkbd.o
> +obj-$(CONFIG_KEYBOARD_BBNSM_PWRKEY)	+= nxp-bbnsm-pwrkey.o
>  obj-$(CONFIG_KEYBOARD_BCM)		+= bcm-keypad.o
>  obj-$(CONFIG_KEYBOARD_CAP11XX)		+= cap11xx.o
>  obj-$(CONFIG_KEYBOARD_CLPS711X)		+= clps711x-keypad.o
> diff --git a/drivers/input/keyboard/nxp-bbnsm-pwrkey.c b/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
> new file mode 100644
> index 000000000000..dc937036c952
> --- /dev/null
> +++ b/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2022 NXP.
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/regmap.h>
> +
> +#define BBNSM_CTRL		0x8
> +#define BBNSM_INT_EN		0x10
> +#define BBNSM_EVENTS		0x14
> +#define BBNSM_PAD_CTRL		0x24
> +
> +#define BBNSM_BTN_PRESSED	BIT(7)
> +#define BBNSM_PWR_ON		BIT(6)
> +#define BBNSM_BTN_OFF		BIT(5)
> +#define BBNSM_EMG_OFF		BIT(4)
> +#define BBNSM_PWRKEY_EVENTS	(BBNSM_PWR_ON | BBNSM_BTN_OFF | BBNSM_EMG_OFF)
> +#define BBNSM_DP_EN		BIT(24)
> +
> +#define DEBOUNCE_TIME		30
> +#define REPEAT_INTERVAL		60
> +
> +struct bbnsm_pwrkey {
> +	struct regmap *regmap;
> +	int irq;
> +	int keycode;
> +	int keystate;  /* 1:pressed */
> +	struct timer_list check_timer;
> +	struct input_dev *input;
> +};
> +
> +static void bbnsm_pwrkey_check_for_events(struct timer_list *t)
> +{
> +	struct bbnsm_pwrkey *bbnsm = from_timer(bbnsm, t, check_timer);
> +	struct input_dev *input = bbnsm->input;
> +	u32 state;
> +
> +	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &state);
> +
> +	state = state & BBNSM_BTN_PRESSED ? 1 : 0;
> +
> +	/* only report new event if status changed */
> +	if (state ^ bbnsm->keystate) {
> +		bbnsm->keystate = state;
> +		input_event(input, EV_KEY, bbnsm->keycode, state);
> +		input_sync(input);
> +		pm_relax(bbnsm->input->dev.parent);
> +	}
> +
> +	/* repeat check if pressed long */
> +	if (state) {
> +		mod_timer(&bbnsm->check_timer,
> +			  jiffies + msecs_to_jiffies(REPEAT_INTERVAL));
> +	}
> +}
> +
> +static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
> +{
> +	struct platform_device *pdev = dev_id;
> +	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> +	struct input_dev *input = bbnsm->input;
> +	u32 event;
> +
> +	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> +	if (event & BBNSM_BTN_OFF)
> +		mod_timer(&bbnsm->check_timer, jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> +	else
> +		return IRQ_NONE;
> +
> +	pm_wakeup_event(input->dev.parent, 0);
> +
> +	/* clear PWR OFF */
> +	regmap_write(bbnsm->regmap, BBNSM_EVENTS, BBNSM_BTN_OFF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void bbnsm_pwrkey_act(void *pdata)
> +{
> +	struct bbnsm_pwrkey *bbnsm = pdata;
> +
> +	del_timer_sync(&bbnsm->check_timer);
> +}
> +
> +static int bbnsm_pwrkey_probe(struct platform_device *pdev)
> +{
> +	struct bbnsm_pwrkey *bbnsm;
> +	struct input_dev *input;
> +	struct device_node *np = pdev->dev.of_node;
> +	int error;
> +
> +	bbnsm = devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
> +	if (!bbnsm)
> +		return -ENOMEM;
> +
> +	bbnsm->regmap = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(bbnsm->regmap)) {
> +		dev_err(&pdev->dev, "bbnsm pwerkey get regmap failed\n");
> +		return PTR_ERR(bbnsm->regmap);
> +	}
> +
> +	if (of_property_read_u32(np, "linux,code", &bbnsm->keycode)) {

But of_property_read_u32() is still used

> +		bbnsm->keycode = KEY_POWER;
> +		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
> +	}
> +
> +	bbnsm->irq = platform_get_irq(pdev, 0);
> +	if (bbnsm->irq < 0)
> +		return -EINVAL;
> +
> +	/* config the BBNSM power related register */
> +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, BBNSM_DP_EN, BBNSM_DP_EN);
> +
> +	/* clear the unexpected interrupt before driver ready */
> +	regmap_write_bits(bbnsm->regmap, BBNSM_EVENTS, BBNSM_PWRKEY_EVENTS, BBNSM_PWRKEY_EVENTS);
> +
> +	timer_setup(&bbnsm->check_timer, bbnsm_pwrkey_check_for_events, 0);
> +
> +	input = devm_input_allocate_device(&pdev->dev);
> +	if (!input) {
> +		dev_err(&pdev->dev, "failed to allocate the input device\n");
> +		return -ENOMEM;
> +	}
> +
> +	input->name = pdev->name;
> +	input->phys = "bbnsm-pwrkey/input0";
> +	input->id.bustype = BUS_HOST;
> +
> +	input_set_capability(input, EV_KEY, bbnsm->keycode);
> +
> +	/* input customer action to cancel release timer */
> +	error = devm_add_action(&pdev->dev, bbnsm_pwrkey_act, bbnsm);
> +	if (error) {
> +		dev_err(&pdev->dev, "failed to register remove action\n");
> +		return error;
> +	}
> +
> +	bbnsm->input = input;
> +	platform_set_drvdata(pdev, bbnsm);
> +
> +	error = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_pwrkey_interrupt,
> +			       IRQF_SHARED, pdev->name, pdev);
> +	if (error) {
> +		dev_err(&pdev->dev, "interrupt not available.\n");
> +		return error;
> +	}
> +
> +	error = input_register_device(input);
> +	if (error < 0) {
> +		dev_err(&pdev->dev, "failed to register input device\n");
> +		return error;
> +	}
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);

Can we add some error handling here?
The legacy driver (snvs_pwrkey), which looks a lot like this one, warns
whne irq wake enabling fails, and so do the other drivers keyboard
drivers that call dev_pm_set_wake_irq().

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bbnsm_pwrkey_ids[] = {
> +	{ .compatible = "nxp,bbnsm-pwrkey" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
> +
> +static struct platform_driver bbnsm_pwrkey_driver = {
> +	.driver = {
> +		.name = "bbnsm_pwrkey",
> +		.of_match_table = bbnsm_pwrkey_ids,
> +	},
> +	.probe = bbnsm_pwrkey_probe,
> +};
> +module_platform_driver(bbnsm_pwrkey_driver);
> +
> +MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
> +MODULE_DESCRIPTION("NXP bbnsm power key Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.37.1

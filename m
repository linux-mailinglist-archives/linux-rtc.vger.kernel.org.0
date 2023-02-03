Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8008368A363
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Feb 2023 21:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbjBCULp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Feb 2023 15:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjBCULp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Feb 2023 15:11:45 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D64A8406;
        Fri,  3 Feb 2023 12:11:43 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id v23so6408235plo.1;
        Fri, 03 Feb 2023 12:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e3n0iBCikHy35mJ/fJ6w7RxInQl3AA8zpNLBotN4fCw=;
        b=bE0E2s4hWETfKW+QGroiGtKMzN+KXy6x9zWBz48FPAyRvzhz/IhxVxZ8blPs51TtXL
         CQvwDIemN26BLNaG1X5Tt6qyUjxILEJT8Euex/l0ggauI2xVvZxJ+NdcdkRQ1oYfyUfW
         irCrftZqNdnGja6A83ckodgZbgBl8XuEMT8Ze0v80FcCPn4P0hNtcqSnTmDE/mPZVn+f
         MONXazcie7YPyRO5bV5bRTNiLELIRBrU0iIuJm/5vqVxgpruVlM7K2RrUs8beuxmqLuL
         n0o1D77qT/a5iAFmavnHXIoU+GkfqLTw1F2+UvOyVnscvGAZMWq5s6aLDEaHINV5Lpbm
         HCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3n0iBCikHy35mJ/fJ6w7RxInQl3AA8zpNLBotN4fCw=;
        b=olh7rGE68GrfE4LB7Mh8ojVC0bRVz28SvyPem27UQxSHqtmlLT21PCTdzotb3X5Edb
         16OxpWJGGV5juMd27fwFOEFPyCxtCRKhD7YDlI9DuXKrfHqYKJ3M/scBvmg0c7YTMOkc
         THOEQE/pPoQm13PY9WN7ViE2P26PT5g2fZ8NKjRA5QgSgWbjOBvBeUi8++Rk5auJ7n8I
         zXA0OTPsnVgJHd+JHQQikxsWTsxeH57qUtv2+UCWJ6NvYr7RGzAH77xbiXd0aWeTtq16
         mn94388tq/SqhInuncBl3Oqzg3GOE52FJWLOSgclB5o76s9W/Izlvbo05PKsdl0ebyIs
         WlIQ==
X-Gm-Message-State: AO0yUKWZmlB31InhEzOpdGrawpW+DBLvVyOiLMYlHsQlCOL5nIcP/YhL
        MqyyuRhOr98oLv6YrtuQ3Y0=
X-Google-Smtp-Source: AK7set9z/GEfrTso+STGG2jTxRQRuSEfqLO3QjC41LT/2GK65lJkBqfCFWIG9VOSzz59rk06lRrkyQ==
X-Received: by 2002:a17:903:2290:b0:196:704e:2c97 with SMTP id b16-20020a170903229000b00196704e2c97mr13570230plh.25.1675455102693;
        Fri, 03 Feb 2023 12:11:42 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6e90:bb76:2b36:4df2])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c25500b0019605a51d50sm2019030plg.61.2023.02.03.12.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 12:11:41 -0800 (PST)
Date:   Fri, 3 Feb 2023 12:11:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v4 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Message-ID: <Y91qeprAJSDckJ2e@google.com>
References: <20230129070823.1945489-1-ping.bai@nxp.com>
 <20230129070823.1945489-3-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129070823.1945489-3-ping.bai@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Jacky,

On Sun, Jan 29, 2023 at 03:08:21PM +0800, Jacky Bai wrote:
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
>     - clean up the goto return, return directly
>     - sort the header file alphabetically
>     - rename the file to add 'nxp' prefix
> 
>   - v3 changes:
>     - get the regmap directly from the parent node
> 
>   - v4 changes:
>     - update the compatible string to align with binding file
>     - fix the device_property_read_u32 as stated in v2.
>     - add back the 'dev_warn' for 'dev_pm_set_wake_irq' return fail.
> ---
>  drivers/input/keyboard/Kconfig            |  11 ++
>  drivers/input/keyboard/Makefile           |   1 +
>  drivers/input/keyboard/nxp-bbnsm-pwrkey.c | 192 ++++++++++++++++++++++

Majority of pwrkey drivers reside in dribers/input/misc, which
drivers/input/keyboard intended for more traditional/full keyboards.
Could you please move this driver there?

We should move snvs_pwrkey too...


>  3 files changed, 204 insertions(+)
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
> index 000000000000..154ce58b9d5a
> --- /dev/null
> +++ b/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
> @@ -0,0 +1,192 @@
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

del_timer()/del_timer_sync() are deprecated. Please use
timer_shutdown_sync() here.

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
> +	if (device_property_read_u32(&pdev->dev, "linux,code", &bbnsm->keycode)) {
> +		bbnsm->keycode = KEY_POWER;
> +		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");

This is a pretty cryptic message IMO. Maybe say "key code is not
specified, using default KEY_POWER"?

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

Is this really a shared interrupt?

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
> +	error = dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> +	if (error)
> +		dev_warn(&pdev->dev, "irq wake enable failed.\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bbnsm_pwrkey_ids[] = {
> +	{ .compatible = "nxp,imx93-bbnsm-pwrkey" },
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
> 

Thanks.

-- 
Dmitry

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3DD634B1B
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 00:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbiKVXcl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 18:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbiKVXck (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 18:32:40 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F8D1182D;
        Tue, 22 Nov 2022 15:32:38 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id j12so15112755plj.5;
        Tue, 22 Nov 2022 15:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xR2vHmEP3Nm1DbSbyQP7SzQx10F473F5bKKnZx13bC0=;
        b=dYmVd2MiANTX0LOYuPpcczwqS//BPZShmSmN8WMbFWu3X1jZqGGvGFkCIWxbuOFe0U
         aTEhYrGuWgPc4pk+pxWyEFKONI3CGrbuk7UdjNdfYFhzg41OqYcjaYOJ+6h61JMPAqL/
         QA2b4G4cGhTU6n7//d8ac4l8Ev9CVKkW+aDl/svzm2Ikmeu6C8TB+MbpNGjq1u9Gj5nl
         +fDpfJpkp1K1SwHsL5YdmW+yndPj9wZHzPP7KuI65MXDnm+SojS0e8wZ5kGaJOTKzFMF
         bXk7KiksmA2jVNb5pht9DpMRTe9PIlAEj8Gzz7qiqFgn4W6mIJCmeRuDkZA8OpKKriNt
         uM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR2vHmEP3Nm1DbSbyQP7SzQx10F473F5bKKnZx13bC0=;
        b=1tOeZJm2ya0g0mj2NhPrJfhb94tXAOAXnZ7/FlM9+rHEp0PUPYx/CA5xYjWH/paqGP
         H5xLckQ9qYxk/Xk+KtZV1Iu/2qiAknNLAqN+ojiMxUK4atVQNXDQp9X0g8Q04NKSULnA
         /IxplDKtvAo8I3gP/xZcQYhW6kMB5eDX0wqrGfIUzeFXlrr8TYpuLFECzhtIbponqGeW
         UIkB96Z/P2qS3EulHtSl/83WGmqm0bzyC1XdbF7dIB+hBcaFjxHiekwklsqLgqzC0jkq
         mi+/+gGwMvJ5WFgEZ32jhFh0pU/EltigG7cyFUm+dfDkLjLSubhGbs9xywdvKRqSNVP8
         2u+Q==
X-Gm-Message-State: ANoB5pmGVT78bIPPwEU0tnqzyfAaunqWR44YolMyutSnIlHeWEz5ujSV
        M8ucSLmk/+VN+MdT+W6PCGQ=
X-Google-Smtp-Source: AA0mqf7BQH0z+CMvDPYj7fa/bQtmFUxOcVZjiCz5f7v/omcTuMmZRP/HAhi3Gu4DHVM3HC4uWZAyzg==
X-Received: by 2002:a17:903:1206:b0:186:a2ef:7a74 with SMTP id l6-20020a170903120600b00186a2ef7a74mr9959273plh.148.1669159957386;
        Tue, 22 Nov 2022 15:32:37 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:af8d:6047:29d5:446c])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e80f00b001869581f7ecsm12712979plg.116.2022.11.22.15.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:32:36 -0800 (PST)
Date:   Tue, 22 Nov 2022 15:32:33 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Message-ID: <Y31cES4SiUlG4mKd@google.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-3-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121065144.3667658-3-ping.bai@nxp.com>
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

On Mon, Nov 21, 2022 at 02:51:42PM +0800, Jacky Bai wrote:
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
>  drivers/input/keyboard/Kconfig        |  11 ++
>  drivers/input/keyboard/Makefile       |   1 +
>  drivers/input/keyboard/bbnsm_pwrkey.c | 196 ++++++++++++++++++++++++++
>  3 files changed, 208 insertions(+)
>  create mode 100644 drivers/input/keyboard/bbnsm_pwrkey.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 00292118b79b..8efcd95492b3 100644
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
> index 5f67196bb2c1..0bc101e004ae 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_KEYBOARD_QT2160)		+= qt2160.o
>  obj-$(CONFIG_KEYBOARD_SAMSUNG)		+= samsung-keypad.o
>  obj-$(CONFIG_KEYBOARD_SH_KEYSC)		+= sh_keysc.o
>  obj-$(CONFIG_KEYBOARD_SNVS_PWRKEY)	+= snvs_pwrkey.o
> +obj-$(CONFIG_KEYBOARD_BBNSM_PWRKEY)	+= bbnsm_pwrkey.o
>  obj-$(CONFIG_KEYBOARD_SPEAR)		+= spear-keyboard.o
>  obj-$(CONFIG_KEYBOARD_STMPE)		+= stmpe-keypad.o
>  obj-$(CONFIG_KEYBOARD_STOWAWAY)		+= stowaway.o
> diff --git a/drivers/input/keyboard/bbnsm_pwrkey.c b/drivers/input/keyboard/bbnsm_pwrkey.c
> new file mode 100644
> index 000000000000..288ee6844000
> --- /dev/null
> +++ b/drivers/input/keyboard/bbnsm_pwrkey.c
> @@ -0,0 +1,196 @@
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
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/mfd/syscon.h>
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

Can this fail?

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

So interrupt is only generated once when key is pressed, but not on
release?

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
> +	bbnsm->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "regmap");
> +	if (IS_ERR(bbnsm->regmap)) {
> +		dev_err(&pdev->dev, "bbnsm pwerkey get regmap failed\n");
> +		return PTR_ERR(bbnsm->regmap);
> +	}
> +
> +	if (of_property_read_u32(np, "linux,code", &bbnsm->keycode)) {

Please use device_property_read_u32() here.

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
> +		error = -ENOMEM;
> +		goto error_probe;

Please return directly here and below, since there is not explicit
cleanup.

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
> +		goto error_probe;
> +	}
> +
> +	bbnsm->input = input;
> +	platform_set_drvdata(pdev, bbnsm);
> +
> +	error = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_pwrkey_interrupt,
> +			       IRQF_SHARED, pdev->name, pdev);
> +	if (error) {
> +		dev_err(&pdev->dev, "interrupt not available.\n");
> +		goto error_probe;
> +	}
> +
> +	error = input_register_device(input);
> +	if (error < 0) {
> +		dev_err(&pdev->dev, "failed to register input device\n");
> +		goto error_probe;
> +	}
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	error = dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> +	if (error)
> +		dev_err(&pdev->dev, "irq wake enable failed.\n");
> +
> +	return 0;
> +
> +error_probe:
> +	return error;
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
> 

Thanks.

-- 
Dmitry

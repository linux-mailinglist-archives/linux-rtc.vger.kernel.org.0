Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8270F689C7F
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Feb 2023 16:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbjBCPDM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Feb 2023 10:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjBCPDL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Feb 2023 10:03:11 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6DF1C5A6
        for <linux-rtc@vger.kernel.org>; Fri,  3 Feb 2023 07:03:06 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id o18so4915198wrj.3
        for <linux-rtc@vger.kernel.org>; Fri, 03 Feb 2023 07:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZphXZnJIf1mnSAPMAYN3jkqyGuWPwCiTft4uIOkPsY=;
        b=UZKB0uszXuQHPjV/d6ldMJYmQaVCu6r7bSKXcRZmgnVmYVfoJa2IPY9dZKlOiAeTF7
         ilzNdXHY1p0vbz8ufY1c8BIw08lNZ9l+srVJ3ZsjAG6QiUHWSg2RuGrgs2DWqLkNmyjJ
         tFO4MJriJhFKpA/Du52z4/S1Ecl8nPiZP5GlG/H72vtRFel7/ktPumCTK5+pJr3Ths4c
         dyd3bqmLkBhSSWkjs8AJV+wBucuKpSZF/1V/J+QwC2ldErzW9m4nWFFcNTUqNi6Q4hRF
         sjzR4mT5qjf5ouZoXtiONSE2EzUXg57TPl5TB5ceikasxSgwcH0uLqY7zCkM7JJjSixX
         Co4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZphXZnJIf1mnSAPMAYN3jkqyGuWPwCiTft4uIOkPsY=;
        b=UPcGnV1QUP8UE3DO0HFjbyRzbe2mTPbA39Nec0oKBqzJkkIf66MW6Ps2yXK+0vbyHc
         Xf8MpE6bJ/ZCOQD8Qe0qH6g2ZvFoinJZyiO/I4Qf3LRq/t2e3aKBLsXDpAFRehgKqRV6
         SlJ9gmw/jJMo3lmxZ42CTITNomvuh2JgYhonwXS2Um5fi8+Ctjwam3HgIWrDVcEc/oFE
         voheGkNBGw1tLZ56Gq17hXTs/BPoUZH8u6gNDUzCR9Ow8kg05JV8zeJzQEZardgRBNSw
         5KuIC4/RfR8dOMn4PwUZcAVa7c7YxOyEC3LpOBkhzNeiFMs9N0Nbdml8xcsuQIGFssj4
         21Xw==
X-Gm-Message-State: AO0yUKUIfYEFoiphwZd2fNVjEJyyl+NPhwakajU9jhgv0V1eww96Jvgz
        51KpNEb66wHz9GKCicGABaxfTw==
X-Google-Smtp-Source: AK7set/Kxs51195391nVlWqZlCne+07F2FEBIK9FnyV3fGefDJXzM/3jikNVX55sasc3DNtUtqsu1A==
X-Received: by 2002:a5d:6906:0:b0:2bf:e9dc:5542 with SMTP id t6-20020a5d6906000000b002bfe9dc5542mr8285055wru.53.1675436585053;
        Fri, 03 Feb 2023 07:03:05 -0800 (PST)
Received: from localhost ([2a01:cb1a:d:9cd7:1733:6588:b4e9:c6d3])
        by smtp.gmail.com with ESMTPSA id t10-20020adff60a000000b002bbddb89c71sm2191084wrp.67.2023.02.03.07.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 07:03:04 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jacky Bai <ping.bai@nxp.com>, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v4 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
In-Reply-To: <20230129070823.1945489-3-ping.bai@nxp.com>
References: <20230129070823.1945489-1-ping.bai@nxp.com>
 <20230129070823.1945489-3-ping.bai@nxp.com>
Date:   Fri, 03 Feb 2023 16:03:03 +0100
Message-ID: <87r0v6lrko.fsf@baylibre.com>
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

On Sun, Jan 29, 2023 at 15:08, Jacky Bai <ping.bai@nxp.com> wrote:

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

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

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

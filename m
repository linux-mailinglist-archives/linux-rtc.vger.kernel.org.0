Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3091463437D
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 19:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbiKVSTF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 13:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbiKVSTE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 13:19:04 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6BA663D8;
        Tue, 22 Nov 2022 10:19:02 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7893B1C000A;
        Tue, 22 Nov 2022 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669141140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZDNwluvtG1WetRunNnZnkNy7ktuJgRYjHUd4OHQgY8I=;
        b=L36lKCSi1XfW5DlAarMBCS+HzTxpCvOXlID2bSnYrAmwyRimyeaYmihvCOs9AhjQjDRfrT
        xGo8ELt/5NimK8Hy3Y5aVa/AOjQ7c31daMRTbwZBTjnOF6yTm1BE5tWt+Zhzm8cqiDqaNh
        9kyBc7ciuO7UgoKlJxNkpuO1he/FzZaZBM4OLPRIuWjNsw1q41cY8ojU1BB5zBgDOjAnec
        XLA5e26Q09Gs2WmNNZPE7P0YE1TlVZ9BQX8M0W9M9nIwN/Jke3nVIKfRW1jo5gdibCznoj
        GS/nlnlt8ZMoBUTq54NT09RZBMdZ553XjybCwtNZs5kdbas0OOPr2cEnDam8Hg==
Date:   Tue, 22 Nov 2022 19:18:59 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH 3/4] rtc: bbnsm: Add the bbnsm rtc support
Message-ID: <Y30Sk+ftJQ5XJQZF@mail.local>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-4-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121065144.3667658-4-ping.bai@nxp.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/11/2022 14:51:43+0800, Jacky Bai wrote:
> The BBNSM module includes a real time counter with alarm.
> Add a RTC driver for this function.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/rtc/Kconfig     |  12 +++
>  drivers/rtc/Makefile    |   1 +
>  drivers/rtc/rtc-bbnsm.c | 223 ++++++++++++++++++++++++++++++++++++++++

I'd prefer that filename to include imx or mxc if this is only available
on those SoCs.

> diff --git a/drivers/rtc/rtc-bbnsm.c b/drivers/rtc/rtc-bbnsm.c
> new file mode 100644
> index 000000000000..4157b238ed9a
> --- /dev/null
> +++ b/drivers/rtc/rtc-bbnsm.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2022 NXP.
> +
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/rtc.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>

This list should be sorted alphabetically


> +
> +#define BBNSM_CTRL	0x8
> +#define BBNSM_INT_EN	0x10
> +#define BBNSM_EVENTS	0x14
> +#define BBNSM_RTC_LS	0x40
> +#define BBNSM_RTC_MS	0x44
> +#define BBNSM_TA	0x50
> +
> +#define RTC_EN		0x2
> +#define RTC_EN_MSK	0x3
> +#define TA_EN		(0x2 << 2)
> +#define TA_DIS		(0x1 << 2)
> +#define TA_EN_MSK	(0x3 << 2)
> +#define RTC_INT_EN	0x2
> +#define TA_INT_EN	(0x2 << 2)
> +
> +#define BBNSM_EVENT_TA	TA_EN
> +

I'm not clear why this define is needed

> +static irqreturn_t bbnsm_rtc_irq_handler(int irq, void *dev_id)
> +{
> +	struct device *dev = dev_id;
> +	struct bbnsm_rtc  *bbnsm = dev_get_drvdata(dev);
> +	u32 val;
> +	u32 event = 0;

You can rework this function to remove this variable because it is
either 0 or RTC_AF | RTC_IRQF

> +
> +	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &val);
> +	if (val & BBNSM_EVENT_TA) {
> +		event |= (RTC_AF | RTC_IRQF);
> +		bbnsm_rtc_alarm_irq_enable(dev, false);
> +		/* clear the alarm event */
> +		regmap_write_bits(bbnsm->regmap, BBNSM_EVENTS, TA_EN_MSK, BBNSM_EVENT_TA);
> +		rtc_update_irq(bbnsm->rtc, 1, event);
> +	}
> +
> +	return event ? IRQ_HANDLED : IRQ_NONE;
> +}
> +
> +static int bbnsm_rtc_probe(struct platform_device *pdev)
> +{
> +	struct bbnsm_rtc *bbnsm;
> +	int ret;
> +
> +	bbnsm = devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
> +	if (!bbnsm)
> +		return -ENOMEM;
> +
> +	bbnsm->rtc = devm_rtc_allocate_device(&pdev->dev);
> +
> +	bbnsm->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "regmap");
> +	if (IS_ERR(bbnsm->regmap)) {
> +		dev_err(&pdev->dev, "bbnsm get regmap failed\n");
> +		return PTR_ERR(bbnsm->regmap);
> +	}
> +
> +	bbnsm->irq = platform_get_irq(pdev, 0);
> +	if (bbnsm->irq < 0)
> +		return bbnsm->irq;
> +
> +	platform_set_drvdata(pdev, bbnsm);
> +
> +	/* clear all the pending events */
> +	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
> +
> +	/* Enable the Real-Time counter */
> +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, RTC_EN);
> +

Please don't do that, this removes an important piece of information.
Instead, let .set_time enable it and check it in .read_time as if this
is not set, you now you are out of PoR and the time is invalid

> +	device_init_wakeup(&pdev->dev, true);
> +	ret = dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to enable the irq wakeup\n");

dev_err but the function is not failing. Maybe just dev_warn? Also, is
this message really necessary?

> +
> +	ret = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_rtc_irq_handler,
> +			IRQF_SHARED, "rtc alarm", &pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
> +			bbnsm->irq, ret);
> +		return ret;
> +	}
> +
> +	bbnsm->rtc->ops = &bbnsm_rtc_ops;
> +	bbnsm->rtc->range_max = U32_MAX;
> +
> +	return devm_rtc_register_device(bbnsm->rtc);
> +}
> +
> +static const struct of_device_id bbnsm_dt_ids[] = {
> +	{ .compatible = "nxp,bbnsm-rtc", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, bbnsm_dt_ids);
> +
> +static struct platform_driver bbnsm_rtc_driver = {
> +	.driver = {
> +		.name = "bbnsm_rtc",
> +		.of_match_table = bbnsm_dt_ids,
> +	},
> +	.probe = bbnsm_rtc_probe,
> +};
> +module_platform_driver(bbnsm_rtc_driver);
> +
> +MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
> +MODULE_DESCRIPTION("NXP BBNSM RTC Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.37.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

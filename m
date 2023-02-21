Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725C269E6B3
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Feb 2023 19:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjBUSBZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 21 Feb 2023 13:01:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjBUSBY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 21 Feb 2023 13:01:24 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95ED32C64C;
        Tue, 21 Feb 2023 10:01:21 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7AEC54000A;
        Tue, 21 Feb 2023 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677002479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Dl/vHzsChoRqURGkFf3UDkzsWYJfRyvJJaZzJSZYqoQ=;
        b=PMGa1G918k2xKC5oHsniJ3R27Sw2TLgPKt2QohT6f9QBB/FLLtG9/6y+5uIaStrAoyI0pI
        9eLkvDFFNilMUk0/amdPVYPkhCFV16/2Nbo61mByNbMklUsTJE/QIfjyaPXGnJZG/IM4+Y
        MSoPM7jS/PvHXxmudBzAWhcy2zRt+urlXiDaOu3jwvTtPqOEu4uNVrNf+3s5VFaq9YXecv
        3ihm49kaq6sMeEiB7yVQxGTKpn30DPaNLo+KzRE/2Y/NRd7w/m92SySr/SB79GRX/lYrPC
        bnlv4P2km6sFon8aXVjKKFGYGU12D4yu+zRpn6eIJTfjWJDlU9gh3VYjMsQRtg==
Date:   Tue, 21 Feb 2023 19:01:16 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v5 2/3] rtc: bbnsm: Add the bbnsm rtc support
Message-ID: <Y/UG7LT6e7+UySRs@mail.local>
References: <20230215024117.3357341-1-ping.bai@nxp.com>
 <20230215024117.3357341-3-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215024117.3357341-3-ping.bai@nxp.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/02/2023 10:41:16+0800, Jacky Bai wrote:
> The BBNSM module includes a real time counter with alarm.
> Add a RTC driver for this function.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> +static int bbnsm_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct bbnsm_rtc *bbnsm;
> +	int ret;
> +
> +	bbnsm = devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
> +	if (!bbnsm)
> +		return -ENOMEM;
> +
> +	bbnsm->rtc = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(bbnsm->rtc))
> +		return PTR_ERR(bbnsm->rtc);
> +
> +	bbnsm->regmap = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(bbnsm->regmap)) {
> +		dev_dbg(&pdev->dev, "bbnsm get regmap failed\n");
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
> +	device_init_wakeup(&pdev->dev, true);
> +	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> +
> +	ret = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_rtc_irq_handler,
> +			IRQF_SHARED, "rtc alarm", &pdev->dev);

This is not properly aligned, you can fix that if you ever have to
resend.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

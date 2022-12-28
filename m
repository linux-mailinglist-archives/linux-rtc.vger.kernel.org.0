Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B4A6575B5
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Dec 2022 12:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiL1LQO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Dec 2022 06:16:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiL1LQM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Dec 2022 06:16:12 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35375C72;
        Wed, 28 Dec 2022 03:16:10 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5657C24000D;
        Wed, 28 Dec 2022 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1672226169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UdE5iiWFC45uB+XyH8tfCSZPTXe5to38ZC4T6IG5Wrc=;
        b=TTIwQp+2YWq4D8vvjrJHtvMJkoSYwLWciQW4prQvwwK2MTMiKMpDoPrIH0AbMeJ9rBEumL
        PLrEk1oIoNLNHRW66yDLJoTKszFlsaSh+Lx5cThGvuwiGJ8ZFbvrYCc2/ANZ3fPSKhjCT0
        UxcMMELjcVpI/tSjBXwDGQs8iybKYw1fUeSvBGUcMnFlDv0kvgTMdVCtDWJhWb7KKlH18z
        tk3arTrYYmEDSSVKLW3qmph+GAN+2oHl+VlIt3UdVNo6ve80/Su0SGpp0NFwlrQmvunvP3
        ka/gAO1yqfFPXnY+LYVmKKyUzq3FeHfWy+9erndN6b2kFcyucs+rS6C+a3+lXA==
Date:   Wed, 28 Dec 2022 12:16:06 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v2 3/4] rtc: bbnsm: Add the bbnsm rtc support
Message-ID: <Y6wldnu6+apmnSxJ@mail.local>
References: <20221226023942.1027270-1-ping.bai@nxp.com>
 <20221226023942.1027270-4-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226023942.1027270-4-ping.bai@nxp.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/12/2022 10:39:41+0800, Jacky Bai wrote:
> +static int bbnsm_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct bbnsm_rtc *bbnsm = dev_get_drvdata(dev);
> +	unsigned long time;
> +	u32 val;
> +
> +	regmap_read(bbnsm->regmap, BBNSM_CTRL, &val);
> +	if ((val & RTC_EN_MSK) != RTC_EN) {
> +		dev_warn(dev, "RTC is not enabled, time is invalid!\n");

I don't think this message is necessary.

> +		return -EINVAL;
> +	}
> +
> +	time = bbnsm_read_counter(bbnsm);
> +	rtc_time64_to_tm(time, tm);
> +
> +	return 0;
> +}
> +

[...]

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
> +	bbnsm->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nxp,bbnsm-regmap");
> +	if (IS_ERR(bbnsm->regmap)) {
> +		dev_err(&pdev->dev, "bbnsm get regmap failed\n");

Maybe this should be a dev_dbg?

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

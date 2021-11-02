Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CCB44303F
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Nov 2021 15:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhKBOZt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Tue, 2 Nov 2021 10:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhKBOZt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Nov 2021 10:25:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382D8C061714
        for <linux-rtc@vger.kernel.org>; Tue,  2 Nov 2021 07:23:14 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mhugw-000560-4X; Tue, 02 Nov 2021 15:23:10 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mhugk-004FAn-K7; Tue, 02 Nov 2021 15:22:58 +0100
Message-ID: <7f4925be01831bce1e48efa8ee7eb6983c818a9c.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] rtc: Add driver for Sunplus SP7021
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Vincent Shih <vincent.sunplus@gmail.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     Vincent Shih <vincent.shih@sunplus.com>
Date:   Tue, 02 Nov 2021 15:22:58 +0100
In-Reply-To: <1635834123-24668-2-git-send-email-vincent.shih@sunplus.com>
References: <1635834123-24668-1-git-send-email-vincent.shih@sunplus.com>
         <1635834123-24668-2-git-send-email-vincent.shih@sunplus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 2021-11-02 at 14:22 +0800, Vincent Shih wrote:
[...]
> +static int sp_rtc_probe(struct platform_device *plat_dev)
> +{
> +	int ret;
> +	int err, irq;
> +	struct rtc_device *rtc = NULL;
> +	struct resource *res;
> +	void __iomem *reg_base = NULL;
> +
> +	FUNC_DEBUG();

Drop these.

> +	memset(&sp_rtc, 0, sizeof(sp_rtc));
> +
> +	// find and map our resources
> +	res = platform_get_resource_byname(plat_dev, IORESOURCE_MEM, RTC_REG_NAME);
> +	RTC_DEBUG("res = 0x%x\n", res->start);

Drop, this will crash if res == NULL.

> +
> +	if (res) {
> +		reg_base = devm_ioremap_resource(&plat_dev->dev, res);
> +		if (IS_ERR(reg_base))
> +			RTC_ERR("%s devm_ioremap_resource fail\n", RTC_REG_NAME);
> +	}
> +	RTC_DEBUG("reg_base = 0x%lx\n", (unsigned long)reg_base);

Drop or use dev_dbg() instead.

> +
> +	// clk
> +	sp_rtc.rtcclk = devm_clk_get(&plat_dev->dev, NULL);
> +	RTC_DEBUG("sp_rtc->clk = 0x%lx\n", (unsigned long)sp_rtc.rtcclk);
> +	if (IS_ERR(sp_rtc.rtcclk))
> +		RTC_DEBUG("devm_clk_get fail\n");
> +
> +	ret = clk_prepare_enable(sp_rtc.rtcclk);

Only enable the clock after all resources are requested. That will
simplify the error path.

> +
> +	// reset
> +	sp_rtc.rstc = devm_reset_control_get(&plat_dev->dev, NULL);

Use devm_reset_control_get_exclusive() instead.
This should be done before clk_prepare_enable().

> +	RTC_DEBUG("sp_rtc->rstc = 0x%lx\n", (unsigned long)sp_rtc.rstc);
> +	if (IS_ERR(sp_rtc.rstc)) {
> +		ret = PTR_ERR(sp_rtc.rstc);
> +		RTC_ERR("SPI failed to retrieve reset controller: %d\n", ret);
> +		goto free_clk;

Then you could use return dev_err_probe() here.

> +	}
> +
> +	ret = reset_control_deassert(sp_rtc.rstc);

Same as for the clock, only deassert the reset after all resources are
requested.

> +	if (ret)
> +		goto free_clk;
> +
> +	rtc_reg_ptr = (struct sp_rtc_reg *)(reg_base);
> +
> +	// Keep RTC from system reset
> +	writel((1 << (16+4)) | (1 << 4), &rtc_reg_ptr->rtc_ctrl);
> +
> +	// request irq
> +	irq = platform_get_irq(plat_dev, 0);

This should be done before clk_prepare_enable().

> +	if (irq < 0) {
> +		RTC_ERR("platform_get_irq failed\n");
> +		goto free_reset_assert;
> +	}
> +
> +	err = devm_request_irq(&plat_dev->dev, irq, rtc_irq_handler,
> +					IRQF_TRIGGER_RISING, "rtc irq", plat_dev);
> +	if (err) {
> +		RTC_ERR("devm_request_irq failed: %d\n", err);
> +		goto free_reset_assert;
> +	}
> +
> +	// Get charging-mode.
> +	ret = of_property_read_u32(plat_dev->dev.of_node, "charging-mode", &sp_rtc.charging_mode);

This could be done before clk_prepare_enable().

> +	if (ret) {
> +		RTC_ERR("Failed to retrieve \'charging-mode\'!\n");
> +		goto free_reset_assert;
> +	}
> +	sp_rtc_set_batt_charge_ctrl(sp_rtc.charging_mode);
> +
> +	device_init_wakeup(&plat_dev->dev, 1);
> +
> +	rtc = devm_rtc_device_register(&plat_dev->dev, "sp7021-rtc", &sp_rtc_ops, THIS_MODULE);
> +	if (IS_ERR(rtc)) {
> +		ret = PTR_ERR(rtc);
> +		goto free_reset_assert;
> +	}
> +
> +	platform_set_drvdata(plat_dev, rtc);
> +
> +	RTC_INFO("sp7021-rtc loaded\n");

Use dev_info() instead.

> +
> +	return 0;
> +
> +free_reset_assert:
> +	reset_control_assert(sp_rtc.rstc);
> +free_clk:
> +	clk_disable_unprepare(sp_rtc.rtcclk);
> +
> +	return ret;
> +}
> +
> +static int sp_rtc_remove(struct platform_device *plat_dev)
> +{
> +	reset_control_assert(sp_rtc.rstc);

	clk_disable_unprepare(sp_rtc.rtcclk);


regards
Philipp

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD034F5EC3
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 15:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiDFMuA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Apr 2022 08:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbiDFMth (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Apr 2022 08:49:37 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2813B4C5ED3;
        Wed,  6 Apr 2022 02:00:33 -0700 (PDT)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id A55DDC7AC4;
        Wed,  6 Apr 2022 08:50:45 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6E84660006;
        Wed,  6 Apr 2022 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649235041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tErT+ZwaDPcqAIB1XKn6SPEZzapnWsR8UyXa+0xPdd4=;
        b=Qcl6ijV+qnHcnFFJ1I2gNXCj3KZwIJ45rxx4CDq8Wv4iHBRL+gTGL6xz67PLyXmRv5MiiD
        x/+dif+qRkTl9xw39teAu3rnPHUs3bq/g6Xc+hNgziVbAfUJIzU1LfvCqlIKsTDsj5fUus
        5IcP7L8GLpCDXocxbSWReMPfkG61JvYLIWkBep9dh7zKCAHQ21lnYu23RUobCeVQGkES7Z
        bT7bFZs3RsgFgNDarNMyrnzvKAlNBoGT9ZUPUbPi/CerhkCE2ZnvJqjwpwNnqO+fSoiyb2
        DnUBqjFoTIwi89VILbD+IjOsM8R89xF1tvDL6bZEtgsg3YckpiVaq6hrBis4rw==
Date:   Wed, 6 Apr 2022 10:50:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Michel Pollet <michel.pollet@bp.renesas.com>
Subject: Re: [PATCH 3/7] rtc: rzn1: Add new RTC driver
Message-ID: <Yk1UXjTk32Vc9+/k@mail.local>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
 <20220405184716.1578385-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405184716.1578385-4-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/04/2022 20:47:12+0200, Miquel Raynal wrote:
> From: Michel Pollet <michel.pollet@bp.renesas.com>
> 
> Add a basic RTC driver for the RZ/N1.
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/rtc/Kconfig    |   7 ++
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-rzn1.c | 255 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 263 insertions(+)
>  create mode 100644 drivers/rtc/rtc-rzn1.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 41c65b4d2baf..f4d72c5b99ea 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1548,6 +1548,13 @@ config RTC_DRV_RS5C313
>  	help
>  	  If you say yes here you get support for the Ricoh RS5C313 RTC chips.
>  
> +config RTC_DRV_RZN1
> +	tristate "Renesas RZN1 RTC"
> +	depends on ARCH_RZN1 || COMPILE_TEST
> +	depends on OF && HAS_IOMEM
> +	help
> +	  If you say yes here you get support for the Renesas RZ/N1 RTC.
> +
>  config RTC_DRV_GENERIC
>  	tristate "Generic RTC support"
>  	# Please consider writing a new RTC driver instead of using the generic
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 2d827d8261d5..fb04467b652d 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -151,6 +151,7 @@ obj-$(CONFIG_RTC_DRV_RX6110)	+= rtc-rx6110.o
>  obj-$(CONFIG_RTC_DRV_RX8010)	+= rtc-rx8010.o
>  obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
>  obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
> +obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>  obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>  obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>  obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> new file mode 100644
> index 000000000000..15c533333930
> --- /dev/null
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Renesas RZN1 Real Time Clock interface for Linux
> + *
> + * Copyright:
> + * - 2014 Renesas Electronics Europe Limited
> + * - 2022 Schneider Electric
> + *
> + * Authors:
> + * - Michel Pollet <michel.pollet@bp.renesas.com>, <buserror@gmail.com>
> + * - Miquel Raynal <miquel.raynal@bootlin.com>
> + */
> +
> +#include <linux/bcd.h>
> +#include <linux/clk.h>
> +#include <linux/init.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/soc/renesas/r9a06g032-sysctrl.h>
> +
> +#define RZN1_RTC_CTL0 0x00
> +#define   RZN1_RTC_CTL0_SLSB_SUBU 0
> +#define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
> +#define   RZN1_RTC_CTL0_AMPM BIT(5)
> +#define   RZN1_RTC_CTL0_CE BIT(7)
> +
> +#define RZN1_RTC_CTL1 0x04
> +#define   RZN1_RTC_CTL1_ALME BIT(4)
> +
> +#define RZN1_RTC_CTL2 0x08
> +#define   RZN1_RTC_CTL2_WAIT BIT(0)
> +#define   RZN1_RTC_CTL2_WST BIT(1)
> +#define   RZN1_RTC_CTL2_WUST BIT(5)
> +
> +#define RZN1_RTC_SEC 0x14
> +#define RZN1_RTC_MIN 0x18
> +#define RZN1_RTC_HOUR 0x1c
> +#define RZN1_RTC_WEEK 0x20
> +#define RZN1_RTC_DAY 0x24
> +#define RZN1_RTC_MONTH 0x28
> +#define RZN1_RTC_YEAR 0x2c
> +
> +#define RZN1_RTC_SUBU 0x38
> +#define   RZN1_RTC_SUBU_DEV BIT(7)
> +#define   RZN1_RTC_SUBU_DECR BIT(6)
> +
> +#define RZN1_RTC_ALM 0x40
> +#define RZN1_RTC_ALH 0x44
> +#define RZN1_RTC_ALW 0x48
> +
> +#define RZN1_RTC_SECC 0x4c
> +#define RZN1_RTC_MINC 0x50
> +#define RZN1_RTC_HOURC 0x54
> +#define RZN1_RTC_WEEKC 0x58
> +#define RZN1_RTC_DAYC 0x5c
> +#define RZN1_RTC_MONTHC 0x60
> +#define RZN1_RTC_YEARC 0x64
> +
> +struct rzn1_rtc {
> +	struct rtc_device *rtcdev;
> +	void __iomem *base;
> +	struct clk *clk;
> +};
> +
> +static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
> +{
> +	tm->tm_sec = readl(rtc->base + RZN1_RTC_SECC);
> +	tm->tm_min = readl(rtc->base + RZN1_RTC_MINC);
> +	tm->tm_hour = readl(rtc->base + RZN1_RTC_HOURC);
> +	tm->tm_wday = readl(rtc->base + RZN1_RTC_WEEKC);
> +	tm->tm_mday = readl(rtc->base + RZN1_RTC_DAYC);
> +	tm->tm_mon = readl(rtc->base + RZN1_RTC_MONTHC);
> +	tm->tm_year = readl(rtc->base + RZN1_RTC_YEARC);
> +}
> +
> +static unsigned int rzn1_rtc_tm_to_wday(struct rtc_time *tm)
> +{
> +	time64_t time;
> +	unsigned int days;
> +	u32 secs;
> +
> +	time = rtc_tm_to_time64(tm);
> +	days = div_s64_rem(time, 86400, &secs);
> +
> +	/* day of the week, 1970-01-01 was a Thursday */
> +	return (days + 4) % 7;
> +}
> +
> +static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> +	u32 secs;
> +
> +	rzn1_rtc_get_time_snapshot(rtc, tm);
> +	secs = readl(rtc->base + RZN1_RTC_SECC);
> +	if (tm->tm_sec != secs)
> +		rzn1_rtc_get_time_snapshot(rtc, tm);
> +
> +	tm->tm_sec = bcd2bin(tm->tm_sec);
> +	tm->tm_min = bcd2bin(tm->tm_min);
> +	tm->tm_hour = bcd2bin(tm->tm_hour);
> +	tm->tm_wday = bcd2bin(tm->tm_wday);
> +	tm->tm_mday = bcd2bin(tm->tm_mday);
> +	tm->tm_mon = bcd2bin(tm->tm_mon);
> +	tm->tm_year = bcd2bin(tm->tm_year);
> +
> +	dev_dbg(dev, "%d-%d-%d(%d)T%d:%d:%d\n",
> +		tm->tm_year, tm->tm_mon, tm->tm_mday, tm->tm_wday,
> +		tm->tm_hour, tm->tm_min, tm->tm_sec);
> +

This is not really useful because we have tracepoints in the core.
Anyway, please use %ptR.

> +	return 0;
> +}
> +
> +static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +
> +	tm->tm_sec = bin2bcd(tm->tm_sec);
> +	tm->tm_min = bin2bcd(tm->tm_min);
> +	tm->tm_hour = bin2bcd(tm->tm_hour);
> +	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
> +	tm->tm_mday = bin2bcd(tm->tm_mday);
> +	tm->tm_mon = bin2bcd(tm->tm_mon);
> +	tm->tm_year = bin2bcd(tm->tm_year);
> +
> +	/* Hold the counter */
> +	val = readl(rtc->base + RZN1_RTC_CTL2);
> +	val |= RZN1_RTC_CTL2_WAIT;
> +	writel(val, rtc->base + RZN1_RTC_CTL2);
> +
> +	/* Wait for the counter to stop: two 32k clock cycles */
> +	usleep_range(61, 100);
> +	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
> +				 val & RZN1_RTC_CTL2_WST, 0, 100);
> +	if (!ret) {
> +		writel(tm->tm_sec, rtc->base + RZN1_RTC_SEC);
> +		writel(tm->tm_min, rtc->base + RZN1_RTC_MIN);
> +		writel(tm->tm_hour, rtc->base + RZN1_RTC_HOUR);
> +		writel(tm->tm_wday, rtc->base + RZN1_RTC_WEEK);
> +		writel(tm->tm_mday, rtc->base + RZN1_RTC_DAY);
> +		writel(tm->tm_mon, rtc->base + RZN1_RTC_MONTH);
> +		writel(tm->tm_year, rtc->base + RZN1_RTC_YEAR);
> +	}
> +
> +	/* Release the counter back */
> +	val &= ~RZN1_RTC_CTL2_WAIT;
> +	writel(val, rtc->base + RZN1_RTC_CTL2);
> +
> +	return ret;
> +}
> +
> +static const struct rtc_class_ops rzn1_rtc_ops = {
> +	.read_time = rzn1_rtc_read_time,
> +	.set_time = rzn1_rtc_set_time,
> +};
> +
> +static int rzn1_rtc_probe(struct platform_device *pdev)
> +{
> +	struct rzn1_rtc *rtc;
> +	int ret;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	rtc->clk = devm_clk_get(&pdev->dev, "hclk");
> +	if (IS_ERR(rtc->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk), "Missing hclk\n");
> +
> +	rtc->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rtc->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
> +
> +	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtc->rtcdev))
> +		return PTR_ERR(rtc);
> +
> +	rtc->rtcdev->range_max = 3178591199UL; /* 100 years */

I'm not sure how you came to this value, this is 2070-09-22T05:59:59.
I'm pretty sure the RTC will not fail at that time. Also, the comment
seems fishy.


> +	rtc->rtcdev->ops = &rzn1_rtc_ops;
> +
> +	ret = r9a06g032_sysctrl_enable_rtc(true);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(rtc->clk);
> +	if (ret)
> +		goto disable_rtc;
> +
> +	/*
> +	 * Ensure the clock counter is enabled.
> +	 * Set 24-hour mode and possible oscillator offset compensation in SUBU mode.
> +	 */
> +	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUBU,
> +	       rtc->base + RZN1_RTC_CTL0);
> +
> +	/* Disable all interrupts */
> +	writel(0, rtc->base + RZN1_RTC_CTL1);
> +
> +	/* Enable counter operation */
> +	writel(0, rtc->base + RZN1_RTC_CTL2);
> +

I don't think you should do that unconditionally. The RTC is either
not already started (and doesn't carry the proper time/date) or already
started. It would be better to start it in .set_time. Maybe you can even
use that to detect whether it has already been set once.

> +	ret = devm_rtc_register_device(rtc->rtcdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register RTC\n");

No error message is needed here.

> +		goto disable_clk;
> +	}
> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(rtc->clk);
> +disable_rtc:
> +	r9a06g032_sysctrl_enable_rtc(false);
> +
> +	return ret;
> +}
> +
> +static int rzn1_rtc_remove(struct platform_device *pdev)
> +{
> +	struct rzn1_rtc *rtc = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(rtc->clk);
> +	r9a06g032_sysctrl_enable_rtc(false);

Does this stop the RTC or just the register interface?

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rzn1_rtc_of_match[] = {
> +	{ .compatible	= "renesas,rzn1-rtc" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
> +
> +static struct platform_driver rzn1_rtc_driver = {
> +	.probe = rzn1_rtc_probe,
> +	.remove = rzn1_rtc_remove,
> +	.driver = {
> +		.name	= "rzn1-rtc",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = rzn1_rtc_of_match,
> +	},
> +};
> +module_platform_driver(rzn1_rtc_driver);
> +
> +MODULE_AUTHOR("Michel Pollet <Michel.Pollet@bp.renesas.com");
> +MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
> +MODULE_DESCRIPTION("RZ/N1 RTC driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.27.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

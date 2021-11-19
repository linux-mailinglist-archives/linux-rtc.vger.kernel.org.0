Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9980A4578C8
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 23:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhKSWb1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 17:31:27 -0500
Received: from mx-out.tlen.pl ([193.222.135.158]:52329 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229585AbhKSWb1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 19 Nov 2021 17:31:27 -0500
Received: (wp-smtpd smtp.tlen.pl 21250 invoked from network); 19 Nov 2021 23:28:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1637360902; bh=2VwUFS/n/2yA1iBx69olPGlhaNTOsx2x5gL0oSYwOBU=;
          h=Subject:To:From:Cc;
          b=PprrUpxvGKJw66qNoFzndYixnkwogIswXS2xXB6KUioGzN8FVqrwNEC4Le3dKMXX7
           JfX0Sbbfs7024JmjNtXXth0UiAvItGihNIjwRqNjdIjORs6YalndBEWrBAhW1KhsIQ
           XkYvMzrvJ7ql6Ou2xaEaPoP8d7wlTlWYAzM/6yH4=
Received: from aaen55.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.117.55])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <vincent.sunplus@gmail.com>; 19 Nov 2021 23:28:22 +0100
Message-ID: <d4a2d30f-e631-91c3-fbec-ff7610537dd2@o2.pl>
Date:   Fri, 19 Nov 2021 23:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] rtc: Add driver for Sunplus SP7021
Content-Language: en-GB
To:     Vincent Shih <vincent.sunplus@gmail.com>
References: <1636439898-7358-2-git-send-email-vincent.shih () sunplus ! com>
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1636439898-7358-2-git-send-email-vincent.shih () sunplus ! com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 8854cd3ac6ba6389f8472a82940a34bc
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000A [wbME]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

W dniu 09.11.2021 o 07:38, Vincent Shih pisze:

> Add driver for Sunplus SP7021

If I understand correctly, SP7021 is the name of the SoC, not of the RTC. So the commit subject should be something like "Add driver for RTC in Sunplus SP7021".

> Signed-off-by: Vincent Shih <vincent.shih@sunplus.com>
> ---
> Changes in v2:
>  - Addressed the comments from Mr. Philipp Zabel
>  - Addressed the comments from Mr. Randy Dunlap
>  - Addressed the comments from Mr. Alexandre Belloni
>  - Sorted the files in Makefile
>
>  MAINTAINERS               |   6 +
>  drivers/rtc/Kconfig       |  11 ++
>  drivers/rtc/Makefile      |   1 +
>  drivers/rtc/rtc-sunplus.c | 370 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 388 insertions(+)
>  create mode 100644 drivers/rtc/rtc-sunplus.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b79fd4..6c1a535 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17945,6 +17945,12 @@ L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/ethernet/dlink/sundance.c
>  
> +SUNPLUS RTC DRIVER
> +M:	Vincent Shih <vincent.shih@sunplus.com>
> +L:	linux-rtc@vger.kernel.org
> +S:	Maintained
> +F:	drivers/rtc/rtc-sunplus.c
> +
>  SUPERH
>  M:	Yoshinori Sato <ysato@users.sourceforge.jp>
>  M:	Rich Felker <dalias@libc.org>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e1bc521..7ca6765 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1028,6 +1028,17 @@ config RTC_DRV_DS1685_FAMILY
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-ds1685.
>  
> +config RTC_DRV_SUNPLUS
> +	bool "Sunplus SP7021 RTC"
> +	depends on SOC_SP7021
> +	help
> +	  Say 'yes' to get support for Sunplus SP7021 real-time clock
> +	  (RTC) for industrial applications.
> +

Maybe:
"Say 'yes' to get support for the real-time clock present in Sunplus SP7021 - a SoC for industrial applications."

> +	  It provides RTC status check, timer/alarm functionalities,
> +	  user data reservation only with battery with voltage over 2.5V,

I'm sorry, but I don't understand. What is "user data reservation only"?

> +	  RTC power status check and battery charge.
> +
>  choice
>  	prompt "Subtype"
>  	depends on RTC_DRV_DS1685_FAMILY
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 5ceeafe..93cb4b2 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -164,6 +164,7 @@ obj-$(CONFIG_RTC_DRV_STM32) 	+= rtc-stm32.o
>  obj-$(CONFIG_RTC_DRV_STMP)	+= rtc-stmp3xxx.o
>  obj-$(CONFIG_RTC_DRV_SUN4V)	+= rtc-sun4v.o
>  obj-$(CONFIG_RTC_DRV_SUN6I)	+= rtc-sun6i.o
> +obj-$(CONFIG_RTC_DRV_SUNPLUS)	+= rtc-sunplus.o
>  obj-$(CONFIG_RTC_DRV_SUNXI)	+= rtc-sunxi.o
>  obj-$(CONFIG_RTC_DRV_TEGRA)	+= rtc-tegra.o
>  obj-$(CONFIG_RTC_DRV_TEST)	+= rtc-test.o
> diff --git a/drivers/rtc/rtc-sunplus.c b/drivers/rtc/rtc-sunplus.c
> new file mode 100644
> index 0000000..73c400d
> --- /dev/null
> +++ b/drivers/rtc/rtc-sunplus.c
> @@ -0,0 +1,370 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/*												  */
> +/* The RTC driver for Sunplus	SP7021								  */
> +/*												  */
> +/* Copyright (C) 2019 Sunplus Technology Inc., All rights reseerved.				  */
> +/*												  */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/ktime.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/reset.h>
> +#include <linux/rtc.h>
> +#include <linux/platform_device.h>
> +
> +#define RTC_REG_NAME			"rtc_reg"
> +
> +#define RTC_CTRL			0x40
> +#define TIMER_FREEZE			(0x1 << 5)
> +#define TIMER_FREEZE_MASK		(1 << (5 + 16))
> +#define DIS_SYS_RST_RTC			(0x1 << 4)
> +#define DIS_SYS_RST_RTC_MASK		(1 << (4 + 16))
> +#define RTC32K_MODE_RESET		(0x1 << 3)
> +#define RTC32K_MODE_RESET_MASK		(1 << (3 + 16))
> +#define ALARM_EN_OVERDUE		(0x1 << 2)
> +#define ALARM_EN_OVERDUE_MASK		(1 << (2 + 16))
> +#define ALARM_EN_PMC			(0x1 << 1)
> +#define ALARM_EN_PMC_MASK		(1 << (1 + 16))
> +#define ALARM_EN			(0x1 << 0)
> +#define ALARM_EN_MASK			(1 << (0 + 16))
> +#define RTC_TIMER_OUT			0x44
> +#define RTC_DIVIDER			0x48
> +#define RTC_TIMER_SET			0x4c
> +#define RTC_ALARM_SET			0x50
> +#define RTC_USER_DATA			0x54
> +#define RTC_RESET_RECORD		0x58
> +#define RTC_BATTERY_CTRL		0x5c
> +#define BAT_CHARGE_RSEL_2K_OHM		(0x0 << 2)
> +#define BAT_CHARGE_RSEL_250_OHM		(0x1 << 2)
> +#define BAT_CHARGE_RSEL_50_OHM		(0x2 << 2)
> +#define BAT_CHARGE_RSEL_0_OHM		(0x3 << 2)
> +#define BAT_CHARGE_RSEL_MASK		(0x3 << (2 + 16))
> +#define BAT_CHARGE_DSEL_ON		(0x0 << 1)
> +#define BAT_CHARGE_DSEL_OFF		(0x1 << 1)
> +#define BAT_CHARGE_DSEL_MASK		(0x1 << (1 + 16))
> +#define BAT_CHARGE_EN			(0x1 << 0)
> +#define BAT_CHARGE_EN_MASK		(0x1 << (0 + 16))
> +#define RTC_TRIM_CTRL			0x60
> +
> +struct sunplus_rtc {
> +	struct clk *rtcclk;
> +	struct reset_control *rstc;
> +	void __iomem *base;
> +	u32 ohms;
> +};
> +
> +struct sunplus_rtc sp_rtc;
> +
> +static void sp_get_seconds(unsigned long *secs)
> +{
> +	*secs = (unsigned long)readl(sp_rtc.base + RTC_TIMER_OUT);
> +}
> +
> +static void sp_set_seconds(unsigned long secs)
> +{
> +	writel((u32)secs, sp_rtc.base + RTC_TIMER_SET);
> +}
> +
> +static int sp_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	unsigned long secs;
> +
> +	sp_get_seconds(&secs);
> +	rtc_time64_to_tm(secs, tm);
> +	dev_dbg(dev, "%s:  RTC date/time to %d-%d-%d, %02d:%02d:%02d.\r\n",
> +		__func__, tm->tm_mday, tm->tm_mon + 1, tm->tm_year,
> +					tm->tm_hour, tm->tm_min, tm->tm_sec);
> +
> +	return rtc_valid_tm(tm);
> +}

Is it necessary to call rtc_valid_tm(tm) here?

> +
> +int sp_rtc_get_time(struct rtc_time *tm)
> +{
> +	unsigned long secs;
> +
> +	sp_get_seconds(&secs);
> +	rtc_time64_to_tm(secs, tm);
> +
> +	return 0;
> +}
> +

This function looks unused.

> +static int sp_rtc_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	dev_dbg(&pdev->dev, "[RTC] Debug: %s(%d)\n", __func__, __LINE__);
> +
> +	// Keep RTC from system reset
> +	writel(DIS_SYS_RST_RTC_MASK | DIS_SYS_RST_RTC, sp_rtc.base + RTC_CTRL);
> +
> +	return 0;
> +}
> +
> +static int sp_rtc_resume(struct platform_device *pdev)
> +{
> +	/*						*/
> +	/* Because RTC is still powered during suspend,	*/
> +	/* there is nothing to do here.			*/
> +	/*						*/
> +	dev_dbg(&pdev->dev, "[RTC] Debug: %s(%d)\n", __func__, __LINE__);
> +
> +	// Keep RTC from system reset
> +	writel(DIS_SYS_RST_RTC_MASK | DIS_SYS_RST_RTC, sp_rtc.base + RTC_CTRL);
> +
> +	return 0;
> +}
> +
> +static int sp_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	unsigned long secs;
> +
> +	secs = rtc_tm_to_time64(tm);
> +	dev_dbg(dev, "%s, secs = %lu\n", __func__, secs);
> +	sp_set_seconds(secs);
> +
> +	return 0;
> +}
> +
> +static int sp_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	unsigned long alarm_time;
> +
> +	alarm_time = rtc_tm_to_time64(&alrm->time);
> +	dev_dbg(dev, "%s, alarm_time: %u\n", __func__, (u32)(alarm_time));
> +	writel((u32)alarm_time, sp_rtc.base + RTC_ALARM_SET);
> +
> +	return 0;
> +}
> +
> +static int sp_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	unsigned int alarm_time;
> +
> +	alarm_time = readl(sp_rtc.base + RTC_ALARM_SET);
> +	dev_dbg(dev, "%s, alarm_time: %u\n", __func__, alarm_time);
> +
> +	if (alarm_time == 0) {
> +		// alarm is disabled
> +		alrm->enabled = 0;
> +	} else {
> +		// alarm is enabled
> +		alrm->enabled = 1;
> +		rtc_time64_to_tm((unsigned long)(alarm_time), &alrm->time);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sp_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	if (enabled)
> +		writel((TIMER_FREEZE_MASK | DIS_SYS_RST_RTC_MASK | RTC32K_MODE_RESET_MASK |
> +				ALARM_EN_OVERDUE_MASK | ALARM_EN_PMC_MASK | ALARM_EN_MASK) |
> +					(DIS_SYS_RST_RTC | ALARM_EN_OVERDUE | ALARM_EN_PMC |
> +						ALARM_EN), sp_rtc.base + RTC_CTRL);
> +	else
> +		writel((ALARM_EN_OVERDUE_MASK | ALARM_EN_PMC_MASK | ALARM_EN_MASK) | 0x0,
> +				sp_rtc.base + RTC_CTRL);
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops sp_rtc_ops = {
> +	.read_time =		sp_rtc_read_time,
> +	.set_time =		sp_rtc_set_time,
> +	.set_alarm =		sp_rtc_set_alarm,
> +	.read_alarm =		sp_rtc_read_alarm,
> +	.alarm_irq_enable =	sp_rtc_alarm_irq_enable,
> +};
> +
> +static irqreturn_t rtc_irq_handler(int irq, void *dev_id)
> +{

Perhaps rename to "sp_rtc_irq_handler".

> +	struct platform_device *plat_dev = dev_id;
> +	struct rtc_device *rtc = platform_get_drvdata(plat_dev);
> +
> +	rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF);
> +	dev_dbg(&plat_dev->dev, "[RTC] ALARM INT\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/* ---------------------------------------------------------------------------------------------- */
> +/* bat_charge_rsel   bat_charge_dsel   bat_charge_en     Remarks				  */
> +/*         x              x                 0            Disable				  */
> +/*         0              0                 1            0.86mA (2K Ohm with diode)		  */
> +/*         1              0                 1            1.81mA (250 Ohm with diode)		  */
> +/*         2              0                 1            2.07mA (50 Ohm with diode)		  */
> +/*         3              0                 1            16.0mA (0 Ohm with diode)		  */
> +/*         0              1                 1            1.36mA (2K Ohm without diode)		  */
> +/*         1              1                 1            3.99mA (250 Ohm without diode)		  */
> +/*         2              1                 1            4.41mA (50 Ohm without diode)		  */
> +/*         3              1                 1            16.0mA (0 Ohm without diode)		  */
> +/* ---------------------------------------------------------------------------------------------- */
> +static void sp_rtc_set_trickle_charger(struct device dev)
> +{
> +	int ret;
> +	u32 rsel;
> +
> +	ret = of_property_read_u32(dev.of_node, "trickle-resistor-ohms", &sp_rtc.ohms);
> +	if (ret)
> +		return;
> +
> +	switch (sp_rtc.ohms) {
> +	case 2000:
> +		rsel = BAT_CHARGE_RSEL_2K_OHM;
> +		break;
> +	case 250:
> +		rsel = BAT_CHARGE_RSEL_250_OHM;
> +		break;
> +	case 50:
> +		rsel = BAT_CHARGE_RSEL_50_OHM;
> +		break;
> +	case 0:
> +		rsel = BAT_CHARGE_RSEL_0_OHM;
> +		break;
> +	default:
> +		return;

I think that some warning message should be printed here.

> +	}
> +
> +	writel(BAT_CHARGE_RSEL_MASK | rsel, sp_rtc.base + RTC_BATTERY_CTRL);
> +
> +	ret = of_property_read_bool(dev.of_node, "trickle-diode-disable");
> +	if (ret)
> +		writel(BAT_CHARGE_DSEL_MASK | BAT_CHARGE_DSEL_OFF, sp_rtc.base + RTC_BATTERY_CTRL);
> +	else
> +		writel(BAT_CHARGE_DSEL_MASK | BAT_CHARGE_DSEL_ON, sp_rtc.base + RTC_BATTERY_CTRL);
> +
> +	writel(BAT_CHARGE_EN_MASK | BAT_CHARGE_EN, sp_rtc.base + RTC_BATTERY_CTRL);
> +}
> +
> +static int sp_rtc_probe(struct platform_device *plat_dev)
> +{
> +	struct rtc_device *rtc;
> +	struct resource *res;
> +	const struct rtc_class_ops *rtc_ops;
> +	void __iomem *reg_base;
> +	int ret, irq;
> +
> +	memset(&sp_rtc, 0, sizeof(sp_rtc));
> +
> +	// find and map our resources
> +	res = platform_get_resource_byname(plat_dev, IORESOURCE_MEM, RTC_REG_NAME);
> +
> +	if (res) {
> +		dev_dbg(&plat_dev->dev, "res = 0x%x\n", res->start);
> +
> +		reg_base = devm_ioremap_resource(&plat_dev->dev, res);
> +		if (IS_ERR(reg_base)) {
> +			dev_err(&plat_dev->dev, "%s devm_ioremap_resource fail\n", RTC_REG_NAME);
> +			return PTR_ERR(reg_base);
> +		}
> +
> +		dev_dbg(&plat_dev->dev, "reg_base = 0x%lx\n", (unsigned long)reg_base);
> +	}

Handle correctly the case when (res == NULL) - currently the function keeps running with undefined value of reg_base.

> +
> +	sp_rtc.base = reg_base;
> +	rtc_ops = &sp_rtc_ops;
> +
> +	// Keep RTC from system reset
> +	writel(DIS_SYS_RST_RTC_MASK | DIS_SYS_RST_RTC, sp_rtc.base + RTC_CTRL);

I would suggest to extract the above line into a function as it appears three times in this file.

Note: I'm quite new to kernel development, I also did not review this patch throughly.


Greetings,
Mateusz


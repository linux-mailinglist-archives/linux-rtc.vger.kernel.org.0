Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48E898ED8
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 11:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733006AbfHVJMg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 05:12:36 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38632 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730869AbfHVJMf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 05:12:35 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so6915737edo.5;
        Thu, 22 Aug 2019 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=llMGzAdUzLE+evPAEKbZ1kfpxlhpe599MevDoo0BoJ8=;
        b=Xob6MapsxfjhnvGNx2O7Pjt2GqVtTMY1imD1NVfyUm/QBKNrW9lS6FE9juJtpAlvf1
         zVSXVm1uv1n4fv7KyXVW5gM/thWRMHaytALCddRuGYLoUWoGwdvCh8Mm+t5ejV6l93Kj
         m3VZ9Dd3uhnbQDUvFLGRjscgbvSAO+4MYXi8F79hXYSAYCe4mA7v6bk5VA1elsLjCGT5
         o5Y9KhwPflXrkloIivvMHWjaUr/mWF5OdVE9QkjHo2F8IgfDE6+e0l+DhPbC57rUjNuk
         O1R3HlNWm9Qq6DQZqnaRiU1ZsxNjenB9mPxGoSo64Wxg/Ui9HMco/Op+e7gfFQuuEv+z
         jJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=llMGzAdUzLE+evPAEKbZ1kfpxlhpe599MevDoo0BoJ8=;
        b=pZudq5b8dBsGZFiFk2IiKz3FNniM1NS58wiTFI+IxGQZoPqEVvS6488RCLvwMzQTB2
         qDsDkg47JkWtGzyGYMi9GuYLmv/9tNKPF+FOk1irYCMjBujY8o1h6yzCq3vms8i3HbAC
         3QtEpTwa+iwi/lExXaGxTCVox36q+ppcGECQBB3kc+eGgZ4RVFx2h1IsOk63ZVZI3prW
         4Kq0fXpfKCGV6PbkUumW6Uo3ttm/SKEv5SxUrYPMKiGf0veuVXOQIr2E/J4asSsUS3Ph
         fmJFY1XzinxjWwbSwfrPVNQrkwUq0tXPaf2ex0iq/VibBJivVHpijVZv1gagt+FLi2kW
         cxHA==
X-Gm-Message-State: APjAAAXXGA0GNFU7D54mgKxLbF4r8JBwmRSNZsJnH6yRi6pWcpCOcX58
        p5N3gMqHQGCoCbhvOP/rF/M=
X-Google-Smtp-Source: APXvYqz1x9KEPNipj5rt8TpT8rV3ZEAauihF+EyIqPxAnSccVSuQw4K163graDfqpHmbYbh59V/XnQ==
X-Received: by 2002:a17:906:31c9:: with SMTP id f9mr35010681ejf.168.1566465151803;
        Thu, 22 Aug 2019 02:12:31 -0700 (PDT)
Received: from ziggy.stardust ([37.223.137.147])
        by smtp.gmail.com with ESMTPSA id z1sm3571017ejw.52.2019.08.22.02.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2019 02:12:31 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
To:     Ran Bi <ran.bi@mediatek.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
 <20190801110122.26834-3-ran.bi@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
 jrHWeQEI2ucSKsNa8FllDmG/fQ==
Message-ID: <c4e8b041-4a35-578e-07a3-2ebc99848ee2@gmail.com>
Date:   Thu, 22 Aug 2019 11:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801110122.26834-3-ran.bi@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 01/08/2019 13:01, Ran Bi wrote:
> This add support for the MediaTek MT2712 RTC. It was SoC based RTC, but
> had different architecture compared with MT7622 RTC.
> 
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> ---
>  drivers/rtc/Kconfig      |  10 +
>  drivers/rtc/Makefile     |   1 +
>  drivers/rtc/rtc-mt2712.c | 444 +++++++++++++++++++++++++++++++++++++++

Can't we just adjust rtc-mt7622.c (and rename it) to unify the source for both
devices. What is the difference that we need to write a driver of our own?

Regards,
Matthias

>  3 files changed, 455 insertions(+)
>  create mode 100644 drivers/rtc/rtc-mt2712.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e72f65b61176..977d0f480dc7 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1772,6 +1772,16 @@ config RTC_DRV_MOXART
>  	   This driver can also be built as a module. If so, the module
>  	   will be called rtc-moxart
>  
> +config RTC_DRV_MT2712
> +	tristate "MediaTek MT2712 SoC based RTC"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	help
> +	  This enables support for the real time clock built in the MediaTek
> +	  SoCs for MT2712.
> +
> +	  This drive can also be built as a module. If so, the module
> +	  will be called rtc-mt2712.
> +
>  config RTC_DRV_MT6397
>  	tristate "MediaTek PMIC based RTC"
>  	depends on MFD_MT6397 || (COMPILE_TEST && IRQ_DOMAIN)
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 6b09c21dc1b6..7c6cf70af281 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -108,6 +108,7 @@ obj-$(CONFIG_RTC_DRV_MESON)	+= rtc-meson.o
>  obj-$(CONFIG_RTC_DRV_MOXART)	+= rtc-moxart.o
>  obj-$(CONFIG_RTC_DRV_MPC5121)	+= rtc-mpc5121.o
>  obj-$(CONFIG_RTC_DRV_MSM6242)	+= rtc-msm6242.o
> +obj-$(CONFIG_RTC_DRV_MT2712)	+= rtc-mt2712.o
>  obj-$(CONFIG_RTC_DRV_MT6397)	+= rtc-mt6397.o
>  obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
>  obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
> diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
> new file mode 100644
> index 000000000000..1eb71ca64c2c
> --- /dev/null
> +++ b/drivers/rtc/rtc-mt2712.c
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ran Bi <ran.bi@mediatek.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +
> +#define MTK_RTC_DEV		KBUILD_MODNAME
> +
> +#define MT2712_BBPU		0x0000
> +#define MT2712_BBPU_CLRPKY	BIT(4)
> +#define MT2712_BBPU_RELOAD	BIT(5)
> +#define MT2712_BBPU_CBUSY	BIT(6)
> +#define MT2712_BBPU_KEY		(0x43 << 8)
> +
> +#define MT2712_IRQ_STA		0x0004
> +#define MT2712_IRQ_STA_AL	BIT(0)
> +#define MT2712_IRQ_STA_TC	BIT(1)
> +
> +#define MT2712_IRQ_EN		0x0008
> +#define MT2712_IRQ_EN_AL	BIT(0)
> +#define MT2712_IRQ_EN_TC	BIT(1)
> +#define MT2712_IRQ_EN_ONESHOT	BIT(2)
> +#define MT2712_IRQ_EN_ONESHOT_AL \
> +				(MT2712_IRQ_EN_ONESHOT | MT2712_IRQ_EN_AL)
> +
> +#define MT2712_CII_EN		0x000c
> +
> +#define MT2712_AL_MASK		0x0010
> +#define MT2712_AL_MASK_DOW	BIT(4)
> +
> +#define MT2712_TC_SEC		0x0014
> +#define MT2712_TC_MIN		0x0018
> +#define MT2712_TC_HOU		0x001c
> +#define MT2712_TC_DOM		0x0020
> +#define MT2712_TC_DOW		0x0024
> +#define MT2712_TC_MTH		0x0028
> +#define MT2712_TC_YEA		0x002c
> +
> +#define MT2712_AL_SEC		0x0030
> +#define MT2712_AL_MIN		0x0034
> +#define MT2712_AL_HOU		0x0038
> +#define MT2712_AL_DOM		0x003c
> +#define MT2712_AL_DOW		0x0040
> +#define MT2712_AL_MTH		0x0044
> +#define MT2712_AL_YEA		0x0048
> +
> +#define MT2712_SEC_MASK		0x003f
> +#define MT2712_MIN_MASK		0x003f
> +#define MT2712_HOU_MASK		0x001f
> +#define MT2712_DOM_MASK		0x001f
> +#define MT2712_DOW_MASK		0x0007
> +#define MT2712_MTH_MASK		0x000f
> +#define MT2712_YEA_MASK		0x007f
> +
> +#define MT2712_POWERKEY1	0x004c
> +#define MT2712_POWERKEY2	0x0050
> +#define MT2712_POWERKEY1_KEY	0xa357
> +#define MT2712_POWERKEY2_KEY	0x67d2
> +
> +#define MT2712_CON0		0x005c
> +#define MT2712_CON1		0x0060
> +
> +#define MT2712_PROT		0x0070
> +#define MT2712_PROT_UNLOCK1	0x9136
> +#define MT2712_PROT_UNLOCK2	0x586a
> +
> +#define MT2712_WRTGR		0x0078
> +
> +/* we map HW YEAR 0 to 2000 because 2000 is the leap year */
> +#define MT2712_MIN_YEAR		2000
> +#define MT2712_BASE_YEAR	1900
> +#define MT2712_MIN_YEAR_OFFSET	(MT2712_MIN_YEAR - MT2712_BASE_YEAR)
> +#define MT2712_MAX_YEAR_OFFSET	(MT2712_MIN_YEAR_OFFSET + 127)
> +
> +struct mt2712_rtc {
> +	struct device		*dev;
> +	struct rtc_device	*rtc_dev;
> +	void __iomem		*base;
> +	int			irq;
> +	u8			irq_wake_enabled;
> +};
> +
> +static inline u32 mt2712_readl(struct mt2712_rtc *rtc, u32 reg)
> +{
> +	return readl(rtc->base + reg);
> +}
> +
> +static inline void mt2712_writel(struct mt2712_rtc *rtc, u32 reg, u32 val)
> +{
> +	writel(val, rtc->base + reg);
> +}
> +
> +static void mt2712_rtc_write_trigger(struct mt2712_rtc *rtc)
> +{
> +	unsigned long timeout = jiffies + HZ/10;
> +
> +	mt2712_writel(rtc, MT2712_WRTGR, 1);
> +	while (1) {
> +		if (!(mt2712_readl(rtc, MT2712_BBPU) & MT2712_BBPU_CBUSY))
> +			break;
> +
> +		if (time_after(jiffies, timeout)) {
> +			dev_err(rtc->dev, "%s time out!\n", __func__);
> +			break;
> +		}
> +		cpu_relax();
> +	}
> +}
> +
> +static void mt2712_rtc_writeif_unlock(struct mt2712_rtc *rtc)
> +{
> +	mt2712_writel(rtc, MT2712_PROT, MT2712_PROT_UNLOCK1);
> +	mt2712_rtc_write_trigger(rtc);
> +	mt2712_writel(rtc, MT2712_PROT, MT2712_PROT_UNLOCK2);
> +	mt2712_rtc_write_trigger(rtc);
> +}
> +
> +static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
> +{
> +	struct mt2712_rtc *rtc = data;
> +	u16 irqsta, irqen;
> +
> +	mutex_lock(&rtc->rtc_dev->ops_lock);
> +
> +	irqsta = mt2712_readl(rtc, MT2712_IRQ_STA);
> +	if (irqsta & MT2712_IRQ_STA_AL) {
> +		rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +		irqen = irqsta & ~MT2712_IRQ_EN_AL;
> +
> +		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
> +		mt2712_rtc_write_trigger(rtc);
> +
> +		mutex_unlock(&rtc->rtc_dev->ops_lock);
> +		return IRQ_HANDLED;
> +	}
> +
> +	mutex_unlock(&rtc->rtc_dev->ops_lock);
> +	return IRQ_NONE;
> +}
> +
> +static void __mt2712_rtc_read_time(struct mt2712_rtc *rtc,
> +				   struct rtc_time *tm, int *sec)
> +{
> +	tm->tm_sec  = mt2712_readl(rtc, MT2712_TC_SEC) & MT2712_SEC_MASK;
> +	tm->tm_min  = mt2712_readl(rtc, MT2712_TC_MIN) & MT2712_MIN_MASK;
> +	tm->tm_hour = mt2712_readl(rtc, MT2712_TC_HOU) & MT2712_HOU_MASK;
> +	tm->tm_mday = mt2712_readl(rtc, MT2712_TC_DOM) & MT2712_DOM_MASK;
> +	tm->tm_mon  = mt2712_readl(rtc, MT2712_TC_MTH) & MT2712_MTH_MASK;
> +	tm->tm_year = mt2712_readl(rtc, MT2712_TC_YEA) & MT2712_YEA_MASK;
> +
> +	*sec = mt2712_readl(rtc, MT2712_TC_SEC) & MT2712_SEC_MASK;
> +}
> +
> +static int mt2712_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +	int sec;
> +
> +	do {
> +		__mt2712_rtc_read_time(rtc, tm, &sec);
> +	} while (sec < tm->tm_sec);	/* SEC has carried */
> +
> +	/* HW register use 7 bits to store year data, minus
> +	 * MT2712_MIN_YEAR_OFFSET brfore write year data to register, and plus
> +	 * MT2712_MIN_YEAR_OFFSET back after read year from register
> +	 */
> +	tm->tm_year += MT2712_MIN_YEAR_OFFSET;
> +
> +	/* HW register start mon from one, but tm_mon start from zero. */
> +	tm->tm_mon--;
> +
> +	if (rtc_valid_tm(tm)) {
> +		dev_dbg(rtc->dev, "%s: invalid time %ptR\n", __func__, tm);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt2712_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (tm->tm_year > MT2712_MAX_YEAR_OFFSET) {
> +		dev_dbg(rtc->dev, "Set year %d out of range. (%d - %d)\n",
> +			1900 + tm->tm_year, 1900 + MT2712_MIN_YEAR_OFFSET,
> +			1900 + MT2712_MAX_YEAR_OFFSET);
> +		return -EINVAL;
> +	}
> +
> +	tm->tm_year -= MT2712_MIN_YEAR_OFFSET;
> +	tm->tm_mon++;
> +
> +	mt2712_writel(rtc, MT2712_TC_SEC, tm->tm_sec  & MT2712_SEC_MASK);
> +	mt2712_writel(rtc, MT2712_TC_MIN, tm->tm_min  & MT2712_MIN_MASK);
> +	mt2712_writel(rtc, MT2712_TC_HOU, tm->tm_hour & MT2712_HOU_MASK);
> +	mt2712_writel(rtc, MT2712_TC_DOM, tm->tm_mday & MT2712_DOM_MASK);
> +	mt2712_writel(rtc, MT2712_TC_MTH, tm->tm_mon  & MT2712_MTH_MASK);
> +	mt2712_writel(rtc, MT2712_TC_YEA, tm->tm_year & MT2712_YEA_MASK);
> +
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	return 0;
> +}
> +
> +static int mt2712_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +	struct rtc_time *tm = &alm->time;
> +	u16 irqen;
> +
> +	irqen = mt2712_readl(rtc, MT2712_IRQ_EN);
> +	alm->enabled = !!(irqen & MT2712_IRQ_EN_AL);
> +
> +	tm->tm_sec  = mt2712_readl(rtc, MT2712_AL_SEC) & MT2712_SEC_MASK;
> +	tm->tm_min  = mt2712_readl(rtc, MT2712_AL_MIN) & MT2712_MIN_MASK;
> +	tm->tm_hour = mt2712_readl(rtc, MT2712_AL_HOU) & MT2712_HOU_MASK;
> +	tm->tm_mday = mt2712_readl(rtc, MT2712_AL_DOM) & MT2712_DOM_MASK;
> +	tm->tm_mon  = mt2712_readl(rtc, MT2712_AL_MTH) & MT2712_MTH_MASK;
> +	tm->tm_year = mt2712_readl(rtc, MT2712_AL_YEA) & MT2712_YEA_MASK;
> +
> +	tm->tm_year += MT2712_MIN_YEAR_OFFSET;
> +	tm->tm_mon--;
> +
> +	if (rtc_valid_tm(tm)) {
> +		dev_dbg(rtc->dev, "%s: invalid alarm %ptR\n", __func__, tm);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt2712_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +	struct rtc_time *tm = &alm->time;
> +	u16 irqen;
> +
> +	if (tm->tm_year > MT2712_MAX_YEAR_OFFSET) {
> +		dev_dbg(rtc->dev, "Set year %d out of range. (%d - %d)\n",
> +			1900 + tm->tm_year, 1900 + MT2712_MIN_YEAR_OFFSET,
> +			1900 + MT2712_MAX_YEAR_OFFSET);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(rtc->dev, "set al time: %ptR, alm en: %d\n", tm, alm->enabled);
> +
> +	tm->tm_year -= MT2712_MIN_YEAR_OFFSET;
> +	tm->tm_mon++;
> +
> +	irqen = mt2712_readl(rtc, MT2712_IRQ_EN) & ~(MT2712_IRQ_EN_ONESHOT_AL);
> +	mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	mt2712_writel(rtc, MT2712_AL_SEC,
> +		      (mt2712_readl(rtc, MT2712_AL_SEC) & ~(MT2712_SEC_MASK)) |
> +		      (tm->tm_sec  & MT2712_SEC_MASK));
> +	mt2712_writel(rtc, MT2712_AL_MIN,
> +		      (mt2712_readl(rtc, MT2712_AL_MIN) & ~(MT2712_MIN_MASK)) |
> +		      (tm->tm_min  & MT2712_MIN_MASK));
> +	mt2712_writel(rtc, MT2712_AL_HOU,
> +		      (mt2712_readl(rtc, MT2712_AL_HOU) & ~(MT2712_HOU_MASK)) |
> +		      (tm->tm_hour & MT2712_HOU_MASK));
> +	mt2712_writel(rtc, MT2712_AL_DOM,
> +		      (mt2712_readl(rtc, MT2712_AL_DOM) & ~(MT2712_DOM_MASK)) |
> +		      (tm->tm_mday & MT2712_DOM_MASK));
> +	mt2712_writel(rtc, MT2712_AL_MTH,
> +		      (mt2712_readl(rtc, MT2712_AL_MTH) & ~(MT2712_MTH_MASK)) |
> +		      (tm->tm_mon  & MT2712_MTH_MASK));
> +	mt2712_writel(rtc, MT2712_AL_YEA,
> +		      (mt2712_readl(rtc, MT2712_AL_YEA) & ~(MT2712_YEA_MASK)) |
> +		      (tm->tm_year & MT2712_YEA_MASK));
> +
> +	mt2712_writel(rtc, MT2712_AL_MASK, MT2712_AL_MASK_DOW);	/* mask DOW */
> +
> +	if (alm->enabled) {
> +		irqen = mt2712_readl(rtc, MT2712_IRQ_EN) |
> +				     MT2712_IRQ_EN_ONESHOT_AL;
> +		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
> +	} else {
> +		irqen = mt2712_readl(rtc, MT2712_IRQ_EN) &
> +				     ~(MT2712_IRQ_EN_ONESHOT_AL);
> +		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
> +	}
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	return 0;
> +}
> +
> +/* Init RTC register */
> +static void mt2712_rtc_hw_init(struct mt2712_rtc *rtc)
> +{
> +	u32 p1, p2;
> +
> +	mt2712_writel(rtc, MT2712_BBPU, MT2712_BBPU_KEY | MT2712_BBPU_RELOAD);
> +
> +	mt2712_writel(rtc, MT2712_CII_EN, 0);
> +	mt2712_writel(rtc, MT2712_AL_MASK, 0);
> +	/* necessary before set MT2712_POWERKEY */
> +	mt2712_writel(rtc, MT2712_CON0, 0x4848);
> +	mt2712_writel(rtc, MT2712_CON1, 0x0048);
> +
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	mt2712_readl(rtc, MT2712_IRQ_STA);	/* read clear */
> +
> +	p1 = mt2712_readl(rtc, MT2712_POWERKEY1);
> +	p2 = mt2712_readl(rtc, MT2712_POWERKEY2);
> +	if (p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY)
> +		dev_dbg(rtc->dev, "powerkey not set (lost power)\n");
> +
> +	/* RTC need POWERKEY1/2 match, then goto normal work mode */
> +	mt2712_writel(rtc, MT2712_POWERKEY1, MT2712_POWERKEY1_KEY);
> +	mt2712_writel(rtc, MT2712_POWERKEY2, MT2712_POWERKEY2_KEY);
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	mt2712_rtc_writeif_unlock(rtc);
> +}
> +
> +static const struct rtc_class_ops mt2712_rtc_ops = {
> +	.read_time	= mt2712_rtc_read_time,
> +	.set_time	= mt2712_rtc_set_time,
> +	.read_alarm	= mt2712_rtc_read_alarm,
> +	.set_alarm	= mt2712_rtc_set_alarm,
> +};
> +
> +static int mt2712_rtc_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct mt2712_rtc *rtc;
> +	int ret;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt2712_rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	rtc->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(rtc->base))
> +		return PTR_ERR(rtc->base);
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0) {
> +		dev_err(&pdev->dev, "No IRQ resource\n");
> +		return rtc->irq;
> +	}
> +
> +	rtc->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, rtc);
> +
> +	rtc->rtc_dev = devm_rtc_allocate_device(rtc->dev);
> +	if (IS_ERR(rtc->rtc_dev))
> +		return PTR_ERR(rtc->rtc_dev);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> +					rtc_irq_handler_thread,
> +					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +					dev_name(rtc->dev), rtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
> +			rtc->irq, ret);
> +		return ret;
> +	}
> +
> +	/* rtc hw init */
> +	mt2712_rtc_hw_init(rtc);
> +
> +	device_init_wakeup(&pdev->dev, true);
> +
> +	rtc->rtc_dev->ops = &mt2712_rtc_ops;
> +
> +	ret = rtc_register_device(rtc->rtc_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "register rtc device failed\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mt2712_rtc_suspend(struct device *dev)
> +{
> +	int wake_status = 0;
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev)) {
> +		wake_status = enable_irq_wake(rtc->irq);
> +		if (!wake_status)
> +			rtc->irq_wake_enabled = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt2712_rtc_resume(struct device *dev)
> +{
> +	int wake_status = 0;
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev) && rtc->irq_wake_enabled) {
> +		wake_status = disable_irq_wake(rtc->irq);
> +		if (!wake_status)
> +			rtc->irq_wake_enabled = false;
> +	}
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
> +			 mt2712_rtc_resume);
> +#endif
> +
> +static const struct of_device_id mt2712_rtc_of_match[] = {
> +	{ .compatible = "mediatek,mt2712-rtc", },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, mt2712_rtc_of_match)
> +
> +static struct platform_driver mt2712_rtc_driver = {
> +	.driver = {
> +		.name = MTK_RTC_DEV,
> +		.of_match_table = mt2712_rtc_of_match,
> +		.pm = &mt2712_pm_ops,
> +	},
> +	.probe  = mt2712_rtc_probe,
> +};
> +
> +module_platform_driver(mt2712_rtc_driver);
> +
> +MODULE_DESCRIPTION("MediaTek MT2712 SoC based RTC Driver");
> +MODULE_AUTHOR("Ran Bi <ran.bi@mediatek.com>");
> +MODULE_LICENSE("GPL");
> 

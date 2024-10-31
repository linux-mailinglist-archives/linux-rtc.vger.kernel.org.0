Return-Path: <linux-rtc+bounces-2399-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815819B7F75
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 16:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12C801F2470C
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 15:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AF91A38C2;
	Thu, 31 Oct 2024 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVbC5+Qq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD4B1A0BE3;
	Thu, 31 Oct 2024 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730390310; cv=none; b=uQtE6nNkjco/IGnxBGk0qZPViMZx+LEaFDHtc0ki6TNvG3uxAj1OvNgkBjFoYnxfSohZMtE6yHgYFiieSYK9Cwf3Gawtr9kjXYI4w6vzDgUq3CbKXa1BCSA8P+KiCfe8BfUBlLRBPS4DgKMzzXKehuEihMjdRorCD1RceVURWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730390310; c=relaxed/simple;
	bh=hDIwEa742MdQHfSf5wcI1TMMVURVXiGDqoTb/7vyb+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSQws3I1+AomUa6sRZ9sLrA4ay+JE32PVdl+H2DgnSY/EunSJrbIYz8nBbbMl/kUp166iC8iERG/ymfzwaLyyD5SqiRqk4VYZD+mC2F0vY64XchTeNlRoWdLnakyWIhY7vHDmmBMv/pjxnDVZQ2HmNszbsG3VBoM3XRHIr+jEew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVbC5+Qq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF91CC4CEF9;
	Thu, 31 Oct 2024 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730390309;
	bh=hDIwEa742MdQHfSf5wcI1TMMVURVXiGDqoTb/7vyb+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BVbC5+QqhYdtLCOW2PwGD4wxZ6TCD27j4M/2+HoQsDdcGDl2uJQrtZ2l1wh9151Vb
	 /GlpbkqTRf8ldWRRckABZT7fThB7PjRKVBsvTWq/8WnSF70PXcSmvPaP+CRIKBcviZ
	 H3DE1GPLfPMuwiK8tZyluo2mgGKE2ORPE/DIdReUrV9sptB8kCuWyl2CnuAqEj8glS
	 vTmZOWzfcu7dSBFuJ8gDX+cJyVWlUoTjpEfjVX0kRzbwBl/SXmWIOo1oe1c1tbXkkj
	 6JIgTYfBZNktXEZ/voCqaEELqm1qiqJa68Od88cUrLntBmuBXUwwq0iUOYmA2epBBn
	 Lhc6jzWzvSsFg==
Message-ID: <2ad5ebf6-fb64-4647-b9c9-c274e59fa49f@kernel.org>
Date: Thu, 31 Oct 2024 16:58:23 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] rtc: mediatek: Add mt6685 RTC driver
To: shunxi zhang <ot_shunxi.zhang@mediatek.com>,
 alexandre.belloni@bootlin.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2024 14:58, shunxi zhang wrote:
> From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> 

Missing commit msg.

> Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> ---
>  drivers/rtc/Kconfig                  |   10 +
>  drivers/rtc/Makefile                 |    1 +
>  drivers/rtc/rtc-mt6685.c             | 1456 ++++++++++++++++++++++++++
>  include/linux/mfd/mt6685-audclk.h    |   11 +
>  include/linux/mfd/mt6685/core.h      |   22 +
>  include/linux/mfd/mt6685/registers.h |  921 ++++++++++++++++
>  include/linux/mfd/mt6685/rtc.h       |  318 ++++++

Two separate drivers should not be in one commit.

>  7 files changed, 2739 insertions(+)
>  create mode 100644 drivers/rtc/rtc-mt6685.c
>  create mode 100644 include/linux/mfd/mt6685-audclk.h
>  create mode 100644 include/linux/mfd/mt6685/core.h
>  create mode 100644 include/linux/mfd/mt6685/registers.h
>  create mode 100644 include/linux/mfd/mt6685/rtc.h
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 66eb1122248b..7af04dfac978 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1898,6 +1898,16 @@ config RTC_DRV_MT6397
>  
>  	  If you want to use MediaTek(R) RTC interface, select Y or M here.
>  
> +config RTC_DRV_MT6685
> +	tristate "Mediatek Real Time Clock driver"
> +	depends on MFD_MT6685 || (COMPILE_TEST && IRQ_DOMAIN)
> +	help
> +	  This selects the Mediatek(R) RTC driver. RTC is part of Mediatek
> +	  MT6685. You should enable MT6685 MFD before select
> +	  Mediatek(R) RTC driver.
> +
> +	  If you want to use Mediatek(R) RTC interface, select Y or M here.
> +
>  config RTC_DRV_MT7622
>  	tristate "MediaTek SoC based RTC"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index f62340ecc534..ec982192526d 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -110,6 +110,7 @@ obj-$(CONFIG_RTC_DRV_SSD202D)	+= rtc-ssd202d.o
>  obj-$(CONFIG_RTC_DRV_MSM6242)	+= rtc-msm6242.o
>  obj-$(CONFIG_RTC_DRV_MT2712)	+= rtc-mt2712.o
>  obj-$(CONFIG_RTC_DRV_MT6397)	+= rtc-mt6397.o
> +obj-$(CONFIG_RTC_DRV_MT6685)	+= rtc-mt6685.o
>  obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
>  obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
>  obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
> diff --git a/drivers/rtc/rtc-mt6685.c b/drivers/rtc/rtc-mt6685.c

Why this cannot be part of existing MT drivers?

> new file mode 100644
> index 000000000000..a3aa747a788a
> --- /dev/null
> +++ b/drivers/rtc/rtc-mt6685.c
> @@ -0,0 +1,1456 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 MediaTek Inc.
> + * Author: Amber Lin <Mw.lin@mediatek.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/rtc.h>
> +#include <linux/mfd/mt6685/rtc.h>
> +#include <linux/mfd/mt6685/core.h>
> +#include <linux/mfd/mt6685/registers.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/sched/clock.h>
> +#include <linux/spmi.h>
> +
> +#if IS_ENABLED(CONFIG_MTK_AEE_FEATURE)

There is no such stuff. Don't send us downstream code.

> +#include <mt-plat/aee.h>
> +#endif
> +
> +#ifdef SUPPORT_PWR_OFF_ALARM

???

> +#include <linux/notifier.h>
> +#include <linux/suspend.h>
> +#include <linux/completion.h>
> +#include <linux/workqueue.h>
> +#include <linux/jiffies.h>
> +#include <linux/cpumask.h>
> +#include <linux/reboot.h>

Drop all unrelated, unused headers.

> +#endif
> +
> +/*debug information*/
> +static int rtc_show_time;
> +static int rtc_show_alarm;
> +
> +module_param(rtc_show_time, int, 0644);
> +module_param(rtc_show_alarm, int, 0644);

Drop all four. What's the purpose?

> +
> +static int mtk_rtc_write_trigger(struct mt6685_rtc *rtc);
> +
> +static int counter;

Drop.


> +
> +static void power_on_mclk(struct mt6685_rtc *rtc)
> +{
> +	mutex_lock(&rtc->clk_lock);
> +	/*Power on RTC MCLK and 32k clk before write RTC register*/

This code has quite poor quality. I think you just send whatever you had
downstream. Code has multiple trivial issues which should be easily
pointed out by your internal review. Also multiple issues which we
already fixed in upstream and you are supposed to take *upstream*
driver, not downstream, and customize it. Please clean it up and consult
internal review before sending such stuff upstream.


> +	regmap_write(rtc->regmap, RG_RTC_32K_CK_PDN_CLR, RG_RTC_32K_CK_PDN_MASK);
> +	regmap_write(rtc->regmap, RG_RTC_MCLK_PDN_CLR, RG_RTC_MCLK_PDN_MASK);
> +	counter++;
> +	mdelay(1);
> +	mutex_unlock(&rtc->clk_lock);
> +}
> +
> +static void power_down_mclk(struct mt6685_rtc *rtc)
> +{
> +	mutex_lock(&rtc->clk_lock);
> +	counter--;
> +	if (counter < 0) {
> +		//dump_stack();
> +		pr_info("mclk_counter[%d]\n", counter);

Oh man... So many wrong things. This applies to entire code:
1. Drop dead code. All dead code.

2. Do not use pr_xxx but dev_xxx

3. Drop all such useless printks because your driver is supposed to be
silent.

4. Implement proper clock handling instead of reimplementing it yourself
with some counters.

...

> +
> +static const struct reg_field mt6685_cali_reg_fields[CALI_FILED_MAX] = {
> +	[EOSC_CALI_TD]		= REG_FIELD(EOSC_CALI_TD_MT6685, 0, 2),
> +};
> +
> +static int rtc_eosc_cali_td;
> +module_param(rtc_eosc_cali_td, int, 0644);

Why do you put module params in multiple places? This is supposed to be
in one, top level place, so we see all such interfaces.

Anyway, drop.


> +
> +static void mtk_rtc_enable_k_eosc(struct device *dev)
> +{
> +	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
> +	u32 td;
> +
> +	power_on_mclk(rtc);

This code is really suspicious.

> +
> +	if (!rtc->cali_is_supported) {
> +		power_down_mclk(rtc);
> +		return;
> +	}
> +
> +	if (rtc_eosc_cali_td) {
> +		dev_notice(dev, "%s: rtc_eosc_cali_td = %d\n",
> +			   __func__, rtc_eosc_cali_td);

No, drop.

> +		switch (rtc_eosc_cali_td) {
> +		case 1:
> +			td = EOSC_CALI_TD_01_SEC;
> +			break;
> +		case 2:
> +			td = EOSC_CALI_TD_02_SEC;
> +			break;
> +		case 4:
> +			td = EOSC_CALI_TD_04_SEC;
> +			break;
> +		case 16:
> +			td = EOSC_CALI_TD_16_SEC;
> +			break;
> +		default:
> +			td = EOSC_CALI_TD_08_SEC;
> +			break;
> +		}
> +
> +		rtc_field_write(rtc, &rtc->data->cali_reg_fields[EOSC_CALI_TD], td);
> +	}
> +	power_down_mclk(rtc);
> +}
> +
> +#ifdef SUPPORT_PWR_OFF_ALARM

Is this some sort of joke? There is no such thing.


> +
> +static u32 bootmode = NORMAL_BOOT;
> +static struct wakeup_source *mt6685_rtc_suspend_lock;
> +#if IS_ENABLED(CONFIG_PM)
> +static bool rtc_pm_notifier_registered;
> +static unsigned long rtc_pm_status;
> +#endif
> +static bool kpoc_alarm;
> +
> +#if IS_ENABLED(CONFIG_PM)
> +
> +#define PM_DUMMY 0xFFFF

NAK to all above.

> +
> +static int rtc_pm_event(struct notifier_block *notifier, unsigned long pm_event,
> +			void *unused)
> +{
> +	struct mt6685_rtc *rtc = container_of(notifier,
> +		struct mt6685_rtc, pm_nb);
> +
> +	switch (pm_event) {
> +	case PM_SUSPEND_PREPARE:
> +		rtc_pm_status = PM_SUSPEND_PREPARE;
> +		return NOTIFY_DONE;
> +	case PM_POST_SUSPEND:
> +		rtc_pm_status = PM_POST_SUSPEND;
> +		break;
> +	default:
> +		rtc_pm_status = PM_DUMMY;
> +		break;
> +	}
> +
> +	if (kpoc_alarm) {
> +		dev_notice(rtc->rtc_dev->dev.parent,
> +			   "%s trigger reboot\n", __func__);
> +		complete(&rtc->comp);
> +		kpoc_alarm = false;
> +	}
> +	return NOTIFY_DONE;
> +}
> +#endif /* CONFIG_PM */
> +
> +static void rtc_mark_kpoc(struct mt6685_rtc *rtc)
> +{
> +	power_on_mclk(rtc);
> +	mutex_lock(&rtc->lock);
> +	rtc_field_write(rtc, &rtc->data->spare_reg_fields[SPARE_KPOC], 1);
> +	mutex_unlock(&rtc->lock);
> +	power_down_mclk(rtc);
> +}
> +
> +static void mtk_rtc_work_queue(struct work_struct *work)
> +{
> +	struct mt6685_rtc *rtc = container_of(work, struct mt6685_rtc, work);
> +	unsigned long ret;
> +	unsigned int msecs;
> +
> +	ret = wait_for_completion_timeout(&rtc->comp, msecs_to_jiffies(30000));
> +	if (!ret) {
> +		dev_notice(rtc->rtc_dev->dev.parent, "%s timeout\n", __func__);
> +		WARN_ON(1);
> +	} else {
> +		msecs = jiffies_to_msecs(ret);
> +		dev_notice(rtc->rtc_dev->dev.parent,
> +			   "%s timeleft= %d\n", __func__, msecs);
> +		rtc_mark_kpoc(rtc);
> +		kernel_restart("kpoc");
> +	}
> +}
> +
> +static void mtk_rtc_reboot(struct mt6685_rtc *rtc)
> +{
> +	__pm_stay_awake(mt6685_rtc_suspend_lock);
> +
> +	init_completion(&rtc->comp);
> +	schedule_work_on(cpumask_first(cpu_online_mask), &rtc->work);
> +
> +#if IS_ENABLED(CONFIG_PM)
> +	if (!rtc_pm_notifier_registered)
> +		goto reboot;
> +
> +	if (rtc_pm_status != PM_SUSPEND_PREPARE)
> +		goto reboot;
> +#endif
> +
> +	kpoc_alarm = true;
> +
> +	dev_notice(rtc->rtc_dev->dev.parent, "%s:wait\n", __func__);
> +	return;
> +
> +#if IS_ENABLED(CONFIG_PM)
> +reboot:
> +	dev_notice(rtc->rtc_dev->dev.parent, "%s:trigger\n", __func__);
> +	complete(&rtc->comp);
> +#endif
> +}
> +
> +static void mtk_rtc_update_pwron_alarm_flag(struct mt6685_rtc *rtc)
> +{
> +	int ret;
> +
> +	power_on_mclk(rtc);
> +
> +	ret = rtc_update_bits(rtc,
> +			      rtc->addr_base + RTC_PDN1,
> +			      RTC_PDN1_PWRON_TIME, 0);
> +	if (ret < 0)
> +		goto exit;
> +
> +	ret =  rtc_update_bits(rtc,
> +			       rtc->addr_base + RTC_PDN2,
> +			       RTC_PDN2_PWRON_ALARM, RTC_PDN2_PWRON_ALARM);
> +	if (ret < 0)
> +		goto exit;
> +
> +	mtk_rtc_write_trigger(rtc);
> +	power_down_mclk(rtc);
> +	dev_notice(rtc->rtc_dev->dev.parent, "%s info\n", __func__);

NAK

> +	return;
> +
> +exit:
> +	power_down_mclk(rtc);
> +	dev_err(rtc->rtc_dev->dev.parent, "%s error\n", __func__);

NAK, what error? Be descriptive.


> +}
> +
> +static int mtk_rtc_restore_alarm(struct mt6685_rtc *rtc, struct rtc_time *tm)
> +{
> +	int ret;
> +	u16 data[RTC_OFFSET_COUNT] = { 0 };
> +
> +	power_on_mclk(rtc);
> +
> +	ret = rtc_bulk_read(rtc, rtc->addr_base + RTC_AL_SEC,
> +			    data, RTC_OFFSET_COUNT * 2);
> +	if (ret < 0)
> +		goto exit;
> +
> +	data[RTC_OFFSET_SEC] = ((data[RTC_OFFSET_SEC] & ~(RTC_AL_SEC_MASK)) |
> +				(tm->tm_sec & RTC_AL_SEC_MASK));
> +	data[RTC_OFFSET_MIN] = ((data[RTC_OFFSET_MIN] & ~(RTC_AL_MIN_MASK)) |
> +				(tm->tm_min & RTC_AL_MIN_MASK));
> +	data[RTC_OFFSET_HOUR] = ((data[RTC_OFFSET_HOUR] & ~(RTC_AL_HOU_MASK)) |
> +				(tm->tm_hour & RTC_AL_HOU_MASK));
> +	data[RTC_OFFSET_DOM] = ((data[RTC_OFFSET_DOM] & ~(RTC_AL_DOM_MASK)) |
> +				(tm->tm_mday & RTC_AL_DOM_MASK));
> +	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
> +				(tm->tm_mon & RTC_AL_MTH_MASK));
> +	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
> +				(tm->tm_year & RTC_AL_YEA_MASK));
> +
> +	dev_notice(rtc->rtc_dev->dev.parent,
> +		   "restore al time = %04d/%02d/%02d %02d:%02d:%02d\n",
> +		   tm->tm_year + RTC_MIN_YEAR, tm->tm_mon, tm->tm_mday,
> +		   tm->tm_hour, tm->tm_min, tm->tm_sec);
> +
> +	ret = rtc_bulk_write(rtc, rtc->addr_base + RTC_AL_SEC,
> +			     data, RTC_OFFSET_COUNT * 2);
> +	if (ret < 0)
> +		goto exit;
> +
> +	ret = rtc_write(rtc, rtc->addr_base + RTC_AL_MASK,
> +			RTC_AL_MASK_DOW);
> +	if (ret < 0)
> +		goto exit;
> +
> +	ret =  rtc_update_bits(rtc,
> +			       rtc->addr_base + RTC_IRQ_EN,
> +			       RTC_IRQ_EN_AL, RTC_IRQ_EN_AL);
> +	if (ret < 0)
> +		goto exit;
> +
> +	mtk_rtc_write_trigger(rtc);
> +	power_down_mclk(rtc);
> +	return ret;
> +
> +exit:
> +	power_down_mclk(rtc);
> +	dev_err(rtc->rtc_dev->dev.parent, "%s error\n", __func__);

Again, be descriptive.

> +	return ret;
> +}
> +
> +static bool mtk_rtc_is_pwron_alarm(struct mt6685_rtc *rtc,
> +				   struct rtc_time *nowtm, struct rtc_time *tm)
> +{
> +	u32 pdn1 = 0, spar1 = 0, pdn2 = 0, spar0 = 0;
> +	int ret, sec = 0;
> +	u16 data[RTC_OFFSET_COUNT] = { 0 };
> +
> +	ret = rtc_read(rtc, rtc->addr_base + RTC_PDN1, &pdn1);
> +	if (ret < 0)
> +		goto exit;
> +
> +	dev_notice(rtc->rtc_dev->dev.parent, "pdn1 = 0x%x\n", pdn1);

NAK


...


> +
> +				dev_info(rtc->rtc_dev->dev.parent,
> +					 "[HWID 0x%x, MCLK 0x%x, prot key 0x%x] %s write %d, latest %d\n",
> +					 hwid, mclk, prot_key, rtc_time_reg_name[i],
> +					 data[i], latest[i]);
> +			}

NAK

> +		}
> +
> +		if (write_fail > 0)
> +			mdelay(2);
> +		else
> +			break;
> +	}
> +
> +	if (write_fail > 0)
> +		return false;
> +
> +	return true;
> +}
> +
> +static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
> +	int ret, result = 0;
> +	u16 data[RTC_OFFSET_COUNT];
> +
> +	power_on_mclk(rtc);
> +
> +	dev_notice(rtc->rtc_dev->dev.parent,
> +		   "set tc time = %04d/%02d/%02d %02d:%02d:%02d\n",
> +		   tm->tm_year + RTC_BASE_YEAR, tm->tm_mon + 1, tm->tm_mday,
> +		   tm->tm_hour, tm->tm_min, tm->tm_sec);
> +
> +	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
> +	tm->tm_mon++;
> +
> +	data[RTC_OFFSET_SEC] = tm->tm_sec;
> +	data[RTC_OFFSET_MIN] = tm->tm_min;
> +	data[RTC_OFFSET_HOUR] = tm->tm_hour;
> +	data[RTC_OFFSET_DOM] = tm->tm_mday;
> +	data[RTC_OFFSET_MTH] = tm->tm_mon;
> +	data[RTC_OFFSET_YEAR] = tm->tm_year;
> +
> +	mutex_lock(&rtc->lock);
> +	ret = rtc_bulk_write(rtc, rtc->addr_base + RTC_TC_SEC,
> +			     data, RTC_OFFSET_COUNT * 2);
> +	if (ret < 0)
> +		goto exit;
> +
> +	/* Time register write to hardware after call trigger function */
> +	ret = mtk_rtc_write_trigger(rtc);
> +	if (ret < 0)
> +		goto exit;
> +
> +	result = mtk_rtc_check_set_time(rtc, tm, 2, RTC_TC_SEC);
> +
> +	if (!result) {
> +		dev_info(rtc->rtc_dev->dev.parent, "check rtc set time\n");
> +#if IS_ENABLED(CONFIG_MTK_AEE_FEATURE)
> +		aee_kernel_warning("mt6685-rtc", "mt6685-rtc: set tick time failed\n");
> +#endif

NAK

> +	}
> +
> +exit:
> +	mutex_unlock(&rtc->lock);
> +	power_down_mclk(rtc);

I did not investigate locking but it feels like you lock everything
everywhere.

Considering how poor code is this, I suspect that locking is totally
bogus. Provide extensive description of locking in comment section in
the top.


> +	return ret;
> +}
> +
> +static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct rtc_time *tm = &alm->time;
> +	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
> +	u32 irqen = 0, pdn2 = 0;
> +	int ret;
> +	u16 data[RTC_OFFSET_COUNT] = { 0 };
> +
> +	mutex_lock(&rtc->lock);
> +	ret = rtc_read(rtc, rtc->addr_base + RTC_IRQ_EN, &irqen);
> +	if (ret < 0)
> +		goto err_exit;
> +	ret = rtc_read(rtc, rtc->addr_base + RTC_PDN2, &pdn2);
> +	if (ret < 0)
> +		goto err_exit;
> +
> +	ret = rtc_bulk_read(rtc, rtc->addr_base + RTC_AL_SEC,
> +			    data, RTC_OFFSET_COUNT * 2);
> +	if (ret < 0)
> +		goto err_exit;
> +
> +	alm->enabled = !!(irqen & RTC_IRQ_EN_AL);
> +	alm->pending = !!(pdn2 & RTC_PDN2_PWRON_ALARM);
> +	mutex_unlock(&rtc->lock);
> +
> +	tm->tm_sec = data[RTC_OFFSET_SEC] & RTC_AL_SEC_MASK;
> +	tm->tm_min = data[RTC_OFFSET_MIN] & RTC_AL_MIN_MASK;
> +	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
> +	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
> +	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
> +	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
> +
> +	tm->tm_year += RTC_MIN_YEAR_OFFSET;
> +	tm->tm_mon--;
> +
> +	dev_notice(rtc->rtc_dev->dev.parent,
> +		   "read al time = %04d/%02d/%02d %02d:%02d:%02d (%d)\n",
> +		   tm->tm_year + RTC_BASE_YEAR, tm->tm_mon + 1, tm->tm_mday,
> +		   tm->tm_hour, tm->tm_min, tm->tm_sec, alm->enabled);
> +
> +	return 0;
> +err_exit:
> +	mutex_unlock(&rtc->lock);
> +	return ret;
> +}
> +
> +static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct rtc_time *tm = &alm->time;
> +	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
> +	int ret, result = 0;
> +	u16 data[RTC_OFFSET_COUNT];
> +	ktime_t target;
> +
> +	power_on_mclk(rtc);
> +
> +	if (alm->enabled == 1) {
> +		/* Add one more second to postpone wake time. */
> +		target = rtc_tm_to_ktime(*tm);
> +		target = ktime_add_ns(target, NSEC_PER_SEC);
> +		*tm = rtc_ktime_to_tm(target);
> +	}
> +
> +	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
> +	tm->tm_mon++;
> +
> +	dev_notice(rtc->rtc_dev->dev.parent,
> +		   "set al time = %04d/%02d/%02d %02d:%02d:%02d (%d)\n",
> +		   tm->tm_year + RTC_MIN_YEAR, tm->tm_mon, tm->tm_mday,
> +		   tm->tm_hour, tm->tm_min, tm->tm_sec, alm->enabled);
> +
> +	mutex_lock(&rtc->lock);
> +
> +	switch (alm->enabled) {
> +	case 3:
> +		/* enable power-on alarm with logo */
> +		mtk_rtc_save_pwron_time(rtc, true, tm);
> +		break;
> +	case 4:
> +		/* disable power-on alarm */
> +		mtk_rtc_save_pwron_time(rtc, false, tm);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	ret = rtc_update_bits(rtc,
> +			      rtc->addr_base + RTC_PDN2,
> +			      RTC_PDN2_PWRON_ALARM, 0);
> +	if (ret < 0)
> +		goto exit;
> +	mtk_rtc_write_trigger(rtc);
> +
> +	ret = rtc_bulk_read(rtc, rtc->addr_base + RTC_AL_SEC,
> +			    data, RTC_OFFSET_COUNT * 2);
> +	if (ret < 0)
> +		goto exit;
> +
> +	data[RTC_OFFSET_SEC] = ((data[RTC_OFFSET_SEC] & ~(RTC_AL_SEC_MASK)) |
> +				(tm->tm_sec & RTC_AL_SEC_MASK));
> +	data[RTC_OFFSET_MIN] = ((data[RTC_OFFSET_MIN] & ~(RTC_AL_MIN_MASK)) |
> +				(tm->tm_min & RTC_AL_MIN_MASK));
> +	data[RTC_OFFSET_HOUR] = ((data[RTC_OFFSET_HOUR] & ~(RTC_AL_HOU_MASK)) |
> +				(tm->tm_hour & RTC_AL_HOU_MASK));
> +	data[RTC_OFFSET_DOM] = ((data[RTC_OFFSET_DOM] & ~(RTC_AL_DOM_MASK)) |
> +				(tm->tm_mday & RTC_AL_DOM_MASK));
> +	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
> +				(tm->tm_mon & RTC_AL_MTH_MASK));
> +	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
> +				(tm->tm_year & RTC_AL_YEA_MASK));
> +
> +	if (alm->enabled) {
> +		ret = rtc_bulk_write(rtc,
> +				     rtc->addr_base + RTC_AL_SEC,
> +				     data, RTC_OFFSET_COUNT * 2);
> +		if (ret < 0)
> +			goto exit;
> +		ret = rtc_write(rtc, rtc->addr_base + RTC_AL_MASK,
> +				RTC_AL_MASK_DOW);
> +		if (ret < 0)
> +			goto exit;
> +
> +		ret =  rtc_update_bits(rtc,
> +				       rtc->addr_base + RTC_IRQ_EN,
> +				       RTC_IRQ_EN_AL, RTC_IRQ_EN_AL);
> +		if (ret < 0)
> +			goto exit;
> +		} else {
> +			ret =  rtc_update_bits(rtc,
> +					       rtc->addr_base + RTC_IRQ_EN,
> +					       RTC_IRQ_EN_AL, 0);
> +			if (ret < 0)
> +				goto exit;
> +		}
> +
> +	/* All alarm time register write to hardware after calling
> +	 * mtk_rtc_write_trigger. This can avoid race condition if alarm
> +	 * occur happen during writing alarm time register.
> +	 */
> +	ret = mtk_rtc_write_trigger(rtc);
> +	if (ret < 0)
> +		goto exit;
> +
> +	result = mtk_rtc_check_set_time(rtc, tm, 2, RTC_AL_SEC);
> +
> +	if (!result) {
> +		dev_info(rtc->rtc_dev->dev.parent, "check rtc set alarm\n");
> +#if IS_ENABLED(CONFIG_MTK_AEE_FEATURE)
> +		aee_kernel_warning("mt6685-rtc", "mt6685-rtc: set alarm time failed\n");
> +#endif
> +	}
> +exit:
> +	mutex_unlock(&rtc->lock);
> +	power_down_mclk(rtc);
> +	return ret;
> +}
> +
> +static int rtc_alarm_set_power_on(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	int err = 0;
> +	struct rtc_time tm;
> +	time64_t now, scheduled;
> +
> +	err = rtc_valid_tm(&alm->time);
> +	if (err != 0)
> +		return err;
> +	scheduled = rtc_tm_to_time64(&alm->time);
> +
> +	err = mtk_rtc_read_time(dev, &tm);
> +	if (err != 0)
> +		return err;
> +	now = rtc_tm_to_time64(&tm);
> +
> +	if (scheduled <= now)
> +		alm->enabled = 4;
> +	else
> +		alm->enabled = 3;
> +
> +	mtk_rtc_set_alarm(dev, alm);
> +
> +	return err;
> +}
> +
> +static int mtk_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> +{
> +	void __user *uarg = (void __user *)arg;
> +	int err = 0;
> +	struct rtc_wkalrm alm;
> +
> +	switch (cmd) {
> +	case RTC_POFF_ALM_SET:
> +		if (copy_from_user(&alm.time, uarg, sizeof(alm.time)))
> +			return -EFAULT;
> +		err = rtc_alarm_set_power_on(dev, &alm);
> +		break;
> +	default:
> +		err = -EINVAL;
> +		break;
> +	}
> +
> +	return err;
> +}
> +
> +static const struct rtc_class_ops mtk_rtc_ops = {
> +	.ioctl      = mtk_rtc_ioctl,
> +	.read_time  = mtk_rtc_read_time,
> +	.set_time   = mtk_rtc_set_time,
> +	.read_alarm = mtk_rtc_read_alarm,
> +	.set_alarm  = mtk_rtc_set_alarm,
> +};
> +
> +static int rtc_nvram_read(void *priv, unsigned int offset, void *val,
> +			  size_t bytes)
> +{
> +	struct mt6685_rtc *rtc = dev_get_drvdata(priv);
> +	unsigned int ival;
> +	int ret;
> +	u8 *buf = val;
> +
> +	mutex_lock(&rtc->lock);
> +
> +	for (; bytes; bytes--) {
> +		ret = rtc_field_read(rtc,
> +				     &rtc->data->spare_reg_fields[offset++],
> +				     &ival);
> +
> +		if (ret)
> +			goto out;
> +
> +		*buf++ = (u8)ival;
> +	}
> +
> +out:
> +	mutex_unlock(&rtc->lock);
> +	return ret;
> +}
> +
> +static int rtc_nvram_write(void *priv, unsigned int offset, void *val,
> +			   size_t bytes)
> +{
> +	struct mt6685_rtc *rtc = dev_get_drvdata(priv);
> +	unsigned int ival;
> +	int ret;
> +	u8 *buf = val;
> +
> +	power_on_mclk(rtc);
> +
> +	mutex_lock(&rtc->lock);
> +
> +	for (; bytes; bytes--) {
> +		ival = *buf++;
> +		ret = rtc_field_write(rtc,
> +				      &rtc->data->spare_reg_fields[offset++],
> +				      ival);
> +
> +		if (ret)
> +			goto out;
> +	}
> +
> +out:
> +	mutex_unlock(&rtc->lock);
> +	power_down_mclk(rtc);
> +	return ret;
> +}
> +
> +static int mtk_rtc_set_spare(struct device *dev)
> +{
> +	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
> +	int ret;
> +	struct nvmem_config nvmem_cfg = {
> +		.name = "mtk_rtc_nvmem",
> +		.word_size = SPARE_REG_WIDTH,
> +		.stride = 1,
> +		.size = SPARE_RG_MAX * SPARE_REG_WIDTH,
> +		.reg_read = rtc_nvram_read,
> +		.reg_write = rtc_nvram_write,
> +		.priv = dev,
> +	};
> +
> +	ret = devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
> +	if (ret)
> +		dev_err(rtc->rtc_dev->dev.parent, "nvmem register failed\n");
> +
> +	return ret;
> +}
> +
> +static int mtk_rtc_probe(struct platform_device *pdev)
> +{
> +	struct mt6685_rtc *rtc;
> +	struct device_node *np = pdev->dev.of_node;
> +	int ret;
> +#ifdef SUPPORT_PWR_OFF_ALARM
> +	struct device_node *of_chosen = NULL;
> +	struct tag_bootmode *tag = NULL;
> +#endif
> +	if (!of_device_is_available(np)) {
> +		dev_err(&pdev->dev, "rtc disabled\n");

NAK, this code is a disaster.

> +		return -1;
> +	}
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt6685_rtc), GFP_KERNEL);
> +	if (!rtc) {
> +		//dev_err(&pdev->dev, "devm_kzalloc failed\n");

NAK


> +		return -ENOMEM;
> +	}
> +
> +	rtc->data = of_device_get_match_data(&pdev->dev);
> +	if (!rtc->data) {
> +		dev_err(&pdev->dev, "of_device_get_match_data failed\n");

NAK

> +		return -ENODEV;
> +	}
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "base", &rtc->addr_base))
> +		rtc->addr_base = RTC_DSN_ID;
> +
> +	pr_notice("%s: rtc->addr_base =0x%x\n", __func__, rtc->addr_base);

NAK

I finished here. The code is terrible and not suitable for mainline.
It's probably overcomplicated for something like RTC, but that's not yet
the main problem and I did not get there yet.

Drop all this code. Sorry, it's just not started correctly. Instead take
RECENT mainline driver and customize it using upstream, not downstream,
patterns and coding style.

Best regards,
Krzysztof



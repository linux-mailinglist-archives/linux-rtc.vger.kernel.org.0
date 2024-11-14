Return-Path: <linux-rtc+bounces-2560-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8174D9C8D35
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 15:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ABE1B2FD3B
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 14:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B2F6F073;
	Thu, 14 Nov 2024 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lB5wSpp5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673AB757EA;
	Thu, 14 Nov 2024 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595365; cv=none; b=bsSEpi/ggIp10gec03Aane0K/BV1np2U0DoKq/MPL9MBy1lhW8UEtXqX3mT+mAGNPMKGnE4TuzcfwGcuq/z8N2931BC/I1/KJwg78b3Hd21rwk+R3zCs3PomvNEGHakJHiowKe/k4PIRdCegMpMO3GapF7yXfXH0MVMVfw2nVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595365; c=relaxed/simple;
	bh=65Hw74Hd+fvE5QorSBQnHBq4Zofkc8kgPwxWfixNHqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTDvhvVvgLED2iSo5WDod/eHOmmWyGmLJKN7Iq5mdmvMQY7FUSNWJL6EOifaJ/0uI4Z6yaLTsycHiQcWO4AubWNbMJzSUWlvItTpx7HyDarCMxaPo7rC2KD2FHiwwk5A0I0Za6Ndo06jYipebowpgBkiZXe6cnTD3v/rQR6BQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lB5wSpp5; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 522AB2000B;
	Thu, 14 Nov 2024 14:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731595354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SLgC23ZvmymLrEGALbEff11hpcG/5PNIpGmCyFIvw94=;
	b=lB5wSpp5uD9+q5NqLpskR78nJ7/CPKhdP2RV0FY27swKYgb+njCX7C13AEc2yqpyPSXli3
	VGVO+CLYAEczdT+TyAPF1WICITAN9BWp8Fq1Vrl6uZ/hJA9lg8pQGlEmmPkguVgNIBs9P8
	R0Jwy0DNE7Nt/8UJPEI/1lxPpPPrCLTP5TblkIAJNUrjq5RCzLcTyIN7/WgXeHIfMQLXNz
	FspSOX9chKH/Ae05MqIeaW0SWWCN3VHb71fFCZumSIB3K8YlKyJNyf5WQxF06oOXKNYYNm
	KvD0QppUqXzfwIOHX5eRASa3Iw6Uf35JR+/4wy7XnD7Aobh54q2UpCy1rXbp1A==
Date: Thu, 14 Nov 2024 15:42:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v4 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <2024111414423117e158e3@mail.local>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111135940.2534034-3-ciprianmarian.costea@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 11/11/2024 15:59:38+0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
> 
> The RTC module is used to enable Suspend to RAM (STR) support on NXP
> S32G2/S32G3 SoC based boards.
> 
> RTC tracks clock time during system suspend.
> 
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
> 
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/rtc/Kconfig    |  11 +
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-s32g.c | 692 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 704 insertions(+)
>  create mode 100644 drivers/rtc/rtc-s32g.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e87c3d74565c..18fc3577f6cd 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
>  	  This driver can also be built as a module, if so, the module
>  	  will be called "rtc-ssd20xd".
>  
> +config RTC_DRV_S32G
> +	tristate "RTC driver for S32G2/S32G3 SoCs"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	depends on COMMON_CLK
> +	help
> +	  Say yes to enable RTC driver for platforms based on the
> +	  S32G2/S32G3 SoC family.
> +
> +	  This RTC module can be used as a wakeup source.
> +	  Please note that it is not battery-powered.
> +
>  endif # RTC_CLASS
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 8ee79cb18322..a63d010a753c 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
>  obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>  obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>  obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>  obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>  obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>  obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> new file mode 100644
> index 000000000000..c3792b674a18
> --- /dev/null
> +++ b/drivers/rtc/rtc-s32g.c
> @@ -0,0 +1,692 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/iopoll.h>
> +#include <linux/math64.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +
> +#define RTCC_OFFSET	0x4ul
> +#define RTCS_OFFSET	0x8ul
> +#define RTCCNT_OFFSET	0xCul
> +#define APIVAL_OFFSET	0x10ul
> +#define RTCVAL_OFFSET	0x14ul
> +
> +/* RTCC fields */
> +#define RTCC_CNTEN				BIT(31)
> +#define RTCC_RTCIE_SHIFT		30
> +#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
> +#define RTCC_ROVREN				BIT(28)
> +#define RTCC_APIEN				BIT(15)
> +#define RTCC_APIIE				BIT(14)
> +#define RTCC_CLKSEL_OFFSET		12
> +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
> +#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
> +#define RTCC_DIV512EN			BIT(11)
> +#define RTCC_DIV32EN			BIT(10)
> +
> +/* RTCS fields */
> +#define RTCS_RTCF		BIT(29)
> +#define RTCS_INV_RTC		BIT(18)
> +#define RTCS_APIF		BIT(13)
> +#define RTCS_ROVRF		BIT(10)
> +
> +#define ROLLOVER_VAL		GENMASK(31, 0)
> +#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
> +
> +#define RTC_CLK_MUX_SIZE	4
> +
> +/*
> + * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
> + * should not be used.
> + */
> +#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
> +
> +enum {
> +	RTC_CLK_SRC0,
> +	RTC_CLK_SRC1,
> +	RTC_CLK_SRC2,
> +	RTC_CLK_SRC3
> +};
> +
> +enum {
> +	DIV1 = 1,
> +	DIV32 = 32,
> +	DIV512 = 512,
> +	DIV512_32 = 16384
> +};
> +
> +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE * 2] = {
> +	"rtc_runtime_s0",
> +	"rtc_runtime_s1",
> +	"rtc_runtime_s2",
> +	"rtc_runtime_s3",
> +	"rtc_standby_s0",
> +	"rtc_standby_s1",
> +	"rtc_standby_s2",
> +	"rtc_standby_s3"
> +};
> +
> +struct rtc_time_base {
> +	s64 sec;
> +	u64 cycles;
> +	u64 rollovers;
> +	struct rtc_time tm;
> +};
> +
> +struct rtc_priv {
> +	struct rtc_device *rdev;
> +	void __iomem *rtc_base;
> +	struct clk *ipg;
> +	struct clk *runtime_clk;
> +	struct clk *suspend_clk;
> +	const struct rtc_soc_data *rtc_data;
> +	struct rtc_time_base base;
> +	u64 rtc_hz;
> +	u64 rollovers;
> +	int dt_irq_id;
> +	int runtime_src_idx;
> +	int suspend_src_idx;
> +};
> +
> +struct rtc_soc_data {
> +	u32 runtime_div;
> +	u32 suspend_div;
> +	u32 quirks;
> +};
> +
> +static const struct rtc_soc_data rtc_s32g2_data = {
> +	.runtime_div = DIV512,
> +	.suspend_div = DIV512,
> +	.quirks = RTC_QUIRK_SRC1_RESERVED,
> +};
> +
> +static int is_src1_reserved(struct rtc_priv *priv)
> +{
> +	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
> +}
> +
> +static u64 cycles_to_sec(u64 hz, u64 cycles)
> +{
> +	return div_u64(cycles, hz);
> +}
> +
> +/**
> + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
> + * current configuration.
> + * @rtcval: The value to go into RTCVAL[RTCVAL]
> + * Returns: 0 for success, -EINVAL if @seconds push the counter at least
> + *          twice the rollover interval
> + */
> +static int sec_to_rtcval(const struct rtc_priv *priv,
> +			 unsigned long seconds, u32 *rtcval)
> +{
> +	u32 rtccnt, delta_cnt;
> +	u32 target_cnt = 0;
> +
> +	/* For now, support at most one rollover of the counter */
> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
> +		return -EINVAL;

Honestly, I still feel the whole rollover handling is useless as it
doesn't bring any significant benefits. The workflow seems like it will
always be something like:
 - set time
 - set alarm
 - wait for wakeup

Without rollover support, you already have the whole 32bit range for the
counter. Obviously get_time_left is then useless.

The whole clock switching code also seem over complicated. What are the
actual benefits? The accuracy of the wakeup will always be the one of
the clock selected while in suspend and this RTC will probably not be
your system clock because of its limitations.

> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	struct rtc_time time_crt;
> +	long long t_crt, t_alrm;
> +	u32 rtcval, rtcs;
> +	int ret = 0;
> +
> +	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
> +
> +	t_alrm = rtc_tm_to_time64(&alrm->time);
> +
> +	/*
> +	 * Assuming the alarm is being set relative to the same time
> +	 * returned by our s32g_rtc_read_time callback
> +	 */
> +	ret = s32g_rtc_read_time(dev, &time_crt);
> +	if (ret)
> +		return ret;
> +
> +	t_crt = rtc_tm_to_time64(&time_crt);
> +	if (t_alrm <= t_crt) {
> +		dev_warn(dev, "Alarm is set in the past\n");

This is never going to happen.

> +		return -EINVAL;
> +	}
> +
> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
> +	if (ret) {
> +		/*
> +		 * Rollover support enables RTC alarm
> +		 * for a maximum timespan of ~3 months.
> +		 */
> +		dev_warn(dev, "Alarm is set too far in the future\n");
> +		return ret;

-ERANGE is probably appriopriate.

> +	}
> +
> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
> +	if (ret) {
> +		dev_err(dev, "Synchronization failed\n");

The driver is very verbose. Most of the strings will never be seen by
anyone because this is an embedded system however, the strings will take
space which make the system slower to boot an use more memory than
necessary.

> +		return ret;
> +	}
> +
> +	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_set_time(struct device *dev,
> +			     struct rtc_time *time)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	if (!time)

How will this ever happen?

> +		return -EINVAL;
> +
> +	priv->base.rollovers = priv->rollovers;
> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +	priv->base.sec = rtc_tm_to_time64(time);
> +
> +	return 0;
> +}
> +
> +/*
> + * Disable the 32-bit free running counter.
> + * This allows Clock Source and Divisors selection
> + * to be performed without causing synchronization issues.
> + */
> +static void s32g_rtc_disable(struct rtc_priv *priv)
> +{
> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +
> +	rtcc &= ~RTCC_CNTEN;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static void s32g_rtc_enable(struct rtc_priv *priv)
> +{
> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +
> +	rtcc |= RTCC_CNTEN;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static void adjust_dividers(struct rtc_priv *priv,
> +			    u32 div_val, u32 *reg)
> +{
> +	switch (div_val) {
> +	case DIV512_32:
> +		*reg |= RTCC_DIV512EN;
> +		*reg |= RTCC_DIV32EN;
> +		break;
> +	case DIV512:
> +		*reg |= RTCC_DIV512EN;
> +		break;
> +	case DIV32:
> +		*reg |= RTCC_DIV32EN;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	priv->rtc_hz /= div_val;
> +}
> +
> +static int rtc_get_clk_src(struct rtc_priv *priv)
> +{
> +	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
> +			RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
> +}
> +
> +static int rtc_clk_src_switch(struct rtc_priv *priv, u32 src)
> +{
> +	struct device *dev = priv->rdev->dev.parent;
> +	u32 rtcc = 0;
> +
> +	switch (src % RTC_CLK_MUX_SIZE) {
> +	case RTC_CLK_SRC0:
> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
> +		break;
> +	case RTC_CLK_SRC1:
> +		if (is_src1_reserved(priv))
> +			return -EOPNOTSUPP;
> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
> +		break;
> +	case RTC_CLK_SRC2:
> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
> +		break;
> +	case RTC_CLK_SRC3:
> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
> +		break;
> +	default:
> +		dev_err(dev, "Invalid clock mux parent: %d\n", src);
> +		return -EINVAL;
> +	}
> +
> +	if (src < RTC_CLK_MUX_SIZE) {
> +		priv->rtc_hz = clk_get_rate(priv->runtime_clk);
> +		if (!priv->rtc_hz) {
> +			dev_err(dev, "Failed to get RTC frequency\n");
> +			return -EINVAL;
> +		}
> +		adjust_dividers(priv, priv->rtc_data->runtime_div, &rtcc);
> +	} else {
> +		priv->rtc_hz = clk_get_rate(priv->suspend_clk);
> +		if (!priv->rtc_hz) {
> +			dev_err(dev, "Failed to get RTC frequency\n");
> +			return -EINVAL;
> +		}
> +		adjust_dividers(priv, priv->rtc_data->suspend_div, &rtcc);
> +	}
> +
> +	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
> +	/*
> +	 * Make sure the CNTEN is 0 before we configure
> +	 * the clock source and dividers.
> +	 */
> +	s32g_rtc_disable(priv);
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +	s32g_rtc_enable(priv);
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops rtc_ops = {
> +	.read_time = s32g_rtc_read_time,
> +	.set_time = s32g_rtc_set_time,
> +	.read_alarm = s32g_rtc_read_alarm,
> +	.set_alarm = s32g_rtc_set_alarm,
> +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
> +};
> +
> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
> +			     struct device *dev)
> +{
> +	int i;
> +
> +	priv->runtime_src_idx = -EINVAL;
> +	priv->suspend_src_idx = -EINVAL;
> +
> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
> +	if (IS_ERR(priv->ipg)) {
> +		dev_err(dev, "Failed to get 'ipg' clock\n");
> +		return PTR_ERR(priv->ipg);
> +	}
> +
> +	/* Get RTC runtime clock source */
> +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
> +		priv->runtime_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> +		if (!IS_ERR(priv->runtime_clk)) {
> +			priv->runtime_src_idx = i;
> +			break;
> +		}
> +	}
> +
> +	if (IS_ERR(priv->runtime_clk)) {
> +		dev_err(dev, "Failed to get runtime rtc clock\n");
> +		return PTR_ERR(priv->runtime_clk);
> +	}
> +
> +	/* If present, get RTC suspend clock source */
> +	for (i = RTC_CLK_MUX_SIZE; i < RTC_CLK_MUX_SIZE * 2; i++) {
> +		priv->suspend_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> +		if (!IS_ERR(priv->suspend_clk)) {
> +			priv->suspend_src_idx = i;
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_priv *priv;
> +	int ret = 0;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->rtc_data = of_device_get_match_data(dev);
> +	if (!priv->rtc_data)
> +		return -ENODEV;
> +
> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->rtc_base))
> +		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
> +				"Failed to map registers\n");
> +
> +	device_init_wakeup(dev, true);
> +
> +	ret = rtc_clk_dts_setup(priv, dev);
> +	if (ret)
> +		return ret;
> +
> +	priv->rdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rdev))
> +		return dev_err_probe(dev, PTR_ERR(priv->rdev),
> +				"Failed to allocate RTC device\n");
> +
> +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"Failed clk source switch, err: %d\n", ret);
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->rdev->ops = &rtc_ops;
> +
> +	ret = devm_rtc_register_device(priv->rdev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register RTC device\n");
> +		goto disable_rtc;
> +	}
> +
> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
> +	if (priv->dt_irq_id < 0)
> +		return dev_err_probe(dev, priv->dt_irq_id,
> +				"Error reading interrupt # from dts\n");
> +
> +	ret = devm_request_irq(dev, priv->dt_irq_id,
> +			       rtc_handler, 0, dev_name(dev), pdev);
> +	if (ret) {
> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
> +			priv->dt_irq_id, ret);
> +		goto disable_rtc;
> +	}
> +
> +	return 0;
> +
> +disable_rtc:
> +	s32g_rtc_disable(priv);
> +	return ret;
> +}
> +
> +static void rtc_remove(struct platform_device *pdev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
> +

You really need a comment here stating why you feel this is necessary to
stop the RTC when removing the driver. Also, you need to prefix your
function names with s32g.

> +	s32g_rtc_disable(priv);
> +}
> +
> +static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
> +	u32 rtcc;
> +
> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +	if (enabled)
> +		rtcc |= api_irq;
> +	else
> +		rtcc &= ~api_irq;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static int __maybe_unused rtc_suspend(struct device *dev)
> +{
> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
> +	struct rtc_priv priv;
> +	long long base_sec;
> +	int ret = 0;
> +	u32 rtcval;
> +	u32 sec;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	if (init_priv->suspend_src_idx < 0)
> +		return 0;
> +
> +	if (rtc_get_clk_src(init_priv) + RTC_CLK_MUX_SIZE ==
> +			init_priv->suspend_src_idx)
> +		return 0;
> +
> +	/* Save last known timestamp before we switch clocks and reinit RTC */
> +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Use a local copy of the RTC control block to
> +	 * avoid restoring it on resume path.
> +	 */
> +	memcpy(&priv, init_priv, sizeof(priv));
> +
> +	ret = get_time_left(dev, init_priv, &sec);
> +	if (ret)
> +		return ret;
> +
> +	/* Adjust for the number of seconds we'll be asleep */
> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
> +	base_sec += sec;
> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
> +
> +	ret = rtc_clk_src_switch(&priv, priv.suspend_src_idx);
> +	if (ret) {
> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is too far in the future\n");
> +		return ret;
> +	}
> +
> +	s32g_rtc_alarm_irq_enable(dev, 0);
> +	enable_api_irq(dev, 1);
> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	if (rtc_get_clk_src(priv) == priv->runtime_src_idx)
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	enable_api_irq(dev, 0);
> +
> +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
> +	if (ret) {
> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> +	 * reapply the saved time settings
> +	 */
> +	return s32g_rtc_set_time(dev, &priv->base.tm);
> +}
> +
> +static const struct of_device_id rtc_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> +	{ /* sentinel */ },
> +};
> +
> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
> +			 rtc_suspend, rtc_resume);
> +
> +static struct platform_driver rtc_driver = {
> +	.driver		= {
> +		.name			= "s32g-rtc",
> +		.pm				= &rtc_pm_ops,
> +		.of_match_table = rtc_dt_ids,
> +	},
> +	.probe		= rtc_probe,
> +	.remove	= rtc_remove,
> +};
> +module_platform_driver(rtc_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> +MODULE_LICENSE("GPL");
> -- 
> 2.45.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


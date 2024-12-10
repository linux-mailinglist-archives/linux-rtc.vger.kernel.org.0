Return-Path: <linux-rtc+bounces-2702-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446F9EBF50
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 00:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21CA1699F7
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2024 23:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84538211295;
	Tue, 10 Dec 2024 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AfPZ3MJR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04B31F193C;
	Tue, 10 Dec 2024 23:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733873552; cv=none; b=piar0OjtPMmNAd0BH+1Ov5bFc4QB8TT4Pfk0GeXdrO6RFnuD7sUpCZA0xS+6itlkB+iqzWjpd59LWqOOCmp8XWtqsLvlrXNzhWpGr6T/gNhBD+Z7pWgN54y2hRun9OcMRkX8POoYsrHmwJj3UvJZa4eCSfuUiidGtSN1UWW1Yv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733873552; c=relaxed/simple;
	bh=QqG+eYP5M/mlGjy7EW5cIzCMD/NDmz5jY8szILBLguU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Etq9byTgt35vBADD6x0Lu/os5Hv81HpgG6COCaMcFgLJV9Bz8q6NybkApF8K+ObUabY7pUUZRFIjpG/+Zup1hV18dzSTjDNUG096P9oSJhZtfOZDShCi/wc5KeofqUbHKAEbHpWSvu/wv48ajz36my9kK7KTJLBrGnDQjPt2k34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AfPZ3MJR; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 0067EC2F93;
	Tue, 10 Dec 2024 23:26:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3472220002;
	Tue, 10 Dec 2024 23:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733873159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BMFDiKWBBmzfUuznGsIJQDvWBPwugkqEOCMWYBCM6eM=;
	b=AfPZ3MJRLmK/kgEbtU05woapUy+6szaFK4g2LdUGGG1WLRbY6w854a0m0hfmAEx+429MxB
	9DArENev9YbnZcx12ngigCb7jzKMSwh6IgLq3uo7gxLiL4p9M3YKsHUsbDQNbcCK/R1wCZ
	SQQvDrtEQraQG+0G+bVKX5gsVgeS1TvXdvsJSRtyDN/j7CAMGR8/WCQh6N08UooTWCqHSV
	DrYEDx/EONBRB1pIdXtAO5B7R3ZqHWt2YOc4DQ4aBzyNpHeiftXMCFj+nVNAvsaKVrG08u
	uXyTOeoVKH4aHzQYLXRhYTL5gYKiPQwT4O9km7AxqLMfD/eR8u+MVJIkHWEM2A==
Date: Wed, 11 Dec 2024 00:25:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <20241210232557fee4e108@mail.local>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 06/12/2024 09:09:53+0200, Ciprian Costea wrote:
> +/*
> + * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
> + * should not be used.
> + */
> +#define RTC_CLK_SRC1_RESERVED		BIT(1)
> +
> +enum {
> +	DIV1 = 1,
> +	DIV32 = 32,
> +	DIV512 = 512,
> +	DIV512_32 = 16384
> +};
> +
> +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE] = {
> +	"source0",
> +	"source1",
> +	"source2",
> +	"source3"
> +};
> +
> +struct rtc_time_base {
> +	s64 sec;
> +	u64 cycles;
> +	struct rtc_time tm;

I don't think storing an rtc_time is necessary. I don't even think
cycles is necessary.

> +};
> +
> +struct rtc_priv {
> +	struct rtc_device *rdev;
> +	void __iomem *rtc_base;
> +	struct clk *ipg;
> +	struct clk *clk_src;
> +	const struct rtc_soc_data *rtc_data;
> +	struct rtc_time_base base;
> +	u64 rtc_hz;
> +	int irq;
> +	int clk_src_idx;
> +};
> +
> +struct rtc_soc_data {
> +	u32 clk_div;
> +	u32 reserved_clk_mask;
> +};
> +
> +static const struct rtc_soc_data rtc_s32g2_data = {
> +	.clk_div = DIV512,

If you input clock rate is higher that 16kHz, why don't you divide by
16384?

> +	.reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
> +};
> +
> +static u64 cycles_to_sec(u64 hz, u64 cycles)
> +{
> +	return div_u64(cycles, hz);
> +}
> +
> +/**
> + * sec_to_rtcval - Convert a number of seconds to a value suitable for
> + * RTCVAL in our clock's
> + * current configuration.
> + * @priv: Pointer to the 'rtc_priv' structure
> + * @seconds: Number of seconds to convert
> + * @rtcval: The value to go into RTCVAL[RTCVAL]
> + *
> + * Return: 0 for success, -EINVAL if @seconds push the counter past the
> + *          32bit register range
> + */
> +static int sec_to_rtcval(const struct rtc_priv *priv,
> +			 unsigned long seconds, u32 *rtcval)
> +{
> +	u32 delta_cnt;
> +
> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
> +		return -EINVAL;
> +
> +	/*
> +	 * RTCCNT is read-only; we must return a value relative to the
> +	 * current value of the counter (and hope we don't linger around
> +	 * too much before we get to enable the interrupt)
> +	 */
> +	delta_cnt = seconds * priv->rtc_hz;
> +	*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(dev);
> +	u32 status;
> +
> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
> +
> +	if (status & RTCS_RTCF) {
> +		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
> +		iowrite32(status | RTCS_RTCF, priv->rtc_base + RTCS_OFFSET);
> +		rtc_update_irq(priv->rdev, 1, RTC_AF);
> +	}
> +
> +	if (status & RTCS_APIF) {
> +		iowrite32(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
> +		rtc_update_irq(priv->rdev, 1, RTC_PF);

I don't think you use APIF as a periodic interrupt so it doesn't really
make sense to use RTC_PF instead of RTC_AF.

> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
> +				     u32 offset)
> +{
> +	u32 counter;
> +
> +	counter = ioread32(priv->rtc_base + offset);
> +
> +	if (counter < priv->base.cycles)
> +		return -EINVAL;
> +
> +	counter -= priv->base.cycles;
> +
> +	return priv->base.sec + cycles_to_sec(priv->rtc_hz, counter);
> +}
> +
> +static int s32g_rtc_read_time(struct device *dev,
> +			      struct rtc_time *tm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	s64 sec;
> +
> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
> +	if (sec < 0)
> +		return -EINVAL;
> +
> +	rtc_time64_to_tm(sec, tm);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 rtcc, rtccnt, rtcval;
> +	s64 sec;
> +
> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
> +	if (sec < 0)
> +		return -EINVAL;
> +
> +	rtc_time64_to_tm(sec, &alrm->time);
> +
> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
> +
> +	alrm->pending = 0;
> +	if (alrm->enabled) {
> +		rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +		rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
> +
> +		if (rtccnt < rtcval)
> +			alrm->pending = 1;

This limits the range of your alarm, why don't you simply check whether
RTCF is set?

> +	}
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 rtcc;
> +
> +	if (!priv->irq)
> +		return -EIO;


This will never happen as you are not letting probe finish when you
can't request the irq.


> +
> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +	if (enabled)
> +		rtcc |= RTCC_RTCIE;
> +
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +
> +	return 0;
> +}
> +
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
> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is set too far in the future\n");
> +		return -ERANGE;
> +	}
> +
> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
> +	if (ret)
> +		return ret;
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
> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +	priv->base.sec = rtc_tm_to_time64(time);
> +

To simplify all the calculations you are doing, I suggest you reset
RTCCNT here and store the epoch of the rtc as a number of seconds.

This wll allow you to avoid having to read the counter in set_alarm
also, you then get a direct conversion for RTCVAL as this will simply be
rtc_tm_to_time64(&alrm->time) - epoch that you have to convert in cycles

You will also then know right away whether this is too large to fit in a
32bit register.


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
> +static int rtc_clk_src_setup(struct rtc_priv *priv)
> +{
> +	u32 rtcc = 0;
> +
> +	if (priv->rtc_data->reserved_clk_mask & (1 << priv->clk_src_idx))
> +		return -EOPNOTSUPP;
> +
> +	rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
> +
> +	switch (priv->rtc_data->clk_div) {
> +	case DIV512_32:
> +		rtcc |= RTCC_DIV512EN;
> +		rtcc |= RTCC_DIV32EN;
> +		break;
> +	case DIV512:
> +		rtcc |= RTCC_DIV512EN;
> +		break;
> +	case DIV32:
> +		rtcc |= RTCC_DIV32EN;
> +		break;
> +	case DIV1:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	rtcc |= RTCC_RTCIE;
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
> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
> +	if (IS_ERR(priv->ipg))
> +		return dev_err_probe(dev, PTR_ERR(priv->ipg),
> +				"Failed to get 'ipg' clock\n");
> +
> +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
> +		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> +		if (!IS_ERR(priv->clk_src)) {
> +			priv->clk_src_idx = i;
> +			break;
> +		}
> +	}
> +
> +	if (IS_ERR(priv->clk_src))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
> +				"Failed to get rtc module clock source\n");
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_probe(struct platform_device *pdev)
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
> +		return PTR_ERR(priv->rtc_base);
> +
> +	device_init_wakeup(dev, true);
> +
> +	ret = rtc_clk_dts_setup(priv, dev);
> +	if (ret)
> +		return ret;
> +
> +	priv->rdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rdev))
> +		return PTR_ERR(priv->rdev);
> +
> +	ret = rtc_clk_src_setup(priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->rtc_hz = clk_get_rate(priv->clk_src);
> +	if (!priv->rtc_hz) {
> +		dev_err(dev, "Failed to get RTC frequency\n");
> +		ret = -EINVAL;
> +		goto disable_rtc;
> +	}
> +
> +	priv->rtc_hz /= priv->rtc_data->clk_div;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->rdev->ops = &rtc_ops;
> +
> +	priv->irq = platform_get_irq(pdev, 0);
> +	if (priv->irq < 0) {
> +		ret = priv->irq;
> +		goto disable_rtc;
> +	}
> +
> +	ret = devm_request_irq(dev, priv->irq,
> +			       s32g_rtc_handler, 0, dev_name(dev), pdev);
> +	if (ret) {
> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
> +			priv->irq, ret);
> +		goto disable_rtc;
> +	}
> +
> +	ret = devm_rtc_register_device(priv->rdev);
> +	if (ret)
> +		goto disable_rtc;
> +
> +	return 0;
> +
> +disable_rtc:
> +	s32g_rtc_disable(priv);
> +	return ret;
> +}
> +
> +static void s32g_enable_api_irq(struct device *dev, unsigned int enabled)
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
> +static int s32g_rtc_suspend(struct device *dev)
> +{
> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
> +	struct rtc_priv priv;
> +	long long base_sec;
> +	u32 rtcval, rtccnt, offset;
> +	int ret = 0;
> +	u32 sec;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Save last known timestamp */
> +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
> +	if (ret)
> +		return ret;

I don't think that whole calculation is necessary as you are never
actually resetting RTCCNT in suspend

> +
> +	/*
> +	 * Use a local copy of the RTC control block to
> +	 * avoid restoring it on resume path.
> +	 */
> +	memcpy(&priv, init_priv, sizeof(priv));
> +
> +	rtccnt = ioread32(init_priv->rtc_base + RTCCNT_OFFSET);
> +	rtcval = ioread32(init_priv->rtc_base + RTCVAL_OFFSET);
> +	offset = rtcval - rtccnt;
> +	sec = cycles_to_sec(init_priv->rtc_hz, offset);
> +
> +	/* Adjust for the number of seconds we'll be asleep */
> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
> +	base_sec += sec;
> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
> +
> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is too far in the future\n");
> +		return -ERANGE;
> +	}
> +
> +	s32g_enable_api_irq(dev, 1);
> +	iowrite32(offset, priv.rtc_base + APIVAL_OFFSET);

What about always using APIVAL instead of RTCVAL so you don't have
anything to do in s32g_rtc_suspend.


> +
> +	return ret;
> +}
> +
> +static int s32g_rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	s32g_enable_api_irq(dev, 0);
> +
> +	ret = rtc_clk_src_setup(priv);
> +	if (ret)
> +		return ret;

I don't think this is necessary.
> +
> +	/*
> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> +	 * reapply the saved time settings.
> +	 */
> +	return s32g_rtc_set_time(dev, &priv->base.tm);

And so this is useless too so yo udon't actually have anything to do in
s32g_rtc_resume.

> +}
> +
> +static const struct of_device_id rtc_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> +	{ /* sentinel */ },
> +};
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
> +			 s32g_rtc_suspend, s32g_rtc_resume);
> +
> +static struct platform_driver s32g_rtc_driver = {
> +	.driver		= {
> +		.name			= "s32g-rtc",
> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
> +		.of_match_table = rtc_dt_ids,
> +	},
> +	.probe		= s32g_rtc_probe,
> +};
> +module_platform_driver(s32g_rtc_driver);
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


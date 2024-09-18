Return-Path: <linux-rtc+bounces-2023-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E44A97BAC8
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 12:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57BDB284224
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 10:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0703B17C7BB;
	Wed, 18 Sep 2024 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SHDX41X/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7BF17B401;
	Wed, 18 Sep 2024 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655191; cv=none; b=HtHoSu4e7hD0JvSVlJWlTuF9xwpZNYZrdu7L/cZEBuaIVgpuPT8vD/6K2tPUvlHf3BKs5TqtzjmO84XYEdfAXfQngpuYdtp4TBqmRy15gqrtTVTcR2n/vI4sIoUo8j/rWLdEqsZ8S913VyXxFJKa9VS5S48AG71qIUsf9Ehct+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655191; c=relaxed/simple;
	bh=jRbamOpM8mSXlUaL31d1GFd/Cvxmo0uSexfCKraPpDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R22Qv/hQhq/HkZ0KV+g3pNHAIt8OC0Im21jTnHqf7MIJi8uux6HTEF72XkzSY7dXkkmuvcpWX5VAwr3zfYcI6mi/08GfIEPmISmtAlnW0gfxUeAGapxu59gm5iAWnXlf+QbnB1eWyHMxXsP6CTRwfzZacLb6lD7nwnBXhREHY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SHDX41X/; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC389FF805;
	Wed, 18 Sep 2024 10:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726655186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uQvuwOsZ8qWq4Nrq0wHzDNdiK248AzaeURHbdnDbBWk=;
	b=SHDX41X/1d33qbqy46A5nxSHqIMN/40n4n4AdBbctu9Z+FKtcxwm4PMN/mcVxmpt/XWRha
	xo6fLkJcU5mWzOItMZq51HBVBGCys3KZHqbWDkzpZRn0ki3x7tqKDDJWHa2ZRPQnh02+RU
	mG6X87fSDetH0x1g6vAXnbqOSZwzkqq+iJZS+f50E/PQFlwlxa0jemg/+9tBi13Bqzclxf
	sEuNypPs+coWX0S9+2fyXgMLRDy3mX6iYXSAxNDZZe54GoD+g79pkfSnz9zuXWPwLUv8S+
	pxbiSgaQU+ca4iN3brdCRhdfNpnjbygrixP7csWJ/P1HkOXbOWkrnPfasBgH4g==
Date: Wed, 18 Sep 2024 12:26:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <2024091810261833316e25@mail.local>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/09/2024 10:00:26+0300, Ciprian Costea wrote:
> +struct rtc_time_base {
> +	s64 sec;
> +	u64 cycles;
> +	u64 rollovers;

The whole rollovers implementation seems useless as the rollover may
happen when Linux is off.

> +#ifdef CONFIG_PM_SLEEP
> +	struct rtc_time tm;
> +#endif
> +};
> +
> +struct rtc_priv {
> +	struct rtc_device *rdev;
> +	struct device *dev;
> +	u8 __iomem *rtc_base;
> +	struct clk *firc;
> +	struct clk *sirc;
> +	struct clk *ipg;
> +	struct rtc_time_base base;
> +	u64 rtc_hz;
> +	u64 rollovers;
> +	int dt_irq_id;
> +	u8 clk_source;
> +	bool div512;
> +	bool div32;
> +};
> +
> +static u64 cycles_to_sec(u64 hz, u64 cycles)
> +{
> +	return cycles / hz;
> +}
> +
> +/*
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
> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ULONG_MAX))
> +		return -EINVAL;
> +
> +	/*
> +	 * RTCCNT is read-only; we must return a value relative to the
> +	 * current value of the counter (and hope we don't linger around
> +	 * too much before we get to enable the interrupt)
> +	 */
> +	delta_cnt = seconds * priv->rtc_hz;
> +	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +
> +	if (~rtccnt < delta_cnt)
> +		target_cnt = (delta_cnt - ~rtccnt);
> +	else
> +		target_cnt = rtccnt + delta_cnt;
> +
> +	/*
> +	 * According to RTCVAL register description,
> +	 * its minimum value should be 4.
> +	 */
> +	if (unlikely(target_cnt < 4))
> +		target_cnt = 4;
> +
> +	*rtcval = target_cnt;
> +
> +	return 0;
> +}
> +
> +static irqreturn_t rtc_handler(int irq, void *dev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(dev);
> +	u32 status;
> +
> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
> +	if (status & RTCS_ROVRF) {
> +		if (priv->rollovers == ULONG_MAX)
> +			priv->rollovers = 0;
> +		else
> +			priv->rollovers++;
> +	}
> +
> +	if (status & RTCS_RTCF) {
> +		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
> +		rtc_update_irq(priv->rdev, 1, RTC_AF);
> +	}
> +
> +	if (status & RTCS_APIF)
> +		rtc_update_irq(priv->rdev, 1, RTC_PF);
> +
> +	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int get_time_left(struct device *dev, struct rtc_priv *priv,
> +			 u32 *sec)
> +{
> +	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
> +
> +	if (rtcval < rtccnt) {
> +		dev_err(dev, "RTC timer expired before entering suspend\n");
> +		return -EIO;
> +	}
> +
> +	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
> +				     u32 offset)
> +{
> +	u64 cycles, sec, base_cycles;
> +	u32 counter;
> +
> +	counter = ioread32(priv->rtc_base + offset);
> +	cycles = priv->rollovers * ROLLOVER_VAL + counter;
> +	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
> +
> +	if (cycles < base_cycles)
> +		return -EINVAL;
> +
> +	cycles -= base_cycles;
> +	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);

What happens after you reboot?

This doesn't seem to be a proper RTC, unless you have some NVMEM to
store the offset between the current time and the value of the counter.
As-is, the driver is not working.

> +
> +	return sec;
> +}
> +
> +static int s32g_rtc_read_time(struct device *dev,
> +			      struct rtc_time *tm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u64 sec;
> +
> +	if (!tm)
> +		return -EINVAL;
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
> +	u32 rtcc, sec_left;
> +	u64 sec;
> +
> +	if (!alrm)
> +		return -EINVAL;
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
> +	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
> +		alrm->pending = !!sec_left;
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 rtcc;
> +
> +	if (!priv->dt_irq_id)
> +		return -EIO;
> +
> +	/*
> +	 * RTCIE cannot be deasserted because it will also disable the
> +	 * rollover interrupt.
> +	 */
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
> +	int ret = 0;
> +	u32 rtcval, rtcs;
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
> +		return -EINVAL;
> +	}
> +
> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is set too far in the future\n");
> +		return ret;
> +	}
> +
> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
> +	if (ret) {
> +		dev_err(dev, "Synchronization failed\n");
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
> +		return -EINVAL;
> +
> +	priv->base.rollovers = priv->rollovers;
> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +	priv->base.sec = rtc_tm_to_time64(time);
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
> +static void rtc_disable(struct rtc_priv *priv)
> +{
> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +
> +	rtcc &= ~RTCC_CNTEN;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static void rtc_enable(struct rtc_priv *priv)
> +{
> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +
> +	rtcc |= RTCC_CNTEN;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static int rtc_init(struct rtc_priv *priv)
> +{
> +	struct device *dev = priv->dev;
> +	struct clk *sclk;
> +	u32 rtcc = 0;
> +	u32 clksel;
> +	int ret;
> +
> +	ret = clk_prepare_enable(priv->ipg);
> +	if (ret) {
> +		dev_err(dev, "Cannot enable 'ipg' clock, error: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(priv->sirc);
> +	if (ret) {
> +		dev_err(dev, "Cannot enable 'sirc' clock, error: %d\n", ret);
> +		goto disable_ipg_clk;
> +	}
> +
> +	ret = clk_prepare_enable(priv->firc);
> +	if (ret) {
> +		dev_err(dev, "Cannot enable 'firc' clock, error: %d\n", ret);
> +		goto disable_sirc_clk;
> +	}
> +
> +	/* Make sure the RTC ticking is disabled before we configure dividers */
> +	rtc_disable(priv);

At this point, you lost the RTC accuracy, this must not be done on probe
> +
> +	clksel = RTCC_CLKSEL(priv->clk_source);
> +	rtcc |= clksel;
> +
> +	/* Precompute the base frequency of the clock */
> +	switch (clksel) {
> +	case RTCC_CLKSEL(S32G_RTC_SOURCE_SIRC):
> +		sclk = priv->sirc;
> +		break;
> +	case RTCC_CLKSEL(S32G_RTC_SOURCE_FIRC):
> +		sclk = priv->firc;
> +		break;
> +	default:
> +		dev_err(dev, "Invalid clksel value: %u\n", clksel);
> +		ret = -EINVAL;
> +		goto disable_firc_clk;
> +	}
> +
> +	priv->rtc_hz = clk_get_rate(sclk);
> +	if (!priv->rtc_hz) {
> +		dev_err(dev, "Invalid RTC frequency\n");
> +		ret = -EINVAL;
> +		goto disable_firc_clk;
> +	}
> +
> +	/* Adjust frequency if dividers are enabled */
> +	if (priv->div512) {
> +		rtcc |= RTCC_DIV512EN;
> +		priv->rtc_hz /= 512;
> +	}
> +
> +	if (priv->div32) {
> +		rtcc |= RTCC_DIV32EN;
> +		priv->rtc_hz /= 32;
> +	}
> +
> +	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +
> +	return 0;
> +
> +disable_firc_clk:
> +	clk_disable_unprepare(priv->firc);
> +disable_sirc_clk:
> +	clk_disable_unprepare(priv->sirc);
> +disable_ipg_clk:
> +	clk_disable_unprepare(priv->ipg);
> +	return ret;
> +}
> +
> +static int priv_dts_init(struct rtc_priv *priv)
> +{
> +	struct device *dev = priv->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	u32 clksel = S32G_RTC_SOURCE_SIRC;
> +	/* div512 and div32 */
> +	u32 div[2] = { 0 };
> +	int ret;
> +
> +	priv->sirc = devm_clk_get(dev, "sirc");
> +	if (IS_ERR(priv->sirc)) {
> +		dev_err(dev, "Failed to get 'sirc' clock\n");
> +		return PTR_ERR(priv->sirc);
> +	}
> +
> +	priv->firc = devm_clk_get(dev, "firc");
> +	if (IS_ERR(priv->firc)) {
> +		dev_err(dev, "Failed to get 'firc' clock\n");
> +		return PTR_ERR(priv->firc);
> +	}
> +
> +	priv->ipg = devm_clk_get(dev, "ipg");
> +	if (IS_ERR(priv->ipg)) {
> +		dev_err(dev, "Failed to get 'ipg' clock\n");
> +		return PTR_ERR(priv->ipg);
> +	}
> +
> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
> +	if (priv->dt_irq_id < 0) {
> +		dev_err(dev, "Error reading interrupt # from dts\n");
> +		return priv->dt_irq_id;
> +	}
> +
> +	ret = device_property_read_u32_array(dev, "nxp,dividers", div,
> +					     ARRAY_SIZE(div));
> +	if (ret) {
> +		dev_err(dev, "Error reading dividers configuration, err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = device_property_read_u32(dev, "nxp,clksel", &clksel);
> +	if (ret) {
> +		dev_err(dev, "Error reading clksel configuration, err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->div512 = !!div[0];
> +	priv->div32 = !!div[1];
> +
> +	switch (clksel) {
> +	case S32G_RTC_SOURCE_SIRC:
> +	case S32G_RTC_SOURCE_FIRC:
> +		priv->clk_source = clksel;
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported clksel: %d\n", clksel);
> +		return -EINVAL;
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
> +	priv = devm_kzalloc(dev, sizeof(struct rtc_priv),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->rtc_base)) {
> +		dev_err(dev, "Failed to map registers\n");
> +		return PTR_ERR(priv->rtc_base);
> +	}
> +
> +	device_init_wakeup(dev, true);
> +	priv->dev = dev;
> +
> +	ret = priv_dts_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = rtc_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, priv);
> +	rtc_enable(priv);
> +
> +	priv->rdev = devm_rtc_device_register(dev, "s32g_rtc",
> +					      &rtc_ops, THIS_MODULE);

This is deprecated, please use devm_rtc_allocate_device and devm_rtc_register_device

> +	if (IS_ERR_OR_NULL(priv->rdev)) {
> +		dev_err(dev, "Error registering RTC device, err: %ld\n",
> +			PTR_ERR(priv->rdev));
> +		ret = PTR_ERR(priv->rdev);
> +		goto disable_rtc;
> +	}
> +
> +	ret = devm_request_irq(dev, priv->dt_irq_id,
> +			       rtc_handler, 0, dev_name(dev), pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Request interrupt %d failed, error: %d\n",
> +			priv->dt_irq_id, ret);
> +		goto disable_rtc;

You must not fail after registering the RTC, else your driver will be
opened to a race condition;

> +	}
> +
> +	return 0;
> +
> +disable_rtc:
> +	rtc_disable(priv);
> +	return ret;
> +}
> +
> +static void rtc_remove(struct platform_device *pdev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
> +
> +	rtc_disable(priv);

Disabling the RTC when shutting down renders the RTC useless.

> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static void enable_api_irq(struct device *dev, unsigned int enabled)
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
> +static int adjust_dividers(u32 sec, struct rtc_priv *priv)
> +{
> +	u64 rtcval_max = U32_MAX;
> +	u64 rtcval;
> +
> +	priv->div32 = 0;
> +	priv->div512 = 0;
> +
> +	rtcval = sec * priv->rtc_hz;
> +	if (rtcval < rtcval_max)
> +		return 0;
> +
> +	if (rtcval / 32 < rtcval_max) {
> +		priv->div32 = 1;
> +		return 0;
> +	}
> +
> +	if (rtcval / 512 < rtcval_max) {
> +		priv->div512 = 1;
> +		return 0;
> +	}
> +
> +	if (rtcval / (512 * 32) < rtcval_max) {
> +		priv->div32 = 1;
> +		priv->div512 = 1;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int rtc_suspend(struct device *dev)
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
> +	/* Save last known timestamp before we switch clocks and reinit RTC */
> +	ret = s32g_rtc_read_time(dev, &priv.base.tm);
> +	if (ret)
> +		return ret;
> +
> +	if (init_priv->clk_source == S32G_RTC_SOURCE_SIRC)
> +		return 0;
> +
> +	/*
> +	 * Use a local copy of the RTC control block to
> +	 * avoid restoring it on resume path.
> +	 */
> +	memcpy(&priv, init_priv, sizeof(priv));
> +
> +	/* Switch to SIRC */
> +	priv.clk_source = S32G_RTC_SOURCE_SIRC;
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
> +	rtc_disable(&priv);
> +
> +	ret = adjust_dividers(sec, &priv);
> +	if (ret) {
> +		dev_err(dev, "Failed to adjust RTC dividers to match a %u seconds delay\n", sec);
> +		return ret;
> +	}
> +
> +	ret = rtc_init(&priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is too far in the future\n");
> +		return ret;
> +	}

All of this seems super fishy.

> +
> +	s32g_rtc_alarm_irq_enable(dev, 0);
> +	enable_api_irq(dev, 1);
> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
> +
> +	rtc_enable(&priv);
> +
> +	return ret;
> +}
> +
> +static int rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	enable_api_irq(dev, 0);
> +
> +	/* Reinitialize the driver using the initial settings */
> +	ret = rtc_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	rtc_enable(priv);
> +
> +	/*
> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> +	 * reapply the saved time settings
> +	 */
> +	return s32g_rtc_set_time(dev, &priv->base.tm);
> +}
> +#endif /* CONFIG_PM_SLEEP */
> +
> +static const struct of_device_id rtc_dt_ids[] = {
> +	{.compatible = "nxp,s32g-rtc" },
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
> +		.of_match_table = of_match_ptr(rtc_dt_ids),
> +	},
> +	.probe		= rtc_probe,
> +	.remove_new	= rtc_remove,
> +};
> +module_platform_driver(rtc_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> +MODULE_LICENSE("GPL");
> -- 
> 2.45.2
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


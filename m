Return-Path: <linux-rtc+bounces-1312-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7417790873D
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 11:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E65CB1F2443F
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 09:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20641922F6;
	Fri, 14 Jun 2024 09:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eddZwAv/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88883191497;
	Fri, 14 Jun 2024 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356929; cv=none; b=ZSnduyMlc94gik8H/eSpde6CiEWtdFntB0yeBGTjUlS1I4c3NV+VN76/FxjbJkjofaMFsoHFZnB77VHHXII3Q3NDrtzjVOtWAW3K7yIjV650aYLdmYudlO8vU3WJLScmOJsHTUCb9+cltnK11wI+cne0FIc7EgoGZdudUWYfkT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356929; c=relaxed/simple;
	bh=Q7gy1qqjZ+smCjQs/lR/3S57dKZFxfXG77Ywzt1cdUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSsT7RvvKA8JnYaOaZ1EUA0kSwSvH3Bzt/8oTbCuTq8k/hWJu68B9eWQGR430VYB3U+sXNYlvBcxfzliV6ZjpwmkibEdZAKx8z5hPDKHAgReMs+GGlH5uNdgRU1SWq7ReFBYd/ogQQL60qmlRMEmOF2JaAdaN3fHH2viTABXuwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eddZwAv/; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18A8020007;
	Fri, 14 Jun 2024 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718356919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ez2HfY1x87bBiR5tU1ndmRD1HXIhQKtusmjdRjvINyc=;
	b=eddZwAv/wquEluA9pJKGZdXbksACURRWevQ1N6byNcOheTyrgeIOEKGM632e9au9gW12gQ
	d2IxX2j69f6CaKGOi7zMsIE/c8VglP6S/U+jZH8xfuuktleI2iYtT0rLGs1Ag4CfImo49O
	ykvT85mdUKaa7LHIXeElrU+UREGO8qXAi4fttIkO8dfY1mKB8PsN+mFWw9f4Hb90xtlkNw
	2bd9AEFqSEIcYj7GmfcyU6uGyb7q17zQARUK2sl6jjvRKAhWKoscCXefYxXCXRGhu13Pss
	JH6CDhtFF+dymhpdZuKYBfpN1i80pAuQF/47Qf0w2yxgJxqB1JqrcZpL6TwwUw==
Date: Fri, 14 Jun 2024 11:21:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Message-ID: <2024061409215756e6a10c@mail.local>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-7-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614071932.1014067-7-claudiu.beznea.uj@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Claudiu,

On 14/06/2024 10:19:26+0300, Claudiu wrote:
> +static int rtca3_initial_setup(struct rtca3_priv *priv)
> +{
> +	unsigned long osc32k_rate;
> +	u8 pes, tmp, mask;
> +	u32 sleep_us;
> +	int ret;
> +
> +	osc32k_rate = clk_get_rate(priv->clk);
> +	if (!osc32k_rate)
> +		return -EINVAL;
> +
> +	sleep_us = DIV_ROUND_UP_ULL(1000000ULL, osc32k_rate) * 6;
> +
> +	priv->ppb.ten_sec = DIV_ROUND_CLOSEST_ULL(1000000000ULL, (osc32k_rate * 10));
> +	priv->ppb.sixty_sec = DIV_ROUND_CLOSEST_ULL(1000000000ULL, (osc32k_rate * 60));
> +
> +	/*
> +	 * According to HW manual (section 22.4.2. Clock and count mode setting procedure)
> +	 * we need to wait at least 6 cycles of the 32KHz clock after clock was enabled.
> +	 */
> +	usleep_range(sleep_us, sleep_us + 10);
> +
> +	/* Disable alarm and carry interrupts. */
> +	mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE;
> +	rtca3_byte_update_bits(priv, RTCA3_RCR1, mask, 0);
> +	ret = readb_poll_timeout(priv->base + RTCA3_RCR1, tmp, !(tmp & mask),
> +				 10, RTCA3_DEFAULT_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Stop the RTC and set to 12 hours mode and calendar count mode.
> +	 * RCR2.START initial value is undefined so we need to stop here
> +	 * all the time.
> +	 */

Certainly not, if you stop the RTC on probe, you lose the time
information, this must only be done when the RTC has never been
initialised. The whole goal of the RTC is the keep time across reboots,
its lifecycle is longer than the system.

Also, why do you insist on 12H-mode? The proper thing to do is to support
12H-mode on read but always use 24H-mode when setting the time.

> +	mask = RTCA3_RCR2_START | RTCA3_RCR2_HR24 | RTCA3_RCR2_CNTMD;
> +	writeb(0, priv->base + RTCA3_RCR2);
> +	ret = readb_poll_timeout(priv->base + RTCA3_RCR2, tmp, !(tmp & mask),
> +				 10, RTCA3_DEFAULT_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	/* Execute reset and wait for reset and calendar count mode to be applied. */
> +	mask = RTCA3_RCR2_RESET | RTCA3_RCR2_CNTMD;
> +	writeb(RTCA3_RCR2_RESET, priv->base + RTCA3_RCR2);
> +	ret = readb_poll_timeout(priv->base + RTCA3_RCR2, tmp, !(tmp & mask),
> +				 10, RTCA3_RESET_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * According to HW manual (section 22.6.3. Notes on writing to and reading
> +	 * from registers) after reset we need to wait 6 clock cycles before
> +	 * writing to RTC registers.
> +	 */
> +	usleep_range(sleep_us, sleep_us + 10);
> +
> +	/* Set no adjustment. */
> +	writeb(0, priv->base + RTCA3_RADJ);
> +	ret = readb_poll_timeout(priv->base + RTCA3_RADJ, tmp, !tmp, 10,
> +				 RTCA3_DEFAULT_TIMEOUT_US);
> +
> +	/* Start the RTC and enable automatic time error adjustment. */
> +	mask = RTCA3_RCR2_START | RTCA3_RCR2_AADJE;
> +	writeb(RTCA3_RCR2_START | RTCA3_RCR2_AADJE, priv->base + RTCA3_RCR2);
> +	ret = readb_poll_timeout(priv->base + RTCA3_RCR2, tmp, ((tmp & mask) == mask),
> +				 10, RTCA3_START_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * According to HW manual (section 22.6.4. Notes on writing to and reading
> +	 * from registers) we need to wait 1/128 seconds while the clock is operating
> +	 * (RCR2.START bit = 1) to be able to read the counters after a return from
> +	 * reset.
> +	 */
> +	usleep_range(8000, 9000);
> +
> +	/* Set period interrupt to 1/64 seconds. It is necessary for alarm setup. */
> +	pes = FIELD_PREP(RTCA3_RCR1_PES, RTCA3_RCR1_PES_1_64_SEC);
> +	rtca3_byte_update_bits(priv, RTCA3_RCR1, RTCA3_RCR1_PES, pes);
> +	return readb_poll_timeout(priv->base + RTCA3_RCR1, tmp, ((tmp & RTCA3_RCR1_PES) == pes),
> +				  10, RTCA3_DEFAULT_TIMEOUT_US);
> +}
> +
> +static int rtca3_request_irqs(struct platform_device *pdev, struct rtca3_priv *priv)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret, irq;
> +
> +	irq = platform_get_irq_byname(pdev, "alarm");
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get alarm IRQ!\n");
> +
> +	ret = devm_request_irq(dev, irq, rtca3_alarm_handler, 0, "rtca3-alarm", priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request alarm IRQ!\n");
> +	priv->wakeup_irq = irq;
> +
> +	irq = platform_get_irq_byname(pdev, "period");
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get period IRQ!\n");
> +
> +	ret = devm_request_irq(dev, irq, rtca3_periodic_handler, 0, "rtca3-period", priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request period IRQ!\n");
> +
> +	/*
> +	 * Driver doesn't implement carry handler. Just get the IRQ here
> +	 * for backward compatibility, in case carry support will be added later.
> +	 */
> +	irq = platform_get_irq_byname(pdev, "carry");
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get carry IRQ!\n");
> +
> +	return 0;
> +}
> +
> +static int rtca3_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtca3_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->clk = devm_clk_get_enabled(dev, "counter");
> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	spin_lock_init(&priv->lock);
> +	atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
> +	init_completion(&priv->set_alarm_completion);
> +
> +	ret = rtca3_initial_setup(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to setup the RTC!\n");
> +
> +	ret = rtca3_request_irqs(pdev, priv);
> +	if (ret)
> +		return ret;
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	priv->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(priv->rtc_dev))
> +		return PTR_ERR(priv->rtc_dev);
> +
> +	priv->rtc_dev->ops = &rtca3_ops;
> +	priv->rtc_dev->max_user_freq = 256;
> +	priv->rtc_dev->range_min = mktime64(1999, 1, 1, 0, 0, 0);
> +	priv->rtc_dev->range_max = mktime64(2098, 12, 31, 23, 59, 59);

This very much looks like the range should be 2000 to 2099, why do you
want to shift it?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


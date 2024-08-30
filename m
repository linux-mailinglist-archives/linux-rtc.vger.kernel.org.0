Return-Path: <linux-rtc+bounces-1818-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A4A966C48
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Aug 2024 00:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97A29B219A4
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 22:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7820A1C175C;
	Fri, 30 Aug 2024 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i6DCz8Df"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C535136337;
	Fri, 30 Aug 2024 22:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056754; cv=none; b=jfdNJGJcWyjQFAol7Uf7phTSisBLfHfhcYZeLYxuMxrTJ65WRk+pDfOoASgixRD+Jxs0QvpIRD5RHUXu08LiULLNxC+lUuh45gCHfSJTWUbQ8ITPBHHFGIpPbBcvZu/YeilyZ/1EtBANjiWpb2GLyKbBHTSjAjo3ZRP6VMQYCmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056754; c=relaxed/simple;
	bh=f2XKavdW1vhVPPhblS1ZTY7s6BzocYVLygaWMIG4E8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mlkc5q9sjlwhLU4TF54e9ghj3XkIteoOH+EPC4KcbN8ENKh6rR4/Hx0dXnT3vkXYmhR3Sx6NAsC3WC6ZmkkLASBflbRohLE67AXcIaI4Z/xtzL9YRLhOTwg5LqT20NB2bSadZVIVOlw0ZpNEc9ksmlDjHhLNzR6UIZhY7687TmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i6DCz8Df; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E80FAE0002;
	Fri, 30 Aug 2024 22:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725056743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bdFbgMzvJfpDhPePQ3r4tXcwVqtf83V3DSLfXhWmeh4=;
	b=i6DCz8Df3DS85Yq0zFUf7EEIoONfr6gr2r9oB4Ay9Kx3Tm9eLlszQ+nmQlYYQyozSnV/lO
	I8wvFRcRbAyBxV+1jgT86KlYUS4JjTbYQpzZnFUmViYmBnLVU9vp7jaLmZoAgCbNIEYlEw
	riRw3LDrJ2HDtXPfTaCcctoG+IO2iQDWHDDs69PlHf08cLLZ344FCtXR3ydIEv6/X90c2w
	tL051qgA6Hlu8O235aadAdFtrsdsmh44Gp0UBwOl/jnVtta922z5lpmODpAIcUT+suPbP5
	YGk/HJn7ZE8+ogAoSLmnIi1AP2BN+2FPtIfOZVzCi+lmWWEspAWRUpNYJTyCjA==
Date: Sat, 31 Aug 2024 00:25:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Message-ID: <202408302225417622f1e7@mail.local>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 30/08/2024 16:02:12+0300, Claudiu wrote:
> +	priv->rtc_dev->range_min = mktime64(2000, 1, 1, 0, 0, 0);

RTC_TIMESTAMP_BEGIN_2000

> +	priv->rtc_dev->range_max = mktime64(2099, 12, 31, 23, 59, 59);

RTC_TIMESTAMP_END_2099

> +
> +	return devm_rtc_register_device(priv->rtc_dev);
> +}
> +
> +static void rtca3_remove(struct platform_device *pdev)
> +{
> +	struct rtca3_priv *priv = platform_get_drvdata(pdev);
> +
> +	guard(spinlock_irqsave)(&priv->lock);
> +
> +	/* Disable alarm, periodic interrupts. */
> +	rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);

Why do you disable alarms on driver remove? I think you need to add a
comment if this is because it can't system up, else this is a bad
practice.

> +
> +static int rtca3_clean_alarm(struct rtca3_priv *priv)
> +{
> +	struct rtc_device *rtc_dev = priv->rtc_dev;
> +	time64_t alarm_time, now;
> +	struct rtc_wkalrm alarm;
> +	struct rtc_time tm;
> +	u8 pending;
> +	int ret;
> +
> +	ret = rtc_read_alarm(rtc_dev, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	if (!alarm.enabled)
> +		return 0;
> +
> +	ret = rtc_read_time(rtc_dev, &tm);
> +	if (ret)
> +		return ret;
> +
> +	alarm_time = rtc_tm_to_time64(&alarm.time);
> +	now = rtc_tm_to_time64(&tm);
> +	if (alarm_time >= now)
> +		return 0;
> +
> +	/*
> +	 * Heuristically, it has been determined that when returning from deep
> +	 * sleep state the RTCA3_RSR.AF is zero even though the alarm expired.
> +	 * Call again the rtc_update_irq() if alarm helper detects this.
> +	 */
> +
> +	guard(spinlock_irqsave)(&priv->lock);
> +
> +	pending = rtca3_alarm_handler_helper(priv);
> +	if (!pending)
> +		rtc_update_irq(priv->rtc_dev, 1, RTC_AF | RTC_IRQF);
> +
> +	return 0;
> +}
> +
> +static int rtca3_resume(struct device *dev)
> +{
> +	struct rtca3_priv *priv = dev_get_drvdata(dev);
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	disable_irq_wake(priv->wakeup_irq);
> +
> +	/*
> +	 * According to the HW manual (section 22.6.4 Notes on writing to
> +	 * and reading from registers) we need to wait 1/128 seconds while
> +	 * RCR2.START = 1 to be able to read the counters after a return from low
> +	 * power consumption state.
> +	 */
> +	mdelay(8);
> +
> +	/*
> +	 * The alarm cannot wake the system from deep sleep states. In case
> +	 * we return from deep sleep states and the alarm expired we need
> +	 * to disable it to avoid failures when setting another alarm.
> +	 */
> +	return rtca3_clean_alarm(priv);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rtca3_pm_ops, rtca3_suspend, rtca3_resume);
> +
> +static const struct of_device_id rtca3_of_match[] = {
> +	{ .compatible = "renesas,rz-rtca3", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rtca3_of_match);
> +
> +static struct platform_driver rtca3_platform_driver = {
> +	.driver = {
> +		.name = "rtc-rtca3",
> +		.pm = pm_ptr(&rtca3_pm_ops),
> +		.of_match_table = rtca3_of_match,
> +	},
> +	.probe = rtca3_probe,
> +	.remove_new = rtca3_remove,
> +};
> +module_platform_driver(rtca3_platform_driver);
> +
> +MODULE_DESCRIPTION("Renesas RTCA-3 RTC driver");
> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


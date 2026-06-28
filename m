Return-Path: <linux-rtc+bounces-6770-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EKeyND0WQWp7kwkAu9opvQ
	(envelope-from <linux-rtc+bounces-6770-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jun 2026 14:40:29 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7B6D3D22
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jun 2026 14:40:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=DCqDw6wb;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6770-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6770-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC8453008233
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jun 2026 12:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD5A3A4F34;
	Sun, 28 Jun 2026 12:40:27 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6474C344DB5;
	Sun, 28 Jun 2026 12:40:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650427; cv=none; b=TQAx49bvnw7wmfaNNDk9LQRiP7zLqefsY2QnG3ZckZaVrOlSkBG9L7Lxs6eqx9VJH5n5shxSoo0AxmpFw5GU/gdjtqiTEMMWeO532TRjCtIAYkdaahWweq1S07u55OTqf/T7T4xnrddqAopZUuwI3aovyvDYBD2VfgGZCSaB0QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650427; c=relaxed/simple;
	bh=UZmgrhU1B5jt3o/iWxMq8eBPSxrDtrzbKdiZZ8elzXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZtoJdnWdkWzBlnjnQeNVMF4LqJymuvuxXq8W9SDCeDzR28MZH9ZbCxRnxPpcQZTcBF5YtBjOIbLHzL0o+Ser8YqMi+Ow2QlyZtETCQ0ErmHCbhWZkCk0lGqkmk5xJgBvxketVdQkB48b3SeyuJWblWltqjTrVdhx28GnRsXCOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DCqDw6wb; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E54A9C5846B;
	Sun, 28 Jun 2026 12:40:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B97D5FF79;
	Sun, 28 Jun 2026 12:40:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B957106F0DB7;
	Sun, 28 Jun 2026 14:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782650415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1rLRCS8D8wJB9YfOeDSZWLIo+1Ft4jeCXNnks+hWR/o=;
	b=DCqDw6wbGGYCr8YF7Fg57zOuNb1J1GpVW3MZqOhGmGivqbU6J+DxWhQi1mjXU2QECKnVn9
	9xJ5VpUr/DQZ3EuVBl1qhsFyDwwM+jqvfIAuckB0kbjXR+ctdp9jTK71iB2OxM2IhqYTLe
	cY0QLvU6emKnWATRq4lVfBTe7a1wwV+fxsHKif02mHVYO/xHO+uYscV19xDJfT+R05fels
	6Gd6EZc6Oe6Fj2ZjLhJ2jmUU4aLSBjpuh6tE1wYpEOvsZRqM7w0u9zZtkBRj5KdvhjsUKl
	I0sohga5ibQ2HELgF3yBh5PZ/kbNFHQ40o2WJP/DiD62fqpf2zWsb6cVkH/6GA==
Date: Sun, 28 Jun 2026 14:40:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v2 1/2] rtc: m5441x: add MCF5441x on-chip RTC driver
Message-ID: <2026062812401322c1a565@mail.local>
References: <20260607-jmh-upstream-coldfire-rtc-v2-0-948d2b1ed146@yoseli.org>
 <20260607-jmh-upstream-coldfire-rtc-v2-1-948d2b1ed146@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-jmh-upstream-coldfire-rtc-v2-1-948d2b1ed146@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6770-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jeanmichel.hautbois@yoseli.org,m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,bootlin.com:server fail,mail.local:server fail,yoseli.org:server fail,sea.lore.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.local:mid,yoseli.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22C7B6D3D22

Hello,

On 07/06/2026 11:00:40+0200, Jean-Michel Hautbois wrote:
> +static int m5441x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct m5441x_rtc *p = dev_get_drvdata(dev);
> +	u16 yearmon, days, hourmin, seconds;
> +	unsigned int tries = 3;
> +	unsigned long flags;
> +	int ret;
> +
> +	/*
> +	 * Without a running oscillator the counters are frozen; refuse the
> +	 * read rather than hand userspace a stale time that hwclock --hctosys
> +	 * would propagate into the system clock.
> +	 */
> +	if (p->osc_dead)
> +		return -ENODATA;

While not ideal, the current standard is to return -EINVAL in this case.

> +
> +static int m5441x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct m5441x_rtc *p = dev_get_drvdata(dev);
> +	s8 yoff = (tm->tm_year + 1900) - M5441X_RTC_YEAR_BASE;
> +	unsigned int tries = 3;
> +	unsigned long flags;
> +	int ret;
> +
> +	/* A frozen oscillator would never latch the new time; reject it. */
> +	if (p->osc_dead)
> +		return -ENODATA;

set_time is a good location to actually restart the oscillator instead
of failing.


> +
> +	/*
> +	 * Writes are nullified while INVAL is asserted. wait_valid() clears
> +	 * the path before the burst, but the knock plus four writes can cross
> +	 * a second boundary on a slow RTC bus, silently dropping fields.
> +	 * Re-check INVAL afterwards and rewrite on observed re-entry.
> +	 */
> +	spin_lock_irqsave(&p->lock, flags);
> +	do {
> +		ret = m5441x_rtc_wait_valid(p);
> +		if (ret)
> +			break;
> +		m5441x_rtc_unlock(p);
> +		rtc_wr(p, M5441X_RTC_YEARMON,
> +		       ((u16)((u8)yoff) << 8) | ((tm->tm_mon + 1) & 0xff));
> +		rtc_wr(p, M5441X_RTC_DAYS,
> +		       ((tm->tm_wday & 0x7) << 8) | (tm->tm_mday & 0x1f));
> +		rtc_wr(p, M5441X_RTC_HOURMIN,
> +		       ((tm->tm_hour & 0x1f) << 8) | (tm->tm_min & 0x3f));
> +		rtc_wr(p, M5441X_RTC_SECONDS, tm->tm_sec & 0x3f);
> +		/* No boundary crossed mid-burst -> the writes all took. */
> +		if (!(rtc_rd(p, M5441X_RTC_SR) & M5441X_RTC_SR_INVAL))
> +			break;
> +		ret = -EAGAIN;
> +	} while (--tries);
> +	spin_unlock_irqrestore(&p->lock, flags);
> +
> +	return ret;
> +}
> +
> +



> +static int m5441x_rtc_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config nvmem_cfg = {
> +		.name		= "m5441x_rtc_sram",
> +		.type		= NVMEM_TYPE_BATTERY_BACKED,
> +		.word_size	= 1,
> +		.stride		= 1,
> +		.size		= M5441X_RTC_SRAM_SIZE,
> +		.reg_read	= m5441x_rtc_nvram_read,
> +		.reg_write	= m5441x_rtc_nvram_write,
> +	};
> +	struct m5441x_rtc *p;
> +	unsigned long flags;
> +	bool osc_dead = false;
> +	int irq, ret;
> +	u16 cr, cfg;
> +
> +	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +	spin_lock_init(&p->lock);
> +
> +	p->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(p->base))
> +		return PTR_ERR(p->base);
> +
> +	platform_set_drvdata(pdev, p);
> +
> +	/* Enable the oscillator if needed and mask/clear stale interrupts. */
> +	spin_lock_irqsave(&p->lock, flags);
> +	m5441x_rtc_unlock(p);
> +	/*
> +	 * Force binary, DST-free time/date encoding. The driver does not
> +	 * handle the BCD format, and Linux expects the RTC to keep monotonic
> +	 * time with local-time/DST conversion done in userspace, so clear
> +	 * BCDEN and DSTEN in case a bootloader or prior OS left them set. Also
> +	 * default the alarm match field to a full one-shot match: the reset
> +	 * value (AM=00) is a daily hh:mm:ss match, which would fire on the
> +	 * wrong day if userspace enables the alarm via RTC_AIE_ON without
> +	 * first programming it through set_alarm().
> +	 */
> +	cr = rtc_rd(p, M5441X_RTC_CR);
> +	cr &= ~(M5441X_RTC_CR_BCDEN | M5441X_RTC_CR_DSTEN | M5441X_RTC_CR_AM_MASK);
> +	cr |= M5441X_RTC_CR_AM_FULL;
> +	m5441x_rtc_write_cr(p, cr);

You must not enable the oscillator in probe as then you lose the
important information of whether the RTC has ever been set. Also,
forcefully setting DST here may destroy the existing date/time, don't do
this unless you know what is the current time (i.e. in set_time)

> +
> +	/*
> +	 * The alarm registers are battery-backed and survive a power cycle,
> +	 * so a previously armed match could re-fire before set_alarm() runs.
> +	 * Clear them now (the write window is open).
> +	 */
> +	rtc_wr(p, M5441X_RTC_ALM_YRMON, 0);
> +	rtc_wr(p, M5441X_RTC_ALM_DAYS, 0);
> +	rtc_wr(p, M5441X_RTC_ALM_HM, 0);
> +	rtc_wr(p, M5441X_RTC_ALM_SEC, 0);

Why wouldn't you want an existing alarm to fire? The registers are
battery backed exactly for this purpose.

> +
> +	/*
> +	 * Enable the 32kHz oscillator that drives the time counters. This only
> +	 * checks that the OSCEN enable bit latches: when it reads back clear
> +	 * the oscillator block rejected the enable, which in practice means no
> +	 * RTC crystal is fitted and the counters will never advance. It cannot
> +	 * tell a dead crystal from one still starting up, so it is a best-
> +	 * effort hint, not a liveness guarantee. Warn but keep probing, since
> +	 * the battery-backed standby RAM stays usable without the oscillator.
> +	 */
> +	cfg = rtc_rd(p, M5441X_RTC_CFG_DATA);
> +	if (!(cfg & M5441X_RTC_CFG_OSCEN)) {
> +		rtc_wr(p, M5441X_RTC_CFG_DATA, cfg | M5441X_RTC_CFG_OSCEN);
> +		if (!(rtc_rd(p, M5441X_RTC_CFG_DATA) & M5441X_RTC_CFG_OSCEN))
> +			osc_dead = true;
> +	}
> +
> +	/* Mask every source but keep the reserved bit 0 set as required. */
> +	rtc_wr(p, M5441X_RTC_IER, M5441X_RTC_IER_RSVD);
> +	rtc_wr(p, M5441X_RTC_ISR, rtc_rd(p, M5441X_RTC_ISR));

An existing alarm needs to be kept enabled.

> +	spin_unlock_irqrestore(&p->lock, flags);

I'm pretty sure locking here is useless until you register the interrupt.

> +
> +	/*
> +	 * Keep the device (and its standby-RAM nvmem) usable, but record the
> +	 * dead oscillator so read_time/set_time refuse to expose a clock that
> +	 * cannot tick.
> +	 */
> +	p->osc_dead = osc_dead;
> +	if (osc_dead)
> +		dev_warn(&pdev->dev,
> +			 "RTC oscillator enable did not latch; timekeeping unavailable (no 32kHz crystal?)\n");
> +
> +	p->rtc = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(p->rtc))
> +		return PTR_ERR(p->rtc);
> +
> +	p->rtc->ops = &m5441x_rtc_ops;
> +	p->rtc->range_min = mktime64(1984, 1, 1, 0, 0, 0);
> +	p->rtc->range_max = mktime64(2239, 12, 31, 23, 59, 59);
> +
> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq > 0) {
> +		ret = devm_request_irq(&pdev->dev, irq, m5441x_rtc_irq, 0,
> +				       dev_name(&pdev->dev), p);

If this interrupt can be threaded, the spinlock becomes useless as long
as you lock the RTC with rtc_lock/rtc_unlock in the interrupt handler.

> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"failed to request IRQ %d: %d, alarm disabled\n",
> +				irq, ret);
> +			clear_bit(RTC_FEATURE_ALARM, p->rtc->features);
> +		} else {
> +			/*
> +			 * The alarm comparator runs on standby power, so let it
> +			 * wake a suspended system. The PM core keeps the IRQ
> +			 * enabled across suspend once it is the device's wake
> +			 * IRQ; both are device-managed.
> +			 */
> +			devm_device_init_wakeup(&pdev->dev);
> +			devm_pm_set_wake_irq(&pdev->dev, irq);
> +		}
> +	} else {
> +		clear_bit(RTC_FEATURE_ALARM, p->rtc->features);
> +	}
> +
> +	/*
> +	 * Register the RTC device before the nvmem provider:
> +	 * devm_rtc_nvmem_register() copies rtc->owner into the nvmem config,
> +	 * and that field is only assigned by devm_rtc_register_device().
> +	 * Registering nvmem first would leave its owner NULL and fail to pin
> +	 * this module while standby-RAM consumers hold references.
> +	 */
> +	ret = devm_rtc_register_device(p->rtc);
> +	if (ret)
> +		return ret;
> +
> +	nvmem_cfg.priv = p;
> +	ret = devm_rtc_nvmem_register(p->rtc, &nvmem_cfg);
> +	if (ret)
> +		dev_warn(&pdev->dev, "standby RAM nvmem unavailable: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver m5441x_rtc_driver = {
> +	.driver = {
> +		.name = "rtc-m5441x",
> +	},
> +	.probe = m5441x_rtc_probe,
> +};
> +module_platform_driver(m5441x_rtc_driver);
> +
> +MODULE_DESCRIPTION("Freescale MCF5441x on-chip RTC driver");
> +MODULE_AUTHOR("Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:rtc-m5441x");
> 
> -- 
> 2.39.5
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


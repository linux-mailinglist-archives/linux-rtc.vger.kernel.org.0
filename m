Return-Path: <linux-rtc+bounces-26-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90A7B49B4
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Oct 2023 23:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 48FBC1C2040C
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Oct 2023 21:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D744171D4;
	Sun,  1 Oct 2023 21:21:07 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3873E2F39
	for <linux-rtc@vger.kernel.org>; Sun,  1 Oct 2023 21:21:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BE69B;
	Sun,  1 Oct 2023 14:21:00 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E162F240002;
	Sun,  1 Oct 2023 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696195258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hwznFwcLGryjA62uDf/A8rrsHVh9Jec8flcbVAK26OQ=;
	b=AEpfCPllhngkkX3X4yFiOsjUmetJ017fvXJRYRViGeKNTcN6N8bLdmo/vcX9gD1nQ0HWOg
	7pQynSgHTCgBKnav76tGajYX7XF3jJ4r+/YGBDO25Hz3S8pEHKpC9PELpL6Rmoxyf7/fnK
	WUlcmnXCRPsdBV+jnCDZ9Eb54aLovugCORI3XAPHy9sNMcFyipgO6f07l7T+QffQ5g8B5+
	imMyJtokanMwYbUALfjrNBuJP3VUJWvOLIDOhSOfevtK7oTBRbqHFWpthvODSLbbJBY/sE
	Ys1uatyCmre29mwZtMzd8wnSM0MPDjioct0ZTZB5JU5ovHiWfoW7f9nrAxRb7g==
Date: Sun, 1 Oct 2023 23:20:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esteban Blanc <eblanc@baylibre.com>
Cc: linus.walleij@linaro.org, a.zummo@towertech.it,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, jpanis@baylibre.com,
	jneanne@baylibre.com, aseketeli@baylibre.com, u-kumar1@ti.com
Subject: Re: [PATCH v7 1/2] rtc: tps6594: Add driver for TPS6594 RTC
Message-ID: <2023100121204914ad7c28@mail.local>
References: <20230628133021.500477-1-eblanc@baylibre.com>
 <20230628133021.500477-2-eblanc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628133021.500477-2-eblanc@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

What is the status of this series?

On 28/06/2023 15:30:20+0200, Esteban Blanc wrote:
> +static int tps6594_rtc_read_offset(struct device *dev, long *offset)
> +{
> +	int calibration;
> +	s64 tmp;
> +	int ret;
> +
> +	ret = tps6594_rtc_get_calibration(dev, &calibration);
> +	if (ret < 0)
> +		return ret;
> +
> +	// Convert from RTC calibration register format to ppb format.
> +	tmp = calibration * PPB_MULT;
> +
> +	if (tmp < 0)
> +		tmp -= TICKS_PER_HOUR / 2LL;
> +	else
> +		tmp += TICKS_PER_HOUR / 2LL;
> +	tmp = div_s64(tmp, TICKS_PER_HOUR);
> +
> +	/*
> +	 * SAFETY:
> +	 * Compution is the reverse operation of the one done in

Small typo -^

> +	 * `tps6594_rtc_set_offset`. The safety remarks applie here too.
> +	 */
> +
> +	/*
> +	 * Offset value operates in negative way, so swap sign.
> +	 * See 8.3.10.5, (32768 - COMP_REG).
> +	 */
> +	*offset = (long)-tmp;
> +
> +	return 0;
> +}
> +
> +static int tps6594_rtc_set_offset(struct device *dev, long offset)
> +{
> +	int calibration;
> +	s64 tmp;
> +
> +	// Make sure offset value is within supported range.
> +	if (offset < MIN_OFFSET || offset > MAX_OFFSET)
> +		return -ERANGE;
> +
> +	// Convert from ppb format to RTC calibration register format.
> +
> +	tmp = offset * TICKS_PER_HOUR;
> +	if (tmp < 0)
> +		tmp -= PPB_MULT / 2LL;
> +	else
> +		tmp += PPB_MULT / 2LL;
> +	tmp = div_s64(tmp, PPB_MULT);
> +
> +	/*
> +	 * SAFETY:
> +	 * - tmp = offset * TICK_PER_HOUR :
> +	 *	`offset` can't be more than 277774, so `tmp` can't exceed 277774000000000
> +	 *	which is lower than the maximum value in an `s64` (2^63-1). No overflow here.
> +	 *
> +	 * - tmp += TICK_PER_HOUR / 2LL :
> +	 *	tmp will have a maximum value of 277774117964800 which is still inferior to 2^63-1.
> +	 */
> +
> +	// Offset value operates in negative way, so swap sign.
> +	calibration = (int)-tmp;
> +
> +	return tps6594_rtc_set_calibration(dev, calibration);
> +}
> +
> +static irqreturn_t tps6594_rtc_interrupt(int irq, void *rtc)
> +{
> +	struct device *dev = rtc;
> +	unsigned long events = 0;
> +	struct tps6594 *tps = dev_get_drvdata(dev->parent);
> +	struct rtc_device *rtc_dev = dev_get_drvdata(dev);
> +	int ret;
> +	u32 rtc_reg;
> +
> +	ret = regmap_read(tps->regmap, TPS6594_REG_RTC_STATUS, &rtc_reg);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	if (rtc_reg & TPS6594_BIT_ALARM)
> +		events = RTC_IRQF | RTC_AF;
> +
> +	// Notify RTC core on event.

Nit: I don't feel like the events varialbe and the comment are
necessary.

> +	rtc_update_irq(rtc_dev, 1, events);
> +
> +	return IRQ_HANDLED;
> +}
> +

If you resend, you can add:

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


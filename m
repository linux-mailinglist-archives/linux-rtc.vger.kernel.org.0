Return-Path: <linux-rtc+bounces-1313-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C9908AA5
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 13:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D56F1C22C4A
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 11:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B50E195969;
	Fri, 14 Jun 2024 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZS0ss3El"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2734194A72
	for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 11:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718363206; cv=none; b=b1oHI9nArQfwJ/+x46k+DSNUiHpzAsTOW2FmFbNf8sGVdSvN6SteakbDVBVqi+H4evmtIQiMEIR3NFhBP4y6LDrJf4QFVhaJ+lCodMoHL9pGF7JABZ1A7BgvmouFwqdeezMjCHYnUAIAY0gxF4NOmDxn44miVDwaSSSgFhTosVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718363206; c=relaxed/simple;
	bh=ITk4Pmw1wElvoJaLQpDB7x++r9MKwh7KfmJ6kjQS1SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SO9/JthIfS363GREUzyMXhUwTuZMIP3V1D0gH6glE3Ql9KK8ntqbDpjOAdhwCgyHH3XDX0cFfcQayqZTKKdQ9UmyaWWVuCbgPTHFno93HSzO8w5QECleIdZgLmim+zHen+ts6Hgg7Em7Tmban2WeD+GK5+8m394gKGi2YypouH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZS0ss3El; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ca342d6f3so1538741e87.2
        for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 04:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718363201; x=1718968001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5D80in0TCKF7CT1Ecrry2kBSeVogFVfKvkdHakj/G8=;
        b=ZS0ss3ElqQML10fu8j8eKaPhMQw1iuTwzguoHoek/Oe8FTuHaFnT4KmHUxH8aAAFUx
         3vRTiWK6dgDF+yhhras1S1z+/EitG+4GxE9hKx9vmfG2YF8RCDzYHOYqW3Msj19nkJ2+
         bF7XlyQnH0pxNhP0jibLTkt8fAqpzaNBXTGA/e4hOgDd4UrnIavYp0PlLE+R9cFWWQyG
         0NRB6aglvZ8hXKBpKxYOn8Uc3tRmHvqpl625gnU3PpaEB60D5ICm65sACbYcRTxKx3Rq
         8LHzDO9qPDAZNILgX0d4Wd3TfI9a8zqLwUqs6fD5An30HF55Lr+oxSHol+vhmq94R4HH
         Q3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718363201; x=1718968001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5D80in0TCKF7CT1Ecrry2kBSeVogFVfKvkdHakj/G8=;
        b=PS8OC3dJ16xAY6hNiCAg1b2qJ7Jklb47PLGwjNm6FosaHmhxjp2QYKP21GCpmYjZI6
         HWX9IDHfTPGkdHXAvMENboiOI04R8WRm0g00M3kpnLxtPh3FIIJ2TlxYa987AQv7RC2L
         cy88dKFgBRH5MGhKyB5V4iYmJ8xP2VnWvnGTfjxFkShHzkCN3DOAi/lILwEQfKykOkLE
         Mmjyu9gC0WcMNKKAR68roZBu4ZQhlJLvxpNjHwmsMlP6BTMsGyY8dPI3LlyB0Xjp0gtF
         zgUF36xNZmhIlEBkbzGMrWlDiNQgE/SiX5JFe7vPzY0hgBk22xFjs3OJTMfw5l0YzHf2
         qMGA==
X-Forwarded-Encrypted: i=1; AJvYcCUeo6JPfXkaecSTpZkvAaaU95y598zsUzTg6QTj1oNe/ZgAThXcN+cJPNLF6sMHoOlKROjqKnN9hT8PKCeAfGVLirfkLb3+dKig
X-Gm-Message-State: AOJu0YzFxTfp+nRpBmGsyUkYqWdS63w3uukNaUa7SDLtC7QO1HrH4e8x
	flDH+qgAPDnAFuYYImu4QeuGkc+rG1IqW735D4nj+5gG/SMPKW0Fmacqx1lAWgk=
X-Google-Smtp-Source: AGHT+IH9JHjPbSmLTT+F7xHZJ81IvkKNjZ+2yhkxhvBPp4AqZfmx5Y0pBQzf79FJO58OFQjWNVtaWg==
X-Received: by 2002:a05:6512:3ca4:b0:52c:8339:d09b with SMTP id 2adb3069b0e04-52ca6e55096mr1765316e87.1.1718363200927;
        Fri, 14 Jun 2024 04:06:40 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104a1bsm4095242f8f.102.2024.06.14.04.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 04:06:40 -0700 (PDT)
Message-ID: <4a477079-b4a6-4861-ae24-b3b87adb8ecd@tuxon.dev>
Date: Fri, 14 Jun 2024 14:06:38 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] rtc: renesas-rtca3: Add driver for RTCA-3 available
 on Renesas RZ/G3S SoC
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-7-claudiu.beznea.uj@bp.renesas.com>
 <2024061409215756e6a10c@mail.local>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2024061409215756e6a10c@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexandre,

On 14.06.2024 12:21, Alexandre Belloni wrote:
> Hello Claudiu,
> 
> On 14/06/2024 10:19:26+0300, Claudiu wrote:
>> +static int rtca3_initial_setup(struct rtca3_priv *priv)
>> +{
>> +	unsigned long osc32k_rate;
>> +	u8 pes, tmp, mask;
>> +	u32 sleep_us;
>> +	int ret;
>> +
>> +	osc32k_rate = clk_get_rate(priv->clk);
>> +	if (!osc32k_rate)
>> +		return -EINVAL;
>> +
>> +	sleep_us = DIV_ROUND_UP_ULL(1000000ULL, osc32k_rate) * 6;
>> +
>> +	priv->ppb.ten_sec = DIV_ROUND_CLOSEST_ULL(1000000000ULL, (osc32k_rate * 10));
>> +	priv->ppb.sixty_sec = DIV_ROUND_CLOSEST_ULL(1000000000ULL, (osc32k_rate * 60));
>> +
>> +	/*
>> +	 * According to HW manual (section 22.4.2. Clock and count mode setting procedure)
>> +	 * we need to wait at least 6 cycles of the 32KHz clock after clock was enabled.
>> +	 */
>> +	usleep_range(sleep_us, sleep_us + 10);
>> +
>> +	/* Disable alarm and carry interrupts. */
>> +	mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE;
>> +	rtca3_byte_update_bits(priv, RTCA3_RCR1, mask, 0);
>> +	ret = readb_poll_timeout(priv->base + RTCA3_RCR1, tmp, !(tmp & mask),
>> +				 10, RTCA3_DEFAULT_TIMEOUT_US);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Stop the RTC and set to 12 hours mode and calendar count mode.
>> +	 * RCR2.START initial value is undefined so we need to stop here
>> +	 * all the time.
>> +	 */
> 
> Certainly not, if you stop the RTC on probe, you lose the time
> information, this must only be done when the RTC has never been
> initialised. The whole goal of the RTC is the keep time across reboots,
> its lifecycle is longer than the system.

This was also my first thought when I read the HW manual.

It has been done like this to follow the HW manual. According to HW manual
[1], chapter 22.3.19 RTC Control Register 2 (RCR2), initial value of START
bit is undefined.

If it's 1 while probing but it has never been initialized, we can falsely
detect that RTC is started and skip the rest of the initialization steps.
W/o initialization configuration, the RTC will not be able to work.

Even with this implementation we don't loose the time b/w reboots. Here is
the output on my board [2]. The steps I did were the following:
1/ remove the power to the board (I don't have a battery for RTC installed
   at the moment)
2/ boot the board and issue hwclock -w
3/ reboot
4/ check the systime and rtc time
5/ poweroff
6/ poweron
7/ boot and check systime and RTC time

As you can see the time is not lost but continue to increment. I presume
the hardware takes into account that time needs to increment when initial
configuration is executed.

[1]
https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11-ghz-cpu-and-dual-core-cortex-m33-250
[2] https://p.fr33tux.org/585cd6

> 
> Also, why do you insist on 12H-mode? The proper thing to do is to support
> 12H-mode on read but always use 24H-mode when setting the time.

OK, I wasn't aware of this. I think I followed this approach as it looked
to me the number of operation to update the hardware registers was lower
for 12h mode.

I'll adjust as proposed.

> 
>> +	mask = RTCA3_RCR2_START | RTCA3_RCR2_HR24 | RTCA3_RCR2_CNTMD;
>> +	writeb(0, priv->base + RTCA3_RCR2);
>> +	ret = readb_poll_timeout(priv->base + RTCA3_RCR2, tmp, !(tmp & mask),
>> +				 10, RTCA3_DEFAULT_TIMEOUT_US);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Execute reset and wait for reset and calendar count mode to be applied. */
>> +	mask = RTCA3_RCR2_RESET | RTCA3_RCR2_CNTMD;
>> +	writeb(RTCA3_RCR2_RESET, priv->base + RTCA3_RCR2);
>> +	ret = readb_poll_timeout(priv->base + RTCA3_RCR2, tmp, !(tmp & mask),
>> +				 10, RTCA3_RESET_TIMEOUT_US);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * According to HW manual (section 22.6.3. Notes on writing to and reading
>> +	 * from registers) after reset we need to wait 6 clock cycles before
>> +	 * writing to RTC registers.
>> +	 */
>> +	usleep_range(sleep_us, sleep_us + 10);
>> +
>> +	/* Set no adjustment. */
>> +	writeb(0, priv->base + RTCA3_RADJ);
>> +	ret = readb_poll_timeout(priv->base + RTCA3_RADJ, tmp, !tmp, 10,
>> +				 RTCA3_DEFAULT_TIMEOUT_US);
>> +
>> +	/* Start the RTC and enable automatic time error adjustment. */
>> +	mask = RTCA3_RCR2_START | RTCA3_RCR2_AADJE;
>> +	writeb(RTCA3_RCR2_START | RTCA3_RCR2_AADJE, priv->base + RTCA3_RCR2);
>> +	ret = readb_poll_timeout(priv->base + RTCA3_RCR2, tmp, ((tmp & mask) == mask),
>> +				 10, RTCA3_START_TIMEOUT_US);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * According to HW manual (section 22.6.4. Notes on writing to and reading
>> +	 * from registers) we need to wait 1/128 seconds while the clock is operating
>> +	 * (RCR2.START bit = 1) to be able to read the counters after a return from
>> +	 * reset.
>> +	 */
>> +	usleep_range(8000, 9000);
>> +
>> +	/* Set period interrupt to 1/64 seconds. It is necessary for alarm setup. */
>> +	pes = FIELD_PREP(RTCA3_RCR1_PES, RTCA3_RCR1_PES_1_64_SEC);
>> +	rtca3_byte_update_bits(priv, RTCA3_RCR1, RTCA3_RCR1_PES, pes);
>> +	return readb_poll_timeout(priv->base + RTCA3_RCR1, tmp, ((tmp & RTCA3_RCR1_PES) == pes),
>> +				  10, RTCA3_DEFAULT_TIMEOUT_US);
>> +}
>> +
>> +static int rtca3_request_irqs(struct platform_device *pdev, struct rtca3_priv *priv)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret, irq;
>> +
>> +	irq = platform_get_irq_byname(pdev, "alarm");
>> +	if (irq < 0)
>> +		return dev_err_probe(dev, irq, "Failed to get alarm IRQ!\n");
>> +
>> +	ret = devm_request_irq(dev, irq, rtca3_alarm_handler, 0, "rtca3-alarm", priv);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to request alarm IRQ!\n");
>> +	priv->wakeup_irq = irq;
>> +
>> +	irq = platform_get_irq_byname(pdev, "period");
>> +	if (irq < 0)
>> +		return dev_err_probe(dev, irq, "Failed to get period IRQ!\n");
>> +
>> +	ret = devm_request_irq(dev, irq, rtca3_periodic_handler, 0, "rtca3-period", priv);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to request period IRQ!\n");
>> +
>> +	/*
>> +	 * Driver doesn't implement carry handler. Just get the IRQ here
>> +	 * for backward compatibility, in case carry support will be added later.
>> +	 */
>> +	irq = platform_get_irq_byname(pdev, "carry");
>> +	if (irq < 0)
>> +		return dev_err_probe(dev, irq, "Failed to get carry IRQ!\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int rtca3_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtca3_priv *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(priv->base))
>> +		return PTR_ERR(priv->base);
>> +
>> +	priv->clk = devm_clk_get_enabled(dev, "counter");
>> +	if (IS_ERR(priv->clk))
>> +		return PTR_ERR(priv->clk);
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +
>> +	spin_lock_init(&priv->lock);
>> +	atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
>> +	init_completion(&priv->set_alarm_completion);
>> +
>> +	ret = rtca3_initial_setup(priv);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to setup the RTC!\n");
>> +
>> +	ret = rtca3_request_irqs(pdev, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	device_init_wakeup(&pdev->dev, 1);
>> +
>> +	priv->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
>> +	if (IS_ERR(priv->rtc_dev))
>> +		return PTR_ERR(priv->rtc_dev);
>> +
>> +	priv->rtc_dev->ops = &rtca3_ops;
>> +	priv->rtc_dev->max_user_freq = 256;
>> +	priv->rtc_dev->range_min = mktime64(1999, 1, 1, 0, 0, 0);
>> +	priv->rtc_dev->range_max = mktime64(2098, 12, 31, 23, 59, 59);
> 
> This very much looks like the range should be 2000 to 2099, why do you
> want to shift it?

2000-2099 was my first option for this but then I saw one of your old
commits on this topic and, since I'm not very familiar with RTC,
I took it as example. I'll adjust as you proposed.

commit beee05dfbead
Author: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date:   Wed Mar 20 12:30:10 2019 +0100

    rtc: sh: set range

    The SH RTC is a BCD RTC with some version having 4 digits for the year.

    The range for the RTCs with only 2 digits for the year was unfortunately
    shifted to handle 1999 to 2098.

    Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


Thank you for your review,
Claudiu Beznea

> 
> 


Return-Path: <linux-rtc+bounces-3412-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEDCA50E54
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 23:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B674D7A2FD4
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 22:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8C42661A1;
	Wed,  5 Mar 2025 22:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EMeCvD2w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFDB2E3373;
	Wed,  5 Mar 2025 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741212381; cv=none; b=Ow60Nwjxes+sexDovUwoYkv82JXGOrjErV0eLK9gpNObpgvuHmqDFbzmmNC9qsZ9h4JiE4XKBhsvzQWmwf0MkmXuCJthGoLn44GYA1oRoop24TWbvLY0eYZtUwlhpRorvhdPLj7Ms1pd5GjhpzFnZoTfJkt3ZHZQDRMIzXxu4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741212381; c=relaxed/simple;
	bh=q9EXI6Pgompm/W6eQinVy1GNbMHg7R4F7kMhQcftXvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugab1Drnz8fZAI+FAdbMhywdJ5XWqNv5tDS3Fl7+MWhLIs0yhnGpeYU5XbxTWGHAMWFhrKfI6HuNTN3wVcvOfRDjvFZpT5YFL7MkGYJ4auRSUfporScHZ0m0+Yrr1BP9DGseRRCVVpV2Xej8LWYwSShjxJrBnsh/MPa/jwouwoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EMeCvD2w; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D832442A5;
	Wed,  5 Mar 2025 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741212376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yEkg7dUbUd4gw9KUHkYnnXttXqIaC85A6vQzxpX1J28=;
	b=EMeCvD2wVP+08ZFXKqOK8Mw5Oh+Hf7dMmzn+r+h0KYo04oEPe6JxxqDUGLg/MxkKbw2nYg
	mHBmAJCBcdXCbAnxHWju0tzgCCSRdc4feYYsIMZ2VQsjDLOE2wgzzsxZgR22pZVLcNzvTW
	JhmbKRfvFciXmNX/NAbSjXoOcmE6fbMtrwViW9dybP1vqWcrWPKYdPFefjg14fzJ2wxdqv
	3vJKdpyaYLrOqKUN26hC+xVK4Gcmg+UYMHGoFKLC+bmHm407+emUP82t63d6+CRVdsEzmy
	aBKyo6lNa7POnHmXc7OOjyazZ7Vu9+XhgVkOhL4UnDIOva/HW5W+Q9csZs6tyg==
Date: Wed, 5 Mar 2025 23:06:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <2025030522061502555577@mail.local>
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 05/03/2025 11:08:16+0100, Wolfram Sang wrote:
> The hardware alarm only supports one-minute accuracy which is coarse and
> disables UIE usage. Use the 1-second interrupt to achieve per-second
> accuracy. It is activated once we hit the per-minute alarm. The new
> feature is optional. When there is no 1-second interrupt, old behaviour
> with per-minute accuracy is used as before. With this feature, all tests
> of 'rtctest' are successfully passed.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Tested with the Renesas RZ/N1D board. Besides 'rtctest', I did some
> manual testing with 'rtc' on top trying to stresstest corner cases.
> 
> Looking forward to comments. AFAICS, this is the first driver trying to
> overcome the per-minute limitation using 1-second interrupts.
> 

What I'm really wondering about is the use case. What is expected here?
I guess that would be so you could go back to sleep between each 1s
interrupt? Does this actually happen and does it actually save any power
versus waking up early and waiting for the timer to actually elapse?

> Change since v1:
> * consider 1s interrupt when setting the alarm->enabled flag
> 
> drivers/rtc/rtc-rzn1.c | 108 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 91 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index cb220807d925..eeb9612a666f 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -19,6 +19,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/rtc.h>
> +#include <linux/spinlock.h>
>  
>  #define RZN1_RTC_CTL0 0x00
>  #define   RZN1_RTC_CTL0_SLSB_SUBU 0
> @@ -27,6 +28,7 @@
>  #define   RZN1_RTC_CTL0_CE BIT(7)
>  
>  #define RZN1_RTC_CTL1 0x04
> +#define   RZN1_RTC_CTL1_1SE BIT(3)
>  #define   RZN1_RTC_CTL1_ALME BIT(4)
>  
>  #define RZN1_RTC_CTL2 0x08
> @@ -58,6 +60,13 @@
>  struct rzn1_rtc {
>  	struct rtc_device *rtcdev;
>  	void __iomem *base;
> +	/*
> +	 * Protects access to RZN1_RTC_CTL1 reg. rtc_lock with threaded_irqs
> +	 * would introduce race conditions when switching interrupts because
> +	 * of potential sleeps
> +	 */
> +	spinlock_t ctl1_access_lock;
> +	struct rtc_time tm_alarm;
>  };
>  
>  static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
> @@ -135,8 +144,38 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  static irqreturn_t rzn1_rtc_alarm_irq(int irq, void *dev_id)
>  {
>  	struct rzn1_rtc *rtc = dev_id;
> +	u32 ctl1, set_irq_bits = 0;
> +
> +	if (rtc->tm_alarm.tm_sec == 0)
> +		rtc_update_irq(rtc->rtcdev, 1, RTC_AF | RTC_IRQF);
> +	else
> +		/* Switch to 1s interrupts */
> +		set_irq_bits = RZN1_RTC_CTL1_1SE;
>  
> -	rtc_update_irq(rtc->rtcdev, 1, RTC_AF | RTC_IRQF);
> +	guard(spinlock)(&rtc->ctl1_access_lock);
> +
> +	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
> +	ctl1 &= ~RZN1_RTC_CTL1_ALME;
> +	ctl1 |= set_irq_bits;
> +	writel(ctl1, rtc->base + RZN1_RTC_CTL1);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rzn1_rtc_1s_irq(int irq, void *dev_id)
> +{
> +	struct rzn1_rtc *rtc = dev_id;
> +	u32 ctl1;
> +
> +	if (readl(rtc->base + RZN1_RTC_SECC) == bin2bcd(rtc->tm_alarm.tm_sec)) {
> +		guard(spinlock)(&rtc->ctl1_access_lock);
> +
> +		ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
> +		ctl1 &= ~RZN1_RTC_CTL1_1SE;
> +		writel(ctl1, rtc->base + RZN1_RTC_CTL1);
> +
> +		rtc_update_irq(rtc->rtcdev, 1, RTC_AF | RTC_IRQF);
> +	}
>  
>  	return IRQ_HANDLED;
>  }
> @@ -144,14 +183,38 @@ static irqreturn_t rzn1_rtc_alarm_irq(int irq, void *dev_id)
>  static int rzn1_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
>  {
>  	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> -	u32 ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
> +	struct rtc_time *tm = &rtc->tm_alarm, tm_now;
> +	u32 ctl1;
> +	int ret;
>  
> -	if (enable)
> -		ctl1 |= RZN1_RTC_CTL1_ALME;
> -	else
> -		ctl1 &= ~RZN1_RTC_CTL1_ALME;
> +	guard(spinlock_irqsave)(&rtc->ctl1_access_lock);
>  
> -	writel(ctl1, rtc->base + RZN1_RTC_CTL1);
> +	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
> +
> +	if (enable) {
> +		/*
> +		 * Use alarm interrupt if alarm time is at least a minute away
> +		 * or less than a minute but in the next minute. Otherwise use
> +		 * 1 second interrupt to wait for the proper second
> +		 */
> +		do {
> +			ctl1 &= ~(RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE);
> +
> +			ret = rzn1_rtc_read_time(dev, &tm_now);
> +			if (ret)
> +				return ret;
> +
> +			if (rtc_tm_sub(tm, &tm_now) > 59 || tm->tm_min != tm_now.tm_min)
> +				ctl1 |= RZN1_RTC_CTL1_ALME;
> +			else
> +				ctl1 |= RZN1_RTC_CTL1_1SE;
> +
> +			writel(ctl1, rtc->base + RZN1_RTC_CTL1);
> +		} while (readl(rtc->base + RZN1_RTC_SECC) != bin2bcd(tm_now.tm_sec));
> +	} else {
> +		ctl1 &= ~(RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE);
> +		writel(ctl1, rtc->base + RZN1_RTC_CTL1);
> +	}
>  
>  	return 0;
>  }
> @@ -185,7 +248,7 @@ static int rzn1_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	}
>  
>  	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
> -	alrm->enabled = !!(ctl1 & RZN1_RTC_CTL1_ALME);
> +	alrm->enabled = !!(ctl1 & (RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE));
>  
>  	return 0;
>  }
> @@ -216,6 +279,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
>  	writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
>  
> +	rtc->tm_alarm = alrm->time;
> +
>  	rzn1_rtc_alarm_irq_enable(dev, alrm->enabled);
>  
>  	return 0;
> @@ -304,7 +369,7 @@ static const struct rtc_class_ops rzn1_rtc_ops = {
>  static int rzn1_rtc_probe(struct platform_device *pdev)
>  {
>  	struct rzn1_rtc *rtc;
> -	int alarm_irq;
> +	int irq;
>  	int ret;
>  
>  	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> @@ -317,9 +382,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>  	if (IS_ERR(rtc->base))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
>  
> -	alarm_irq = platform_get_irq(pdev, 0);
> -	if (alarm_irq < 0)
> -		return alarm_irq;
> +	irq = platform_get_irq_byname(pdev, "alarm");
> +	if (irq < 0)
> +		return irq;
>  
>  	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc->rtcdev))
> @@ -329,8 +394,6 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>  	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
>  	rtc->rtcdev->alarm_offset_max = 7 * 86400;
>  	rtc->rtcdev->ops = &rzn1_rtc_ops;
> -	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
> -	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
>  
>  	ret = devm_pm_runtime_enable(&pdev->dev);
>  	if (ret < 0)
> @@ -349,13 +412,24 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>  	/* Disable all interrupts */
>  	writel(0, rtc->base + RZN1_RTC_CTL1);
>  
> -	ret = devm_request_irq(&pdev->dev, alarm_irq, rzn1_rtc_alarm_irq, 0,
> -			       dev_name(&pdev->dev), rtc);
> +	spin_lock_init(&rtc->ctl1_access_lock);
> +
> +	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
>  	if (ret) {
> -		dev_err(&pdev->dev, "RTC timer interrupt not available\n");
> +		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
>  		goto dis_runtime_pm;
>  	}
>  
> +	irq = platform_get_irq_byname_optional(pdev, "pps");
> +	if (irq >= 0)
> +		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
> +
> +	if (irq < 0 || ret) {
> +		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
> +		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
> +		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");

Is this message really necessary? I remember someone giving a talk about
how we should avoid adding countless strings to the kernel ;)

I'm on holidays and didn't reply to your previous email. The way to
support UIE while keeping the alarm at 1 minute resolution would be to
look at which timer is enabled.

The rv8803 driver does:

	if (alrm->enabled) {
		if (rv8803->rtc->uie_rtctimer.enabled)
			rv8803->ctrl |= RV8803_CTRL_UIE;
		if (rv8803->rtc->aie_timer.enabled)
			rv8803->ctrl |= RV8803_CTRL_AIE;

https://elixir.bootlin.com/linux/v6.13.5/source/drivers/rtc/rtc-rv8803.c#L439

Like I said, this is a bit convoluted but there are only a few cases so
I didn't bother hiding this behind a proper API.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


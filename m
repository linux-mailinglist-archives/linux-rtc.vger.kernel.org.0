Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0804F610B
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 16:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbiDFN6p (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Apr 2022 09:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234303AbiDFN6P (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Apr 2022 09:58:15 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8D813CA2A;
        Wed,  6 Apr 2022 02:10:21 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id BDD191BF20C;
        Wed,  6 Apr 2022 09:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649236219;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VQ63HwvnHGrZcb0MV+Lbc8R18sMVO+IEaXijo5IJKi0=;
        b=KP4qyotP0+4BE/6EF2wTNEs6vuJZadjtA0gF1RPOUne3opDxjRA45bb3NFqdEOq7CkvZ2o
        5h3G+EI8o7oufH/8ygDWxWBn7WWids8pd+pdjOjKg0W0vLuCYL7W/m4SCYcu58wvUKxQgG
        Xg7MEsiuxPi1Z5mkOr/vPSjlbolN5BqWZWfrJHXu6XUwT+3tte1Ji46LGhRlYJ1bi3H572
        7hV4KNGCio9LegIDlXvTvC50wRaRBHY8TyTv1mHcJFt69CtX/yeDJEB59dhhA/R+p4UFkH
        RGT0eE/2gEscIz/EVO8ERYVWYy0CR6BWI7rTSbB6szhYETEO4ZPD2qLQGCfcpA==
Date:   Wed, 6 Apr 2022 11:10:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 4/7] rtc: rzn1: Add alarm support
Message-ID: <Yk1Y+eaDkk1FFiLZ@mail.local>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
 <20220405184716.1578385-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405184716.1578385-5-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/04/2022 20:47:13+0200, Miquel Raynal wrote:
> The RZN1 RTC can trigger an interrupt when reaching a particular date up
> to 7 days ahead. Bring support for this alarm.
> 
> One drawback though, the granularity is about a minute.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/rtc/rtc-rzn1.c | 108 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 15c533333930..85c5a68944a0 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -154,14 +154,110 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	return ret;
>  }
>  
> +static irqreturn_t rzn1_rtc_alarm_irq(int irq, void *dev_id)
> +{
> +	struct rzn1_rtc *rtc = dev_id;
> +
> +	rtc_update_irq(rtc->rtcdev, 1, RTC_AF | RTC_IRQF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int rzn1_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
> +{
> +	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> +	u32 ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
> +
> +	if (enable)
> +		ctl1 |= RZN1_RTC_CTL1_ALME;
> +	else
> +		ctl1 &= ~RZN1_RTC_CTL1_ALME;
> +
> +	writel(ctl1, rtc->base + RZN1_RTC_CTL1);
> +
> +	return 0;
> +}
> +
> +static int rzn1_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> +	struct rtc_time *tm = &alrm->time;
> +	unsigned int min, hour, wday, delta_days;
> +	u32 ctl1;
> +	int ret;
> +
> +	ret = rzn1_rtc_read_time(dev, tm);
> +	if (ret)
> +		return ret;
> +
> +	min = readl(rtc->base + RZN1_RTC_ALM);
> +	hour = readl(rtc->base + RZN1_RTC_ALH);
> +	wday = readl(rtc->base + RZN1_RTC_ALW);
> +
> +	tm->tm_sec = 0;
> +	tm->tm_min = bcd2bin(min);
> +	tm->tm_hour = bcd2bin(hour);
> +	delta_days = ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
> +	tm->tm_wday = fls(wday) - 1;
> +	tm->tm_mday += delta_days;
> +	if (delta_days > rtc_month_days(tm->tm_mon, tm->tm_year)) {
> +		tm->tm_mday %= rtc_month_days(tm->tm_mon, tm->tm_year);
> +		tm->tm_mon++;
> +	}
> +	if (tm->tm_mon > 12) {
> +		tm->tm_mon %= 12;
> +		tm->tm_year++;
> +	}

I guess you could avoid having to handle rollover by making the
calculations on a time64_t and then convert back to a tm. I don't think
this would be much worse in terms of processing.

> +
> +	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
> +	alrm->enabled = !!(ctl1 & RZN1_RTC_CTL1_ALME);
> +
> +	return 0;
> +}
> +
> +static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> +	struct rtc_time *tm = &alrm->time, tm_now;
> +	unsigned long alarm, farest;
> +	unsigned int days_ahead, wday;
> +	int ret;
> +
> +	ret = rzn1_rtc_read_time(dev, &tm_now);
> +	if (ret)
> +		return ret;
> +
> +	/* We cannot set alarms more than one week ahead */
> +	farest = rtc_tm_to_time64(&tm_now) + (7 * 86400);
> +	alarm = rtc_tm_to_time64(tm);
> +	if (time_after(alarm, farest))
> +		return -EOPNOTSUPP;
> +

I would return -ERANGE

> +	/* Convert alarm day into week day */
> +	days_ahead = tm->tm_mday - tm_now.tm_mday;
> +	wday = (tm_now.tm_wday + days_ahead) % 7;
> +
> +	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
> +	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
> +	writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
> +
> +	rzn1_rtc_alarm_irq_enable(dev, alrm->enabled);
> +
> +	return 0;
> +}
> +
>  static const struct rtc_class_ops rzn1_rtc_ops = {
>  	.read_time = rzn1_rtc_read_time,
>  	.set_time = rzn1_rtc_set_time,
> +	.read_alarm = rzn1_rtc_read_alarm,
> +	.set_alarm = rzn1_rtc_set_alarm,
> +	.alarm_irq_enable = rzn1_rtc_alarm_irq_enable,
>  };
>  
>  static int rzn1_rtc_probe(struct platform_device *pdev)
>  {
>  	struct rzn1_rtc *rtc;
> +	int alarm_irq;
>  	int ret;
>  
>  	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> @@ -178,12 +274,17 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>  	if (IS_ERR(rtc->base))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
>  
> +	alarm_irq = platform_get_irq(pdev, 0);
> +	if (alarm_irq < 0)
> +		return dev_err_probe(&pdev->dev, alarm_irq, "Missing timer IRQ\n");
> +
>  	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc->rtcdev))
>  		return PTR_ERR(rtc);
>  
>  	rtc->rtcdev->range_max = 3178591199UL; /* 100 years */
>  	rtc->rtcdev->ops = &rzn1_rtc_ops;
> +	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);

You should probably clear RTC_FEATURE_UPDATE_INTERRUPT too.

>  
>  	ret = r9a06g032_sysctrl_enable_rtc(true);
>  	if (ret)
> @@ -206,6 +307,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>  	/* Enable counter operation */
>  	writel(0, rtc->base + RZN1_RTC_CTL2);
>  
> +	ret = devm_request_irq(&pdev->dev, alarm_irq, rzn1_rtc_alarm_irq, 0,
> +			       dev_name(&pdev->dev), rtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "RTC timer interrupt not available\n");
> +		goto disable_clk;
> +	}
> +
>  	ret = devm_rtc_register_device(rtc->rtcdev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to register RTC\n");
> -- 
> 2.27.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

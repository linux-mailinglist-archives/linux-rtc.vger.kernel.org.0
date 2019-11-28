Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9726010C753
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2019 11:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK1K6D (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Nov 2019 05:58:03 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:45245 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfK1K6D (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Nov 2019 05:58:03 -0500
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id AA691200021;
        Thu, 28 Nov 2019 10:57:53 +0000 (UTC)
Date:   Thu, 28 Nov 2019 11:57:51 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 5/5] rtc: rtc-rc5t619: add ricoh rc5t619 RTC driver
Message-ID: <20191128105751.GM299836@piout.net>
References: <20191031213835.11390-1-andreas@kemnade.info>
 <20191031213835.11390-6-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031213835.11390-6-andreas@kemnade.info>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

checkpatch.pl --strict complains about multiple blank lines and alignment.

On 31/10/2019 22:38:35+0100, Andreas Kemnade wrote:
> +static int rc5t619_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rn5t618 *rn5t618 = dev_get_drvdata(pdev->dev.parent);
> +	struct rc5t619_rtc *rtc;
> +	uint8_t alarm_flag;
> +	unsigned int ctrl2;
> +	int err;
> +
> +	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
> +	if (IS_ERR(rtc)) {
> +		err = PTR_ERR(rtc);
> +		return -ENOMEM;
> +	}
> +
> +	rtc->rn5t618 = rn5t618;
> +
> +	dev_set_drvdata(dev, rtc);
> +	rtc->irq = -1;
> +
> +	if (rn5t618->irq_data)
> +		rtc->irq = regmap_irq_get_virq(rn5t618->irq_data,
> +				RN5T618_IRQ_RTC);
> +
> +	if (rtc->irq  < 0) {
> +		dev_err(dev, "no irq specified, wakeup is disabled\n");

I don't think it is worth having an error message here, especially since
you have a second one later.

> +		rtc->irq = -1;
> +	}
> +
> +	err = regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2, &ctrl2);
> +	if (err < 0)
> +		return err;
> +
> +	/* get interrupt flag */
> +	err = rc5t619_rtc_alarm_is_enabled(dev, &alarm_flag);
> +	if (err)
> +		return err;
> +
> +	/* disable rtc periodic function */
> +	err = rc5t619_rtc_periodic_disable(&pdev->dev);
> +	if (err)
> +		return err;
> +
> +	/* disable interrupt */
> +	err = rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> +	if (err)
> +		return err;

Is it really useful to disable the alarm to reenable them later?

> +
> +	if (ctrl2 & CTRL2_PON) {
> +		alarm_flag = 0;
> +		err = rc5t619_rtc_alarm_flag_clr(&pdev->dev);
> +		if (err)
> +			return err;
> +	}
> +
> +	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
> +

Please remove this blank line.

> +	if (IS_ERR(rtc->rtc)) {
> +		err = PTR_ERR(rtc->rtc);
> +		dev_err(dev, "RTC device register: err %d\n", err);
> +		return err;
> +	}
> +
> +	rtc->rtc->ops = &rc5t619_rtc_ops;
> +	rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_1900;
> +	rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +
> +	/* set interrupt and enable it */
> +	if (rtc->irq != -1) {
> +		device_init_wakeup(&pdev->dev, 1);
> +
> +		err = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> +						rc5t619_rtc_irq,
> +						IRQF_ONESHOT,
> +						"rtc-rc5t619",
> +						&pdev->dev);
> +		if (err < 0) {
> +			dev_err(&pdev->dev, "request IRQ:%d fail\n", rtc->irq);
> +			rtc->irq = -1;
> +
> +			err = rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> +			if (err)
> +				return err;
> +
> +		} else {
> +			/* enable wake */

I think you should move device_init_wakeup() here, unless your parse the
wakeup-source property.

> +			enable_irq_wake(rtc->irq);
> +			/* enable alarm_d */
> +			err = rc5t619_rtc_alarm_enable(&pdev->dev, alarm_flag);
> +			if (err) {
> +				dev_err(&pdev->dev, "failed rtc setup\n");
> +				return -EBUSY;
> +			}
> +		}
> +	} else {
> +		/* system don't want to using alarm interrupt, so close it */
> +		err = rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> +		if (err) {
> +			dev_err(&pdev->dev, "disable rtc alarm error\n");

I don't think this message is necessary.

> +			return err;
> +		}
> +
> +		dev_err(&pdev->dev, "ricoh61x interrupt is disabled\n");

Maybe dev_warn as the driver just continues on.

> +	}
> +
> +	return rtc_register_device(rtc->rtc);
> +}

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

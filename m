Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC7F9BCF7
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 12:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfHXKKK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 06:10:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34645 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbfHXKKK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Aug 2019 06:10:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id s18so10807491wrn.1;
        Sat, 24 Aug 2019 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hT7cSmPZKRUdqD9D/lDoReXsSyJf6TsU+BhKTkGeFEo=;
        b=bMZRE8vYyL3SNczbFposfdV0aBxbml5NLfdfxJgQBb5YS6FkrP5j/G1UkCdcxeatRb
         oR0iR5JuXifHejiI9Wli+6ObydVTeDKnAo2d47NianT68dwIhbHz3w+Tp68l4+YgbrOz
         p5Mmqi396inZaAIKsjoQKc946r2Tjr6p1Rb+w3wPxT44HnBYcKtPmqJQg4Bo7W9NLIic
         b6xqA8VGL47ZkX/9wIxzcgjyouAvR+EPODwWL9upJoBRwtI0WvVevZKjxDIHXAGwkuDT
         J/Ht7oNen+ZolS/ePR4h3k/71FQ9z0k117Cbn1eVtsT5u1Cc1xqeDw39ySdlYyz+PB9O
         rXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hT7cSmPZKRUdqD9D/lDoReXsSyJf6TsU+BhKTkGeFEo=;
        b=Xllqte/8Q90GNQhB9BMoi27anDB/ytx4kidR3X8GeudIc57AJ4QIoDztPnrFIXlbFi
         Zo9K43EFeRym4wqJdZi3yMrwr95LuXflDa30sZ2sULjNL77ri+THkF+XOaLWF73iyPWR
         2bl9kL8dR+fccbhyB6gMnS4HvxupFR8Q24zwyJXqaYNCYhdTeuweLCPJN5nGK1t7r2d5
         WFULe7XwGCcY9/wbA0OBzIHucDNYB2RrANw1TA9CU0gQ+10luda8qcSN08JAryD345N4
         cGaC96bl3yVbIwr5aLapuD7YlmJh0wz58u7dAppHNif+uD8oi3+kuSGf0dyTn1fzh+YP
         beOA==
X-Gm-Message-State: APjAAAUDJjNddCX8fbtAUsFiMfFtuM4dy0JbTKCZZ59UXEHO261KzC73
        RYaA5FS28kMOMXGdNRkb0eo=
X-Google-Smtp-Source: APXvYqzIbYq2G3tydjot4/wtSszBOi+pq0zee1xlmWxpwklAZZ26lfUh8dqr8m1ZHignzi/Q9l9+Lw==
X-Received: by 2002:adf:f844:: with SMTP id d4mr10593832wrq.128.1566641407824;
        Sat, 24 Aug 2019 03:10:07 -0700 (PDT)
Received: from [192.168.0.8] (57.166.117.91.dynamic.reverse-mundo-r.com. [91.117.166.57])
        by smtp.gmail.com with ESMTPSA id 91sm17305681wrp.3.2019.08.24.03.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2019 03:10:06 -0700 (PDT)
Subject: Re: [RESEND PATCH 1/1] rtc: sun6i: Allow using as wakeup source from
 suspend
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        maxime.ripard@bootlin.com, wens@csie.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     linux-sunxi@googlegroups.com
References: <20190821210056.11995-1-alejandro.gonzalez.correo@gmail.com>
From:   =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= 
        <alejandro.gonzalez.correo@gmail.com>
Message-ID: <86432b18-7a62-8412-33ad-b2e6e579a1ec@gmail.com>
Date:   Sat, 24 Aug 2019 12:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821210056.11995-1-alejandro.gonzalez.correo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


Alejandro González wrote:
> This patch allows userspace to set up wakeup alarms on any RTC handled by the
> sun6i driver, and adds the necessary PM operations to allow resuming from
> suspend when the configured wakeup alarm fires a IRQ. Of course, that the
> device actually resumes depends on the suspend state and how a particular
> hardware reacts to it, but that is out of scope for this patch.
> 
> I've tested these changes on a Pine H64 model B, which contains a
> Allwinner H6 SoC, with the help of CONFIG_PM_TEST_SUSPEND kernel option.
> These are the interesting outputs from the kernel and commands which
> show that it works. As every RTC handled by this driver is largely the
> same, I think that it shouldn't introduce any regression on other SoCs,
> but I may be wrong.
> 
> [    1.092705] PM: test RTC wakeup from 'freeze' suspend
> [    1.098230] PM: suspend entry (s2idle)
> [    1.212907] PM: suspend devices took 0.080 seconds
> (The SoC freezes for some seconds)
> [    3.197604] PM: resume devices took 0.104 seconds
> [    3.215937] PM: suspend exit
> 
> [    1.092812] PM: test RTC wakeup from 'mem' suspend
> [    1.098089] PM: suspend entry (deep)
> [    1.102033] PM: suspend exit
> [    1.105205] PM: suspend test failed, error -22
> 
> In any case, the RTC alarm interrupt gets fired as exptected:
> 
> $ echo +5 > /sys/class/rtc/rtc0/wakealarm && sleep 5 && grep rtc /proc/interrupts
>  29:          1          0          0          0     GICv2 133 Level     7000000.rtc
> 
> Signed-off-by: Alejandro González <alejandro.gonzalez.correo@gmail.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index c0e75c373605..b7611e5dea3f 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -598,6 +598,33 @@ static const struct rtc_class_ops sun6i_rtc_ops = {
>  	.alarm_irq_enable	= sun6i_rtc_alarm_irq_enable
>  };
>  
> +#ifdef CONFIG_PM_SLEEP
> +/* Enable IRQ wake on suspend, to wake up from RTC. */
> +static int sun6i_rtc_suspend(struct device *dev)
> +{
> +	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(chip->irq);
> +
> +	return 0;
> +}
> +
> +/* Disable IRQ wake on resume. */
> +static int sun6i_rtc_resume(struct device *dev)
> +{
> +	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(chip->irq);
> +
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(sun6i_rtc_pm_ops,
> +	sun6i_rtc_suspend, sun6i_rtc_resume);
> +
>  static int sun6i_rtc_probe(struct platform_device *pdev)
>  {
>  	struct sun6i_rtc_dev *chip = sun6i_rtc;
> @@ -650,6 +677,8 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
>  
>  	clk_prepare_enable(chip->losc);
>  
> +	device_init_wakeup(&pdev->dev, 1);
> +
>  	chip->rtc = devm_rtc_device_register(&pdev->dev, "rtc-sun6i",
>  					     &sun6i_rtc_ops, THIS_MODULE);
>  	if (IS_ERR(chip->rtc)) {
> @@ -684,6 +713,7 @@ static struct platform_driver sun6i_rtc_driver = {
>  	.driver		= {
>  		.name		= "sun6i-rtc",
>  		.of_match_table = sun6i_rtc_dt_ids,
> +		.pm = &sun6i_rtc_pm_ops,
>  	},
>  };
>  builtin_platform_driver(sun6i_rtc_driver);
> 
I'd be grateful if someone can test this patch on different boards to the Pine H64 model B. I'm afraid that board is the only one I have to test this.

Regards.

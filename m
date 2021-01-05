Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4B62EB092
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Jan 2021 17:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbhAEQvC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Jan 2021 11:51:02 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:41590 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbhAEQvA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Jan 2021 11:51:00 -0500
Received: by mail-wr1-f49.google.com with SMTP id a12so36806572wrv.8;
        Tue, 05 Jan 2021 08:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lLUIZPdhJyI7Ixe1qtwbiCba4gGFdHD+uUjfkPW5clI=;
        b=mlSFb75gcH0Quf3SLa+zpnuruSCUXumOs8m1uHoZ8sj7FIGdCkUZbRmFw8VZvwCwDP
         T7YmrTwN8v/DeFh/5gwOgVHHRRtZ9xa1Z45i+8Di0bUZ6llRsWUurS7a4aKl5ERMPFxg
         PiMKSiJBvdai5BnkHgsiJQM0/y/V3mmZdW0qHS2+zP4280bYG10cYnurHKjvnIzzcheE
         CM3wvPj6dYPBYMZHrhKrPpu13HbWDGmtUG2utQNXye4r2gKZVrN4nd17j0Oui6rhV/Jn
         F9lsGEuBJBH1S/Xp5ZDrdcNCTsKm3qfePy55UF+qeAeps8PEB8p8g8b+pPVKkldLmZdr
         Ez9g==
X-Gm-Message-State: AOAM532/Tg7rmFZdHciqmHuJJtxhqLelym/gFRnMECBNKFFBdeiTS2uW
        KueIZLSmBJLo5zxzFdD8hZ8=
X-Google-Smtp-Source: ABdhPJy/Hyyj8Y7g0dIdMoqDktZiaibgVFmbH+5N6vJXk+TSz0iY9tEJviXtWH0lGLa9O0x5ozq+pg==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr458903wrr.69.1609865417392;
        Tue, 05 Jan 2021 08:50:17 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id h9sm136927wme.11.2021.01.05.08.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 08:50:16 -0800 (PST)
Date:   Tue, 5 Jan 2021 17:50:14 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] rtc: s5m: use devm_i2c_new_dummy_device()
Message-ID: <20210105165014.GA20401@kozik-lap>
References: <20210105134424.30632-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210105134424.30632-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jan 05, 2021 at 02:44:24PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Use the managed variant of i2c_new_dummy_device() to shrink code and
> remove the goto label.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-s5m.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> index eb9dde4095a9..3432c6213b4c 100644
> --- a/drivers/rtc/rtc-s5m.c
> +++ b/drivers/rtc/rtc-s5m.c
> @@ -760,7 +760,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	info->i2c = i2c_new_dummy_device(s5m87xx->i2c->adapter, RTC_I2C_ADDR);
> +	info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
> +					      RTC_I2C_ADDR);
>  	if (IS_ERR(info->i2c)) {
>  		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
>  		return PTR_ERR(info->i2c);
> @@ -768,10 +769,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  
>  	info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
>  	if (IS_ERR(info->regmap)) {
> -		ret = PTR_ERR(info->regmap);
>  		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",
> -				ret);
> -		goto err;
> +			ret);
> +		return PTR_ERR(info->regmap);
>  	}
>  
>  	info->dev = &pdev->dev;
> @@ -781,10 +781,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  	if (s5m87xx->irq_data) {
>  		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
>  		if (info->irq <= 0) {
> -			ret = -EINVAL;
>  			dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
>  				alarm_irq);
> -			goto err;
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -797,10 +796,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  	info->rtc_dev = devm_rtc_device_register(&pdev->dev, "s5m-rtc",
>  						 &s5m_rtc_ops, THIS_MODULE);
>  
> -	if (IS_ERR(info->rtc_dev)) {
> -		ret = PTR_ERR(info->rtc_dev);
> -		goto err;
> -	}
> +	if (IS_ERR(info->rtc_dev))
> +		return PTR_ERR(info->rtc_dev);
>  
>  	if (!info->irq) {
>  		dev_info(&pdev->dev, "Alarm IRQ not available\n");
> @@ -813,15 +810,10 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
>  			info->irq, ret);
> -		goto err;
> +		return ret;
>  	}
>  
>  	return 0;
> -
> -err:
> -	i2c_unregister_device(info->i2c);
> -
> -	return ret;
>  }
>  
>  static int s5m_rtc_remove(struct platform_device *pdev)

Unbind should OOPS now.

Best regards,
Krzysztof

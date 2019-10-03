Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533D9C9FEE
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 15:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbfJCN5Q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 09:57:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36291 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfJCN5P (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 09:57:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id 23so1855243pgk.3;
        Thu, 03 Oct 2019 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G1iqvEK5BOu048iUUeMoMkaNvYavvlJ0E/ZfBCmXtgE=;
        b=U2inspsMxJLzU9cxnzSD2huFC4Fu7mfP183zFLFnmX1zutSLu2uwXWhsSgaKcLA6Yp
         D6IipNZv3+X5ADs/fqGAFk3WeTZflzoDZ66uykwmjrbt2eFxir6kmSYCcbnuV50/72xq
         U/PwOmXHTuF9yBN9wkIFlJ2wm/C6s0R5ur/eOV9+5QR2ey07jwfZ9nycYvvzj9/L/fGD
         7UPAjBkRmPohT+jRj3+hdYO7MnPSYy8+u3Y7ytgJG5ze4hWUP4Zief5mma6v+iRxsXaq
         jRBWc8pVuIjRRiO3SpsSGOy3+1uguDyUvhbQHoiOU7u8D6JWRJgS2IzYtdtzHWEmucmP
         876w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G1iqvEK5BOu048iUUeMoMkaNvYavvlJ0E/ZfBCmXtgE=;
        b=fOFnDk1z/F8a3a3b8xAS4t/+eDCxPt/HsVAN0MEO/5DlxSy30msBGku1vns+kxGIUO
         m/fz10qtICFOVxBb9LZEscv3x7vA82lszmuaczsGCoaooALlgIrUDmImmbtvPXrYeazv
         XiUEuReJChPwKgxLXRY/6lmjomLIAWcWdkRnpqtZW2qzv52G+n+LNmGFIKr4S6f+yuST
         B8O429mCpxdx7d7pWVGU0E8sXUVmNzL2T76KYCZskppU8hFFLIKH8LqkciTpnu0oitro
         oH8hSXbCRKqLSGADk2GrzF4pIm2P8a7SZPTFEnQpLLbX3PMaY7ErtM4wT9IXZ5Evl8y8
         cPgg==
X-Gm-Message-State: APjAAAULSbF5SEYJ6Sj/y/g2I2BvjNUJaPB4RiOtVj6aTIr+5f+RUF31
        Kuj+maeEmnFoJnYP6ExZWmmlyhqp
X-Google-Smtp-Source: APXvYqysngItRS1FqYy03V2HOEmOfNldWF3h6ESc+7r7ZhpX/1cNLwHnaq5EXzHupOLs5nKBHOYjkw==
X-Received: by 2002:a63:f14c:: with SMTP id o12mr9743254pgk.386.1570111034697;
        Thu, 03 Oct 2019 06:57:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v19sm3908528pff.46.2019.10.03.06.57.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 06:57:14 -0700 (PDT)
Subject: Re: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
To:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
References: <20191003124849.117888-1-martin@geanix.com>
 <20191003133351.118538-1-martin@geanix.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f85da76d-c67f-7393-acdd-169a75cd6de9@roeck-us.net>
Date:   Thu, 3 Oct 2019 06:57:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003133351.118538-1-martin@geanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/3/19 6:33 AM, Martin Hundebøll wrote:
> Linux should handle when the pcf2127 watchdog feature is enabled by the
> bootloader. This is done by checking the watchdog timer value during
> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Change since v1:
>   * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()
> 
>   drivers/rtc/rtc-pcf2127.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index cb3472f..4229915 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -420,6 +420,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>   			const char *name, bool has_nvmem)
>   {
>   	struct pcf2127 *pcf2127;
> +	u32 wdd_timeout;
>   	int ret = 0;
>   
>   	dev_dbg(dev, "%s\n", __func__);
> @@ -462,7 +463,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>   	/*
>   	 * Watchdog timer enabled and reset pin /RST activated when timed out.
>   	 * Select 1Hz clock source for watchdog timer.
> -	 * Timer is not started until WD_VAL is loaded with a valid value.
>   	 * Note: Countdown timer disabled and not available.
>   	 */
>   	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
> @@ -478,6 +478,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>   		return ret;
>   	}
>   
> +	/* Test if watchdog timer is started by bootloader */
> +	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
> +	if (ret) {
> +		dev_err(dev, "%s: watchdog value (wd_wal) failed\n", __func__);
> +		return ret;
> +	}
> +
> +	if (wdd_timeout)
> +		set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
> +
>   	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
>   	if (ret)
>   		return ret;
> 


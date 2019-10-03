Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F30A6C9F11
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 15:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbfJCNFd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 09:05:33 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44860 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbfJCNFd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 09:05:33 -0400
Received: by mail-pg1-f195.google.com with SMTP id i14so1727249pgt.11;
        Thu, 03 Oct 2019 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OlAw1tbVqVEirAGsH9xgjC3ixvqOYrwigpF4tTggCCI=;
        b=I9NLkO1S86gnxX/UdMiU1g+PlkFALrFLZ7JifluCvABzMljjz4i3xHKANlCJyJRUip
         SpremKh6Xao4WScrybaE/I+mfVZ8PWiAjG50wcXb3NCIEYbg3u4A3CjAbX1tnltC69T1
         cIMsCOa4ndPUuA/KkyAHWz6AbvR5bizAGRNVMd6Ct0wLfDaaQlZoQ+yzxYuhccFFcJ9W
         Rf6Z3yznV5tOyJ+v7cqH1Hq/MApJf75oT2ib2+iDoINh4pQ8rs0Q9gboKREl8NDhVwQc
         pxylAQzYJSslT+AW0mff6G9oY0W3HV+cA5x2543cNhcBH4JkEM2zQ228RCkIzw6PM1vf
         2wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OlAw1tbVqVEirAGsH9xgjC3ixvqOYrwigpF4tTggCCI=;
        b=jecurq0QYuzFYWW+amJKLxjvIv01PHNYQSwk20guLfx8K+Gi9DyAGp/dfGXIoMp0kd
         4vjPzDFFpNnNGR2QNlWlZIz83Q226O3zyQ2YkqT7qd6M7XdKC/wEAKXWLvWdIJ4SrZKK
         VfE84LpTDxBXYNFpBCqnMTPgWC/ddpDx3XjjUuQwz/HSegGH5vuQzng2wktMGAAAHsEv
         AJL/czsFcnLbjd01yILL2gNY2ZCSSsSOsdHSiRG/WuPUSynrrG0kvHjZFciKiooQH+y9
         BO/Yb2nrp13SflDTC5OzqD144GjKPAzGJjHUaPx3iO8Pfd+XuLAzv3cb8HFRa7bjVDiL
         5L5A==
X-Gm-Message-State: APjAAAX+bsqKm0GVrPSjGylipiiYNkWpKgmXc3296rFkIzKKxT1qoy+r
        xsS+bB7dGw0haDPl395LFghky53K
X-Google-Smtp-Source: APXvYqzS2b4eD4X6w6NBThfOhsi5AL4DqVU0ib7z/1YuHfl6TpeSHzUvW9kijGI46+k8/a+VIwe+FA==
X-Received: by 2002:a62:7911:: with SMTP id u17mr11323142pfc.162.1570107931990;
        Thu, 03 Oct 2019 06:05:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z5sm2782284pgi.19.2019.10.03.06.05.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 06:05:31 -0700 (PDT)
Subject: Re: [PATCH] rtc: pcf2127: handle boot-enabled watchdog feature
To:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
References: <20191003124849.117888-1-martin@geanix.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f2c95a88-b4e4-0c84-e06c-3aabc004fcb8@roeck-us.net>
Date:   Thu, 3 Oct 2019 06:05:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003124849.117888-1-martin@geanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/3/19 5:48 AM, Martin Hundebøll wrote:
> Linux should handle when the pcf2127 watchdog feature is enabled by the
> bootloader. This is done by checking the watchdog timer value during
> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> ---
>   drivers/rtc/rtc-pcf2127.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index cb3472f..0fd3f3e 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -290,6 +290,8 @@ static int pcf2127_wdt_active_ping(struct watchdog_device *wdd)
>   
>   static int pcf2127_wdt_start(struct watchdog_device *wdd)
>   {
> +	set_bit(WDOG_HW_RUNNING, &wdd->status);
> +

The start function should not set this bit.

Guenter

>   	return pcf2127_wdt_ping(wdd);
>   }
>   
> @@ -420,6 +422,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>   			const char *name, bool has_nvmem)
>   {
>   	struct pcf2127 *pcf2127;
> +	u32 wdd_timeout;
>   	int ret = 0;
>   
>   	dev_dbg(dev, "%s\n", __func__);
> @@ -462,7 +465,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>   	/*
>   	 * Watchdog timer enabled and reset pin /RST activated when timed out.
>   	 * Select 1Hz clock source for watchdog timer.
> -	 * Timer is not started until WD_VAL is loaded with a valid value.
>   	 * Note: Countdown timer disabled and not available.
>   	 */
>   	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
> @@ -478,6 +480,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
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


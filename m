Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7D719C474
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2020 16:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732006AbgDBOj6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Apr 2020 10:39:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35791 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgDBOj5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Apr 2020 10:39:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id a13so1855703pfa.2;
        Thu, 02 Apr 2020 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iBStpTqnLq83tdRxsCcG08HtlBz3MvCrC3OwLZuM250=;
        b=Iilhn4fFZS/tCzMj9J4qmn/6+xg+houCYBF0pehjSHOditnxMTeWjCOdtq1RESedVY
         jlPCWAhkbHck4sydbWlsfh++sVCP/DJfhjoMq5kO1oevwUSD3UIfKMREm+KzkBQlcco0
         en5czMPkUmzrg78VzEREOzWz7ABtUuhmGwySKmQYKgdlU579NjxW0cNy9uYkLQ9mBhod
         ds6U/8TnJFpL97IMSfvzX4OIY4V9RkZRtSVw2dqE5NH9YqSnD0tyu7+orPyzr55eYHby
         pT1JsHQqpIoMy24MymuwTivT+JyXVbddCxkK4kEvc5jQ4rBDtbXIeDiaI0dPtqxr9xnx
         qRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iBStpTqnLq83tdRxsCcG08HtlBz3MvCrC3OwLZuM250=;
        b=F6u9ZSBy9rhbrhcUecr4RCNOlHLLk41dLZH4satZr8W+wRDjoP/lfFIjtoyMYeQSmW
         e5K4V/LijRBZoAXnAMWg9Wnj+FpLm3Gst8J0gTGUB23jKFajch5a7zRg0AWRgxKcTWBt
         y+pIY/pS64KYGMgaS6K1M533mOgDNr/OlpG/x9ifzerDCMM9+TyDel2vmxRCHfeST2eS
         czaefNfC/BqjLgUtZh3lYoxA+zPgvleVvc9CMpa7HfS22aqQ7r8t36gV2vZN4jjHAl1S
         dobFBBW8P7isqtJx2Ql7GC1Ssr06pdNV0RYzApj/7hIrojrFRI6QlUNYxspkgM+gUi8l
         17dQ==
X-Gm-Message-State: AGi0Pua+d2ox4tt1Ev4otXaju2uWHJ2coY/pWCou7LZjjju83/ROz/I8
        mMPEwXgm1+lKezW4XvV76PKhkUt0
X-Google-Smtp-Source: APiQypI2HB3icThuUI8hHObPx2W2+f5STIKI9gr4F3wl6wEVAZq7BdYAsJ/OyWZZeLudwVHYLnIe2A==
X-Received: by 2002:a65:4b8d:: with SMTP id t13mr3515452pgq.243.1585838394093;
        Thu, 02 Apr 2020 07:39:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w138sm3942062pff.145.2020.04.02.07.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 07:39:53 -0700 (PDT)
Subject: Re: [PATCH][V2][next] rtc: ds1307: check for failed memory allocation
 on wdt
To:     Colin King <colin.king@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200402135201.548313-1-colin.king@canonical.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <15e369be-847a-f480-988d-7d119d1f5bf3@roeck-us.net>
Date:   Thu, 2 Apr 2020 07:39:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200402135201.548313-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 4/2/20 6:52 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a failed memory allocation will lead to a null pointer
> dereference on point wdt.  Fix this by checking for a failed allocation
> and adding error return handling to function ds1307_wdt_register.
> Also move the error exit label "exit" to allow a return statement to
> be removed.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: move error exit label and remove a return statement, thanks to 
>     Walter Harms for spotting this clean up.
> ---
>  drivers/rtc/rtc-ds1307.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index fad042118862..c058b02efb4d 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -1665,14 +1665,16 @@ static const struct watchdog_ops ds1388_wdt_ops = {
>  
>  };
>  
> -static void ds1307_wdt_register(struct ds1307 *ds1307)
> +static int ds1307_wdt_register(struct ds1307 *ds1307)

What exactly is the point of returning an error just to ignore it ?

Guenter

>  {
>  	struct watchdog_device	*wdt;
>  
>  	if (ds1307->type != ds_1388)
> -		return;
> +		return 0;
>  
>  	wdt = devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
>  
>  	wdt->info = &ds1388_wdt_info;
>  	wdt->ops = &ds1388_wdt_ops;
> @@ -1683,10 +1685,13 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
>  	watchdog_init_timeout(wdt, 0, ds1307->dev);
>  	watchdog_set_drvdata(wdt, ds1307);
>  	devm_watchdog_register_device(ds1307->dev, wdt);
> +
> +	return 0;
>  }
>  #else
> -static void ds1307_wdt_register(struct ds1307 *ds1307)
> +static int ds1307_wdt_register(struct ds1307 *ds1307)
>  {
> +	return 0;
>  }
>  #endif /* CONFIG_WATCHDOG_CORE */
>  
> @@ -1979,10 +1984,7 @@ static int ds1307_probe(struct i2c_client *client,
>  
>  	ds1307_hwmon_register(ds1307);
>  	ds1307_clks_register(ds1307);
> -	ds1307_wdt_register(ds1307);
> -
> -	return 0;
> -
> +	err = ds1307_wdt_register(ds1307);
>  exit:
>  	return err;
>  }
> 


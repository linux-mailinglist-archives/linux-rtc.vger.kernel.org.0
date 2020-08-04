Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67E223BDDF
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Aug 2020 18:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgHDQOR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Aug 2020 12:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgHDQOP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Aug 2020 12:14:15 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775EBC06174A;
        Tue,  4 Aug 2020 09:14:15 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 2so2429981pjx.5;
        Tue, 04 Aug 2020 09:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ltjQg+u1u8xIAVe5z5/Hc/GJycmmbK3klhiZeWvXte0=;
        b=QcQV0T+8L15uTZhpcLsxwSccol4NXCu14MBJUtV2FIzRxolKfHWEjIcDpSIilbUGqR
         TWz6VNOc2+ViKm4cMZA5uZYMSt3dkucCf+LkooofUxHMM2Y/rjnDa6xOsMPJ5hUVycsW
         6DIncTDlf0WvelP6n3bsWV+4K7wf9TNREPFjkEQgzNnnZ1h3chNs/9vt0t8a/JAzUEWt
         ZRYFE8jqYjEmk5+MYe07ZXUwgiDu2g+HFEtFCMnOEnD7eJ3Bm8a5rgijmQTiKvwBZz0K
         OSHU6WgM/6VQfZLWkS3jRD4iqHdLsa3waXYgFpxj3mb7HLtVqHxPTNXvAYKIgIz1XT+z
         lMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ltjQg+u1u8xIAVe5z5/Hc/GJycmmbK3klhiZeWvXte0=;
        b=UoklDViFht4S2+T4pPPyZ7ESSLmXRbJusSEX8ThwiurCyJBeId32Ht2fO1iK/eZ/6h
         QFytaBu9jlAFD/5wX1vX5dhKwLlcM2U4S5ucJgKQJyqZ0np65cTbMnCTaFNS/YTniYmp
         CATpsU/HT1CG3nf5swkBBShwQ08HAZVKURT48UrRqkB5mSN+BeKkTnr3OQks7pOySWqy
         jGIF6ydS6VX0EpkZYSTQVbukp3VrO9yZxFXKWXUyZPhfRPRsSOCYqFhq6wl0mxDQ9AMe
         2Zta3zVE22ZZ5nsj8R00cyJle6gGKYZKc9J/npsmUqPaQKY1f73mgKoV40w9wp7t8dUO
         W+Mg==
X-Gm-Message-State: AOAM531NiUKBuqGOxYA7RUyTPV5/JxtEdeJzPFKOhLvDFeJnz6aM7fqb
        STQCZgGCu+xTnR2pvvY8k4NzATKB
X-Google-Smtp-Source: ABdhPJyX+Lm5+hsczkeKgx3KL/fMXnTjjuTQJR2SFRECyZy9gZG2iZFJzy8F7BdzC3ydH7Q/wxjyoA==
X-Received: by 2002:a17:90a:eb17:: with SMTP id j23mr4948700pjz.151.1596557654652;
        Tue, 04 Aug 2020 09:14:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c10sm19945205pfc.62.2020.08.04.09.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2020 09:14:13 -0700 (PDT)
Subject: Re: [PATCH] RTC: Implement pretimeout watchdog for DS1307
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20200804051743.19115-1-mark.tomlinson@alliedtelesis.co.nz>
 <20200804152044.GB10725@piout.net>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <3bb0b209-8213-ce6e-b7ee-3393ca0bbdae@roeck-us.net>
Date:   Tue, 4 Aug 2020 09:14:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804152044.GB10725@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 8/4/20 8:20 AM, Alexandre Belloni wrote:
> Hi,
> 
> The subject prefix is not correct, it should be rtc: ds1307:
> 
> Also, shouldn't that kind of software timeout which doesn't actually
> depend on the hardware better be handled in the watchdog core? Then this
> will benefit all the watchdog and will certainly avoid a lot of code
> duplication.
> 

Good point. I absolutely agree. We'd have to hash out some details,
such as how and when to enable it, but this definitely belongs into
the watchdog core if it is considered useful.

On the other side, the softdog already implements this. Why not just
instantiate the softdog as second watchdog and use it for the purpose
of handling pretimeouts ?

Thanks,
Guenter

> On 04/08/2020 17:17:43+1200, Mark Tomlinson wrote:
>> If the hardware watchdog in the clock chip simply pulls the reset line
>> of the CPU, then there is no chance to write a stack trace to help
>> determine what may have been blocking the CPU.
>>
>> This patch adds a pretimeout to the watchdog, which, if enabled, sets
>> a timer to go off before the hardware watchdog kicks in, and calls
>> the standard pretimeout function, which can (for example) call panic.
>>
>> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
>> ---
>>  drivers/rtc/rtc-ds1307.c | 35 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
>> index 49702942bb08..647f8659d0bd 100644
>> --- a/drivers/rtc/rtc-ds1307.c
>> +++ b/drivers/rtc/rtc-ds1307.c
>> @@ -23,6 +23,7 @@
>>  #include <linux/clk-provider.h>
>>  #include <linux/regmap.h>
>>  #include <linux/watchdog.h>
>> +#include <linux/timer.h>
>>  
>>  /*
>>   * We can't determine type by probing, but if we expect pre-Linux code
>> @@ -174,6 +175,10 @@ struct ds1307 {
>>  #ifdef CONFIG_COMMON_CLK
>>  	struct clk_hw		clks[2];
>>  #endif
>> +#ifdef CONFIG_WATCHDOG_CORE
>> +	struct timer_list	soft_timer;
>> +	struct watchdog_device	*wdt;
>> +#endif
>>  };
>>  
>>  struct chip_desc {
>> @@ -863,12 +868,34 @@ static int m41txx_rtc_set_offset(struct device *dev, long offset)
>>  }
>>  
>>  #ifdef CONFIG_WATCHDOG_CORE
>> +static void ds1388_soft_wdt_expire(struct timer_list *soft_timer)
>> +{
>> +	struct ds1307 *ds1307 = container_of(soft_timer, struct ds1307, soft_timer);
>> +
>> +	watchdog_notify_pretimeout(ds1307->wdt);
>> +}
>> +
>> +static void ds1388_soft_timer_set(struct watchdog_device *wdt_dev)
>> +{
>> +	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>> +	int soft_timeout;
>> +
>> +	if (wdt_dev->pretimeout > 0) {
>> +		soft_timeout = wdt_dev->timeout - wdt_dev->pretimeout;
>> +		mod_timer(&ds1307->soft_timer, jiffies + soft_timeout * HZ);
>> +	} else {
>> +		del_timer(&ds1307->soft_timer);
>> +	}
>> +}
>> +
>>  static int ds1388_wdt_start(struct watchdog_device *wdt_dev)
>>  {
>>  	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>>  	u8 regs[2];
>>  	int ret;
>>  
>> +	ds1388_soft_timer_set(wdt_dev);
>> +
>>  	ret = regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
>>  				 DS1388_BIT_WF, 0);
>>  	if (ret)
>> @@ -900,6 +927,7 @@ static int ds1388_wdt_stop(struct watchdog_device *wdt_dev)
>>  {
>>  	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>>  
>> +	del_timer(&ds1307->soft_timer);
>>  	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
>>  				  DS1388_BIT_WDE | DS1388_BIT_RST, 0);
>>  }
>> @@ -909,6 +937,7 @@ static int ds1388_wdt_ping(struct watchdog_device *wdt_dev)
>>  	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>>  	u8 regs[2];
>>  
>> +	ds1388_soft_timer_set(wdt_dev);
>>  	return regmap_bulk_read(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
>>  				sizeof(regs));
>>  }
>> @@ -923,6 +952,7 @@ static int ds1388_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>  	regs[0] = 0;
>>  	regs[1] = bin2bcd(wdt_dev->timeout);
>>  
>> +	ds1388_soft_timer_set(wdt_dev);
>>  	return regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
>>  				 sizeof(regs));
>>  }
>> @@ -1652,7 +1682,8 @@ static void ds1307_clks_register(struct ds1307 *ds1307)
>>  
>>  #ifdef CONFIG_WATCHDOG_CORE
>>  static const struct watchdog_info ds1388_wdt_info = {
>> -	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
>> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
>> +		   WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
>>  	.identity = "DS1388 watchdog",
>>  };
>>  
>> @@ -1681,6 +1712,8 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
>>  	wdt->timeout = 99;
>>  	wdt->max_timeout = 99;
>>  	wdt->min_timeout = 1;
>> +	ds1307->wdt = wdt;
>> +	timer_setup(&ds1307->soft_timer, ds1388_soft_wdt_expire, 0);
>>  
>>  	watchdog_init_timeout(wdt, 0, ds1307->dev);
>>  	watchdog_set_drvdata(wdt, ds1307);
>> -- 
>> 2.28.0
>>
> 


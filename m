Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C111927A1B2
	for <lists+linux-rtc@lfdr.de>; Sun, 27 Sep 2020 17:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgI0Pyv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 27 Sep 2020 11:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgI0Pyv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 27 Sep 2020 11:54:51 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED77C0613CE;
        Sun, 27 Sep 2020 08:54:51 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id o20so1996622ook.1;
        Sun, 27 Sep 2020 08:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l43udJj6BMkh1bntbdah89/MCcdkDNQy9ZlcMtLP+/8=;
        b=LCVPlOE3jgZh5tMLZvnmvOL1VK1EwvbJpMSWgWgRUtsUrqOBPOq5ULHPi8jPYs5e9A
         e0j1WGxwR/5c8zhYfMZ8jZH12IPkTKerU8aUeflquWTtxNDv+u4y9TBDQB4qTG80CUlu
         H+NBl/UbP1usr+fcnPs4U8O2K2vKdI+q/3oy71TjJYUnganFDLJg+BbbGt5jP/Or6PWF
         x3naR+jdrJVEiOX1tGsqoRw6lyR2xyZL6MdM2WJRSbYqBTWJ6X3VLQwb6TOtjen03qKT
         lyDT1xfPWTG4ytMAltAI2tk8I44snwnj0b4AAh2jTeqCpyX8CgHChpvjYLa3M62EbTtJ
         m38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=l43udJj6BMkh1bntbdah89/MCcdkDNQy9ZlcMtLP+/8=;
        b=JAbxhq3yHVM2wrqwKZy5xHCMl9MOoyMMezDSTiVOui8RW7Z8U5CCuaCHMDZvQpqhi4
         h9iA8B0HcsJO5/IysK9YYdJDBE7CC1EboyIk5NLxXGOILpsdgJHOOXyDHWpAnw2xx8/R
         ovcv5zRKzpIe/laF0oJb3o33ewpSnwoYLqURpRAFWPoCTe+/kW3Q5zqOVrnkB2dhmuV2
         +yuxXUnJJKASOCY8cHK8a8O9/PhKZbKjkoNGWO/lRal91DYeo7zm5U9RTKZ/83kuUDJZ
         jcW9o0IfpYMpSU/TJd3WJrEiT/DzSD4+7y5sz6qzD6CdkF0tLvMbwJ5RyPxEJUlP46r2
         r9oA==
X-Gm-Message-State: AOAM530qQoKm+dmY3zB5EE8RWXgx65wGf/MbJSvVopkhcO2DvBP1IiNZ
        pt8kl5hexdgMyjg29ocPDtU=
X-Google-Smtp-Source: ABdhPJyB0p0OpuafGvBEWMUW5bpThggEEGNJc4mPPEieavIQRpDnhIo/QGZTQzdjiGd7aLZZqA4rxQ==
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr6917046oou.40.1601222090829;
        Sun, 27 Sep 2020 08:54:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e19sm2202879ote.37.2020.09.27.08.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2020 08:54:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/2] [RFC] rtc: pcf2127: only use watchdog when explicitly
 available
To:     Bruno Thomsen <bruno.thomsen@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-watchdog@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
 <20200924105256.18162-3-u.kleine-koenig@pengutronix.de>
 <CAH+2xPAVvMpTgT3W=0AsKy=9jkS8qd6eB65Qebw51YKRQshaGQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8f88f2a2-4a6d-021f-4404-f05518b0477d@roeck-us.net>
Date:   Sun, 27 Sep 2020 08:54:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAH+2xPAVvMpTgT3W=0AsKy=9jkS8qd6eB65Qebw51YKRQshaGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 9/27/20 1:09 AM, Bruno Thomsen wrote:
> Den tor. 24. sep. 2020 kl. 12.53 skrev Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de>:
>>
>> Most boards using the pcf2127 chip (in my bubble) don't make use of the
>> watchdog functionality and the respective output is not connected. The
>> effect on such a board is that there is a watchdog device provided that
>> doesn't work.
>>
>> So only register the watchdog if the device tree has a "has-watchdog"
>> property.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>>  drivers/rtc/rtc-pcf2127.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>> index 5b1f1949b5e5..8bd89d641578 100644
>> --- a/drivers/rtc/rtc-pcf2127.c
>> +++ b/drivers/rtc/rtc-pcf2127.c
>> @@ -340,7 +340,8 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
>>         u32 wdd_timeout;
>>         int ret;
>>
>> -       if (!IS_ENABLED(CONFIG_WATCHDOG))
>> +       if (!IS_ENABLED(CONFIG_WATCHDOG) ||
>> +           !device_property_read_bool(dev, "has-watchdog"))
>>                 return 0;
> 
> I don't think the compiler can remove the function if
> CONFIG_WATCHDOG is disabled due to the device tree
> value check. Maybe it can if split into 2 conditions.
> 

If the first part of the expression is always false, the second
part should not even be evaluated. Either case, the code now
hard depends on the compiler optimizing the code away.
It calls devm_watchdog_register_device() which doesn't exist
if CONFIG_WATCHDOG is not enabled. I didn't know that this is safe,
and I would personally not want to rely on it, but we live and
learn.

Guenter

> if (!IS_ENABLED(CONFIG_WATCHDOG))
>         return 0;
> if (!device_property_read_bool(dev, "has-watchdog"))
>         return 0;
> 
> /Bruno
> 
>>
>>         pcf2127->wdd.parent = dev;
>> --
>> 2.28.0
>>


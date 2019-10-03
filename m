Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21724C9FED
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 15:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbfJCN4V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 09:56:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36960 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbfJCN4V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 09:56:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id y5so1846199pfo.4;
        Thu, 03 Oct 2019 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6tTl1JPL+2aQivh7SAyn7sw+UKKk2D5PKHshtCoybjk=;
        b=Vd8Ed0TGADphFFBMVZqkHztkxmOu13TbATr1cld71dTqGrcRfTjgb4X+BSUqiUH3lt
         ionHy2bnlqljwpI57y07xEV3xhMHgX4HrB+mn1ewBOAg6I2i50FjSbquOCz+Jvvf+rIC
         Xdo2sOA7ugmDP/Zbqxtpjf5++PtquKSac+rAeQAAvo2iysqG43X77KjPbX3AYKe29kpU
         MZ7xGcH8lGrkr5KoLhEGZTxK7umRwyKlUQ2Lqr1O5MsDOw8gCDbThYA7kG1+3iA8JSsA
         O0zQNYkinIlnNqproY4+1GOI4Y2UawZV31erLLM2UApNBBRzg4L3sU44+JaYCbgE5qFA
         CnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6tTl1JPL+2aQivh7SAyn7sw+UKKk2D5PKHshtCoybjk=;
        b=EFAJ017cBmkGD82EGymXm/3We4NHmSNX8RHpO7joALBF//KTJCWEimS4GEu3kbOhTL
         GmXkVHv/xc2G9kCVp98t2q0fXs8Leyu9nAZAaknpeBjow0H95PlhQKHolB1kbRpddT6S
         QuWoRhaiS6UEeHmT5sjySUy1eeyIPlvOjLv2FBPAcmR7ZY7XXMgVZYWXJKHXlXoSfJR+
         p1UCc4neCwGXySY5QJh1LN647fRQxa8kLcaHam9vPZG7g+aZqJXitUQZDbtZu3DCOAIn
         7SUkhDHFR6kOrPExcRwhbKvkfaoHsnKtoLgUvKxbsovUJu+k6BY/7PHJTNpaj9Sr4ft7
         8Q1A==
X-Gm-Message-State: APjAAAVBBxUaJ4Dmy6mIowjKR3xVVg2y0LqgI0hcpdQ49QET0jop7qvE
        dS9tDzQltU8FnJ8CsLhxrXe3MX7R
X-Google-Smtp-Source: APXvYqymbhpgLqBDuyGW8Pb39HzNj6GteBFPDio4UXVeB8u9EnDFPMWVuam4kxIVU8k4udqOBfNeiQ==
X-Received: by 2002:a17:90a:bf0e:: with SMTP id c14mr10368485pjs.69.1570110980129;
        Thu, 03 Oct 2019 06:56:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 14sm4251956pfn.21.2019.10.03.06.56.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 06:56:19 -0700 (PDT)
Subject: Re: [PATCH] rtc: pcf2127: handle boot-enabled watchdog feature
To:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
References: <20191003124849.117888-1-martin@geanix.com>
 <f2c95a88-b4e4-0c84-e06c-3aabc004fcb8@roeck-us.net>
 <e06a5204-fb47-79d1-f848-f6d92684a9b1@geanix.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0c34943c-71be-d85f-a523-33a6636cf463@roeck-us.net>
Date:   Thu, 3 Oct 2019 06:56:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e06a5204-fb47-79d1-f848-f6d92684a9b1@geanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/3/19 6:27 AM, Martin Hundebøll wrote:
> On 10/3/19 3:05 PM, Guenter Roeck wrote:
>> On 10/3/19 5:48 AM, Martin Hundebøll wrote:
>>> Linux should handle when the pcf2127 watchdog feature is enabled by the
>>> bootloader. This is done by checking the watchdog timer value during
>>> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
>>>
>>> Signed-off-by: Martin Hundebøll <martin@geanix.com>
>>> ---
>>>   drivers/rtc/rtc-pcf2127.c | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>>> index cb3472f..0fd3f3e 100644
>>> --- a/drivers/rtc/rtc-pcf2127.c
>>> +++ b/drivers/rtc/rtc-pcf2127.c
>>> @@ -290,6 +290,8 @@ static int pcf2127_wdt_active_ping(struct watchdog_device *wdd)
>>>   static int pcf2127_wdt_start(struct watchdog_device *wdd)
>>>   {
>>> +    set_bit(WDOG_HW_RUNNING, &wdd->status);
>>> +
>>
>> The start function should not set this bit.
> 
> Okay, guess we should update other drivers to not do this as well:
> 
> dw_wdt.c
>   (sets the bit in dw_wdt_stop() )

This is correct as-is because the watchdog can not be stopped.

> gpio_wdt.c

Looks like it.

> imx2_wdt.c
> 
The background was that there is no stop function. But you
are correct, it is unnecessary, since the watchdog core will
set the bit if an attempt is made to stop the watchdog and
there is no stop function.

> mpc8xxx_wdt.c
> 
Same as above.

> rave-sp-wdt.c
> 
> sprd_wdt.c

Correct, not needed.

Patches welcome. And, I guess, we need to update the documentation
to clarify the use of this flag.

Thanks,
Guenter

> 
> // Martin
> 
>>
>> Guenter
>>
>>>       return pcf2127_wdt_ping(wdd);
>>>   }
>>> @@ -420,6 +422,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>>               const char *name, bool has_nvmem)
>>>   {
>>>       struct pcf2127 *pcf2127;
>>> +    u32 wdd_timeout;
>>>       int ret = 0;
>>>       dev_dbg(dev, "%s\n", __func__);
>>> @@ -462,7 +465,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>>       /*
>>>        * Watchdog timer enabled and reset pin /RST activated when timed out.
>>>        * Select 1Hz clock source for watchdog timer.
>>> -     * Timer is not started until WD_VAL is loaded with a valid value.
>>>        * Note: Countdown timer disabled and not available.
>>>        */
>>>       ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
>>> @@ -478,6 +480,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>>           return ret;
>>>       }
>>> +    /* Test if watchdog timer is started by bootloader */
>>> +    ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
>>> +    if (ret) {
>>> +        dev_err(dev, "%s: watchdog value (wd_wal) failed\n", __func__);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (wdd_timeout)
>>> +        set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
>>> +
>>>       ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
>>>       if (ret)
>>>           return ret;
>>>
>>
> 


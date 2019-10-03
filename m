Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBCA1C9F63
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 15:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730335AbfJCN1d (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 09:27:33 -0400
Received: from first.geanix.com ([116.203.34.67]:46910 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729153AbfJCN1d (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 3 Oct 2019 09:27:33 -0400
Received: from [172.20.21.148] (unknown [185.181.22.4])
        by first.geanix.com (Postfix) with ESMTPSA id 5C3DD50704;
        Thu,  3 Oct 2019 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1570109185; bh=O6ye/E5fGcgXqMvolfqyzzwufUZBhYZ+SfiMx3beL0s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ACTHvFG0Fom1bn7kwaWqradUZi1gJKUclrQQ/o4JmVAhOEYo7VfWpOZ1mP866Wfk6
         /OAS50SMq3Q+AAAO5sIWkJ4zW+pVR3XWWMEEPxulrDU9CtqShU5z4udocadofxDrlY
         KWr/1DrcBhVgxbsc1nZxicvOOIo2JbhJ6rUIVrwlIzHy205TOThq6eqV5l4VYtdD2D
         0wOUu7wKHPAEMEUX3jEJ2VSrG1IC8ywIXACOl3ikCxpoUggIqr6ZPeSXHVzQGq+GO0
         kX1SMjDzLmPIvJvkw+Lon0knLXD6SfP5eIHWZzMs9Me1jhPaKCXpIhzohBiUyv8TMb
         D98Zwv3mDMhWw==
Subject: Re: [PATCH] rtc: pcf2127: handle boot-enabled watchdog feature
To:     Guenter Roeck <linux@roeck-us.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
References: <20191003124849.117888-1-martin@geanix.com>
 <f2c95a88-b4e4-0c84-e06c-3aabc004fcb8@roeck-us.net>
From:   =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <e06a5204-fb47-79d1-f848-f6d92684a9b1@geanix.com>
Date:   Thu, 3 Oct 2019 15:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <f2c95a88-b4e4-0c84-e06c-3aabc004fcb8@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: da-DK
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=disabled
        version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b8b5098bc1bc
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/3/19 3:05 PM, Guenter Roeck wrote:
> On 10/3/19 5:48 AM, Martin Hundebøll wrote:
>> Linux should handle when the pcf2127 watchdog feature is enabled by the
>> bootloader. This is done by checking the watchdog timer value during
>> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
>>
>> Signed-off-by: Martin Hundebøll <martin@geanix.com>
>> ---
>>   drivers/rtc/rtc-pcf2127.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>> index cb3472f..0fd3f3e 100644
>> --- a/drivers/rtc/rtc-pcf2127.c
>> +++ b/drivers/rtc/rtc-pcf2127.c
>> @@ -290,6 +290,8 @@ static int pcf2127_wdt_active_ping(struct 
>> watchdog_device *wdd)
>>   static int pcf2127_wdt_start(struct watchdog_device *wdd)
>>   {
>> +    set_bit(WDOG_HW_RUNNING, &wdd->status);
>> +
> 
> The start function should not set this bit.

Okay, guess we should update other drivers to not do this as well:

dw_wdt.c
  (sets the bit in dw_wdt_stop() )
gpio_wdt.c
imx2_wdt.c

mpc8xxx_wdt.c

rave-sp-wdt.c

sprd_wdt.c

// Martin

> 
> Guenter
> 
>>       return pcf2127_wdt_ping(wdd);
>>   }
>> @@ -420,6 +422,7 @@ static int pcf2127_probe(struct device *dev, 
>> struct regmap *regmap,
>>               const char *name, bool has_nvmem)
>>   {
>>       struct pcf2127 *pcf2127;
>> +    u32 wdd_timeout;
>>       int ret = 0;
>>       dev_dbg(dev, "%s\n", __func__);
>> @@ -462,7 +465,6 @@ static int pcf2127_probe(struct device *dev, 
>> struct regmap *regmap,
>>       /*
>>        * Watchdog timer enabled and reset pin /RST activated when 
>> timed out.
>>        * Select 1Hz clock source for watchdog timer.
>> -     * Timer is not started until WD_VAL is loaded with a valid value.
>>        * Note: Countdown timer disabled and not available.
>>        */
>>       ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
>> @@ -478,6 +480,16 @@ static int pcf2127_probe(struct device *dev, 
>> struct regmap *regmap,
>>           return ret;
>>       }
>> +    /* Test if watchdog timer is started by bootloader */
>> +    ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, 
>> &wdd_timeout);
>> +    if (ret) {
>> +        dev_err(dev, "%s: watchdog value (wd_wal) failed\n", __func__);
>> +        return ret;
>> +    }
>> +
>> +    if (wdd_timeout)
>> +        set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
>> +
>>       ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
>>       if (ret)
>>           return ret;
>>
> 

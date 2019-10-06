Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1358FCD242
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Oct 2019 16:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfJFO3t (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Oct 2019 10:29:49 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42656 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbfJFO3t (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Oct 2019 10:29:49 -0400
Received: by mail-pf1-f196.google.com with SMTP id q12so6960319pff.9;
        Sun, 06 Oct 2019 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e2PvVQWXeeJvUoDlLq/SR4VjGXnDfbPSvMXYVPkIUOE=;
        b=F54QHf6vFQkX5AKSoQWu12ikp7hS+PwlL3WfDIMyndTZI7zuhYhlvW8HWkU3ok1qIp
         qym7OjytMxdbq31th+Y5XF7nh937HU/ikw+xyKRzjwAFrmbG8tbUQOBWQeYYVzqd/fWJ
         IFKCJJtu75Ei20q2nXoDu+9BotAo+dngJhC4QzPb5wiL84kRJ/MnQraOFcwF9OWWZlDO
         DSOs8+V8KMJcRAsWvtbkHiebmM/ayK2kvEen13dhQW0JmvAMnhbVD0Pj5pyel/DBXqRD
         /PPMtAfi7uhDYWzujRRWQigazDRmW4q0mywRliIo9HBs0e00HF2nM4uiJdx8/Wd5OcvX
         +O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e2PvVQWXeeJvUoDlLq/SR4VjGXnDfbPSvMXYVPkIUOE=;
        b=neWcHK2eJukw+/RFaFRfLgsLivmTHJhChWUK+XpEvO2FbBnFHFodO+0jQlQ6GCZ94F
         zfnlarLu5iua+9Ju/oNPTcbPOfN73zOV+Al8ve1WN5nvQtFVkRhQyjc6H8CwKghsHTJg
         JVFFC9i2JBFxHvKCVOhpduDSlEO790IntdwMLXKsrjRc1OBol7Cy7qr0Q/uBC5bdQGY7
         /o1uxVD0pqZNXx9V+/VD2yV+SLsBkjV0LPai8Ansk3Zn9+rTE8bCuF5XfASBU6RmHa+Y
         I5rJl2vS7NVfHKuC8ssjnaYm7Q+cYm+/8/VezVI+yTcA7NDd2Dq7ru5+rVz4Ue/eE005
         TZTQ==
X-Gm-Message-State: APjAAAXkLHvlmffv8dWsBPWVsRGxoGpvxOktK02YPBxCsWBNE07tK67B
        FZJVGrq1PwWS7i4MpppHR8ppbVCA
X-Google-Smtp-Source: APXvYqwf7gihMXxmnlLjPRFFxG9NQVGHtGrMFvFpABvUqdjQzEZqe4ZlhMbkl397aITgkXMzpOIMoQ==
X-Received: by 2002:a63:4754:: with SMTP id w20mr12311058pgk.134.1570372188003;
        Sun, 06 Oct 2019 07:29:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z21sm11307466pfa.119.2019.10.06.07.29.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Oct 2019 07:29:46 -0700 (PDT)
Subject: Re: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
To:     Bruno Thomsen <bruno.thomsen@gmail.com>,
        =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20191003124849.117888-1-martin@geanix.com>
 <20191003133351.118538-1-martin@geanix.com>
 <CAH+2xPAtxcxd1xXuCmHc25X-Ai2_w-5rxZrgYbavjAzntMxX-Q@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f741d1bd-bcde-d1e1-09b7-98bb6a30db33@roeck-us.net>
Date:   Sun, 6 Oct 2019 07:29:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH+2xPAtxcxd1xXuCmHc25X-Ai2_w-5rxZrgYbavjAzntMxX-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/6/19 2:07 AM, Bruno Thomsen wrote:
> Hi Martin,
> 
> Den tor. 3. okt. 2019 kl. 15.33 skrev Martin Hundebøll <martin@geanix.com>:
>>
>> Linux should handle when the pcf2127 watchdog feature is enabled by the
>> bootloader. This is done by checking the watchdog timer value during
>> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
>>
>> Signed-off-by: Martin Hundebøll <martin@geanix.com>
>> ---
>>
>> Change since v1:
>>   * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()
>>
>>   drivers/rtc/rtc-pcf2127.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>> index cb3472f..4229915 100644
>> --- a/drivers/rtc/rtc-pcf2127.c
>> +++ b/drivers/rtc/rtc-pcf2127.c
>> @@ -420,6 +420,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>                          const char *name, bool has_nvmem)
>>   {
>>          struct pcf2127 *pcf2127;
>> +       u32 wdd_timeout;
>>          int ret = 0;
>>
>>          dev_dbg(dev, "%s\n", __func__);
>> @@ -462,7 +463,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>          /*
>>           * Watchdog timer enabled and reset pin /RST activated when timed out.
>>           * Select 1Hz clock source for watchdog timer.
>> -        * Timer is not started until WD_VAL is loaded with a valid value.
> 
> Your patch does not change the fact that the watchdog timer is first
> started after loading a
> valid value into WD_VAL register. This driver can be used perfectly
> fine without enabling the
> watchdog feature from userspace. If someone chooses to reboot without
> stopping the watchdog
> it is of course expected to still run on next boot (e.g. device probe).
> 
>> +       /* Test if watchdog timer is started by bootloader */
>> +       ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
>> +       if (ret) {
>> +               dev_err(dev, "%s: watchdog value (wd_wal) failed\n", __func__);
>> +               return ret;
>> +       }
>> +
>> +       if (wdd_timeout)
>> +               set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
>> +
> 
> I do not agree that this should be the default setting as
> WDOG_HW_RUNNING bit causes
> watchdog core to kick watchdog until userland takes over, e.g. you
> have just broken the
> chain-of-monitoring in the embedded Linux device:
> 
> Hardware watchdog -> systemd -> daemon(s) / application(s)
> 
> At this point in time you only know that u-boot / barebox can load and
> start the kernel with
> a device tree blob.
> 
> What if mounting of rootfs fails?
> What if systemd fails to start?
> 
> When doing a reboot due to ex. firmware upgrade, systemd will keep
> kicking the watchdog
> until the last sec before restart handler is called and the hardware
> watchdog should not be
> touched before systemd is in control of the system again.
> 
 > Bruno
 >

This should not be decided on driver level. The intended means to enforce
an initial timeout would be to set CONFIG_WATCHDOG_OPEN_TIMEOUT, or to use
the open_timeout kernel parameter.

Guenter
